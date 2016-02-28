# Question 1 ============================
EventParticipation.delete_all
Event.delete_all
Member.delete_all

alice = Member.create! name: 'Alice'
bob = Member.create! name: 'Bob'
chris = Member.create! name: 'Chris'
dave = Member.create! name: 'Dave'

ruby_study = Event.create! name: 'Ruby勉強会'

ruby_study.members << alice
ruby_study.members << bob
ruby_study.members << chris

chris_participation = EventParticipation.last
chris_participation.update! canceled: true

# Question 2 ============================
Comment.delete_all
Discussion.delete_all

ruby_discussion = Discussion.create! content: 'Rubyの学習方法を教えてください'
java_discussion = Discussion.create! content: 'Javaの学習方法を教えてください'
cobol_discussion = Discussion.create! content: 'COBOLの学習方法を教えてください'

ruby_discussion.comments.create! content: '西脇.rb＆神戸.rbの勉強会がいいですよ'
ruby_discussion.comments.create! content: 'jnchitoさんをフォローするといいですよ'
java_discussion.comments.create! content: 'まずオブジェクト指向プログラミングを勉強しましょう'

