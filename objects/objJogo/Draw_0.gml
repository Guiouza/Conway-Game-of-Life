/// @desenho Desenha as linhas e colunas

for (var coluna = 0; coluna < numero_colunas; coluna++) {	// Desenha as colunas da grid
	draw_set_alpha(ALPHA_GRID);
	draw_line(coluna * tamanho_celula, 0, coluna * tamanho_celula, room_height);
}

for (var linha = 0; linha < numero_linhas; linha++) {		// Desenha as linhas da grid
	draw_set_alpha(ALPHA_GRID);
	draw_line(0, linha * tamanho_celula, room_width, linha * tamanho_celula);
}
