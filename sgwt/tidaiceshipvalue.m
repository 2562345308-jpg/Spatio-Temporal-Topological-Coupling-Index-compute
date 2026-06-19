% 假设 a 是你要检验的数，X 是一组数据
a = medianValue;
X = rmed1;

% 确保 X 是列向量
X = X(:);

% 计算经验分布中的位置（包含等于 a 的值）
n = length(X);
rank_lower = sum(X <= a);
rank_upper = sum(X >= a);

% 计算单尾 P 值
p_lower = rank_lower / n;
p_upper = rank_upper / n;

% 双尾 P 值：两端极端的最小概率乘2
p_two_tail = 2 * min(p_lower, p_upper);

% 判断是否显著
if p_two_tail < 0.05
    fprintf('a = %.2f 是极端值，双尾 P 值 = %.4f\n', a, p_two_tail);
else
    fprintf('a = %.2f 不是极端值，双尾 P 值 = %.4f\n', a, p_two_tail);
end
