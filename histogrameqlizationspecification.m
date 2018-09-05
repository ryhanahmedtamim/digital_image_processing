clear all;
clc;
%reading the input image
im = imread('h1.png');
im2d = (rgb2gray(im));

%reading the referaced image

ref = imread('h2.png');
refim = rgb2gray(ref);


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
%hiseq = uint8(hiseq);

%histogram of ref image


[n1,m1] = size(ref);


b = zeros(256,1);
pdf1 = zeros(256,1);
cum2 = zeros(256,1);
out2 = zeros(256,1);
cdf2 = zeros(256,1);
k = n1*m1;

for i=1:n1
    for j=1:m1
        pix = ref(i,j)+1;
        b(pix)= b(pix)+1;
        pdf1(pix) = b(pix)/k;
    end
end


sum = 0;

for i=1: size(pdf1)
   sum = sum +(pdf1(i));
   cum2(i) = sum;
   cdf2(i) = cum2(i)*256;
   out2(i) = round(cdf2(i));
end



for i=1:m
    for j=1:n
        for k=1 : 256
           if out2(k) >= hiseq(i,j)
               break;
           end            
        end
        output(i,j) = k-1;
    end
end


output = uint8(output);

figure;
set(gcf,'Position',get(0,'Screensize'));

subplot(1,3,1),imshow(im2d),title('Original Image');

subplot(1,3,2),imshow(refim),title('Referance Image ');

subplot(1,3,3),imshow(output),title('Output Image');
