%CS 338 Umut Can GEnlik
%most of the code has been taken from http://evilzone.org/code-library/%28matlab%29-simple-lsb-image-stenography/
%read file
    s = imread('stego.bmp');

    height = size(s,1);
    width = size(s,2);
    %To read the size of image 8 bits multiply by reshape size(25) for stego.bmp  
    m = 200;

    %LSB Extraction Algorithm
    k = 1;
    for i = 1 : height
        for j = 1 : width
            if (k <= m)
                b(k) = mod(double(s(i,j)),2);
                k = k + 1;
            end
        end
    end

    %Convert to string
    binaryVector = b;
    binValues = [ 128 64 32 16 8 4 2 1 ];
    binaryVector = binaryVector(:);

    if mod(length(binaryVector),8) ~= 0
        error('Length of binary vector is wrong');
    end

    binMatrix = reshape(binaryVector,8,25);
    textString = char(binValues*binMatrix);    
    disp(textString);