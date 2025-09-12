/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   decrypt.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/09/10 12:10:35 by nghaddar          #+#    #+#             */
/*   Updated: 2025/09/12 11:58:47 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "stockholm.h"

extern unsigned char SILENT_FLAG;
extern unsigned char *key;

void	decrypt_file(char *filename)
{
	FILE 			*in = NULL, *out = NULL;
	EVP_CIPHER_CTX	*ctx = NULL;
	char 			*old_filename = NULL;
	unsigned char 	iv[16];
	unsigned char 	inbuf[1024];
	unsigned char 	outbuf[1024 + 16];
	int 			inlen = 0, outlen = 0;

	if ((strcmp(strrchr(filename, '.'), ".ft")) != 0) // check if file extension is .ft
		return ;

	old_filename = malloc(strlen(filename) - 2);
	old_filename = strncpy(old_filename, filename, strlen(filename) - 3);
	in = fopen(filename, "rb");
	out = fopen(old_filename, "wb");
	if (!in || !out)
	{
		perror(ANSI_RED "ERROR:");
		exit(1);
	}
	
	fread(iv, 16, 1, in);
	ctx = EVP_CIPHER_CTX_new();
	EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv);
	while ((inlen = fread(inbuf, 1, 1024, in)) != 0)
	{
		EVP_DecryptUpdate(ctx, outbuf, &outlen, inbuf, inlen);
		fwrite(outbuf, 1, outlen, out);
	}

	EVP_DecryptFinal_ex(ctx, outbuf, &outlen);
	fwrite(outbuf, 1, outlen, out);

	if (!SILENT_FLAG) printf(ANSI_GREEN "FILE: \"%s\" DECRYPTED!\n" ANSI_CYAN, filename);
	remove(filename); // delete encrypted file
	EVP_CIPHER_CTX_free(ctx);
	fclose(in);
	fclose(out);
	if (SLOW_MODE) usleep(SLOW_MODE_DELAY * 1000);
}