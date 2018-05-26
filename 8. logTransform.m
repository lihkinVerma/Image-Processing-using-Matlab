% reading an image
a=imread('ppv.jpg');
cons=input('enter constant value(as c*log(1+r)) : ');

% applying log transformation
a=double(a);
[r,c,k]=size(a);
b=zeros(r,c,k);
for i=1:r
    for j=1:c
        for l=1:k
            b(i,j,l)=cons*log(a(i,j,l)+1);
        end
    end
end

subplot(1,2,1); imshow(uint8(a));title('original image');
subplot(1,2,2); imshow(uint8(b));title('logTransformed image');