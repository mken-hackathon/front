import { getButtons } from "../../lib/api";
<buttons-page>
  <header class="hero is-primary">
    <h2 class="subtitle is-5 has-text-centered">エム健ダッシュボタン設定</h2>
  </header>  
  <section class="section">
    <p>プリセット設定をしたいボタンを選んでください</p>
    <dash-button each={btn , i in buttons} 
      id={ btn.bid } name={ btn.btnname }
    />
  </section>

  <script>
    this.buttons = [];

    this.on("mount", async () => {
      const buttons = await getButtons();
      this.update({ buttons })
    })
  </script>
</buttons-page>

<dash-button>
  <div class="card">
    <div class="card-content">
      <div class="left">
        <p class="is-size-4 button-name">{opts.name}</p>
        <p class="is-size-6 button-id">({opts.id})</p>  
      </div>
      <div class="right">
        <a href="#/buttons/{ opts.id }/preset" class="button is-success">
          <span class="icon">
            <i class="fa fa-cog" />
          </span>
          <span>設定</span>
        </a>
      </div>
    </div>
  </div>

  <style>
    .card {
      margin: 0.8rem 0;
      border-radius: 0.5rem;
    }
    .button-id {
      color: gray;
    }
    .card-content {
      display: flex;
      justify-content: space-between;
    }
  </style>
</dash-button>