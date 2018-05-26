% reading an image
a=imread('ppv.jpg');
g=input('enter gamma for transformation : ');

% applying log transformation
a=double(a);
[r,c,k]=size(a);
b=zeros(r,c,k);
for i=1:r
    for j=1:c
        for l=1:k
            b(i,j,l)=power(a(i,j,l),g);
        end
    end
end

subplot(1,2,1); imshow(uint8(a));title('original image');
subplot(1,2,2); imshow(uint8(b));title('Gamma-Transformed image');