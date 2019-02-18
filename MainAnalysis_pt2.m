
[num,txt,raw] = xlsread ('initialplaytype.xlsx');

points_gained = 0;

%% Separate into different countries

a = 0;
b = 0;

for i = 1: length (raw)
    
    if strcmp (table2array (raw (i,7)), 'Canada')
        a = a+1;
        canada (a,:) = raw (i,:);
        
    elseif strcmp (table2array (raw (i,7)), 'Spain')
        b = b+1;
        spain (b,:) = raw (i,:);
        
    end
     
end


%% Analyze P&R and Points Gained
% holder = canada;
holder = spain;


plays = {'Cut',...
 'Hand Off', ...
 'ISO', ...
 'No Play Type', ...
 'Off Screen', ...
 'P&R Ball Handler',...
 'Post-Up', ...
 'Spot-Up',...
 'Transition'};

playsVar = {'Cut',...
 'HandOff', ...
 'ISO', ...
 'NoPlayType', ...
 'OffScreen', ...
 'PR_BallHandler',...
 'PostUp', ...
 'SpotUp',...
 'Transition'};

allPPP = array2table(zeros(1,9), 'VariableNames', playsVar);
for j = 1: length (plays)

    [points_gained, madepoints, missedpoints] = points_per_play (holder, [], 17, table2array (plays(j)));
    percent_PR_points = points_gained / (missedpoints + madepoints); %Number of points made per Pick and Roll possesion
    
    allPPP{1,j} = percent_PR_points;


end

playsVar = {'Cut',...
 'HandOff', ...
 'ISO', ...
 'NoPlayType', ...
 'OffScreen', ...
 'PR_BallHandler',...
 'PostUp', ...
 'SpotUp',...
 'Transition'};

% countries = {'Brazil', 'Venezuela', 'Chile', 'Virgin Islands', 'Dominican Republic', 'Bahamas'};
countries = {'Turkey', 'Ukraine', 'Slovenia', 'Belarus', 'Montenegro'};

PPPagainstCountry = array2table(zeros(5, 9), 'VariableNames', playsVar, 'RowNames', countries);
totalNumP = array2table(zeros(5, 9), 'VariableNames', playsVar, 'RowNames', countries);

for i = 1:length(countries)
    for j = 1: length (plays)

        [points_gained, madepoints, missedpoints] = points_per_play (holder, countries{i}, 17, table2array (plays(j)));
        percent_PR_points = points_gained / (missedpoints + madepoints); %Number of points made per Pick and Roll possesion

        PPPagainstCountry{i,j} = percent_PR_points;
        totalNumP{i, j} = missedpoints + madepoints;

    end
end
