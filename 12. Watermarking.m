
% reading an image
a=imread('ppv.jpg');
a=rgb2gray(a);
b=imread('pp.JPG');
b=rgb2gray(b);

% watermark embedding and tempering on image
[r,c]=size(a);
b=imresize(b,[r,c]);
co=im2bw(b);

wtem=bitset(a,6,co);

subplot(1,3,1); imshow(uint8(a));title('image to temper');
subplot(1,3,2); imshow(uint8(b));title('image for watermark');
subplot(1,3,3); imshow(uint8(wtem));title('wtempered image');
