class CardsController < ApplicationController
  # GET /cards
  # GET /cards.json
  def index
    @user = User.find_by_member_id(params[:user_id])
    @cards = @user.cards

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @user = User.find_by_member_id(params[:user_id])
    @card = @user.cards.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new
    @user = User.find_by_member_id(params[:user_id])
    @card = @user.cards.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @user = User.find_by_member_id(params[:user_id])
    @card = @user.cards.find(params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create
    @user = User.find_by_member_id(params[:user_id])
    @card = @user.cards.new(params[:card])

    respond_to do |format|
      if @card.save
        format.html { redirect_to user_card_path(@user, @card), notice: 'Card was successfully created.' }
        format.json { render json: @card, status: :created, location: @card }
      else
        format.html { render action: "new" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @user = User.find_by_member_id(params[:user_id])
    @card = @user.cards.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to user_card_path(@user, @card), notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @user = User.find_by_member_id(params[:user_id])
    @card = @user.cards.find(params[:id])

    respond_to do |format|
      format.html { redirect_to user_cards_path }
      format.json { head :no_content }
    end
  end
  
  # POST /cards/1/disable
  def disable
    @user = @user = User.find_by_member_id(params[:user_id])
    @card = @user.cards.find(params[:id])
    @card.update_attributes(:enabled => false)
    
    respond_to do |format|
      format.html { redirect_to user_cards_path, notice: "Card (#{@card.site_code}:#{@card.card_id}) was successfully disabled." }
      format.json { render json: :no_content }
    end
  end
end
