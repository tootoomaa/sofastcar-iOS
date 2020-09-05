//
//  SearchView.swift
//  sofastcar
//
//  Created by Woobin Cheon on 2020/09/04.
//  Copyright © 2020 김광수. All rights reserved.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    let backButton = UIButton()
    let stackView = UIStackView()
    let shadowContainer = UIView()
    let searchController = UISearchController(searchResultsController: nil)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        // MARK: - Setup UI
    private func setupUI() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        
        backButton.backgroundColor = .white
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        stackView.addArrangedSubview(backButton)

        searchController.searchBar.barTintColor = .white
        searchController.searchBar.placeholder = "주소 또는 건물명 검색"
//        searchController.searchBar.barStyle = .default
//        searchController.searchBar.showsCancelButton = true
        searchController.searchBar.searchTextField.clearButtonMode = .whileEditing
        searchController.searchBar.searchBarStyle = .prominent
        stackView.addArrangedSubview(searchController.searchBar)
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        shadowContainer.addSubview(stackView)
        
//        shadowContainer.layer.cornerRadius = 5
        shadowContainer.clipsToBounds = true
        self.addSubview(shadowContainer)
    }
    
    // MARK: - Setup Constraint
    private func setupConstraint() {
        shadowContainer.translatesAutoresizingMaskIntoConstraints = false
        shadowContainer.snp.makeConstraints({
            $0.top.equalTo(self)
            $0.leading.equalTo(self)
            $0.trailing.equalTo(self)
//            $0.height.equalTo(self)
        })
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        })
        
//        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
//        searchController.searchBar.snp.makeConstraints({
//            $0.width.equalToSuperview().multipliedBy(0.9)
//        })
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.snp.makeConstraints({
            $0.width.equalTo(52)
        })
    }
    
}
