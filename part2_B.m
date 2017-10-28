function ulbp_img = part2_B(img)

img = double(rgb2gray(img));
size_img = size(img);
ulbp_img = img;

table = zeros(256, 1);

for i = 0:255

    tra = 0;
    num = dec2bin(i,8);
    
    pre = -1;
    for j = 1:8
        if(pre == -1)
            pre = str2double(num(j));
        else
            now = str2double(num(j));
            if(pre ~= now)
                tra = tra + 1;
            end
            pre = now;
        end
    end
    now = str2double(num(1));
    if(pre ~= now)
        tra = tra + 1;
    end
    if(tra <= 2)
        table(i+1) = 1;        
    end
end

for i = 2:size_img(1)-1
    for j = 2:size_img(2)-1
        mat = [128 64 32 16 8 4 2 1];
        num=[img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j+1)  img(i+1,j+1) img(i+1,j) img(i+1,j-1) img(i,j-1)];
        num(num < img(i,j)) = 0;
        num(num >= img(i,j)) = 1;
        lbp = sum(num .* mat);
        if(table(lbp+1))
            ulbp_img(i,j) = sum(num .* mat);
        else
            ulbp_img(i,j) = 0;
        end
    end
end

ulbp_img = uint8(ulbp_img);

end