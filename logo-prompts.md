# bkz HUB — Logo prompts

This file explains how to generate a logo for the hub and plug it into `bkzHub.lua`.

The script works **without any image**: by default the title bar shows the vector "B" monogram (`logoText`). Setting `LOGO_IMAGE_ID` replaces that monogram with your own uploaded decal, without duplicating the badge or adding a shadow artifact.

---

## 1. Technical specs

| Item | Value |
|:---|:---|
| Format | PNG (transparent background) |
| Size | 512 × 512 px (the UI displays it at 30 × 30 px) |
| Shape | Centered, square, safe margin of 32 px |
| Style | Flat / vector / subtle gradient, no photo, no text |
| Contrast | Must stay readable on dark **and** light themes |
| Rights | Use an image you own or generated with a license that allows Roblox uploads |

Tips:

- Avoid thin hairlines: they disappear at 30 px.
- Avoid pure white on transparent alone — add the accent color of the hub (purple `#C850FF` or cyan `#14DCD2`).
- Keep the silhouette simple so it reads at small size.

---

## 2. Prompts (Gemini / Imagen)

### Prompt A — Monogram lightning

```text
A minimalist app icon, 512x512, transparent background. A geometric letter B built
from two stacked rounded rectangles with a sharp lightning-shaped notch cut through
the right side. Flat vector style, subtle diagonal gradient from deep purple #7A55FF
to vivid pink #FF5AC8, thin inner white highlight, soft rounded corners, centered
composition with generous padding, no text, no photo, no drop shadow, crisp edges,
professional gaming hub branding.
```

### Prompt B — Glass hub node

```text
A modern glassmorphism logo icon, 512x512, transparent background. A rounded square
badge with a frosted-glass surface, a glowing purple-to-cyan gradient ring, and a
clean geometric "B" monogram in the center. Flat vector rendering, subtle depth,
crisp 2 px outline, centered, no external shadow, no text besides the monogram,
high contrast, suitable for a Roblox admin hub title bar.
```

### Prompt C — Shield / security

```text
A minimal shield-shaped app icon, 512x512, transparent background. The shield is
built from smooth geometric planes with a deep indigo base and a neon purple rim.
Inside, a simplified letter B formed by two solid shapes. Flat vector style, no
gradients harsher than 20 percent, no texture, no drop shadow, centered, bold
silhouette readable at 32 px, professional and clean.
```

### Prompt D — Neon cube

```text
A 512x512 transparent app icon: an isometric neon cube with rounded edges, deep
black glass faces, cyan and magenta edge lighting, and a small white geometric B
embossed on the front face. Vector-like clean rendering, strong silhouette, no
background, no text, no glow bleeding outside the canvas, modern gaming aesthetic.
```

Generate 2–4 variants per prompt, then pick the one that stays readable at 30 px.

---

## 3. Upload to Roblox

1. Open **Roblox Studio** → **View** → **Asset Manager**.
2. Select **Images** → **Import** (or drag the PNG into the window).
3. Upload the image and wait for moderation.
4. Open the uploaded asset and copy its **Asset ID** (the number in the URL, not the whole URL).
5. In `bkzHub.lua`, find the configuration block near the top:

```lua
LOGO_IMAGE_ID = 0
```

6. Replace `0` with your ID:

```lua
LOGO_IMAGE_ID = 1234567890
```

7. Re-inject the script. The `ImageLabel` is created inside the existing `logoBadge` and `logoText` is hidden automatically.

If the image does not appear:

- Confirm the ID is an **image/decal**, not a model or audio asset.
- Confirm the asset is public or owned by the logged-in account.
- Check the Output window for moderation or permission errors.
- Set `LOGO_IMAGE_ID = 0` to fall back to the vector monogram.

---

## 4. Icon assets (optional)

The UI icons (tabs, lock, search, refresh, close) are drawn with Roblox primitives, so they never break. To use your own icons instead, fill the `ICON_ASSETS` table near the top of the script:

```lua
ICON_ASSETS = {
    player = 0, personal = 0, aim = 0, esp = 0, world = 0, settings = 0, other = 0,
    close = 0, lock = 0, unlock = 0, search = 0, refresh = 0,
}
```

Use square PNG icons (64 × 64 or 128 × 128, transparent background, white glyph). The script tints them with the active theme color, so a white glyph is recommended.
