%Calculo força tangencial e radial (normal)
%Calculo das reações no eixo(Radial) juntamente com os Graficos DEC e DMF
%Consideramos todas as somatorias de fy e momentos em A = 0
function eixo_dois_radial (Torque,Diametro_Primitivo,Diametro_Primitivo_Pinhao_par2,Distancia_centro_engrenagem,Distancia_total_eixo)

    angulo_pressao = 20; 
    phi = (angulo_pressao * pi/180);
    Ft_primeiropar = (Torque/(Diametro_Primitivo/2))
    Ft_segundopar = ((Torque*6)/(Diametro_Primitivo_Pinhao_par2/2)) %relação 1:6 do torque
    angulo_pressao = 20; 
    phi = (angulo_pressao * pi/180);
    Fr_primeiropar = Ft_primeiropar*tan(phi)
    Fr_segundopar = Ft_segundopar*tan(phi)
    fprintf ('\n')
     %calculando as reações FRA e FRD (forças nos pontos A e D)
     Frd= ((Fr_primeiropar*Distancia_centro_engrenagem)+ (Fr_segundopar*...
         (Distancia_total_eixo-Distancia_centro_engrenagem))/...
         Distancia_total_eixo)
     Fra = (Fr_primeiropar+Fr_segundopar)-Frd
     fprintf ('\n')
     %reação das forças no eixo, para o primeiro trecho AB, temos a força
     %resultante do primeiro par de engrenagens 
     % Trecho AB pela esquerda (0<=x<=0,03)
     Frb_AB=Fra
     Momento_B=(Frb_AB*Distancia_centro_engrenagem)
     fprintf ('\n')
     %Trecho BC pela esquerda (0,03<=x<=0,09)
     Frc_AB = Fra -Fr_primeiropar
     Momento_BC = (Frc_AB *  (Distancia_total_eixo-Distancia_centro_engrenagem))
     fprintf ('\n')
     %Trecho CD pela direita (0<=x<=0,03)
     Frd_AB = -Frd
     Momento_CD= (Frd.*Distancia_centro_engrenagem)
     fprintf ('\n')
      %Gráfico de esforços do primeiro eixo.
     y=[Frb_AB,Frb_AB,Frc_AB,Frc_AB,Frd_AB,Frd_AB,0];
     x=[0,Distancia_centro_engrenagem,Distancia_centro_engrenagem,...
         (Distancia_total_eixo-Distancia_centro_engrenagem),...
         (Distancia_total_eixo-Distancia_centro_engrenagem),...
         Distancia_total_eixo,Distancia_total_eixo];
     subplot(4,3,11), 
     plot(x,y); grid on;
     title('Forcas Radial do Segundo Eixo');
     xlabel('Comprimento em m');
     ylabel('Forcas em N');

     %Gráfico de momento do primeiro eixo.
     y1=[0,Momento_B,Momento_CD,0];
     x1=[0,Distancia_centro_engrenagem,(Distancia_total_eixo-Distancia_centro_engrenagem),Distancia_total_eixo];
     subplot(4,3,12),
     plot(x1,y1); grid on;
     title('Momento Radial do Segundo Eixo');
     xlabel('Comprimento em m');
     ylabel('Momento em N.m');


end