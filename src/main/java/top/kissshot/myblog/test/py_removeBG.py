#coding=utf-8
from sys import argv
from removebg import RemoveBg

print argv

#arg0 py路径

#arg1 密匙
#arg2 log路径
#arg3 类型
#arg4 imgPoU imgPath or imgUrl

rmbg = RemoveBg(argv[1], argv[2])

if argv[3] == 'file':
    print 'file'
    rmbg.remove_background_from_img_file(argv[4])
elif argv[3] == 'url':
    print 'url'
    rmbg.remove_background_from_img_url(argv[4])
else:
    print '类型错误';

print 'compiled'