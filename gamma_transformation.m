clear all;
clc;

im = imread('s4.jpg');
im2d = (rgb2gray(im));
imd = double(im2d);
g = input('Enter the value of gammma : ');
[m,n] = size(imd);
output = abs((imd).^g);



mx = max(output(:));
mn = min(output(:));

for i=1:m
    for j=1:n
    output(i,j) = (255*output(i,j))/(mx-mn);
    end
end
output = uint8(output);

set(gcf,'Position',get(0,'Screensize'));
subplot(121),imshow(im),title('Original Image');
subplot(122),imshow(output),title('Outpt Image');
