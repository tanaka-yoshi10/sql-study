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

# Question 3 ============================
Task.delete_all
Project.delete_all

cobol_project = Project.create! name: 'COBOL読書会', note: '全タスクが過去'
party_project = Project.create! name: '新人歓迎会', note: '全タスクが未来'
mountain_project = Project.create! name: '山登り', note: '過去と未来のタスクが混在'
elixir_project = Project.create! name: 'Elixir勉強会', note: 'タスクなし'

cobol_project.tasks.create! content: '本を選ぶ', due_date: '2000-04-01'
party_project.tasks.create! content: '参加者を募る', due_date: '2026-03-01'
party_project.tasks.create! content: 'お店の候補を考える', due_date: '2026-03-10' # 表示
mountain_project.tasks.create! content: '参加者を募る', due_date: '2000-04-01'
mountain_project.tasks.create! content: '予算を決める', due_date: '2026-02-01' # 表示

# Question 4 ============================
DepositTransaction.delete_all

DepositTransaction.create! occurred_on: '2016/01/01', amount: 5000
DepositTransaction.create! occurred_on: '2016/02/01', amount: -3000
DepositTransaction.create! occurred_on: '2016/02/11', amount: 1000
DepositTransaction.create! occurred_on: '2016/03/01', amount: 2000
DepositTransaction.create! occurred_on: '2016/03/01', amount: -3000
DepositTransaction.create! occurred_on: '2016/03/02', amount: 8000
DepositTransaction.create! occurred_on: '2016/03/05', amount: -2000
DepositTransaction.create! occurred_on: '2016/03/05', amount: -1000
DepositTransaction.create! occurred_on: '2016/03/06', amount: 2000
DepositTransaction.create! occurred_on: '2016/03/06', amount: 5000
DepositTransaction.create! occurred_on: '2016/03/06', amount: -4000

# Question 5 ============================
Purchasing.delete_all
Book.delete_all

ruby_book = Book.create! title: 'Ruby入門'
cobol_book = Book.create! title: '応用COBOL'
ada_book = Book.create! title: 'はじめてのAda'

ruby_book.purchasings.create! age: 15
ruby_book.purchasings.create! age: 18
ruby_book.purchasings.create! age: 20
ruby_book.purchasings.create! age: 38
ruby_book.purchasings.create! age: 43
ruby_book.purchasings.create! age: 49
cobol_book.purchasings.create! age: 25
