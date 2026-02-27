% Get lat/lon checks
function [loncheck,latcheck,lonout,latout] = lonlatchecks(data,lonmin,lonmax,latmin,latmax);

lon = data.lon;
lat = data.lat;

loncheck = lon>=lonmin & lon<=lonmax;
latcheck = lat>=latmin & lat<=latmax;

lonout = lon(loncheck);
latout = lat(latcheck);

end