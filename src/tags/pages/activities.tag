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

    this.on("before-mount", async () => {
      await this.refreshActivities();
      this.intervalId = setInterval(()=>{
        this.refreshActivities();
      }, 5000);
    })

    this.on("unmount", ()=> {
      clearInterval(this.intervalId);
    });

    lastTimestamp() {
      if(!Array.isArray(this.activities) || this.activities.length < 1) {
        return;
      }
      //降順に並んでいるので先頭が最新
      return this.activities[0].timestamp;
    }
    async refreshActivities() {
      const lastTimestamp = this.lastTimestamp();
      console.log(lastTimestamp);
      const activities = (await getActivities()).sort((a, b) => b.timestamp - a.timestamp);
      //初回読み込み
      if(!lastTimestamp) {
        this.update({ activities });
        return;
      }
      const added = activities.filter(act => act.timestamp > lastTimestamp).map(act => Object.assign({ isNew: true } , act));
      if(added.length > 0) {
        console.log(added);
        this.update({ activities: added.concat(this.activities) });
      }
    }
  </script>
</activities-page>

<activity-item>
  <div class="act-row { is-new: isNew }">
    <p>{ timestamp } </p>
    <p>{ action } </p>
    <p>{ amount } </p>
  </div>

  <style>
    .act-row {
      display: flex;
      justify-content: space-between;
      padding: 0.5rem;
      border-bottom: solid 1px #dbdbdb;
      transition: opacity 0.5s;
      opacity: 1.0;
    }
    .is-new {
      opacity: 0.1;
    }
  </style>

  <script>
    this.action = this.opts.activity.action;
    this.amount = this.opts.activity.amount;
    this.timestamp = moment(new Date(this.opts.activity.timestamp)).format("MM/DD H:mm:ss");
    this.isNew = this.opts.activity.isNew;

    this.on("mount", ()=>{
      //新規追加された行をふわっと追加
      if(this.isNew) {
        setTimeout(()=>{
          this.update({isNew: false});
        }, 500)
      }
    });
  </script>
</activity-item>