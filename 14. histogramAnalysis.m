% reading an image
a=imread('ppv.jpg');
b=a;
a=rgb2gray(a);

% histogram equalization
[r,c]=size(a);
fre=zeros(256,1);
for i=1:r
    for j=1:c
        fre(a(i,j)+1)= fre(a(i,j)+1)+1;
    end
end
pdf=zeros(256,1);
for i=1:256
    pdf(i)=fre(i)/(r*c);
end
cdf=zeros(256,1);
cdf(1)=pdf(1);
for i=2:256
    cdf(i)=pdf(i)+cdf(i-1);
end
out=zeros(256,1);
for i=1:256
    out(i)=round(255*cdf(i));
end
disp(out);
resfreq=zeros(256,1);
for i=1:256
    resfreq(out(i)+1)=resfreq(out(i)+1)+fre(out(i)+1);
end
disp(resfreq);

subplot(1,2,1); plot(fre(:,1)); title('Histogram of original image');
subplot(1,2,2); plot(resfreq(:,1)); title('Histogram Equalization result');
