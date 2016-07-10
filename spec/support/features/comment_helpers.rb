module Features
  module CommentHelpers
    def create_comment(comment)
      visit root_url
      click_on("0 comments")
      fill_in("Add a comment", with: comment)
      click_on("Comment")
    end
    def create_reply(reply)
      comment = "This is a comment"
      create_comment(comment)
      fill_in("Add a reply", with: reply)
      save_and_open_page
      click_on("Reply")
    end
  end
end


