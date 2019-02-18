function output = cat123 (raw)

    x(1:7)=0;
    for i =1 : length (raw)

        if (table2array (raw (i,15)) == 1) % Make sure that it is a P&R

            if strcmp(table2array(raw (i,6)), 'Make 2 Pts')
                x (1) = x(1) + 1;

            elseif strcmp( table2array(raw (i,6)), 'Make 3 Pts')
                x (2) = x(2) + 1;

            elseif strcmp (table2array(raw (i,6)), 'Miss 2 Pts')
                x (3) = x(3) + 1;

            elseif strcmp (table2array(raw (i,6)), 'Miss 3 Pts')
                x (4) = x(4) + 1;

            elseif strcmp (table2array(raw (i,6)), 'Turnover')
                x (5) = x(5) + 1;

            elseif strcmp (table2array(raw (i,6)), 'Foul')
                x (6) = x(6) + 1;

            else
                x(7) = x(7) + 1;

            end

        end

    end
    
    output = x;

end