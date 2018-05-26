% Converting gray image to binary image
% Reading an image (gray)
a=imread('ppv.jpg');
a=rgb2gray(a);

% converting to binary image
[r,c]=size(a);
b=zeros(r,c);
for i=1:r
    for j=1:c
        if(a(i,j)<128) b(i,j)=0;
        else b(i,j)=1;
        end
    end
end
subplot(1,2,1); imshow(a);title('Gray image');
subplot(1,2,2); imshow(b);title('Binary image');