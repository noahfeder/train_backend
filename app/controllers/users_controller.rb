class UsersController < ApplicationController

skip_before_action :verify_authenticity_token

def show
  @uid = params[:id]
  @user = User.find_by_uid(@uid)
  res = @user.nil? ? { error: true } : { error: false, train: @user.train }
  puts res
  render json: res
end

def create
  uid = params[:id]
  train = params[:train]
  @user = User.new
  @user.uid = uid
  @user.train = train
  @user.save
  puts @user
  render json: { error: !User.find_by_uid(uid).nil? }
end

def update
  uid = params[:id]
  train = params[:train]
  @user = User.find_by_uid(uid)
  @user.train = train
  @user.save
  puts @user
  render json: { error: !User.find_by_uid(uid).nil? }
end

def destroy
  uid = params[:id]
  @user = User.find_by_uid(uid)
  @user.destroy
  render json: { error: User.find_by_uid(uid).nil? }
end

end
