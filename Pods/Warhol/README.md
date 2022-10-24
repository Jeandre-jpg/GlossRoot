<p align="center">
    <img src="warhol.png" width="650 max-width="90%" alt="Warhol" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.2-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage" />
    </a>
    <a href="https://cocoapods.org">
        <img src="https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg" alt="CocoaPods" />
    </a>
    <a href="http://makeapullrequest.com">
        <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" alt="PRs Welcome" />
    </a>
    <a href="https://medium.com/@toupper">
        <img src="https://img.shields.io/badge/medium-@toupper-blue.svg" alt="Medium: @toupper" />
    </a>
</p>

Welcome to **Warhol** — A library written in Swift that makes easy the process of Face Detection and drawing on top for IOS.

Warhol acts as a wrapper on top of the Apple Vision Framework, detecting the features of a face from camera or image and providing these elements position in your own coordinates, so you can easily draw on top. Forget about the complex Vision or AVFoundation frameworks, just handle the Warhol Face View Model class that encapsulates the features coordinates.

## Features

- [x] Face Detection from Camera
- [x] Face Detection from UIImageView
- [x] Face features conversion to the client coordinates.
- [x] Draw on top of the face.

## Requirements

- iOS 11.0+
- Xcode 11.0+

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `Warhol` by adding it to your `Podfile`:

```ruby
platform :ios, '11.0'
use_frameworks!
pod 'Warhol'
```

To get the full benefits import `Warhol` wherever you use it

``` swift
import Warhol
```
### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate Alamofire into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "toupper/Warhol" ~> 0.2.0
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Alamofire does support its use on supported platforms.

Once you have your Swift package set up, adding Warhol as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/toupper/Warhol.git", .upToNextMajor(from: "0.2.0"))
]
```
## Manually

You can also integrate Warhol into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add Warhol as a git [submodule](https://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/toupper/Warhol.git
  ```

- Open the new `Warhol` folder, and drag the `Warhol.xcodeproj` into the Project Navigator of your application's Xcode project.

- And that's it!

## Usage example

### From Camera, Draw on Top

Import Warhol in the file you are going to use it. Create an instance of ```CameraFaceDetectionViewController```, and asign the view where you are going to draw to the ```cameraFrontView``` property of the former. You can then present the view controller:

```swift
import Warhol

let cameraViewController = CameraFaceDetectionViewController()
let faceView = FaceView()
faceView.backgroundColor = .clear
cameraViewController.cameraFrontView = faceView
present(cameraViewController, animated: true, completion: nil)
```

In order to draw, we should create a subclass of UIView that complies with the Warhol protocol FaceView. We can then draw in their ```func draw(_ rect: CGRect)``` function. Anytime Warhol detects a Face change, it will call ```setNeedsDisplay()``` on the view so it can trigger the draw process:

```swift
import Warhol

final class FaceView: UIView, CameraFrontView {
  var viewModel: FaceViewModel?

  override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext(),
          let viewModel = viewModel else {
      return
    }

    context.saveGState()

    defer {
      context.restoreGState()
    }

    context.addRect(viewModel.boundingBox)

    ...
```

### From Camera, Add Images on Face Features

<p align="center">
    <img src="FaceLayout.jpg" width="375 max-width="90%" alt="FaceLayouts" />
</p>

If you want to add images on top of each Face Features, you have to compose a ```FaceLayout``` object defining an ```ImageLayout``` object for each type of Face Landmark you want to draw. You can set the desired offset and Size Ratio for each feature.  Once you have it, you should then pass it to the faceLayout property of the ```CameraFaceDetectionViewController```. Please notice that if you do that the ```cameraFrontView``` property gets overriden:

```swift
let cameraViewController = CameraFaceDetectionViewController()

let leftEye = ImageLayout(image: UIImage(named: "leftEye")!, sizeRatio: SizeRatio(width: 1, height: 4))
let rightEye = ImageLayout(image: UIImage(named: "rightEye")!, sizeRatio: SizeRatio(width: 1, height: 4))
let nose = ImageLayout(image: UIImage(named: "nose")!)

let faceLayout = FaceLayout(landmarkLayouts: [.leftEye: leftEye,
                                                  .rightEye: rightEye,
                                                  .nose: nose])
cameraViewController.faceLayout = faceLayout

present(cameraViewController, animated: true, completion: nil)
```

Apart from that, you can implement the ```CameraFaceDetectionDelegate``` protocol to react to any change in the Face Dectection. This can be convenient for the case when you do not want to draw on top, but just get the face features (landmarks) coordinates. These are encapsulated in the given parameter ```FaceViewModel```.
### From Image

In order to detect a face features and draw on top, we should pass the sdk the UIImageView depicting the face, and a closure where we draw on top of the image:
```swift
import Warhol

imageView.image = UIImage(named: "Face")
Warhol.drawLandmarks(from: imageView,
                     draw: { (viewModel, context)  in
                      // draw with CGContext
                     },
                     error: {_ in })
```

If instead of modifying the passed image of the you want to generate a new UIImageView instance, use ```drawLandmarksInNewImage```:

```swift
imageView.image = UIImage(named: "Face")
Warhol.drawLandmarksInNewImage(from: imageView,
                               draw: { (viewModel, context)  in
                                  self.draw(viewModel: viewModel, in: context)
                               },
                               completion: { newImage in
                                  self.newImageView.image = newImage
                               },
                               error: {_ in })
```
## Contribute

We would love you for the contribution to **Warhol**, check the ``LICENSE`` file for more info.

## Credits

Created and maintained with love by [César Vargas Casaseca](https://github.com/toupper). You can follow me on Medium [@toupper](https://medium.com/@toupper) for project updates, releases and more stories.

## License

Warhol is released under the MIT license. [See LICENSE](https://github.com/toupper/Warhol/blob/master/LICENSE) for details.
