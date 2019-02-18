% Analysis for defence

[num,txt,raw] = xlsread ('2019data2.xlsx');

% strsplit (table2array(raw (2,11)),'>')

% Cat123 = The categorization per play


%% Done for all of the data
x = cat123 (raw);
c = categorical({'Makes 2 pts','Makes 3 pts','Miss 2 pts','Miss 3 pts', 'Turnover', 'Foul', 'Other'});

figure;
bar (c, x./ sum(x));
title ('Bar graph of the statistics for P&R');

figure;
pie (x);
legend ('Makes 2 pts','Makes 3 pts','Miss 2 pts','Miss 3 pts', 'Turnover', 'Foul', 'Other');
title ('Pie graph of the statistics for P&R');


%% Break it down to just regions
a = 0;
b = 0;
c = 0;
d = 0;

for i = 1: length (raw)
    
    if strcmp (table2array (raw (i,2)), '2019 World Cup African Qualifiers')
        a = a+1;
        africa (a,:) = raw (i,:);
        
        
    elseif strcmp (table2array (raw (i,2)), '2019 World Cup American Qualifiers')
        b = b+1;
        america (b,:) = raw (i,:);
        
    elseif strcmp (table2array (raw (i,2)), '2019 World Cup Asian Qualifiers')
        c = c+1;
        asia (c,:) = raw (i,:);
        
    elseif strcmp (table2array (raw (i,2)), '2019 World Cup Europe Qualifiers')
        d = d+1;
        europe (d,:) = raw (i,:);
        
    end
    
    
end


%% Functions applied to the continent 

x = cat123 (asia);
y = cat123 (europe);
z = cat123 (america);
w = cat123 (africa);
c = categorical({'Makes 2 pts','Makes 3 pts','Miss 2 pts','Miss 3 pts', 'Turnover', 'Foul', 'Other'});

figure;
subplot(2,2,1);
bar (c, x./ sum(x));
title ('Asia - Bar graph of the statistics for P&R');
subplot (2,2,2);
bar (c, y./ sum(y));
title ('Europe - Bar graph of the statistics for P&R');
subplot (2,2,3);
bar (c, z./ sum(z));
title ('America - Bar graph of the statistics for P&R');
subplot (2,2,4);
bar (c, w./ sum(w));
title ('Africa - Bar graph of the statistics for P&R');


figure;
pie (x);
figure;
subplot(2,2,1);
pie (x);
title ('Asia - Pie graph of the statistics for P&R');
subplot (2,2,2);
pie (y);
title ('Europe - Pie graph of the statistics for P&R');
subplot (2,2,3);
pie (z);
title ('America - Pie graph of the statistics for P&R');
subplot (2,2,4);
pie(w);
title ('Africa - Pie graph of the statistics for P&R');

legend ('Makes 2 pts','Makes 3 pts','Miss 2 pts','Miss 3 pts', 'Turnover', 'Foul', 'Other');


%% Break it down to countries
a = 0;
b = 0;

for i = 1: length (raw)
    
    if strcmp (table2array (raw (i,7)), 'Canada')
        a = a+1;
        canada (a,:) = raw (i,:);
        
    elseif strcmp (table2array (raw (i,7)), 'USA')
        b = b+1;
        USA (b,:) = raw (i,:);
        
    end
     
end

%% Functions applied to countries
x = cat123 (canada);
y = cat123 (USA);
c = categorical({'Makes 2 pts','Makes 3 pts','Miss 2 pts','Miss 3 pts', 'Turnover', 'Foul', 'Other'});

figure;
subplot (2,1,1);
bar (c, x./ sum(x));
title ('Canada - Bar graph of the statistics for P&R');

subplot (2,1,2);
bar (c, y./ sum(y));
title ('USA - Bar graph of the statistics for P&R');


figure;
subplot(2,1,1);
pie (x,'explode');
legend ('Makes 2 pts','Makes 3 pts','Miss 2 pts','Miss 3 pts', 'Turnover', 'Foul', 'Other');
title ('Canada - Pie graph of the statistics for P&R');

subplot(2,1,2);
pie (y);
legend ('Makes 2 pts','Makes 3 pts','Miss 2 pts','Miss 3 pts', 'Turnover', 'Foul', 'Other');
title ('USA - Pie graph of the statistics for P&R');
