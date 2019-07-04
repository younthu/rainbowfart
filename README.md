
# rainbowfart
彩虹屁网站

# 加载数据

1. 加载彩虹屁数据
   ~~~
   rake import_triple_line_text:import_triple_line_text[db/rainbow_proposal.yml]
   rake import_triple_line_text:import_triple_line_text[db/rainbow.yml]
   rake import_triple_line_text:load_poisonous_soup
   rake import_data:load_qqzf_csv[data/qqzf1.csv]   # 388w条记录，生产环境上SQLite第一次加载用时3108s, 51分钟，在本地postgresl用了40分钟.
   ~~~

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