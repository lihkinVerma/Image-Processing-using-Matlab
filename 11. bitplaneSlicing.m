
% reading an image
a=imread('ppv.jpg');
a=rgb2gray(a);
subplot(3,2,1); imshow(uint8(a));title('original image');

% showing top five bit planes
for i=1:5
    bit=bitget(a,9-i);
    subplot(3,2,i+1); imshow(logical(bit));title('bit image'+9-i);
end

% % constructing image with less planes say least descriptive  planes
% [r,c]=size(a);
% b=zeros(r,c);
% for i=1:r
%     for j=1:c
%         b(i,j)=a(i,j)/8;
%     end
% end
% subplot(1,2,1); imshow(a);title('original image');
% subplot(1,2,2); imshow(uint8(b));title('less bit planed image');

