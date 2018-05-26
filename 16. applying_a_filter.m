% choose an image for processing
a= imread('ppv.jpg');

% added noise to the image
d= imnoise(a,'salt & pepper',0.02);
[row,col,k]=size(a);

% dividing the image as RGB
d1=d(:,:,1);
d2=d(:,:,2);
d3=d(:,:,3);

% defining my filter [ BOX FILTER ]
b=[1,1,1;1,1,1;1,1,1];

% defining binomial filter of 3 X 3 
% b=[1,2,1;2,4,2;1,2,1];
% b=b*1/16;

% making a padded image
[r,c]=size(d1);
na1=zeros(r+2,c+2);
for i=2:1:r+1
    for j=2:1:c+1
        na1(i,j)=d1(i-1,j-1);
    end
end

[r,c]=size(d2);
na2=zeros(r+2,c+2);
for i=2:1:r+1
    for j=2:1:c+1
        na2(i,j)=d2(i-1,j-1);
    end
end

[r,c]=size(d3);
na3=zeros(r+2,c+2);
for i=2:1:r+1
    for j=2:1:c+1
        na3(i,j)=d3(i-1,j-1);
    end
end

% applying the filter
for i=2:1:r+1
    for j=2:1:c+1
        % used ellipsis for multiple line long statements
        % used round(X,N) for rounfing off
        na1(i,j)=round(( na1(i-1,j-1) *b(1,1) +...
                        na1(i,j-1)   *b(1,2) +...
                        na1(i+1,j-1) *b(1,3) +...
                        ...
                        na1(i-1,j)   *b(2,1) +...
                        na1(i,j)     *b(2,2) +...
                        na1(i+1,j)   *b(2,3) +... 
                        ...
                        na1(i-1,j+1) *b(3,1) +...
                        na1(i+1,j+1)   *b(3,2) +...
                        na1(i+1,j+1) *b(3,3)     )/9,0);
    end
end
   
for i=2:1:r+1
    for j=2:1:c+1
        % used ellipsis for multiple line long statements
        % used round(X,N) for rounfing off
        na2(i,j)=round(( na2(i-1,j-1) *b(1,1) +...
                        na2(i-1,j)   *b(1,2) +...
                        na2(i-1,j+1) *b(1,3) +...
                        ...
                        na2(i,j-1)   *b(2,1) +...
                        na2(i,j)     *b(2,2) +...
                        na2(i,j+1)   *b(2,3) +... 
                        ...
                        na2(i+1,j-1) *b(3,1) +...
                        na2(i+1,j)   *b(3,2) +...
                        na2(i+1,j+1) *b(3,3)     )/9,0);
    end
end

for i=2:1:r+1
    for j=2:1:c+1
        % used ellipsis for multiple line long statements
        % used round(X,N) for rounfing off
        na3(i,j)=round(( na3(i-1,j-1) *b(1,1) +...
                        na3(i-1,j)   *b(1,2) +...
                        na3(i-1,j+1) *b(1,3) +...
                        ...
                        na3(i,j-1)   *b(2,1) +...
                        na3(i,j)     *b(2,2) +...
                        na3(i,j+1)   *b(2,3) +... 
                        ...
                        na3(i+1,j-1) *b(3,1) +...
                        na3(i+1,j)   *b(3,2) +...
                        na3(i+1,j+1) *b(3,3)     )/9,0);
    end
end

na=zeros(row+2,col+2,k);
na(:,:,1)=na1;
na(:,:,2)=na2;
na(:,:,3)=na3;
na=uint8(na);
subplot(1,2,1); imshow(d); title('actualImage');
subplot(1,2,2); imshow(na); title('smoothedImage');