# langa-flutter-bits

Small pieces pulled out of a production Flutter app, de-coupled so they depend
on nothing but Flutter.

No theme, no state manager, no package to install. Copy the file you need.

Published by **LANGA Corporation S.r.l.** under the MIT licence.

## What is here

| File | Lines | What it does |
|---|---|---|
| `scale_on_tap.dart` | 69 | wraps any widget so it scales and fades while pressed |
| `vertical_toggle_switch.dart` | 77 | a toggle that slides vertically instead of sideways |
| `custom_switch.dart` | 84 | an animated switch with the track and knob colours as parameters |
| `current_time_display.dart` | 64 | a clock that ticks, and stops when you tell it to |

**Not a widget, but it belongs here:**

| File | Lines | What it does |
|---|---|---|
| `api_failure.dart` | 54 | six distinct failure outcomes, and no text inside them |

## Why `api_failure` is here

Because collapsing outcomes is the same defect as reporting green on a check
that measured nothing — the tools in this account exist for that. Six things
go wrong when an app talks to a server, and "something went wrong" tells the
person none of them.

`rateLimited` in particular is not a user error: it is a defence that worked.

The text stays outside the exception. One that carries its own sentence speaks
one language, and you find out the day you need a second.

## What this is not

It is not a package and not a design system. A few files, taken out of an app
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

```dart
VerticalToggleSwitch(
  iconOn: CupertinoIcons.phone,
  iconOff: CupertinoIcons.envelope,
  onChanged: (isOn) => setState(() => calling = isOn),
)
```

The switch holds its own state and tells you about it through `onChanged`.
Everything else — size, radius, icons, colours, padding — has a default.

```dart
CurrentTimeDisplay(
  isRunning: true,                                  // false stops the tick
  textStyle: const TextStyle(fontSize: 22),         // optional
)
```

`api_failure` is not a widget: it is six outcomes and no text. The caller owns
the words, so the same failure can speak a second language later.

```dart
throw ApiFailure(ApiFailureKind.rateLimited, retryAfter: const Duration(seconds: 30));

// at the edge, where the words live:
final message = failure.resolve((kind, retryAfter) => switch (kind) {
  ApiFailureKind.rateLimited => "Too many attempts. Try again in ${retryAfter?.inSeconds}s.",
  ApiFailureKind.invalidCredentials => "That password is not right.",
  _ => "Something went wrong.",
});
```

`current_time_display.dart` needs `intl`. The other three need only Flutter.

## Where this comes from

LANGA runs an ecosystem of digital services on its own infrastructure.
These came out of the mobile app that sits in front of some of them — the
same app that produced [login-wall](https://github.com/langacorp/login-wall).

- [LANGA](https://langa.tv) — the ecosystem
- [easy LANGA](https://easy.langa.tv) — client management, reports, support
- [Drive In](https://drivein.langa.tv) — marketing packages for local business
- [eFruit](https://efruit.langa.tv) — food marketplace for local producers

See [How we work](https://about.langa.tv/how-we-work/).

## Licence

MIT — see LICENSE. Copyright LANGA Corporation S.r.l.
