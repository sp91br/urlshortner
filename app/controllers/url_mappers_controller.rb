class UrlMappersController < ApplicationController
  before_action :set_url_mapper, only: [:show, :edit, :update, :destroy]
  before_action :set_hostpath, only: [:show, :edit, :update, :destroy]

  def take_me_to
    redirect_to UrlMapper.find(params[:id]).longurl
  end
  # GET /url_mappers
  # GET /url_mappers.json
  def index
    @url_mappers = UrlMapper.all
  end

  # GET /url_mappers/1
  # GET /url_mappers/1.json
  def show
  end

  # GET /url_mappers/new
  def new
    @url_mapper = UrlMapper.new
  end

  # GET /url_mappers/1/edit
  def edit
  end

  # POST /url_mappers
  # POST /url_mappers.json
  def create
    @url_mapper = UrlMapper.new(url_mapper_params)

    respond_to do |format|
      if @url_mapper.save
        format.html { redirect_to @url_mapper, notice: 'Url mapper was successfully created.' }
        format.json { render :show, status: :created, location: @url_mapper }
      else
        format.html { render :new }
        format.json { render json: @url_mapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /url_mappers/1
  # PATCH/PUT /url_mappers/1.json
  def update
    respond_to do |format|
      if @url_mapper.update(url_mapper_params)
        format.html { redirect_to @url_mapper, notice: 'Url mapper was successfully updated.' }
        format.json { render :show, status: :ok, location: @url_mapper }
      else
        format.html { render :edit }
        format.json { render json: @url_mapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_mappers/1
  # DELETE /url_mappers/1.json
  def destroy
    @url_mapper.destroy
    respond_to do |format|
      format.html { redirect_to url_mappers_url, notice: 'Url mapper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hostpath
      @hostpath = "#{request.scheme}://#{request.host}:#{request.port}"

    end
    def set_url_mapper
      @url_mapper = UrlMapper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_mapper_params
      params.require(:url_mapper).permit(:longurl)
    end
end
