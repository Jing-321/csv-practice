require 'csv'
require 'awesome_print'

##############################################
def get_all_olympic_athletes(filename)
  athletes_all = CSV.read("#{filename}", headers: true).map {| athlete | athlete.to_h}
  athletes = []
  athletes_all.each do |athlete|
    athletes << athlete
  end

  return athletes

end

###############################################
def total_medals_per_team(athletes)
  athletes_with_medal = athletes.select { |athlete|athlete["Medal"] != "NA" }
  teams_athletes_with_medal = athletes_with_medal.group_by {|athlete| athlete["Team"]}

  return teams_athletes_with_medal.transform_values { |a| a.length }
end
##############################################
def get_all_gold_medalists(athletes)
  athletes_gold = athletes.select {|athlete| athlete["Medal"] == "Gold"}
  return athletes_gold

end
##############################################
def team_with_most_medals(teams)
  winner = {}
  team_winner = teams.max_by {|team, count| count}
  winner["Team"] = team_winner[0]
  winner["Count"] = team_winner[1].to_i

  return winner

end

##############################################
# ath = get_all_olympic_athletes('../data/athlete_events.csv')
# most = team_with_most_medals(total_medals_per_team(ath))
# ap most
