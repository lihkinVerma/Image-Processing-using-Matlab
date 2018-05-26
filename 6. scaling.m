% reading an image
a=imread('ppv.jpg');
t=input('enter scaling type (0:down, 1:up) ');
if(t==1)
    sf=input('enter upscaling factor ');
else
    sf=input('enter downscaling factor ');
end

% scaling by scaling factor
[r,c,k]=size(a);
if(t==1)
    rn=r*sf; cn=c*sf;
    b=zeros(rn,cn,k);
    for i=1:rn
        for j=1:cn
            for l=1:k
                u=ceil(i/sf);
                v=ceil(j/sf);
                b(i,j,l)=a(u,v,l);
            end
        end
    end   
else 
    rn=int8(r/sf); cn=int8(c/sf);
    b=zeros(rn,cn,k);
    for i=1:r/sf
        for j=1:c/sf
            for l=1:k
                u=ceil(i*sf);
                v=ceil(j*sf);
                b(i,j,l)=a(u,v,l);
            end
        end
    end
end
subplot(1,2,1); imshow(a);title('original image');
subplot(1,2,2); imshow(uint8(b));title('scaled image');