require 'rake'

class OutletsController < ApplicationController
  def index

    $outlet_codes = {
      "living_room" => {"on" => 5313843, "off" => 5313852},
      "master_bed_room" => {"on" => 5314307, "off" => 5314316},
      "guest_bed_room" => {"on" => 5313987, "off" => 5313996},
      "puja_room" => {"on" => 5315843, "off" => 5315852}
    }
  end

  def run_command 
    command = params[:code_name].split("-")
    codes = []
    if command[0] == "all"
      $outlet_codes.each { |k,v|
        codes << v[command[1]]
      }
    else 
      codes << $outlet_codes[command[0]][command[1]]
    end
 
    codes.each { |code| 
      p command
      p "Code is #{code}" 
      # `rake turn_on_off[#{code}]`
      `/home/pi/Documents/home_automation/scripts/turn_on_off.sh #{code}`
    }
    redirect_to action: :index
  end

end
