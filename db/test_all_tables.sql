-- JBV | Select a short sample of each created table to make sure all fields were effectively and 
--     | correctly populated because... The 'seeds.rb' file somehow "forget" to update some values 
--     | withour raising any error when not possible to make the update... Very useful / nicely built!
select first_name, last_name, nickname, email, birthdate, age, is_adult, is_admin from users limit 20;
select * from gossips limit 20;
select * from cities limit 20;
select * from tags;
select * from comments limit 10;
select * from private_messages limit 20;
select * from gossip_tags limit 10;
select * from likes limit 10;

-- JBV | End of script