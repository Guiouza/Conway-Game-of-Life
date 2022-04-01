// @grid_funcoes Funcoes de controle da grid
function criar_grid(){
	numero_colunas = room_width div tamanho_celula;
	numero_linhas = room_height div tamanho_celulas;
	
	grid = ds_grid_create(numero_colunas, numero_linhas);
	ds_grid_clear(grid, MORTO);
}