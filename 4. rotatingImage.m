% rotating an image clockwise
% reading an image
a= imread('ppv.jpg');
a=rgb2gray(a);

% Rotating an image
b=imrotate(a,90);
c=imrotate(a,180);
d=imrotate(a,270);

subplot(1,4,1); imshow(a);title('original image');
subplot(1,4,2); imshow(b);title('90D rotation');
subplot(1,4,3); imshow(c);title('180D rotation');
subplot(1,4,4); imshow(d);title('270D rotation');
