DROP TABLE IF EXISTS `color_setting`;
CREATE TABLE IF NOT EXISTS `color_setting` (
  `id` int NOT NULL,
  `navbar_background` varchar(255) NOT NULL,
  `sidebar_background` varchar(255) NOT NULL,
  `text_color` varchar(255) NOT NULL,
  `save_button_color` varchar(255) NOT NULL,
  `edit_button_color` varchar(255) NOT NULL,
  `delete_button_color` varchar(255) NOT NULL,
  `view_button_color` varchar(255) NOT NULL,
  `label_text_color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `color_setting` (`id`, `navbar_background`, `sidebar_background`, `text_color`, `save_button_color`, `edit_button_color`, `delete_button_color`, `view_button_color`, `label_text_color`) VALUES
(1, '#0763c5', '#0f40b3', '#dad7d7', '#049a2a', '#11ac2b', '#c60c0c', '#6c6a6a', '#434242');