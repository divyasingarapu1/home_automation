task :turn_off => :environment do
  `/var/www/html/rfoutlet/test_off.sh`
end
