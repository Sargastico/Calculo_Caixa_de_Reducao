%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dimensionamento de eixos e engrenagens para caixa de redução           %
% Coded by: Fernando M. (Sargx90), Alvaro M. (advan7age), Rhuan Martins  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;

% >> Entrada de dados (SI) << %

velocidade_motor_RPM = [3380, 563.33];        %Inserir nos indices do array, os dados para cada par. Nesse caso 2 pares.
potencia_motor_KW = 1.5;
modulo_engrenamento = 3;
numero_dentes_pinhao = [16, 17];              %Inserir nos indices do array, os dados para cada par. Nesse caso 2 pares.
relacao_um_para_x = [6, 8];                   %Inserir as relacoes '1:X', onde o valor 'X' deve ser colocado no array.
angulo_pressao = 20;                 
Distancia_centro_engrenagem = [0.03, 0.09];   %Distancias escolhidas com base no tamanho das engrenagens        
Distancia_total_eixo = 0.12;                   

% >> Parametros para Pinhão e Coroa << %

for i = 1:(numel(numero_dentes_pinhao))

  fprintf ('\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< PAR %d >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n',i)
  ret_func = CalculaParEngr(modulo_engrenamento, potencia_motor_KW, numero_dentes_pinhao(i), velocidade_motor_RPM(i),relacao_um_para_x(i))
  Torque(i) = ret_func(1);
  Diametro_Primitivo(i) = ret_func(2);
  
endfor

% >> Cálculo da força de reação nos eixos e plot dos gráficos << %

eixo_um_e_tres_tangencial(Torque(1),(Diametro_Primitivo(1)/1000),Distancia_centro_engrenagem(1),Distancia_total_eixo,'Primeiro Eixo',1,2)
fprintf ('\n______________________________________________________________________\n\n')
eixo_um_e_tres_radial(Torque(1),(Diametro_Primitivo(1)/1000),Distancia_centro_engrenagem(1),Distancia_total_eixo,'Primeiro Eixo',3,4)
fprintf ('\n______________________________________________________________________\n\n')

eixo_dois_tangencial (Torque(1),(Diametro_Primitivo(1)/1000),(Diametro_Primitivo(2)/1000),Distancia_centro_engrenagem(1),Distancia_total_eixo)
fprintf ('\n______________________________________________________________________\n\n')
eixo_dois_radial (Torque(1),(Diametro_Primitivo(1)/1000),Diametro_Primitivo(2),Distancia_centro_engrenagem(1),Distancia_total_eixo)
fprintf ('\n______________________________________________________________________\n\n')

eixo_um_e_tres_tangencial((Torque(1)*48),(Diametro_Primitivo(2)/1000),Distancia_centro_engrenagem(2),Distancia_total_eixo,'Terceiro Eixo',5,6)
fprintf ('\n______________________________________________________________________\n\n')
eixo_um_e_tres_radial((Torque(1)*48),(Diametro_Primitivo(2)/1000),Distancia_centro_engrenagem(2),Distancia_total_eixo,'Terceiro Eixo',7,8)
fprintf ('\n______________________________________________________________________\n\n')

% >>  << %