# langa-flutter-bits

Four small Flutter widgets pulled out of a production app, de-coupled so they
depend on nothing but Flutter.

No theme, no state manager, no package to install. Copy the file you need.

Published by **LANGA Corporation S.r.l.** under the MIT licence.

## What is here

| File | Lines | What it does |
|---|---|---|
| `scale_on_tap.dart` | 69 | wraps any widget so it scales and fades while pressed |
| `vertical_toggle_switch.dart` | 71 | a toggle that slides vertically instead of sideways |
| `custom_switch.dart` | 84 | an animated switch with the track and knob colours as parameters |
| `current_time_display.dart` | 64 | a clock that ticks, and stops when you tell it to |

## What this is not

It is not a package and not a design system. Four files, taken out of an app
because they were the only parts that did not know anything about that app.

The rest of that codebase stays private: it is a product, and publishing a
screen that assumes our data model would help nobody.

## Use

```dart
ScaleOnTap(
  onTap: () => doSomething(),
  child: const Icon(Icons.favorite),
)

CustomSwitch(
  isSwitched: on,
  ontap: () => setState(() => on = !on),
  trackColor: Colors.indigo,   // optional
  knobColor: Colors.orange,    // optional
)
```

`current_time_display.dart` needs `intl`. The other three need only Flutter.

## Where this comes from

LANGA runs an ecosystem of digital services on its own infrastructure.
These four came out of the mobile app that sits in front of some of them — the
same app that produced [login-wall](https://github.com/langacorp/login-wall).

- [LANGA](https://langa.tv) — the ecosystem
- [easy LANGA](https://easy.langa.tv) — client management, reports, support
- [Drive In](https://drivein.langa.tv) — marketing packages for local business
- [eFruit](https://efruit.langa.tv) — food marketplace for local producers

See [How we work](https://about.langa.tv/how-we-work/).

## Licence

MIT — see LICENSE. Copyright LANGA Corporation S.r.l.
