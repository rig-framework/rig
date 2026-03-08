<div align="center">

# RIG
### An open source survival framework. Built from scratch, not bolted together.

![Status](https://img.shields.io/badge/status-pre--alpha-e4ad29?style=flat-square&labelColor=0E0E0E)
![Platforms](https://img.shields.io/badge/platforms-FiveM-red?style=flat-square&labelColor=0E0E0E)
![License](https://img.shields.io/badge/license-LGPL--3.0-555?style=flat-square&labelColor=0E0E0E)
![Built by BOII](https://img.shields.io/badge/built%20by-BOII%20Development-e4ad29?style=flat-square&labelColor=0E0E0E)

[Discord](https://discord.gg/MUckUyS5Kq) · [Documentation](https://rig.li)

</div>

---

## What is RIG?

Most survival servers start by hacking a roleplay framework into something it was never meant to be. That's a lot of work for a messy result.

RIG is a clean slate. 

A real survival framework built specifically for the job at hand - not adapted from something else. 
Every system is designed around how survival gameplay actually works. No compromises, no RP baggage.

---

## Architecture

Class-based OOP Lua. 
If you've worked with any of the other frameworks you'll notice the difference immediately - this is structured like software.

Three embedded libraries ship with the core:

| Library | Purpose |
|---|---|
| **graft** | Core utility layer - callbacks, commands, animations, vehicles, full dev toolkit |
| **drip** | Drawn UI kit - admin tools, zone creators, dev overlays |
| **pluck** | Data-driven NUI system - build any UI from Lua tables, no JS required |

The player core runs on a hardened OOP class with private metatable encapsulation, a clean extension pattern, and a method injection system. 
You can extend everything without touching the core.

---

## What's In Pre-Alpha

| System | Status |
|---|---|
| Player Core | ✅ Stable |
| Appearance | ✅ Full character customisation with tattoos |
| Spawn System | ✅ Zone-based (Rust/ARK style) + beds, sleeping bags, last location |
| Status System | ✅ Hunger, thirst, stamina, stress, radiation and more |
| Injury System | ✅ Per body part tracking |
| Effects System | ✅ Buffs, debuffs, persistent status effects |
| Seasonal Weather | ✅ Persistent, per-bucket simulation |
| HUD | ✅ Included |
| Admin Menu | ✅ Included |
| Loading Screen | ✅ Included |
| Inventory | 🔜 Alpha |

---

## Roadmap

- [x] Player core & extension system
- [x] Appearance system
- [x] Spawn system
- [x] Status, injury & effects
- [x] Seasonal weather
- [x] HUD, admin menu, loading screen
- [ ] Grid inventory with group support *(alpha)*
- [ ] Loot tables & world items
- [ ] Crafting system
- [ ] Faction / group system

---

## Getting Started

> Full docs drop with alpha. Watch the repo.

```bash
git clone https://github.com/rig-framework/rig [rig]
```

Add `ensure rig` to your `server.cfg`. Configuration lives in `/configs`.

---

## Philosophy

Build the foundation right. Everything else follows.

RIG is intentionally a foundation - not a full server. 

It gives you what you need to run a survival server and nothing you don't. 
The codebase is open, the architecture is clean, and it's built to be extended without fighting it.

---

## Built by BOII Development

Designed and maintained by [BOII Development](https://boii.dev) - building in the community since 2020.

Existing BOII scripts will be updated to support RIG. 
If you've got something that needs bridging, commission enquiries are open in the Discord.

---

<div align="center">

**Star the repo if you believe in what this is building toward.**

</div>
