// @regras_jogo Define e executa as regras do jogo
function main(){
	/*
	Essa funcao realiza as regras do jogo em cada celula da grid e aplica as mudancas para o proximo step
	*/
	var mudancas = [];														// Armazenador das configuracoes da grid no proximo step
	var contador = 0;														// Conta o numero de mudancas e o endereco da mudanca
	
	for (var xx = 0; xx < numero_colunas; xx ++) {
		for (var yy = 0; yy < numero_linhas; yy ++) {						// Procura em todas as celulas
			#region															// Calcula os vizinhos
			/*	Vizinhos:
					----x---->
				| [SE][S][SD]
				y [E ]___[D ]
				| [IE][I][ID]
				v
			
				S: superior
				I: inferior
				E: esquerdo
				D: direito
			*/
			// Calculo dos vizinhos
			var vizinhos = 0;
			
			if (xx != 0 and xx != numero_colunas - 1) and (yy != 0 and yy != numero_linhas - 1) {		// Se a celula nao estiver em um dos cantos
				// Procura por todos os 8 vizinhos
				var S = grid[# xx, yy - 1];
				var SD = grid[# xx + 1, yy - 1];
				var D = grid[# xx + 1, yy];
				var ID = grid[# xx + 1, yy + 1];
				var I = grid[# xx, yy + 1];
				var IE = grid[# xx - 1, yy + 1];
				var E = grid[# xx - 1, yy];
				var SE = grid[# xx - 1, yy - 1];
		
				vizinhos = S + SD + D + ID + I + IE + E + SE;
			}
			else {																						// Mas, se estiver em um canto
				if (xx == 0) and (yy == 0) {															// Procura nas quinas
					// Canto superior esquerdo -> pocurar apenas pelos vizinhos em D, ID e I.
					var D = grid[# xx + 1, yy];
					var ID = grid[# xx + 1, yy + 1];
					var I = grid[# xx, yy + 1];
			
					vizinhos = D + ID + I;
				}
				else if (xx == numero_colunas - 1) and (yy == numero_linhas - 1) {
					// Canto inferior direito -> procurar apenas pelos vizinhos em S, E e SE.
					var E = grid[# xx - 1, yy];
					var SE = grid[# xx - 1, yy - 1];
					var S = grid[# xx, yy - 1];
			
					vizinhos = E + SE + S;
				}
				else if (xx == 0) and (yy == numero_linhas - 1) {
					// Canto inferior esquerdo -> procurar apenas pelos vizinho em S, SD e D.
					var S = grid[# xx, yy - 1];
					var SD = grid[# xx + 1, yy - 1];
					var D = grid[# xx + 1, yy];
			
					vizinhos = S + SD + D;
				}
				else if (xx == numero_colunas - 1) and (yy == 0) {
					// Canto superior direito -> procurar pelos vizinhos em I, IE e E.
					var I = grid[# xx, yy + 1];
					var IE = grid[# xx - 1, yy + 1];
					var E = grid[# xx - 1, yy];
			
					vizinhos = I + IE + E;
				}
				else if (xx == 0) {																		// Procura nos lados
					// Canto esquerdo -> procurar em S, SD, D, ID e I.
					var S = grid[# xx, yy - 1];
					var SD = grid[# xx + 1, yy - 1];
					var D = grid[# xx + 1, yy];
					var ID = grid[# xx + 1, yy + 1];
					var I = grid[# xx, yy + 1];
			
					vizinhos = S + SD + D + ID + I;
				}
				else if (xx == numero_colunas - 1) {
					// Canto direito -> procurar em I, IE, E, SE e S.
					var I = grid[# xx, yy + 1];
					var IE = grid[# xx - 1, yy + 1];
					var E = grid[# xx - 1, yy];
					var SE = grid[# xx - 1, yy - 1];
					var S = grid[# xx, yy - 1];
			
					vizinhos = I+ IE+ E + SE + S;
				}
				else if (yy == 0) {
					// Canto superior -> procurar em D, ID, I, IE e E.
					var D = grid[# xx + 1, yy];
					var ID = grid[# xx + 1, yy + 1];
					var I = grid[# xx, yy + 1];
					var IE = grid[# xx - 1, yy + 1];
					var E = grid[# xx - 1, yy];
			
					vizinhos = D + ID + I + IE + E;
				}
				else {// yy == numero_colunas - 1
					// Canto inferior -> procurar em S, SD, D, E e SE.
					var S = grid[# xx, yy - 1];
					var SD = grid[# xx + 1, yy - 1];
					var D = grid[# xx + 1, yy];
					var E = grid[# xx - 1, yy];
					var SE = grid[# xx - 1, yy - 1];
			
					vizinhos = S + SD + D + E + SE;
				}
			}
			#endregion
			#region															// Regras do Jogo
			if grid[# xx, yy] == VIVO and vizinhos < 2 {					// Morre de solidao
				mudancas[contador] = [xx, yy, MORTO];
				contador ++;
			}
			else if grid[# xx, yy] == VIVO and vizinhos > 3 {				// Morre de superpopulacao
				mudancas[contador] = [xx, yy, MORTO];
				contador ++;
			}
			else if grid[# xx, yy] == MORTO and vizinhos == 3 {				// Nasce uma celula
				mudancas[contador] = [xx, yy, VIVO];
				contador ++;
			}
			// Qualquer celula viva com 2 ou 3 vizinhos continua viva
			#endregion
		}
	}
	
	for (var i = 0; i < contador; i ++) {
		grid[# mudancas[i][0], mudancas[i][1]] = mudancas[i][2];			// Aplica as mudancas na grid
	}
}


function salvar_grid(){
	var tecla = -1;
	
	for (var i = 0; i <= 9; i ++) {						// Passa por todas as teclas de numero
		if keyboard_check(ord(i)) tecla = i;			// Verifica se alguma tecla foi pressionada
	}
	
	if tecla != -1 and keyboard_check(vk_lshift) {		// Salva a grid ao pressionar <shift + numero>
		ini_open("Salvar.ini");
		
		// Cria um copia da grid atual
		var _grid = ds_grid_create(numero_colunas, numero_linhas)
		ds_grid_copy(_grid, grid);
		
		// Salva o tamanho atual da celula
		var num = tamanho_celula;
		var _numero_colunas = numero_colunas;
		var _numero_linhas = numero_linhas;
		
		// Cria uma grid vazia com o tamanho maximo
		tamanho_celula = TAMANHO_MIN;
		criar_grid();
		
		// Cria uma grid com a configuração da original, mas com o tamanho maximo
		ds_grid_set_grid_region(grid, _grid, 0, 0, _numero_colunas, _numero_linhas, 0, 0);
		
		// Valta o tamanho da celula para o original
		tamanho_celula = num;
		
		ini_write_string("Salvar", string(tecla), ds_grid_write(grid));
		ini_close();
	}
	else if tecla != -1 and keyboard_check(vk_delete) {	// Exclui a configuracao salva no respectivo numero ao pressionar <del + numero>
		ini_open("Salvar.ini");
		ini_key_delete("Salvar", string(tecla));
		ini_close();
	}
	else if tecla != -1 {								// Carrega a configuracao salva do numero pressionado
		ini_open("Salvar.ini");
		ds_grid_read(grid, ini_read_string("Salvar", string(tecla), ds_grid_write(grid)));
		ini_close();
		
	}
}

