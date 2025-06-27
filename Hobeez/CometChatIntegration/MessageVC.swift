import UIKit
import CometChatSDK
import CometChatUIKitSwift

class MessagesVC: UIViewController {
    
    var user: User?
    var group: Group?
    
    private lazy var headerView: CometChatMessageHeader = {
        let view = CometChatMessageHeader()
        view.translatesAutoresizingMaskIntoConstraints = false
        if let user = user {
            view.set(user: user)
        } else if let group = group {
            view.set(group: group)
        }
        view.set(controller: self)
        return view
    }()
    
    private lazy var composerView: CometChatMessageComposer = {
        let composer = CometChatMessageComposer()
        composer.translatesAutoresizingMaskIntoConstraints = false
        if let user = user {
            composer.set(user: user)
        } else if let group = group {
            composer.set(group: group)
        }
        composer.set(controller: self)
        return composer
    }()
    
    private lazy var messageListView: CometChatMessageList = {
        let listView = CometChatMessageList()
        listView.translatesAutoresizingMaskIntoConstraints = false
        if let user = user {
            listView.set(user: user)
        } else if let group = group {
            listView.set(group: group)
        }
        listView.set(controller: self)
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupLayout() {
        [headerView, messageListView, composerView].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            messageListView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            messageListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageListView.bottomAnchor.constraint(equalTo: composerView.topAnchor),
            
            composerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            composerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            composerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
