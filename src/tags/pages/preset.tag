const PRESET_FIELDS = [
  { 
    action: "腹筋" , selects: ["10回", "30回", "50回", "100回"] ,
    description: "ほらジョニー、腹筋が火を吹いてきただろう？"
  },
  { 
    action: "腕立て", selects: ["10回", "30回", "50回", "100回"] ,
    description: "大地を押すように力を込めて。"
  },
  { 
    action: "スクワット", selects: ["10回", "30回", "50回", "100回"] ,
    description: "空高く伸びる大木のように。"
  },
  { 
    action: "ランニング", selects: ["1km","5km", "10km", "20km"], 
    description: "ただただ無心にひた走る"
  },
  { 
    action: "自転車", selects: ["5km","10km", "20km", "50km"],
    description: "I want to ride my bicycle..."
  },
  { 
    action: "瞑想", selects: ["5分","30分", "1時間", "2時間"] ,
    description: "我が心すでに空なり 空なるが故に無"
  }
];

<preset-page>
  <header class="hero is-primary">
    <h2 class="subtitle is-5 has-text-centered">M健ダッシュボタン設定</h2>
  </header>
  <section class="hero">
    <div class="hero-head">
      <h1 class="title">{opts.bid}</h1>
      <p>ボタンにプリセットするアクティビティ項目を設定しよう</p>
    </div>
  </section>
  <section class="section preset-fields">
    <div class="container">
      <preset-field each = { f, i in this.fields } 
        field = { f }
      />
    </div>
  </section>

  <style>
    .hero-head {
      padding: 1rem 1rem;
    }
    .section.preset-fields {
      padding-top: 0;
    }
    .preset-fields .container {
      border-top: solid 1px #dbdbdb;
    }
  </style>

  <script>
    this.fields = PRESET_FIELDS;

    this.on("before-mount", () => {

    });
  </script>
</preset-page>

<preset-field>
  <div class="field">
    <div class="control">
      <label class="label">
        <input type="checkbox" />
        {action}
      </label>
      <p class="help">{ description }</p>
    </div>
    <div class="control">
      <div class="select">
        <select>
          <option></option>
          <option each={e,i in selects}>{e}</option>
        </select>
      </div>
    </div>
  </div>

  <style>
    .field {
      display: flex;
      justify-content: space-between;
      padding: 0.8rem 0.5rem 0.5rem 0.5rem;
      border-bottom: solid 1px #dbdbdb;
    }
    .help {
      color: #a9a9a9;
    }
  </style>

  <script>
    const field = this.opts.field;
    this.action = field.action;
    this.description = field.description;
    this.selects = field.selects;
  </script>
</preset-field>