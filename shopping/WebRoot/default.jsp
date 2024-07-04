<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="{$keywords}" />
<meta name="Description" content="{$description}" />
<title>XXX商城网站</title>

<link rel="shortcut icon" href="favicon.ico" />
<link rel="icon" href="animated_favicon.gif" type="image/gif" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
  <div id="wrap">
    <!-- #BeginLibraryItem "/library/page_header.lbi" --><!-- #EndLibraryItem -->
    <!-- TemplateBeginEditable name="导航下方通栏广告位-宽950px" -->
<img src="images/guanggao_1.gif" /><!-- TemplateEndEditable -->
	<!-- 导航栏 -->
	<ul id="brands">
	
	
	  <s:iterator value="topTypeList">
	  <li>
	  <a href="showType.action?pid=<s:property value="id"/>"><s:property value="typename"/></a>
	  </li>
	  </s:iterator>
	  <li>
	  	<a href="showcar.action">购物车</a>
	  </li>
	  <li>
	  	<a href="showOrder.action">订单</a>
	  </li>
	  
	  <li>
	  	<a href="/userLogin.jsp">登陆</a>
	  </li>
	  
	  <li>
	  	<a href="register.action">注册</a>
	  </li>
	  <li>
	  	<a href="userLogout.action">退出</a>
	  </li>
	  
	</ul>


 <!-- #EndLibraryItem -->
<!-- TemplateEndEditable -->
    <div class="container">
      <div class="global_l">
      <!-- TemplateBeginEditable name="左边区域" -->
<!-- #BeginLibraryItem "/library/category_tree.lbi" -->
<div class="module" id="category_tree">
  <h1><span></span>{$lang.goods_category}</h1>
  <div class="content">
    <dl>
      <!--{foreach from=$categories item=cat}-->
      <dt><a href="{$cat.url}">{$cat.name|escape:html}</a></dt>
      <dd>
        <!--{foreach from=$cat.children item=child}-->
        <li>
          <a href="{$child.url}" onfocus="this.blur()">{$child.name|escape:html}</a>
        </li>
        <!--{/foreach}-->
      </dd>
      <!--{/foreach}-->
    </dl>
  </div>
  <div class="bottom"><span></span></div>
</div>
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/cat_articles.lbi" -->
<div class="module">
  <div class="caption"><span><a href="{$articles_cat.url}">更多>></a></span><a href="{$articles_cat.url}">{$articles_cat.name|escape:html}</a></div>
  <div class="content" style="padding:5px;">
    <ul>
      <!--{foreach from=$articles item=article}-->
      <li>
        <font style="font-family:宋体;">·</font><a href="{$article.url}" title="{$article.title|escape:html}">{$article.short_title}</a> {$article.add_time}
      </li>
      <!--{/foreach}-->
    </ul>
  </div>
</div>
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/brand_goods.lbi" -->
<div class="module">
  <h1><span></span><a href="{$goods_brand.url}">{$goods_brand.name|escape:html}</a></h1>
  <div class="content">
    <ul class="goods_grid">
      <!--{foreach from=$brand_goods item=goods}-->
      <li>
        <p class="img"><a href="{$goods.url}"><img src="{$goods.thumb}" alt="{$goods.name|escape:html}" class="goodsimg" /></a></p>
        <p class="name"><a href="{$goods.url}" title="{$goods.name|escape:html}">{$goods.short_name|escape:html}</a></p>
        <p class="price">
          <!-- {if $goods.promote_price neq ""} -->
          {$goods.promote_price}
          <!-- {else}-->
          {$goods.shop_price}
          <!--{/if}-->
        </p>
      </li>
      <!--{/foreach}-->
    </ul>
  </div>
</div>
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/promotion_info.lbi" -->
<!-- {if $promotion_info} -->
<div class="module" id="new_articles">
  <h1><span></span>{$lang.promotion_info}</h1>
  <div class="content">
    <ul>
      <!-- {foreach from=$promotion_info item=item key=key} -->
      <li>
        <!-- {if $item.type eq "snatch"} -->
        <a href="snatch.php" title="{$lang.$item.type}">{$lang.snatch_promotion}</a>
        <!-- {elseif $item.type eq "group_buy"} -->
        <a href="group_buy.php" title="{$lang.$item.type}">{$lang.group_promotion}</a>
        <!-- {elseif $item.type eq "auction"} -->
        <a href="auction.php" title="{$lang.$item.type}">{$lang.auction_promotion}</a>
        <!-- {elseif $item.type eq "favourable"} -->
        <a href="activity.php" title="{$lang.$item.type}">{$lang.favourable_promotion}</a>
        <!-- {/if} -->
        <a href="{$item.url}" title="{$lang.$item.type} {$item.act_name}{$item.time}" style="background:none; padding-left:0px;">{$item.act_name}</a>
      </li>
      <!-- {/foreach} -->
    </ul>
  </div>
