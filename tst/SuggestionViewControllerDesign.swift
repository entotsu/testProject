//
//  SuggestionViewDesign.swift
//  tst
//
//  Created by Takuya Okamoto on 2015/09/10.
//  Copyright © 2015年 Uniface. All rights reserved.
//

import UIKit

protocol SuggestionViewControllerDesign {}
extension SuggestionViewControllerDesign where Self: UIViewController  {
    func addSubviews() -> (UIButton, UIButton) {

        let refreshButton = UIButton()
        refreshButton.frame = CGRect(x: 44, y: 44, width: 64, height: 44)
        refreshButton.setTitle("refresh", forState: .Normal)
        refreshButton.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.2)
        view.addSubview(refreshButton)

        let testButton = UIButton()
        testButton.frame = CGRect(x: 44 + 64 + 10, y: 44, width: 64, height: 44)
        testButton.setTitle("test", forState: .Normal)
        testButton.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.2)
        view.addSubview(testButton)
        
        return (refreshButton, testButton)
    }
    
    func addSuggestionView(suggestArticles:[QiitaArticle]) -> SuggestionView {
        let headerMargin: CGFloat = 100
        var suggestionViewFrame = self.view.frame
        suggestionViewFrame.y = headerMargin
        suggestionViewFrame.height -= headerMargin
        let suggestionView = SuggestionView(frame: suggestionViewFrame, articles: suggestArticles)
        self.view.addSubview(suggestionView)
        return suggestionView
    }
}