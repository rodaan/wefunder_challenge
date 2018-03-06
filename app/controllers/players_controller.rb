class PlayersController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy, :index]
  before_action :retrieve_tournament, only: [:create]
  # GET /players
  # GET /players.json
  def index
    @players = @tournament.players
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    puts(params);
    @player = Player.new(player_params)
 
    respond_to do |format|
      if @player.save
        # Tell the playerMailer to send a welcome email after save
        # @user_player = Userplayer.new(user_id: @user.id, player_id: @player_id)
        # if @user_player.save
          @tournament.players << @player
          # @tournament.update_attribute(num_players: @tournament.num_players + 1)
          format.html { redirect_to(root_path, notice: 'player was successfully added.') }
          format.json { render json: @player, status: :created, location: @player }
        # end
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      puts(params)
      @tournament = Tournament.find(params[:tournament_id])
      puts(@tournament)
    end

    def retrieve_tournament
      puts(request.headers['referer'].split('/')[4])
      @tournament = Tournament.find(request.headers['referer'].split('/')[4])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:first_name, :email, :last_name)
    end
end
