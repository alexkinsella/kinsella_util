% Plot data solid where significant and dashed where not 

function h = sigplot(x,y,p,thresh,linewidth,color)

xinterp(1) = x(1);
cnt = 2;
for nn = 1:numel(x)-1
    xinterp(cnt) = x(nn)+(x(nn+1)-x(nn))/2;
    xinterp(cnt+1) = x(nn+1);
    cnt = cnt+2;
end

yinterp = interp1(x,y,xinterp);

if p(1)<thresh
    sig = 1;
else
    sig = 0;
end
inds = [1];

hold on
cnt = 1;
for nn = 1:numel(x)-1
    if p(nn)<thresh
        newsig = 1;
    else
        newsig = 0;
    end
    if newsig==sig
        inds = [inds nn];
        if nn == numel(x)-1 % For last step, plot even if it doesn't change
            if newsig == 0 % Means we are insignificant
                h(cnt) = plot(xinterp(xinterp>x(max(inds(1)-1,1))&xinterp<x(inds(end))+1),yinterp(xinterp>x(max(inds(1)-1,1))&xinterp<x(inds(end))+1),'linewidth',2,'linestyle','--','linewidth',linewidth,'color',color,'marker','none');
                cnt = cnt+1;
            elseif newsig == 1 % Means we are significant
                h(cnt) = plot(xinterp(xinterp>x(max(inds(1)-1,1))&xinterp<x(inds(end))+1),yinterp(xinterp>x(max(inds(1)-1,1))&xinterp<x(inds(end))+1),'linewidth',2,'linestyle','-','linewidth',linewidth,'color',color,'marker','none');
                cnt = cnt+1;
            end
        end
    else
        if newsig == 1 % Means we just finished insignificant
            h(cnt) = plot(xinterp(xinterp>x(max(inds(1)-1,1))&xinterp<x(inds(end))+1),yinterp(xinterp>x(max(inds(1)-1,1))&xinterp<x(inds(end))+1),'linewidth',2,'linestyle','--','linewidth',linewidth,'color',color,'marker','none');
            cnt = cnt+1;
        elseif newsig == 0 % Means we just finished significant
            h(cnt) = plot(xinterp(xinterp>x(max(inds(1)-1,1))&xinterp<x(inds(end))+1),yinterp(xinterp>x(max(inds(1)-1,1))&xinterp<x(inds(end))+1),'linewidth',2,'linestyle','-','linewidth',linewidth,'color',color,'marker','none');
            cnt = cnt+1;
        end
        inds = [nn];
        sig = newsig;
    end
end