</div>
<!-- {/if} -->
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/top10.lbi" -->
<div id="new_articles" class="module">
  <h1><span></span>销售排行</h1>
  <div class="content">
    <ul class="text_list_1">
      <!-- {foreach name=top_goods from=$top_goods item=goods}-->
      <li><a href="{$goods.url}" title="{$goods.name|escape:html}">{$goods.short_name}</a></li>
      <!--{/foreach}-->
    </ul>
  </div>
</div>
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/email_list.lbi" -->
<div class="module">
  <h1><span></span>{$lang.email_subscribe}</h1>
  <div class="content" style="padding:5px;">
    <input type="text" id="user_email" class="input_1" style="margin-bottom:5px;" />
    <input type="button" value="{$lang.email_list_ok}" onclick="add_email_list();" class="button_1"/>
    <input type="button"  value="{$lang.email_list_cancel}" onclick="cancel_email_list();" class="button_2"/>
  </div>
</div>
<script type="text/javascript">
  var email = document.getElementById('user_email');
  function add_email_list()
  {
    if (check_email())
    {
      Ajax.call('user.php?act=email_list&job=add&email=' + email.value, '', rep_add_email_list, 'GET', 'TEXT');
    }
  }
  function rep_add_email_list(text)
  {
    alert(text);
  }
  function cancel_email_list()
  {
    if (check_email())
    {
      Ajax.call('user.php?act=email_list&job=del&email=' + email.value, '', rep_cancel_email_list, 'GET', 'TEXT');
    }
  }
  function rep_cancel_email_list(text)
  {
    alert(text);
  }
  function check_email()
  {
    if (Utils.isEmail(email.value))
    {
      return true;
    }
    else
    {
      alert('{$lang.email_invalid}');
      return false;
    }
  }
</script>

 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/order_query.lbi" -->
<!--{if empty($order_query)}-->
<script>var invalid_order_sn = "{$lang.invalid_order_sn}"</script>
<div class="module">
  <h1><span></span>{$lang.order_query}</h1>
  <div class="content" style="padding:5px;">
    <form name="ecsOrderQuery">
      <input type="text" name="order_sn" class="input_1" style="margin-bottom:5px;" />
      <input type="button" value="{$lang.query_order}" class="bnt_blue_2" onclick="orderQuery()" />
    </form>
    <div id="ECS_ORDER_QUERY" style="margin-top:8px;">
      <!--{else}-->
      <!--{if $order_query.user_id}-->
      <b>{$lang.order_number}：</b><a href="user.php?act=order_detail&order_id={$order_query.order_id}" class="f6">{$order_query.order_sn}</a><br>
      <!--{else}-->
      <b>{$lang.order_number}：</b>{$order_query.order_sn}<br>
      <!--{/if}-->
      <b>{$lang.order_status}：</b><br><font class="f1">{$order_query.order_status}</font><br>
      <!--{if $order_query.invoice_no }-->
      <b>{$lang.consignment}：</b>{$order_query.invoice_no}<br>
      <!--{/if}-->
      {if $order_query.shipping_date}：{$lang.shipping_date} {$order_query.shipping_date}<br>
      <!--{/if}-->
      <!--{/if}-->
    </div>
  </div>
</div>
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/invoice_query.lbi" -->
<!--{if $invoice_list}-->
<div class="module">
  <h1><span></span>{$lang.shipping_query}</h1>
  <div class="content" style="padding:5px;">
   <!-- 发货单查询{foreach from=$invoice_list item=invoice} -->
   {$lang.order_number} {$invoice.order_sn}<br />
   {$lang.consignment} {$invoice.invoice_no}
   <div style="height:5px; font-size:1px; line-height:1px;"></div>
   <!-- 结束发货单查询{/foreach}-->
  </div>
</div>
<!-- {/if} -->
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/vote_list.lbi" -->
{insert name='vote'}
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/group_buy.lbi" -->
<!-- {if $group_buy_goods} -->
<div class="module">
  <div class="caption">
    <span><a href="group_buy.php">更多>></a></span>
    {$lang.group_buy_goods}
  </div>
  <div class="content">
    <!--{foreach from=$group_buy_goods item=goods}-->
    <ul class="goods_grid">
      <li>
        <p class="img"><a href="{$goods.url}"><img src="{$goods.thumb}" alt="{$goods.goods_name|escape:html}" class="goodsimg" /></a></p>
        <p class="name"><a href="{$goods.url}" title="{$goods.goods_name|escape:html}">{$goods.short_style_name|escape:html}</a></p>
        <p class="price">{$goods.last_price}</p>
      </li>
    </ul>
    <!--{/foreach}-->
  </div>
</div>
<!-- {/if} -->
 <!-- #EndLibraryItem -->
