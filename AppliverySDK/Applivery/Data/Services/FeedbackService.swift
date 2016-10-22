//
//  FeedbackService.swift
//  AppliverySDK
//
//  Created by Alejandro Jiménez on 13/3/16.
//  Copyright © 2016 Applivery S.L. All rights reserved.
//

import Foundation


enum FeedbackServiceResult {
	case success
	case error(NSError)
}


protocol PFeedbackService {
	func postFeedback(_ feedback: Feedback, completionHandler: @escaping (FeedbackServiceResult) -> Void)
}

class FeedbackService: PFeedbackService {
	
	let app: AppProtocol
	let config: GlobalConfig
	var request: Request?

	init(app: AppProtocol, config: GlobalConfig) {
		self.app = app
		self.config = config
	}
	
	func postFeedback(_ feedback: Feedback, completionHandler: @escaping (FeedbackServiceResult) -> Void) {
		let screenshot = feedback.screenshot?.base64() ?? ""

		self.request = Request(
			endpoint: "/api/feedback",
			method: "POST",
			bodyParams: [
				"app": config.appId ,
				"type": feedback.feedbackType.rawValue,
				"message": feedback.message,
				"packageInfo": [
					"name": app.bundleId(),
					"version": app.getVersion(),
					"versionName": app.getVersionName()
				],
				"deviceInfo": [
					"device": [
						"model": UIDevice.current.modelName,
						"vendor": "Apple",
						"type": UIDevice.current.model
						// id
						// battery
						// batteryStatus
						// network
						// resolution
						// ramFree
						// diskFree
						// orientation
					],
					"os": [
						"name": "iOS",
						"version": UIDevice.current.systemVersion
					]
				],
				"screenshot": screenshot
			]
		)

		self.request?.sendAsync { response in
			if response.success {
				completionHandler(.success)
			} else {
				LogError(response.error)
				completionHandler(.error(NSError.UnexpectedError()))
			}
		}
	}

}
