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
    <td>
      Estado
    </td>
	</tr>
</thead>
<tbody>
	<tr>
		{foreach from=$posiciones item=posicion}
		<td>{$posicion['nro_estanteria']}</td>
		<td>{$posicion['nro_fila']}</td>
		<td>{$posicion['nro_posicion']}</td>
    <td>{if $posicion['estado'] eq 1} OCUPADO {/if}</td>

		{/foreach}
	</tr>
