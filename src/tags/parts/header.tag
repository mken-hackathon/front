import "./side-menu.tag";

<mken-header>
  <nav class="mken-navi">
    <ul class="mken-icons">
      <li><figure class="image is-48x48"><img src="/img/favicon.png" /></figure></li>
      <li><figure class="image is-48x48"><img src="/img/event.png" /></figure></li>
      <li class="is-available">
        <a href="#/activities" onclick={menuHide}>
          <figure class="image is-48x48"><img src="/img/register.png" /></figure>
        </a>
      </li>
      <li><figure class="image is-48x48"><img src="/img/gossip.png" /></figure></li>
      <li class="is-available">
        <a onclick={ menuClick }>
          <figure class="image is-48x48"><img src="/img/menu.png" /></figure>
        </a>
      </li>
    </ul>
  </nav>
  <side-menu menu-show={ menuShow } />

  <style>
    .mken-navi {
      padding: 3px 0px;
      background-color: #d7e4bd;
    }
    .mken-icons {
      display: flex;
      justify-content: space-around;
    }
    .mken-icons li.is-available {
      background-color: white;
      border-radius: 50%;
      box-shadow: 0px 0px 11px 5px #d7e4bd inset;
    }
  </style>

  <script>
    this.menuShow = false;
    menuClick() {
      this.update({menuShow: !this.menuShow});
    }

    menuHide() {
      this.update({menuShow: false});
    }
  </script>
</mken-header>