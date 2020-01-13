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
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>">

         <div class="section-title">
            <h1><?php echo $heading_title; ?></h1>
         </div>
		 <div class="cat-seo">
            <?php /* <div class="section-title">
               <h4><?php echo $heading_title; ?></h4>
            </div> */ ?>
            <?php if ($thumb || $description) { ?>
            <div class="row">
               <?php /*if ($thumb) { ?>
               <div class="col-sm-2 hidden-xs"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-responsive" /></div>
               <?php } */?>
               <?php if ($description) { ?>
               <div class="col-sm-10">
                  <?php echo $description; ?>
               </div>
               <?php } ?>
            </div>
            <?php } ?>
         </div>
         <?php if ($categories) { ?>
         <section class="main-cat-box sub-cuts">
                  <div class="row">
                     <?php foreach ($categories as $category) { ?>
                     <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <div class="box">
                           <a href="<?php echo $category['href']; ?>">     <?php if ($category['thumb']) { ?>
                  <img class="img-responsive" src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
                  <?php } ?></a> 
                           <div class="box-text">
                              <div class="h2"><?php echo $category['name']; ?></div>
                           </div>
                        </div>
                     </div>
                         <?php } ?>
                    
                 
                  </div>
               </section>
         <?php } ?>


      <?php $i_cat = 1; ?>
      <?php if ($categories) { ?>
      <div class="cat-slider-box-top">
         <div class="cat-slider-box">
            <?php foreach ($categories as $category) { ?>

            <?php if ($i_cat == 1) { ?>
            <?php /* <div id="subcategory_title" class="section-title">
            <h1><?php echo $category['name']; ?></h1>
         </div> */ ?>
         <div onclick="show_category_products(<?php echo $category['category_id']; ?>);" id="cat_<?php echo $category['category_id']; ?>" data-cat_id="<?php echo $category['category_id']; ?>" data-cat_href="<?php echo $category['href']; ?>" data-cat_number="<?php echo $i_cat ?>" class="swiper-slide cat-slider main-cat"><?php echo $category['name']; ?></div>
         <?php } else { ?>
         <div onclick="show_category_products(<?php echo $category['category_id']; ?>);" id="cat_<?php echo $category['category_id']; ?>" data-cat_id="<?php echo $category['category_id']; ?>" data-cat_href="<?php echo $category['href']; ?>" data-cat_number="<?php echo $i_cat ?>" class="swiper-slide cat-slider"><?php echo $category['name']; ?></div>
         <?php } ?>
         <?php $i_cat++; ?>
         <?php } ?>
         <div id="cat_slide_prev" data-number_slide="1" class="cat-slide-nav disabled"></div><div id="cat_slide_next" data-number_slide="2" class="cat-slide-nav"></div>

         <div class="cat-slide-design"></div>

      </div>
   </div>
   <?php } ?>


   <?php if ($products) { ?>
         <div class="tov-sort">
            <div class="row">
               <div class="col-md-6 col-sm-6 hidden-xs">
                  <div class="btn-group btn-group-sm">
                     <button type="button" id="list-view" class="btn btn-blue btn-sm" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                     <button type="button" id="grid-view" class="btn btn-blue btn-sm" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                     <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-pink btn-sm"><i class="fa fa-exchange" aria-hidden="true"></i> <?php echo $text_compare; ?></a>
                  </div>
               </div>

               <div class="col-md-4 col-xs-10 col-sm-6">
                  <div class="form-group input-group input-group-sm">
                     <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
                     <select id="input-sort" class="form-control" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
               </div>
               <div class="col-md-2 col-xs-10 col-sm-6">
                  <div class="form-group input-group input-group-sm">
                     <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
                     <select id="input-limit" class="form-control" onchange="location = this.value;">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                     </select>
                  </div>
               </div>
            </div>
         </div>
         <div class="row product_box" style="display:flex; flex-wrap: wrap;">
            <?php foreach ($products as $product) { ?>
            <div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
               <div class="product-thumb transition">
                  <div class="tov">

                     <?php if (!$product['special']) { ?>
                     <?php } else { ?>
                     <span class="special-sticker">-15%</span>
                     <?php } ?>

                     <div class="tov-img">
                        <?php if (!$product['special']) { ?>
                        <?php } else { ?>
                        <?php /* <span>Акция</span> */ ?>

                        <?php } ?>
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                        <div class="but-block">
                           <div onclick="cart.add('<?php echo $product['product_id']; ?>');" class="cart-b" ><?php echo $button_cart; ?></div>
                           <div data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="icon-b" ><i class="fa fa-heart-o" aria-hidden="true"></i></div>
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
               </div>
            </div>
            <?php } ?>
         </div>

   <?php if (!$categories) { ?>
         <div class="row">
            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            <div class="col-sm-6 text-right hidden-xs"><?php echo $results; ?></div>
         </div>
   <?php } ?>

         <?php echo $content_top; ?>

         <?php } ?>

         <?php if (!$categories && !$products) { ?>
         <p><?php echo $text_empty; ?></p>
         <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
         </div>
         <?php } ?>
      </div>
      <?php echo $column_right; ?>
   </div>
