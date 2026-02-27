% Find intraseasonal part using lanczos filter
function data_IS = IS_filt_lanczos(data,lims,Fs,ncoeff_lanc)

sz = size(data);
datavec = reshape(data,[prod(sz(1:end-1)), sz(end)]);
good = find(~isnan(mean(datavec,2)));
%datavec_IS_good = lanczosfilter(lanczosfilter(datavec(good,:)',Fs,lims(1),ncoeff_lanc,'low'),Fs,lims(2),ncoeff_lanc,'high');
datavec_IS_good = lanczosfilter(datavec(good,:)',Fs,lims(2),ncoeff_lanc,'low')-lanczosfilter(datavec(good,:)',Fs,lims(1),ncoeff_lanc,'low');

datavec_IS_good = datavec_IS_good';
szvec = size(datavec);
clear datavec
datavec_IS = nan(szvec);
datavec_IS(good,:) = datavec_IS_good;
clear datavec_IS_good
data_IS = reshape(datavec_IS,sz);

end
