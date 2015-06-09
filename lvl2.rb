class Player
  def play_turn(warrior)
    if warrior.feel.enemy? == true
      warrior.attack!
    else
      warrior.walk!
    end
  end
end
