namespace :import_data do
  desc "导入qqzf.json数据，这是qqzf.cn拔下来的内容, rake import_data:load_qqzf[data/qqzf.json]"
  task :load_qqzf, [:file_name] => [:environment] do |task, args|

    puts `ps -o rss= -p #{$$}`.to_i
    count = 0
t0 = Time.now
    file = File.open(args[:file_name])
    qqzf = JSON.load(file)

    t1 = Time.now
    puts "json loaded in #{t1 - t0} seconds"
    puts `ps -o rss= -p #{$$}`.to_i

    records = []
    qqzf.each do |item|
      title  = ActionView::Base.full_sanitizer.sanitize(item["title"]) # 去除<h1></h1>标签
      source = "qqzf"
      navi   = item["category"] || item["catetory"]   #["励志网", " → ", "名言大全", " → ", "励志名言", " → ", "高考励志名言短句"]




      item["sentences"].each do |s|
        qqzf = Qqzf.new
        qqzf.category1 = navi[2]
        qqzf.category2 = navi[4]
        qqzf.title     = title
        qqzf.url       = item["url"]
        qqzf.content   = s.gsub /\d+、/,''
        # qqzf.save
        # records <<  qqzf
        records << {category1: navi[2],
        category2: navi[4],
        title: title,
        url: item["url"],
        content: qqzf.content}
        count+=1

        if count % 5000 == 0
          Qqzf.import records
          puts "created #{count} records in #{Time.now - t1} seconds."
          records = []
        end
      end
    end

    if records.length > 0
      Qqzf.import records
      records = []
    end

    t2 = Time.now
    delta = t2 -t1 # in seconds

    puts "started at #{t1}, finished at #{t2}, total #{delta} seconds, #{count} records."
  end
end
