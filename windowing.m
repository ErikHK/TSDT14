function [ y ] = windowing( x,n , type_)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  switch type_
      case 'square'
        w = ones(1,n)/n;
        x1 = periodogram(x);
        y = filter(w,1,x1);
      
      case 'hanning'
        w = hanning(n)/n;
        x1 = periodogram(x);
        y = filter(w,1,x1);
  end

end

