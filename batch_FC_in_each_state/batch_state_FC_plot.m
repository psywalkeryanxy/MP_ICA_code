%batch for dynamic FNC
%xinyuanyan


clear all; close;
%get the states information
load('mp_dfnc.mat');
load('mp_dfnc_post_process.mat');
load('red_blue_colorbar_Yan.mat');

allstates = clusterInfo.states;
winlen = 200;

allsubstates = [];
for win = 1:winlen
    allsubstates = [allsubstates,allstates(:,:,win)];
end%for win

subfile = dir([pwd,filesep,'mp_dfnc_sub_*.mat']);

for i=1:length(subfile)
    
    %% preparation
    load([pwd,filesep,subfile(i).name]);
    
    index1 = find(allsubstates(i,:)==1);
    index2 = find(allsubstates(i,:)==2);
    index3 = find(allsubstates(i,:)==3);
    index4 = find(allsubstates(i,:)==4);
    
    if isempty(index1)
        sub_stateFC{i,1} = nan;
    else
        sub_stateFC{i,1} = nanmean(FNCdyn(index1,:),1);
    end
    
    if isempty(index2)
        sub_stateFC{i,2} = nan;
    else
        sub_stateFC{i,2} = nanmean(FNCdyn(index2,:),1);
    end
    
    if isempty(index3)
        sub_stateFC{i,3} = nan;
    else
        sub_stateFC{i,3} = nanmean(FNCdyn(index3,:),1);
    end
    
    if isempty(index4)
        sub_stateFC{i,4} = nan;
    else
        sub_stateFC{i,4} = nanmean(FNCdyn(index4,:),1);
    end
    
    
end%for i

clear i


%% begin calculation
%dwBP = alldw(1:49,:);
%dwDP = alldw(50:147,:);
%dwNC = alldw(148:351,:);
%dwQP = alldw(352:403,:);
%dwSZ = alldw(404:545,:);

%% BP
allsubBP.state1 = [];
allsubBP.state2 = [];
allsubBP.state3 = [];
allsubBP.state4 = [];
for i=1:49
    
    temp = sub_stateFC{i,1};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubBP.state1 = [allsubBP.state1;temp];
    clear temp
    
    temp = sub_stateFC{i,2};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubBP.state2 = [allsubBP.state2;temp];
    
     clear temp
    temp = sub_stateFC{i,3};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubBP.state3 = [allsubBP.state3;temp];
    
     clear temp
    temp = sub_stateFC{i,4};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubBP.state4 = [allsubBP.state4;temp];
     clear temp
end

%% DP


allsubDP.state1 = [];
allsubDP.state2 = [];
allsubDP.state3 = [];
allsubDP.state4 = [];
for i=50:147
    
    temp = sub_stateFC{i,1};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubDP.state1 = [allsubDP.state1;temp];
    clear temp
    
    temp = sub_stateFC{i,2};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubDP.state2 = [allsubDP.state2;temp];
    
     clear temp
    temp = sub_stateFC{i,3};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubDP.state3 = [allsubDP.state3;temp];
    
     clear temp
    temp = sub_stateFC{i,4};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubDP.state4 = [allsubDP.state4;temp];
     clear temp
end


%% NC

allsubNC.state1 = [];
allsubNC.state2 = [];
allsubNC.state3 = [];
allsubNC.state4 = [];
for i=148:351
    
    temp = sub_stateFC{i,1};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubNC.state1 = [allsubNC.state1;temp];
    clear temp
    
    temp = sub_stateFC{i,2};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubNC.state2 = [allsubNC.state2;temp];
    
     clear temp
    temp = sub_stateFC{i,3};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubNC.state3 = [allsubNC.state3;temp];
    
     clear temp
    temp = sub_stateFC{i,4};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubNC.state4 = [allsubNC.state4;temp];
     clear temp
end

%% QP

allsubQP.state1 = [];
allsubQP.state2 = [];
allsubQP.state3 = [];
allsubQP.state4 = [];
for i=352:403
    
    temp = sub_stateFC{i,1};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubQP.state1 = [allsubQP.state1;temp];
    clear temp
    
    temp = sub_stateFC{i,2};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubQP.state2 = [allsubQP.state2;temp];
    
     clear temp
    temp = sub_stateFC{i,3};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubQP.state3 = [allsubQP.state3;temp];
    
     clear temp
    temp = sub_stateFC{i,4};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubQP.state4 = [allsubQP.state4;temp];
     clear temp
end


%% SZ

allsubSZ.state1 = [];
allsubSZ.state2 = [];
allsubSZ.state3 = [];
allsubSZ.state4 = [];

