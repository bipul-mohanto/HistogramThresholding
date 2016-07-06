%% Bipul Mohanto
% Color in Informatics and MEdia Technology
% contact: bipul.mohanto@yahoo.com
% LinkedIn: https://www.linkedin.com/in/mohantobipul

%% histogram

clear all
close all
clc

I=imread('chro.bmp');
imshow(I);

% histogram
figure, imhist(I);
figure, imhist(I,64);

% moments
mean2(I)
std2(I)
median(I(:))

%Influence of some functions
J=imrotate(I,90);
figure, imhist(J);
clear J;
K=imcomplement(I);
figure, imhist(K);
clear K;

% cumulative histogram
HC=cumsum(imhist(I));
max(find(HC<(size(I,1)*size(I,2))/2))

% histogram stretching
minI=min(I(:));
maxI=max(I(:));

a=double(255)/double(maxI-minI);
b=-a*double(minI);
lut=uint8(a*(0:255)+b)
J=lut(I+1);
figure, imshow(J);

J1=imadjust(I);
figure, imshow(J1);
J2=imadjust(I,[double(minI)/255; double(maxI)/255],[0 1]);
figure, imshow(J2);

%% equalization
clear all;
close all;
clc;

J=imread('elaineDark.jpg');
K=histeq(J,256);
L=imread('elaineLight.jpg');
M=histeq(L,256);

subplot(4,2,1); imshow(J);
subplot(4,2,2); imhist(J);
subplot(4,2,3); imshow(K);
subplot(4,2,4); imhist(K);
subplot(4,2,5); imshow(L);
subplot(4,2,6); imhist(L);
subplot(4,2,7); imshow(M);
subplot(4,2,8); imhist(M);

%% color equalization

clear all;
close all;
clc;

I=imread('rocks.jpg');
PR=I(:,:,1);
PRE=histeq(PR);
PV=I(:,:,2);
PVE=histeq(PV);
PB=I(:,:,3);
PBE=histeq(PB);
subplot(1,2,1); imshow(I);
IE=cat(3,PRE,PVE,PBE);
subplot(1,2,2); imshow(IE);

%% thresholding

clear all
close all
clc

I=imread('gdr.bmp');
imshow(I);

value=165;
BW=im2bw(I,value/255);
figure, imshow(BW);

%% Otsu's method

clear all
close all
clc

I=imread('chro.bmp');
imshow(I);

value = graythresh(I);
uint8(value*255)
BW = im2bw(I,value);
figure, imshow(BW)

minI=min(I(:));
maxI=max(I(:));
J=imadjust(I,[double(minI)/255; double(maxI)/255],[0 1]);

value = graythresh(J);
uint8(value*255)
BW1 = im2bw(J,value);
figure, imshow(BW1)

DIF=max(BW1-BW,BW-BW1);
figure, imshow(DIF,[]);

K=histeq(I,256);

value = graythresh(K);
uint8(value*255)
BW2 = im2bw(K,value);
figure, imshow(BW2)

DIF2=max(BW2-BW,BW-BW2);
figure, imshow(DIF2,[]);