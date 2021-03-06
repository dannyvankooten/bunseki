-- +migrate Up

ALTER TABLE site_stats MODIFY site_id TINYINT UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE site_stats MODIFY pageviews MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE site_stats MODIFY visitors MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE site_stats MODIFY sessions MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE site_stats MODIFY known_durations MEDIUMINT UNSIGNED NOT NULL;

ALTER TABLE page_stats MODIFY site_id TINYINT UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE page_stats MODIFY hostname_id MEDIUMINT UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE page_stats MODIFY pathname_id MEDIUMINT UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE page_stats MODIFY pageviews MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE page_stats MODIFY visitors MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE page_stats MODIFY entries MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE page_stats MODIFY known_durations MEDIUMINT UNSIGNED NOT NULL;

ALTER TABLE referrer_stats MODIFY site_id TINYINT UNSIGNED NOT NULL;
ALTER TABLE referrer_stats MODIFY hostname_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE referrer_stats MODIFY pathname_id MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE referrer_stats MODIFY pageviews MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE referrer_stats MODIFY visitors MEDIUMINT UNSIGNED NOT NULL;
ALTER TABLE referrer_stats MODIFY known_durations MEDIUMINT UNSIGNED NOT NULL;

-- +migrate Down

