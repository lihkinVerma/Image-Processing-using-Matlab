% finding mirror image
% reading an image
a= imread('ppv.jpg');

% mirroring an image vertically
[r,c,k]=size(a);
b=zeros(r,c,k);
for i=1:r
    for j=1:c
        for l=1:k
            b(i,j,l)=a(i,c-j+1,l);
        end
    end
end

% mirroring an image horizontally
[r,c,k]=size(a);
d=zeros(r,c,k);
for i=1:r
    for j=1:c
        for l=1:k
            d(i,j,l)=a(r-i+1,j,l);
        end
    end
end

subplot(2,2,1); imshow(a);title('original image');
subplot(2,2,2); imshow(uint8(b));title('Vertical Mirror');
subplot(2,2,3); imshow(uint8(d));title('Horizontal Mirror');

