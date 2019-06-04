{foreach from=$reporte item=r}
				<section class="cta">
					<div class="cta-inner text-center rounded">
						<h2 class="section-heading my-0.2">
							<span class="section-heading-upper">N° Denuncia {$r["id_reporte"]}</span>
							<span class="section-heading-lower">{$r["nombre"]} {$r["apellido"]}</span>
							</h2>
							<p>DNI: {$r["dni"]}</p>
							<p>Direccion del denunciante: {$r["direccionUsuario"]}</p>
							{if isset($r['rutaImagen'])}
						<img class="img-fluid" src="{$r['rutaImagen']}" alt="" width="70%" lenght="70%">
						{/if}
						{if !empty($r['rutaVideo'])}
						<video  src="{$r['rutaVideo']}" width="70%" lenght="70%"></video>
						{/if}
						<h3 class="my-3">Datos de la denuncia</h3>
						<p>Dirección: Misones 232</p>
						<p>Fecha de denuncia: {$r["fechaCreacion"]}</p>
					</div>
				</section>
			{/foreach}


