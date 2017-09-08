<preset-page>
  <header class="hero is-primary">
    <h2 class="subtitle is-5 has-text-centered">M健ダッシュボタン設定</h2>
  </header>
  <section class="section">
    { opts.bid }
  </section>
</preset-page>

<preset-field>
  <label class="label">{opts.label}</label>
  <p>{ opts.description }</p>
  <div class="control">
    <div class="select">
      <select each={e,i in opts.selects  }>
        <option></option>
      </select>
    </div>
  </div>
</preset-field>