<!-- TemplateEndEditable -->
      </div>
      <div class="global_r">
        <div class="area">
          <div style="width:198px; float:right;">
          <!-- TemplateBeginEditable name="焦点图片右侧" -->
<!-- #BeginLibraryItem "/library/new_articles.lbi" -->
<div class="module" id="new_articles">
  <ul id="newArticleTab">
    <span></span>
    <li id="ECS_NOTICE" class="tabFront">{$lang.shop_notice}</li>
    <li id="ECS_ARTICLE" class="tabBack">{$lang.new_article}</li>
  </ul>
  <div class="content">
    <div id="ECS_NOTICE_BODY">
     {$shop_notice}
    </div>
    <div id="ECS_ARTICLE_BODY" style="display:none;">
      <ul>
        <!-- {foreach name=new_articles from=$new_articles item=article} -->
        <!-- {if $smarty.foreach.new_articles.iteration lte 10} 限制文章显示数量 -->
        <li>[<a href="{$article.cat_url}">{$article.cat_name}</a>] <a href="{$article.url}" title="{$article.title|escape:html}">{$article.short_title|truncate:9}</a></li>
        <!-- {/if} -->
        <!-- {/foreach} -->
      </ul>
    </div>
  </div>
</div>

          </div>
          <div class="focus">
            <script type="text/javascript">
              var swf_width=534;
              var swf_height=218;
            </script>
            <script type="text/javascript" src="data/flashdata/{$flash_theme}/cycle_image.js"></script>
          </div>
        </div>

<div class="module">
  <div class="caption">
    <span><a href="../search.php?intro=best"> 更多>> </a></span>商品展示区 </div>
  <div class="content">
    <ul class="goods_grid">
    	<!-- 展示商品区 -->
    	
    	
      <s:iterator value="elist">
      <li>
        <p class="img"><a href="showgoods.action?id=${id}"><img src="<s:property value="goodspic"/>" alt="${goodsname}"/></a></p>
        <p class="name"><a href="showgoods.action?id=${id}" title="${goodsname}"><s:property value="goodsname"/></a></p>
        <p class="price">  ${price}  </p>
      <%--   <s:property value="goodspic"/> --%>
       
      </li>
  
      </s:iterator>
    </ul>
  </div>
</div>
<!-- {/if} -->
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/cat_goods.lbi" -->
<div class="module">
  <h1><span></span><a href="{$goods_cat.url}" class="f6">{$goods_cat.name|escape:html}</a></h1>
  <div class="content">
    <ul class="goods_grid">
      <!--{foreach from=$cat_goods item=goods}-->
      <li>
        <p class="img"><a href="{$goods.url}"><img src="{$goods.thumb}" alt="{$goods.name|escape:html}" class="goodsimg" /></a></p>
        <p class="name"><a href="{$goods.url}" title="{$goods.name|escape:html}">{$goods.short_name|escape:html}</a></p>
        <p class="price">
          <!-- {if $goods.promote_price neq ""} -->
          {$goods.promote_price}
          <!-- {else}-->
          {$goods.shop_price}
          <!--{/if}-->
        </p>
      </li>
      <!--{/foreach}-->
    </ul>
  </div>
</div>
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/recommend_hot.lbi" -->
<!-- {if $hot_goods} -->
<!-- {if $cat_rec_sign neq 1} -->
<div class="module">
  <div class="caption">
    <span><a href="../search.php?intro=hot">更多>></a></span><font style="float:left">{$lang.hot_goods}</font>
    <div class="switchover" id="itemHot">
      {if $cat_rec[3]}
      <h2><a href="javascript:void(0)" onclick="change_tab_style('itemHot', 'h2', this);get_cat_recommend(3, 0);">{$lang.all_goods}</a></h2>
      {foreach from=$cat_rec[3] item=rec_data}
      <h2 class="h2bg">
         <a href="javascript:void(0)" onclick="">{$rec_data.cat_name}</a>
      </h2>
      {/foreach}
      {/if}
     </div>
  </div>
  <div class="content" id="show_hot_area">
  <!-- {/if} -->
    <ul class="goods_grid">
    <!--{foreach from=$hot_goods item=goods}-->
      <li>
        <p class="img"><a href="{$goods.url}"><img src="{$goods.thumb}" alt="{$goods.name|escape:html}"/></a></p>
        <p class="name"><a href="{$goods.url}" title="{$goods.name|escape:html}">{$goods.short_style_name}</a></p>
        <p class="price">
            <!-- {if $goods.promote_price neq ""} -->
            {$goods.promote_price}
            <!-- {else}-->
            {$goods.shop_price}
            <!--{/if}-->
        </p>
      </li>
    <!--{/foreach}-->
    </ul>
    <!-- {if $cat_rec_sign neq 1} -->
  </div>
