
            <?php if (isset($yandex_money_metrika_active) && $yandex_money_metrika_active){ ?>
                <?php echo $yandex_metrika; ?>
                <script type="text/javascript">
                    window.dataLayer = window.dataLayer || [];
                    function sendEcommerceAdd(id, quantity) {
                       $.ajax({
                            url: "<?= $yandex_money_product_info_url; ?>",
                            type: 'post',
                            data: 'id=' + id,
                            dataType: 'json',
                            success: function(json) {
                                json.quantity = quantity;
                                dataLayer.push({ecommerce: {add: {products: [json]}}});
                            }
                        });
                    }
                    $(window).on("load", function () {
                        var opencartCartAdd = cart.add;
                        cart.add = function (product_id, quantity) {
                            opencartCartAdd(product_id, quantity);
                            sendEcommerceAdd(product_id, typeof(quantity) !== 'undefined' ? parseInt(quantity) : 1);
                        };
                        $('#button-cart').on('click', function() {
                            sendEcommerceAdd($('#product input[name="product_id"]').val(), parseInt($('#product input[name="quantity"]').val()));
                        });
                    });
                </script>
            <?php } ?>
<footer class="l-container">
	<div class="footer-info">
		<div class="footer-info__content">

			<div class="footer-info__col">
				<div class="footer-info__heading h4">AV-TOOL</div>

				<ul class="footer-menu">
					<li>
						<a href="<?php echo $url_educational_center; ?>" class="footer-menu__item link--secondary">
							<div class="ico ico-training"></div>
							<?php echo $text_educational_center; ?>
						</a>
					</li>
					<li>
						<a href="<?php echo $url_catalog_tool; ?>" class="footer-menu__item link--secondary">
							<div class="ico ico-catalog"></div>
							<?php echo $text_catalog_tool; ?>
						</a>
					</li>
					<li>
						<a href="<?php echo $url_discont; ?>" class="footer-menu__item link--secondary">
							<div class="ico ico-discount"></div>
							<?php echo $text_discont; ?>
						</a>
					</li>
					<?php /*<li>
						<a href="/discounts/" class="footer-menu__item link--secondary">
							<svg class="f-svg-icon footer-menu__icon">
								<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/image/sprite.symbol.svg#percent_24px"></use>
							</svg>
							Акции
						</a>
					</li>*/ ?>
				</ul>
			</div>

			<div class="footer-info__col">
				<div class="footer-info__heading footer-info__heading--empty">&nbsp;</div>

				<ul class="footer-menu">
					<li>
						<a href="<?php echo $url_payment; ?>" class="footer-menu__item link--secondary">
							<div class="ico ico-pay"></div>
							<?php echo $text_payment; ?>
						</a>
					</li>
					<li>
						<a href="<?php echo $url_warranty; ?>" class="footer-menu__item link--secondary">
							<div class="ico ico-guaranty"></div>
							<?php echo $text_warranty; ?>
						</a>
					</li>
					<li>
						<a href="<?php echo $url_about; ?>" class="footer-menu__item link--secondary">
							<div class="ico ico-puzzle"></div>
							<?php echo $text_about; ?>
						</a>
					</li>
					<li>
						<a href="<?php echo $url_blog; ?>" class="footer-menu__item link--secondary">
							<div class="ico ico-blog"></div>
							<?php echo $text_blog; ?>
						</a>
					</li>
				</ul>
			</div>

			<div class="footer-info__col">
				<div class="footer-info__heading h4"><?php echo $text_contact_us;?></div>

				<ul class="footer-menu">
					<li>
						<div class="footer-menu__item" title="Наш адрес">
							<span>
								<?php echo $address; ?>						</span>
						</div>
					</li>

					<li>
	<a class="footer-menu__item link--secondary" href="tel:<?php echo $telephone_link; ?>"><div class="ico ico-tel"></div>
		<?php echo $telephone; ?>	
	</a>
</li>

<?php /* <li>
	<a class="footer-menu__item link--secondary" href="tel:+74957907091">
		<div class="footer-menu__icon"></div>
		+7&nbsp;495&nbsp;<nobr>790-70-91</nobr>
	</a>
</li> */?>

					<li>
	<a class="footer-menu__item link--secondary" href="mailto:<?php echo $email; ?>" title="Электропочта">
		<div class="ico ico-mail"></div>
		<?php echo $email; ?>
	</a>
