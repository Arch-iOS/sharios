# Sharios
Shared code through iOS projects

### NetworkReachabilityNotifier.swift && Reachability.swift
 NetworkReachabilityNotifier notify when network status changed. You need to instanciate it in your AppDelegate `didLaunch` method.&nbsp;
  
 You need to call `applicationDidBecomeActive` method on your instance in AppDelegate `applicationDidBecomeActive` method as the `applicationWillResignActive`.&nbsp;
  
 If you want to do dynamic operations within your app on network status changes, you need to add observers on related notifications
 
 ### Observable.swift
 Simple type to have observable properties in your viewModels.
