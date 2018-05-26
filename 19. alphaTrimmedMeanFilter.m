function f = alphatrim(g,m,n,d)
%implements an alpha trimmed mean filter
 
if( d<=0 || (d/2 ~= round(d/2)))
    error('d must be +ve, even integer')
end
[g,revertclass] = tofloat(g);
f = imfilter(g,ones(m,n),'symmetric');
 
for k = 1:d/2
    f = f- ordfilt2(g,k, ones(m,n), 'symmetric');
end
 
for k = (m*n - (d/2) +1):m*n
    f = f - ordfilt2(g,k,ones(m,n),'symmetric');
end
f = f/(m*n-d)
f= revertclass(f); 
end
 
function [out,revertclass] = tofloat(in)
% to convert image to floating point
identity = @(x) x;
tosingle = @im2single;
 
table = {'uint8',tosingle,@im2uint8
    'uint16',tosingle,@im2uint16
    'int16', tosingle, @im2int16
    'logical',tosingle,@logical
    'double',identity,identity
    'single',identity,identity };
 
classindex = find(strcmp(class(in), table(:,1)));
 
if isempty(classindex)
    error('unsupported input image class');
end
 
out = table{classindex,2}(in);
revertclass = table{classindex,3}
end

I1 = imread('ppv.jpg');
I2 = alphatrim(image,256,256,254*254);
subplot(1,2,1);
imshow(I1);
title('Orginal image');
subplot(1,2,2);
imshow(I2);
title('After applying alpha trimming');
