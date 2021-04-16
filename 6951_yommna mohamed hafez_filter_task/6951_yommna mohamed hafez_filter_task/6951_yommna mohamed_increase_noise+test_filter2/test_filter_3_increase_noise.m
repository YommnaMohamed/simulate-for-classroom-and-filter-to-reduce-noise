fs = 44100;     %sampling frquency (Hz)
time =10;        %time of  recording duration (Sec)
                  %read audio file
[signal,fs]=audioread('myicrease.wav');    %reading recording file

% play the signal
 sound(signal,fs,16); % function that convert signal data to sound
 signal = signal(:,1); % signal displaying in axies
 samples =length(signal); % number of samples
 t =(0:samples-1)/fs;% discretize time
 samples/fs;
 %plot in time domain
 figure(1);plot(t,signal)
 grid on
 xlabel('time')
 ylabel('Aplitude')
 title('Rpreesentation of signal(t)')
 %reading frequences from the ploy
 signal_k = abs(fft(signal)); %to calculate absolute value of fft
 f = linspace(0,fs,samples); %discretize frquency
 % plot Amplitudeplitude spectrun of signal
 figure(2);plot(f,signal_k)
 grid on
 xlabel('frequency')
 ylabel('|x(f)|')
 title(' Amplitudeplitude spectrun of signal')
 % designing bandstop FIR fiter
 order =100; % fiter order
 fc = 866;  %cutoff frquency of filter
 a = 1;      %Y factor in the filter equation
 b = fir1(order, [200  3000]/(fs/2), 'stop');%X factor in the filter equation

 % plot impulse response
 figure(3);impz(b,a),grid; % get samples and plot it
 xlabel('samples')
 ylabel('Amplitude')
 title('impulse response ')
 % compute and display frequency response
 f = (0:.001:1)*fs/2;
 H = freqz(b,a,f,fs);
 figure(4);plot(f,abs(H)),grid;
 xlabel('frequency f (hz)')
 ylabel('frequency responce')
 title('bandstop filter')
 output =filter(b,a,signal);%function that uses for filtring the recording
 sound(output,fs) %converting output data to sound
 
  %saving the output in wave files
 audiowrite('out2.wav',output,fs)% save sound into file
 
 %plot Time doain representation
 figure(5);plot(t,output),grid;
 xlabel('time')
 ylabel('Amplitude')
 title('Time doain representation')
 output_k = abs(fft(output));%to calculate absolute value of fft
 f =linspace(0,fs,samples);%discretize frquency
 %plot amplitude spectrum
 figure(6);plot(f,output_k),grid;
 title('amplitude spectrum')
 xlabel('frequency')
 ylabel('|signal(f)|')
 
 