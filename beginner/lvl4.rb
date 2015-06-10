class Player
  def play_turn(warrior)

    @health = warrior.health

    if warrior.feel.enemy? == true
      warrior.attack!
    elsif warrior.health < 20
      if @health < @end_health
        warrior.walk!
      else
        warrior.rest!
      end
    else
      warrior.walk!
    end

    @end_health = warrior.health
    
  end
end
