CREATE TABLE IF NOT EXISTS `rig_players` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `unique_id` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(32) UNIQUE DEFAULT NULL,
    `vip` TINYINT(1) NOT NULL DEFAULT 0,
    `priority` INT(11) NOT NULL DEFAULT 0,
    `license` VARCHAR(255) NOT NULL,
    `discord` VARCHAR(255) DEFAULT NULL,
    `tokens` JSON NOT NULL DEFAULT (JSON_ARRAY()),
    `ip` VARCHAR(255) NOT NULL,
    `banned` TINYINT(1) NOT NULL DEFAULT 0,
    `muted` TINYINT(1) NOT NULL DEFAULT 0,
    `deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `metadata` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `last_login` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`unique_id`),
    UNIQUE KEY `username_unique` (`username`),
    KEY `id_idx` (`id`),
    KEY `license_idx` (`license`),
    KEY `banned_idx` (`banned`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_player_bans` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `unique_id` VARCHAR(255) NOT NULL,
    `banned_by` VARCHAR(255) NOT NULL DEFAULT 'rig',
    `reason` TEXT DEFAULT NULL,
    `expires_at` TIMESTAMP NULL DEFAULT NULL,
    `expired` TINYINT(1) NOT NULL DEFAULT 0,
    `appealed` TINYINT(1) NOT NULL DEFAULT 0,
    `appealed_by` VARCHAR(255) DEFAULT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `unique_id_idx` (`unique_id`),
    KEY `expired_idx` (`expired`),
    FOREIGN KEY (`unique_id`) REFERENCES `rig_players` (`unique_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_player_warnings` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `unique_id` VARCHAR(255) NOT NULL,
    `warned_by` VARCHAR(255) NOT NULL DEFAULT 'rig',
    `reason` TEXT DEFAULT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `unique_id_idx` (`unique_id`),
    FOREIGN KEY (`unique_id`) REFERENCES `rig_players` (`unique_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_player_appearances` (
    `unique_id` VARCHAR(255) NOT NULL,
    `sex` VARCHAR(1) NOT NULL DEFAULT 'm',
    `genetics` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `barber` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `clothing` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `tattoos` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `has_customised` TINYINT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`unique_id`),
    FOREIGN KEY (`unique_id`) REFERENCES `rig_players` (`unique_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_player_spawns` (
    `unique_id` VARCHAR(255) NOT NULL,
    `spawn_id` VARCHAR(50) NOT NULL DEFAULT 'last_location',
    `spawn_type` ENUM('last_location', 'bed', 'sleeping_bag') NOT NULL DEFAULT 'last_location',
    `label` VARCHAR(100) DEFAULT NULL,
    `x` FLOAT NOT NULL,
    `y` FLOAT NOT NULL,
    `z` FLOAT NOT NULL,
    `w` FLOAT NOT NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`unique_id`, `spawn_id`),
    KEY `spawn_type_idx` (`spawn_type`),
    FOREIGN KEY (`unique_id`) REFERENCES `rig_players` (`unique_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_player_statuses` (
    `unique_id` VARCHAR(255) NOT NULL,
    `health` FLOAT NOT NULL DEFAULT 200.0,
    `armour` FLOAT NOT NULL DEFAULT 0.0,
    `hunger` FLOAT NOT NULL DEFAULT 100.0,
    `thirst` FLOAT NOT NULL DEFAULT 100.0,
    `hygiene` FLOAT NOT NULL DEFAULT 100.0,
    `stress` FLOAT NOT NULL DEFAULT 0.0,
    `sanity` FLOAT NOT NULL DEFAULT 100.0,
    `temperature` FLOAT NOT NULL DEFAULT 37.0,
    `bleeding` FLOAT NOT NULL DEFAULT 0.0,
    `radiation` FLOAT NOT NULL DEFAULT 0.0,
    `infection` FLOAT NOT NULL DEFAULT 0.0,
    `poison` FLOAT NOT NULL DEFAULT 0.0,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`unique_id`),
    FOREIGN KEY (`unique_id`) REFERENCES `rig_players` (`unique_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_player_injuries` (
    `unique_id` VARCHAR(255) NOT NULL,
    `head` FLOAT NOT NULL DEFAULT 0.0,
    `upper_torso` FLOAT NOT NULL DEFAULT 0.0,
    `lower_torso` FLOAT NOT NULL DEFAULT 0.0,
    `forearm_right` FLOAT NOT NULL DEFAULT 0.0,
    `forearm_left` FLOAT NOT NULL DEFAULT 0.0,
    `hand_right` FLOAT NOT NULL DEFAULT 0.0,
    `hand_left` FLOAT NOT NULL DEFAULT 0.0,
    `thigh_right` FLOAT NOT NULL DEFAULT 0.0,
    `thigh_left` FLOAT NOT NULL DEFAULT 0.0,
    `calf_right` FLOAT NOT NULL DEFAULT 0.0,
    `calf_left` FLOAT NOT NULL DEFAULT 0.0,
    `foot_right` FLOAT NOT NULL DEFAULT 0.0,
    `foot_left` FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY (`unique_id`),
    FOREIGN KEY (`unique_id`) REFERENCES `rig_players` (`unique_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_player_effects` (
    `unique_id` VARCHAR(255) NOT NULL,
    `effect_id` VARCHAR(255) NOT NULL,
    `effect_type` ENUM('buff', 'debuff', 'status') NOT NULL,
    `effect_name` VARCHAR(100) NOT NULL,
    `duration` INT NOT NULL DEFAULT -1,
    `stacks` TINYINT UNSIGNED NOT NULL DEFAULT 1,
    `applied_at` INT NOT NULL,
    `expires_at` INT NULL DEFAULT NULL,
    PRIMARY KEY (`unique_id`, `effect_id`),
    KEY `unique_id_idx` (`unique_id`),
    KEY `expires_at_idx` (`expires_at`),
    FOREIGN KEY (`unique_id`) REFERENCES `rig_players` (`unique_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_inventories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(255) NOT NULL,
    `owner` VARCHAR(255) NOT NULL,
    `type` ENUM('player', 'vehicle', 'container', 'drop') NOT NULL DEFAULT 'player',
    `subtype` VARCHAR(50) DEFAULT NULL,
    `items` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `metadata` JSON DEFAULT (JSON_OBJECT()),
    `last_update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `identifier_unique` (`identifier`),
    KEY `owner_idx` (`owner`),
    KEY `type_subtype_idx` (`type`, `subtype`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `rig_placed_objects` (
    `id` VARCHAR(64) NOT NULL,
    `owner_id` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `object_type` VARCHAR(64) NOT NULL,
    `x` FLOAT NOT NULL,
    `y` FLOAT NOT NULL,
    `z` FLOAT NOT NULL,
    `w` FLOAT NOT NULL DEFAULT 0.0,
    `placed_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `owner_idx` (`owner_id`),
    KEY `object_type_idx` (`object_type`),
    FOREIGN KEY (`owner_id`) REFERENCES `rig_players` (`unique_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
