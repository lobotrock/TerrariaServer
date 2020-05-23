import requests
import shutil
import os
from os import path
from bs4 import BeautifulSoup
from zipfile import ZipFile

TERRARIA_HOME_PAGE = "https://www.terraria.org"
LINK_TEXT = "PC Dedicated Server"
OUTPUT_DIRECTORY = "/output"
OUTPUT_ZIP = 'terraria-server.zip'


def retry_get(url, retry_number=3):
    try_number = 0
    response = requests.get(url)
    while response.status_code != 200 and try_number >= retry_number:
        response = requests.get(url)
        try_number = try_number + 1
    return response


def find_server_link(soup):
    return next((f"{TERRARIA_HOME_PAGE}{a['href']}" for a in soup.findAll('a') if a.text == LINK_TEXT), None)


def download_url(url, output):
    with open(output, 'wb') as f:
        f.write(retry_get(url).content)


def unzip_resources(zipped_file):
    with ZipFile(zipped_file, 'r') as zipped_object:
        files = zipped_object.namelist()

        for file in files:
            if '/Linux/' in file:
                version_dir = file[:file.index('/Linux/')]
                zipped_object.extract(file)

        # Move the Linux directory to the root
        shutil.move(path.join(version_dir, 'Linux'), path.join(OUTPUT_DIRECTORY, 'Linux'))
        shutil.rmtree(version_dir)


if __name__ == '__main__':
    # Load Terraria Home Page
    home_page_response = retry_get(TERRARIA_HOME_PAGE)
    # Parse Page Contents
    download_link = find_server_link(BeautifulSoup(home_page_response.text, features='html.parser'))
    # Download the latest server
    print(f'Downloading {download_link}')
    zip_destination = path.join(OUTPUT_DIRECTORY, OUTPUT_ZIP)
    download_url(download_link, zip_destination)
    # Unzipping the resources
    unzip_resources(zip_destination)
    # Cleanup zip
    os.remove(zip_destination)
