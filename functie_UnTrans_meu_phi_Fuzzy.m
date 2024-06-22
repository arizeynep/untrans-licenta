function J=functie_UnTrans_meu_phi_Fuzzy(delta_phi)
%
const_UnTrans_FT1_phi_e_de_fara_i;
%
sim('schema_modelNL_RG_FT1_phi_e_de_cu_i_j1')
%
J=1/length(e_phi_sim_j1(:,1))*((e_phi_sim_j1(:,1))'*(e_phi_sim_j1(:,1)));
