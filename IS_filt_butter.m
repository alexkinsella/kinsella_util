% Find intraseasonal part with Butterworth figure
function data_IS = IS_filt_butter(data,lims,Fs,ord)

[b,a] = butter(ord,lims/(Fs/2),'bandpass');

sz = size(data);
datavec = reshape(data,[prod(sz(1:end-1)), sz(end)]);
good = find(~isnan(mean(datavec,2)));
datavec_IS_good = filtfilt(b,a,datavec(good,:)')';
szvec = size(datavec);
clear datavec
datavec_IS = nan(szvec);
datavec_IS(good,:) = datavec_IS_good;
clear datavec_IS_good
data_IS = reshape(datavec_IS,sz);
clear MSEvec_IS

end
