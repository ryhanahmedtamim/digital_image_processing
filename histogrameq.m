clear all;
clc;

im = imread('s5.jpg');
im2d = (rgb2gray(im));


[m,n] = size(im2d);
his = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
cum = zeros(256,1);
out = zeros(256,1);
a=1;
k = m*n;

for i=1:m
    for j=1:n
        a = im2d(i,j)+1;
        his(a) =  his(a)+1;
        pdf(a) = his(a)/k;
    end
end


his2 = zeros(256,1);

sum = 0;
for i=1:size(pdf)
    sum = sum+pdf(i);
    cum(i) = sum;
    cdf(i) = cum(i)*255;
    out(i) = round(cdf(i));
end


for i=1:m
    for j=1:n
      hiseq(i,j) = out(im2d(i,j)+1);  
    end
end

his2 = zeros(256,1);

for i=1:m
    for j=1:n
        a = hiseq(i,j)+1;
        his2(a) = his2(a)+1;
    end
end

hiseq = uint8(hiseq);
figure;
set(gcf,'Position',get(0,'Screensize'));

subplot(2,2,1),imshow(im2d),title('Original Image');

subplot(2,2,2),plot(his),title('Historam  of Original Image ');

subplot(2,2,3),imshow(hiseq),title('Historam Equalized Image');

subplot(2,2,4),plot(his2),title('Historam  of Historam Equalized Image ');

%im = histeq(im2d);
% figure;
% set(gcf,'Position',get(0,'Screensize'));
% subplot(1,2,1),imshow(im),title('Historam Equalized Image');
% 
% subplot(1,2,2),imhist(im),title('Historam  of Historam Equalized Image ');



