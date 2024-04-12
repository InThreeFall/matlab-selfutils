function smoothed_curve = bezier_curve_smoothing(points, degree)
    % points为待平滑的点的坐标，degree为贝塞尔曲线的阶数
    n = size(points, 1) - 1; % 根据待平滑点的数量计算贝塞尔曲线的阶数
    
    % 计算贝塞尔曲线系数
    C = zeros(degree+1, n+1);
    for j = 0:n
        C(:,j+1) = nchoosek(n, j);
    end
    
    t = linspace(0, 1, 100); % 在区间[0, 1]内等间隔取点
    
    smoothed_curve = zeros(length(t), 2);
    for k = 1:length(t)
        point_on_curve = zeros(1, 2);
        for j = 0:n
            point_on_curve = point_on_curve + C(degree+1,j+1) * t(k)^(n-j) * (1-t(k))^j * points(j+1, :);
        end
        smoothed_curve(k, :) = point_on_curve;
    end
end