-- creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student.
DELIMITER //
CREATE PROCEDURE ComputeAverageScoreForUser(IN input_user_id INT)
BEGIN
  DECLARE aver FLOAT;
  SELECT AVG(score) INTO aver FROM corrections WHERE user_id = input_user_id;
  UPDATE users SET average_score = aver WHERE id = input_user_id;
END//