</div>
<!-- {/if} -->
<!-- {/if} -->
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/recommend_new.lbi" -->
<!-- {if $new_goods} -->
<!-- {if $cat_rec_sign neq 1} -->
<div class="module">
  <div class="caption">
    <span><a href="../search.php?intro=new">更多>></a></span><font style="float:left">{$lang.new_goods}</font>
    <div class="switchover" id="itemNew">
      {if $cat_rec[2]}
      <h2><a href="javascript:void(0)" onclick="change_tab_style('itemNew', 'h2', this);get_cat_recommend(2, 0);">{$lang.all_goods}</a></h2>
      {foreach from=$cat_rec[2] item=rec_data}
      <h2 class="h2bg">
      <a href="javascript:void(0)" onclick="change_tab_style('itemNew', 'h2', this);get_cat_recommend(2)">{$rec_data.cat_name}</a></h2>
      {/foreach}
      {/if}
    </div>
  </div>
  <div class="content" id="show_new_area">
    <!-- {/if} -->
    <ul class="goods_grid">
      <!--{foreach from=$new_goods item=goods}-->
      <li>
       <p class="img"><a href="{$goods.url}"><img src="{$goods.thumb}" alt="{$goods.name|escape:html}"/></a></p>
       <p class="name"><a href="{$goods.url}" title="{$goods.name|escape:html}">{$goods.short_style_name}</a></p>
       <p class="price">
        <!-- {if $goods.promote_price neq ""} -->
        {$goods.promote_price}
        <!-- {else}-->
        {$goods.shop_price}
        <!--{/if}-->
       </p>
      </li>
      <!--{/foreach}-->
    </ul>
    <!-- {if $cat_rec_sign neq 1} -->
  </div>
</div>
<!-- {/if} -->
<!-- {/if} -->
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/recommend_promotion.lbi" -->
<!-- {if $promotion_goods} -->
<div class="module">
  <div class="caption"><span><a href="../search.php?intro=promotion">更多>></a></span>{$lang.promotion_goods}</div>
  <div class="content">
    <ul class="goods_grid">
      <!--{foreach from=$promotion_goods item=goods name="promotion_foreach"}-->
      {if $smarty.foreach.promotion_foreach.index <= 3}
      <li>
        <p class="img"><a href="{$goods.url}"><img src="{$goods.thumb}" border="0" alt="{$goods.name|escape:html}"/></a></p>
        <p class="name"><a href="{$goods.url}" title="{$goods.name|escape:html}">{$goods.short_name|escape:html}</a></p>
        <p class="price">{$goods.promote_price}</p>
      </li>
      {/if}
      <!--{/foreach}-->
    </ul>
  </div>
</div>
<!-- {/if} -->
 <!-- #EndLibraryItem -->
<!-- #BeginLibraryItem "/library/auction.lbi" -->
<!-- {if $auction_list} -->
<div class="module">
  <div class="caption">
    <span>
      <a href="auction.php">更多>></a>
    </span>
    {$lang.auction_goods}
  </div>
  <div class="content">
    <!--{foreach from=$auction_list item=auction}-->
    <ul class="goods_grid">
      <li>
        <p class="img"><a href="{$auction.url}"><img src="{$auction.thumb}" alt="{$auction.goods_name|escape:html}" class="goodsimg" /></a></p>
        <p class="name"><a href="{$auction.url}" title="{$auction.goods_name|escape:html}">{$auction.short_style_name|escape:html}</a></p>
        <p class="price">{$auction.formated_start_price}</p>
      </li>
    </ul>
    <!--{/foreach}-->
  </div>
</div>
<!-- {/if} -->
 <!-- #EndLibraryItem -->
<!-- TemplateEndEditable -->
      </div>
    </div>
    <!-- #BeginLibraryItem "/library/help.lbi" --><!-- #EndLibraryItem -->
    <!--友情链接 start-->
    <!--{if $img_links  or $txt_links }-->
    <div id="links">
      <p>
        <!--开始图片类型的友情链接{foreach from=$img_links item=link}-->
        <a href="{$link.url}" target="_blank" title="{$link.name}"><img src="{$link.logo}" alt="{$link.name}" border="0" /></a>
        <!--结束图片类型的友情链接{/foreach}-->
      </p>
      <p>
        <!-- {if $txt_links} -->
        <!--开始文字类型的友情链接{foreach from=$txt_links item=link}-->
        <a href="{$link.url}" target="_blank" title="{$link.name}">[  {$link.name}  ]</a>
        <!--结束文字类型的友情链接{/foreach}-->
        <!-- {/if} -->
      </p>
    </div>
    <!--{/if}-->
    <!--友情链接 end-->
    <!-- #BeginLibraryItem "/library/page_footer.lbi" --><!-- #EndLibraryItem -->
  </div>
</body>
</html>