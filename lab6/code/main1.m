I  = imread('1.png');
I = rgb2gray(I);
rotI = imrotate(I,33,'crop');
BW = edge(rotI,'canny');
[H,T,R] = hough(BW);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); 
y = R(P(:,1));
plot(x,y,'s','color','white');

lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(rotI), hold on
max_len = 0;
a = zeros(3,1);
b = zeros(3,4);
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

    minilen = a(1,1);
    minixy = 1;

    for i = 1:3
        if a(i,1) < minilen
            minilen = a(i, 1);
            minixy = i;
        end
    end

    len = norm(lines(k).point1 - lines(k).point2);
    if(len > minilen)
        b(minixy, 1) = xy(1);
        b(minixy, 2) = xy(2);
        b(minixy, 3) = xy(3);
        b(minixy, 4) = xy(4);
        a(minixy, 1) = len;
    end

end
xy_long1 = zeros(2,2);
xy_long2 = zeros(2,2);
xy_long3 = zeros(2,2);
xy_long1(1,1) = b(1,1);
xy_long1(1,2) = b(1,2);
xy_long1(2,1) = b(1,3);
xy_long1(2,2) = b(1,4);
plot(xy_long1(1,:),xy_long1(2,:),'LineWidth',2,'Color','cyan');
xy_long2(1,1) = b(2,1);
xy_long2(1,2) = b(2,2);
xy_long2(2,1) = b(2,3);
xy_long2(2,2) = b(2,4);
plot(xy_long2(1,:),xy_long2(2,:),'LineWidth',2,'Color','cyan');
xy_long3(1,1) = b(3,1);
xy_long3(1,2) = b(3,2);
xy_long3(2,1) = b(3,3);
xy_long3(2,2) = b(3,4);
plot(xy_long3(1,:),xy_long3(2,:),'LineWidth',2,'Color','cyan');