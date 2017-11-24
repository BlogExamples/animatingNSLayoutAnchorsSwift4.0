//
//  ViewController.swift
//  AnimatingNSLayoutAnchorConstraints4.0
//
//  Created by JoshuaKuehn on 11/23/17.
//  Copyright © 2017 JoshuaKuehn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // Initialized view we want to animate
  let viewToAnimate = UIView(frame: .zero)
  
  var activeViewConstraints: [NSLayoutConstraint] = [] {
    willSet {
      NSLayoutConstraint.deactivate(activeViewConstraints)
    }
    didSet {
      NSLayoutConstraint.activate(activeViewConstraints)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Add to the view hierarchy
    self.view.addSubview(viewToAnimate)
    
    viewToAnimate.backgroundColor = .red
    
    viewToAnimate.translatesAutoresizingMaskIntoConstraints = false
    viewToAnimate.heightAnchor.constraint(equalToConstant: 200).isActive = true
    viewToAnimate.widthAnchor.constraint(equalToConstant: 200).isActive = true
    
    activeViewConstraints = [
      viewToAnimate.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      viewToAnimate.topAnchor.constraint(equalTo: self.view.bottomAnchor)
    ]
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  @IBAction func bottomLeftButtonTapped(_ sender: Any) {
    activeViewConstraints = [
      viewToAnimate.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      viewToAnimate.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ]
    
    UIView.animate(withDuration: 0.33) {
      self.view.layoutIfNeeded()
    }
  }
  
  @IBAction func centerButtonTapped(_ sender: Any) {
    activeViewConstraints = [
      viewToAnimate.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      viewToAnimate.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ]
    
    UIView.animate(withDuration: 0.33) {
      self.view.layoutIfNeeded()
    }
  }
  
  @IBAction func bottomRightButtonTapped(_ sender: Any) {
    activeViewConstraints = [
      viewToAnimate.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      viewToAnimate.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ]
    
    UIView.animate(withDuration: 0.33) {
      self.view.layoutIfNeeded()
    }
  }
  
}

