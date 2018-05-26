clear all;
close all;
I = imread('myt.JPG');
BW = im2bw(I, 0.1);
BW = ~BW;
imshow(BW);
stats = regionprops(BW);
for index=1:length(stats)
if stats(index).Area > 100 && stats(index).BoundingBox(3)*stats(index).BoundingBox(4) < 10000
      x = ceil(stats(index).BoundingBox(1))
      y= ceil(stats(index).BoundingBox(2))
      widthX = floor(stats(index).BoundingBox(3)-1)
      widthY = floor(stats(index).BoundingBox(4)-1)
      subimage(index) = {BW(y:y+widthY,x:x+widthX,:)}; 
      simg=subimage(index);
      figure, imshow(subimage{index});
      imwrite(subimage{index},strcat(num2str(index),'.jpg'));
      end
  end
% f=imread('inp.png')
% ff=im2bw(f,0.9);
% ff=~ff;
% imshow(ff);
% imwrite(ff,'new.png');

% clear all;
% %cd('C:\Users\IFIM\Desktop\New folder\KANND_HAND_SET');
% myFolder = 'C:\Users\Nikhil\Documents\MATLAB';
% [filename, pathname] = uigetfile('*.JPG','Select image to be read.');
% i= imread(fullfile(pathname,filename));
% i=im2bw(i);
% i=~i;
% i=padarray(i,[0 10]);
% verticalProjection = sum(i, 1);
% set(gcf, 'Name', 'DEMO BY SOUMYADEEP', 'NumberTitle', 'Off') 
% subplot(2, 2, 1);imshow(i); 
% subplot(2,2,3);
% %plot(verticalProjection, 'b-');
% grid on;
% t = verticalProjection;
% t(t==0) = inf;
% mayukh=min(t)
% % 0 where there is background, 1 where there are letters
% letterLocations = verticalProjection > mayukh; 
% % Find Rising and falling edges
% d = diff(letterLocations);
% startingColumns = find(d>0);
% endingColumns = find(d<0);
% % Extract each region
% y=1;
% for k = 1 : length(startingColumns)
%   % Get sub image of just one character...
%   subImage = i(:, startingColumns(k):endingColumns(k)); 
% [L,num] = bwlabel(subImage);
% for z= 1 : num
% bw= ismember( L, z);
% % Construct filename for this particular image.
% baseFileName = sprintf('curvedimage %d.JPG', y);
%  y=y+1;
% % Prepend the folder to make the full file name.
% fullFileName = fullfile(myFolder, baseFileName);
% % Do the write to disk.
% imwrite(bw, fullFileName);
% subplot(2,2,4);
% pause(2);
% imshow(bw);
% end;
% y=y+1;
% end;
