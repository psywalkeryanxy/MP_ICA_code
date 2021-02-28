%batch for the network properties
%xinyuanyan
%sanp lab
%for the weighted network analysis
%code based on BCT
%---------------------
%the indices included:
%
%clustering coeff
%distance (shortest path)
%degree
%density
%diffusion_efficiency
%edge betweenness
%global efficiency
%local efficiency
%eigenvector_centrality_und
%modularity_und
%mean_first_passage_time
%local_assortativity_wu_sign
%
%
%
%
%
%
function [results] = NetworkAnalysisYan_wei(i,W)

%clustering coeff

results{i,1}.clus_coef = clustering_coef_wu(W);

%distance (shortest path)
L = weight_conversion(W,'lengths');
results{i,1}.distanc = distance_wei(L);

%degree
results{i,1}.degree = degrees_und(W);

%density
results{i,1}.density = density_und(W);

%diffusion_efficiency
%results{i,1}.diffu_effi = diffusion_efficiency(W);

%edge betweenness
results{i,1}.edge_betw = edge_betweenness_wei(L);

%global efficiency
results{i,1}.gE = efficiency_wei(W,0);

%local efficiency
results{i,1}.lE = efficiency_wei(W,2);


% %eigenvector_centrality_und
% eigenvector_centrality_und(CIJ);

%modularity_und

[results{i,1}.Ci,results{i,1}.Q]=modularity_und(W);%
results{i,1}.P = participation_coef(W,results{i,1}.Ci,0);
%mean_first_passage_time
%HOLD ON FOR THIS INDEX

%local_assortativity_wu_sign

[results{i,1}.loc_assor_pos,results{i,1}.loc_assor_neg]=local_assortativity_wu_sign(W);




















return