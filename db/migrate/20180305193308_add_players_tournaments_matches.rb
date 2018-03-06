class AddPlayersTournamentsMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_rounds
      t.string :format
      t.integer :num_players
      t.string :name
      t.string :description
    end
    
    create_table :user_tournaments do |t|
      t.integer :user_id
      t.integer :tournament_id
    end
    
    create_table :players do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :company
    end

    create_table :player_tournaments do |t|
      t.integer :player_id
      t.integer :tournament_id
    end

    create_table :matches do |t|
      t.integer :tournament_id
      t.integer :player1_id
      t.integer :player2_id
      t.integer :player1_score
      t.integer :player2_score
      t.integer :winner_id
      t.string :description
      t.string :description
    end
  end
end
