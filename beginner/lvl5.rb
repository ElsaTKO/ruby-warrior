class Player
  def play_turn(warrior)

    @health = warrior.health

    if warrior.feel.empty? == false
      if warrior.feel.captive? == true
        warrior.rescue!
      else
        warrior.attack!
      end
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
