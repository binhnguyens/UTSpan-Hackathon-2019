    
function [points_gained, madepoints, missedpoints] = points_per_play (holder, against, col, play)
    

    missedpoints = 0;
    madepoints = 0;
    points_gained = 0;

      for i =1 : length (holder)

            if strcmp(table2array (holder (i,col)),play) % Make sure that it is a P&R
                
                if against
                    if strcmp(table2array(holder(i, 4)), against) || strcmp(table2array(holder(i, 5)), against)
                        points_gained = points_gained + table2array (holder (i,14));
                
                        if table2array (holder (i,14)) >= 1 %quantity of made baskets
                            madepoints = madepoints + 1;

                        elseif table2array (holder (i,14)) == 0 %quantity of missed baskets
                            missedpoints = missedpoints + 1; 
                        end
                    end
                    
                else
                    points_gained = points_gained + table2array (holder (i,14));
                
                    if table2array (holder (i,14)) >= 1 %quantity of made baskets
                        madepoints = madepoints + 1;

                    elseif table2array (holder (i,14)) == 0 %quantity of missed baskets
                        missedpoints = missedpoints + 1; 
                    end
                end
                

            end

      end

  end