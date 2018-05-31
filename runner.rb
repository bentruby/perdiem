load 'perdiem.rb'
load 'project.rb'

json = ARGV.first

perdiem = Perdiem.new(json)

puts perdiem.reimburstment

#ruby runner.rb '[{"cityCostType":"LOW","startDate":"2015-09-01T00:00:00Z","endDate":"2015-09-12T00:00:00Z"}]'