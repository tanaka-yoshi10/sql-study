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

