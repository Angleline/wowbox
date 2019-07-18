if(GetLocale() == "zhCN") then

-- ===================== Part for TradeFrameEnchanced ==================
TBT_SPELL_RANK_PATTERN = "等级 (%d)";
TBT_UNLOCK_SKILL_NAME="开锁";
local _;
_,_,TBT_GAMETOOLTIP_MADE_BY=string.find(string.gsub(ITEM_CREATED_BY,"%%s","(.+)"),"(<.+>)"); --TBT_GAMETOOLTIP_MADE_BY="<由(.+)制造>"
TBT_SPELL_TABLE = {
	water = { name = "造餐术", rank = nil, item = "func" },
	food = { name = "造餐术", rank = nil, item = "func" },
	stone = { name="制造治疗石", rank = nil, item = "治疗石" },
}
-- =============== just localizate the above, the addon will function ok ========================= 
TBT_LEFT_BUTTON = {
	water		= "水",
	food		= "食",
	stone		= "糖",
	unlock	= "锁",
}

TBT_RIGHT_BUTTON = {
	whisper	= "密",
	ask		= "要",
	thank		= "谢",
}

TBT_CANT_CREATE_AUCTION = "无法进行拍卖，拍卖按钮不可用，可能是插件冲突。"
-- ===================== Part for TradeLog ==================
TRADE_LOG_MONEY_NAME = {
	gold = "g",
	silver = "s",
	copper = "c",
}

CANCEL_REASON_TEXT = {
	self = "你取消了交易",
	other = "对方取消了交易",
	toofar = "双方距离过远",
	selfrunaway = "你超出了距离",
	selfhideui = "你隐藏了界面,交易窗口关闭",
	unknown = "未知原因",
}

CANCEL_REASON_TEXT_ANNOUNCE = {
	self = "我取消了交易",
	other = "对方取消了交易",
	toofar = "双方距离过远",
	selfrunaway = "我超出了距离",
	selfhideui = "我隐藏了界面,交易窗口关闭",
	unknown = "未知原因",
}

TRADE_LOG_SUCCESS_NO_EXCHANGE = "与[%t]交易成功, 但是没有做任何交换。";
TRADE_LOG_SUCCESS = "与[%t]交易成功。";
TRADE_LOG_DETAIL = "详情";
TRADE_LOG_CANCELLED = "与[%t]交易取消: %r。";
TRADE_LOG_FAILED = "与[%t]交易失败: %r。";
TRADE_LOG_FAILED_NO_TARGET = "交易失败: %r。";
TRADE_LOG_HANDOUT = "交出";
TRADE_LOG_RECEIVE = "收到";
TRADE_LOG_ENCHANT = "附魔";
TRADE_LOG_ITEM_NUMBER = "%d件物品";
TRADE_LOG_CHANNELS = {
	whisper = "密语",
	raid = "团队",
	party = "小队",
	say = "说",
	yell = "喊",
}
TRADE_LOG_ANNOUNCE = "通告";
TRADE_LOG_ANNOUNCE_TIP = "选中就会将交易信息发送到指定的频道"

-- ===================== Part for TradeList ==================
TRADE_LIST_TOOLTIP = "交易记录"
TRADE_LIST_CLEAR_HISTORY = "清除记录"
TRADE_LIST_SCALE = "详情窗口缩放"
TRADE_LIST_FILTER = "仅列出成功交易"

TRADE_LIST_HEADER_WHEN = "交易时间"
TRADE_LIST_HEADER_WHO = "交易对象"
TRADE_LIST_HEADER_WHERE = "交易地点"
TRADE_LIST_HEADER_SEND = "交出"
TRADE_LIST_HEADER_RECEIVE = "获得"
TRADE_LIST_HEADER_RESULT = "结果"

TRADE_LIST_RESULT_TEXT_SHORT = { 
	cancelled = "取消", 
	complete = "成功", 
	error = "失败", 
}

TRADE_LIST_RESULT_TEXT = { 
	cancelled = "交易取消", 
	complete = "交易成功", 
	error = "交易失败", 
}

TRADE_LIST_MONTH_SUFFIX = "月"
TRADE_LIST_DAY_SUFFIX = "日"

TRADE_LIST_COMPLETE_TOOLTIP = "点击鼠标左键查看交易的详细信息";

TRADE_LIST_CLEAR_CONFIRM = "今天以外的记录都将被清除!";

end