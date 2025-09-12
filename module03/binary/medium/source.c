/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   code.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/21 14:23:37 by nghaddar          #+#    #+#             */
/*   Updated: 2025/07/24 13:00:12 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void	no()
{
	puts("Nope.");
	exit(1);
}

void	ok()
{
	puts("Good job.");
	exit(0);
}

int		main(void)
{
	char user_prompt[24];
	char output[9];

	printf("Please enter key: ");
	if (scanf("%23s", user_prompt) != 1)
		no();

	if (user_prompt[0] != '0' && user_prompt[1] != '0')
		no();
	
	fflush(stdout);
	memset(output, 0, 9);
	output[0] = 'd';
	int i = 2; // ebp - 20
	int y = 1; //ebp - 16

	while (strlen(output) < 8 && i < strlen(user_prompt))
	{
		char tmp[4] = {0};
		char r;
		tmp[0] = user_prompt[i];
		tmp[1] = user_prompt[i + 1];
		tmp[2] = user_prompt[i + 2];
		r = atoi(tmp);
		output[y] = r;
		i = i + 3;
		y = y + 1;
	} 

	output[y] = 0;

	if (!(strcmp(output, "delabere")))
		ok();
	else
		no();

	return (0);
}

// Program reserves 84 bytes for data
// Base address is at [ebp - 64]
// User input is stored at [ebp - 53] for probably 24 bytes (because of the scanf flag %23s) so to [ebp - 29]
// memset is then called at [ebp - 29] and 9 bytes are set at 0
// one int = 2 at ebp - 20
// one int = 1 at ebp - 16
// boolean variable at [ebp - 65] set to false right after first strlen ? 
// [ebp - 57] could be an result output buffer of 3 bytes ? 

// mdp is : 00101108097098101114101 (which is 'elabere' in ascii)