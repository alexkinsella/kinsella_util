% Find intraseasonal part
function [data_IS,d] = IS_filt(data,lims,Fs)

sz = size(data);
datavec = reshape(data,[prod(sz(1:end-1)), sz(end)]);
good = find(~isnan(mean(datavec,2)));
[datavec_IS_good,d] = bandpass(datavec(good,:)',[lims(1) lims(2)],Fs);
datavec_IS_good = datavec_IS_good';
szvec = size(datavec);
clear datavec
datavec_IS = nan(szvec);
datavec_IS(good,:) = datavec_IS_good;
clear datavec_IS_good
data_IS = reshape(datavec_IS,sz);
clear MSEvec_IS

end
