/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_otp.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/28 16:14:20 by nghaddar          #+#    #+#             */
/*   Updated: 2025/09/15 15:19:11 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

#include <iostream>
#include <vector>
#include <fstream>
#include <filesystem>
#include <cmath>
#include <string>
#include <map>
#include <algorithm>
#include <openssl/sha.h>
#include <cstdlib>
#include <exception>
#include <time.h>

void											print_usage();
std::map<char, std::pair<bool, std::string> >	parse_options(char **argv);
bool											verif_options(std::map<char, std::pair<bool, std::string> > &options);
void											encrypt_key(std::string filename);