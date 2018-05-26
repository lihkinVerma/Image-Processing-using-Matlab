I1 = imread('ppv.jpg');
subplot(1,3,1);
imshow(I1);
title('Original Image');
I2=imnoise(I1,'salt & pepper',0.01);
subplot(1,3,2);
imshow(uint8(I2));
title('Salt & pepper noise');
% logically
a=double(I2);
r=size(I1,1);
c=size(I1,2);
I3=zeros(r,c,3);
for i=2:(r-1)
    for j=2:(c-1)
        for k=1:3
            I3(i,j,k)=a(i,j,k)*(4)+a(i-1,j,k)*(-1)+a(i,j-1,k)*(-1)+a(i,j+1,k)*(-1)+a(i+1,j,k)*(-1);
       end
    end
end
subplot(1,3,3);
imshow(uint8(I3));
title('Applying laplacian filter');
