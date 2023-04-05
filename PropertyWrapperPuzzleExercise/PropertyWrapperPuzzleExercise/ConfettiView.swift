//
//  ConfettiView.swift
//  PropertyWrapperExercise
//
//  Created by Gerson Janhuel on 05/04/23.
//

import SwiftUI

struct ConfettiView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        // Create the emitter layer
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: 150, y: -50)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterSize = CGSize(width: 300, height: 1)
        emitterLayer.renderMode = .unordered
        
        // Create the confetti particle
        let confetti = CAEmitterCell()
        confetti.birthRate = 5
        confetti.lifetime = 5.0
        confetti.lifetimeRange = 0
        confetti.color = UIColor(red: 11, green: 11, blue: 11, alpha: 0.7).cgColor
        confetti.contents = UIImage(systemName: "star")?.cgImage
        confetti.velocity = 200.0
        confetti.velocityRange = 10.0
        confetti.emissionLongitude = CGFloat.pi
        confetti.emissionRange = CGFloat.pi / 6
        confetti.spin = 0
        confetti.spinRange = 0
        
        // Add the confetti particle to the emitter layer
        emitterLayer.emitterCells = [confetti]
        
        // Add the emitter layer to the view
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