</li>
					<li>
						<div class="footer-menu__item link--secondary">
							<a href="whatsapp://send?phone=79651359935" class="footer-menu__item link--whatsapp" title="Whatsapp" target="_blank">
								<svg class="f-svg-icon f-svg-icon--colored footer-menu__icon">
									<use xlink:href="/image/sprite.symbol.svg#whatsapp_24px"></use>
								</svg>
								+7 (965) 135-99-35
							</a>
						</div>
					</li>

					<?php /*<li>
						<a href="https://telegram.me/pdrcenter" class="footer-menu__item link--telegramm" title="Telegramm" target="_blank">
							<svg class="f-svg-icon f-svg-icon--colored footer-menu__icon">
								<use xlink:href="/image/sprite.symbol.svg#telegram_24px"></use>
							</svg>
							@pdrcenter
						</a>
					</li> */?>

					<li>
						<div class="footer-menu__item link--viber">
							<a href="viber://add?number=79651359935" class="footer-menu__item link--secondary" title="Viber" target="_blank">
								<svg class="f-svg-icon f-svg-icon--colored footer-menu__icon">
									<use xlink:href="/image/sprite.symbol.svg#whatsapp_24px"></use>
								</svg>
								+7 (965) 135-99-35
							</a>
						</div>
					</li>

					<li>
						<a href="skype:av-masters?add" class="footer-menu__item link--skype" title="Skype" target="_blank">
							<svg class="f-svg-icon  f-svg-icon--colored footer-menu__icon">
								<use xlink:href="/image/sprite.symbol.svg#skype_24px"></use>
							</svg>
							av-masters
						</a>
					</li>

				</ul>
			</div>

			<div class="footer-info__col">
				<div class="footer-info__heading h4"><?php echo $text_in_internet;?></div>

				<ul class="footer-menu">
					<li>
						<a href="https://vk.com/remont_vmyatin_obuchenie" class="footer-menu__item link--secondary" target="_blank">
							<svg class="f-svg-icon footer-menu__icon">
								<use xlink:href="/image/sprite.symbol.svg#vk_24px"></use>
							</svg>
							ВКонтакте
						</a>
					</li>

					<li>
						<a href="https://www.instagram.com/avmasters/" class="footer-menu__item link--secondary" target="_blank">
							<svg class="f-svg-icon footer-menu__icon">
								<use xlink:href="/image/sprite.symbol.svg#instagram_24px"></use>
							</svg>
							Instagram
						</a>
					</li>

					<li>
						<a href="https://www.youtube.com/user/avmasters1" class="footer-menu__item link--secondary" target="_blank">
							<svg class="f-svg-icon footer-menu__icon">
								<use xlink:href="/image/sprite.symbol.svg#youtube-play_24px"></use>
							</svg>
							Youtube
						</a>
					</li>

					<li>
						<div class="footer-menu__item">
							<img style="border:0" src="/image/catalog/rating_5_0.jpg" width="88" height="31" alt="Читайте отзывы покупателей и оценивайте качество магазина на Яндекс.Маркете">
						</div>
					</li>
				</ul>
			</div>

			<div class="footer-info__col">
				<div class="footer-info__heading h4"><?php echo $text_partner; ?></div>

				<?php echo $text_partner_2; ?><a class="link--secondary" href="mailto:partner@pdrc.ru"><?php echo $email; ?></a>
				<br><br>
				<?php echo $text_partner_3; ?><a class="link--secondary" href="/pdr-instrumenty/"><?php echo $text_partner_3_2; ?></a>. <br>

			</div>
		</div>
	</div>

	<div class="footer-bar">
		<div class="footer-bar__content">
			<div class="footer-bar__logo-wrap">
				<img class="footer-bar__logo" src="/image/avtool-logo.png" alt="AV-Tool">
			</div>

			<div class="footer-bar__copyright">
				<?php echo $text_copyright; ?>			</div>
		</div>
	</div>
