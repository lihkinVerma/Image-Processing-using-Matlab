% Image compression using DCT technique (discrete cosine transformation)
a=imread('wow.jpg');
b=rgb2gray(a);
J=dct2(b);
K = idct2(J);
subplot(1,3,1); imshow(a); title('actualImage');
subplot(1,3,2); imshow(uint8(J)); title('DCTImage');
subplot(1,3,3); imshow(uint8(K)); title('InverseDCTImage');
