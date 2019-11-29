%Calculo força tangencial e radial (normal)
%Calculo das reações no eixo(Radial) juntamente com os Graficos DEC e DMF
%Consideramos todas as somatorias de fy e momentos em A = 0
function eixo_um_e_tres_radial (Torque,Diametro_Primitivo,Distancia_centro_engrenagem,Distancia_total_eixo,nome_eixo,subi_plot1,subi_plot2)

    angulo_pressao = 20; 
    phi = (angulo_pressao * pi/180);
    Ft = (Torque/(Diametro_Primitivo/2))
    Fr = Ft*tan(phi)    
    fprintf ('\n')
    Fr2r=((Fr*Distancia_centro_engrenagem)/Distancia_total_eixo) %força de reação em B
    Fr1r=(Fr - Fr2r) %força de reação em A
    
    Soma_Vetorial = sqrt((Ft.^2)+(Fr.^2))
    
   %calculo do momento tangencial
    Momento_R = Fr1r*Distancia_centro_engrenagem
      
   %Gráfico de esforços do primeiro/terceiro eixo.
    y2=[Fr1r,Fr1r,-Fr2r,-Fr2r,0];
    x2=[0,Distancia_centro_engrenagem,Distancia_centro_engrenagem,Distancia_total_eixo,Distancia_total_eixo];
    subplot(4,3,subi_plot1), 
    plot(x2,y2); grid on;
    titulo_eixo = sprintf('Forcas Radial no %s',nome_eixo);
    title(titulo_eixo);
    xlabel('Comprimento em m');
    ylabel('Forcas em N');

    %Gráfico de momento do primeiro/terceiro eixo.
    y3=[0,((-1)*Momento_R),0];
    x3=[0,Distancia_centro_engrenagem,Distancia_total_eixo];
    subplot(4,3,subi_plot2),
    plot(x3,y3); grid on;
    titulo_eixo = sprintf('Momento Radial no %s',nome_eixo);
    title(titulo_eixo);
    xlabel('Comprimento em m');
    ylabel('Momento em N.m'); 

endfunction