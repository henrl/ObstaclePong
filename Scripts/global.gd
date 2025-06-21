extends Node

var P1_Score: int = 0
var P2_Score: int = 0
var attacking_player_id: int = 0
var has_cpu: bool = false

signal scored_goal
signal freezePlayer(playerID: int)
