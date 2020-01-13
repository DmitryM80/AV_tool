<?php echo $header; ?>
<?php if(isset($breadcrumbs_markup)) echo $breadcrumbs_markup; ?>
<?php if(isset($micro_markup)) echo $micro_markup; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php
      $i = 1;
      $end_b = count($breadcrumbs); ?>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php if ($i==$end_b) { ?>
        <li><?php echo $breadcrumb['text']; ?></a></li>
        <?php } else { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } $i++; ?>
        <?php } ?>
    </ul>
    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6 '; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9 '; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?> ">
            <div class="full-tov">

                <div class="row">
                    <?php if ($column_left || $column_right) { ?>
                    <?php $class = 'col-sm-6'; ?>
                    <?php } else { ?>
                    <?php $class = 'col-sm-8'; ?>
                    <?php } ?>
                    <div class="<?php echo $class; ?>">
                        <?php if ($thumb || $images) { ?>
                        <ul class="thumbnails">
                            <?php if ($thumb) { ?>
                            <li><a  class="thumbnail"  href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img style="width: 100%; margin-bottom: 25px;"  src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                            <?php } ?>
                            <?php if ($images) { ?>
                            <?php foreach ($images as $image) { ?>
                            <li class="image-additional"><a class="thumbnail" <?php if($image['video']){?> data-video="<?php echo $image['video']; ?>" <?php } ?> href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                            <?php } ?>
                            <?php } ?>
                        </ul>
                        <?php } ?>
                    </div>
                    <?php if ($column_left || $column_right) { ?>
                    <?php $class = 'col-sm-6'; ?>
                    <?php } else { ?>
                    <?php $class = 'col-sm-4'; ?>
                    <?php } ?>
                    <div class="<?php echo $class; ?>">
                        <h1><?php echo $heading_title; ?></h1>
                        <?php if ($review_status) { ?>
                        <div class="rating rate">
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                            <?php if ($rating < $i) { ?>
                            <i class="fa fa-star-o" aria-hidden="true"></i>              <?php } else { ?>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <?php } ?>
                            <?php } ?>
                            <span><a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> | <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></span>
                        </div>
                        <?php } ?>
                        <ul class="list-unstyled dop-info">
                            <?php if ($sku) { ?>
                            <li><strong><?php echo $text_sku; ?></strong> <?php echo $sku; ?></li>
                            <?php } ?>
                            <?php if ($manufacturer) { ?>
                            <li><strong><?php echo $text_manufacturer; ?></strong> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                            <?php } ?>
                            <?php /*<li><strong><?php echo $text_model; ?></strong> <?php echo $model; ?></li>*/?>
                            <?php if ($reward) { ?>
                            <li><strong><?php echo $text_reward; ?></strong> <?php echo $reward; ?></li>
                            <?php } ?>
                            <li><strong><?php echo $text_stock; ?></strong> <?php echo $stock; ?></li>
                            <li><strong><?php echo $text_return_exchange; ?></strong> <?php echo $text_return_exchange_value; ?></li>
                        </ul>
                        <?php if ($price) { ?>
                        <div class="price">
                            <?php if (!$special) { ?>
                            <?php echo $price; ?>
                            <?php } else { ?>
                            <?php echo $special; ?>
                            <span><?php echo $price; ?></span>
                            <?php } ?>
                            <?php if ($tax) { ?>
                            <?php echo $text_tax; ?> <?php echo $tax; ?>
                            <?php } ?>
                            <?php if ($points) { ?>
                            <span class="price-small"><?php echo $text_points; ?> <?php echo $points; ?></span>
                            <?php } ?>
                            <?php if ($discounts) { ?>
                            <hr>
                            <?php foreach ($discounts as $discount) { ?>
                            <span class="price-small"><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></small>
                                <?php } ?>
                                <?php } ?>
                        </div>
                        <?php } ?>
                        <div id="product">
                            <?php if ($options) { ?>
                            <hr>
                            <h3><?php echo $text_option; ?></h3>
                            <?php foreach ($options as $option) { ?>
                            <?php if ($option['type'] == 'select') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                    </option>
                                    <?php } ?>
                                </select>
                            </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'radio') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <div class="btn-group radio" data-toggle="buttons">

                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <label class="btn btn-default btn-sm">
                                            <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                            <?php if ($option_value['image']) { ?>
                                            <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                            <?php } ?>
                                            <?php echo $option_value['name']; ?>
                                            <?php if ($option_value['price']) { ?>
                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                        </label>

                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'checkbox') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <div class="checkbox btn-group" data-toggle="buttons">

                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <label class="btn btn-default btn-sm">
                                            <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                            <?php if ($option_value['image']) { ?>
                                            <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                            <?php } ?>
                                            <?php echo $option_value['name']; ?>
                                            <?php if ($option_value['price']) { ?>
                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                        </label>

                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'text') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                            </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'textarea') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                            </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'file') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"><?php echo $option['name']; ?></label>
                                <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                            </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'date') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <div class="input-group date">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                           <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                           </span>
                                </div>
                            </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'datetime') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <div class="input-group datetime">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                           <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                           </span>
                                </div>
                            </div>
                            <?php } ?>
                            <?php if ($option['type'] == 'time') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                <div class="input-group time">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                           <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                           </span>
                                </div>
                            </div>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            <?php if ($recurrings) { ?>
                            <hr>
                            <h3><?php echo $text_payment_recurring; ?></h3>
                            <div class="form-group required">
                                <select name="recurring_id" class="form-control">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($recurrings as $recurring) { ?>
                                    <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                                    <?php } ?>
                                </select>
                                <div class="help-block" id="recurring-description"></div>
                            </div>
                            <?php } ?>
                            <div class="form-group to-cart">
                                <div class="row">
                                    <div class="col-lg-4 col-md-8 col-sm-6 col-xs-6 qtty">
                                        <!-- <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label> -->
