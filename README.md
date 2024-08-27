
# rainbowfart
彩虹屁网站, 提供REST API 拉去随机的毒鸡汤, http://rainbow.ilibrary.me/api/rainbow/random

也可以网页浏览毒鸡汤, http://rainbow.ilibrary.me/

# 加载数据

1. 加载彩虹屁数据
   注意json比较耗数据, 
   ~~~shell
   rake import_triple_line_text:import_triple_line_text[db/rainbow_proposal.yml]
   rake import_triple_line_text:import_triple_line_text[db/rainbow.yml]
   rake import_triple_line_text:load_poisonous_soup
   rake import_data:load_qqzf_csv[data/qqzf1.csv]   # 388w条记录，生产环境上SQLite第一次加载用时3108s, 51分钟，在本地postgresl用了40分钟. 
   rake import_data:load_1juzi_csv[data/1juzi1.csv] # 12428343条记录
   ~~~
1. 1juzi爬下来的数据分类按category1(大类), category2(小类）来分的。有部分文章是没有category2的

# SEO

## 每篇内容都生成独立title
## Breadcrumbs on Rails with Gretel
https://www.sitepoint.com/breadcrumbs-rails-gretel/,
面包屑导航就是一个路径导航, runoob上有[bootstrap4面包屑导航效果](https://www.runoob.com/bootstrap4/bootstrap4-breadcrumb.html)

##参考

1. [给RailsDeveloper的基本SEO](http://gogojimmy.net/2013/09/26/basic-seo-for-rails-developer/)


# 日常维护

## 更新sitemap

1. 在生产环境上运行`rake sitemap:refresh`, 该命令会自动生产新的sitemap.xml.gz然后放public目录下.但是ping google会失败。
1. 在本地运行`hp rake sitemap:refresh`, 通知google sitemap更新了。
1. 从rainbow.ilibrary.me/sitemap.xml.gz下载sitemap文件，可能要经用浏览器缓存才能下到最新的sitemap.


## ActiveAdmin

1. [Mastering ActiveAdmin](http://staal.io/blog/2013/02/26/mastering-activeadmin/)

## Troubleshooting

1. ActionView::Template::Error (The asset "application.css" is not present in the asset pipeline
    先检查是否有正确安装yarn.
    Add env variable RAILS_SERVE_STATIC_FILES to start command, 
    [Stackoverflow](https://stackoverflow.com/questions/21969549/rails-application-css-asset-not-found-in-production-mode)
1. `@q.result(distinct: true)` distinct为true时很耗时。查询qqzf387w记录大概要15-20s，去掉以后大概只要0.9s
1. sqlite在数据量大的时候count非常慢, 380w条记录需要58978.9ms，分页查询只要0.8ms. 这对kaminari分页影响比较大.解决办法就是hack ActiveRelation
   ~~~
   a = Qqzf.all
       a.instance_eval do
         def total_count
           3876341
         end
       end
       @qqzfs = a.page(params[:page]).per(25)
   ~~~
