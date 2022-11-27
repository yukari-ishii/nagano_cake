class Admin::HomesController < ApplicationController

  def top
    @oders = Order.all
  end

end
