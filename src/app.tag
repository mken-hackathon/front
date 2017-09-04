import route from "riot-route";
import "./tags/pages/main.tag";
import "./tags/pages/preset.tag";
import "./tags/parts/header.tag";

<app>
  <header>
    <mken-header />
  </header>
  <article id="page-content" />

  <script>
    this.route = route.create();
    this.route("/main", () => {
      riot.mount("#page-content", "main-page");
    });
    this.route("/preset", () => {
      riot.mount("#page-content", "preset-page");      
    });

    route.start(true);
  </script>
</app>

riot.mount("app");