-- creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student.
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN input_user_id INT)
BEGIN
  DECLARE weightedSum FLOAT;
  DECLARE weightScore FLOAT;
  SELECT SUM(weight * score), SUM(weight) INTO weightedSum, weightScore FROM corrections JOIN projects on user_id = id WHERE user_id = input_user_id;
  UPDATE users SET average_score = weightedSum / weightScore WHERE id = input_user_id;
END//
