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
  10