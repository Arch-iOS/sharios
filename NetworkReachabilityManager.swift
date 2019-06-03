import Foundation

extension Notification {
    static let notReachable = Notification(name: Notification.Name(rawValue: "notReachable"))
    static let reachableViaWifi = Notification(name: Notification.Name(rawValue: "reachableViaWifi"))
    static let reachableViaWWan = Notification(name: Notification.Name(rawValue: "reachableViaWWan"))
}

protocol NetworkReachabilityManager {
    func applicationDidBecomeActive()
    func applicationWillResignActive()
}

public class NetworkReachabilityManagerImpl: NetworkReachabilityManager {

    private let reachability = Reachability()!

    func applicationDidBecomeActive() {
        registerListener()
    }
    
    func applicationWillResignActive() {
        unregisterListener()
    }
    
    private func registerListener() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reachabilityChanged),
                                               name: .reachabilityChanged,
                                               object: reachability)
        do {
            try reachability.startNotifier()
        } catch {}
    }

    private func unregisterListener() {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: .reachabilityChanged,
                                                  object: reachability)
    }

    @objc
    func reachabilityChanged() {
        if reachability.connection != .none {
            if reachability.connection == .wifi {
                NotificationCenter.default.post(.notReachable)
            } else {
                NotificationCenter.default.post(.reachableViaWWan)
            }
        } else {
            NotificationCenter.default.post(.notReachable)
        }
    }
}
