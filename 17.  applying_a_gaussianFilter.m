% choose an image for processing
a= imread('ppv.jpg');
d= imnoise(a,'salt & pepper',0.02);

% dividing the image as RGB
d1=d(:,:,1);
d2=d(:,:,2);
d3=d(:,:,3);

% defining my filter [ Gaussian ]
b=zeros(3,3);
sigma=1;
sum=0;
for i=-1:1:1
    for j=-1:1:1
        b(i+2,j+2)=exp(-1*(i^2+j^2)/(2*sigma*sigma))/(2*pi*sigma*sigma); 
        sum=sum+b(i+2,j+2); 
    end
end
  b=b*1/sum
  
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
a1=na1;
a2=na2;
a3=na3;

% applying the filter
for i=2:1:r+1
    for j=2:1:c+1
        % used ellipsis for multiple line long statements
        % used round(X,N) for rounfing off
        na1(i,j)=       a1(i-1,j-1) *b(1,1) +...
                        a1(i,j-1)   *b(1,2) +...
                        a1(i+1,j-1) *b(1,3) +...
                        ...
                        a1(i-1,j)   *b(2,1) +...
                        a1(i,j)     *b(2,2) +...
                        a1(i+1,j)   *b(2,3) +... 
                        ...
                        a1(i-1,j+1) *b(3,1) +...
                        a1(i,j+1)   *b(3,2) +...
                        a1(i+1,j+1) *b(3,3);
    end
end
   
for i=2:1:r+1
    for j=2:1:c+1
        % used ellipsis for multiple line long statements
        % used round(X,N) for rounfing off
        na2(i,j)=       a2(i-1,j-1) *b(1,1) +...
                        a2(i,j-1)   *b(1,2) +...
                        a2(i+1,j-1) *b(1,3) +...
                        ...
                        a2(i-1,j)   *b(2,1) +...
                        a2(i,j)     *b(2,2) +...
                        a2(i+1,j)   *b(2,3) +... 
                        ...
                        a2(i-1,j+1) *b(3,1) +...
                        a2(i,j+1)   *b(3,2) +...
                        a2(i+1,j+1) *b(3,3);
    end
end

for i=2:1:r+1
    for j=2:1:c+1
        % used ellipsis for multiple line long statements
        % used round(X,N) for rounfing off
        na3(i,j)=       a3(i-1,j-1) *b(1,1) +...
                        a3(i,j-1)   *b(1,2) +...
                        a3(i+1,j-1) *b(1,3) +...
                        ...
                        a3(i-1,j)   *b(2,1) +...
                        a3(i,j)     *b(2,2) +...
                        a3(i+1,j)   *b(2,3) +... 
                        ...
                        a3(i-1,j+1) *b(3,1) +...
                        a3(i,j+1)   *b(3,2) +...
                        a3(i+1,j+1) *b(3,3);
    end
end
[r,c,k]=size(a);
na=zeros(r+2,c+2,k);
na(:,:,1)=na1;
na(:,:,2)=na2;
na(:,:,3)=na3;
na=uint8(na);
subplot(1,2,1); imshow(d); title('actualImage');
subplot(1,2,2); imshow(na); title('smoothedImage');