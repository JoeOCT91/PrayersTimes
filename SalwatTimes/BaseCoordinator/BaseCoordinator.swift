//
//  BaseCoordinator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 25/06/2022.
//


import Foundation
import Combine

protocol Coordinator: AnyObject {
    func start()
}

class BaseCoordinator: Coordinator {
    
    var subscriptions = Set<AnyCancellable>()
    var childCoordinators: [Coordinator] = []
    
    func start() {
    }
    
    // add only unique object
    func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
        else { return }
        
        // Clear child-coordinators recursively
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeDependency($0) })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
