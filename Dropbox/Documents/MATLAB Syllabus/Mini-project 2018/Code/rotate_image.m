function [output_image] = rotate_image(input_image, theta)
   
    % Define the tranformation matrix
    theTransform = inv([cos(theta) sin(theta);...
                       -sin(theta) cos(theta)]); 
    
    % Get size of input image
    [ny, nx] = size(input_image); 
    
    % Determine centre of input image
    xCent = round(nx/2); yCent = round(ny/2); 
    
    % Preallocate output image
    output_image = zeros(ny, nx); 
    
    % Preallocate source pixel
    src = zeros(2, 1); 
    
    % Loop through each pixel of input output image and find
    % coordinates of input image for source pixel
    for ix = 1: nx 
        for iy = 1: ny 
            src=round(theTransform*([ix; iy]-[xCent; yCent])+...
                                             [xCent; yCent]); 
            xSrc = src(1); 
            ySrc = src(2);
        
            % Check if source coordinates are valid
            if (~(xSrc<1 || ySrc<1 || xSrc>nx || ySrc>ny))
                output_image(iy, ix) = input_image(ySrc, xSrc); 
            end
        end
    end
end