</footer>

            <?php if ($live_search_ajax_status):?>
	            <link rel="stylesheet" type="text/css" href="catalog/view/theme/corsica/stylesheet/live_search.css" />
				<script><!--
					var live_search = {
						selector: '#search input[name=\'search\']',
						text_no_matches: '<?php echo $text_empty; ?>',
						height: '50px'
					}

					$(document).ready(function() {
						var html = '';
						html += '<div class="live-search">';
						html += '	<ul>';
						html += '	</ul>';
						html += '<div class="result-text"></div>';
						html += '</div>';

						//$(live_search.selector).parent().closest('div').after(html);
						$(live_search.selector).after(html);

						$(live_search.selector).autocomplete({
							'source': function(request, response) {
								var filter_name = $(live_search.selector).val();
								var live_search_min_length = '<?php echo (int)$live_search_min_length; ?>';
								if (filter_name.length < live_search_min_length) {
									$('.live-search').css('display','none');
								}
								else{
									var html = '';
									html += '<li style="text-align: center;height:10px;">';
									html +=	'<img class="loading" src="catalog/view/theme/default/image/loading.gif" />';
									html +=	'</li>';
									$('.live-search ul').html(html);
									$('.live-search').css('display','block');

									$.ajax({
										url: 'index.php?route=product/live_search&filter_name=' +  encodeURIComponent(filter_name),
										dataType: 'json',
										success: function(result) {
											var products = result.products;
											$('.live-search ul li').remove();
											$('.result-text').html('');
											if (!$.isEmptyObject(products)) {
												var show_image = <?php echo $live_search_show_image;?>;
												var show_price = <?php echo $live_search_show_price;?>;
												var show_description = <?php echo $live_search_show_description;?>;
												$('.result-text').html('<a href="<?php echo $live_search_href;?>'+filter_name+'" class="view-all-results"><?php echo $text_view_all_results;?> ('+result.total+')</a>');

												$.each(products, function(index,product) {
													
													if(products.length == 1) {
                                                        redirect_yes = true;
                                                        redirect_href = product.url;
												        
                                                    } else {
                                                        redirect_yes = false;
                                                    }
													
													var html = '';
													
													html += '<li>';
													html += '<a href="' + product.url + '" title="' + product.name + '">';
													if(product.image && show_image){
														html += '	<div class="product-image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
													}
													html += '	<div class="product-name">' + product.name ;
													if(show_description){
														html += '<p>' + product.extra_info + '</p>';
													}
													html += '</div>';
													if(show_price){
														if (product.special) {
															html += '	<div class="product-price"><span class="special">' + product.price + '</span><span class="price">' + product.special + '</span></div>';
														} else {
															html += '	<div class="product-price"><span class="price">' + product.price + '</span></div>';
														}
													}
													html += '<span style="clear:both"></span>';
													html += '</a>';
													html += '</li>';
													$('.live-search ul').append(html);
												});
											} else {
												var html = '';
												html += '<li style="text-align: center;height:10px;">';
												html +=	live_search.text_no_matches;
												html +=	'</li>';

												$('.live-search ul').html(html);
											}
											$('.live-search ul li').css('height',live_search.height);
											$('.live-search').css('display','block');
											return false;
										}
									});
								}
							},
							'select': function(product) {
								$(live_search.selector).val(product.name);
							}
						});

						$(document).bind( "mouseup touchend", function(e){
						  var container = $('.live-search');
						  if (!container.is(e.target) && container.has(e.target).length === 0)
						  {
						    container.hide();
						  }
						});
					});
				//--></script>
			<?php endif;?>
            
      
      <script src="catalog/view/theme/corsica/js/main.js?25072019"></script>


    <script>
      function showForm(data){
        $.ajax({
          url: 'index.php?route=product/fastorder/getForm',
          type: 'post',
          data: {product_name: data['product_name'], price: data['price'] ,product_id: data['product_id'], product_link: data['product_link']},

          beforeSend: function() {
          },
          complete: function() {
          },
          success: function(result) {
            $('#fastorder-form-container'+data['product_id']).html(result);
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + " " + xhr.statusText + " " + xhr.responseText);
          }
        });
    };
    </script>
			
   </body>
</html>