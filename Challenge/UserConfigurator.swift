//
//  UserConfigurator.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation

extension UserInteractor: UserViewOutput {
}
extension UserPresenter: UserInteractorOutput {}
extension UserViewController: UserPresenterOutput {}

class UserConfigurator {
	static let sharedInstance = UserConfigurator()
	private init() {}
	
	func configure(viewController: UserViewController) {
		self.configureUserInteraction(viewController: viewController)
	}
	
	private func configureUserInteraction(viewController: UserViewController) {
		// Routing
		let router = UserRouter()
		router.viewController = viewController
		viewController.router = router
		// Presenter
		let presenter = UserPresenter()
		presenter.output = viewController
		// Interactor
		let interactor = UserInteractor()
        interactor.managerAPIProvider = Manager.shared
		interactor.output = presenter
		// View
		viewController.output = interactor
	}
}
