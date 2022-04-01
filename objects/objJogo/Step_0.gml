/// @acoes_menu

if iniciar {		// Inicia o jogo apos apertar enter
	main();
	
	// Caso todas as celulas morram ele finaliza o jogo.
	if ds_grid_get_sum(grid, 0, 0, numero_colunas - 1, numero_colunas - 1) == 0 {
		iniciar = false;
	}
}
else {
	mudar_tamanho();
	montar_celulas();
	salvar_grid();
}


