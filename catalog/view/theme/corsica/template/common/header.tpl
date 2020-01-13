<!DOCTYPE html>
      <html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
         <head>

             <!-- Google Tag Manager -->
             <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                 new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
                         j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
                         'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
                         })(window,document,'script','dataLayer','GTM-K6TZFMB');</script>
             <!-- End Google Tag Manager -->

             
            <?php if(isset($micro_markup)) echo $micro_markup; ?>
            

            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <title><?php echo $title;  ?></title>
            <?php  ?>
            <base href="<?php echo $base; ?>" />
            <?php if ($description) { ?>
            <meta name="description" content="<?php echo $description; ?>" />
            <?php } ?>
            <?php if ($keywords) { ?>
            <meta name="keywords" content= "<?php echo $keywords; ?>" />
            <?php } ?>  
            <meta property="og:title" content="<?php echo $title; ?>" />
            <meta property="og:type" content="website" />
            <meta property="og:url" content="<?php echo $og_url; ?>" />
            <?php if ($og_image) { ?>
            <meta property="og:image" content="<?php echo $og_image; ?>" />
            <?php } else { ?>
            <meta property="og:image" content="<?php echo $logo; ?>" />
            <meta property="og:locale" content="ru_RU">
            <?php } ?>
            <meta property="og:site_name" content="<?php echo $name; ?>" />
            <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js?v1.2.0"></script>
            <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css?v1.2.0" rel="stylesheet" media="screen" />
            <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js?v1.2.0"></script>
            <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
            <link href="catalog/view/theme/corsica/stylesheet/stylesheet.css" rel="stylesheet">
            <?php foreach ($styles as $style) { ?>
            <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="    <?php echo $style['media']; ?>" />
            <?php } ?>
            <script src="catalog/view/javascript/common.js"></script>
            <?php foreach ($links as $link) { ?>
            <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
            <?php } ?>
            <?php foreach ($scripts as $script) { ?>
            <script src="<?php echo $script; ?>"></script>
            <?php } ?>
            <?php foreach ($analytics as $analytic) { ?>
            <?php echo $analytic; ?>
            <?php } ?>
            <link href="catalog/view/theme/corsica/css/navbar.css?29052019" rel="stylesheet">
            <link href="catalog/view/theme/corsica/css/style.css?20122019" rel="stylesheet">
            <link href="catalog/view/theme/corsica/css/responsive.css" rel="stylesheet">
            <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
			
			<script>
				Journal.COUNTDOWN={DAYS:"<?php echo $days; ?>",HOURS:"<?php echo $hours; ?>",MINUTES:"<?php echo $min; ?>",SECONDS:"<?php echo $sec; ?>"};
			</script>
