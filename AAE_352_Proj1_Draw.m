%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This Function takes a wing object as an input and plots the wing object
% by taking into account materials, thicknesses, and areas for stringers,
% skins, and potentially spars.
% AAE 352 Project 1: Group 11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function AAE_352_Proj1_Draw(wing)
drawstructure(wing)
end


function drawstructure(wing)
%This function takes the AAE 352 Project 1 Wing and converts it to a
%drawable format

%NOTE: Position origin from wing subclass is located at (.375,0) in
%plotwing function

%stringer_x_val, stringer_y_val, stringer_area, stringer_material
%Start with Predefined guaranteed stringers
stringer_x_val(1) = wing.stringer1.position(1);
stringer_y_val(1) = wing.stringer1.position(2);
stringer_area(1) = wing.stringer1.area;
stringer_material(1) = wing.stringer1.material.type;
stringer_x_val(2) = wing.stringer2.position(1);
stringer_y_val(2) = wing.stringer2.position(2);
stringer_area(2) = wing.stringer2.area;
stringer_material(2) = wing.stringer2.material.type;
stringer_x_val(3) = wing.stringer3.position(1);
stringer_y_val(3) = wing.stringer3.position(2);
stringer_area(3) = wing.stringer3.area;
stringer_material(3) = wing.stringer3.material.type;
stringer_x_val(4) = wing.stringer4.position(1);
stringer_y_val(4) = wing.stringer4.position(2);
stringer_area(4) = wing.stringer4.area;
stringer_material(4) = wing.stringer4.material.type;
stringer_x_val(5) = wing.stringer5.position(1);
stringer_y_val(5) = wing.stringer5.position(2);
stringer_area(5) = wing.stringer5.area;
stringer_material(5) = wing.stringer5.material.type;
stringer_x_val(6) = wing.stringer6.position(1);
stringer_y_val(6) = wing.stringer6.position(2);
stringer_area(6) = wing.stringer6.area;
stringer_material(6) = wing.stringer6.material.type;
stringer_x_val(7) = wing.stringer7.position(1);
stringer_y_val(7) = wing.stringer7.position(2);
stringer_area(7) = wing.stringer7.area;
stringer_material(7) = wing.stringer7.material.type;
stringer_x_val(8) = wing.stringer8.position(1);
stringer_y_val(8) = wing.stringer8.position(2);
stringer_area(8) = wing.stringer8.area;
stringer_material(8) = wing.stringer8.material.type;

%Then define the stringers that are used in the wing
for s = (wing.skin_tl.stringers)
    stringer_x_val = [stringer_x_val, s.position(1)];
    stringer_y_val = [stringer_y_val, s.position(2)];
    stringer_area = [stringer_area, s.area];
    stringer_material = [stringer_material, s.material.type];
end

for s = (wing.skin_tm.stringers)
    stringer_x_val = [stringer_x_val, s.position(1)];
    stringer_y_val = [stringer_y_val, s.position(2)];
    stringer_area = [stringer_area, s.area];
    stringer_material = [stringer_material, s.material.type];
end

for s = (wing.skin_tr.stringers)
    stringer_x_val = [stringer_x_val, s.position(1)];
    stringer_y_val = [stringer_y_val, s.position(2)];
    stringer_area = [stringer_area, s.area];
    stringer_material = [stringer_material, s.material.type];
end

for s = (wing.skin_bl.stringers)
    stringer_x_val = [stringer_x_val, s.position(1)];
    stringer_y_val = [stringer_y_val, s.position(2)];
    stringer_area = [stringer_area, s.area];
    stringer_material = [stringer_material, s.material.type];
end

for s = (wing.skin_bm.stringers)
    stringer_x_val = [stringer_x_val, s.position(1)];
    stringer_y_val = [stringer_y_val, s.position(2)];
    stringer_area = [stringer_area, s.area];
    stringer_material = [stringer_material, s.material.type];
end

for s = (wing.skin_br.stringers)
    stringer_x_val = [stringer_x_val, s.position(1)];
    stringer_y_val = [stringer_y_val, s.position(2)];
    stringer_area = [stringer_area, s.area];
    stringer_material = [stringer_material, s.material.type];
end

for s = (wing.web_l.stringers)
    stringer_x_val = [stringer_x_val, s.position(1)];
    stringer_y_val = [stringer_y_val, s.position(2)];
    stringer_area = [stringer_area, s.area];
    stringer_material = [stringer_material, s.material.type];
end

for s = (wing.web_r.stringers)
    stringer_x_val = [stringer_x_val, s.position(1)];
    stringer_y_val = [stringer_y_val, s.position(2)];
    stringer_area = [stringer_area, s.area];
    stringer_material = [stringer_material, s.material.type];
end

%skin_thickness skin_material
% Skin numbering starts at top, far right, going counter clockwise
skin_thickness(1) = wing.skin_tr.thickness;
skin_material(1) = wing.skin_tr.material.type;
skin_thickness(2) = wing.skin_tm.thickness;
skin_material(2) = wing.skin_tm.material.type;
skin_thickness(3) = wing.skin_tl.thickness;
skin_material(3) = wing.skin_tl.material.type;
skin_thickness(4) = wing.web_l.thickness;
skin_material(4) = wing.web_l.material.type;
skin_thickness(5) = wing.skin_bl.thickness;
skin_material(5) = wing.skin_bl.material.type;
skin_thickness(6) = wing.skin_bm.thickness;
skin_material(6) = wing.skin_bm.material.type;
skin_thickness(7) = wing.skin_br.thickness;
skin_material(7) = wing.skin_br.material.type;
skin_thickness(8) = wing.web_r.thickness;
skin_material(8) = wing.web_r.material.type;