<div class="input-group number-spinner">
			      <span class="input-group-btn">
					<button class="btn btn-default" data-dir="dwn"><i class="fa fa-minus"></i></button>
			      </span>
				<input type="text" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" class="form-control text-center" />
				  <span class="input-group-btn">
					<button class="btn btn-default" data-dir="up"><i class="fa fa-plus"></i></button>
				  </span>
			    </div>
                                        
                                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                                        <input type="hidden" name="product_price" value="<?php echo $product_price; ?>" />
                                        <input type="hidden" name="currency" value="<?php echo $currency; ?>" />
                                    </div>
                                    <div class="col-lg-8 col-md-8  col-md-12 col-sm-12 col-xs-12">

                            <!-- Button fastorder -->
                            <?php  echo $fastorder;?>
                            <!-- END :  button fastorder -->
            
                                        <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-bord"><?php echo $button_cart; ?></button>
                                        <?php if($exclusive_category) {?>
                                        <button type="button" id="button-cart-credit" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-bord"><?php echo $button_credit; ?></button>
                                        <?php } ?>
                                    </div>
                                </div>
                                <br />
                                <button type="button" data-toggle="tooltip" class="btn-sub-full" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart-o" aria-hidden="true"></i><?php echo $button_wishlist; ?></button>
                                <button type="button" data-toggle="tooltip" class="btn-sub-full" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i><?php echo $button_compare; ?></button>
                            </div>
                            <?php if ($minimum > 1) { ?>
                            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                            <?php } ?>
                        </div>
                        <hr>
                        <!-- AddThis Button BEGIN -->
                        <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
                        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                        <!-- AddThis Button END -->
                        <?php /* if($exclusive_category) {?>
                        <div class="text-bonus">
                        <?php echo $text_bonus; ?>
                        </div>
                        <?php } */ ?>
                    </div>
                </div>
                <?php if ($tags) { ?>
                <p><?php echo $text_tags; ?>
                    <?php for ($i = 0; $i < count($tags); $i++) { ?>
                    <?php if ($i < (count($tags) - 1)) { ?>
                    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                    <?php } else { ?>
                    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                    <?php } ?>
                    <?php } ?>
                </p>
                <?php } ?>
                <ul class="nav nav-tabs">
                    <?php if($exclusive_category) {?>
                    <li><a href="#tab-equipment" data-toggle="tab"><?php echo $tab_equipment; ?></a></li>
                    <?php } ?>
                    <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
                    <?php if ($attribute_groups) { ?>
                    <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                    <?php } ?>
                    <?php if ($review_status) { ?>
                    <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                    <?php } ?>

			<!--xml-->
			<?php if ($customtabs) { ?>
            <?php foreach ($customtabs as $key=>$customtab) { ?>
				<li><a href="#tabcustom<?php echo $key?>" data-toggle="tab"><?php echo $customtab['title']; ?></a></li>
            <?php } ?>
            <?php } ?>
			<!--xml-->
			
                    <?/*<li><a href="#tab-guarantees" data-toggle="tab"><?php echo $tab_guarantees; ?></a></li>*/?>
                    <li><a href="#tab-shipping_and_payment" data-toggle="tab"><?php echo $tab_shipping_and_payment; ?></a></li>
                    <li><a href="#tab-contact" data-toggle="tab"><?php echo $tab_contact; ?></a></li>
                </ul>
                <div class="tab-content">

			<!--xml-->
			<?php if ($customtabs) { ?>
           <?php foreach ($customtabs as $key=>$customtab) { ?>
				<div class="tab-pane"id="tabcustom<?php echo $key?>">
					<div class="tab-bg">
					<?php echo $customtab['description']; ?>
					</div>
				</div>
			<?php } }?>
			<!--xml-->
			

                    <?php if($exclusive_category) { ?>
                    <div class="tab-pane" id="tab-equipment">
                    <div class="tab-bg">
                    <?php if ($products_equipment) { ?>

                        <?php $x=1; ?>
                        <?php $count_products_equipment = count($products_equipment); ?>

                    <div id="equipment" class="owl-carousel">

                    <?php foreach ($products_equipment as $product) { ?>

                    <?php if($exclusive_category_special_setting) { ?>

                        <?php if($x == 1 || $x % 2 != 0) { ?>
                        <div class="item">
                        <?php } ?>

                            <div class="tov">
                                <div class="tov-img">
                                    <?php if (!$product['special']) { ?>
                                    <?php } else { ?>
                                    <span><?php echo $action_sale; ?></span>
                                    <?php } ?>
                                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                                    <div class="but-block">
                                        <div onclick="cart.add('<?php echo $product['product_id']; ?>');" class="cart-b" ><?php echo $button_cart; ?></div>
                                        <div data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="icon-b"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
                                        <div data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="icon-b" ><i class="fa fa-exchange" aria-hidden="true"></i></div>
                                    </div>
                                </div>
                                <div class="caption">
                                    <div class="h2"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                                    <?php /*<p><?php echo $product['description']; ?></p>*/?>
                                    	
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
                                    <div class="price">
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


                        <?php if($x % 2 == 0 || $x == $count_products_equipment) { ?>
                        </div>
                        <?php } ?>
                        <?php $x = $x+1; ?>

                    <?php } else { ?>

                    <div class="item">
                    <div class="tov">
                    <div class="tov-img">
                    <?php if (!$product['special']) { ?>
                    <?php } else { ?>
                    <span><?php echo $action_sale; ?></span>
                    <?php } ?>
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                    <div class="but-block">
                        <div onclick="cart.add('<?php echo $product['product_id']; ?>');" class="cart-b" ><?php echo $button_cart; ?></div>
                        <div data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="icon-b"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
                        <div data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="icon-b" ><i class="fa fa-exchange" aria-hidden="true"></i></div>
                    </div>
                </div>
                <div class="caption">
                    <div class="h2"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                    <?php /*<p><?php echo $product['description']; ?></p>*/?>
                    <?php if ($product['rating']) { ?>
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
                    <div class="price">
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
                        <?php } ?>
        <?php } ?>

    </div>

    <script type="text/javascript"><!--
        if ($(window).width() <= '768'){
// для моб версии делаем слайдер в 1 ряд
            $('#equipment .item > .tov:nth-child(2)').each(function( index ) {
                var tov =  '<div class="item 2"><div class="tov">'+$( this ).html();+'</div></div>';
                $(tov).insertAfter($( this ).closest('.item'));
                $( this ).remove();
            });
        }

        $('#equipment').owlCarousel({
            items: 3,
            itemsDesktop : [1199,3],
            itemsDesktopSmall : [979,2],
            //autoPlay: 3000,
            navigation: true,
            navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
            pagination: false
        });
        --></script>
    <?php } ?>
</div>
</div>
<?php } ?>

<div class="tab-pane active" id="tab-description">
    <div class="tab-bg">
        <?php echo $description; ?>
    </div>
</div>
<?php if ($attribute_groups) { ?>
<div class="tab-pane" id="tab-specification">
    <div class="tab-bg">
        <table class="table table-striped table-hover">
            <?php foreach ($attribute_groups as $attribute_group) { ?>
            <thead>
            <tr>
                <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
            <tr>
                <td><?php echo $attribute['name']; ?></td>
                <td><?php echo $attribute['text']; ?></td>
            </tr>
            <?php } ?>
            </tbody>
            <?php } ?>
        </table>
    </div>
</div>
<?php } ?>
<?php if ($review_status) { ?>

	<div class="tab-pane" id="tab-review">
          
<?php if ($review_status) { ?>
<div class="row">
	<div class="col-sm-12 text-center col-xs-12 hide">
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack" style="font-size: 21px;"><i class="fa fa-star-o" style="font-size: 41px;color:<?php echo $color_ratings; ?>;"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack" style="font-size: 21px;"><i class="fa fa-star" style="font-size: 41px;color:<?php echo $color_ratings; ?>;"></i></span>
              <?php } ?>
              <?php } ?>
          </div>
	</div>
	<div class="col-sm-2 col-xs-2">
		<span class="table_rating" style="border: solid <?php echo $color_ratings; ?>; background-color: <?php echo $color_ratings; ?>;"><?php echo $total_rating; ?></span>
	</div>
	<div class="col-sm-5 col-xs-5">
		<b><?php echo $text_rating_1; ?></b><br> 
		<?php echo $total_rating; ?> <?php echo $text_rating_of; ?> 5 ( <?php echo $text_rating_3; ?> <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> )
	</div>
	<?php /*<div class="col-sm-5 col-xs-5 text-right">
		<a style="margin-top: 3px;" class="btn btn-primary" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
	</div>*/ ?>
