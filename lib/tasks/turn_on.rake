task :turn_on => :environment do
  `/var/www/html/rfoutlet/test_on.sh`
end
