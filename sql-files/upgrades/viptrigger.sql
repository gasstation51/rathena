DELIMITER $$

CREATE TRIGGER `set_vip_on_account_create`
AFTER INSERT ON `login`
FOR EACH ROW
BEGIN
  UPDATE `login`
  SET
    `vip_status` = 1,
    `vip_expiration_time` = 0 -- 0 = 영구 VIP
  WHERE `account_id` = NEW.`account_id`;
END $$

DELIMITER ;