% reading an image
a=imread('ppv.jpg');

% reading an image
a=imread('ppv.jpg');
smax=input('enter smax value : ');
smin=input('enter smin value : ');
rmax=255;
rmin=0;

% applying log transformation
a=double(a);
[r,c,k]=size(a);
b=zeros(r,c,k);
for i=1:r
    for j=1:c
        for l=1:k
                b(i,j,l)=smin+(smax-smin)*a(i,j,l)/(rmax-rmin);
        end
    end
end

subplot(1,2,1); imshow(uint8(a));title('original image');
subplot(1,2,2); imshow(uint8(b));title('contrast Streched image');