# 🌐 bkz HUB v5.0

**The All-in-One Roblox Admin & Utility Hub**

> 🔥 Bypass • Force Modes • ESP HD • Freecam • VC Anti-Ban • Aimbot

---

## 🚀 Injection

```lua
loadstring(game:HttpGet("https://pastebin.com/raw/..."))()
```

> ⚠️ Paste the full script into your executor. Make sure you use a **Lua 5.1 compatible executor** (Synapse, ScriptWare, Krnl, Fluxus, etc.).

---

## 🎮 Controls

| Key | Action |
|-----|--------|
| `B` | Open / Close menu |
| Drag title bar | Move menu |
| Edge / Corner | Resize menu |
| Custom key | Mute/Unmute mic (VC Anti-Ban) |

---

## 📋 Tabs Overview

### 👤 Player
- **Player Targeting** — Search & select any player in the server
- **Actions** — Spectate, TP to/from, Chat Spy (targeted or all)
- **Force Modes** — Force Sit, Kill, Freeze, Unfreeze, Remove Tools, TP all to you
- **Voice Chat** — Activate VC Anti-Ban + custom mute keybind

### 🔒 Personal
- **Movement** — Walk Speed, Jump Height, Freeze
- **Fly** — Toggle fly (WASD + Space/Ctrl) with adjustable speed
- **Collision & Visual** — Noclip, Character Size
- **Survival** — God Mode, Anti-Kick, No Fall Damage, Anti-Tool Grab, Anti-Cheat Bypass, Infinite Jump
- **Combat** — Unlimited Ammo, Instant Reload, No Recoil, Auto Parry
- **Aim Lock** — Full aimbot with FOV, smoothing, prediction, hold/toggle mode, mouse/keyboard selection
- **Chaos & Fun** — Nuke Mode, Explode, Reset Character

### 👁 ESP
- **Visuals** — Boxes, Names + Team Tag, Health (text), Health Bar, Distance, Head Dots, Skeleton, Chams (Highlight), Tracers, Snaplines
- **Bot ESP** — Enable ESP on NPCs/bots + custom color
- **Colors** — Custom enemy & ally colors
- **Shortcuts** — Enable All / Disable All

### 🌍 World
- **Environment** — Cinematic Shaders, Night Mode, Rainbow Sky
- **Fog & Effects** — Dense Fog, Light Fog, Rain, Snow, Sunset
- **Time** — Set Time of Day, Time Speed
- **Physics** — Gravity control
- **Performance** — Unlock FPS, Reset FPS (60)

### ⚙ Settings
- **Themes** — Dark, Light, Cyber, Red, Green
- **Menu & Lock** — Lock Interface, Reset Size, Recenter, Opacity slider
- **Camera** — FOV slider (30–120)
- **Configuration** — Save / Load / Reset config (uses executor's `writefile`)

### ℹ Other
- **Freecam** — Toggle freecam with Right Click (QWERTY/AZERTY key layout)
- **Credits** & **Version Info**

---

## 🎤 VC Anti-Ban (Advanced)

1. Go to **Player** tab → **Voice Chat** section
2. Click **"Activer VC Anti-Ban"** — the button turns green
3. Click **"⌨ Touche: V [cliquer]"** to set a custom mute/unmute key
4. Press any key on your keyboard or click a mouse button
5. Once the anti-ban is active, press your chosen key to **mute/unmute** your microphone

### How it works
- 🔇 Spoofs `VoiceChatService` so the game thinks voice chat is **disabled**
- 🕵️ Spoofs your `Voice.VoiceState` as **Inactive**
- 👻 Hides all voice UI elements (mic/speaker icons)
- 🎧 Your actual audio connection **keeps working** — everyone hears you

---

## 🎯 Aim Lock Configuration

1. Go to **Personal** tab → **Aim Lock** section
2. Toggle **Aim Lock ON/OFF**
3. Adjust **Smooth** (1–30), **FOV** (pixels), **Prediction** (0–50)
4. Switch **Mode** between `hold` (hold key to aim) and `toggle` (click to toggle)
5. Choose **Method** (default, closest to crosshair, etc.)
6. Select your **Mouse** key (Mouse1/Mouse2/Mouse3) or **Keyboard** key
7. Works on **players and bots** automatically

---

## 💾 Configuration

- **Save Config** — Saves all toggles, theme, FOV, keybinds, etc. to a file
- **Load Config** — Loads your saved configuration
- **Reset Config** — Resets everything to default
- Config is **loaded automatically** on injection if a saved file exists

---

## ⚡ Requirements

- A working Roblox executor (Synapse, ScriptWare, Krnl, Fluxus, etc.)
- Lua 5.1 compatible environment
- `writefile` / `readfile` support for config save/load (optional)

---

## ❗ Troubleshooting

| Error | Solution |
|-------|----------|
| `Instance nil` | Your executor doesn't expose Roblox globals. Try a different executor. |
| `Voice introuvable` | You're not in a voice chat enabled game, or VC is off. Join voice chat first. |
| Config not saving | Your executor doesn't support `writefile`. Config save will be skipped. |
| Menu not opening | Press `B` key. If still not working, re-inject the script. |

---

## 📜 License & Credits

- **Owner:** bkz
- **Contributors:** All users of the menu ❤️
- **Version:** 5.0

---

> 💡 **Tip:** For the best experience, inject the script **after** the game has fully loaded.
