require "json"
class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.filter_by_category(params[:choice]), location: nil
  end
end

