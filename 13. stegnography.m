    % resding an image
    c = imread('ppv.jpg'); 
    c=rgb2gray(c);
    
    % resizing image
    c=imresize(c,[64 64],'nearest'); 
    
    % taking the message
    message = 'image';          
    message = strtrim(message);      
    m = length(message) * 8;     
    AsciiCode = uint8(message);     
    binaryString = transpose(dec2bin(AsciiCode,8));    
    binaryString = binaryString(:);    
    N = length(binaryString);    
    b = zeros(N,1);    
    for k = 1:N   
        if(binaryString(k) == '1')    
            b(k) = 1;   
        else    
            b(k) = 0;    
        end    
    end 
    
    % embedding message to image
    s = c;   
    height = size(c,1);   
    width = size(c,2);    
    k = 1;    
    for i = 1 : height    
        for j = 1 : width    
             LSB = mod(double(c(i,j)), 2);    
                if (k>m || LSB == b(k))       
                    s(i,j) = c(i,j);      
                else       
                    if(LSB == 1)      
                        s(i,j) = (c(i,j) - 1);     
                    else     
                        s(i,j) = (c(i,j) + 1);     
                    end
             k = k + 1;
        end    
    end                       
    end  

% displaying result
imwrite(s,'msgimage.tif');       
subplot(1,2,1); imshow(uint8(c));title('image before stegno');
subplot(1,2,2); imshow(uint8(s));title('image after stegno'); 