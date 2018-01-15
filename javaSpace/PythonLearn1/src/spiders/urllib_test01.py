'''
Created on 2018年1月12日

@author: baiya
'''
# -*- coding: UTF-8 -*-
from urllib import request

if __name__ == "__main__":
    response = request.urlopen("http://fanyi.baidu.com/?aldtype=16047#zh/en/%E7%BD%91%E9%A1%B5%E7%88%AC%E8%99%AB")
    html = response.read()
    print(html)