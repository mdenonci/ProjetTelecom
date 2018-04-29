% RAY-TRACING

clear all;
format long;

eps_0 = (1e-9/(36*pi));
c = 300000000;

frequency = 245e+09;
pulsation = 2*pi*frequency;

wall_list = []; %Crée une liste des murs, qui sera utile pour passer chaque interaction en revue
xspace = 60; %Dimensions de l'espace
yspace = 60;
space = zeros(yspace,xspace); %Création d'une matrice qui va contenir les puissances pour chaque élement de surface
w1 = wall(1,20,20,6,0.01,eps_0,pulsation); %Créations d'objets "murs"
w2 = wall(1,10,10,6,0.01,eps_0,pulsation);
wall_list = [wall_list w1 w2]; %Rajout des nouveaux murs à la liste
emitter_pos = [15,15]; %Position de l'émetteur
GTX = 15; %Caractéristiques de l'émetteur
PTX = 15;
for walls = wall_list
    space(walls.y_pos,walls.x_pos) = 0; %Met à zéro les élements de l'espace correspondant aux murs - c'est le seul moyen que j'ai trouvé pour les afficher, c'est un peu moche
end
space(emitter_pos(2),emitter_pos(1)) = 0; %idem pour l'émetteur
wave1 = wave(); %Création d'onde - sert à rien pour le moment
waves = [wave1];
beta = pulsation/c;

