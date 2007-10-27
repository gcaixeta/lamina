class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.xml
  def index
    @answers = Answer.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @answers.to_xml }
    end
  end

  # GET /answers/1
  # GET /answers/1.xml
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @answer.to_xml }
    end
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1;edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.xml
  def create
    @answer = Answer.new(params[:answer])

    respond_to do |format|
      if @answer.save
        flash[:notice] = 'Answer was successfully created.'
        format.html { redirect_to answer_url(@answer) }
        format.xml  { head :created, :location => answer_url(@answer) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @answer.errors.to_xml }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.xml
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        flash[:notice] = 'Answer was successfully updated.'
        format.html { redirect_to answer_url(@answer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer.errors.to_xml }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.xml
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.xml  { head :ok }
    end
  end
end
