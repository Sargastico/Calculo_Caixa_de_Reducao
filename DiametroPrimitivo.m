
function EscolhaDiametroPrimitivo = DiametroPrimitivo(numero_dentes, indice_do_modulo, boolean_print)
  
  modulo = [1.00 1.25 1.50 2.00 2.50 3.00 4.00 5.00 6.00 8.00 10.00 12.00 16.00 20.00 25.00 32.00 40.00 50.00];
  
  for i = modulo
    Diametro_Primitivo = modulo*numero_dentes;
    printf("\n\nDiametro Primitivo em Milimetros = %d \n",Diametro_Primitivo(indice_do_modulo));
    printf("Para modulo = %d \n",modulo(indice_do_modulo));
    printf("\nFull 'ans' array:\n");
  endfor
  
endfunction
