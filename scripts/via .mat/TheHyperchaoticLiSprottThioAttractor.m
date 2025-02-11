% Li, C., Sprott, J. C., & Thio, W. (2014). Bistability in a hyperchaotic system with a line equilibrium. Journal of Experimental and Theoretical Physics, 118(3), 494–500. doi:10.1134/s1063776114030121 

clear
close
clc

load("TheHyperchaoticLiSprottThioAttractor.mat")

set(groot, "defaultAxesTickLabelInterpreter", "latex");
set(groot, "defaultTextInterpreter", "latex");
set(groot, "defaultLegendInterpreter", "latex");
set(groot, "defaultColorbarTickLabelInterpreter", "latex");

figure;
scatter3(xsol(:, 1), xsol(:, 2), xsol(:, 3), 4, 1:length(t), 'filled');
view([-38.76 23.04])
colormap gray;
colorbar;
axis tight;
grid on;
box on;
xlabel('$x_1$', 'FontSize', 14);
ylabel('$x_2$', 'FontSize', 14);
zlabel('$x_3$', 'FontSize', 14);
title(['The Hyperchaotic Li---Sprott---Thio Attractor' "$x_1x_2x_3$-projection"], 'FontSize', 15.5);

% exportgraphics(gcf, "images_png/The_Hyperchaotic_Li_Sprott_Thio_Attractor_x1x2x3_projection.png", 'Resolution', 1200)
% exportgraphics(gcf, "images_pdf/The_Hyperchaotic_Li_Sprott_Thio_Attractor_x1x2x3_projection.pdf", "ContentType", "vector")
% exportgraphics(gcf, "images_eps/The_Hyperchaotic_Li_Sprott_Thio_Attractor_x1x2x3_projection.eps", "ContentType", "vector")
% print(gcf, "images_svg/The_Hyperchaotic_Li_Sprott_Thio_Attractor_x1x2x3_projection.svg", "-dsvg")
% save("workspace/TheHyperchaoticLiSprottThioAttractor.mat")

% combinations = nchoosek(1 : length(incond), 2);
% videoFile = 'gifs/The_Hyperchaotic_Li_Sprott_Thio_Attractor_2D_projections.gif';
% 
% for i = 1 : length(combinations)
%     figure;
%     scatter(xsol(:, combinations(i, 1)), xsol(:, combinations(i, 2)), 4, 1:length(t), 'filled');
%     title(['The Hyperchaotic Li---Sprott---Thio Attractor' sprintf("$x_%ix_%i$-projection",  combinations(i, 1),  combinations(i, 2))], 'FontSize', 15.5);
%     xlabel(sprintf("$x_%i$", combinations(i, 1)), 'FontSize', 14);
%     ylabel(sprintf("$x_%i$", combinations(i, 2)), 'FontSize', 14);
%     colormap gray;
%     colorbar;
%     axis tight;
%     grid on;
%     box on;
% 
%     img_gray = rgb2gray(frame2im(getframe(gcf)));
% 
%     if i == 1
%         imwrite(img_gray, videoFile, 'gif', 'LoopCount', inf, 'DelayTime', 1);
%     else
%         imwrite(img_gray, videoFile, 'gif', 'WriteMode', 'append', 'DelayTime', 1);
%     end
%     close(gcf);
% end