module Features
  module VoteHelpers
    def vote_setup (user, post)
      build_params = { title: post.title, url: post.url }
      built_post = user.posts.build(build_params)
      built_post.save
      login(user)
      visit(root_url)
    end
  end
end