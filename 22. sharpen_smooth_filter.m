a= imread('ppv.jpg');
b= imsharpen(a);
c= imgaussfilt(a,100);

subplot(1,3,1); imshow(a); title('actualImage');
subplot(1,3,2); imshow(b); title('SharpenedImage');
subplot(1,3,3); imshow(c); title('smoothenedImage');
