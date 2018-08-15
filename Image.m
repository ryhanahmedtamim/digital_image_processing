clear all;
clc;

im = imread('s2.png');

x = im(:,:,1);
y = im(:,:,2);
z = im(:,:,3);

    


u = x/3+y/3+z/3;


%u(:,:,1) = x;
%u(:,:,2) = y;
%u(:,:,3) = z;



imshow(u);