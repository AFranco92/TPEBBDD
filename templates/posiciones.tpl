<thead>
	<tr>
		<td>
			Nro Estanteria
		</td>
		<td>
			Nro Fila
		</td>
		<td>
			Nro Posicion
		</td>
	</tr>
</thead>
<tbody>
	{foreach from=$posiciones item=posicion}
	<tr>
		<td>{$posicion['nro_estanteria']}</td>
		<td>{$posicion['nro_fila']}</td>
		<td>{$posicion['nro_posicion']}</td>
	</tr>
	{/foreach}
</tbody>
