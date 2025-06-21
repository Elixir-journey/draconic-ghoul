# Draconic Ghoul
![Build Status](https://github.com/Elixir-journey/draconic-ghoul/actions/workflows/ci.yml/badge.svg)
![Code Style](https://img.shields.io/badge/style-credo-blue)
![License](https://img.shields.io/github/license/Elixir-journey/draconic-ghoul)

Draconic Ghoul is a real-time, roguelike game engine built with Elixir and Phoenix LiveView. Designed as both a solo project and a public technical series, it explores how to build fast, resilient game systems with clean architecture, platform thinking, and a LiveView approach.

## Story & Design Philosophy

Draconic Ghoul is more than a demo—it's a narrative system:

A cursed ghoul seeks soul fragments of a fallen dragon to restore his fading mind.
Each fragment recovered is a deeper dive into platform design, functional rigor, and game abstraction.
It is inspired by:

- Soulslike themes and tactical games
- ADT-rich languages like Haskell, F#, and Scala
- A desire to master developer platforms and LiveView

This is a practice ground, not an overengineered monolith. Every mechanic, abstraction, and test exists to clarify thinking and grow real-world architectural skill.

## Project Highlights

- Built with Elixir, Phoenix LiveView, and functional design principles
- Game systems modeled with ADTs (Option, Result, etc.) for expressive state
- Backend-first roguelike engine focused on tactical depth and platform extensibility
- Infrastructure-aware: CI/CD, DevContainers, and Dockerized from the start
- Paired with a long-form technical blog series, post by post

## Getting Started

### Local Development (with Dev Containers)

1. Install Docker + VS Code
2. Add the Dev Containers extension
3. Open the repo and select “Reopen in Container”

Inside the container:

```bash
mix deps.get
mix phx.server
```
