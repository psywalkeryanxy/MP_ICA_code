%batch for dynamic FNC
%xinyuanyan
%sanp, bnu

clear all; close;
%get the states information
load('mp_dfnc.mat');
load('mp_dfnc_post_process.mat');


allstates = clusterInfo.states;
winlen = 200;
nodeLen=21;
allsubstates = [];
for win = 1:winlen
    allsubstates = [allsubstates,allstates(:,:,win)];
end%for win

%get the group-wise states matrix

subfile=dir([pwd,filesep,'mp_dfnc_sub*']);
%% BP
for i=1:49%length(subfile)
    load(subfile(i).name);
    win01IDX = find(allsubstates(i,:)==1);
    win02IDX = find(allsubstates(i,:)==2);
    win03IDX = find(allsubstates(i,:)==3);
    win04IDX = find(allsubstates(i,:)==4);
    if isempty(win01IDX)
        BPwin01(i,:) = zeros(1,nodeLen);
    else
        BPwin01(i,:) = nanmean(FNCdyn(win01IDX',:));
    end
    
    if isempty(win02IDX)
        BPwin02(i,:) = zeros(1,nodeLen);
    else
        BPwin02(i,:) = nanmean(FNCdyn(win02IDX',:));
    end
    
    if isempty(win03IDX)
        BPwin03(i,:) = zeros(1,nodeLen);
    else
        BPwin03(i,:) = nanmean(FNCdyn(win03IDX',:));
    end
    
    if isempty(win04IDX)
        BPwin04(i,:) = zeros(1,nodeLen);
    else
        BPwin04(i,:) = nanmean(FNCdyn(win04IDX',:));
    end

    
end%for i
%get mean for BP
meanBPwin01 = mean(BPwin01);
meanBPwin02 = mean(BPwin02);
meanBPwin03 = mean(BPwin03);
meanBPwin04 = mean(BPwin04);
clear i win01IDX win02IDX win03IDX win04IDX


%% DP
for i=50:147%length(subfile)
    load(subfile(i).name);
    win01IDX = find(allsubstates(i,:)==1);
    win02IDX = find(allsubstates(i,:)==2);
    win03IDX = find(allsubstates(i,:)==3);
    win04IDX = find(allsubstates(i,:)==4);
    if isempty(win01IDX)
        DPwin01(i,:) = zeros(1,nodeLen);
    else
        DPwin01(i,:) = nanmean(FNCdyn(win01IDX',:),1);
    end
    
    if isempty(win02IDX)
        DPwin02(i,:) = zeros(1,nodeLen);
    else
        DPwin02(i,:) = nanmean(FNCdyn(win02IDX',:));
    end
    
    if isempty(win03IDX)
        DPwin03(i,:) = zeros(1,nodeLen);
    else
        DPwin03(i,:) = nanmean(FNCdyn(win03IDX',:));
    end
    
    if isempty(win04IDX)
        DPwin04(i,:) = zeros(1,nodeLen);
    else
        DPwin04(i,:) = nanmean(FNCdyn(win04IDX',:));
    end

    
end%for i
%get mean for DP
meanDPwin01 = mean(DPwin01);
meanDPwin02 = mean(DPwin02);
meanDPwin03 = mean(DPwin03);
meanDPwin04 = mean(DPwin04);
clear i win01IDX win02IDX win03IDX win04IDX


%% NC
for i=148:351%length(subfile)
    load(subfile(i).name);
    win01IDX = find(allsubstates(i,:)==1);
    win02IDX = find(allsubstates(i,:)==2);
    win03IDX = find(allsubstates(i,:)==3);
    win04IDX = find(allsubstates(i,:)==4);
    if isempty(win01IDX)
        NCwin01(i,:) = zeros(1,nodeLen);
    else
        NCwin01(i,:) = nanmean(FNCdyn(win01IDX',:));
    end
    
    if isempty(win02IDX)
        NCwin02(i,:) = zeros(1,nodeLen);
    else
        NCwin02(i,:) = nanmean(FNCdyn(win02IDX',:));
    end
    
    if isempty(win03IDX)
        NCwin03(i,:) = zeros(1,nodeLen);
    else
        NCwin03(i,:) = nanmean(FNCdyn(win03IDX',:));
    end
    
    if isempty(win04IDX)
        NCwin04(i,:) = zeros(1,nodeLen);
    else
        NCwin04(i,:) = nanmean(FNCdyn(win04IDX',:));
    end

    
end%for i
%get mean for NC
meanNCwin01 = mean(NCwin01);
meanNCwin02 = mean(NCwin02);
meanNCwin03 = mean(NCwin03);
meanNCwin04 = mean(NCwin04);
clear i win01IDX win02IDX win03IDX win04IDX


%% QP
for i=352:403%length(subfile)
    load(subfile(i).name);
    win01IDX = find(allsubstates(i,:)==1);
    win02IDX = find(allsubstates(i,:)==2);
    win03IDX = find(allsubstates(i,:)==3);
    win04IDX = find(allsubstates(i,:)==4);
    if isempty(win01IDX)
        QPwin01(i,:) = zeros(1,nodeLen);
    else
        QPwin01(i,:) = nanmean(FNCdyn(win01IDX',:));
    end
    
    if isempty(win02IDX)
        QPwin02(i,:) = zeros(1,nodeLen);
    else
        QPwin02(i,:) = nanmean(FNCdyn(win02IDX',:));
    end
    
    if isempty(win03IDX)
        QPwin03(i,:) = zeros(1,nodeLen);
    else
        QPwin03(i,:) = nanmean(FNCdyn(win03IDX',:));
    end
    
    if isempty(win04IDX)
        QPwin04(i,:) = zeros(1,nodeLen);
    else
        QPwin04(i,:) = nanmean(FNCdyn(win04IDX',:));
    end

    
end%for i
%get mean for QP
meanQPwin01 = mean(QPwin01);
meanQPwin02 = mean(QPwin02);
meanQPwin03 = mean(QPwin03);
meanQPwin04 = mean(QPwin04);
clear i win01IDX win02IDX win03IDX win04IDX


%% SZ
for i=404:545%length(subfile)
    load(subfile(i).name);
    win01IDX = find(allsubstates(i,:)==1);
    win02IDX = find(allsubstates(i,:)==2);
    win03IDX = find(allsubstates(i,:)==3);
    win04IDX = find(allsubstates(i,:)==4);
    if isempty(win01IDX)
        SZwin01(i,:) = zeros(1,nodeLen);
    else
        SZwin01(i,:) = nanmean(FNCdyn(win01IDX',:));
    end
    
    if isempty(win02IDX)
        SZwin02(i,:) = zeros(1,nodeLen);
    else
        SZwin02(i,:) = nanmean(FNCdyn(win02IDX',:));
    end
    
    if isempty(win03IDX)
        SZwin03(i,:) = zeros(1,nodeLen);
    else
        SZwin03(i,:) = nanmean(FNCdyn(win03IDX',:));
    end
    
    if isempty(win04IDX)
        SZwin04(i,:) = zeros(1,nodeLen);
    else
        SZwin04(i,:) = nanmean(FNCdyn(win04IDX',:));
    end

    
end%for i
%get mean for SZ
meanSZwin01 = mean(SZwin01);
meanSZwin02 = mean(SZwin02);
meanSZwin03 = mean(SZwin03);
meanSZwin04 = mean(SZwin04);
clear i win01IDX win02IDX win03IDX win04IDX


%% NOW get the beta coeff for each sub' each window on the 5*4=20 group-wise states
allsub_beta = [];

for i=1:length(subfile)
    load(subfile(i).name);
   
    for kk = 1:winlen
        
        betaBPwin01(kk)= corr(FNCdyn(kk,:)',meanBPwin01');
        betaBPwin02(kk)= corr(FNCdyn(kk,:)',meanBPwin02');
        betaBPwin03(kk)= corr(FNCdyn(kk,:)',meanBPwin03');
        betaBPwin04(kk)= corr(FNCdyn(kk,:)',meanBPwin04');
        
        betaDPwin01(kk)= corr(FNCdyn(kk,:)',meanDPwin01');
        betaDPwin02(kk)= corr(FNCdyn(kk,:)',meanDPwin02');
        betaDPwin03(kk)= corr(FNCdyn(kk,:)',meanDPwin03');
        betaDPwin04(kk)= corr(FNCdyn(kk,:)',meanDPwin04');
        
        betaNCwin01(kk)= corr(FNCdyn(kk,:)',meanNCwin01');
        betaNCwin02(kk)= corr(FNCdyn(kk,:)',meanNCwin02');
        betaNCwin03(kk)= corr(FNCdyn(kk,:)',meanNCwin03');
        betaNCwin04(kk)= corr(FNCdyn(kk,:)',meanNCwin04');
        
        betaQPwin01(kk)= corr(FNCdyn(kk,:)',meanQPwin01');
        betaQPwin02(kk)= corr(FNCdyn(kk,:)',meanQPwin02');
        betaQPwin03(kk)= corr(FNCdyn(kk,:)',meanQPwin03');
        betaQPwin04(kk)= corr(FNCdyn(kk,:)',meanQPwin04');
        
        betaSZwin01(kk)= corr(FNCdyn(kk,:)',meanSZwin01');
        betaSZwin02(kk)= corr(FNCdyn(kk,:)',meanSZwin02');
        betaSZwin03(kk)= corr(FNCdyn(kk,:)',meanSZwin03');
        betaSZwin04(kk)= corr(FNCdyn(kk,:)',meanSZwin04');
        
        
    end
    
    thissub_beta = [nanmean(betaBPwin01),nanmean(betaBPwin02),nanmean(betaBPwin03),nanmean(betaBPwin04)...,
        nanmean(betaDPwin01),nanmean(betaDPwin02),nanmean(betaDPwin03),nanmean(betaDPwin04)...,
    nanmean(betaNCwin01),nanmean(betaNCwin02),nanmean(betaNCwin03),nanmean(betaNCwin04)...,
    nanmean(betaQPwin01),nanmean(betaQPwin02),nanmean(betaQPwin03),nanmean(betaQPwin04)...,
    nanmean(betaSZwin01),nanmean(betaSZwin02),nanmean(betaSZwin03),nanmean(betaSZwin04)];
    allsub_beta = [allsub_beta;thissub_beta];
    
end
mkdir([pwd,filesep,'beta_results']);
cd([pwd,filesep,'beta_results']);
save allsub_beta_all allsub_beta

