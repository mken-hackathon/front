import { getActivities } from "../../lib/api";
import moment from "moment";

<activities-page>
  <header class="hero is-primary">
    <h2 class="subtitle is-5 has-text-centered">活動記録</h2>
  </header>
  <section class="section">
    <activity-item each={e,i in activities} activity={e} />
  </section>

  <script>
    this.activities = [];

    this.on("mount", async () => {
      await this.refreshActivities();
    })

    async refreshActivities() {
      const activities = (await getActivities()).sort((a, b) => b.timestamp - a.timestamp);
//      console.log(activities);
      this.update({ activities });
    }
  </script>
</activities-page>

<activity-item>
  <div class="act-row">
    <p>{ timestamp } </p>
    <p>{ action } </p>
    <p>{ amount } </p>
  </div>

  <style>
    .act-row {
      display: flex;
      justify-content: space-between;
      padding: 0.5rem;
      border-bottom: solid 1px #d7e4bd;
    }
  </style>

  <script>
    this.action = this.opts.activity.action;
    this.amount = this.opts.activity.amount;
    this.timestamp = moment(new Date(this.opts.activity.timestamp)).format("MM/DD H:mm");
  </script>
</activity-item>