import axios from "axios";

const agent = axios.create({
  baseURL: "https://team2-api.mken.site/"
})

export async function getButtons() {
  const r = await agent.get("/buttons");
  return r.data.buttons;
}

export async function getActivities() {
  const r = await agent.get("/activities");
  return r.data.activities;
}

export async function getButtonPreset(bid) {
  const r = await agent.get(`/buttons/${bid}`);
  return r.data.button;
}

export async function putButtonPreset(bid, presetActivities) {
  const r = await agent.put(`/button/${bid}/preset`, { activities: presetActivities });
  return r.data;
}