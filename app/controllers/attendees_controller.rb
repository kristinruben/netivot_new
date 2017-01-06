class AttendeesController < ApplicationController
  def index
    @members = Attendee.all
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
      flash[:notice] = "#{@member.first_name} added."
      redirect_to action: :index
    else
      flash.now[:alert] = "Bad member. #{@member.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def first_name
    @member = Member.find(params[:id])
    @member.first_name
  end


end
