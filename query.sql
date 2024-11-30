  /*
Finding the top 10 stories with the most comments.

The top 10 titles seem to variate.

'Google' and 'Facebook' are 2nd and 6th respectively, and they are
both top companies for people in tech.

'Test' and 'Placeholder' seem to be stories that are just
used to test the function of a story.

The last one seems a bit odd, because it does not follow
the title casing, and has a unreliable title - 
'HACK your cell phone Get free internet'
*/

SELECT
  title,
  COUNT(descendants) AS comment_count
FROM
  `bigquery-public-data.hacker_news.full`
GROUP BY
  title
ORDER BY
  comment_count DESC
LIMIT
  10;

/*
Finding the number of stories that are marked as 'dead' and comparing their average scores with active stories.

All the 849000+ stories are 'dead', which would mean that this dataset is outdated, and cannot be compared to today.

The average score for all of these stories is 1.4, suggesting that a lot of stories did not have a good post reach.
*/

SELECT COUNT(title) as number_of_stories, ROUND(AVG(score), 1) as mean_score, dead
FROM `bigquery-public-data.hacker_news.full`
WHERE dead = TRUE
GROUP BY dead;

-- Confirmation of dataset consisting of dead stories
SELECT title
FROM `bigquery-public-data.hacker_news.full`
WHERE dead = FALSE;