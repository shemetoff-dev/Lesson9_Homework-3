//
//  ViewController.swift
//  Lesson9_Homework_App№3
//
//  Created by Kirill Shemetov on 2.04.25.
//

import UIKit

class ViewController: UIViewController {
    
    var gridSize: Int = 20 // Размер шахматной доски (8x8)
    let squareSize: CGFloat = 100 // Размер одного квадрата
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавляем кнопку
        let button = UIButton(type: .system)
        button.frame = CGRect(x: ( view.frame.width - 150 ) / 2, y: ( view.frame.height - 50 ) / 2, width: 150, height: 50)
        button.setTitle("Tap me!", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(fillGrid), for: .touchUpInside)
        view.addSubview(button)
    }
    
    
    @objc func fillGrid() {
        // Удаляем старые квадраты, если они есть
        for subview in view.subviews {
            if subview is UIView {
                subview.removeFromSuperview()
            }
        }
        
        // Генерируем квадраты
        for row in 0..<gridSize{
            for column in 0..<gridSize {
                let square = UIView(frame: CGRect(x: CGFloat(column) * squareSize, y: CGFloat(row) * squareSize, width: squareSize, height: squareSize))
                square.backgroundColor = randomColor() // Задаём случайный цвет
                view.addSubview(square)
            }
        }
    }
    
    // Функция для генерации случайного цвета
    func randomColor() -> UIColor {
        let red = CGFloat(drand48()) // Случайное значение от 0 до 1 для красного
        let green = CGFloat(drand48()) // Случайное значение от 0 до 1 для зелёного
        let blue = CGFloat(drand48()) // Случайное значение от 0 до 1 для синего
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

