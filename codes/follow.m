function follow(bin,arduino)

    bw=logical(bin); %% dont know if it will work
    stats=regionprops(bw, 'BoundingBox', 'Centroid','Area');
   
    hold on
        bb = stats.BoundingBox;
        bc = stats.Centroid;
        rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
        plot(bc(1),bc(2), '-m+')
        a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
        moveBot( round(bc(1)) ,arduino);
     hold off

end