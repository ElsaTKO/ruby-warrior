class Player

  def initialize
    @hit_wall_count = 0
  end


  def play_turn(warrior)

    @health = warrior.health

    if warrior.feel(:backward).wall? == true
      @hit_wall_count += 1
    end

    if @hit_wall_count == 0
      if warrior.feel(:backward).empty? == true
        warrior.walk!(:backward)
      else
        if warrior.feel(:backward).captive? == true
          warrior.rescue!(:backward)
        end
      end
    else # restart at rear wall
      if warrior.feel.empty? == false # when next to something
        if warrior.feel.captive? == true
          warrior.rescue!
        else
          if @health < 10 # can survive close combat?
            warrior.walk!(:backward)
          else
            warrior.attack!
          end
        end
      elsif warrior.feel.empty? == true # when 1+ space(s) from something
        if @health < @end_health && @health > 15 # move into combat
          warrior.walk!
        elsif @health < @end_health && @health < 15 # move out of range
          warrior.walk!(:backward)
        elsif @health < 20
          warrior.rest!
        else
          warrior.walk!
        end
      else
        warrior.walk!
      end
    end

    @end_health = warrior.health

  end

end # class Player
