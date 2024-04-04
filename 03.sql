SELECT
	*
FROM (
	SELECT
		Species
		,Breed
	FROM [dbo].[Animals]

		EXCEPT

	SELECT
		Species
		,Breed
	FROM [dbo].[Animals] AS an2
	WHERE
		EXISTS (
			SELECT TOP 1
				1
			FROM [dbo].[Adoptions]
			WHERE
				Name = an2.Name
				AND Species = an2.Species
		)
) AS t
