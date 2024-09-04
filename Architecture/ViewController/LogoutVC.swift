//
//  LogoutVC.swift
//  Architecture
//
//  Created by Saud Syed on 26/04/2024.
//

import UIKit
import Combine

class LogoutVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var viewModel = ViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }

    //MARK: - setupBindings()
    private func setupBindings() {
        viewModel.$isLogin
            .receive(on: DispatchQueue.main)
            .sink { [weak self] Bool in
                guard let strongSelf = self else { return }
                if !Bool {
                    strongSelf.label.text = "Is Login: False"
                    strongSelf.navigationController?.popViewController(animated: true)
                } else {
                    strongSelf.label.text = "Is Login: True"
                }
            }
            .store(in: &cancellables)
    }
    
    //MARK: - didTapLogoutBtn()
    @IBAction func didTapLogoutBtn(_ sender: UIButton) {
        viewModel.logoutServiceApi()
    }
}
