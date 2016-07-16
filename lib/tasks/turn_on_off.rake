task :turn_on_off, [:code] => :environment do |t, args|
     args.with_defaults(:code => 100000)
     puts "Code is #{args.code}"
     `/home/pi/Documents/home_automation/scripts/turn_on_off.sh #{args.code}`
end
