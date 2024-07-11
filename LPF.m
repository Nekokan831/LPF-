% パラメータ設定
dt = 0.001; % 1ステップの時間 [秒]
times = 0:dt:1-dt; % 時間ベクトル
N = length(times); % サンプル数

f = 5; % サイン波の周波数 [Hz]
sigma = 0.5; % ノイズの分散

rng(1); % 乱数シードの設定

% サイン波の生成
x_s = sin(2 * pi * times * f);
x = x_s + sigma * randn(1, N);

% 矩形波の生成
y_s = zeros(1, N);
y_s(1:floor(N/2)) = 1;
y = y_s + sigma * randn(1, N);

% フーリエ変換の実行
X = fft(x);
Y = fft(y);

% 周波数ベクトルの生成
f_vec = (0:N-1)*(1/(N*dt));

% 結果のプロット
figure;

% ノイズを加えたサイン波のプロット
subplot(2, 2, 1);
plot(times, x);
title('Noisy Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

% サイン波のフーリエ変換結果のプロット
subplot(2, 2, 2);
plot(f_vec, abs(X));
title('Fourier Transform of Noisy Sine Wave');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% ノイズを加えた矩形波のプロット
subplot(2, 2, 3);
plot(times, y);
title('Noisy Square Wave');
xlabel('Time (s)');
ylabel('Amplitude');

% 矩形波のフーリエ変換結果のプロット
subplot(2, 2, 4);
plot(f_vec, abs(Y));
title('Fourier Transform of Noisy Square Wave');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
