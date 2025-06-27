import CometChatSDK
import Combine

class GroupViewModel: ObservableObject {
    @Published var groups: [Group] = []

    func fetchGroups() {
        let request = GroupsRequest.GroupsRequestBuilder(limit: 30)
            .build()

        request.fetchNext(onSuccess: { [weak self] groups in
            DispatchQueue.main.async {
                self?.groups = groups
            }
        }, onError: { error in
            print("Group fetch error: \(error?.errorDescription ?? "technical issue")")
        })
    }
}
