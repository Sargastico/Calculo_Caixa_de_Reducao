%Calculo força tangencial e radial (normal)
%Calculo das reações no eixo(tangencial) juntamente com os Graficos DEC e DMF
%Consideramos todas as somatorias de fy e momentos em A = 0
function eixo_um_e_tres_tangencial (Torque,Diametro_Primitivo,Distancia_centro_engrenagem,Distancia_total_eixo,nome_eixo,subi_plot1,subi_plot2)
  
    angulo_pressao = 20; 
    phi = (angulo_pressao * pi/180);
    Ft = (Torque/(Diametro_Primitivo/2))
    Fr = Ft*tan(phi)
    fprintf ('\n')
    Fr2t=((Ft*Distancia_centro_engrenagem)/Distancia_total_eixo) %força de reação em B
    Fr1t=(Ft - Fr2t) %força de reação em A
    
    Soma_Vetorial = sqrt((Ft.^2)+(Fr.^2))
    
    %calculo do momento tangencial
    Momento_T = Fr1t*Distancia_centro_engrenagem
    
    %Gráfico de esforços do primeiro/terceiro eixo.
    y=[Fr1t,Fr1t,-Fr2t,-Fr2t,0];
    x=[0,Distancia_centro_engrenagem,Distancia_centro_engrenagem,Distancia_total_eixo,Distancia_total_eixo];
    subplot(4,3,subi_plot1),
    plot(x,y); grid on;
    titulo_eixo = sprintf('Forcas Tangencial no %s',nome_eixo);
    title(titulo_eixo);
    xlabel('Comprimento em m');
    ylabel('Forcas em N');

    %Gráfico de momento do primeiro/terceiro eixo.
    y1=[0,((-1)*Momento_T),0];
    x1=[0,Distancia_centro_engrenagem,Distancia_total_eixo];
    subplot(4,3,subi_plot2),
    plot(x1,y1); grid on;
    titulo_eixo = sprintf('Momento Tangencial no %s',nome_eixo);
    title(titulo_eixo);
    xlabel('Comprimento em m');
    ylabel('Momento em N.m');
    
 
endfunction