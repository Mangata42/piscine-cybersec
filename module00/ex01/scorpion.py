# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    scorpion.py                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/21 12:45:36 by nghaddar          #+#    #+#              #
#    Updated: 2025/05/21 13:17:29 by nghaddar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

import sys
import os
from PIL import Image
from PIL.ExifTags import TAGS

def main():
	if (len(sys.argv) <= 1):
		print("usage: scorpion.py (img)[img2 img3...]");
		return (1);

	i = 1;
	while i < len(sys.argv):
		try:
			image = Image.open(sys.argv[i]);
		except Exception as e:
			print("Error: cannot open image file -> ", e);

		exifdata = image.getexif();
		
		if (len(exifdata) <= 0):
			print(f"\nNo EXIF data found for image {image.filename}");
		else:
			print(f"\nImage: {image.filename}");
			for tagid in exifdata:
				tagname = TAGS.get(tagid, tagid);
				value = exifdata.get(tagid);
				print(f"\t{tagname:30}: {value}");
		i += 1;

if __name__ == "__main__":
	main();