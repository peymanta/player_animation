# Player Animation

A simple and powerful Flutter animation widget that lets you create animations without dealing with AnimationController directly.

## Features

- 🎯 Simple API for creating animations
- 🔄 Support for loop animations
- ⏯️ Play/Pause control
- ⚡ Zero boilerplate code
- 📦 No need to use SingleTickerProviderStateMixin

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  player_animation: ^0.0.1
```

##Usage
Here's a simple example that animates a container's size:

```dart
AnimationPlayer(
  begin: 100,
  end: 200,
  duration: const Duration(seconds: 1),
  play: true,
  loop: true,
  builder: (context, controller, child, animation) {
    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        color: Colors.red,
      ),
    );
  },
)
```

## Parameters
- begin: Starting value of the animation (default: 0)
- end: Ending value of the animation (default: 100)
- play: Controls whether the animation is playing or paused
- loop: If true, animation will repeat indefinitely
- duration: Length of the animation
- builder: Builder function that returns the animated widget
# Examples
Pulsing Container
```dart
AnimationPlayer(
  begin: 50,
  end: 150,
  duration: const Duration(milliseconds: 800),
  play: true,
  loop: true,
  builder: (context, controller, child, animation) {
    return Container(
      width: animation.value,
      height: animation.value,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  },
)
```
Fade Animation
```dart 
AnimationPlayer(
  begin: 0,
  end: 1,
  duration: const Duration(seconds: 2),
  play: true,
  builder: (context, controller, child, animation) {
    return Opacity(
      opacity: animation.value,
      child: YourWidget(),
    );
  },
)
``` 