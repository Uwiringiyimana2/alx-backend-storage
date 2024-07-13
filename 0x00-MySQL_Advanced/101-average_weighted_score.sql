-- creates a stored procedure ComputeAverageWeightedScoreForUsers that computes
-- and store the average weighted score for all students.
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE current_user_id INT;
  DECLARE weightedSum FLOAT;
  DECLARE totalWeight FLOAT;

  -- Cursor to iterate over all user ids
  DECLARE user_cursor CURSOR FOR SELECT id FROM users;

  -- Handler for the end of the cursor
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  OPEN user_cursor;

  read_loop: LOOP
    FETCH user_cursor INTO current_user_id;
    IF done THEN
      LEAVE read_loop;
    END IF;

    -- Calculate the weighted sum of scores and the sum of weights for the current user
    SELECT SUM(p.weight * c.score), SUM(p.weight)
    INTO weightedSum, totalWeight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = current_user_id;

    -- Update the users table with the calculated average weighted score
    UPDATE users 
    SET average_score = IFNULL(weightedSum / totalWeight, 0)
    WHERE id = current_user_id;

  END LOOP;

  CLOSE user_cursor;
END//