for i=404:545
    
    temp = sub_stateFC{i,1};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubSZ.state1 = [allsubSZ.state1;temp];
    clear temp
    
    temp = sub_stateFC{i,2};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubSZ.state2 = [allsubSZ.state2;temp];
    
     clear temp
    temp = sub_stateFC{i,3};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubSZ.state3 = [allsubSZ.state3;temp];
    
     clear temp
    temp = sub_stateFC{i,4};
    if isnan(temp)
        temp = nan(1,21);
    end
    allsubSZ.state4 = [allsubSZ.state4;temp];
     clear temp
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% now begin the figure part
barrange = [-0.5 0.8];
colourScheme = 'jet'%red_blue_colorbar_Yan;

figurename = {'FCMapallsubBPstate1','FCMapallsubBPstate2','FCMapallsubBPstate3','FCMapallsubBPstate4'}';
thismat{1} = squareform(nanmean(allsubBP.state1,1));
thismat{2} = squareform(nanmean(allsubBP.state2,1));
thismat{3} = squareform(nanmean(allsubBP.state3,1));
thismat{4} = squareform(nanmean(allsubBP.state4,1));

for kk=1:4%statenum

        subplot(1,4,kk);
    imagesc(thismat{kk});

    colormap(gca, colourScheme);
    %   colormap(color);
    colorbar
    axis square
    axis square
    title(figurename{kk,1});
    caxis(barrange);
    %save
    print('-dpng','-r600',figurename{kk,1});
end



figurename = {'FCMapallsubDPstate1','FCMapallsubDPstate2','FCMapallsubDPstate3','FCMapallsubDPstate4'}';
thismat{1} = squareform(nanmean(allsubDP.state1,1));
thismat{2} = squareform(nanmean(allsubDP.state2,1));
thismat{3} = squareform(nanmean(allsubDP.state3,1));
thismat{4} = squareform(nanmean(allsubDP.state4,1));


for kk=1:4%statenum

        subplot(1,4,kk);
    imagesc(thismat{kk});

    colormap(gca, colourScheme);
    %   colormap(color);
    colorbar
    axis square
    axis square
    title(figurename{kk,1});
    caxis(barrange);
    %save
    print('-dpng','-r600',figurename{kk,1});
end



figurename = {'FCMapallsubNCstate1','FCMapallsubNCstate2','FCMapallsubNCstate3','FCMapallsubNCstate4'}';
thismat{1} = squareform(nanmean(allsubNC.state1,1));
thismat{2} = squareform(nanmean(allsubNC.state2,1));
thismat{3} = squareform(nanmean(allsubNC.state3,1));
thismat{4} = squareform(nanmean(allsubNC.state4,1));

for kk=1:4%statenum

        subplot(1,4,kk);
    imagesc(thismat{kk});

    colormap(gca, colourScheme);
    %   colormap(color);
    colorbar
    axis square
    axis square
    title(figurename{kk,1});
    caxis(barrange);
    %save
    print('-dpng','-r600',figurename{kk,1});
end




figurename = {'FCMapallsubQPstate1','FCMapallsubQPstate2','FCMapallsubQPstate3','FCMapallsubQPstate4'}';
thismat{1} = squareform(nanmean(allsubQP.state1,1));
thismat{2} = squareform(nanmean(allsubQP.state2,1));
thismat{3} = squareform(nanmean(allsubQP.state3,1));
thismat{4} = squareform(nanmean(allsubQP.state4,1));


for kk=1:4%statenum

        subplot(1,4,kk);
    imagesc(thismat{kk});

    colormap(gca, colourScheme);
    %   colormap(color);
    colorbar
    axis square
    axis square
    title(figurename{kk,1});
    caxis(barrange);
    %save
    print('-dpng','-r600',figurename{kk,1});
end



figurename = {'FCMapallsubSZstate1','FCMapallsubSZstate2','FCMapallsubSZstate3','FCMapallsubSZstate4'}';
thismat{1} = squareform(nanmean(allsubSZ.state1,1));
thismat{2} = squareform(nanmean(allsubSZ.state2,1));
thismat{3} = squareform(nanmean(allsubSZ.state3,1));
thismat{4} = squareform(nanmean(allsubSZ.state4,1));


for kk=1:4%statenum

    subplot(1,4,kk);
    imagesc(thismat{kk});

    colormap(gca, colourScheme);
    %   colormap(color);
    colorbar
    axis square
    axis square
    title(figurename{kk,1});
    caxis(barrange);
    %save
    print('-dpng','-r600',figurename{kk,1});
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%