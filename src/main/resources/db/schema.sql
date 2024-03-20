DROP TABLE IF EXISTS cms_article;
CREATE TABLE cms_article
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    type         TINYINT   DEFAULT 1,
    title        VARCHAR(1024)                       NOT NULL,
    summary      VARCHAR(1024),
    tags         VARCHAR(255),
    content      CLOB,
    category     VARCHAR(25),
    sub_category VARCHAR(25),
    create_time  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_time  TIMESTAMP,
    open_count   INT       DEFAULT 0,
    start_time   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_time     TIMESTAMP,
    target_link  VARCHAR(255),
    image        VARCHAR(255),
    CONSTRAINT idx_title UNIQUE (title)
);

DROP TABLE IF EXISTS sys_captcha;
CREATE TABLE sys_captcha
(
    uuid        VARCHAR(36) NOT NULL PRIMARY KEY,
    code        VARCHAR(6)  NOT NULL,
    expire_time TIMESTAMP
);


DROP TABLE IF EXISTS sys_config;
CREATE TABLE sys_config
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    param_key   VARCHAR(50),
    param_value VARCHAR(2000),
    status      TINYINT DEFAULT 1,
    remark      VARCHAR(500)
);

INSERT INTO sys_config (id, param_key, param_value, status, remark)
VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY',
        '{"type":3,"qiniuDomain":"","qiniuPrefix":"","qiniuAccessKey":"","qiniuSecretKey":"","qiniuBucketName":"","aliyunDomain":"","aliyunPrefix":"","aliyunEndPoint":"","aliyunAccessKeyId":"","aliyunAccessKeySecret":"","aliyunBucketName":"","qcloudDomain":"","qcloudPrefix":"","qcloudAppId":"","qcloudSecretId":"","qcloudSecretKey":"","qcloudBucketName":"","qcloudRegion":"ap-guangzhou"}',
        0, '云存储配置信息');

DROP TABLE IF EXISTS sys_log;
CREATE TABLE sys_log
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50),
    operation   VARCHAR(50),
    method      VARCHAR(200),
    params      VARCHAR(5000),
    time        BIGINT,
    ip          VARCHAR(64),
    create_date TIMESTAMP
);

DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu
(
    menu_id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    parent_id BIGINT,
    name      VARCHAR(50),
    url       VARCHAR(200),
    perms     VARCHAR(500),
    type      INT,
    icon      VARCHAR(50),
    order_num INT
);

INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (1, 0, '系统管理', NULL, NULL, 0, 'el-icon-s-tools', 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (6, 0, '微信管理', NULL, NULL, 0, 'el-icon-s-promotion', 1);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (7, 0, '内容管理', '', '', 0, 'el-icon-document-copy', 2);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (9, 0, '日志报表', '', '', 0, 'el-icon-s-order', 4);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (27, 1, '参数管理', 'sys/config',
        'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (29, 9, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (32, 6, '公众号菜单', 'wx/wx-menu', '', 1, 'log', 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (33, 6, '素材管理', 'wx/wx-assets', '', 1, '', 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (41, 7, '文章管理', 'wx/article', NULL, 1, 'config', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (42, 41, '查看', NULL, 'wx:article:list,wx:article:info', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (43, 41, '新增', NULL, 'wx:article:save', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (44, 41, '修改', NULL, 'wx:article:update', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (45, 41, '删除', NULL, 'wx:article:delete', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (66, 6, '自动回复规则', 'wx/msg-reply-rule', NULL, 1, 'config', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (67, 66, '查看', NULL, 'wx:msgreplyrule:list,wx:msgreplyrule:info', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (68, 66, '新增', NULL, 'wx:msgreplyrule:save', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (69, 66, '修改', NULL, 'wx:msgreplyrule:update', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (70, 66, '删除', NULL, 'wx:msgreplyrule:delete', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (71, 6, '模板消息', 'wx/msg-template', NULL, 1, 'config', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (72, 71, '查看', NULL, 'wx:msgtemplate:list,wx:msgtemplate:info', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (73, 71, '新增', NULL, 'wx:msgtemplate:save', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (74, 71, '修改', NULL, 'wx:msgtemplate:update', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (75, 71, '删除', NULL, 'wx:msgtemplate:delete', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (81, 9, '模版消息发送记录', 'wx/template-msg-log', NULL, 1, 'config', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (84, 81, '列表', NULL, 'wx:templatemsglog:list', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (85, 81, '删除', NULL, 'wx:templatemsglog:delete', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (99, 32, '更新公众号菜单', '', 'wx:menu:save', 2, '', 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (100, 33, '查看', '', 'wx:wxassets:list', 2, '', 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (101, 33, '新增修改', '', 'wx:wxassets:save', 2, '', 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (103, 6, '带参二维码', 'wx/wx-qrcode', NULL, 1, 'config', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (104, 103, '查看', NULL, 'wx:wxqrcode:list,wx:wxqrcode:info', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (105, 103, '新增', NULL, 'wx:wxqrcode:save', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (107, 103, '删除', NULL, 'wx:wxqrcode:delete', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (108, 6, '粉丝管理', 'wx/wx-user', NULL, 1, 'config', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (109, 108, '查看', NULL, 'wx:wxuser:list,wx:wxuser:info', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (110, 108, '删除', NULL, 'wx:wxuser:delete', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (111, 108, '同步', '', 'wx:wxuser:save', 2, '', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (112, 33, '删除', '', 'wx:wxassets:delete', 2, '', 0);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (113, 6, '公众号消息', 'wx/wx-msg', NULL, 1, '', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (114, 113, '查看', NULL, 'wx:wxmsg:list,wx:wxmsg:info', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (115, 113, '新增', NULL, 'wx:wxmsg:save', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (117, 113, '删除', NULL, 'wx:wxmsg:delete', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (118, 6, '公众号账号', 'wx/wx-account', NULL, 1, 'config', 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (119, 118, '查看', NULL, 'wx:wxaccount:list,wx:wxaccount:info', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (120, 118, '新增', NULL, 'wx:wxaccount:save', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (121, 118, '修改', NULL, 'wx:wxaccount:update', 2, NULL, 6);
INSERT INTO sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num)
VALUES (122, 118, '删除', NULL, 'wx:wxaccount:delete', 2, NULL, 6);

DROP TABLE IF EXISTS sys_oss;

CREATE TABLE sys_oss
(
    id          BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    url         VARCHAR(200) DEFAULT NULL COMMENT 'URL地址',
    create_date TIMESTAMP    DEFAULT NULL COMMENT '创建时间'
);

DROP TABLE IF EXISTS sys_role;

CREATE TABLE sys_role
(
    role_id        BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role_name      VARCHAR(100) DEFAULT NULL COMMENT '角色名称',
    remark         VARCHAR(100) DEFAULT NULL COMMENT '备注',
    create_user_id BIGINT       DEFAULT NULL COMMENT '创建者ID',
    create_time    TIMESTAMP    DEFAULT NULL COMMENT '创建时间'
);

DROP TABLE IF EXISTS sys_role_menu;

CREATE TABLE sys_role_menu
(
    id      BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role_id BIGINT DEFAULT NULL COMMENT '角色ID',
    menu_id BIGINT DEFAULT NULL COMMENT '菜单ID'
);

DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user
(
    user_id        BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username       VARCHAR(50) NOT NULL COMMENT '用户名',
    password       VARCHAR(100) DEFAULT NULL COMMENT '密码',
    salt           VARCHAR(20)  DEFAULT NULL COMMENT '盐',
    email          VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
    mobile         VARCHAR(100) DEFAULT NULL COMMENT '手机号',
    status         TINYINT      DEFAULT NULL COMMENT '状态 0：禁用 1：正常',
    create_user_id BIGINT       DEFAULT NULL COMMENT '创建者ID',
    create_time    TIMESTAMP    DEFAULT NULL COMMENT '创建时间'
);

CREATE INDEX IF NOT EXISTS idx_employee_department ON sys_user (username);

-- ----------------------------
-- Records of sys_user (assuming data is already in UTF-8)
-- ----------------------------
INSERT INTO sys_user
VALUES (1, 'admin', 'cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a', 'YzcmCZNvbXocrsz9dm8e',
        'niefy@qq.com', '16666666666', 1, 1, '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role
(
    id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT DEFAULT NULL COMMENT '用户ID',
    role_id BIGINT DEFAULT NULL COMMENT '角色ID'
);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS sys_user_token;
CREATE TABLE sys_user_token
(
    user_id     BIGINT       NOT NULL,
    token       VARCHAR(100) NOT NULL,
    expire_time TIMESTAMP    NULL DEFAULT NULL,
    update_time TIMESTAMP    NULL DEFAULT NULL,
    PRIMARY KEY (user_id)
);

-- ----------------------------
-- Table structure for wx_account
-- ----------------------------
DROP TABLE IF EXISTS wx_account;
CREATE TABLE wx_account
(
    appid   VARCHAR(20)    NOT NULL PRIMARY KEY,
    name     VARCHAR(50) NOT NULL,
    type     TINYINT     NULL DEFAULT 1,
    verified TINYINT     NULL DEFAULT 1,
    secret  VARCHAR(32)    NOT NULL,
    token    VARCHAR(32) NULL DEFAULT NULL,
    aes_key  VARCHAR(43) NULL DEFAULT NULL
);

-- ----------------------------
-- Table structure for wx_msg
-- ----------------------------
DROP TABLE IF EXISTS wx_msg;
CREATE TABLE wx_msg
(
    id          BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
    appid      VARCHAR(20)    NOT NULL,
    openid      VARCHAR(32) NOT NULL,
    in_out      TINYINT     NULL DEFAULT NULL,
    msg_type   VARCHAR(25)    NULL DEFAULT NULL,
    detail      CLOB        NULL,
    create_time TIMESTAMP   NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_msg_appid ON wx_msg (appid);


-- ----------------------------
-- Table structure for wx_msg_reply_rule
-- ----------------------------
DROP TABLE IF EXISTS wx_msg_reply_rule;
CREATE TABLE wx_msg_reply_rule
(
    rule_id           INT AUTO_INCREMENT PRIMARY KEY,
    appid            VARCHAR(20)      NULL     DEFAULT '' COMMENT 'appid',
    rule_name         VARCHAR(20)   NOT NULL COMMENT '规则名称',
    match_value       VARCHAR(200)  NOT NULL COMMENT '匹配的关键词、事件等',
    exact_match       TINYINT       NOT NULL DEFAULT 0 COMMENT '是否精确匹配',
    reply_type        VARCHAR(20)   NOT NULL DEFAULT '1' COMMENT '回复消息类型',
    reply_content     VARCHAR(1024) NOT NULL COMMENT '回复消息内容',
    status            TINYINT       NOT NULL DEFAULT 1 COMMENT '规则是否有效',
    desc              VARCHAR(255)  NULL     DEFAULT NULL COMMENT '备注说明',
    effect_time_start TIME          NULL     DEFAULT '00:00:00' COMMENT '生效起始时间',
    effect_time_end   TIME          NULL     DEFAULT '23:59:59' COMMENT '生效结束时间',
    priority          INT  NULL DEFAULT 0 COMMENT '规则优先级',
    update_time       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
);

CREATE INDEX IF NOT EXISTS idx_msg_reply_appid ON wx_msg_reply_rule (appid);


-- ----------------------------
-- Records of wx_msg_reply_rule
-- ----------------------------
INSERT INTO wx_msg_reply_rule
VALUES (1, '', '关注公众号', 'subscribe', 0, 'text',
        '你好，欢迎关注！\n<a href=\"https://github.com/niefy\">点击链接查看我的主页</a>', 1, '关注回复', '00:00:00',
        '23:59:59', 0, '2020-05-20 15:15:00');

-- ----------------------------
-- Table structure for wx_msg_template
-- ----------------------------
DROP TABLE IF EXISTS wx_msg_template;
CREATE TABLE wx_msg_template
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    appid      VARCHAR(20)     NOT NULL COMMENT 'appid',
    template_id VARCHAR(100) NOT NULL COMMENT '公众号模板ID',
    name        VARCHAR(50)  NULL     DEFAULT NULL COMMENT '模版名称',
    title       VARCHAR(20)  NULL     DEFAULT NULL COMMENT '标题',
    content     TEXT         NULL COMMENT '模板内容',
    data        JSON         NULL COMMENT '消息内容',
    url         VARCHAR(255) NULL     DEFAULT NULL COMMENT '链接',
    miniprogram JSON         NULL COMMENT '小程序信息',
    status      TINYINT      NOT NULL COMMENT '是否有效',
    update_time DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
);
CREATE UNIQUE INDEX idx_name ON wx_msg_template (name);
CREATE INDEX idx_wx_msg_template_status ON wx_msg_template (status);
CREATE INDEX idx_wx_msg_template_appid ON wx_msg_template (appid);



-- ----------------------------
-- Table structure for wx_qr_code
-- ----------------------------
DROP TABLE IF EXISTS wx_qr_code;
CREATE TABLE wx_qr_code
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    appid      VARCHAR(20)     NOT NULL COMMENT 'appid',
    is_temp     TINYINT      NULL DEFAULT NULL COMMENT '是否为临时二维码',
    scene_str   VARCHAR(64)  NULL DEFAULT NULL COMMENT '场景值ID',
    ticket      VARCHAR(255) NULL DEFAULT NULL COMMENT '二维码ticket',
    url         VARCHAR(255) NULL DEFAULT NULL COMMENT '二维码图片解析后的地址',
    expire_time DATETIME     NULL DEFAULT NULL COMMENT '该二维码失效时间',
    create_time DATETIME     NULL DEFAULT NULL COMMENT '该二维码创建时间'
);

CREATE INDEX idx_appid ON wx_qr_code (appid);

-- ----------------------------
-- Table structure for wx_template_msg_log
-- ----------------------------
DROP TABLE IF EXISTS wx_template_msg_log;
CREATE TABLE wx_template_msg_log
(
    log_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    appid      VARCHAR(20)     NOT NULL COMMENT 'appid',
    touser      VARCHAR(50)  NULL DEFAULT NULL COMMENT '用户openid',
    template_id VARCHAR(50)  NULL DEFAULT NULL COMMENT 'templateid',
    data        JSON         NULL COMMENT '消息数据',
    url         VARCHAR(255) NULL DEFAULT NULL COMMENT '消息链接',
    miniprogram JSON         NULL COMMENT '小程序信息',
    send_time   DATETIME     NULL DEFAULT NULL COMMENT '发送时间',
    send_result VARCHAR(255) NULL DEFAULT NULL COMMENT '发送结果'
);

CREATE UNIQUE  INDEX idx_unique_template_msg_id ON wx_template_msg_log (appid, touser, template_id);

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS wx_user;
CREATE TABLE wx_user
(
    openid          VARCHAR(50)  NOT NULL COMMENT '微信openid',
    appid          VARCHAR(20)     NOT NULL COMMENT 'appid',
    phone          VARCHAR(11)     NULL DEFAULT NULL COMMENT '手机号',
    nickname        VARCHAR(50)  NULL DEFAULT NULL COMMENT '昵称',
    sex             TINYINT      NULL DEFAULT NULL COMMENT '性别(0-未知、1-男、2-女)',
    city            VARCHAR(20)  NULL DEFAULT NULL COMMENT '城市',
    province        VARCHAR(20)  NULL DEFAULT NULL COMMENT '省份',
    headimgurl      VARCHAR(255) NULL DEFAULT NULL COMMENT '头像',
    subscribe_time  DATETIME     NULL DEFAULT NULL COMMENT '订阅时间',
    subscribe       TINYINT  NULL DEFAULT 1 COMMENT '是否关注',
    unionid         VARCHAR(50)  NULL DEFAULT NULL COMMENT 'unionid',
    remark          VARCHAR(255) NULL DEFAULT NULL COMMENT '备注',
    tagid_list      JSON         NULL COMMENT '标签ID列表',
    subscribe_scene VARCHAR(50)  NULL DEFAULT NULL COMMENT '关注场景',
    qr_scene_str    VARCHAR(64)  NULL DEFAULT NULL COMMENT '扫码场景值'
);
CREATE UNIQUE  INDEX idx_unique_wx_user_unionid ON wx_user (unionid);


-- ----------------------------