</div>

<script>
    function show_category_products(id){
        console.log(id);
        var cat_href = $('#cat_'+id).data('cat_href');
        var cat_number = $('#cat_'+id).data('cat_number');
        var cat_title = $('#cat_'+id).text();

        var cat_count_slider = $('.cat-slider').length;

        $.ajax({
            url:cat_href,
            type:'GET',
            success: function(data){
                $('.product_box').html($(data).find('.product_box').html());
            }
        });

        console.log(cat_href);
        console.log(cat_number);
        console.log("cat_count_slider"+cat_count_slider);

        $('#subcategory_title').html('<h1>'+cat_title+'</h1>');



        for (let i = cat_number; i <= cat_count_slider; i++) {
            if(i != 1) {
                $('[data-cat_number="' + i + '"]').removeClass('hidden');
                $('[data-cat_number="' + i + '"]').removeClass('main-cat');
            }
        }

        for (let i = 0; i <= cat_number; i++) {
            $('[data-cat_number="'+i+'"]').addClass('hidden');
        }

        $('#cat_'+id).addClass('main-cat');
        $('#cat_'+id).removeClass('hidden');



        var number_prev = cat_number-1;
        if(number_prev < 1 ) {
            console.log('IF');
            number_prev=1;
            $('#cat_slide_prev').addClass('disabled');
        } else {
            $('#cat_slide_prev').removeClass('disabled');
        }

        $('#cat_slide_prev').data('number_slide',number_prev);

        var number_next = cat_number+1;
        if(number_next > cat_count_slider ) {
            console.log('IF');
            number_next=cat_count_slider;
            $('#cat_slide_next').addClass('disabled');
        } else {
            $('#cat_slide_next').removeClass('disabled');
        }
        console.log("number_next"+number_next);
        $('#cat_slide_next').data('number_slide',number_next);
    }

    $( ".cat-slide-nav" ).on( "click", function() {
        var cat_number = $(this).data('number_slide');
        var slider_id = $('[data-cat_number="'+cat_number+'"]').data('cat_id');

        /*if($(this).attr('id') == 'cat_slide_prev') {
            for (let i = 0; i <= cat_number; i++) { // выведет 0, затем 1, затем 2
                $('[data-cat_number="'+i+'"]').removeClass('hidden');
            }
        }*/

        show_category_products(slider_id);

        console.log( cat_number );
    });

    $( document ).ready(function() {
        $('.main-cat').click();


            //Enable swiping...
            if ($(window).width() <= '768') {
                $(".cat-slider-box").swipe({
                    //Generic swipe handler for all directions
                    swipe: function (event, direction, distance, duration, fingerCount, fingerData) {
                        //$(this).text("You swiped " + direction );
                        console.log("You swiped " + direction);
                        if (direction == 'left') {
                            $('#cat_slide_next').click();
                        }
                        if (direction == 'right') {
                            $('#cat_slide_prev').click();
                        }
                    },
                    //Default is 75px, set to 0 for demo so any distance triggers swipe
                    threshold: 5
                });
            }

    });

</script>

<?php echo $content_bottom; ?>
<?php echo $footer; ?>