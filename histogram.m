clear all;
clc;

im = imread('s5.jpg');
im2d = (rgb2gray(im));
imh = histeq(im2d);



figure;
set(gcf,'Position',get(0,'Screensize'));
subplot(2,2,1),imshow(im2d),title('Original Image');
subplot(2,2,2),imhist(im2d),title('Historam  of Original Image ');
subplot(2,2,3),imshow(imh),title('Historam Equalized Image');
subplot(2,2,4),imhist(imh),title('Historam  of Historam Equalized Image ');
