# TODO(tim): make this more comprehensive

csv = read_vires_csv("test.csv")

@test csv.header[:no_of_players] == "9"
@test csv.player_headers[1].name == "Ego"
@test csv.player_headers[1].id == 1

@test get_nplayers(csv) == 9