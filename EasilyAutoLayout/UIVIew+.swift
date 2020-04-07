//
//  UIVIew+.swift
//  Notification App
//
//  Created by Rintaro Kawagishi on 04/01/2020.
//  Copyright © 2020 Rintaro Kawagishi. All rights reserved.
//

import UIKit

public enum ViewDimensionReletivity {
    case lessThanOrEqualTo
    case greaterThanOrEqualTo
    case equalTo
}

public enum UIViewDimension {
    case width
    case height
}

private extension UIView {
    /// set translatesAutoresizingMaskIntoConstraints to false
    func setupForAutoLayout() {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

// MARK: Set dimensions (width/height)
public extension UIView {
    /// Set a dimension of this view idth to a constant
    func set(_ dimension: UIViewDimension, _ relativity: ViewDimensionReletivity, _ value: CGFloat) {
        setupForAutoLayout()
        
        var dim: NSLayoutDimension
        switch dimension {
        case .width:
            dim = self.widthAnchor
        case .height:
            dim = self.heightAnchor
        }
        
        switch relativity {
        case .equalTo:
            dim.constraint(equalToConstant: value).isActive = true
        case .lessThanOrEqualTo:
            dim.constraint(lessThanOrEqualToConstant: value).isActive = true
        case .greaterThanOrEqualTo:
            dim.constraint(greaterThanOrEqualToConstant: value).isActive = true
        }
    }
    
    /// Set a dimension of this view  based on anonther dimension
    func set(_ dimension: UIViewDimension, _ relativity: ViewDimensionReletivity, _ goalDimension: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
        setupForAutoLayout()
        
        var dim: NSLayoutDimension
        switch dimension {
        case .width:
            dim = self.widthAnchor
        case .height:
            dim = self.heightAnchor
        }
        
        switch relativity {
        case .equalTo:
            dim.constraint(equalTo: goalDimension, multiplier: multiplier, constant: constant).isActive = true
        case .lessThanOrEqualTo:
            dim.constraint(lessThanOrEqualTo: goalDimension, multiplier: multiplier, constant: constant).isActive = true
        case .greaterThanOrEqualTo:
            dim.constraint(greaterThanOrEqualTo: goalDimension, multiplier: multiplier, constant: constant).isActive = true
        }
    }
}

// MARK:  Location of the view inside another view
public extension UIView {
    /// Constrain to the top anchor of the safe area layout guide of a specified view.
    func constrainToTopSafeAreaOf(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
    }
    
    /// Constrain to the top anchor a specified view.
    func constrainToTopAnchor(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: padding).isActive = true
    }
    
    /// Constrain to the bottom anchor of the safe area layout guide of a specified view.
    func constrainToBottomSafeAreaOf(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding).isActive = true
    }
    
    /// Constrain to the bottom anchor a specified view.
    func constrainToBottomAnchorOf(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
    }
    
    /// Constrain to the leading anchor of the safe area layout guide of a specified view.
    func constrainToLeadingSafeAreaOf(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
    }
    
    /// Constrain to the trailing anchor of the safe area layout guide of a specified view.
    func constrainToTrailingSafeAreaOf(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
    }
    
    /// Constrain to the leading and trailing anchors of the safe area layout guide of a specified view.
    func constrainToSideSafeAreasOf(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        constrainToLeadingSafeAreaOf(view, padding: padding)
        constrainToTrailingSafeAreaOf(view, padding: padding)
    }
    
    /// Align horizontally with a specified view
    func alignToCenterXOf(_ view: UIView) {
        setupForAutoLayout()
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    /// Align vertically with a specified view
    func alignToCenterYOf(_ view: UIView) {
        setupForAutoLayout()
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

// MARK:  Location of the view relative to & outside another view
public extension UIView {
    /// Place this view below a specified view
    func isBelow(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: padding).isActive = true
    }
    
    /// Place this view below a specified Y axis anchor
    func isBelow(_ anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.topAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }
    
    /// Place this view above a specified view
    func isAbove(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -padding).isActive = true
    }
    
    /// Place this view above a specified Y axis anchor
    func isAbove(_ anchor: NSLayoutYAxisAnchor, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.bottomAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
    }
    
    /// Place this view to the trailing side of a specified view
    func isToTheTrailingSideOf(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding).isActive = true
    }
    
    /// Place this view to the trailing side of a specified view
    func isToTheTrailingSideOf(_ anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.leadingAnchor.constraint(equalTo: anchor, constant: padding).isActive = true
    }
    
    /// Place this view to the leading side of a specified view
    func isToTheLeadingSideOf(_ view: UIView, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -padding).isActive = true
    }
    
    /// Place this view to the leading side of a specified view
    func isToTheLeadingSideOf(_ anchor: NSLayoutXAxisAnchor, padding: CGFloat = 0.0) {
        setupForAutoLayout()
        self.trailingAnchor.constraint(equalTo: anchor, constant: -padding).isActive = true
    }
    
    /// Align this view's top anchor with another view's top anchor
    /// - Parameters:
    ///   - offSet: this is positive if this view's top anchor is below the specified view's top anchor, negative if it is above.
    func alignTopAnchorWith(_ view: UIView, offset: CGFloat = 0.0) {
        setupForAutoLayout()
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: offset).isActive = true
    }
    
    /// Align this view's bottom anchor with another view's bottom anchor
    /// - Parameters:
    ///   - offSet: this is positive if this view's bottom anchor is below the specified view's bottom anchor, negative if it is above.
    func alignBottomAnchorWith(_ view: UIView, offset: CGFloat = 0.0) {
        setupForAutoLayout()
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: offset).isActive = true
    }
}
