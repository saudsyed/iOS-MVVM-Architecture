//
//  ViewController.swift
//  Architecture
//
//  Created by Saud Syed on 24/04/2024.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private var viewModel = ViewModel()
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
                } else {
                    strongSelf.label.text = "Is Login: True"
                    if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LogoutVC") as? LogoutVC {
                        vc.viewModel = strongSelf.viewModel
                        strongSelf.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
            .store(in: &cancellables)
    }

    //MARK: - didTapLoginBtn()
    @IBAction func didTapLoginBtn(_ sender: UIButton) {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""

        viewModel.loginServiceApi(email: email, password: password)
    }
}

