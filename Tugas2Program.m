classdef Tugas2Program
    methods
        function result = convolution(~, image, mask)
            [sizeMask, ~] = size(mask);
            disp(sizeMask);
            disp(mask);
            disp(class(mask))
            
            offset = floor(sizeMask / 2);
            padded_image = padarray(image, [offset, offset], 'replicate');
            [row, col] = size(padded_image);
            
            imageDouble = im2double(padded_image);
            ImageResult = imageDouble;
            
            for i = 1+offset:(row - offset)
                for j = 1+offset:(col - offset)
                    conv_sum = 0;
                    
                    for m = 1:sizeMask
                        for n = 1:sizeMask
                            conv_sum = conv_sum + imageDouble(i + m - 1 - offset, j + n - 1 - offset) * mask(m, n);
                        end
                    end
                    
                    ImageResult(i, j) = conv_sum;
                end
            end
            original_size_result = ImageResult(offset+1:end-offset, offset+1:end-offset, :);
            result = im2uint8(original_size_result);
        end

    end
end