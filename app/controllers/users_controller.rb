class UsersController < ApplicationController
skip_before_action :verify_authenticity_token
def show
  @uid = params[:id]
  @user = User.find_by_uid(@uid)
  if @user.nil?
    render json: {error: true}
  else
    render json: {error: false, train: @user.train}
  end
end

def create
  uid = params[:id]
  train = params[:train]
  @user = User.new
  @user.uid = uid
  @user.train = train
  @user.save
  render json: {error: !User.find_by_uid(uid).nil?}
end

end
