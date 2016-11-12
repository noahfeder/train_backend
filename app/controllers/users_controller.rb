class UsersController < ApplicationController

def show
  @uid = params[:uid]
  @user = User.find_by_uid(@uid)
  if @user.nil?
    render json: {error: true}
  else
    render json: {error: false, train: @user.train}
  end
end

def create
  uid = params[:uid]
  train = params[:train]
  User.create!({uid: uid, train: train})
  render json: {error: !User.find_by_uid(uid).nil?}
end

end
