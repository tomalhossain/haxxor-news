module Features
  module CommentHelpers
    def create_comment(comment)
      visit root_url
      click_on("0 comments")
      fill_in("Add a comment", with: comment)
      click_on("Comment")
    end
    def create_reply(reply)
      fill_in("Add a reply", with: reply)
      click_on("Reply")
    end
  end
end


