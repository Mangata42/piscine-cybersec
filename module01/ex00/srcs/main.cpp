/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/27 16:57:46 by nghaddar          #+#    #+#             */
/*   Updated: 2025/06/03 12:25:07 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/ft_otp.h"

void	internal(std::vector<unsigned char> prepared_key, long timestamp, unsigned char *internal_hash)
{
	std::vector<unsigned char> result;

	for (int i = 0; i < 64; i++)
		result.push_back(prepared_key[i] ^ 0x36);
	
	for (int i = 7; i >= 0; i--)
		result.push_back((timestamp >> (8 * i)) & 0xFF);

	SHA1(result.data(), result.size(), internal_hash);
}

void	external(std::vector<unsigned char> prepared_key, unsigned char *internal_hash, unsigned char *external_hash)
{
	std::vector<unsigned char> result;

	for (int i = 0; i < 64; i++)
		result.push_back(prepared_key[i] ^ 0x5C);

	for (int i = 0; i < 20; i++)
		result.push_back(internal_hash[i]);
	
	SHA1(result.data(), result.size(), external_hash);
}

void	hmac(std::string &keyfilename)
{
	std::ifstream 				infile;
	std::vector<unsigned char> 	prepared_key;
	unsigned char				internal_hash[20];
	unsigned char				external_hash[20];
	long						timestamp;
	int							offset;
	uint32_t					code;
	int							final_code;

	if (!std::filesystem::exists(keyfilename))
		throw(std::invalid_argument("Error: file does not exist"));
	
	infile.open(keyfilename, std::ios::binary);
	
	infile.seekg(0, std::ios::end);
	size_t file_size = infile.tellg();
	infile.seekg(0, std::ios::beg);
	
	std::vector<unsigned char> key_data(file_size);
	infile.read(reinterpret_cast<char*>(key_data.data()), file_size);
	infile.close();
	
	prepared_key = key_data;
	
	if (prepared_key.size() > 64) {
		unsigned char hashed_key[20];
		SHA1(prepared_key.data(), prepared_key.size(), hashed_key);
		prepared_key.clear();
		for (int i = 0; i < 20; i++)
			prepared_key.push_back(hashed_key[i]);
	}
	
	while (prepared_key.size() < 64)
		prepared_key.push_back(0x00);

	timestamp = std::floor(time(NULL) / 30);
	internal(prepared_key, timestamp, internal_hash);
	external(prepared_key, internal_hash, external_hash);

	offset = external_hash[19] & 0x0F; //get last 4 bits
	code = (external_hash[offset] << 24) | (external_hash[offset + 1] << 16) |
			(external_hash[offset + 2] << 8) | (external_hash[offset + 3]); //build code in binaries with offset
	code &= 0x7FFFFFFF; //sign bit to 0 to avoid negative numbers
	final_code = code % 1000000;
	std::cout << std::setfill('0') << std::setw(6) << final_code << std::endl;
} 

int		main(int argc, char **argv)
{	
	std::map<char, std::pair<bool, std::string> > options;

	if (argc <= 1){
		print_usage();
		return (0);
	}

	try { 	options = parse_options(argv); }
	catch (std::invalid_argument &e) { std::cerr << e.what() << std::endl; return (1); }

	if (!verif_options(options))
	{
		print_usage();
		return (1);
	}
	
	if (options['g'].first)
	{
		try{ encrypt_key(options['g'].second); }
		catch(std::exception &e){ 
			std::cerr << e.what() << std::endl; 
			return (1);
		}
	}

	if (options['k'].first)
	{
		try{ hmac(options['k'].second); }
		catch(std::exception &e){ 
			std::cerr << e.what() << std::endl; 
			return (1);
		}
	}

	return (0);
}