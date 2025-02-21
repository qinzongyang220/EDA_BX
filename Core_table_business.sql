-- 客户信息表（customer）
CREATE TABLE customer (
    customer_id BIGINT PRIMARY KEY COMMENT '客户ID',
    name VARCHAR(50) COMMENT '姓名',
    gender TINYINT COMMENT '性别（1男，2女）',
    age INT COMMENT '年龄',
    phone VARCHAR(20) COMMENT '联系电话'
);

-- 投保单表（application）
CREATE TABLE application (
    application_id BIGINT PRIMARY KEY COMMENT '投保单ID',
    customer_id BIGINT COMMENT '客户ID',
    product_id VARCHAR(20) COMMENT '保险产品ID',
    apply_date DATE COMMENT '投保日期',
    status TINYINT COMMENT '核保状态（0待审核，1通过，2拒绝）',
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 保单表（policy）
CREATE TABLE policy (
    policy_id BIGINT PRIMARY KEY COMMENT '保单ID',
    application_id BIGINT COMMENT '投保单ID',
    start_date DATE COMMENT '生效日期',
    end_date DATE COMMENT '终止日期',
    premium DECIMAL(10,2) COMMENT '年缴保费',
    FOREIGN KEY (application_id) REFERENCES application(application_id)
);

-- 保费缴纳表（premium_payment）
CREATE TABLE premium_payment (
    payment_id BIGINT PRIMARY KEY COMMENT '缴费ID',
    policy_id BIGINT COMMENT '保单ID',
    pay_date DATE COMMENT '缴费日期',
    amount DECIMAL(10,2) COMMENT '缴费金额',
    FOREIGN KEY (policy_id) REFERENCES policy(policy_id)
);

-- 理赔表（claim）
CREATE TABLE claim (
    claim_id BIGINT PRIMARY KEY COMMENT '理赔ID',
    policy_id BIGINT COMMENT '保单ID',
    claim_date DATE COMMENT '申请日期',
    claim_amount DECIMAL(10,2) COMMENT '理赔金额',
    status TINYINT COMMENT '状态（0待处理，1已赔付，2拒赔）',
    FOREIGN KEY (policy_id) REFERENCES policy(policy_id)
);