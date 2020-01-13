<?php echo $header; ?>
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

         <div><section id="catalog_category" class="catalog_category">


                  <?php if ($categories) { ?>

                     <?php foreach ($categories as $category) { ?>
               <div class="pre-row">
               <div class="row">
                        <?php if ($category['children']) { ?>
                        <?php $column_i = 0; ?>
                  <div class="img-box col-lg-3 col-md-3 col-sm-6 col-xs-12">
                     <div class="box">

                        <div class=""><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>"></div>
                        <a href="<?php echo $category['href']; ?>" class="main_cat"><?php echo $category['name']; ?></a>

                     </div>
                  </div>

                  <div class="categories-list col-lg-8 col-md-8 col-sm-6 col-xs-12">
<div>
                     <?php $children = $category['children']; foreach ($children as $child) { ?>
                        <?php if($column_i == 0 || $column_i == $category['column']) { ?>

                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                     <div class="box">
                        <ul class="megamenu-list list-col-4">

                        <?php } ?>

                           <li><a title="<?php echo $child['description_small'] ?>" data-image="<?php echo $child['image'] ?>" href="<?php echo $child['href']; ?>"><i class="fa trigle_cursor" aria-hidden="true"></i>  <?php echo $child['name']; ?></a></li>

                        <?php ++$column_i; ?>
                        <?php if($column_i == $category['column'] || $column_i == count($category['children'])) { ?>
                        </ul>
                     </div>
                  </div>
                        <?php } ?>
                     <?php } ?>

</div>
                  </div>

                        <?php } ?>
               </div>
               </div>
                     <?php } ?>
                  <?php } ?>


            </section></div>

         <div class="other_cat">
            <div class="row">
               <div class="img-box col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <?php if($shtangi_cat) { ?>
                  <div class="box">

                     <div class=""><img src="<?php echo $shtangi_cat['image']; ?>" alt="<?php echo $shtangi_cat['name']; ?>"></div>
                     <a href="<?php echo $shtangi_cat['href']; ?>" class="main_cat"><?php echo $shtangi_cat['name']; ?></a>

                  </div>
                  <?php } ?>
               </div>

               <div class="img-box col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <div class="box">

                     <div class=""><img src="/image/training_center.jpg" alt="<?php echo $informations['8']['title']; ?>"></div>
                     <a href="<?php echo $informations['8']['href']; ?>" class="main_cat"><?php echo $informations['8']['title']; ?></a>

                  </div>
               </div>

               <div class="img-box col-lg-3 col-md-3 col-sm-6 col-xs-12">
                  <?php if($discount_cat) { ?>
                  <div class="box">
                     <div class=""><img src="/image/discont.jpg" alt="<?php echo $discount_cat['name']; ?>"></div>
                     <a href="<?php echo $discount_cat['href']; ?>" class="main_cat"><?php echo $discount_cat['name']; ?></a>
                  </div>
                  <?php } ?>
               </div>



            </div>


         </div>







         <?php echo $content_top; ?>
      </div>
      <?php echo $column_right; ?>
   </div>
</div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>