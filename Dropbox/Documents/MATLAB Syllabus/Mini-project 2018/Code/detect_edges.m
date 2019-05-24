function [ output_image ] = detect_edges( input_image )

%activity2 - detects edges of image

%dimensions of input image
[sx, sy]=size(input_image);

%preallocation - populate output matrix with zeros
output_image=zeros(sx-2, sy-2);

for ix=1:sx-2
    for iy=1:sy-2
        for j=0:2
            for i=0:2
                out_horizontal(ix, iy)=abs(input_image(ix, iy)-input_image(ix+1, iy));
            end
            out_vertical(ix, iy)=abs(input_image(ix, iy)-input_image(ix, iy+1));
        end
        output_image(ix, iy)=((out_horizontal(ix, iy))+(out_vertical(ix, iy)))/2;
    end
end

