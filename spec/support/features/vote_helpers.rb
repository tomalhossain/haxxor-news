module Features
  module VoteHelpers
    def vote_setup (user, post)
      built_post = user.posts.build({ title: post.title, url: post.url })
      built_post.save
      login(user)
      visit(root_url)
    end
  end
end