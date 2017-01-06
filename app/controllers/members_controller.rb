class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
  # @member.listed_by_user = current_user

    if @member.valid?
      @member.save!
      flash[:notice] = "#{@member.name} added."
      redirect_to action: :index
    else
      flash.now[:alert] = "Bad member. #{@member.errors.full_messages.join(', ')}"
      render :new
    end
  end

end
