//
//  FriendsListCellViewModel.swift
//  CUBEInterview
//
//  Created by CheChenLiu on 2025/3/30.
//

import Foundation

class FriendsListCellViewModel {
    var onDataChange: (() -> Void)?
    var onUserInfoDataChange: (() -> Void)?
    var onHeightChange: ((CGFloat, CGFloat, CGFloat) -> Void)?
    
    private(set) var friendListResultsExecptState2ForData: [FriendListResultModel] = []
    private(set) var friendListResultsForData: [FriendListResultModel] = []
    private(set) var allfriendLists: [FriendListResultModel] = [] {
        didSet {
            onDataChange?()
        }
    }
    private(set) var friendListResults: [FriendListResultModel] = [] {
        didSet {
            onDataChange?()
        }
    }
    private(set) var userInfo: UserInfoModel? {
        didSet {
            onUserInfoDataChange?()
        }
    }
    private(set) var friendsUserInfoViewHeight: CGFloat = 114 {
        didSet {
            notifyHeightChange()
        }
    }
    private(set) var friendsListInviteContentViewHeight: CGFloat = 0 {
        didSet {
            notifyHeightChange()
        }
    }
    private(set) var friendsListStateViewHeight: CGFloat = 50 {
        didSet {
            notifyHeightChange()
        }
    }
    private(set) var friendsListInviteContentViewSingleViewIsHidden: Bool = false
    private func notifyHeightChange() {
        onHeightChange?(friendsUserInfoViewHeight, friendsListInviteContentViewHeight, friendsListStateViewHeight)
    }
    
    func updateUserInfoHeight(userInfoHeight: CGFloat) {
        self.friendsUserInfoViewHeight = userInfoHeight
    }
    
    func updateInviteContentHeight(inviteContentHeight: CGFloat) {
        self.friendsListInviteContentViewHeight = inviteContentHeight
    }
    
    func updateStateViewHeight(stateViewHeight: CGFloat) {
        self.friendsListStateViewHeight = stateViewHeight
    }
    
    func setInviteViewHidden(_ isHidden: Bool) {
        self.friendsListInviteContentViewSingleViewIsHidden = isHidden
    }
    
    var formmatedKoKoID: String {
        return "KOKO ID：\(userInfo?.kokoid ?? "設定 KOKO ID")"
    }
    
    private let jsonString = """
    {
      "response": [
        {
          "name": "蔡國泰",
          "kokoid": "Mike"
        }
      ]
    }
    """
    
    func parseUserInfoModel() {
        if let jsonData = jsonString.data(using: .utf8) {
            let decoder = JSONDecoder()
            
            do {
                let decodedResponse = try decoder.decode([String: [UserInfoModel]].self, from: jsonData)
                
                if let userInfo = decodedResponse["response"], let firstUserInfo = userInfo.first {
                    self.userInfo = firstUserInfo
                }
            } catch {
                print("解析 JSON 時發生錯誤: \(error)")
            }
        }
    }
    
    func exceptState2ListResults() {
        var exceptState2Result: [FriendListResultModel] = []
        for index in friendListResultsForData.indices {
            if friendListResultsForData[index].status != 2 {
                exceptState2Result.append(friendListResultsForData[index])
            }
        }
        
        friendListResultsExecptState2ForData = exceptState2Result
        friendListResults = exceptState2Result
    }
    
    var state2NameArray: [String] {
        var stringArray: [String] = []
        for index in friendListResultsForData.indices {
            if friendListResultsForData[index].status == 2 {
                stringArray.append(friendListResultsForData[index].name)
            }
        }
        return stringArray
    }
    
    var state2Amount: Int {
        var count = 0
        for index in friendListResultsForData.indices {
            if friendListResultsForData[index].status == 2 {
                count += 1
            }
        }
        return count
    }
    
    var status2AmountString: String {
        return String(self.state2Amount)
    }
    
    private let request2JsonString = """
    {
      "response": [
        {
          "name": "黃靖僑",
          "status": 0,
          "isTop": "0",
          "fid": "001",
          "updateDate": "20190801"
        },
        {
          "name": "翁勳儀",
          "status": 2,
          "isTop": "1",
          "fid": "002",
          "updateDate": "20190802"
        },
        {
          "name": "洪佳妤",
          "status": 1,
          "isTop": "0",
          "fid": "003",
          "updateDate": "20190804"
        },
        {
          "name": "梁立璇",
          "status": 1,
          "isTop": "0",
          "fid": "004",
          "updateDate": "20190801"
        },
        {
          "name": "梁立璇",
          "status": 1,
          "isTop": "0",
          "fid": "005",
          "updateDate": "20190804"
        }
      ]
    }
    """
    
