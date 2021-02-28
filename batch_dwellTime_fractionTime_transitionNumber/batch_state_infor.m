%batch for dynamic FNC
%xinyuanyan
%sanp, bnu

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


for i=1:length(allsubstates)
%fraction window
fw1(i)=length(find(allsubstates(i,:)==1))/winlen;
fw2(i)=length(find(allsubstates(i,:)==2))/winlen;
fw3(i)=length(find(allsubstates(i,:)==3))/winlen;
fw4(i)=length(find(allsubstates(i,:)==4))/winlen;


%#transitions
thissub_sw(i) = 0;
for seq = 1:winlen-1
    if allsubstates(i,seq)~=allsubstates(i,seq+1)
        thissub_sw(i) = thissub_sw(i) +1;
    else
        thissub_sw(i) = thissub_sw(i) +0;
    end
end

end

%% dwell time

count_conse1 = zeros(545,winlen-1);
count_conse2 = zeros(545,winlen-1);
count_conse3 = zeros(545,winlen-1);
count_conse4 = zeros(545,winlen-1);

for i=1:length(allsubstates)

    thissub_state = allsubstates(i,:);
    
    for kk=1:length(thissub_state)-1
      
        if thissub_state(kk) ==1&& thissub_state(kk)==thissub_state(kk+1)
            count_conse1(i,kk)=1;
        end
        if thissub_state(kk) ==2&& thissub_state(kk)==thissub_state(kk+1)
            count_conse2(i,kk)=1;
        end
        if thissub_state(kk) ==3&& thissub_state(kk)==thissub_state(kk+1)
            count_conse3(i,kk)=1;
        end
        if thissub_state(kk) ==4&& thissub_state(kk)==thissub_state(kk+1)
            count_conse4(i,kk)=1;
        end
    end%for kk
    
    

end
allfw = [fw1',fw2',fw3',fw4'];
alldw = [sum(count_conse1,2),sum(count_conse2,2),sum(count_conse3,2),sum(count_conse4,2)];
allsw = thissub_sw';

dwBP = alldw(1:49,:);
dwDP = alldw(50:147,:);
dwNC = alldw(148:351,:);
dwQP = alldw(352:403,:);
dwSZ = alldw(404:545,:);
dw_disorder = [dwBP;dwDP;dwQP;dwSZ];

fwBP = allfw(1:49,:);
fwDP = allfw(50:147,:);
fwNC = allfw(148:351,:);
fwQP = allfw(352:403,:);
fwSZ = allfw(404:545,:);
fw_disorder = [fwBP;fwDP;fwQP;fwSZ];

swBP = allsw(1:49,:);
swDP = allsw(50:147,:);
swNC = allsw(148:351,:);
swQP = allsw(352:403,:);
swSZ = allsw(404:545,:);
sw_disorder = [swBP;swDP;swQP;swSZ];


%plot
figurename = {'dw1';'dw2';'dw3';'dw4';'fw1';'fw2';'fw3';'fw4';'sw'};
gtdata = [alldw,allfw,allsw];
for kk=1:length(figurename)
meanvalBP = mean(gtdata(1:49,kk));
meanvalDP = mean(gtdata(50:147,kk));
meanvalNC = mean(gtdata(148:351,kk));
meanvalQP = mean(gtdata(352:403,kk));
meanvalSZ = mean(gtdata(404:545,kk));
stdvalBP = std(gtdata(1:49,kk))/sqrt(length(gtdata(1:49,kk)));
stdvalDP = std(gtdata(50:147,kk))/sqrt(length(gtdata(50:147,kk)));
stdvalNC = std(gtdata(148:351,kk))/sqrt(length(gtdata(148:351,kk)));
stdvalQP = std(gtdata(352:403,kk))/sqrt(length(gtdata(352:403,kk)));
stdvalSZ = std(gtdata(404:545,kk))/sqrt(length(gtdata(404:545,kk)));
meanval = [meanvalBP,meanvalDP,meanvalNC,meanvalQP,meanvalSZ];
stdval = [stdvalBP,stdvalDP,stdvalNC,stdvalQP,stdvalSZ];
figure();
h=bar(meanval);
  ch = get(h,'children');
   set(gca,'XTickLabel',{'BP','DP','NC','QP','SZ'});
   set(gca,'FontSize',10);
   set(ch,'FaceVertexCData',[249/255 64/255 64/255;128/255 128/255 128/255;1 1 1; 0 192/255 0; 173/255 7/255 227/255])
hold on;
errorbar(meanval,stdval,'k','LineStyle','none');
title(figurename{kk,1});



%save
print('-dpng','-r600',figurename{kk,1});
end