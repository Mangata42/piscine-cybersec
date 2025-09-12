/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   source.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/08 12:39:54 by nghaddar          #+#    #+#             */
/*   Updated: 2025/07/08 12:44:07 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

int		main()
{
	char password[] = "__stack_check";
	char user_input[128];

	printf("Please enter key: ");
	scanf("%s", user_input);

	if (!strcmp(user_input, password))
		printf("Good job.\n");
	else
		printf("Nope.\n");

	return (0);
}