clear all;
clc;

im = imread('s5.jpg');


im2d = (rgb2gray(im));


[m,n] = size(im2d);
his = zeros(256,1);
pdf = zeros(256,1);

a=1;
k = m*n;

for i=1:m
    for j=1:n
        a = abs(im2d(i,j))+1;
        his(a) =  his(a)+1;
        pdf(a) = his(a)/k;
    end
end



figure;
set(gcf,'Position',get(0,'Screensize'));
subplot(1,2,1),imshow(im2d),title('Original Image');
subplot(1,2,2),plot(pdf),title('Historam  of Original Image ');
