-- 生成客户数据
INSERT INTO customer VALUES
(1, '张三', 1, 35, '13800000001'),
(2, '李四', 2, 28, '13800000002');

-- 生成投保单数据（需关联客户表）
INSERT INTO application VALUES
(1001, 1, 'TERM_LIFE_01', '2023-01-01', 1),
(1002, 2, 'HEALTH_02', '2023-02-15', 0);

-- 生成保单数据（仅核保通过的投保单可生成保单）
INSERT INTO policy VALUES
(2001, 1001, '2023-01-10', '2043-01-10', 5000.00),
(2002, 1002, NULL, NULL, NULL);  -- 核保未通过，保单未生效

-- 生成保费缴纳数据（仅生效保单可缴费）
INSERT INTO premium_payment VALUES
(3001, 2001, '2023-01-10', 5000.00),
(3002, 2001, '2024-01-10', 5000.00);

-- 生成理赔数据（仅生效保单可申请理赔）
INSERT INTO claim VALUES
(4001, 2001, '2023-05-01', 100000.00, 1);


