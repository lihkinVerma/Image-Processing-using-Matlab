% reading an image
a=imread('ppv.jpg');

% enter crop parameters
b=input('enter crop parameter x-start : ');
c=input('enter crop parameter x-end : ');
d=input('enter crop parameter y-start : ');
e=input('enter crop parameter y-end : ');

[r,co,k]=size(a);
x=c-b;
y=e-d;
new=zeros(x,y,k);
for i=1:x
    for j=1:y
        for l=1:k
            new(i,j,l)=a(b+i-1,d+j-1,l);
        end
    end
end
subplot(1,2,1); imshow(a);title('original image');
subplot(1,2,2); imshow(uint8(new));title('cropped image');

