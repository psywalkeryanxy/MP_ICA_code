%batch for dynamic FNC
%xinyuanyan


clear all; close;
%get the states information
load('mp_dfnc.mat');
load('mp_dfnc_post_process.mat');


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
    
    %% begin calculation
    
    %% FC
    allsub.FC(i,1)=nanmean(sub_stateFC{i,1});
    allsub.FC(i,2)=nanmean(sub_stateFC{i,2});
    allsub.FC(i,3)=nanmean(sub_stateFC{i,3});
    allsub.FC(i,4)=nanmean(sub_stateFC{i,4});
    
    %% graph theory related indices
    
    for whichstate = 1:4
        
        if isnan(allsub.FC(i,whichstate))
            
            allsub.locE(i,whichstate)=nan;
            allsub.gE(i,whichstate) = nan;
            allsub.Q(i,whichstate) = nan;
            
        else
            cordata = squareform(sub_stateFC{i,whichstate});
            %normalized the weighted matrix
            
            W = weight_conversion(cordata,'normalize');
            %replace weight<0 with 0
            W(find(W<=0))=0;
            %calculate the graph indices
            [resu_output] = NetworkAnalysisYan_wei(i,W);
            
            
            allsub.locE(i,whichstate) = nanmean(resu_output{i,1}.lE);
            allsub.gE(i,whichstate) = resu_output{i,1}.gE;
            allsub.Q(i,whichstate) =resu_output{i,1}.Q;
            
        end%if
        
    end%for whichstate = 1:4
    
end%for i
