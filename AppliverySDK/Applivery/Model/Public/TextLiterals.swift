//
//  TextLiterals.swift
//  AppliverySDK
//
//  Created by Alejandro Jiménez Agudo on 26/3/17.
//  Copyright © 2017 Applivery S.L. All rights reserved.
//

import Foundation

public class TextLiterals: NSObject {
	
	public var appName: String = localize("sdk_name")
	
	// MARK: - OTA Update
	public var otaUpdateMessage: String?
	public var alertButtonLater: String = localize("alert_button_later")
	public var alertButtonUpdate: String = localize("alert_button_update")
	
	// MARK: - Force Update
	public var forceUpdateMessage: String?
	public var buttonForceUpdate: String = localize("update_view_button_update")
	
	// MARK: - Feedback
	public var feedbackButtonClose: String = localize("feedback_button_close")
	public var feedbackButtonAdd: String = localize("feedback_button_add")
	public var feedbackButtonSend: String = localize("feedback_button_send")
	public var feedbackSelectType: String = localize("feedback_label_select_type")
	public var feedbackTypeBug: String = localize("feedback_button_bug")
	public var feedbackTypeFeedback: String = localize("feedback_button_feedback")
	public var feedbackMessagePlaceholder: String = localize("feedback_text_message_placeholder")
	public var feedbackAttach: String = localize("feedback_label_attach")
}

enum Literal: CustomStringConvertible {
	case appName
	case otaUpdateMessage
	case alertButtonLater
	case alertButtonUpdate
	case forceUpdateMessage
	case buttonForceUpdate
	case feedbackButtonClose
	case feedbackButtonAdd
	case feedbackButtonSend
	case feedbackSelectType
	case feedbackTypeBug
	case feedbackTypeFeedback
	case feedbackMessagePlaceholder
	case feedbackAttach
	
	var description: String {
		return literal(self) ?? String(self.hashValue)
	}
}

//swiftlint:disable cyclomatic_complexity
func literal(_ literal: Literal) -> String? {
	let literals = GlobalConfig.shared.textLiterals
	
	switch literal {
	case .appName: return literals.appName
	case .otaUpdateMessage: return literals.otaUpdateMessage
	case .alertButtonLater: return literals.alertButtonLater
	case .alertButtonUpdate: return literals.alertButtonUpdate
	case .forceUpdateMessage: return literals.forceUpdateMessage
	case .buttonForceUpdate: return literals.buttonForceUpdate
	case .feedbackButtonClose: return literals.feedbackButtonClose
	case .feedbackButtonAdd: return literals.feedbackButtonAdd
	case .feedbackButtonSend: return literals.feedbackButtonSend
	case .feedbackSelectType: return literals.feedbackSelectType
	case .feedbackTypeBug: return literals.feedbackTypeBug
	case .feedbackTypeFeedback: return literals.feedbackTypeFeedback
	case .feedbackMessagePlaceholder: return literals.feedbackMessagePlaceholder
	case .feedbackAttach: return literals.feedbackAttach
	}
}
//swiftlint:enable cyclomatic_complexity
