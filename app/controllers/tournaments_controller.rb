class TournamentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create]
  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = @user.tournaments
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    puts(params[:tournament]);
    @tournament = Tournament.new(tournament_params)
 
    respond_to do |format|
      if @tournament.save
        # Tell the tournamentMailer to send a welcome email after save
        # @user_tournament = UserTournament.new(user_id: @user.id, tournament_id: @tournament_id)
        # if @user_tournament.save
          current_user.tournaments << @tournament
          format.html { redirect_to(root_path, notice: 'tournament was successfully created.') }
          format.json { render json: @tournament, status: :created, location: @tournament }
        # end
      else
        format.html { render action: 'new' }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    @tournament = Tournament.find(params[:id])
    @numMatches = @tournament.players.length / 2
    respond_to do |format|
      if @numMatches == 0
        format.html { redirect_to(root_path, notice: 'not enough players to start match.') }
      elsif
        @playersLeft = []
        @playersLeft.append(@tournament.players)
        if @numMatches % 2 != 0
          selectedIndex = Random.rand(@playersLeft.length)
          selected = @playersLeft[selectedIndex][Random.rand(@playersLeft.length)]
          puts(selected.to_json)
          match = Match.create(tournament_id: @tournament.id, player1_id: selected.id, winner_id: selected.id)
          @tournament.matches << match
          @playersLeft.delete_at(selectedIndex)
        end
        while @playersLeft.length > 0
          selectedIndex1 = Random.rand(@playersLeft.length)
          selected1 = @playersLeft[selectedIndex1]
          @playersLeft.delete_at(selectedIndex1)
          selectedIndex2 = Random.rand(@playersLeft.length)
          selected2 = @playersLeft[selectedIndex2] 
          @playersLeft.delete_at(selectedIndex2)
          match = Match.create(tournament_id: @tournament.id, player1_id: selected1.id, player2_id: selected2.id)
          @tournament.matches << match
        end
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournament_url, notice: 'tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    @players = @tournament
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :start_date, :end_date)
    end
end
