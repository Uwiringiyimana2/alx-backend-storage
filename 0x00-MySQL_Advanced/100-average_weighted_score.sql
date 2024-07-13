-- creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student.
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN input_user_id INT)
BEGIN
  DECLARE weightedSum FLOAT;
  DECLARE totalWeight FLOAT;

  SELECT SUM(p.weight * c.score), SUM(p.weight) 
  INTO weightedSum, totalWeight
  FROM corrections c
  JOIN projects p
  ON c.project_id = p.id 
  WHERE c.user_id = input_user_id;

  UPDATE users SET average_score = weightedSum / totalWeight WHERE id = input_user_id;
END//
