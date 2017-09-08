import { getActivities } from "../../lib/api";

<activities-page>
  <header class="hero is-primary">
    <h2 class="subtitle is-5 has-text-centered">活動記録</h2>
  </header>
  <section class="section">
  </section>

  <script>
    this.activities = [];

    this.on("mount", async () => {
      await this.refreshActivities();
    })

    async refreshActivities() {
      const activities = await getActivities();
      console.log(activities);
      this.update({ activities });
    }
  </script>
</activities-page>