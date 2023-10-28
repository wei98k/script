// ==UserScript==
// @name         V2EX Custom Styling
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Customize V2EX.com layout
// @author       You
// @match        https://*.v2ex.com/t/*
// @grant        GM_addStyle
// ==/UserScript==

(function() {
    'use strict';

    // 隐藏 #Rightbar
    GM_addStyle('#Rightbar { display: none; }');

    // 设置 #Main 的 margin
    GM_addStyle('#Main { margin: 0 50px 0 20px; }');
})();