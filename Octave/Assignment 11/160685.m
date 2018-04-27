#step_1

fo1 = csvread("train.csv");
n_train = 10000;
X_train = fo1([2:10001], 1);
y_train = fo1([2:10001], 2);
i = ones(n_train,1);
New_X_train = [i, X_train];

#step_2

w = rand(2,1);

#step_3

for i = 1:n_train,
	x_dash = [1; X_train(i)];
	w_trans_into_x_dash(i) = w' * x_dash;
end,

figure(1,"position",get(0,"screensize"));
hold on;
scatter(X_train, y_train);
hold on;
plot(X_train, w_trans_into_x_dash,'LineWidth',3,"r-");
xlabel ("feature", "fontsize", 28);
ylabel ("label", "fontsize", 28);
title ("Step #3", "fontsize", 28);
set(gca, "fontsize", 28);
hold off;
pause;
close;

#step_4

w_direct = inv((New_X_train' * New_X_train)) * New_X_train' * y_train;
for i = 1:n_train,
	x_dash = [1; X_train(i)];
	w_direct_trans_into_x_dash(i) = w_direct' * x_dash;
end,
figure(1,"position",get(0,"screensize"));
hold on;
scatter(X_train, y_train);
hold on;
plot(X_train, w_direct_trans_into_x_dash,'LineWidth',3,"r-");
xlabel ("feature", "fontsize", 28);
ylabel ("label", "fontsize", 28);
title ("Step #4", "fontsize", 28);
set(gca, "fontsize", 28);
hold off;
pause;
close;

#step_5

for nepoch = 1:2,
	for j = 1:n_train,
		x_dash = [1; X_train(j)];
		eta = 0.00000001;
		w = w - eta * (w' * x_dash - y_train(j)) * x_dash;
		if (mod(j,100) == 0),
			if(j <= 1500 && nepoch == 1),
				for i = 1:n_train,
					x_dash = [1; X_train(i)];
					w_trans_into_x_dash(i) = w' * x_dash;
				end,
				figure(1,"position",get(0,"screensize"));
				hold on;
				scatter(X_train, y_train);
				hold on;
				plot(X_train, w_trans_into_x_dash,'LineWidth',3,"r-");
				xlabel ("feature", "fontsize", 28);
				ylabel ("label", "fontsize", 28);
				title ("Step #5", "fontsize", 28);
				set(gca, "fontsize", 28);
				hold off;
				pause;
				close;
			end,
		end,
	end,
end,

#step_6


for i = 1:n_train,
	x_dash = [1; X_train(i)];
	w_trans_into_x_dash(i) = w' * x_dash;
end,
figure(1,"position",get(0,"screensize"));
hold on;
scatter(X_train, y_train);
hold on;
plot(X_train, w_trans_into_x_dash,'LineWidth',3,"r-");
xlabel ("feature", "fontsize", 28);
ylabel ("label", "fontsize", 28);
title ("Step #6", "fontsize", 28);
set(gca, "fontsize", 28);
hold off;
pause;
close;

#step_7

fo2 = csvread("test.csv");
n_test = 1000;
X_test = fo2([2:1001], 1);
y_test = fo2([2:1001], 2);
i = ones(n_test,1);
New_X_test = [i, X_test];

y_pred1 = New_X_test * w;
y_pred2 = New_X_test * w_direct;

se_w = 0;
for i = 1:n_test,
	se_w = se_w + (y_pred1(i) - y_test(i)) ** 2;
end,	
rmse_w = sqrt(se_w/n_test);

disp(sprintf("Root mean squared error for w is %.9f", rmse_w));

se_w_direct = 0;
for i = 1:n_test,
	se_w_direct = se_w_direct + (y_pred2(i) - y_test(i)) ** 2;
end,	
rmse_w_direct = sqrt(se_w_direct/n_test);

disp(sprintf("Root mean squared error for w_direct is %.9f", rmse_w_direct));

exit;
