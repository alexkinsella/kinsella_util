% Create monthly climatology from spatially-distributed time series
function varclimmo = clim_monthly(data,dvec)
% Data is time series, dvec is associated datevec for measurements, and
% Time should be final dimension of data array.
% For example, data may be OISST.SST, dvec is OISST.dvec.
%
% Alex Kinsella, August 22, 2022

sz = size(data);
datavec = reshape(data,[numel(data)/sz(end) sz(end)]);
varclimmovec = nan([numel(data)/sz(end) 12]);
for mm = 1:12
    mminds = month(datetime(dvec)) == mm;
    varclimmovec(:,mm) = nanmean(datavec(:,mminds),2);
end

varclimmo = reshape(varclimmovec,[sz(1:end-1), 12]);

end