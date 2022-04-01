// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function main(){
	/*
	Essa funcao realiza as regras do jogo em cada celula da grid e aplica as mudancas para o proximo step
	*/
	var mudancas = [];														// Armazenador das configuracoes da grid no proximo step
	var contador = 0;														// Conta o numero de mudancas e o endereco da mudanca
	
	for (var xx_coluna = 0; xx_coluna < numero_colunas; xx_coluna ++) {
		for (var yy_linha = 0; yy_linha < numero_linhas; yy_linha ++) {		// Procura em todas as celulas
			var vizinhos = encontrar_vizinhos(xx_coluna, yy_linha);
			
			if grid[# xx_coluna, yy_linha] == VIVO and vizinhos < 2 {					// Morre de solidao
				mudancas[contador] = [xx_coluna, yy_linha, MORTO];
				contador ++;
			}
			else if grid[# xx_coluna, yy_linha] == VIVO and vizinhos > 3 {				// Morre de superpopulacao
				mudancas[contador] = [xx_coluna, yy_linha, MORTO];
				contador ++;
			}
			else if grid[# xx_coluna, yy_linha] == MORTO and vizinhos == 3 {				// Nasce uma celula
				mudancas[contador] = [xx_coluna, yy_linha, VIVO];
				contador ++;
			}
			// Qualquer celula viva com 2 ou 3 vizinhos continua viva
		}
	}
	
	for (var i = 0; i < contador; i ++) {
		grid[# mudancas[i][0], mudancas[i][1]] = mudancas[i][2];			// Aplica as mudancas na grid
	}
}

function encontrar_vizinhos (xx, yy) {
	// Calculo dos vizinhos
	var vizinhanca = 0;
			
	if (xx != 0 and xx != numero_colunas - 1) and (yy != 0 and yy != numero_linhas - 1) {		// Se a celula nao estiver em um dos cantos
		// Procura por todos os 8 vizinhos
		vizinhanca += (grid[# xx - 1, yy - 1] + grid[# xx, yy - 1] + grid[# xx + 1, yy - 1]);
		vizinhanca += (grid[# xx - 1, yy] + grid[# xx + 1, yy]);
		vizinhanca += (grid[# xx -1, yy + 1] + grid[# xx, yy + 1] + grid[# xx + 1, yy + 1]);
	}
	else {																						// Mas, se estiver em um canto
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
		
		if (xx == 0) and (yy == 0) {															// Procura nas quinas
			// Canto superior esquerdo -> pocurar apenas pelos vizinhos em D, ID e I.
			var D = grid[# xx + 1, yy];
			var ID = grid[# xx + 1, yy + 1];
			var I = grid[# xx, yy + 1];
			
			vizinhanca = D + ID + I;
		}
		else if (xx == numero_colunas - 1) and (yy == numero_linhas - 1) {
			// Canto inferior direito -> procurar apenas pelos vizinhos em S, E e SE.
			var E = grid[# xx - 1, yy];
			var SE = grid[# xx - 1, yy - 1];
			var S = grid[# xx, yy - 1];
			
			vizinhanca = E + SE + S;
		}
		else if (xx == 0) and (yy == numero_linhas - 1) {
			// Canto inferior esquerdo -> procurar apenas pelos vizinho em S, SD e D.
			var S = grid[# xx, yy - 1];
			var SD = grid[# xx + 1, yy - 1];
			var D = grid[# xx + 1, yy];
			
			vizinhanca = S + SD + D;
		}
		else if (xx == numero_colunas - 1) and (yy == 0) {
			// Canto superior direito -> procurar pelos vizinhos em I, IE e E.
			var I = grid[# xx, yy + 1];
			var IE = grid[# xx - 1, yy + 1];
			var E = grid[# xx - 1, yy];
			
			vizinhanca = I + IE + E;
		}
		else if (xx == 0) {																		// Procura nos lados
			// Canto esquerdo -> procurar em S, SD, D, ID e I.
			var S = grid[# xx, yy - 1];
			var SD = grid[# xx + 1, yy - 1];
			var D = grid[# xx + 1, yy];
			var ID = grid[# xx + 1, yy + 1];
			var I = grid[# xx, yy + 1];
			
			vizinhanca = S + SD + D + ID + I;
		}
		else if (xx == numero_colunas - 1) {
			// Canto direito -> procurar em I, IE, E, SE e S.
			var I = grid[# xx, yy + 1];
			var IE = grid[# xx - 1, yy + 1];
			var E = grid[# xx - 1, yy];
			var SE = grid[# xx - 1, yy - 1];
			var S = grid[# xx, yy - 1];
			
			vizinhanca = I+ IE+ E + SE + S;
		}
		else if (yy == 0) {
			// Canto superior -> procurar em D, ID, I, IE e E.
			var D = grid[# xx + 1, yy];
			var ID = grid[# xx + 1, yy + 1];
			var I = grid[# xx, yy + 1];
			var IE = grid[# xx - 1, yy + 1];
			var E = grid[# xx - 1, yy];
			
			vizinhanca = D + ID + I + IE + E;
		}
		else {// yy == numero_colunas - 1
			// Canto inferior -> procurar em S, SD, D, E e SE.
			var S = grid[# xx, yy - 1];
			var SD = grid[# xx + 1, yy - 1];
			var D = grid[# xx + 1, yy];
			var E = grid[# xx - 1, yy];
			var SE = grid[# xx - 1, yy - 1];
			
			vizinhanca = S + SD + D + E + SE;
		}
		return vizinhanca;
	}
}
