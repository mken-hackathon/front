import axios from "axios";

const agent = axios.create({
  baseURL: "https://team2-api.mken.site/"
})

export async function getButtons() {
  const r = await agent.get("/buttons");
  return r.data.buttons;
}