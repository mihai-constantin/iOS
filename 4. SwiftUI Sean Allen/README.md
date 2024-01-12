# [SwiftUI Fundamentals](https://youtu.be/b1oC7sLIgpI?si=bXl6gPqR0uUHDnQ5)

### 1. Weather App
* Basics: Text, Image, Button, HStack, VStack, ZStack 
* Modifiers
* Extract Views
* **@State, @Binding** vars
* iOS 15: rendering mode for sf symbols
* iOS 16: gradient for ui color
* if-else, switch statements in the **@ViewBuilder**

### 2. Apple-Frameworks App
* LazyHGrid, LazyVGrid, GridItem
* conform struct to **Hashable** and **Identifiable** in order to iterate using **ForEach**
* NavigationView, ScrollView
* MVVM
* @StateObject, ObservableObject
* @Published
* UIViewControllerRepresentable, SFSafariViewController
* Display icons using List instead of LazyVGrid
* NavigationLink
* System button
* Navigation Stack

### 3. Barcode Scanner App
* Navigation View, VStack, Label
* Add camera privacy key-value pair in InfoPlist
* AVFoundation, ScannerVC
* UIViewController -> Coordinator -> SwiftUI View
* viewModel - observable object

### 4. Appetizers App
* TabView
* NavigationStack
* Model Data - conform to Decodable
* Network Manager, URLSession, dataTask, JSON decoder
* @escaping
* AlertItem, AlertContext
* Loading Spinner View (ProgressView - new iOS)
* Color Extension
* Cache Mechanism, get image - network call, image loader helper
* DetailView - navigationLink + navigationDestination / onTapGesture + @State vars
* Form, Sections
* @AppStorage - (UIKIT - UserDefaults) - encode and decode user profile data
* OrderView - swipe to delete
* Empty State for order view
* @@EnvironmentObject
* bage modifier for tabItem
* custom modifiers
* @FocusState, add toolbar item for keyboard
* Async / Await Network calls - @MainActor, Task, .task 
* AsyncImage - no cache
* RegexBuilder
