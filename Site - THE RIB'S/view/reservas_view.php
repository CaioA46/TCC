
	<!-- ** Link para o CSS ** -->
	<link rel="stylesheet" type="text/css" href="estilo/estilo_reservas.css">

	<div id="principal" style="background-image:url('slides/2.png');">

		<!-- ** Inicio do Slide ** -->
		<div id='slide'>
			
		</div>
		<!-- ** Fim do Slide ** -->

		<form action="router.php?acao=reservar" method="post" id='campos_reserva'>

			<table id="tbl_campos">
				<tr id="tr_menor">
					<td> Filial:
						<select name="slcFilial">
							<option> selecione </option>
							<option value="1"> 1 </option>
							<option value="2"> 2 </option>
							<option value="3"> 3 </option>
							<option value="4"> 4 </option>
						</select>
					</td>
					<td> Mesa:
						<select name="slcMesa">
							<option> selecione </option>
							<option> 2 pessoas </option>
							<option> 4 pessoas </option>
							<option> 6 pessoas </option>
							<option> de 6 á 10 pessoas </option>
							<option> mais de 10 </option>
						</select>
						<p>
							<a href="#outros" class="lightbox" onclick="abrirImagem('imagens/teste.png');">
								Veja a mesa
							</a>
						</p>
					</td>
				</tr>
				<tr id="tr_maior">
					<td> Horário:
						<select name="slcHora">
							<option> selecione </option>
							<option> Almoço </option>
							<option> Jantar </option>

						</select>
					</td>
					<td> <button type="button" name="button">Confirmar Reserva </button> </td>
				</tr>
			</table>

		</form>

	</div>
