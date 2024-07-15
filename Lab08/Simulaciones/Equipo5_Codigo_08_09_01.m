 clear all; 
close all; 

%% Genera una secuencia de bits binarios para transmitir texto ASCII con Ettus B200 USRP.
%% Create message
messageText = 'MSOE University \n'; % Define el mensaje de texto a transmitir
a = dec2bin(messageText, 8); % Convierte el texto a una secuencia de bits binarios de 8 bits por carácter
numChars = size(a, 1); % Obtiene el número de caracteres en el mensaje
fprintf(char(bin2dec(a))); % Imprime en pantalla la representación decimal de los bits binarios

% Convert binary strings into vectors
a = a - '0'; % Convierte los caracteres binarios en números enteros (0 o 1)

% Reshape into a vector of bits; 8 bits per character
a = reshape(a', 8 * numChars, 1); % Reforma la matriz de bits en un vector de bits único

% Make sure string is properly recovered
b = reshape(a, 8, numChars)'; % Reforma el vector de bits en una matriz de 8 columnas por número de caracteres
b = num2str(b); % Convierte la matriz de bits en una cadena de caracteres
fprintf(char(bin2dec(b))); % Imprime en pantalla la representación decimal de los bits binarios recuperados

%% Build transmit packet
pre = [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1]; % Prefijo para el paquete de transmisión
message = [pre a']; % Concatena el prefijo y la secuencia de bits binarios
numSymsTot = length(message); % Calcula el número total de símbolos en el paquete

% Display the message and packet length
disp(['Total number of symbols in the packet: ', num2str(numSymsTot)]); % Muestra en pantalla el número total de símbolos en el paquete
disp('Transmit packet: '); % Muestra en pantalla el paquete de transmisión
disp(message); % Muestra en pantalla el contenido del paquete de transmisión


