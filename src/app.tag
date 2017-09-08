import route from "riot-route";
import "./tags/pages/activities.tag";
import "./tags/pages/buttons.tag";
import "./tags/pages/preset.tag";
import "./tags/parts/header.tag";

<app>
  <header>
    <mken-header />
  </header>
  <article id="page-content" />

  <script>
    this.route = route.create();
    this.route("/activities", () => {
      riot.mount("#page-content", "activities-page");
    });
    this.route("/buttons/*/preset", (bid) => {
      riot.mount("#page-content", "preset-page", { bid });      
    });
    this.route("/buttons", () => {
      riot.mount("#page-content", "buttons-page");
    });
    this.route(() => {
      route("/activities");
    });

    route.start(true);
  </script>
</app>

riot.mount("app");