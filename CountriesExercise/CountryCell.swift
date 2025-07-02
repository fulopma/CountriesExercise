//
//  CountryCell.swift
//  CountriesExercise
//
//  Created by Marcell Fulop on 7/1/25.
//
import UIKit

class CountryCell: UITableViewCell {
    private let nameRegionLabel = {
        let nameRegionLabel = UILabel()
        nameRegionLabel.translatesAutoresizingMaskIntoConstraints = false
        nameRegionLabel.numberOfLines = 0
        nameRegionLabel.lineBreakMode = .byWordWrapping
        nameRegionLabel.font = .systemFont(ofSize: 17)
        return nameRegionLabel
    }()
    private let codeLabel = {
        let codeLabel = UILabel()
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.font = .systemFont(ofSize: 17)
        codeLabel.textAlignment = .right
        return codeLabel
    }()
    private let capitalLabel = {
        let capitalLabel = UILabel()
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.font = .systemFont(ofSize: 17)
        return capitalLabel
    }()
    func configure(name: String, region: String, code: String, capital: String){
        nameRegionLabel.text = "\(name), \(region)"
        codeLabel.text = code
        capitalLabel.text = capital
        contentView.addSubview(nameRegionLabel)
        contentView.addSubview(codeLabel)
        contentView.addSubview(capitalLabel)
        NSLayoutConstraint.activate([
            nameRegionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameRegionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            codeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            capitalLabel.topAnchor.constraint(equalTo: nameRegionLabel.bottomAnchor, constant: 10),
            capitalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            capitalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            codeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            codeLabel.widthAnchor.constraint(equalToConstant: 35),
            codeLabel.leadingAnchor.constraint(equalTo: nameRegionLabel.trailingAnchor)
            ])
        codeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
}
