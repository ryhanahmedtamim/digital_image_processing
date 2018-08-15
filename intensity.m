clear all;
clc;

im = imread('s5.jpg');
im2d = (rgb2gray(im));
imd = double(im2d);
[m,n] = size(imd);
factor = input('Enter a factor : ');


for i=1:m
    for j=1:n
    imd(i,j) = factor*(log(1+imd(i,j)));
    end
end
output = uint8(imd);

set(gcf,'Position',get(0,'Screensize'));
subplot(1,2,1),imshow(im2d),title('Original Image');
subplot(1,2,2),imshow(imd),title('Outpt Image');