</div>
<?php } ?>
<style>
.table_rating {
    padding: 7.5px 0px 7.5px 0px;
    display: table;
    font-weight: bold;
    text-align: center;
    margin-left: 2px;
    font-size: 14px;
    border-radius: 3px;
    width: 40px;
    position: relative;
    color: #337ab7;
    border-width: 2px 0;
}
.table_rating:after {
    position: absolute;
    top: -2px;
    right: -10px;
    width: 0;
    height: 0;
    content: '';
    border-width: 19px 0 19px 11px;
    border-style: solid;
    border-color: rgba(255,219,76,0);
    border-left-color: inherit;
}
</style>
		<?php if ($review_status) { ?>
	
<div class="testimonial-rating">
<br>
<div class="rows">
	<div class="row">
		<div class="col-sm-2 col-xs-4">
			<div class=" rate rate2">
                  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star" aria-hidden="true"></i>    
               </div>
		</div>
		<div class="col-sm-9 col-xs-7">
			<div class="progress progress-striped">
			<?php if($reviews <= 0) { $reviews =1;}?>
			  <div class="progress-bar" style="width: <?php echo $total_stars['star5']*100/$reviews?>%;background-color: <?php echo $color_lines?>;"><?php echo round($total_stars['star5']*100/$reviews)?>%
			  </div>
			</div>
		</div>
		<div class="col-sm-1 col-xs-1">
			(<?php echo $total_stars['star5']?>)
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-xs-4">
<div class=" rate rate2">
                  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
                  <i class="fa fa-star-o" aria-hidden="true"></i>    
               </div>		</div>
		<div class="col-sm-9 col-xs-7">
			<div class="progress progress-striped">
			  <div class="progress-bar" style="width: <?php echo $total_stars['star4']*100/$reviews?>%;background-color: <?php echo $color_lines?>;"><?php echo round($total_stars['star4']*100/$reviews)?>%
			  </div>
			</div>
		</div>
		<div class="col-sm-1 col-xs-1">
			(<?php echo $total_stars['star4']?>)
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-xs-4">
<div class=" rate rate2">
                  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star-o" aria-hidden="true"></i>
                  <i class="fa fa-star-o" aria-hidden="true"></i>    
               </div>
		</div>
		<div class="col-sm-9 col-xs-7">
			<div class="progress progress-striped">
			  <div class="progress-bar" style="width: <?php echo $total_stars['star3']*100/$reviews?>%;background-color: <?php echo $color_lines?>;"><?php echo round($total_stars['star3']*100/$reviews)?>%
			  </div>
			</div>
		</div>
		<div class="col-sm-1 col-xs-1">
			(<?php echo $total_stars['star3']?>)
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-xs-4">
<div class=" rate rate2">
                  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star-o" aria-hidden="true"></i>
				  <i class="fa fa-star-o" aria-hidden="true"></i>
                  <i class="fa fa-star-o" aria-hidden="true"></i>    
               </div>
		</div>
		<div class="col-sm-9 col-xs-7">
			<div class="progress progress-striped">
			  <div class="progress-bar" style="width: <?php echo $total_stars['star2']*100/$reviews?>%;background-color: <?php echo $color_lines?>;"><?php echo round($total_stars['star2']*100/$reviews)?>%
			  </div>
			</div>
		</div>
		<div class="col-sm-1 col-xs-1">
			(<?php echo $total_stars['star2']?>)
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-xs-4">
			<div class=" rate rate2">
                  <i class="fa fa-star" aria-hidden="true"></i>
				  <i class="fa fa-star-o" aria-hidden="true"></i>
				  <i class="fa fa-star-o" aria-hidden="true"></i>
				  <i class="fa fa-star-o" aria-hidden="true"></i>
                  <i class="fa fa-star-o" aria-hidden="true"></i>    
               </div>
		</div>
		<div class="col-sm-9 col-xs-7">
			<div class="progress progress-striped">
			  <div class="progress-bar" style="width: <?php echo $total_stars['star1']*100/$reviews?>%;background-color: <?php echo $color_lines?>;"><?php echo round($total_stars['star1']*100/$reviews)?>%
			  </div>
			</div>
		</div>
		<div class="col-sm-1 col-xs-1">
			(<?php echo $total_stars['star1']?>)
		</div>
	</div>
  </div>
</div>
          <?php } ?>
	
    <div class="tab-bg">
        <form class="form-horizontal" id="form-review">
            <div id="review"></div>
            <div class="h2"><?php echo $text_write; ?></div>
            <?php if ($review_guest) { ?>
            <div class="form-group required">
                <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                </div>
            </div>
            <div class="form-group required">
                <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                </div>
            </div>
            <div class="form-group required">
                <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?>
                </div>
            </div>
            <?php echo $captcha; ?>
            <div class="buttons clearfix">
                <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                </div>
            </div>
            <?php } else { ?>
            <?php echo $text_login; ?>
            <?php } ?>
        </form>
    </div>
