function [Y Cb Cr] = ictRGB2YCbCr(R,G,B)
    
    %[Y Cb Cr] = [0.299 0.587 0.114;-0.169 -0.331 0.5;0.5 -0.419 -0.081]*[R;G;B];
    Y  = 0.299*R + 0.587*G + 0.114*B;
    Cb = -0.169*R - 0.331*G + 0.5*B;
    Cr = 0.5*R - 0.419*G- 0.081*B;
    
end