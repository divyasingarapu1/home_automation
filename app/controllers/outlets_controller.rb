require 'rake'

class OutletsController < ApplicationController
  def index
  end

  def turn_off
    p "Turning Off"
    `rake turn_off`
    redirect_to action: :index
  end

  def turn_on
    p " Turning On"
    `rake turn_on`
    redirect_to action: :index
  end

end
