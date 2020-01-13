<div class="section-title">
   <div class="psevdo-h4"><?php echo $heading_title; ?></div>
</div>
<div id="special_<?php echo $neme_mod_md5; ?>" class="row">
   <?php foreach ($products as $product) { ?>
   <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <div class="product-thumb transition">
         <div class="tov">
            <div class="tov-img">
               <?php if (!$product['special']) { ?>
               <?php } else { ?>
                <span><?php echo $stock; ?> <?php echo $product['percent']; ?></span>
               <?php } ?>
               <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
               <div class="but-block">
                  <div onclick="cart.add('<?php echo $product['product_id']; ?>');" class="cart-b" ><?php echo $button_cart; ?></div>
                  <div data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="icon-b"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
                  <div data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="icon-b" ><i class="fa fa-exchange" aria-hidden="true"></i></div>
               </div>
            </div>
            <div class="caption">
               <h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
               <p><?php echo $product['description']; ?></p>
               	
			<?php if ($product['rating']>=0)  { ?>		
			
               <div class=" rate">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <i class="fa fa-star-o" aria-hidden="true"></i>
                  <?php } else { ?>
                  <i class="fa fa-star" aria-hidden="true"></i>
                  <?php } ?>
                  <?php } ?>
               </div>
               <?php } ?>
               <?php if ($product['price']) { ?>
               <div class="price" data-end-date="<?php echo $product['date_end']; ?>">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <?php echo $product['special']; ?> <span><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <!--   <?php if ($product['tax']) { ?>
                     <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                     <?php } ?> -->
               </div>
               <?php } ?>
            </div>
         </div>
      </div>
   </div>
   <?php } ?>
</div>

<script>

(function(){
	$('#special_<?php echo $neme_mod_md5; ?> .product-thumb > div').each(function(){
		var $new=$(this).find('.price');
		if($new.length&&$new.attr('data-end-date')){
			$(this).find('.caption').after('<div class="countdown"></div>');
			console.log('test');
		}
		Journal.countdown($(this).find('.countdown'),$new.attr('data-end-date'));
	});
}());

</script>