</div>
<?php } ?>

<div class="tab-pane" id="tab-guarantees">
    <div class="tab-bg">
        <?php echo $guarantees; ?>
    </div>
</div>

<div class="tab-pane" id="tab-shipping_and_payment">
    <div class="tab-bg">
        <?php echo $shipping_and_payment; ?>
        <?php if(empty($shipping_and_payment)) { ?>
        <div class="h2"><b>Доставка</b></div>
        <p>При приобретении инструмента для удаления вмятин на сумму заказа <b>от 20 000 ₽ доставка по России осуществляется бесплатно</b> (при условии наличия пункта выдачи транспортной компании в городе назначения).</p><p>Доставка за рубеж в основном осуществляется EMS почтой России (http://www.emspost.ru).</p><p><br></p>
        <div class="h2"><b>Способы оплаты</b></div>
        <p><b>Для физических лиц:</b></p><p>При самовывозе и доставке по Москве</p><p style="margin-bottom: 15px;">Наличными при получении</p><p><b>Варианты оплаты по РФ, СНГ и остальному миру.</b></p><p>- PayPal</p><p>- Western Union</p><p>- Альфа-Клик</p><p>- Банковские карты Visa, Mastercard, Maestro</p><p>- Наличные в кассах и терминалах партнеров</p><p>- MasterPass</p><p>- Со счета мобильного телефона</p><p>- Мобильный терминал (mPOS)</p><p>- Промсвязьбанк</p><p>- Яндекс.Деньги</p><p>- QIWI Wallet</p><p>- Сбербанк-Онлайн</p><p>- Webmoney</p><p>- Наложенный платеж (только при условии наличия пункта выдачи СДЕК)</p><p>- В кредит</p><p>&nbsp;</p><p><b>Для юридических лиц:</b></p><p>Оплата банковским переводом по безналичному расчёту</p><p>Банковские реквизиты:</p><p>Р/С: 40802810300000047595</p><p>ВТБ 24 (ПАО) г. Москва&nbsp;</p><p>БИК: 044525716</p><p>к/с: 30101810100000000716</p>
        <?php } ?>
    </div>
</div>

<div class="tab-pane " id="tab-contact">
    <div class="tab-bg">
        <form class="form-horizontal" id="form-contact">
            <div id="contact"></div>
            <div class="h3"><?php echo $text_contact_text; ?></div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $text_contact_name; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-contact_name" class="form-control">
                </div>
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $text_contact_email; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="email" id="input-contact_email" class="form-control">
                </div>
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $text_contact_tel; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="contact_tel" id="input-contact_tel" class="form-control">
                </div>
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $text_contact_message; ?></label>
                <div class="col-sm-10">
                    <textarea name="text" rows="10" id="input-contact_message" class="form-control"></textarea>
                </div>
            </div>

            <input type="hidden" name="product_name" value="<?php echo $heading_title; ?>">

            <div class="buttons clearfix">
                <div class="pull-right">
                    <button type="button" id="button-contact" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_submit; ?></button>
                </div>
            </div>

        </form>
    </div>
</div>

</div>
</div>
<?php if ($products) { ?>
<div class="section-title">
    <h4><?php echo $text_related; ?></h4>
</div>
<div id="feat" class="owl-carousel">

    <?php foreach ($products as $product) { ?>
    <div class="item">


        <div class="tov">
            <div class="tov-img">
                <?php if (!$product['special']) { ?>
                <?php } else { ?>
                <span><?php echo $action_sale; ?></span>
                <?php } ?>
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                <div class="but-block">
                    <div onclick="cart.add('<?php echo $product['product_id']; ?>');" class="cart-b" ><?php echo $button_cart; ?></div>
                    <div data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="icon-b"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
                    <div data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="icon-b" ><i class="fa fa-exchange" aria-hidden="true"></i></div>
                </div>
            </div>
            <div class="caption">
                <div class="h2"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <?php /* <p><?php echo $product['description']; ?></p> */ ?>
                <?php if ($product['rating']) { ?>
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
                <div class="price">
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
    <?php } ?>

</div>

<script type="text/javascript"><!--
    $('#feat').owlCarousel({
        items: 4,
        itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,2],
        autoPlay: 3000,
        navigation: true,
        navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
        pagination: false
    });
    --></script>
<?php } ?>
<?php echo $content_top; ?>
</div>
<?php echo $column_right; ?>
</div>
</div>
<?php echo $content_bottom; ?>
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#recurring-description').html('');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //-->
</script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-cart').button('loading');
            },
            complete: function() {
                $('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success cart-add-msg">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<img src="catalog/view/theme/corsica/img/i7.svg" alt=""><h5>Корзина покупок</h5>' + json['total'] + '');

                    //$('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //-->
</script>

<script type="text/javascript"><!--
    $('#button-cart-credit').on('click', function() {

        $.ajax({
            url: 'index.php?route=product/product/vcredit',
            type: "POST",
            data: 'credit',
            dataType: 'json',
            success: function() {console.log("credit_ON");}

        });

        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-cart').button('loading');
            },
            complete: function() {
                $('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success cart-add-msg">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<img src="catalog/view/theme/corsica/img/i7.svg" alt=""><h5>Корзина покупок</h5>' + json['total'] + '');

                    $('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //-->
</script>

<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //-->
</script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function() {
                $('#button-review').button('loading');
            },
            complete: function() {
                $('#button-review').button('reset');
            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success "><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });

    /* send-contact-tab */
    $('#button-contact').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/contact_send&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-contact").serialize(),
            beforeSend: function() {
                $('#button-contact').button('loading');
            },
            complete: function() {
                $('#button-contact').button('reset');
            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#contact').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#contact').after('<div class="alert alert-success "><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('input[name=\'email\']').val('');
                    $('input[name=\'contact_tel\']').val('');
                    $('textarea[name=\'text\']').val('');

                }
            }
        });
        grecaptcha.reset();
    });
    /* END send-contact-tab */


    $(document).ready(function() {
        $('.thumbnails').magnificPopup({
            type:'image',
            delegate: 'a:not([data-video])',
            gallery: {
                enabled:true
            }
        });
    });

    $(document).ready(function() {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var  vals = hashpart[1].split('-');
            for (i=0; i<vals.length; i++) {
                $('div.options').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
                $('div.options').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
            }
        }
    })
    //-->
