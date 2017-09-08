import { getButtonPreset, putButtonPreset } from "../../lib/api";
import route from "riot-route";

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
    <h2 class="subtitle is-5 has-text-centered">
      <span>M健ダッシュボタン設定</span>
    </h2>
  </header>
  <section class="hero">
    <div class="hero-head">
      <h1 class="title">
        <a href="#/buttons">
          <span class="icon is-medium"><i class="fa fa-chevron-circle-left" /></span>
        </a>
        <span>{ name }</span>
      </h1>
      <h2 class="subtitle has-text-grey-light">{bid}</h2>
      <p>ボタンにプリセットするアクティビティ項目を設定しよう</p>
    </div>
  </section>
  <section class="section preset-fields">
    <div class="container">
      <preset-field each = { f, i in this.fields } 
        field = { f }
      />
      <div class="has-text-centered button-area">
        <a class="button is-primary is-fullwidth" onclick={ onSubmit } >
          <span class="icon"><i class="fa fa-heart"/></span>
          <span>設定更新</span>
        </a>
      </div>
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
    .preset-fields .button-area {
      padding: 1.5rem 3rem;
    }
    .subtitle {
      padding-left: 3rem;
    }
  </style>

  <script>
    this.bid = this.opts.bid;
    this.fields = PRESET_FIELDS;

    this.on("before-mount", async () => {
      const btn = await getButtonPreset(this.bid);
      this.name = btn.btnname;
      this.update();
      this.mergeState(btn.activities);
    });

    mergeState(presetActivities) {
      if(!(Array.isArray(presetActivities) && presetActivities.length > 0)) {
        return;
      }
      this.fields = this.fields.map(f => {
        const exists = presetActivities.find(p => p.action === f.action);
        if(exists) {
          return Object.assign({ checked: true, amount: exists.amount}, f);
        } else {
          return Object.assign({ checked: false, amount: "" }, f);
        }
      });
      this.update();
    }

    async onSubmit() {
      const presetFields = this.tags["preset-field"];
      const checkedActivities = presetFields.filter(f => f.checked).map(f => {
        return { action: f.action, amount: f.selected }
      });
      const r = await putButtonPreset(this.bid, checkedActivities);
      route("/buttons");
    }
  </script>
</preset-page>

<preset-field>
  <div class="field">
    <div class="control">
      <label class="label">
        <span class="icon"><i class="fa { icon(checked) }" /></span>
        <span>{action}</span>
      </label>
      <p class="help">{ description }</p>
    </div>
    <div class="control">
      <div class="select">
        <select ref="amount" onchange={fieldChanged}>
          <option></option>
          <option each={e,i in selects} selected={e === parent.selected} >{e}</option>
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
    this.checked = field.checked;
    this.description = field.description;
    this.selects = field.selects;
    this.selected = field.amount;

    icon(value) {
      return value ? "fa-check-square-o" : "fa-square-o";
    }

    fieldChanged() {
      this.checked = this.refs["amount"].value ? true : false;
      this.selected = this.refs["amount"].value;
      this.update();
      console.log(this.checked, this.selected)
    }
  </script>
</preset-field>