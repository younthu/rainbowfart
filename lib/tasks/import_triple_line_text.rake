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
end
