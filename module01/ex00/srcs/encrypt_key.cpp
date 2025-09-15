/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   encrypt_key.cpp                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/28 16:21:20 by nghaddar          #+#    #+#             */
/*   Updated: 2025/09/15 15:23:35 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/ft_otp.h"

void	verif_key(std::string &buffer)
{	
	if (buffer.size() < 64 || buffer.size() > 150)
		throw(std::invalid_argument("Error: key should be between 64 and 150 characters in hexadecimal"));
	
	if (buffer.size() % 2)
		throw(std::invalid_argument("Error: invalid hexadecimal key"));
		
	for (size_t i = 0; i < buffer.size(); i++)
	{

		if (!((buffer[i] >= '0' && buffer[i] <= '9') || 
			  (buffer[i] >= 'A' && buffer[i] <= 'F') || 
			  (buffer[i] >= 'a' && buffer[i] <= 'f')))
			throw(std::runtime_error("Error: key should be between 64 and 150 characters in hexadecimal"));
	}
}

std::vector<unsigned char>	prepare_key(std::string &buffer)
{
	std::vector<unsigned char> 	bytes_buffer;
	unsigned char				byte;
	
	for (char &c : buffer)
		c = std::tolower(c);
	
	size_t i = 0;
	while (i < buffer.size())
	{
		byte = 0;
		if (buffer[i] >= '0' && buffer[i] <= '9')
			byte |= ((buffer[i] - '0') << 4);
		if (buffer[i] >= 'a' && buffer[i] <= 'f')
			byte |= ((buffer[i] - 'a' + 10) << 4);
		if (buffer[i + 1] >= '0' && buffer[i + 1] <= '9')
			byte |= (buffer[i + 1] - '0');
		if (buffer[i + 1] >= 'a' && buffer[i + 1] <= 'f')
			byte |= (buffer[i + 1] - 'a' + 10);
		
		bytes_buffer.push_back(byte);
		i += 2;
	}

	return (bytes_buffer);
}

void	encrypt_key(std::string filename)
{
	std::ifstream infile;
	std::ofstream outfile;
	std::string buffer;
	std::vector<unsigned char> bytes_buffer;

	if (!std::filesystem::exists(filename))
		throw(std::invalid_argument("Error: file does not exist"));

	infile.open(filename, std::ios::binary);
	std::getline(infile, buffer);
	verif_key(buffer);
	bytes_buffer = prepare_key(buffer);

	outfile.open("../keys/ft_otp.key", std::ios::binary);
	outfile.write(reinterpret_cast<char *>(bytes_buffer.data()), bytes_buffer.size());
	std::cout << "Key has been successfully saved to keys/ft_otp.key\n";
}