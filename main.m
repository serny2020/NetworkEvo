clc;
clear all;


plot_interval=0.05;
Final_stretch=1.7;
sigma_max=First_piola(Final_stretch,Final_stretch);
unloading_lim_1=Final_stretch;
unloading_lim_2=1.4;

x_seq=[];
z_seq=[];
lim=ceil((Final_stretch-1)/plot_interval);
for x=0:lim;
    x_seq(end+1)=1+x*plot_interval;
    y_seq(end+1)=First_piola((1+x*plot_interval),(1+x*plot_interval));
end



x2_seq=[];
y2_seq=[];
lim_1=ceil((Final_stretch-1)/plot_interval);
for x=0:lim_1
    x2_seq(end+1)=1+x*plot_interval;
    y2_seq(end+1)=First_piola(1+x*plot_interval,unloading_lim_1);
end

plot(x_seq,y_seq,x2_seq,y2_seq)


x3_seq=[];
z3_seq=[];
lim_2=ceil(((unloading_lim_2-1)/plot_interval));
for x=0:lim_2
    x3_seq(end+1)=1+x*plot_interval;
    y3_seq(end+1)=First_piola(1+x*plot_interval,unloading_lim_2);
end
plot(x_seq,y_seq,x2_seq,y2_seq,x3_seq,y3_seq)
axis([1 Final_stretch 0 sigma_max])
xlabel('stretch')
ylabel('stress')
title('y-direction')
grid on
    