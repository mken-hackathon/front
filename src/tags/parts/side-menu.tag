<side-menu>
  <div class="is-overlay mken-side-menu { is-show: opts.menuShow, is-hide: !opts.menuShow }">
    <aside class="menu">
      <ul class="menu-list">
        <li>
          <a class="list-group-item">入力方法</a>
        </li>
        <li>
          <a class="list-group-item" href="#/buttons" onclick={menuHide} >M健ダッシュボタン</a>
        </li>
        <li>
          <a class="list-group-item">インセンティブ</a>
        </li>
        <li>
          <a class="list-group-item">利用規約</a>
        </li>
        <li>
          <a class="list-group-item">個人情報について</a>
        </li>
        <li>
          <a class="list-group-item">お問合せ・FAQ</a>
        </li>
        <li>
          <a class="list-group-item" rel="nofollow" data-method="delete">ログアウト</a>
        </li>
      </ul>
    </aside>
  </div>

  <style>
    .mken-side-menu {
      transition: left .5s, right .5s;
      width: 240px;
      background-color: #728e3a;
      z-index: 999;
      position: fixed;
      top: 54px;
      left: 0px;
    }
    .mken-side-menu.is-hide {
      left: -240px;
    }
    .mken-side-menu.is-show {
      left: 0px;
    }
    .menu-list a {
      color: white;
    }
  </style>

  <script>
  </script>
</side-menu>