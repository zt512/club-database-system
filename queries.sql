-- Number of members per club
SELECT club_name, COUNT(student_id) AS total_members
FROM Club c
JOIN Membership m ON c.club_id = m.club_id
GROUP BY club_name;

-- Student payments
SELECT s.first_name, s.last_name, c.club_name, m.fee_date
FROM Student s
JOIN Membership m ON s.student_id = m.student_id
JOIN Club c ON m.club_id = c.club_id
WHERE m.fee_date IS NOT NULL;

-- Student attendance for clubs
SELECT s.first_name, s.last_name, COUNT(a.attendance_id) AS attendance_count
FROM Student s
JOIN Attendance a ON s.student_id = a.student_id
GROUP BY s.first_name, s.last_name;

-- Event feedback
SELECT e.event_detail, AVG(a.score_rating) AS average_rating
FROM Event e
JOIN Attendance a ON e.event_id = a.event_id
GROUP BY e.event_detail
ORDER BY average_rating DESC;

-- Revenue earned per club from membership
SELECT c.club_name, COUNT(m.fee_date) * 10 AS total_revenue
FROM Club c
JOIN Membership m ON c.club_id = m.club_id
WHERE m.fee_date IS NOT NULL
GROUP BY c.club_name;

-- Revenue earned per club from events and joining 
SELECT c.club_name, 
       COUNT(m.fee_date) * 10 AS membership_revenue, 
       SUM(e.cost) AS total_event_budget,
       (COUNT(m.fee_date) * 10) - SUM(e.cost) AS net_financial_standing
FROM Club c
JOIN Membership m ON c.club_id = m.club_id
JOIN Event e ON c.club_id = e.club_id
WHERE m.fee_date IS NOT NULL
GROUP BY c.club_name;