for i = 1:1:size(waves) %pour chaque onde (ne sert à rien pour le moment)
    wav = waves(i);
    for y_s = 1:1:yspace
        for x_s = 1:1:xspace  %Parcours tous les éléments de surface de l'espace
            if (x_s == emitter_pos(1) && y_s == emitter_pos(2))
                P = 0; %Si c'est l'émetteur on met à zéro, toujours pour garder la visibilité (mais toujours un peu moche)
            else
                d = sqrt((emitter_pos(2)-y_s)^2 + (emitter_pos(1)-x_s)^2); %Calcul de la distance entre le point de mesure et l'émetteur
                P = (abs(sqrt(60*GTX*PTX)*(exp(-j*beta*d))/d)^2)/(2*120*pi); %Calcul de la puissance transmise DIRECTEMENT
                
                % AJOUT DE LA PUISSANCE DUE A UNE PREMIERE REFLEXION (n'est utile qu'avec les murs externes ==> c'est donc pas utile du tout, j'ai une nouvelle version qui ne l'utilise plus)
                
                P = P+reflexion_1(emitter_pos(1),emitter_pos(2),x_s,y_s, xspace,yspace,GTX,PTX,beta);
                
                %Pour chaque mur "indépendants" - calcul de la reflexion (première reflexion)
                for ind_wall = wall_list
                    P = P+ reflexion_1_on_ind_walls(emitter_pos(1),emitter_pos(2),x_s,y_s,ind_wall.x_pos,ind_wall.y_pos,GTX,PTX,beta);
                end
            end
            %Place la valeur de puissance dans la matrice qui garde tout ça
            space(y_s,x_s) = space(y_s,x_s)+ P;
        end
    end
end

for(wa = wall_list)
    space(wa.y_pos,wa.x_pos) = 0;%Remet à zéro les murs -> pour la visibilité
end
%% 

% Le reste n'est que du code pour l'affichage

map = [0,0,128;
2,3,130;
4,7,131;
5,10,133;
7,14,134;
9,17,136;
11,20,138;
13,24,139;
14,27,141;
16,31,142;
18,34,144;
20,37,145;
22,41,147;
23,44,148;
25,48,150;
27,51,151;
29,54,153;
30,58,154;
32,61,156;
34,64,158;
36,68,159;
38,71,161;
39,75,162;
41,78,164;
43,81,165;
45,85,167;
47,88,168;
48,92,170;
50,95,171;
52,98,173;
54,102,174;
56,105,176;
57,109,178;
59,112,179;
61,115,181;
63,119,182;
65,122,184;
66,126,185;
68,129,187;
70,132,188;
72,136,190;
74,139,191;
75,143,193;
77,146,194;
79,149,196;
81,153,198;
83,156,199;
84,160,201;
86,163,202;
88,166,204;
90,170,205;
91,173,207;
93,176,208;
95,180,210;
97,183,211;
99,187,213;
100,190,214;
102,193,216;
104,197,218;
106,200,219;
108,204,221;
109,207,222;
111,210,224;
113,214,225;
115,216,226;
117,217,224;
119,217,222;
121,218,220;
124,218,218;
126,219,216;
128,219,214;
130,220,212;
132,220,210;
134,221,208;
136,221,206;
139,221,204;
141,222,203;
143,222,201;
145,223,199;
147,223,197;
149,224,195;
152,224,193;
154,225,191;
156,225,189;
158,225,187;
160,226,185;
162,226,183;
165,227,181;
167,227,179;
169,228,177;
171,228,175;
173,229,173;
175,229,171;
177,229,169;
180,230,167;
182,230,165;
184,231,163;
186,231,162;
188,232,160;
190,232,158;
193,233,156;
195,233,154;
197,234,152;
199,234,150;
201,234,148;
203,235,146;
206,235,144;
208,236,142;
210,236,140;
212,237,138;
214,237,136;
216,238,134;
218,238,132;
221,238,130;
223,239,128;
225,239,126;
227,240,124;
229,240,122;
231,241,121;
234,241,119;
236,242,117;
238,242,115;
240,242,113;
242,243,111;
244,243,109;
247,244,107;
249,244,105;
251,245,103;
252,245,102;
252,244,101;
252,243,100;
252,242,99;
252,241,99;
252,241,98;
252,240,97;
252,239,96;
252,238,96;
252,237,95;
252,237,94;
252,236,93;
253,235,92;
253,234,92;
253,233,91;
253,233,90;
253,232,89;
253,231,89;
253,230,88;
253,229,87;
253,229,86;
253,228,86;
253,227,85;
253,226,84;
253,225,83;
253,225,83;
253,224,82;
253,223,81;
253,222,80;
253,221,79;
253,221,79;
253,220,78;
253,219,77;
254,218,76;
254,217,76;
254,217,75;
254,216,74;
254,215,73;
254,214,73;
254,213,72;
254,213,71;
254,212,70;
254,211,70;
254,210,69;
254,209,68;
254,209,67;
254,208,66;
254,207,66;
254,206,65;
254,205,64;
254,205,63;
254,204,63;
254,203,62;
255,202,61;
255,201,60;
255,201,60;
255,200,59;
255,199,58;
255,198,57;
255,197,57;
255,197,56;
255,196,55;
255,195,54;
255,194,54;
255,192,53;
255,190,52;
255,188,51;
255,186,50;
255,184,49;
255,182,49;
255,180,48;
255,178,47;
255,175,46;
255,173,45;
255,171,44;
255,169,44;
255,167,43;
255,165,42;
255,163,41;
255,161,40;
255,158,40;
255,156,39;
255,154,38;
255,152,37;
255,150,36;
255,148,35;
255,146,35;
255,144,34;
255,141,33;
255,139,32;
255,137,31;
255,135,30;
255,133,30;
255,131,29;
255,129,28;
255,127,27;
255,124,26;
255,122,25;
255,120,25;
255,118,24;
255,116,23;
255,114,22;
255,112,21;
255,110,21;
255,108,20;
255,105,19;
255,103,18;
255,101,17;
255,99,16;
255,97,16;
255,95,15;
255,93,14;
255,91,13;
255,88,12;
255,86,11;
255,84,11;
255,82,10;
255,80,9;
255,78,8;
255,76,7;
255,74,7;
255,71,6;
255,69,5;
255,67,4;
255,65,3;
255,63,2;
255,61,2;
255,59,1]/255;
    
space = [[space zeros(size(space,1),1)] ; zeros(1,size(space,2)+1)];
colormap(map);
fig = pcolor(space);
set(fig,'EdgeColor', 'none');
colorbar;
grid off;
caxis([0 0.5])
