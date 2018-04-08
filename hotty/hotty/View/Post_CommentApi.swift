//
//
//import Foundation
//import FirebaseDatabase
//class Post_CommentApi {
// var REF_POST_COMMENTS = Database.database().reference().child("post-comments")
//    
//    
//    func observeComments(withPostId id: String, completion: @escaping (Post_Comment) -> Void) {
//        REF_POST_COMMENTS.child(id).observeSingleEvent(of: .value, with: {
//            snapshot in
//            if let dict = snapshot.value as? [String: Any] {
//                let newComment = Post_Comment.transformComment(dict: dict)
//                completion(newComment)
//            }
//        })
//    }
//    
//}
// 
//
