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
    else # is at rear wall
      if warrior.feel.empty? == false
        if warrior.feel.captive? == true
          warrior.rescue!
        else # attack! BUT STILL KILLED BY ARCHERS
            if @health < 18
                warrior.walk!(:backward)
            else
              warrior.attack!
            end
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
    end





    # if warrior.feel(:backward).wall? == true
    #   @got_to_rear_wall = true
    # else
    #   @got_to_rear_wall = false
    # end
    #
    #   if @got_to_rear_wall == false
    #     if warrior.feel(:backward).empty? == true
    #       warrior.walk!(:backward)
    #     else
    #       if warrior.feel(:backward).captive? == true
    #         warrior.rescue!(:backward)
    #       end
    #     end
    #   else # is at rear wall
    #     @got_to_rear_wall = true
    #     if warrior.feel.empty? == false
    #       if warrior.feel.captive? == true
    #         warrior.rescue!
    #       else
    #         warrior.attack!
    #       end
    #     elsif warrior.health < 20
    #       if @health < @end_health
    #         warrior.walk!
    #       else
    #         warrior.rest!
    #       end
    #     else
    #       warrior.walk!
    #     end
    #   end


    # check if REAR space is wall
      # if not wall, check if empty
        # if empty, walk backward
        # if not empty, check if captive
          # if captive, rescue
          # if enemy, attack
      # if wall, check if FORE space is empty
        # if not empty, check if captive
          # if captive, rescue
          # if enemy, attack
        # if empty, check health
          # if health < 20, check if losing health
            # if losing health, walk forward
            # if not losing health, rest
          # if full health, walk forward




    @end_health = warrior.health

  end # def play_turn

end # class Player
