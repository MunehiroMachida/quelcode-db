CREATE TABLE `users_informations` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `email_address` varchar(100) NOT NULL,
    `password` varchar(100) NOT NULL,
    `display_name` varchar(100) NOT NULL,
    `profile` varchar(1000),
    `office_telephone_number` varchar(13),
    `mobilephone_number` varchar(13),
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL
);

CREATE TABLE `chatrooms` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_name` varchar(100) NOT NULL,
    `chatroom_overview` varchar(1000),
    `is_file_send` tinyint(1) NOT NULL DEFAULT '0',
    `is_direct_chat` tinyint(1) NOT NULL DEFAULT '0',
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `create_user` int(11) NOT NULL REFERENCES users_informations(id),
    `update_user` int(11) NOT NULL REFERENCES users_informations(id),
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL
);

CREATE TABLE `participants` (
    `user_id` int(11) REFERENCES users_informations(id),
    `chatroom_id` int(11) REFERENCES chatrooms(id),
    `participation_date` datetime NOT NULL,
    PRIMARY KEY (`id`,`chatroom_id`)
);

CREATE TABLE `posts` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_id` int(11) NOT NULL REFERENCES chatrooms(id),
    `post_content` varchar(1000) NOT NULL,
    `file_name` varchar(100),
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `create_user` int(11) NOT NULL REFERENCES users_informations(id),
    `update_user` int(11) NOT NULL REFERENCES users_informations(id),
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL
);

CREATE TABLE `tasks` (
    `id` int(11) PRIMARY KEY AUTO_INCREMENT,
    `chatroom_id` int(11) NOT NULL REFERENCES chatrooms(id),
    `task_content` varchar(1000) NOT NULL,
    `handle_person` int(11) NOT NULL REFERENCES users_informations(id),
    `deadline` datetime,
    `is_complete` tinyint(1) NOT NULL DEFAULT '0',
    `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
    `create_user` int(11) NOT NULL REFERENCES users_informations(id),
    `update_user` int(11) NOT NULL REFERENCES users_informations(id),
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL
);
