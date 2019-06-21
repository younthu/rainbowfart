namespace :convert_json2csv do

  desc "convert qqzf.json to csv，这是qqzf.cn拔下来的内容, rake convert_json2csv:json2csv[data/qqzf1.json, data/qqzf.csv]"
  task :json2csv,[:file_name, :output_file] => [:environment] do |task, args|

    count = 1 # id start from 1 in database
    t1    = Time.now

    puts `ps -o rss= -p #{$$}`.to_i
    CSV.open(args[:output_file], "w") do |csv|
      csv << ["category1", "category2", "title","url","content", "created_at", "updated_at"]

      file = File.open(args[:file_name])
      qqzf = JSON.load(file)

      puts `ps -o rss= -p #{$$}`.to_i
      t1 = Time.now
      qqzf.each do |item|
        title  = ActionView::Base.full_sanitizer.sanitize(item["title"]) # 去除<h1></h1>标签
        source = "qqzf"
        navi   = item["category"] || item["catetory"]   #["励志网", " → ", "名言大全", " → ", "励志名言", " → ", "高考励志名言短句"]




        item["sentences"].each do |s|
          csv << [count, navi[2],navi[4],title,item["url"], s,t1, t1]
          count+=1

          if count % 5000 == 0

            puts "created #{count} records in #{Time.now - t1} seconds."

          end
        end
      end
    end

    t2 = Time.now
    delta = t2 -t1 # in seconds

    puts "started at #{t1}, finished at #{t2}, total #{delta} seconds, #{count} records."
    puts `ps -o rss= -p #{$$}`.to_i
  end
end
