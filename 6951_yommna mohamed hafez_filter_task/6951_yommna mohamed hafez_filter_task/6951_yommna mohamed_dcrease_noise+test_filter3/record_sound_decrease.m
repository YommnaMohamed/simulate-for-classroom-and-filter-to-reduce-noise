% record voice from microphone with beep noise 
fs = 44100; %sampling frquency
time =10; %10 seconds duration of record
recObj = audiorecorder(fs,16,1); %object of entering data in 16 bits per samples and mono
recordblocking(recObj,time); %stop record after 10 seconds
signal = getaudiodata(recObj);%save sound data
play(recObj); % to here the record
samples =length(signal); % number of samples
t = linspace(0,time,samples);%dicretize time
audiowrite('mydecrease.wav',signal,fs)% save sound into file
 