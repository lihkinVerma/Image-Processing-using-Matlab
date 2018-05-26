% finding complement of an image
% reading an image
a=imread('ppv.jpg');
a=rgb2gray(a);

% finding complimaent of image
[r,c]=size(a);
b=zeros(r,c);
for i=1:r
    for j=1:c
        b(i,j)=255-a(i,j);
    end
end

subplot(1,2,1); imshow(a);title('original image');
subplot(1,2,2); imshow(uint8(b));title('complemented image');