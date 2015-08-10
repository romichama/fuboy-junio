## Advanced NSOperations

  Funbuy Requiere elementalmente de la Libreria SDK PARSE.COM
  #import <ParseUI/ParseUI.h>

## Requirements

### Build

iOS 9 SDK

### Runtime

iOS 9


#### CocoaPods

`ParseUI` es abilitado por CocoaPods.
Añadido el siguiente `Podfile`:

```ruby
pod 'ParseUI'
```
#### Build from Source

`ParseUI`  puede construir  built para estos recursos soportador en  Xcode o subproject referenciados.  
Siguiente estos pasos para  build and correr el codigo :
- Download los recursos de  `git ` 
- Correr `pod install` en el reporte descargar todas las dependencias
- Abrir `funbuy.xcworkspace`
- Build and Run `Funbuy` target

#### PFSignUpViewController
If you are using `PFLogInViewController` with the `PFLogInFieldsSignUpButton` option enabled, 
you do not need to do any additional work to enable the sign up functionality.  
When your user taps on the sign up button on the log in screen - a sign up screen will appear.  
However, there are occasions where you might want to use the sign up screen independently of the log in screen.  
This is when the `PFSignUpViewController` comes in handy.
```objective-c
PFSignUpViewController *controller = [[PFSignUpViewController alloc] init];
controller.delegate = self;
[self presentViewController:controller animated:YES completion:nil];
```

#### PFQueryTableViewController
Data oriented iOS applications are mostly a collection of `UITableViewController`s and corresponding `UITableView`s.  
When using Parse, each cell of a `UITableView` typically represents data from a `PFObject`.  
`PFQueryTableViewController` is a sub-class of `UITableViewController` that provides a layer of abstraction that lets you easily display data from one of your Parse classes.
```objective-c
PFQueryTableViewController *controller = [[PFQueryTableViewController alloc] initWithStyle:UITableViewStylePlain className:@"Todo"];
[self presentViewController:controller animated:YES completion:nil];
```

#### PFImageView
Many apps need to display images stored in the Parse Cloud as `PFFile`s.  
However, to load remote images with the built-in `UIImageView` involves writing many lines of boilerplate code.  
`PFImageView` simplifies this task by abstracting away these parts.
```objective-c
PFImageView *imageView = [[PFImageView alloc] init];
imageView.image = [UIImage imageNamed:@"..."]; // placeholder image
imageView.file = (PFFile *)someObject[@"picture"]; // remote image
[imageView loadInBackground];
```

## Aprendiendo 
- Check out [ParseUIDemo](https://github.com/ParsePlatform/ParseUI-iOS/tree/master/ParseUIDemo) project
- Read the [iOS Guides](https://parse.com/docs/ios_guide#ui/iOS)
- Browse official [API Reference](https://parse.com/docs/ios/api/)
- Follow few [tutorials](https://parse.com/tutorials/)

## Contribucion
See the CONTRIBUTING file for how to help out.