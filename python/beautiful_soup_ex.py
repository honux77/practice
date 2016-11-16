import urllib.request
from bs4 import BeautifulSoup

class AppURLopener(urllib.request.FancyURLopener):
    version = "Mozilla/5.0"

opener = AppURLopener()
response = opener.open('https://medium.com/@codesquad_yoda/latest')
html = response.read();
soup = BeautifulSoup(html, 'html.parser')

# print(soup.prettify())
# body = soup.findAll('div', attrs={'class': 'section-inner'})
parent_body = soup.findAll('div', attrs={'class': 'layoutSingleColumn'})

for article in parent_body: # body -> parent_body
    # print(article)
    sub = article.find('p').text
    title = article.find('h3')
    link = article.find('a').get('href')
    
    if title is None:
        title = sub
    else:
        title = title.text
    
    print("title: "+title)
    print("link: "+link)
    print("sub: " + sub)
