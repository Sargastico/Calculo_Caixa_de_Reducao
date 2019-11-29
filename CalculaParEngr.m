%Funcao para calculo de pares "coroa - pinhao".
%retorna o torque e o diametro primitivo do pinhao.
%Para retornar mais valores calculados, adicionar variaveis no array 'ret'.

function ret = CalculaParEngr(modulo, potencia_motor, numero_dentes_pinhao, velocidade_motor_RPM, relacao_um_para_x)

    Pcp = (modulo*pi);                                                   %cálculo de passo circular do par.
    pdp = (1/modulo);                                                    %cálculo do passo diametral do par.
    Dp_Pinhao = modulo*numero_dentes_pinhao;                             %cálculo de diâmetro primitivo do pinhão.
    De_pinhao = (Dp_Pinhao+(2*modulo));                                  %cálculo do diâmetro externo do pinhão.
    H_pinhao_pinhao = (modulo+(1/6)*modulo);                             %cálculo da altura do pé do dente do pinhão;
    Di_pinhao = (Dp_Pinhao-2*H_pinhao_pinhao);                           %cálculo do diâmetro interno do pinhão.
    H_pinhao = (2*modulo+(1/6)*modulo);                                  %cálculo da altura do dente do pinhão.
    Adendo_Pinhao = 1*modulo;                                            %cálculo de adendo do pinhão.
    Dedendo_Pinhao = 1.25*modulo;                                        %cálculo de dedendo do pinhão.
    lmip = 6*modulo;                                                     %cálculo de lar_coroaura mínima da en_coroarena_coroaem
    lmap = 10*modulo;                                                    %cálculo da lar_coroaura máxima da en_coroarena_coroaem
    N_coroa = relacao_um_para_x*numero_dentes_pinhao;                    %cálculo do número de dentes da coroa.
    dp_coroa = modulo*N_coroa;                                           %cálculo de diâmetro primitivo da coroa.
    de_coroa = (dp_coroa+(2*modulo));                                    %cálculo do diâmetro externo da coroa.
    H_pinhao_coroa = (modulo+(1/6)*modulo);                              %cálculo da altura do pé do dente da coroa.
    di_coroa = (dp_coroa-2*H_pinhao_coroa);                              %cálculo do diâmetro interno da coroa.
    h_coroa = (2*modulo+(1/6)*modulo);                                   %cálculo da altura do dente da coroa.
    ad_coroa = 1*modulo;                                                 %cálculo de adendo da coroa.
    dd_coroa = 1.25*modulo;                                              %cálculo de dedendo da coroa.
    lmi_coroa = 6*modulo;                                                %cálculo de lar_coroaura mínima da en_coroarena_coroaem
    lma_coroa = 10*modulo;                                               %cálculo da lar_coroaura máxima da en_coroarena_coroaem
    velocidade_motor_hertz = velocidade_motor_RPM/60;                    %velocidade do motor em Hz.
    V = (pi*(Dp_Pinhao/1000)*velocidade_motor_RPM)/60;                   %velocidade linear do pinhão.
    Wt = (60000*potencia_motor)/(pi*Dp_Pinhao*velocidade_motor_RPM);     %car_coroaa transmitida do pinhão.
    Kv = (6.1+V)/6.1;                                                    %fator dinâmico do pinhão.
    Tp = (Wt*1000)*((Dp_Pinhao/1000)/2);                                 %cálculo de torque do pinhão.
    T_coroa = Tp*relacao_um_para_x;                                      %cálculo de torque da coroa, com o _coroaanho de 2 do torque do pinhão.
    w1 = (V*2)/Dp_Pinhao;                                                %cálculo de velocidade an_coroaular do pinhão.
    w2 = (V*2)/dp_coroa;                                                 %cálculo de velocidade an_coroaular da coroa.
    nf = velocidade_motor_RPM/relacao_um_para_x;                         %cálculo de rpm final do primeiro par, é a metade por dobrar o diâmetro das en_coroarena_coroaens

    ret = [Tp, Dp_Pinhao]; 
    
    format short;
    
    fprintf ('\nPasso circular do par = %f \n',Pcp)
    fprintf ('Passo diametral do par = %f dentes/mm\n \n',pdp)
    
    fprintf ('\n----------------------------<< PINHÃO >>----------------------------\n\n')
    
    fprintf ('Diâmetro primitivo = %f mm\n',Dp_Pinhao)
    fprintf ('Diâmetro externo = %f mm\n',De_pinhao)
    fprintf ('Diâmetro interno = %f mm\n',Di_pinhao)
    fprintf ('Altura do pé do dente = %f mm\n',H_pinhao_pinhao)
    fprintf ('Altura do dente = %f mm\n',H_pinhao)
    fprintf ('Adendo = %f mm\n',Adendo_Pinhao)
    fprintf ('Dedendo = %f mm\n',Dedendo_Pinhao)
    fprintf ('Largura mínima = %f mm\n',lmip)
    fprintf ('Largura máxima = %f mm\n',lmap)
    fprintf ('Velocidade = %f m/s\n',V)
    fprintf ('Carga transmitida = %f kN\n',Wt)
    fprintf ('Fator dinâmico = %f \n',Kv)
    fprintf ('Torque = %f N.m\n',Tp)
    fprintf ('Velocidade angular = %f rad/s\n',w1)
    
    fprintf ('\n----------------------------<< COROA >>----------------------------\n\n')
    
    fprintf ('Número de dentes = %d dentes\n',N_coroa)
    fprintf ('Diâmetro primitivo = %f mm\n',dp_coroa)
    fprintf ('Diâmetro externo = %f mm\n',de_coroa)
    fprintf ('Diâmetro interno = %f mm\n',di_coroa)
    fprintf ('Altura do pé do dente = %f mm\n',H_pinhao_coroa)
    fprintf ('Altura do dente = %f mm\n',H_pinhao)
    fprintf ('Adendo = %f mm\n',ad_coroa)
    fprintf ('Dedendo = %f mm\n',dd_coroa)
    fprintf ('Largura mínima = %f mm\n',lmi_coroa)
    fprintf ('Largura máxima = %f mm\n',lma_coroa)
    fprintf ('Torque = %f N.m\n',T_coroa)
    fprintf ('Velocidade angular = %f rad/s\n',w2)
    fprintf ('Rotação = %f rpm\n\n',nf)
    
endfunction









