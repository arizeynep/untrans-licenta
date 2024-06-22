clear all 
%
Be = 0.75; %0.75
Bde = 0.75; %0.75
%
Kp_urc_phi = 0.036; %0.036
Ki_urc_phi = 8.8988; %0.8988
%
Kp_ulc_phi = 0.0371; %0.0371
Ki_ulc_phi = 0.9269; %0.9269
%
ki_phi_FT1 = 200; %0.01
%
eta_phi_urc = 20; %1
eta_phi_ulc = 10; %0.5
%
EM_phi = 0.75; %250
%
delta_phi=[Be Bde eta_phi_urc eta_phi_ulc Ki_urc_phi Kp_urc_phi Ki_ulc_phi Kp_ulc_phi ki_phi_FT1 EM_phi];
% delta_phi=deltam_phi;
%
a=newfis('regPI','sugeno');
a=addvar(a,'input','ephi',[-2*Be 2*Be]);
a=addmf(a,'input',1,'Nm','trapmf' ,[-2*Be -2*Be -Be 0]);
a=addmf(a,'input',1,'Ze','trimf' ,[-Be 0 Be]);
a=addmf(a,'input',1,'Pm','trapmf' ,[0 Be 2*Be 2*Be]);
%  plotmf(a,'input',1)
%  pause
a=addvar(a,'input','dephi',[-2*Bde 2*Bde]);
a=addmf(a,'input',2,'Nm','trapmf' ,[-2*Bde -2*Bde -Bde 0]);
a=addmf(a,'input',2,'Ze','trimf' ,[-Bde 0 Bde]);
a=addmf(a,'input',2,'Pm','trapmf' ,[0 Bde 2*Bde 2*Bde]);
% plotmf(a,'input',2)
% pause
a=addvar(a,'output','dukr_phi',[0 1]);
a=addmf(a,'output',1,'unu' ,'linear',eta_phi_urc*[Ki_urc_phi Kp_urc_phi 0]);
a=addmf(a,'output',1,'doi','linear',eta_phi_ulc*[Ki_ulc_phi Kp_ulc_phi 0]);
%
a=addvar(a,'output','dukl_phi',[0 1]);
a=addmf(a,'output',2,'unu' ,'linear',eta_phi_ulc*[Ki_urc_phi Kp_urc_phi 0]);
a=addmf(a,'output',2,'doi','linear',eta_phi_urc*[Ki_ulc_phi Kp_ulc_phi 0]);
%
ListaReguli=[1 1 1 1 1 1
		     1 2 1 2 1 1
             1 3 2 1 1 1
			 2 1 2 2 1 1
		     2 2 1 1 1 1
             2 3 1 2 1 1
             3 1 2 1 1 1
		     3 2 2 2 1 1
             3 3 2 1 1 1   ];
assignin('base','ListaReguli',ListaReguli)
a=addrule(a,ListaReguli);assignin('base','a',a)
writefis(a,'regPI');assignin('base','a',a)

