class UsersController < ApplicationController

skip_before_action :verify_authenticity_token

def show
  @uid = params[:id]
  @user = User.find_by(uid: @uid)
  puts @user
  res = @user.nil? ? { error: true } : { error: false, train: @user.train }
  puts res
  render json: res
end

def create
  @uid = params[:uid]
  @train = params[:train]
  @user = User.create({uid: @uid, train: @train})
  puts "Train: #{@user.train}" if !@user.nil?
  render json: { error: !@user.nil? }
end

def update
  uid = params[:id]
  train = params[:train]
  @user = User.find_by(uid: uid)
  @user.train = train
  @user.save
  puts @user
  render json: { error: !@user.nil? }
end

def destroy
  uid = params[:id]
  @user = User.find_by(uid: uid)
  @user.destroy
  puts @user
  render json: { error: @user.nil? }
end

end
