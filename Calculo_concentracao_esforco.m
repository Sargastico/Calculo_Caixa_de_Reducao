function Calculo_concentracao_esforco (Vetor_momento_fletor1,Vetor_momento_fletor2,Vetor_distancia_eixo,Torque,Ponto_interesse)
    %Calculo dos diametros escalonados para o segundo eixo
    %Combinando as forças nas componentes ortogonais, escolhemos o ponto localizado
    %a 75mm de distancia a patir da ponta do eixo pois o momento flexor é alto e existe
    % torque nessa região, assim:
    %
    y1 = Vetor_momento_fletor1; %Momento Fletor em X-Y
    y4 = Vetor_momento_fletor2; %Momento Fletor em X-Z
    x4 = Vetor_distancia_eixo;  %Distancia do eixo
    Tm = Torque;                %Torque do eixo
    
    for i = 1:3
    X_momento_combinado(i) = [x4(i)];
    Y_momento_combinado(i) = [sqrt(y1(i).^2+y4(i).^2)];
    end
  
    %Ponto Critico 1
    X = Ponto_interesse;
    Ma = Y_momento_combinado(2)-(((Y_momento_combinado(2)-Y_momento_combinado(1))...,
    /(X_momento_combinado(2)-X_momento_combinado(1)))*(X_momento_combinado(2)-X));
    %
    plot(X_momento_combinado,Y_momento_combinado);
    hold on;
    scatter(X,Ma,'fill');
    grid on;
    xlim([0 x4(3)]);
    title('Diagrama de Momento Combinando');
    xlabel('Comprimento em m');
    ylabel('Momento em N.m');
    %
    %Assumindo um raio generoso para a engrenagem no ponto de analise, temos:
    %Com base na tabela 7-1, kt =1.7 e kts = 1.5, usando um criterio conservativo kf = kt e kfs = kts
    Kf = 1.7;
    Kt = 1.7;
    Kfs = 1.5;
    Kts = 1.5;
    % Aço 1020 estirado a frio (CD), com Sut = 469 Mpa, para Se:
    Sut = 469; %Mpa
    a = 4.51; % Tabela-6.3 
    b = -0.265;
    Ka = a*Sut^b;
    Kb = 0.9; %Admitindo Kb = 0.9
    Se = Ka*Kb*0.5*Sut; %Mpa
    %Usaremos o criterio de goodman. Como Mn = Ta = 0; então:
    %
    n = 2; %Fatpr de segurança;
    d = ((16*n/pi)*((2*Kf*Ma)/(Se*10^6)+(sqrt((3*Kfs*Tm)^2))/(Sut*10^6)))^(1/3); %Diametro
    fprintf('Diametro na seção desejada \n D = %d m \n\n',d);
    %
    Kt = 1.6; % Figura A15-9
    q = 0.82; % Figura 6-20
    Kf =  1+q*(Kt-1);
    Kts = 1.35; % Figura A-15-8
    qs = 0.95; %Figura 6-20
    Kfs = 1+qs*(Kts-1);
    Kb = (d*1000/7.62).^(-0.107);
    Se = Ka*Kb*0.5*Sut;
    Sigma_linha = (32*Kf*Ma)/(pi*d^3);
    Sigma_linha = Sigma_linha/10^6;
    Sigma_med = (3*(((16*Kfs*Tm/(pi*d^3)))^2))^(1/2);
    Sigma_med = Sigma_med/10^6;
    %Pelo critério de Goodman modificado:
    Nf_1 = 1/((Sigma_linha/Se)+(Sigma_med/Sut));
    fprintf('Pelo critério de Goodman modificado:\n Nf_%d - %d \n\n',1, Nf_1);
    %Pelo critério de Gerber:
    Nf_2 = 0.5*((Sut/Sigma_med)^2)*(Sigma_linha/Se)*(-1+sqrt(1+((2*Sigma_med*Se)/(Sut*Sigma_linha))^2));
    fprintf('Pelo critério de Gerber: \n Nf_%d - %d \n\n',2,Nf_2)
end