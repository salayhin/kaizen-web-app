class HelpsController < ApplicationController
  before_action :set_help, only: [:show, :edit, :update, :destroy]

  # GET /helps
  # GET /helps.json
  def index
    @helps = Help.all
    @hash = []
    @helps.each do |help|
      h = {:lat => help.lat, :lng => help.long, :infowindow => help.message}
      @hash.push(h)
    end

    ip = request.remote_ip
    #url = 'ipinfo.io/'+ip
    #str = Curl.get(url)
    @http = GeoIp.geolocation(ip)

    if @http[:ip] == '127.0.0.1'
      lat = '23.43'
      lng = '90.26'
      url = "http://weathernews.jp/v/SOIASIA/weather.cgi?latlon=#{lat}/#{lng}"
    else
      lat = @http[:latitude]
      lng = @http[:longitude]
      url = "http://weathernews.jp/v/SOIASIA/weather.cgi?latlon=#{lat}/#{lng}"
    end

    @weather_update = JSON.parse(open(url).read)
  end

  # GET /helps/1
  # GET /helps/1.json
  def show
  end

  # GET /helps/new
  def new
    ip = request.remote_ip
    #url = 'ipinfo.io/'+ip
    #str = Curl.get(url)
    @http = GeoIp.geolocation(ip)
    @help = Help.new
  end

  # GET /helps/1/edit
  def edit
    ip = request.remote_ip
    #url = 'ipinfo.io/'+ip
    #str = Curl.get(url)
    @http = GeoIp.geolocation(ip)
  end

  # POST /helps
  # POST /helps.json
  def create
    @help = Help.new(help_params)

    respond_to do |format|
      if @help.save
        format.html { redirect_to helps_path, notice: 'Help was successfully created.' }
        format.json { render :show, status: :created, location: @help }
      else
        format.html { render :new }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helps/1
  # PATCH/PUT /helps/1.json
  def update
    respond_to do |format|
      if @help.update(help_params)
        format.html { redirect_to helps_path, notice: 'Help was successfully updated.' }
        format.json { render :show, status: :ok, location: @help }
      else
        format.html { render :edit }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helps/1
  # DELETE /helps/1.json
  def destroy
    @help.destroy
    respond_to do |format|
      format.html { redirect_to helps_url, notice: 'Help was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help
      @help = Help.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_params
      params.require(:help).permit(:lat, :long, :message, :photo, :user_id, :city, :region, :country)
    end
end