%Potential Future improvements: Adding Dummy Variables until then
%weblocation_x
weblocation_x = [];
%web_thickness
web_thickness = [];
%web_material
web_material = [];

%Fix Position Issues
stringer_x_val = stringer_x_val + .4;
%weblocation_x = weblocation_x + .4;

%Call Plotwing Function
plotwing(stringer_x_val, stringer_y_val,stringer_area, stringer_material, skin_thickness, skin_material, weblocation_x, web_thickness,web_material);
end

function plotwing(stringer_x_val, stringer_y_val,stringer_area, stringer_material, skin_thickness, skin_material, weblocation_x, web_thickness,web_material)
%This function plots the AAE 352 Project 1 wing with user defined
%stringer locations and areas, skin thicknesses, and spar thicknesses and
%locations
%Example:
%plotwing([1.15, .75, 0, -.35], [.06, .11, .11, .08],[.0001, .0002, .0003, .0004], [1, 2, 3, 4], [.001,.002,.003,.01,.001,.002,-.004,.002], [1,2,3,4,5,1,2,3], [-.2,.2,.8], [.005, .01, .012],[1, 2, 3]);
stringer_radii = (stringer_area./pi).^(.5); %convert area to radius

%BEGIN PLOT WING*******************************************************
hold on
% Skin numbering starts at top, far right, going counter clockwise
%Skin#:   1    2    3    4      5     6     7     8
A = [1.15,  .75,   0, -.35, -.35,    0,  .75, 1.15, 1.15]; %X Coordinates
B = [.06,   .11, .11,  .08, -.08, -.11, -.11, -.06,  .06]; %Y Coordinates
%%This section is to plot an airfoil of a static thickness
% % for i = [1:10]
% %     line(A,B,'LineStyle', '-','LineWidth',4); %plot airfoil
% % end

for i = 2:9 %9 skins
    drawlines([A(i-1),A(i)],[B(i-1),B(i)],skin_thickness(i-1),colorswitch(skin_material(i-1)));
end
hold on
plot(0,0,'b*') %This is the Aerodynamic Center
%END PLOT WING*********************************************************
grid on
%BEGIN PLOT STRINGERS**************************************************
if (length(stringer_x_val) == length(stringer_y_val))
    for i=1:length(stringer_x_val)
         figure(1)
         %plot(stringer_x_val(i),stringer_y_val(i),'r*'); %This plots Points
         viscircles([stringer_x_val(i),stringer_y_val(i)],stringer_radii(i),'Color',colorswitch(stringer_material(i))); %This plots circles
    end
else
    fprintf('INVALID INPUT! Dimensions Must Match\n')
end
%END PLOT STRINGERS***************************************************

%BEGIN PLOT WEBS******************************************************
% % line([.75,.75],[.11,-.11],'LineStyle', '-','LineWidth',4)%plot web
% % line([0,0],[.11,-.11],'LineStyle', '-','LineWidth',4) %plot web
if (isempty(weblocation_x) == 0)
    for i = 1:length(weblocation_x)
        xloc = weblocation_x(i);
        if (xloc < -.35)
            fprintf('INVALID WEB! Not on wing!')
        elseif (xloc >= -.35) && (xloc < 0)
            drawlines([xloc,xloc],[.0857*xloc+.11,-.0857*xloc-.11],web_thickness(i),colorswitch(web_material(i))); %Left section
        elseif (xloc >= 0) && (xloc <= .75)
            drawlines([xloc,xloc],[.11,-.11],web_thickness(i),colorswitch(web_material(i))); %middle section
        elseif (xloc > .75) && (xloc <= 1.15)
            drawlines([xloc,xloc],[-.125*(xloc-.75)+.11,.125*(xloc-.75)-.11],web_thickness(i),colorswitch(web_material(i))); %right section
        else
            fprintf('INVALID WEB! Not on wing!');
        end
    end
end
%END PLOT WEBS*******************************************************

axis equal %make circles instead of ovals

end

function colorstr = colorswitch(colorval) 
%This function Takes material value (int) and converts to a color (str) for
%5 colors
    switch colorval
        case 1
            colorstr = 'red';
        case 2
            colorstr = 'green';
        case 3
            colorstr = 'yellow';
        case 4
            colorstr = 'blue';
        otherwise
            colorstr = 'magenta';
    end
end

function drawlines(line_x, line_y, thickness,colorstr)
%This function draws lines of a user defined thickness and color
%line_x = [x1,x2]; line_y = [y1,y2]; thickness (meters)
x1 = line_x(1); x2 = line_x(2);
y1 = line_y(1); y2 = line_y(2);
theta = atand((y2-y1)/(x2-x1));
x1_prime = x1-(thickness*cosd(90-theta));
x2_prime = x1_prime + (x2-x1);
y1_prime = y1+(thickness*sind(90-theta));
y2_prime = y1_prime + (y2-y1);
x_pat = [x1,x1_prime,x2_prime,x2];
y_pat = [y1,y1_prime,y2_prime,y2];

patch(x_pat, y_pat, colorstr, 'EdgeAlpha',0);
end