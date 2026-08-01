<div align="center">

# 🌐 bkz HUB

### The All-in-One Roblox Admin & Utility Hub

**v5.7** • Build 2026.07

> 🔥 Bypass • ESP HD per Category • True Skeleton ESP (fixed!) • Aimbot + FOV Circle • Target Types • Invisible Player ESP • Freecam • VC Anti-Ban • 13 Themes • 9 Menu Effects

</div>

---

## 📑 Table of Contents

- [🚀 Injection](#-injection)
- [🎮 Controls](#-controls)
- [📋 Tabs Overview](#-tabs-overview)
  - [👤 Player](#-player)
  - [🔒 Personal](#-personal)
  - [🎯 Aim](#-aim)
  - [👁 ESP](#-esp)
  - [🌍 World](#-world)
  - [💃 Emotes](#-emotes)
  - [⚙ Settings](#-settings)
  - [ℹ Other](#-other)
- [🎤 VC Anti-Ban](#-vc-anti-ban)
- [🎨 Themes](#-themes)
- [🎆 Menu Effects](#-menu-effects)
- [💾 Configuration](#-configuration)
- [⚡ Requirements](#-requirements)
- [❗ Troubleshooting](#-troubleshooting)
- [📜 Credits](#-credits)

---

## 🚀 Injection

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/anonymedu04/bkzhub/refs/heads/main/bkzHub.lua", true))()
```

> ⚠️ Paste the full script into your executor. Requires a **Lua 5.1 compatible executor** (Synapse, ScriptWare, Krnl, Fluxus, Matcha, etc.).

<div align="center">

💡 **Tip:** For the best experience, inject the script **after** the game has fully loaded.

</div>

---

## 🎮 Controls

| Key / Action | Description |
|:---:|:---|
| `B` | Open / Close the menu (with smooth open/close animation) |
| 🖱 Drag title bar | Move the menu anywhere on screen |
| ↘ Bottom-right corner drag | Resize the menu (corner-only resize) |
| `F` + Mouse | Goku Instant Transmission teleport (when enabled) |
| Right Click + WASD + Q/E | Freecam navigation (when enabled) |
| Scroll Wheel | Freecam zoom (when enabled) |
| Custom key | Mute / Unmute your microphone (VC Anti-Ban) |

---

## 📋 Tabs Overview

The menu is organized into **8 tabs**, each focused on a specific category of features.

### 👤 Player

> 🎯 Target, manipulate, and interact with other players in the server.

<details>
<summary><b>📌 Sections</b></summary>

| Section | Features |
|:---|:---|
| **Targeting** | Search bar to find any player by name or display name, with live refresh dropdown |
| **Actions** | Spectate, Stop Spectate, TP Player to Me, TP Me to Player, Chat Spy (targeted or all players) |
| **🎭 Local Visual Fun** | Sit All, Kill All, Freeze All, Unfreeze All, Remove All Tools, TP All to Me — **client-side visual only** (does not affect other players' game) |
| **🎤 Voice Chat** | Activate VC Anti-Ban + custom mute keybind (keyboard or mouse) |

> 💡 The "Local Visual Fun" section is for **fun only** — changes are local to your client and won't disrupt other players.

</details>

---

### 🔒 Personal

> 🏃 Movement, survival, combat, and chaos — your character's toolkit.

<details>
<summary><b>📌 Sections</b></summary>

| Section | Features |
|:---|:---|
| **🏃 Movement** | Walk Speed adjustable, Jump Height adjustable, Freeze toggle |
| **🦅 Fly** | Fly toggle (WASD + Space/Ctrl), adjustable Fly Speed |
| **👁 Collision & Visual** | Noclip — walk through walls with invisible platform under feet (catches falls) |
| **🛡 Survival** | God Mode (invincible), Anti-Kick Bypass, No Fall Damage, Anti-Tool Grab, Anti-Cheat Bypass, Infinite Jump |
| **🎯 Combat** | Unlimited Ammo, Instant Reload, No Recoil (camera + tool values), Auto Parry |
| **📐 Appearance** | Character Size adjustable (scale up/down) |
| **💥 Chaos & Fun** | NUKE MODE (propulsion + explosion), Explode in Place, Reset Character |

</details>

---

### 🎯 Aim

> 🎯 Full-featured aimbot with FOV circle, target type selection, and distance filtering.

<details>
<summary><b>📌 Features</b></summary>

| Feature | Description |
|:---|:---|
| **Aim Lock ON/OFF** | Master toggle for the aimbot |
| **🎚 Smooth** | Aim speed (1–30%) — lower = snappier, higher = smoother |
| **🔵 FOV** | Radius in pixels for target acquisition (target within circle gets locked) |
| **🎯 Prediction** | Lead/bullet prediction (0–50%) — enhanced with WalkSpeed-based velocity |
| **🔄 Mode** | `hold` (hold key to aim) or `toggle` (click to toggle on/off) |
| **🔧 Method** | `1 - Direct Cam` (camera lerp), `2 - Scriptable Cam`, `3 - HRP Orient` |
| **🖱 Mouse** | Select trigger key: Mouse1 / Mouse2 / Mouse3 |
| **⌨ Keyboard** | Select trigger key from full keyboard layout (A-Z, 0-9, F1-F12, etc.) |
| **🎯 Target Part** | Select target body part: Head, UpperTorso, Torso, HumanoidRootPart |

### 🎯 Target Types (New in v5.7)

| Target | Description |
|:---|:---|
| **Players** | Toggle — aim at other players (default: ON) |
| **Bots/AI** | Toggle — aim at bots and NPCs (default: ON) |
| **Vehicles** | Toggle — aim at VehicleSeat / TankSeat in vehicles |
| **Objects** | Toggle — aim at Seats and VehicleSeats not in character models |

### 📏 Aim Distance & Visuals (New in v5.7)

| Feature | Description |
|:---|:---|
| **Aim Distance** | Max distance to target (0 = infinite) — ignores targets beyond this range |
| **FOV Circle** | Visual circle overlay showing your FOV radius — renders on screen when aim is enabled |

### What's boosted in v5.7

- **Prediction** now factors in the target's **WalkSpeed** for more accurate lead
- **Target Part selection** — aim at Head, UpperTorso, Torso, or HumanoidRootPart
- **Smooth factor clamped** (0.01–0.95) to prevent overshooting
- **Target validation** — checks if the target part still exists every frame
- **Fallback chain** — if the selected part is missing, falls back to Head → Torso → HRP
- **Distance filtering** — skip targets beyond max distance
- **FOV Circle visual** — see your aim radius in real-time

</details>

---

### 👁 ESP

> 📍 Full ESP suite — Players, Bots/NPC, Self — each with independent toggles, master enable, style customization, and invisible player support.

<details>
<summary><b>📌 Sections</b></summary>

| Section | Features |
|:---|:---|
| **👤 Players** | ✅ TOUT Joueurs (master), Boxes, Names + Team, Health (text), Health Bar, Distance, Head Dot, Skeleton, Chams, Snaplines |
| **🤖 Bots / NPC** | ✅ TOUT Bots (master), Boxes, Names, Health, Health Bar, Distance, Head Dot, Skeleton, Chams, Snaplines, Scan Bots Now |
| **👻 Self** | Show Self ESP toggle |
| **🎨 Couleurs** | Enemy, Ally, Bot, Self (4 dropdowns with 9 presets each) |
| **⚙ Style** | Fill Transparence slider, Box Style (corners/full), Epaisseur Skeleton slider |
| **📏 Distance Max** | Joueurs (0 = infini), Bots (0 = infini) |

### ESP Improvements in v5.7

| Feature | Before | After |
|:---|:---|:---|
| **Organization** | 9 sections scattered | **6 sections** — Players, Bots, Self, Colors, Style, Distance |
| **Master Toggles** | Not available | **✅ TOUT Joueurs / ✅ TOUT Bots** — enable/disable all at once |
| **Head Dot** | Not available | **New!** Glowing dot on head (players + bots) |
| **Fill Transparency** | Fixed at 85% | **Adjustable** slider (0–100%) |
| **Box Style** | Corners only | **Toggle** corners / full outline |
| **Skeleton Thickness** | Fixed at 0.15 | **Adjustable** slider (0.05–0.50) |
| **Snaplines** | Not available | **New!** Beam lines below characters |
| **Skeleton** | Dots at joints | **Real Beams** rendered outside character for visibility |
| **Invisible Players** | Not visible | **New!** Forces invisible players visible via LocalTransparencyModifier |
| **Self ESP** | Not available | **New!** See your own name, health, distance |
| **Independent Toggles** | Shared for all | **Per-category** — enable Boxes for players only, Skeleton for bots only, etc. |

</details>

---

### 🌍 World

> 🌅 Control the environment, time, weather, and physics.

<details>
<summary><b>📌 Sections</b></summary>

| Section | Features |
|:---|:---|
| **☀ Environment** | Cinematic Shaders, Night Mode, Rainbow Sky |
| **🌫 Fog & Effects** | Dense Fog, Light Fog, Rain (with particles), Snow (with particles), Sunset |
| **⏩ Time** | Set Time of Day (0–24), Time Speed (0–5×) |
| **⚙ Physics** | Adjustable Gravity |
| **🖥 Performance** | Unlock FPS (uncap), Reset FPS to 60 |

</details>

---

### 💃 Emotes

> 🎬 Play animator-created animations on your character with speed control. Not Roblox defaults — animations from community creators!

<details>
<summary><b>📌 Features</b></summary>

- **⏹ Stop All Emotes** — instantly stop all playing animations
- **⚡ Speed Animation** — adjustable animation speed slider (10%–300%)
- **🎬 Animator Packs** — 12 custom animations from community animators (not Roblox defaults):
  - Wave, Point, Dance, Dance 2, Dance 3, Laugh, Cheer
  - Idle, Walk Style, Run Style, Fall, Sit
- Each toggle **forces the animation** on your character regardless of rig type (R6 or R15)
- Animations **loop continuously** and are visible to everyone
- Toggle off to stop individual animation

### Emotes Improvements in v5.7

| Feature | Before | After |
|:---|:---|:---|
| **Stop All** | Not available | **New!** One-click to stop all playing emotes |
| **Speed Control** | Fixed at 100% | **Adjustable** slider (10%–300%) — slow motion or fast forward |
| **Speed applied instantly** | N/A | Changing speed applies to all currently playing emotes |

</details>

---

### ⚙ Settings

> 🎨 Customize the look, feel, and behavior of the menu.

<details>
<summary><b>📌 Sections</b></summary>

| Section | Features |
|:---|:---|
| **🎨 Theme** | 13 selectable themes via **dropdown menu** (see [Themes](#-themes)) |
| **🎆 Menu Effects** | 9 visual effects in an organized container (see [Menu Effects](#-menu-effects)) |
| **📐 Menu & Lock** | Lock Interface, Menu Opacity slider (20–100%), Reset Size, Recenter Menu |
| **👁 Camera** | FOV slider (30–120°) |
| **💾 Configuration** | Save Config, Load Config, Reset Config (auto-save on every change) |

</details>

---

### ℹ Other

> 📷 Freecam with full control — noclip camera, character freeze, speed, teleport, credits, version info.

| Section | Features |
|:---|:---|
| **📷 Freecam** | Toggle Freecam, **Speed slider** (10–500), **TP Joueur → Freecam**, QWERTY/AZERTY key layout |
| **👑 Credits** | Owner & contributors |
| **ℹ Informations** | Version, controls reminder, feature highlights |

### FreeCam Controls

| Key / Action | Description |
|:---|:---|
| `B` (menu) | Open/Close menu (menu still works in free cam) |
| Right Click + Drag | Rotate camera view |
| Scroll Wheel | Zoom in/out |
| `W` / `A` / `S` / `D` | Move camera forward/left/back/right |
| `Space` | Move up |
| `LeftShift` | Move down (also halved speed) |
| `Q` / `E` | Strafe left/right perpendicular to view |
| `Z` / `Q` (AZERTY) or `Q` | Strafe left |
| `E` / `D` (AZERTY) or `E` | Strafe right |

### FreeCam Improvements in v5.7

| Feature | Before | After |
|:---|:---|:---|
| **Character Freeze** | Only PlatformStand | **Full freeze** — all parts anchored, velocity zeroed, WalkSpeed/JumpPower = 0 |
| **Character Lock** | Character could move | **Fully locked** — character stays exactly where you freeze it, completely immobile |
| **Noclip Camera** | Could collide | **No clipping** — camera flies through walls, parts, everything |
| **Speed Control** | Fixed at 50 | **Adjustable** slider (10–500) with shift-slow for precision |
| **Mouse Sensitivity** | 0.003 (very sensitive) | **Reduced** to 0.0015 — smoother, more controllable rotation |
| **Pitch Clamp** | Unlimited | **Clamped** (-80° to +80°) — prevents gimbal lock / flipping over |
| **Strafe Keys** | W/A/S/D only | **Q/E keys** added for perpendicular strafing |
| **Zoom Speed** | Fast | **Smoother** zoom with wider range (1–200) |
| **TP to Freecam** | Not available | **New!** Teleport your character to the freecam camera position |
| **Unfreeze** | Only PlatformStand reset | **Full unfreeze** — restores all part anchors, velocities, WalkSpeed, JumpPower |

---

## 🎤 VC Anti-Ban

> 🕵️ Advanced Voice Chat anti-ban that hides your voice activity while keeping audio functional.

### How to use

1. Go to **Player** tab → **Voice Chat** section
2. Click **"🎤 Activer VC Anti-Ban"** — the button turns green
3. Click **"⌨ Touche: V [cliquer]"** to set a custom mute/unmute key
4. Press any key on your keyboard or click a mouse button
5. Once active, press your chosen key to **mute/unmute** your microphone

### How it works

| Layer | Action |
|:---|:---|
| 🔇 **Service Spoof** | Spoofs `VoiceChatService` so the game thinks voice chat is **disabled** |
| 🕵️ **State Spoof** | Spoofs your `Voice.VoiceState` as **Inactive** |
| 👻 **UI Hiding** | Hides all voice UI elements (mic/speaker/mute icons) |
| 🎧 **Audio Passthrough** | Your actual audio connection **keeps working** — everyone hears you |

---

## 🎨 Themes

> 🎨 13 fully polished themes with coordinated colors for every UI element. Now selectable via a **dropdown menu**!

| # | Theme | Style | Accent Color |
|:---:|:---|:---|:---|
| 1 | 🟣 **Purple** | Dark with purple accent | `(200, 80, 255)` |
| 2 | ⭐ **Gold** | Dark with gold accent | `(255, 210, 50)` |
| 3 | 🌊 **Ocean** | Dark teal with cyan accent | `(20, 220, 210)` |
| 4 | 💎 **Neon** | Very dark with hot pink accent | `(255, 0, 200)` |
| 5 | 🟠 **Orange** | Dark with orange accent | `(255, 150, 40)` |
| 6 | 💗 **Pink** | Dark with pink accent | `(255, 80, 180)` |
| 7 | 🌑 **Dark** | Default dark with purple accent | `(130, 100, 255)` |
| 8 | 🌕 **Light** | Light mode with indigo accent | `(110, 90, 255)` |
| 9 | 💠 **Cyber** | Near-black with cyan accent | `(0, 230, 255)` |
| 10 | 🔴 **Red** | Dark red with crimson accent | `(255, 60, 85)` |
| 11 | 🟢 **Green** | Dark green with lime accent | `(40, 240, 100)` |
| 12 | 🔵 **Blue** | Dark blue with sky blue accent | `(60, 160, 255)` |
| 13 | 🌐 **Matrix** | Black with digital green accent | `(0, 255, 65)` |

---

## 🎆 Menu Effects

> ✨ 9 visual effects that play within the menu. Effects render **behind the menu content** (ZIndex 0) so you can see them through the semi-transparent pages — they don't block interactions!

| Effect | Description |
|:---|:---|
| ❄ **Menu Snow** | White snowflakes falling gently with drift |
| 🌧 **Menu Rain** | Realistic rain streaks (│ character) falling fast |
| 🔥 **Menu Fire** | Orange/red glowing embers rising from the bottom |
| 🚀 **Menu Rocket** | ▲ rockets shooting up from the bottom |
| 🧑 **Steve Head** | Skin-colored square heads falling with wobble |
| ⬛ **Black Background** | Semi-transparent black overlay over the **game view** behind the menu (not the menu itself) |
| 🌐 **Matrix Rain** | Katakana characters (ﾊﾐﾋｰ...) falling in digital green |
| ✨ **Background Animation** | 4 glowing orbs floating behind the menu in theme colors |
| 🖼 **Menu Border Glow** | 4 pulsing bars around the menu border (Accent ↔ Success) |

> 💡 All effects are managed by **per-effect loops** for performance. The Black Background effect covers the game view, not the menu — giving you a cinematic darkened game while the menu stays readable.

---

## 💾 Configuration

> 💾 Full auto-save and auto-load system with manual controls. Covers ALL settings across every system.

| Action | Description |
|:---|:---|
| **💾 Save Config** | Manually save everything — theme, menu, aimbot (key, mode, smooth, FOV, method, target part, prediction, target types, distance, circle), ESP (all toggles per category, colors, distances, style, fill, skeleton width, head dot), emotes (speed, states), freecam speed |
| **📂 Load Config** | Manually load saved configuration |
| **🗑 Reset Config** | Reset everything to defaults (Dark theme, 380×500, 100% opacity, QWERTY, Mouse2, hold, 70 FOV, all aimbot defaults, ESP defaults, emote speed 100%) |
| **🔄 Auto-Save** | Automatically saves on every change (1-second debounce) |
| **🔄 Auto-Load** | Automatically loads config 0.5s after injection if a saved file exists |

**Config file:** `AdminMenu_config.json` (stored via `writefile`/`readfile`)

### What gets saved

- ✅ Active theme
- ✅ Menu size (width × height)
- ✅ FOV value
- ✅ Menu opacity
- ✅ Key layout (QWERTY/AZERTY)
- ✅ **Aimbot complete**: key, mode, method, smooth, prediction, target part, FOV, target types (Players/Bots/Vehicles/Objects), distance, FOV circle
- ✅ **ESP complete**: all player/bot/self toggles, 4 colors, max distances (player/bot), fill transparency, box style (corners/full), skeleton width
- ✅ Fly speed, walk speed, jump power
- ✅ Freecam speed
- ✅ **Emotes**: animation speed, all emote toggle states
- ✅ Background animation state
- ✅ All toggle states (God Mode, Fly, Noclip, ESP types, Menu Effects, etc.)

---

## ⚡ Requirements

| Requirement | Status |
|:---|:---|
| Roblox executor | ✅ Required (Synapse, ScriptWare, Krnl, Fluxus, Matcha, etc.) |
| Lua 5.1 environment | ✅ Required |
| `writefile` / `readfile` | ⚠️ Optional (needed for config save/load) |
| `setreadonly` / `getrawmetatable` | ⚠️ Optional (needed for VC Anti-Ban) |

---

## ❗ Troubleshooting

| Error | Solution |
|:---|:---|
| `Instance nil` | Your executor doesn't expose Roblox globals. The script auto-captures `Instance` before pcall — try a different executor if it persists. |
| `Voice introuvable` | You're not in a voice chat enabled game, or VC is off. Join voice chat first. |
| Config not saving | Your executor doesn't support `writefile`. Auto-save is skipped silently. |
| Menu not opening | Press `B` key. If still not working, re-inject the script after the game loads. |
| Effects not visible | Make sure the menu is open. Effects render behind menu content — try lowering Menu Opacity for better visibility. |
| Emotes not playing | Make sure your character is spawned. Emotes force on any rig type (R6/R15). |
| Skeleton ESP looking flat | Skeleton uses Beams — make sure the target character has the expected body parts (R15 or R6). |

---

## 📜 Credits

| Role | Name |
|:---|:---|
| 👑 **Owner** | bkz |
| 🤝 **Contributors** | All people who use this menu ❤️ |
| 📦 **Version** | **5.7** (Build 2026.07) |

---

<div align="center">

**🌐 bkz HUB** — *The All-in-One Roblox Admin & Utility Hub*

Made with ❤️ for the Roblox community

</div>