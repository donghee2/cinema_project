if(typeof jQuery==="undefined"){throw new Error("template requires jQuery")}+function(a){var c="lion.layout";var d={slimscroll:true,resetHeight:true};var h={wrapper:".wrapper",contentWrapper:".content-wrapper",layoutBoxed:".layout-boxed",mainFooter:".main-footer",mainHeader:".main-header",sidebar:".sidebar",controlSidebar:".control-sidebar",fixed:".fixed",sidebarMenu:".sidebar-menu",logo:".main-header .logo"};var b={fixed:"fixed",holdTransition:"hold-transition"};var e=function(i){this.options=i;this.bindedResize=false;this.activate()};e.prototype.activate=function(){this.fix();this.fixSidebar();a("body").removeClass(b.holdTransition);if(this.options.resetHeight){a("body, html, "+h.wrapper).css({height:"auto","min-height":"100%"})}if(!this.bindedResize){a(window).resize(function(){this.fix();this.fixSidebar();a(h.logo+", "+h.sidebar).one("webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend",function(){this.fix();this.fixSidebar()}.bind(this))}.bind(this));this.bindedResize=true}a(h.sidebarMenu).on("expanded.tree",function(){this.fix();this.fixSidebar()}.bind(this));a(h.sidebarMenu).on("collapsed.tree",function(){this.fix();this.fixSidebar()}.bind(this))};e.prototype.fix=function(){a(h.layoutBoxed+" > "+h.wrapper).css("overflow","hidden");var j=a(h.mainFooter).outerHeight()||0;var k=a(h.mainHeader).outerHeight()+j;var n=a(window).height();var m=a(h.sidebar).height()||0;if(a("body").hasClass(b.fixed)){a(h.contentWrapper).css("min-height",n-j)}else{var l;if(n>=m){a(h.contentWrapper).css("min-height",n-k);l=n-k}else{a(h.contentWrapper).css("min-height",m);l=m}var i=a(h.controlSidebar);if(typeof i!=="undefined"){if(i.height()>l){a(h.contentWrapper).css("min-height",i.height())}}}};e.prototype.fixSidebar=function(){if(!a("body").hasClass(b.fixed)){if(typeof a.fn.slimScroll!=="undefined"){a(h.sidebar).slimScroll({destroy:true}).height("auto")}return}if(this.options.slimscroll){if(typeof a.fn.slimScroll!=="undefined"){a(h.sidebar).slimScroll({destroy:true}).height("auto");a(h.sidebar).slimScroll({height:(a(window).height()-a(h.mainHeader).height())+"px",color:"rgba(0,0,0,0.2)",size:"3px"})}}};function g(i){return this.each(function(){var j=a(this);var k=j.data(c);if(!k){var l=a.extend({},d,j.data(),typeof i==="object"&&i);j.data(c,(k=new e(l)))}if(typeof i=="string"){if(typeof k[i]=="undefined"){throw new Error("No method named "+i)}k[i]()}})}var f=a.fn.layout;a.fn.layout=g;a.fn.layout.Constuctor=e;a.fn.layout.noConflict=function(){a.fn.layout=f;return this};a(window).on("load",function(){g.call(a("body"))})}(jQuery)+function(a){var c="lion.pushmenu";var d={collapseScreenSize:767,expandOnHover:false,expandTransitionDelay:200};var i={collapsed:".sidebar-collapse",open:".sidebar-open",mainSidebar:".main-sidebar",contentWrapper:".content-wrapper",searchInput:".sidebar-form .form-control",button:'[data-toggle="push-menu"]',mini:".sidebar-mini",expanded:".sidebar-expanded-on-hover",layoutFixed:".fixed"};var b={collapsed:"sidebar-collapse",open:"sidebar-open",mini:"sidebar-mini",expanded:"sidebar-expanded-on-hover",expandFeature:"sidebar-mini-expand-feature",layoutFixed:"fixed"};var e={expanded:"expanded.pushMenu",collapsed:"collapsed.pushMenu"};var h=function(j){this.options=j;this.init()};h.prototype.init=function(){if(this.options.expandOnHover||(a("body").is(i.mini+i.layoutFixed))){this.expandOnHover();a("body").addClass(b.expandFeature)}a(i.contentWrapper).on(function(){if(a(window).width()<=this.options.collapseScreenSize&&a("body").hasClass(b.open)){this.close()}}.bind(this));a(i.searchInput).on(function(j){j.stopPropagation()})};h.prototype.toggle=function(){var k=a(window).width();var j=!a("body").hasClass(b.collapsed);if(k<=this.options.collapseScreenSize){j=a("body").hasClass(b.open)}if(!j){this.open()}else{this.close()}};h.prototype.open=function(){var j=a(window).width();if(j>this.options.collapseScreenSize){a("body").removeClass(b.collapsed).trigger(a.Event(e.expanded))}else{a("body").addClass(b.open).trigger(a.Event(e.expanded))}};h.prototype.close=function(){var j=a(window).width();if(j>this.options.collapseScreenSize){a("body").addClass(b.collapsed).trigger(a.Event(e.collapsed))}else{a("body").removeClass(b.open+" "+b.collapsed).trigger(a.Event(e.collapsed))}};h.prototype.expandOnHover=function(){a(i.mainSidebar).hover(function(){if(a("body").is(i.mini+i.collapsed)&&a(window).width()>this.options.collapseScreenSize){this.expand()}}.bind(this),function(){if(a("body").is(i.expanded)){this.collapse()}}.bind(this))};h.prototype.expand=function(){setTimeout(function(){a("body").removeClass(b.collapsed).addClass(b.expanded)},this.options.expandTransitionDelay)};h.prototype.collapse=function(){setTimeout(function(){a("body").removeClass(b.expanded).addClass(b.collapsed)},this.options.expandTransitionDelay)};function g(j){return this.each(function(){var k=a(this);var l=k.data(c);if(!l){var m=a.extend({},d,k.data(),typeof j==="object"&&j);k.data(c,(l=new h(m)))}if(j=="toggle"){l.toggle()}})}var f=a.fn.pushMenu;a.fn.pushMenu=g;a.fn.pushMenu.Constructor=h;a.fn.pushMenu.noConflict=function(){a.fn.pushMenu=f;return this};a(document).on("click",i.button,function(j){j.preventDefault();g.call(a(this),"toggle")});a(window).on("load",function(){g.call(a(i.button))})}(jQuery)+function(a){var c="lion.tree";var d={animationSpeed:500,accordion:true,followLink:false,trigger:".treeview a"};var h={tree:".tree",treeview:".treeview",treeviewMenu:".treeview-menu",open:".menu-open, .active",li:"li",data:'[data-widget="tree"]',active:".active"};var b={open:"menu-open",tree:"tree"};var e={collapsed:"collapsed.tree",expanded:"expanded.tree"};var i=function(j,k){this.element=j;this.options=k;a(this.element).addClass(b.tree);a(h.treeview+h.active,this.element).addClass(b.open);this._setUpListeners()};i.prototype.toggle=function(l,j){var n=l.next(h.treeviewMenu);var m=l.parent();var k=m.hasClass(b.open);if(!m.is(h.treeview)){return}if(!this.options.followLink||l.attr("href")=="#"){j.preventDefault()}if(k){this.collapse(n,m)}else{this.expand(n,m)}};i.prototype.expand=function(n,m){var j=a.Event(e.expanded);if(this.options.accordion){var k=m.siblings(h.open);var l=k.children(h.treeviewMenu);this.collapse(l,k)}m.addClass(b.open);n.slideDown(this.options.animationSpeed,function(){a(this.element).trigger(j)}.bind(this))};i.prototype.collapse=function(l,k){var j=a.Event(e.collapsed);l.find(h.open).removeClass(b.open);k.removeClass(b.open);l.slideUp(this.options.animationSpeed,function(){l.find(h.open+" > "+h.treeview).slideUp();a(this.element).trigger(j)}.bind(this))};i.prototype._setUpListeners=function(){var j=this;a(this.element).on("click",this.options.trigger,function(k){j.toggle(a(this),k)})};function g(j){return this.each(function(){var k=a(this);var l=k.data(c);if(!l){var m=a.extend({},d,k.data(),typeof j==="object"&&j);k.data(c,new i(k,m))}})}var f=a.fn.tree;a.fn.tree=g;a.fn.tree.Constructor=i;a.fn.tree.noConflict=function(){a.fn.tree=f;return this};a(window).on("load",function(){a(h.data).each(function(){g.call(a(this))})})}(jQuery)+function(a){var d="lion.controlsidebar";var e={slide:true};var i={sidebar:".control-sidebar",data:'[data-toggle="control-sidebar"]',open:".control-sidebar-open",bg:".control-sidebar-bg",wrapper:".wrapper",content:".content-wrapper",boxed:".layout-boxed"};var b={open:"control-sidebar-open",fixed:"fixed"};var f={collapsed:"collapsed.controlsidebar",expanded:"expanded.controlsidebar"};var c=function(j,k){this.element=j;this.options=k;this.hasBindedResize=false;this.init()};c.prototype.init=function(){if(!a(this.element).is(i.data)){a(this).on("click",this.toggle)}this.fix();a(window).resize(function(){this.fix()}.bind(this))};c.prototype.toggle=function(j){if(j){j.preventDefault()}this.fix();if(!a(i.sidebar).is(i.open)&&!a("body").is(i.open)){this.expand()}else{this.collapse()}};c.prototype.expand=function(){if(!this.options.slide){a("body").addClass(b.open)}else{a(i.sidebar).addClass(b.open)}a(this.element).trigger(a.Event(f.expanded))};c.prototype.collapse=function(){a("body, "+i.sidebar).removeClass(b.open);a(this.element).trigger(a.Event(f.collapsed))};c.prototype.fix=function(){if(a("body").is(i.boxed)){this._fixForBoxed(a(i.bg))}};c.prototype._fixForBoxed=function(j){j.css({position:"absolute",height:a(i.wrapper).height()})};function h(j){return this.each(function(){var k=a(this);var l=k.data(d);if(!l){var m=a.extend({},e,k.data(),typeof j==="object"&&j);k.data(d,(l=new c(k,m)))}if(typeof j=="string"){l.toggle()}})}var g=a.fn.controlSidebar;a.fn.controlSidebar=h;a.fn.controlSidebar.Constructor=c;a.fn.controlSidebar.noConflict=function(){a.fn.controlSidebar=g;return this};a(document).on("click",i.data,function(j){if(j){j.preventDefault()}h.call(a(this),"toggle")})}(jQuery)+function(a){var d="lion.boxwidget";var e={animationSpeed:500,collapseTrigger:'[data-widget="collapse"]',removeTrigger:'[data-widget="remove"]',collapseIcon:"fa-minus",expandIcon:"fa-plus",removeIcon:"fa-times"};var i={data:".box",collapsed:".collapsed-box",body:".box-body",footer:".box-footer",tools:".box-tools"};var c={collapsed:"collapsed-box"};var f={collapsed:"collapsed.boxwidget",expanded:"expanded.boxwidget",removed:"removed.boxwidget"};var b=function(j,k){this.element=j;this.options=k;this._setUpListeners()};b.prototype.toggle=function(){var j=!a(this.element).is(i.collapsed);if(j){this.collapse()}else{this.expand()}};b.prototype.expand=function(){var k=a.Event(f.expanded);var j=this.options.collapseIcon;var l=this.options.expandIcon;a(this.element).removeClass(c.collapsed);a(this.element).find(i.tools).find("."+l).removeClass(l).addClass(j);a(this.element).find(i.body+", "+i.footer).slideDown(this.options.animationSpeed,function(){a(this.element).trigger(k)}.bind(this))};b.prototype.collapse=function(){var j=a.Event(f.collapsed);var k=this.options.collapseIcon;var l=this.options.expandIcon;a(this.element).find(i.tools).find("."+k).removeClass(k).addClass(l);a(this.element).find(i.body+", "+i.footer).slideUp(this.options.animationSpeed,function(){a(this.element).addClass(c.collapsed);a(this.element).trigger(j)}.bind(this))};b.prototype.remove=function(){var j=a.Event(f.removed);a(this.element).slideUp(this.options.animationSpeed,function(){a(this.element).trigger(j);a(this.element).remove()}.bind(this))};b.prototype._setUpListeners=function(){var j=this;a(this.element).on("click",this.options.collapseTrigger,function(k){if(k){k.preventDefault()}j.toggle()});a(this.element).on("click",this.options.removeTrigger,function(k){if(k){k.preventDefault()}j.remove()})};function h(j){return this.each(function(){var k=a(this);var l=k.data(d);if(!l){var m=a.extend({},e,k.data(),typeof j==="object"&&j);k.data(d,(l=new b(k,m)))}if(typeof j=="string"){if(typeof l[j]=="undefined"){throw new Error("No method named "+j)}l[j]()}})}var g=a.fn.boxWidget;a.fn.boxWidget=h;a.fn.boxWidget.Constructor=b;a.fn.boxWidget.noConflict=function(){a.fn.boxWidget=g;return this};a(window).on("load",function(){a(i.data).each(function(){h.call(a(this))})})}(jQuery)+function(a){var c="lion.todolist";var d={iCheck:false,onCheck:function(){},onUnCheck:function(){}};var g={data:'[data-widget="todo-list"]'};var b={done:"done"};var h=function(i,j){this.element=i;this.options=j;this._setUpListeners()};h.prototype.toggle=function(i){i.parents(g.li).first().toggleClass(b.done);if(!i.prop("checked")){this.unCheck(i);return}this.check(i)};h.prototype.check=function(i){this.options.onCheck.call(i)};h.prototype.unCheck=function(i){this.options.onUnCheck.call(i)};h.prototype._setUpListeners=function(){var i=this;a(this.element).on("change ifChanged","input:checkbox",function(){i.toggle(a(this))})};function f(i){return this.each(function(){var j=a(this);var k=j.data(c);if(!k){var l=a.extend({},d,j.data(),typeof i==="object"&&i);j.data(c,(k=new h(j,l)))}if(typeof k=="string"){if(typeof k[i]=="undefined"){throw new Error("No method named "+i)}k[i]()}})}var e=a.fn.todoList;a.fn.todoList=f;a.fn.todoList.Constructor=h;a.fn.todoList.noConflict=function(){a.fn.todoList=e;return this};a(window).on("load",function(){a(g.data).each(function(){f.call(a(this))})})}(jQuery)+function(a){var c="lion.directchat";var g={data:'[data-widget="chat-pane-toggle"]',box:".direct-chat"};var b={open:"direct-chat-contacts-open"};var d=function(h){this.element=h};d.prototype.toggle=function(h){h.parents(g.box).first().toggleClass(b.open)};function f(h){return this.each(function(){var i=a(this);var j=i.data(c);if(!j){i.data(c,(j=new d(i)))}if(typeof h=="string"){j.toggle(i)}})}var e=a.fn.directChat;a.fn.directChat=f;a.fn.directChat.Constructor=d;a.fn.directChat.noConflict=function(){a.fn.directChat=e;return this};a(document).on("click",g.data,function(h){if(h){h.preventDefault()}f.call(a(this),"toggle")});a(".inner-content-div").slimScroll({height:"auto"});a(".search-box a, .search-box .app-search .srh-btn").on("click",function(){a(".app-search").toggle(200)});a(document).on("click",".box-btn-close",function(){a(this).parents(".box").fadeOut(600,function(){if(a(this).parent().children().length==1){a(this).parent().remove()}else{a(this).remove()}})});a(document).on("click",".box-btn-slide",function(){a(this).toggleClass("rotate-180").parents(".box").find(".box-content").slideToggle()});a(document).on("click",".box-btn-maximize",function(){a(this).parents(".box").toggleClass("box-maximize").removeClass("box-fullscreen")});a(document).on("click",".box-btn-fullscreen",function(){a(this).parents(".box").toggleClass("box-fullscreen").removeClass("box-maximize")});a(document).on("click",'a[href="#"]',function(h){h.preventDefault()});a(document).on("click",".file-browser",function(){var h=a(this);if(h.hasClass("form-control")){setTimeout(function(){h.closest(".file-group").find('[type="file"]').trigger("click")},300)}else{var i=h.closest(".file-group").find('[type="file"]');i.on("click",function(j){j.stopPropagation()});i.trigger("click")}});a(document).on("change",'.file-group [type="file"]',function(){var k=a(this)[0];var l=k.files.length;var h="";for(var j=0;j<l;++j){h+=k.files.item(j).name+", "}h=h.substr(0,h.length-2);a(this).closest(".file-group").find(".file-value").val(h).text(h).focus()});a(document).on("change",".custom-file-input",function(){var h=a(this).val().split("\\").pop();a(this).next(".custom-file-control").attr("data-input-value",h)});a(".custom-file-control:not([data-input-value])").attr("data-input-value","Choose file...")}(jQuery);