
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
1. 