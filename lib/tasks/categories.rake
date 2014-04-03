desc "create default categories"
task :categories => :environment do
  %w(
    Politik Geschichte Gesellschaft  
    Kultur Unterhaltung Kunst Musik
    Naturwissenschaften Technik Geografie
    Sport Tratsch Regionales
  ).each do |cat|
    Category.create title: cat
  end
end
