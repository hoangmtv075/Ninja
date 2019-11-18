//
//  HUD.swift
//  NInja
//
//  Created by Jack Ily on 13/11/2019.
//  Copyright © 2019 Jack Ily. All rights reserved.
//

import SpriteKit

enum HUDSettings {
    static let score = "Score"
    static let highscore = "Highscore"
    static let tapToStart = "Tap To Start"
    static let gameOver = "Game Over"
}

class HUD: SKNode {
    
    var scoreLbl: SKLabelNode!
    var highscoreLbl: SKLabelNode!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel(_ name: String, text: String, fontSize: CGFloat, pos: CGPoint) {
        let label = SKLabelNode()
        label.fontName = fontNamed
        label.name = name
        label.text = text
        label.fontSize = fontSize
        label.position = pos
        label.zPosition = 50.0
        addChild(label)
    }
    
    func setupScoreLbl(_ score: Int) {
        guard let scene = scene as? GameScene else { return }
        let pos = CGPoint(x: 30.0, y: scene.playableRect.maxY - 30.0)
        addLabel(HUDSettings.score, text: "Score: \(score)", fontSize: 70.0, pos: pos)
        scoreLbl = childNode(withName: HUDSettings.score) as? SKLabelNode
        scoreLbl.horizontalAlignmentMode = .left
        scoreLbl.verticalAlignmentMode = .top
    }
    
    func setupHighscoreLbl(_ highscore: Int) {
        guard let scene = scene as? GameScene else { return }
        let pos = CGPoint(x: scene.playableRect.maxX - 30.0, y: scene.playableRect.maxY - 30.0)
        addLabel(HUDSettings.highscore, text: "Highscore: \(highscore)", fontSize: 70.0, pos: pos)
        highscoreLbl = childNode(withName: HUDSettings.highscore) as? SKLabelNode
        highscoreLbl.horizontalAlignmentMode = .right
        highscoreLbl.verticalAlignmentMode = .top
    }
    
    func addLbl(fontSize: CGFloat, name: String, text: String) {
        guard let scene = scene as? GameScene else { return }
        let pos = CGPoint(x: scene.playableRect.width/2.0,
                          y: scene.playableRect.height/2.0 + 400.0)
        addLabel(name, text: text, fontSize: fontSize, pos: pos)
    }
    
    func setupGameState(from: GameState, to: GameState) {
        clearUI(gameState: from)
        updateUI(gameState: to)
    }
    
    func updateUI(gameState: GameState) {
        switch gameState {
        case .start:
            addLbl(fontSize: 150.0, name: HUDSettings.tapToStart, text: HUDSettings.tapToStart)
        case .dead:
            addLbl(fontSize: 200.0, name: HUDSettings.gameOver, text: HUDSettings.gameOver)
        default: break
        }
    }
    
    func clearUI(gameState: GameState) {
        switch gameState {
        case .start:
            childNode(withName: HUDSettings.tapToStart)?.removeFromParent()
        case .dead:
            childNode(withName: HUDSettings.gameOver)?.removeFromParent()
        default: break
        }
    }
}