</script>
<script type="text/javascript"><!--
$(document).on('click', '.number-spinner button', function () {    
	var btn = $(this),
		oldValue = btn.closest('.number-spinner').find('input').val().trim(),
		newVal = 1;
			
	if (btn.attr('data-dir') == 'up') {
		newVal = parseInt(oldValue) + 1;
	} else {
		if (oldValue > 1) {
			newVal = parseInt(oldValue) - 1;
		} else {
			newVal = 1;
		}
	}
	btn.closest('.number-spinner').find('input').val(newVal);
});
//--></script>


                <?php if($video_status){  ?>

                    <script type="text/javascript">
                        window.onload  = function() {                    
                            jQuery('a[data-video]:not([data-video=""])').each(function(index,element) {
                                jQuery(this).attr('href', $(this).attr('data-video'));
                                jQuery(this).attr('target','_blank');
                                jQuery(this).css({'background-repeat':'no-repeat','background-position':'center center', 'background-size': '100%', 'background-image': 'url("/image/play.png")'}).find('img').css({ opacity: 0.6 });
                            });
                            // jQuery('a[data-video]:not([data-video=""]):not([data-video_role="video_main"]) img').css({ width: '74px', height: '74px' });
                            jQuery('a[data-video][data-video_role="video_main"]:not([data-video=""])').css({ 'background-image': 'none' });
                        }
                        jQuery(document).ready(function() {
                        	if(jQuery('a[data-video]:not([data-video=""]').length){
								jQuery('a[data-video]:not([data-video=""]').magnificPopup({
									disableOn: 700,
									type: 'iframe',
									mainClass: 'mfp-fade',
									removalDelay: 160,
									preloader: false,
									fixedContentPos: false
								});
							}
						});
                    </script>


                <?php } ?>
            
<?php echo $footer; ?>