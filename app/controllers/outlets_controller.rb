require 'rake'

class OutletsController < ApplicationController
  skip_before_filter  :verify_authenticity_token 
  def index

    $outlet_codes = {
      "living_room" => {"on" => 5313843, "off" => 5313852, "pulse" => 188},
      "master_bed_room" => {"on" => 5314307, "off" => 5314316, "pulse" => 188},
      "guest_bed_room" => {"on" => 5313987, "off" => 5313996, "pulse" => 188},
      "puja_room" => {"on" => 5315843, "off" => 5315852, "pulse" => 188},
      "kitchen" => {"on" => 14984199, "off" => 14984198, "pulse" => 213}
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
      codes << "#{$outlet_codes[command[0]][command[1]]}-#{$outlet_codes[command[0]]['pulse']}"
    end
 
    codes.each { |e| 
      code_pulse = e.split("-")
      code = code_pulse[0]
      pulse = code_pulse[1]
      p command
      p "Code is #{code}, Pulse is #{pulse}" 
      `/home/pi/Documents/home_automation/scripts/turn_on_off.sh #{code} #{pulse}`
    }
    redirect_to action: :index
  end

end
