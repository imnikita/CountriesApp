//
//  UIView+Ext.swift
//  CountriesApp
//
//  Created by Nikita Popov on 25.04.2021.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    func showLoadingView() {
        containerView = UIView.init(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.85
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerInSuperview()
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
}