    private let request3JsonString = """
    {
      "response": [
        {
          "name": "黃靖僑",
          "status": 1,
          "isTop": "0",
          "fid": "001",
          "updateDate": "2019/08/02"
        },
        {
          "name": "翁勳儀",
          "status": 1,
          "isTop": "1",
          "fid": "002",
          "updateDate": "2019/08/01"
        },
        {
          "name": "林宜真",
          "status": 1,
          "isTop": "0",
          "fid": "012",
          "updateDate": "2019/08/01"
        }
      ]
    }
    """
    
    private var request4JsonString = """
    {
      "response": [
        {
          "name": "黃靖僑",
          "status": 0,
          "isTop": "0",
          "fid": "001",
          "updateDate": "20190801"
        },
        {
          "name": "翁勳儀",
          "status": 0,
          "isTop": "1",
          "fid": "002",
          "updateDate": "20190802"
        },
        {
          "name": "洪佳妤",
          "status": 1,
          "isTop": "0",
          "fid": "003",
          "updateDate": "20190804"
        },
        {
          "name": "彭安亭",
          "status": 2,
          "isTop": "0",
          "fid": "007",
          "updateDate": "20190802"
        },
        {
          "name": "施君凌",
          "status": 2,
          "isTop": "0",
          "fid": "008",
          "updateDate": "20190803"
        }
      ]
    }
    """
    
    func parseRequest4Model() {
        print("0401 parseRequest4Model")
        guard let jsonData = request4JsonString.data(using: .utf8) else { return }
        
        let decoder = JSONDecoder()
        
        do {
            let decodedResponse = try decoder.decode([String: [FriendListResultModel]].self, from: jsonData)
            friendListResultsForData = decodedResponse["response"] ?? []
            exceptState2ListResults()
        } catch {
            print("解析 JSON 時發生錯誤: \(error)")
        }
    }
    
    func parseRequestModel() {
        print("0401 parseRequestModel")
        let models2 = parseJSON(jsonString: request2JsonString)
        let models3 = parseJSON(jsonString: request3JsonString)
        
        let mergedModels = mergeFriendsLists(leftHandModel: models2,
                                             rightHandModel: models3)
        
        friendListResultsForData = mergedModels
        allfriendLists = mergedModels
    }
    
    private func parseJSON(jsonString: String) -> [FriendListResultModel] {
        guard let jsonData = jsonString.data(using: .utf8) else { return [] }
        let decoder = JSONDecoder()
        
        do {
            let decodedResponse = try decoder.decode([String: [FriendListResultModel]].self, from: jsonData)
            return decodedResponse["response"] ?? []
        } catch {
            print("解析 JSON 時發生錯誤: \(error)")
            return []
        }
    }
    
    private func mergeFriendsLists(leftHandModel: [FriendListResultModel], rightHandModel: [FriendListResultModel]) -> [FriendListResultModel] {
        var mergedDictionary: [String: FriendListResultModel] = [:]
        
        for model in leftHandModel + rightHandModel {
            if let existedModel = mergedDictionary[model.fid] {
                if let modelDate = parsedUpdateDate(updateDate: model.updateDate),
                   let existedModelDate = parsedUpdateDate(updateDate: existedModel.updateDate),
                   modelDate > existedModelDate {
                    mergedDictionary[model.fid] = model
                }
            } else {
                mergedDictionary[model.fid] = model
            }
        }
        
        let sortFriendsList = mergedDictionary.values.sorted { firstModel, secondModel in
            let firstFid = firstModel.fid
            let secondFid = secondModel.fid
            
            return firstFid < secondFid
        }
        
        return sortFriendsList
    }
    
    
    private func parsedUpdateDate(updateDate: String) -> Date? {
        return DateFormatter.yyyyMMddFormatter.date(from: updateDate) ?? DateFormatter.yyyyMMddSlashFormatter.date(from: updateDate)
    }
    
    func numberOfRows() -> Int {
        if viewState == .onlyFriends {
            return allfriendLists.count
        } else if viewState == .friensWithInvite {
            return friendListResults.count
        } else {
            return 0
        }
    }
    
    func friendAt(indexPath: IndexPath) -> FriendListResultModel? {
        if viewState == .onlyFriends {
            return allfriendLists[indexPath.row]
        } else if viewState == .friensWithInvite {
            return friendListResults[indexPath.row]
        } else {
            return nil
        }
    }
    
    func filterFriendsAtAll(by keyword: String) {
        if keyword.isEmpty {
            allfriendLists = friendListResultsForData
        } else {
            var result: [FriendListResultModel] = []
            
            for friend in friendListResultsForData {
                if friend.name.contains(keyword) {
                    result.append(friend)
                }
            }
            allfriendLists = result
        }
    }
    
    func filterFriendsAtExceptState2(by keyword: String) {
        if keyword.isEmpty {
            friendListResults = friendListResultsExecptState2ForData
        } else {
            var result: [FriendListResultModel] = []
            
            for friend in friendListResultsExecptState2ForData {
                if friend.name.contains(keyword) {
                    result.append(friend)
                }
            }
            friendListResults = result
        }
    }
}
