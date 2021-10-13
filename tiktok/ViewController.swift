//
//  ViewController.swift
//  tiktok
//
//  Created by user on 13.10.2021.
//

import SnapKit
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView = UITableView()
    private var videoLinks: [String] = ["http://baobab.wdjcdn.com/14525705791193.mp4",
                                            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                                            "https://www.youtube.com/watch?v=zJODMh2cULg",
                                            "https://www.youtube.com/watch?v=zJODMh2cULg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {marker in  marker.edges.equalToSuperview()}
        
        let blackView = UIView()
        blackView.backgroundColor = .black
        
        view.addSubview(blackView)
        blackView.snp.makeConstraints{marker in
            marker.left.right.bottom.equalToSuperview()
            marker.height.equalTo(80)
        }
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(systemName: "location.fill"), for: .normal)
        
        let btn2 = UIButton()
        btn2.setImage(UIImage(systemName: "moon.stars"), for: .normal)
        
        stackView.addArrangedSubview(btn1)
        stackView.addArrangedSubview(btn2)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints{marker in
            marker.left.right.bottom.equalToSuperview().inset(30)
            marker.height.equalTo(60)
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoLinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return VideoTableViewCell(link: videoLinks[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }

}

