//
//  UIView+ActivityIndicator.swift
//  SalwatTimes
//
//  Created by Yousef Mohamed on 03/07/2022.
//

import UIKit

private let overlayViewTag: Int = 999
private let activityIndicatorViewTag: Int = 1000
private let labelMessageViewTag: Int = 998

// Public interface
extension UIView {

    var setActivityIndicator: Bool {
        get {
            return isDisplayingActivityIndicatorOverlay()
        }
        set {
            switch newValue {
            case true:
                displayAnimatedActivityIndicatorView()
            case false:
                hideAnimatedActivityIndicatorView()
            }
        }
    }

    func displayAnimatedActivityIndicatorView() {
        setActivityIndicatorView()
    }

    func hideAnimatedActivityIndicatorView() {
        removeActivityIndicatorView()
    }


}

// Private interface
extension UIView {

    private var activityIndicatorView: UIActivityIndicatorView {
        let view: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .darkGray
        view.tag = activityIndicatorViewTag
        return view
    }

    private var overlayView: UIView {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.75
        view.tag = overlayViewTag
        return view
    }


    private func setActivityIndicatorView() {
        guard !isDisplayingActivityIndicatorOverlay() else { return }
        let overlayView: UIView = self.overlayView
        let activityIndicatorView: UIActivityIndicatorView = self.activityIndicatorView

        // add subviews
        overlayView.addSubview(activityIndicatorView)
        addSubview(overlayView)

        insertSubview(overlayView, at: subviews.count)
        // add overlay constraints
        overlayView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        overlayView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

        activityIndicatorView.alpha = 1

        // add indicator constraints
        activityIndicatorView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true


        // animate indicator
        activityIndicatorView.startAnimating()
        // overlayView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
    }

    private func removeActivityIndicatorView() {
        guard let overlayView: UIView = getOverlayView(), let activityIndicator: UIActivityIndicatorView = getActivityIndicatorView() else {
            return
        }
        UIView.animate(withDuration: 0.2, animations: {
            overlayView.alpha = 0.0
            activityIndicator.stopAnimating()
        }, completion: { _ in
            activityIndicator.removeFromSuperview()
            overlayView.removeFromSuperview()
        })
    }

    private func isDisplayingActivityIndicatorOverlay() -> Bool {
        getActivityIndicatorView() != nil && getOverlayView() != nil
    }

    private func getActivityIndicatorView() -> UIActivityIndicatorView? {
        viewWithTag(activityIndicatorViewTag) as? UIActivityIndicatorView
    }

    private func getOverlayView() -> UIView? {
        viewWithTag(overlayViewTag)
    }
    private func getLabelMessageView() -> UILabel? {
        viewWithTag(labelMessageViewTag) as? UILabel
    }
}
