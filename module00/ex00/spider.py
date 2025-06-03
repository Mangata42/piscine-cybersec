# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    spider.py                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nghaddar <nghaddar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/14 15:51:36 by nghaddar          #+#    #+#              #
#    Updated: 2025/05/21 12:56:39 by nghaddar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

import sys
import random
import requests
import os
from bs4 import BeautifulSoup
from urllib.parse import urlparse, urljoin

URL = str();
VALID_EXTENSIONS = ["png", "jpg", "jpeg", "bmp", "gif"]
DEPTH_LEVEL = 0
PATH = "./data/"

options = {
            'recursive': False,
            'depth-level': False,
            'path': False,
    };
visited_links = []
downloaded_img = []

def get_link_list(content, base_url):
    link_list = []
    netloc = urlparse(base_url).netloc;

    for link in content.find_all('a'):
        href = link.attrs.get('href')
        if href:
            full_url = urljoin(base_url, href)
            if full_url not in visited_links:
                if (urlparse(full_url).netloc == netloc):
                    link_list.append(full_url)
    
    return link_list

def get_img_list(content, base_url):
    img_list = []

    for img in content.find_all('img'):
        src = img.attrs.get('src')
        if src:
            img_url = urljoin(base_url, src)
            path = urlparse(img_url).path
            _, ext = os.path.splitext(path)
            
            if ext:
                ext = ext[1:].lower()
                
                if ext in VALID_EXTENSIONS:
                    img_list.append((img_url, ext))
                    
    
    return img_list

def spider(url, current_depth):
    if current_depth > DEPTH_LEVEL or url in visited_links:
        return

    print(f"Visiting URL: {url} - current depth: {current_depth}")
    visited_links.append(url)
    
    try:
        response = requests.get(url, timeout=10)
        if response.status_code != 200:
            return
            
        content = BeautifulSoup(response.content, "html.parser")
        link_list = get_link_list(content, url)
        img_list = get_img_list(content, url)
        
        for img_url, ext in img_list:
            if img_url not in downloaded_img:
                downloaded_img.append(img_url)
                download_image(img_url, ext)
        
        if current_depth < DEPTH_LEVEL:
            for link in link_list:
                spider(link, current_depth + 1)
                
    except requests.RequestException as e:
        print(f"Request error at:  {url}: {e}")

def download_image(img_url, ext):
    print(f"Downloading image: {img_url}")
    try:
        response = requests.get(img_url, timeout=10)
        if response.status_code == 200:
            filename = f"{PATH}{random.randint(0, sys.maxsize)}.{ext}"
            with open(filename, "wb") as file:
                file.write(response.content)
                print(f"Image saved as: {filename}")
    except requests.exceptions.RequestException as e:
        print(f"Error while downloading image: {img_url}: {e}")

def print_help():
        print("usage: spider.py [-rlp] URL")
        print("\t -r : recursively download images")
        print("\t -l : level. Default = 5")
        print("\t -p : path to store data. Default = ./data")

def parse_options():
    global PATH, DEPTH_LEVEL, URL
    i = 1;

    while i < len(sys.argv):
        if (sys.argv[i] == '-r'):
            options['recursive'] = True;
            DEPTH_LEVEL = 5;
            i += 1;
        
        elif (sys.argv[i] == '-p'):
            options['path'] = True;
            if (i + 1) < len(sys.argv):
                PATH = sys.argv[i + 1];
            else:
                print("Error: need to supply path!");
                return (1);
            i += 2;
        
        elif (sys.argv[i] == "-l"):
            options["depth-level"] = True;
            if (i + 1) < len(sys.argv):
                DEPTH_LEVEL = sys.argv[i + 1];
            else:
                print("Error: need to supply depth level!");
                exit(1);
            i += 2;
        
        else:
            URL = sys.argv[i];
            return ;    

def verif_options():
    global PATH, DEPTH_LEVEL, URL
    if (options["depth-level"] and not options["recursive"]):
            print("Error: need to set recursive mode to define depth level");
            exit(1)

    try:
        DEPTH_LEVEL = int(DEPTH_LEVEL);
        if (DEPTH_LEVEL < 0 or DEPTH_LEVEL > 20):
            print("Error: depth level must be a number between 0 and 20")
    except:
        print("Error: depth level must be a number between 0 and 20")
        exit(1);

    if (os.path.isdir(PATH) == False):
        try:
            os.makedirs(PATH);
        except:
            print(f"Error: cannot create folder {PATH}")
            exit(1);
    
    if "/" not in PATH:
        PATH += "/"
        
    parsed_url = urlparse(URL);
    if (parsed_url.scheme == ''):
        URL = "https://" + URL;

def main():
    random.seed(None)
    
    if (len(sys.argv) <= 1):
        print_help();
        return (1);

    parse_options();
    verif_options();

    spider(URL, 0)
    print(f"\nDone")
    print(f"Visited URLs: {len(visited_links)}")
    print(f"Found images: {len(downloaded_img)}")

if __name__ == "__main__":
    main()