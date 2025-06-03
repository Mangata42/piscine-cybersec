/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   options.cpp                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/28 16:13:45 by nghaddar          #+#    #+#             */
/*   Updated: 2025/05/28 17:35:37 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/ft_otp.h"

void	print_usage()
{
	std::cout << "usage: ./totp [-g key.hex] [-k ft_otp.key]\n";
	std::cout << "\t -g: Encrypt a key. Pass a file containing at least 64 characters hexadecimal phrase.\n";
	std::cout << "\t -k: Generates a code. Pass it a .key file\n";
}

std::map<char, std::pair<bool, std::string> > parse_options(char **argv)
{
	std::map<char, std::pair<bool, std::string> > options = {{'g', {false, ""}}, {'k', {false, ""}}};
	int i = 1;

	while (argv[i] != 0)
	{
		if (std::string(argv[i]) == "-g")
		{ 
			options['g'].first = true;
			if (argv[i + 1]){
				options['g'].second = std::string(argv[i + 1]);
				i++;
			}
		}

		else if (std::string(argv[i]) == "-k")
		{ 
			options['k'].first = true;
			if (argv[i + 1]){
				options['k'].second = std::string(argv[i + 1]);
				i++;
			}
		}

		else
			throw(std::invalid_argument(std::string("invalid argument: ") + argv[i]));
		
		++i;
	}

	return (options);
}

bool	verif_options(std::map<char, std::pair<bool, std::string> > &options)
{
	if (options['g'].first == true && options['g'].second.size() <= 0)
		return (false);

	if (options['k'].first == true && options['k'].second.size() <= 0)
		return (false);

	return (true);
}