<script src="https://static.yandex.net/kassa/pay-in-parts/ui/v1/"></script>
         </head>
         <body class="<?php echo $class; ?>">

         <!-- Google Tag Manager (noscript) -->
         <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-K6TZFMB"
                           height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
         <!-- End Google Tag Manager (noscript) -->

            <header>
               <div class="head-line">
                  <div class="container">
                     <div class="row">
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                           <ul class="list-unstyled list-inline">
                               <?php foreach($informations_head as $info) { ?> 
												<li class="hidden-xs"><a href="<?php echo $info['href']; ?>"><?php echo $info['title']; ?></a></li>
												
											 <?php } ?>							  
                           </ul>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 head-links ">
                           <ul class="list-unstyled list-inline pull-right">
                              <?php echo $language; ?>
							  <?php echo $currency; ?>
                              <?php /* <li role="presentation" class="dropdown">
                                 <a href="<?php echo $account; ?>" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-o" aria-hidden="true"></i> <?php echo $text_account; ?></a>  <i class="fa fa-angle-down" aria-hidden="true"></i>
                                 <ul class="dropdown-menu dropdown-menu-right">
                                    <?php if ($logged) { ?>
                                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                    <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                    <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                                    <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                                    <?php } else { ?>
                                    <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                    <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                                    <?php } ?>
                                 </ul>
                              </li> */ ?>
                              <li class="hidden-xs"><a href="<?php echo $wishlist; ?>"><i class="fa fa-heart-o" aria-hidden="true"></i> <?php echo $text_wishlist; ?></a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="head-main">
                  <div class="container">
                     <div class="row">
                        <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 logo">
                          <div id="logo">
          <?php if ($logo) { ?>
            <?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
                        </div>
                        <div id="search_cont" class="col-lg-6 col-md-5 col-sm-6 col-xs-12">
                           <?php echo $search; ?>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-3 support hidden-sm hidden-xs">
                           <img class="visible-lg" src="catalog/view/theme/corsica/img/i2.svg" alt="">
                           <div class="h5"><a class="tel" href="tel:<?php echo $telephone_link; ?>"><?php echo $telephone; ?></a></div>
                           <a style="cursor: pointer" data-toggle="modal" data-target="#form_order"><?php echo $call_back; ?></a>   
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12 cart">
                           <?php echo $cart; ?>
                        </div>
                     </div>
                  </div>
               </div>
<script src="https://static.yandex.net/kassa/pay-in-parts/ui/v1/"></script>
            </header>
			
            <?php if ($categories) { ?>
            <nav class="navbar">
               <div class="container">
                   <a href="<?php echo $home; ?>" id="logo_mob"><?php echo $name; ?></a>
                  <div class="pull-right visible-xs mob-menu row">
					<div class="col-xs-12">
						<a href="<?php echo $checkout; ?>" id="cart-ico" class="f-appbar__item f-appbar__cart-button"></a>
						<div id="search-ico" class="f-appbar__search-button js-top-search__open-button"></div>
						<ul class="list-unstyled list-inline pull-right">
                              <?php echo $language; ?>
							  <?php echo $currency; ?>
                           </ul>
					</div>
                  </div>
                  <div class="navbar-header">
                     <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target="#navbar"></button>
                  </div>
                  <div id="navbar" class="navbar-offcanvas" data-direction="left">
                     <button type="button" class="hidden-sm hidden-md hidden-lg" data-toggle="offcanvas" data-target="#navbar">
                     &#10005;
                     </button>
                     <ul class="nav navbar-nav navbar-left">
                        <li class="active visible-lg"><a href="/"><i class="fa fa-home" aria-hidden="true"></i></a></li>

                         <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                         <?php $column_i = 0; ?>
                        <li class="dropdown dropdown-megamenu">
                           <a href="<?php echo $category['href']; ?>" class="dropdown-toggle " data-toggle="dropdown" role="button">
						   <img src="<?php echo $category['image_ico'];?>" class="drawer-menu__raster-icon only-mob" alt="">
						   <?php echo $category['name']; ?> <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                               <li class="grid-container grid-container--fill" style="
    width: max-content;
">
                                   <div class="grid-element lev_1">
                                       <div class="grid-container grid-container--fill" style="
    width: max-content;
">
                                           <?php $children = $category['children']; foreach ($children as $child) { ?>
                                           <?php if($column_i == 0 || $column_i == $category['column']) { ?>

                                           <div class="grid-element lev_2">
                                               <ul class="megamenu-list list-col-4">
                                           <?php } ?>

                                                   <li><a data-description="<?php echo $child['description_small'] ?>" data-image="<?php echo $child['image'] ?>" href="<?php echo $child['href']; ?>"><i class="fa trigle_cursor" aria-hidden="true"></i>  <?php echo $child['name']; ?></a></li>
                                                   <?php ++$column_i; ?>


                                           <?php if($column_i == $category['column'] || $column_i == count($category['children'])) { ?>
                                               </ul>
                                           </div>
                                           <?php } ?>
                                           <?php } ?>



                                       </div>
                                       <div class="grid-element lev_buton">
                                           <?php if ( $category['href'] != 'javascript:void(0);' ) { ?>
                                           <div class="show-all-button text-center hidden-xs">
                                               <a href="<?php echo $category['href']; ?>" class="see-all"><strong><?php echo $text_all; ?> "<?php echo $category['name']; ?>"</strong></a>
                                           </div>

                                           <?php } ?>
                                       </div>
                                   </div>

                                   <div class="grid-element lev_img">
                                       <div class="box">
                                           <a href="http://avtool/pdr-tools/nozhevidnye-kryuchki/">                       <img class="img-responsive" src="<?php echo $category['image']; ?>" alt="Ножевидные &quot;бритые&quot; крючки">

                                           </a>
                                           <div class="description"></div>

                                       </div>
                                   </div>

                               </li>
                           </ul>
                        </li>
                        <?php } else { ?>
						
						<?php /* if($discount_cat) { ?>
						 <li><a href="<?php echo $discount_cat['href']; ?>">
						 <img src="/image/catalog/header/discont.png" class="drawer-menu__raster-icon only-mob" alt="">
						 <?php echo $discount_cat['name']; ?></a></li>
						<?php } */ ?>

                         <?php if($shtangi_cat) { ?>
                         <li><a href="<?php echo $shtangi_cat['href']; ?>">
                                 <?php echo $shtangi_cat['name']; ?></a></li>
                         <?php } ?>
						
						 <li class="dropdown dropdown-megamenu">
						 <a href="<?php echo $informations['8']['href']; ?>" class="dropdown-toggle " data-toggle="dropdown" role="button">
						 <svg class="f-svg-icon drawer-menu__icon drawer-menu__item-icon svg-menu-ico only-mob">
							<use xlink:href="/image/sprite.symbol.svg#school_24px"></use>
						 </svg>
						 <?php echo $informations['8']['title']; ?> <span class="caret"></span></a>
						 <ul class="dropdown-menu">
                            
							  <li>
                                 <div class="megamenu">
                                    <div class="megamenu-lists">
										  <ul class="megamenu-list list-col-4">
										   <?php foreach($informations_children as $informations_ch) { ?> 
												<li><a href="<?php echo $informations_ch['href']; ?>"><i class="fa trigle_cursor" aria-hidden="true"></i> <?php echo $informations_ch['title']; ?></a></li>
											 <?php } ?>
											 </ul>
									   </div>
                                 </div>
                              </li>
							 
						 </ul>
						 
						 </li>
						
                        <li class="only-mob"><a href="<?php echo $category['href']; ?>">
						<svg class="f-svg-icon drawer-menu__icon drawer-menu__item-icon svg-menu-ico only-mob">
							<use xlink:href="/image/sprite.symbol.svg#thumb_up_24px"></use>
						</svg>
						<?php echo $category['name']; ?></a></li>
                         <?php /* <li class="only-mob"><a href="<?php echo $informations['14']['href']; ?>">
						<svg class="f-svg-icon drawer-menu__icon drawer-menu__item-icon svg-menu-ico only-mob">
							<use xlink:href="/image/sprite.symbol.svg#tie_24px"></use>
						</svg>
						<?php echo $informations['14']['title']; ?></a></li>	*/?>
                        <?php } ?>
                        <?php } ?>
                     </ul>
                  </div>
               </div>
            </nav>
            <?php } ?>
			<div class="head-addres" style="">

			<p>
				<img src="/image/catalog/header/addres.png" class="f-appbar__logo" alt="" style="">
				
				<?php  echo $text_head_addres;?></p>
			</div>
			
			<div class="row mob-phone-email">
				<div class="col-xs-12 text-center"><p><img id="mail-ico" src="/image/catalog/header/mail.png" class="f-appbar__logo" alt="" style=""><?php echo $email; ?></p></div>
				<div class="col-xs-12 text-center"><p><img id="tel-ico" src="/image/catalog/header/tel.png" class="f-appbar__logo" alt="" style=""><?php echo $telephone; ?></p></div>
			</div>
			
			<div class="row text-center callback-head">
				<a data-toggle="modal" data-target="#form_order"><?php echo $call_back; ?></a>
			</div>
			
			<div class="fix-header"></div>
            <div class="icon-block hidden-xs hidden-sm">
               <div class="container">
                  <div class="row">
                     <div class="col-lg-3 col-md-3 col-sm-3">
                        <img class="hidden-sm"  src="catalog/view/theme/corsica/img/i2.svg" alt="">
                        <div class="h4"><?php echo $block_1; ?></div>
                        <p><?php echo $telephone; ?></p>
                     </div>
                     <div class="col-lg-3 col-md-3 col-sm-3 b-left">
                        <img class="hidden-sm" src="catalog/view/theme/corsica/img/i3.svg" alt="">
                        <div class="h4"><?php echo $block_2; ?></div>
                        <p><?php echo $block_2_1; ?></p>
                     </div>
                     <div class="col-lg-3 b-left col-md-3 col-sm-3">
                        <img class="hidden-sm" src="catalog/view/theme/corsica/img/i4.svg" alt="">
                        <div class="h4"><?php echo $block_3; ?></div>
                        <p><?php echo $block_3_2; ?></p>
                     </div>
                     <div class="col-lg-3 b-left col-md-3 col-sm-3">
                        <img class="hidden-sm" src="catalog/view/theme/corsica/img/i5.svg" alt="">
                        <div class="h4"><?php echo $block_4; ?></div>
                        <p><?php echo $block_4_2; ?></p>
                     </div>
                  </div>
               </div>
            </div>