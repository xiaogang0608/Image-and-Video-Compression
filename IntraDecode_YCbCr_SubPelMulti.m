function Decoded_Ref_Frame = IntraDecode_YCbCr_SubPelMulti(zeroRun,Motion_Vector,Ref_Frame,Scaling_Factor,MultipleFrame,a,b)

    [FrameHeight FrameWidth FrameDim] = size(Ref_Frame);
    if (MultipleFrame == 1)
        Ref_Frame_Y = Ref_Frame(:,:,1);
        Ref_Frame_Cb = Ref_Frame(:,:,2);
        Ref_Frame_Cr = Ref_Frame(:,:,3);
 
        Padd_Y = [Ref_Frame_Y Ref_Frame_Y(:,FrameWidth-1)];
        Padd_Y = [Padd_Y;Padd_Y(FrameHeight-1,:)];
        Padd_Cb = [Ref_Frame_Cb Ref_Frame_Cb(:,FrameWidth-1)];
        Padd_Cb = [Padd_Cb;Padd_Cb(FrameHeight-1,:)];
        Padd_Cr = [Ref_Frame_Cr Ref_Frame_Cr(:,FrameWidth-1)];
        Padd_Cr = [Padd_Cr;Padd_Cr(FrameHeight-1,:)];
        Ref_Frame_Y_SubPel = (1-b)*(1-a)*Padd_Y(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Y(1:FrameHeight,2:FrameWidth+1)+...
                             (b)*(1-a)*Padd_Y(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Y(2:FrameHeight+1,2:FrameWidth+1);
        Ref_Frame_Cb_SubPel = (1-b)*(1-a)*Padd_Cb(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Cb(1:FrameHeight,2:FrameWidth+1)+...
                              (b)*(1-a)*Padd_Cb(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Cb(2:FrameHeight+1,2:FrameWidth+1);
        Ref_Frame_Cr_SubPel = (1-b)*(1-a)*Padd_Cr(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Cr(1:FrameHeight,2:FrameWidth+1)+...
                              (b)*(1-a)*Padd_Cr(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Cr(2:FrameHeight+1,2:FrameWidth+1);
    else
        FrameWidth = FrameWidth/2;
        Ref_Frame_Y = Ref_Frame(:,1:FrameWidth,1);
        Ref_Frame_Y_2 = Ref_Frame(:,FrameWidth+1:end,1);
        Ref_Frame_Cb = Ref_Frame(:,1:FrameWidth,2);
        Ref_Frame_Cb_2 = Ref_Frame(:,FrameWidth+1:end,2);
        Ref_Frame_Cr = Ref_Frame(:,1:FrameWidth,3);
        Ref_Frame_Cr_2 = Ref_Frame(:,FrameWidth+1:end,3);
        Padd_Y = [Ref_Frame_Y Ref_Frame_Y(:,FrameWidth-1)];
        Padd_Y = [Padd_Y;Padd_Y(FrameHeight-1,:)];
        Padd_Cb = [Ref_Frame_Cb Ref_Frame_Cb(:,FrameWidth-1)];
        Padd_Cb = [Padd_Cb;Padd_Cb(FrameHeight-1,:)];
        Padd_Cr = [Ref_Frame_Cr Ref_Frame_Cr(:,FrameWidth-1)];
        Padd_Cr = [Padd_Cr;Padd_Cr(FrameHeight-1,:)];
        Padd_Y_2 = [Ref_Frame_Y_2 Ref_Frame_Y_2(:,FrameWidth-1)];
        Padd_Y_2 = [Padd_Y_2;Padd_Y_2(FrameHeight-1,:)];
        Padd_Cb_2 = [Ref_Frame_Cb_2 Ref_Frame_Cb_2(:,FrameWidth-1)];
        Padd_Cb_2 = [Padd_Cb_2;Padd_Cb_2(FrameHeight-1,:)];
        Padd_Cr_2 = [Ref_Frame_Cr_2 Ref_Frame_Cr_2(:,FrameWidth-1)];
        Padd_Cr_2 = [Padd_Cr_2;Padd_Cr_2(FrameHeight-1,:)];
        
        Ref_Frame_Y_SubPel = (1-b)*(1-a)*Padd_Y(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Y(1:FrameHeight,2:FrameWidth+1)+...
                             (b)*(1-a)*Padd_Y(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Y(2:FrameHeight+1,2:FrameWidth+1);
        Ref_Frame_Cb_SubPel = (1-b)*(1-a)*Padd_Cb(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Cb(1:FrameHeight,2:FrameWidth+1)+...
                              (b)*(1-a)*Padd_Cb(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Cb(2:FrameHeight+1,2:FrameWidth+1);
        Ref_Frame_Cr_SubPel = (1-b)*(1-a)*Padd_Cr(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Cr(1:FrameHeight,2:FrameWidth+1)+...
                              (b)*(1-a)*Padd_Cr(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Cr(2:FrameHeight+1,2:FrameWidth+1);                           
                           
        Ref_Frame_Y_2_SubPel = (1-b)*(1-a)*Padd_Y_2(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Y_2(1:FrameHeight,2:FrameWidth+1)+...
                               (b)*(1-a)*Padd_Y_2(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Y_2(2:FrameHeight+1,2:FrameWidth+1);
        Ref_Frame_Cb_2_SubPel = (1-b)*(1-a)*Padd_Cb_2(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Cb_2(1:FrameHeight,2:FrameWidth+1)+...
                                (b)*(1-a)*Padd_Cb_2(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Cb_2(2:FrameHeight+1,2:FrameWidth+1);
        Ref_Frame_Cr_2_SubPel = (1-b)*(1-a)*Padd_Cr_2(1:FrameHeight,1:FrameWidth)+(1-b)*(a)*Padd_Cr_2(1:FrameHeight,2:FrameWidth+1)+...
                                (b)*(1-a)*Padd_Cr_2(2:FrameHeight+1,1:FrameWidth)+(b)*(a)*Padd_Cr_2(2:FrameHeight+1,2:FrameWidth+1);
    
    end
    zeroRunDec = ZeroRunDec_2(zeroRun);
    zeroRunDec = ZeroRunDec_2(zeroRun);
    RLDec_Y = zeroRunDec(1,1:size(zeroRunDec,2)/3);
    RLDec_Cb = zeroRunDec(1,size(zeroRunDec,2)/3+1:2*size(zeroRunDec,2)/3);
    RLDec_Cr = zeroRunDec(1,2*size(zeroRunDec,2)/3+1:end);
    
    Block = 8;
    flag = 0;
    for i = 0:Block:FrameHeight-Block+1
        for j = 0:Block:FrameWidth-Block+1
        %% RunLengthDecoding --> DeZigZagScan --> DeQuantization --> InverseDCT
        flag = flag+1;

        [DeZigZag_Y DeZigZag_Cb DeZigZag_Cr] = DeZigZag8x8(RLDec_Y((flag-1)*64+1:flag*64),RLDec_Cb((flag-1)*64+1:flag*64),RLDec_Cr((flag-1)*64+1:flag*64));
        [DeQI_Y DeQI_Cb DeQI_Cr] = DeQuant8x8(DeZigZag_Y,DeZigZag_Cb,DeZigZag_Cr,Scaling_Factor);
        [IDCT_Y IDCT_Cb IDCT_Cr] = IDCT8x8(DeQI_Y,DeQI_Cb,DeQI_Cr);
        %% Image Reconstruction

        Corrected_i = i+Motion_Vector(flag,1);
        Corrected_j = j+Motion_Vector(flag,2);
        Corrected_Frame = Motion_Vector(flag,3);

        Error_Ref_Frame_Y(i+1:i+8,j+1:j+8) = IDCT_Y;
        Error_Ref_Frame_Cb(i+1:i+8,j+1:j+8) = IDCT_Cb;
        Error_Ref_Frame_Cr(i+1:i+8,j+1:j+8) = IDCT_Cr;
            if((mod(Corrected_i,1) ~=0) || (mod(Corrected_j,1) ~=0))
                Corrected_i = floor(Corrected_i);
                Corrected_j = floor(Corrected_j);
                if (Corrected_Frame == 1)
                    RefFrame_Y = Ref_Frame_Y_SubPel;
                    RefFrame_Cb = Ref_Frame_Cb_SubPel;
                    RefFrame_Cr = Ref_Frame_Cr_SubPel;
                elseif (Corrected_Frame == 2)
                    RefFrame_Y = Ref_Frame_Y_2_SubPel;
                    RefFrame_Cb = Ref_Frame_Cb_2_SubPel;
                    RefFrame_Cr = Ref_Frame_Cr_2_SubPel;
                end
            else
                if (Corrected_Frame == 1)
                    RefFrame_Y = Ref_Frame_Y;
                    RefFrame_Cb = Ref_Frame_Cb;
                    RefFrame_Cr = Ref_Frame_Cr;
                elseif (Corrected_Frame == 2)
                    RefFrame_Y = Ref_Frame_Y_2;
                    RefFrame_Cb = Ref_Frame_Cb_2;
                    RefFrame_Cr = Ref_Frame_Cr_2;
                end
            end
            Decoded_Ref_Frame_Y(i+1:i+8,j+1:j+8) = Error_Ref_Frame_Y(i+1:i+8,j+1:j+8) + RefFrame_Y(Corrected_i+1:Corrected_i+8,Corrected_j+1:Corrected_j+8);
            Decoded_Ref_Frame_Cb(i+1:i+8,j+1:j+8) = Error_Ref_Frame_Cb(i+1:i+8,j+1:j+8) + RefFrame_Cb(Corrected_i+1:Corrected_i+8,Corrected_j+1:Corrected_j+8);
            Decoded_Ref_Frame_Cr(i+1:i+8,j+1:j+8) = Error_Ref_Frame_Cr(i+1:i+8,j+1:j+8) + RefFrame_Cr(Corrected_i+1:Corrected_i+8,Corrected_j+1:Corrected_j+8);
        end
    end
    Decoded_Ref_Frame(:,:,1) = Decoded_Ref_Frame_Y;
    Decoded_Ref_Frame(:,:,2) = Decoded_Ref_Frame_Cb;
    Decoded_Ref_Frame(:,:,3) = Decoded_Ref_Frame_Cr;
end