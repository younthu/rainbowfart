namespace :import_triple_line_text do

  desc "import rainbow in triple line format from text file"
  task :import_triple_line_text,[:file_name] => [:environment] do |task, args|

    records=[];
    File.open(args[:file_name],'r').each_line do |r|
      records<<r;
    end

    (0...records.count/3).each do |i|
      rb=Rainbow.create({sentence: records[i*3], gender_list:records[i*3+1], feature_list:records[i*3+2]});
      rb.save;
    end
  end

  desc "加载毒鸡汤"
  task :load_poisonous_soup => [:environment] do | task, args|

    rb = nil;
    rbs=[]
    lines = File.readlines('db/poisonous_soup.txt');
    lines.shift();
    i=0;

    while i < lines.count do
      line = lines[i]
      if line.start_with?('p:')
        rb = Rainbow.new
        j = 1;text='';
        while i +j < lines.count
          line = lines[i+j]
          if line.start_with?('p:')
            break
          elsif line.start_with?('t:') || line.start_with?('k:')
            j+=1
            next
          else
            text+=line
          end
          j+=1
        end
      elsif line.start_with?('p:') || line.start_with?('k:')
        i+=1
      end

      rb.sentence=text
      rb.feature_list=['毒鸡汤']
      rb.save
      i+=j
    end

  end
end
