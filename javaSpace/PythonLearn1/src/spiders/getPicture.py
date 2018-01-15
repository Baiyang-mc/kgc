#coding=utf-8
import re
import urllib.request

def getHtml(url):
    page = urllib.request.urlopen(url)
    html = page.read()
    #print(type(html))
    html = html.decode('UTF-8')
    #print(html)
    return html

def getImg(html):
    reg = r'img class="BDE_Image" src="(.+?\.jpg)"';
    imgre = re.compile(reg);
    #print(type(imgre))
    #print(imgre)
    imglist = re.findall(imgre,html);
    #print(type(imglist))
    #print(imglist)
    num = 0;
    for imgurl in imglist:
        urllib.request.urlretrieve(imgurl,'F:\Picture\hardaway%s.jpg' %num);
        num+=1;
    print(num);
html = getHtml("http://www.qyl066.com/guochan/");
#http://www.qyl066.com/guochan/
#html = getHtml("https://tieba.baidu.com/p/1569069059?red_tag=1110933621");
getImg(html);