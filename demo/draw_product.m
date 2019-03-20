function [ output_args ] = draw_product( product_size, x, y, z, points )
%DRAW_PRODUCT Summary of this function goes here
%   Detailed explanation goes here
c_product = [.0 .45 .74 .1];
c_section = [.0 .45 .74 .3];

% Create figure
figure1 = figure;
axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
view(axes1,[-29 38]);
hold(axes1,'on');

draw_cube([0 0 0], product_size, c_product);
draw_cut_x(x, product_size(2), product_size(3), c_section);
draw_cut_y(product_size(1), y, product_size(3), c_section);
draw_cut_z(product_size(1), product_size(2), z, c_section);

hold on;
s_points = size(points);
points_z(1:s_points(1)) = 0;
plot31 = plot3(points(:, 1), points(:, 2), points_z, 'LineStyle', 'none');
set(plot31(1),'Marker','o','LineWidth',3,'Color',[0.0784313753247261 0.168627455830574 0.549019634723663]);

view(axes1,[-33 16]);
axis equal;
end

