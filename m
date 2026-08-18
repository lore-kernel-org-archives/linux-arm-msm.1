Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2A437CD21
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065849; cv=none; b=ZX8xgLRpGB3qe6O2yjSyNOe5hu51Vmp6MNZdTagwN5Z/6y1Y2neP9x66AaDF7D+Uh1s4uS40lMtOlkvUaiWWWmdtFJdwW9NxMoGhGJYgHSgrTjYeU1dqtcAsMWV651fsSf/NAaLnlPWpFqahhYOJIdbnkp/LV4Jn82ixfbTyY/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065849; c=relaxed/simple;
	bh=b1rkFPtGAxaTKQsU2fZms/cmwCDYf7FU+90uT4gCqTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKGlWVFQLC1fg6rYARiCj8YmNXX4cnTCpuwo/UtOaDDZTWj+MHAhqPTIrxX8Ppu7M1RQGXuAoELXNSqviMpw/cnjx5BUULI9VM5SbybBJEmBuVjeLgJdoG4vFzmQHZMnR+91wqNvqCOHvEiHp5q9oTqV6R7s31PO93avBoOM1bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKof+drb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKof+drb"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1677c91969so599216466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065844; x=1787670644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itV88BizhIU5nkC2SJAZAmmYJyykzMNvmd/wtRUt1Io=;
        b=LKof+drbXR3m8bizG8S4KiVI93+S0pHWckF91pdlJA7Go2m50wpONOk48zlbxeKqjB
         8Basn3NO7Swmex0VyxtWLtWSqqfwL5LPGorSaBFB9TZXhfa7pYhZeIFIKmgSW0KBwBSJ
         YVK8W5narUZen8vjVVhmmPMOpOrvfW98la4EUSegfgUOELWJ87YoBg1w+uSABJ+hOg2d
         dwofYUTiMT6G3vxKJXC0fj/d01O04pjQvVfdtpzI5IubcD61om/9vyIEnsNhftJJiaP+
         4MFt8xcA3oXWog7qLPG4K1Uvx4SN3mp2/cS5rwMMFerE+iPhQOe1n6wDYPFt04RWfOEv
         +i0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065844; x=1787670644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=itV88BizhIU5nkC2SJAZAmmYJyykzMNvmd/wtRUt1Io=;
        b=YLXFgg5vU6Vn6zRSORGMkTuvao2ZcBeZgQCB6iHakPrILI72SoCZeAeLB1AtAVzW0E
         xgyEDjofEZnduhE+RY0PciPO9GACfwaZZvYXWHlonQ4a2p7ew4sBbd53blrXJayxWIXb
         iERlRQUFIoRKWUNrAer7RBuo8p/AarkU29u9p+W0nQyr/YXZbm0/At3EIVgxA34/b3BJ
         G260XJPucfNYqXSlcUPJunHpAFijtaATREHiVZ785ez1gLuyEx4AR2NZyUsB9Jm45EzO
         u9+ttOvlKvk4KkNiVmblfZHblCdS5frJJaDjd16pkU73h1QGDKOm7h5MvdmVe7J6uihG
         cB8w==
X-Gm-Message-State: AOJu0YwDuBOdTN2JauT9x9FDmXOMxnD0w813iCaUX8wfgqhYUsYHU+w6
	wqFi8s0Vl1KGWdXtyhTD8s+UEAc4oDzWVoMvvFlE88Fd1JfA63WXSczo
X-Gm-Gg: AR+sD11Z24vDzeonzxydV6z+Zt8PYZnNTcqVc9pg3cLcZGsJ/2WplCECH1ExEnMZ45P
	W6L3H3n5JYA8SPbuXXYfBmIdl7ZzT3BTiCvdme2cCHjz4pmFZxYYNLhFE2tuSnOP+FrLBKpd4tj
	GWMk6e9LkzJQdWj9+Pf8QSYE/USG2TxTa2pZEG9017U/rEWMsAdyFmN9YitZnn0U5NlSirlzoap
	xuwFFOAt1j+JgCXzB1w+v19EokI7919ZjhTxvcSs9FtYVLCkuYriyUivUKaSHAJrP5xXPqU3OZs
	1sh9NRelzgWCCLFcFhaPTbsV+nOAwxfoqgIs+eCcdI8dAZKXeRg7z90Vnpk/ZqiVAFZCkdo0i7+
	PdUudmy1ueMszmfXWdlCKCz1PlHiG2cN4E348546u8Si/9iPvblFbUGaec2GLUuAztlxNRf1uTs
	Gvmow6hjHCsVJOAcmUks51y0jCwNt5Ne4XoSVdjFFbQh+LBceT56dmM4rh5f8aXu1WqEyDijNWz
	igOQsdqnc+vGyEidYlMqQ==
X-Received: by 2002:a17:907:3f03:b0:c20:f871:1041 with SMTP id a640c23a62f3a-c2129c1bec8mr1768178566b.7.1787065844299;
        Tue, 18 Aug 2026 08:10:44 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe69cf4sm205772266b.3.2026.08.18.08.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:10:43 -0700 (PDT)
From: "user.email" <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v2 2/3] power: supply: qcom_battmgr: add Xiaomi taoyao support
Date: Tue, 18 Aug 2026 17:10:38 +0200
Message-ID: <20260818151039.409767-3-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818151039.409767-1-zstaseg@gmail.com>
References: <20260818151039.409767-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanislav Zaikin <zstaseg@gmail.com>

The Xiaomi taoyao firmware defines an additional BATT_CONSTANT_CURRENT
property (ID 12) between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting
all higher battery property IDs by one.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 drivers/power/supply/qcom_battmgr.c | 86 +++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 490137a23d00..390d7c75e36f 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -24,6 +24,7 @@ enum qcom_battmgr_variant {
 	QCOM_BATTMGR_SM8350,
 	QCOM_BATTMGR_SM8550,
 	QCOM_BATTMGR_X1E80100,
+	QCOM_BATTMGR_TAOYAO,
 };
 
 #define BATTMGR_BAT_STATUS		0x1
@@ -451,16 +452,87 @@ static const u8 sm8350_bat_prop_map[] = {
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] = BATT_CHG_CTRL_END_THR,
 };
 
+/*
+ * Xiaomi Taoyao firmware has BATT_CONSTANT_CURRENT (ID 12) inserted
+ * between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting all subsequent
+ * IDs by one.
+ */
+static const u8 taoyao_bat_prop_map[] = {
+	[POWER_SUPPLY_PROP_STATUS] = BATT_STATUS,
+	[POWER_SUPPLY_PROP_HEALTH] = BATT_HEALTH,
+	[POWER_SUPPLY_PROP_PRESENT] = BATT_PRESENT,
+	[POWER_SUPPLY_PROP_CHARGE_TYPE] = BATT_CHG_TYPE,
+	[POWER_SUPPLY_PROP_CAPACITY] = BATT_CAPACITY,
+	[POWER_SUPPLY_PROP_VOLTAGE_OCV] = BATT_VOLT_OCV,
+	[POWER_SUPPLY_PROP_VOLTAGE_NOW] = BATT_VOLT_NOW,
+	[POWER_SUPPLY_PROP_VOLTAGE_MAX] = BATT_VOLT_MAX,
+	[POWER_SUPPLY_PROP_CURRENT_NOW] = BATT_CURR_NOW,
+	[POWER_SUPPLY_PROP_TEMP] = BATT_TEMP + 1,
+	[POWER_SUPPLY_PROP_TECHNOLOGY] = BATT_TECHNOLOGY + 1,
+	[POWER_SUPPLY_PROP_CHARGE_COUNTER] = BATT_CHG_COUNTER + 1,
+	[POWER_SUPPLY_PROP_CYCLE_COUNT] = BATT_CYCLE_COUNT + 1,
+	[POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN] = BATT_CHG_FULL_DESIGN + 1,
+	[POWER_SUPPLY_PROP_CHARGE_FULL] = BATT_CHG_FULL + 1,
+	[POWER_SUPPLY_PROP_MODEL_NAME] = BATT_MODEL_NAME + 1,
+	[POWER_SUPPLY_PROP_TIME_TO_FULL_AVG] = BATT_TTF_AVG + 1,
+	[POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG] = BATT_TTE_AVG + 1,
+	[POWER_SUPPLY_PROP_INTERNAL_RESISTANCE] = BATT_RESISTANCE + 1,
+	[POWER_SUPPLY_PROP_STATE_OF_HEALTH] = BATT_SOH,
+	[POWER_SUPPLY_PROP_POWER_NOW] = BATT_POWER_NOW + 1,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] = BATT_CHG_CTRL_START_THR + 1,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] = BATT_CHG_CTRL_END_THR + 1,
+};
+
+/*
+ * Reverse mapping from Xiaomi Taoyao firmware property IDs to canonical
+ * kernel property IDs.
+ */
+static const u8 taoyao_to_canonical[] = {
+	[BATT_STATUS] = BATT_STATUS,
+	[BATT_HEALTH] = BATT_HEALTH,
+	[BATT_PRESENT] = BATT_PRESENT,
+	[BATT_CHG_TYPE] = BATT_CHG_TYPE,
+	[BATT_CAPACITY] = BATT_CAPACITY,
+	[BATT_SOH] = BATT_SOH,
+	[BATT_VOLT_OCV] = BATT_VOLT_OCV,
+	[BATT_VOLT_NOW] = BATT_VOLT_NOW,
+	[BATT_VOLT_MAX] = BATT_VOLT_MAX,
+	[BATT_CURR_NOW] = BATT_CURR_NOW,
+	[BATT_CHG_CTRL_LIM] = BATT_CHG_CTRL_LIM,
+	[BATT_CHG_CTRL_LIM_MAX] = BATT_CHG_CTRL_LIM_MAX,
+	[BATT_CHG_CTRL_LIM_MAX + 1] = 0xff,	/* BATT_CONSTANT_CURRENT - never requested */
+	[BATT_TEMP + 1] = BATT_TEMP,
+	[BATT_TECHNOLOGY + 1] = BATT_TECHNOLOGY,
+	[BATT_CHG_COUNTER + 1] = BATT_CHG_COUNTER,
+	[BATT_CYCLE_COUNT + 1] = BATT_CYCLE_COUNT,
+	[BATT_CHG_FULL_DESIGN + 1] = BATT_CHG_FULL_DESIGN,
+	[BATT_CHG_FULL + 1] = BATT_CHG_FULL,
+	[BATT_MODEL_NAME + 1] = BATT_MODEL_NAME,
+	[BATT_TTF_AVG + 1] = BATT_TTF_AVG,
+	[BATT_TTE_AVG + 1] = BATT_TTE_AVG,
+	[BATT_RESISTANCE + 1] = BATT_RESISTANCE,
+	[BATT_POWER_NOW + 1] = BATT_POWER_NOW,
+	[BATT_POWER_AVG + 1] = BATT_POWER_AVG,
+	[BATT_CHG_CTRL_EN + 1] = BATT_CHG_CTRL_EN,
+	[BATT_CHG_CTRL_START_THR + 1] = BATT_CHG_CTRL_START_THR,
+	[BATT_CHG_CTRL_END_THR + 1] = BATT_CHG_CTRL_END_THR,
+};
+
 static int qcom_battmgr_bat_sm8350_update(struct qcom_battmgr *battmgr,
 					  enum power_supply_property psp)
 {
 	unsigned int prop;
 	int ret;
 
-	if (psp >= ARRAY_SIZE(sm8350_bat_prop_map))
-		return -EINVAL;
-
-	prop = sm8350_bat_prop_map[psp];
+	if (battmgr->variant == QCOM_BATTMGR_TAOYAO) {
+		if (psp >= ARRAY_SIZE(taoyao_bat_prop_map))
+			return -EINVAL;
+		prop = taoyao_bat_prop_map[psp];
+	} else {
+		if (psp >= ARRAY_SIZE(sm8350_bat_prop_map))
+			return -EINVAL;
+		prop = sm8350_bat_prop_map[psp];
+	}
 
 	mutex_lock(&battmgr->lock);
 	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET, prop, 0);
@@ -1381,6 +1453,11 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 	switch (opcode) {
 	case BATTMGR_BAT_PROPERTY_GET:
 		property = le32_to_cpu(resp->intval.property);
+
+		if (battmgr->variant == QCOM_BATTMGR_TAOYAO &&
+		    property < ARRAY_SIZE(taoyao_to_canonical))
+			property = taoyao_to_canonical[property];
+
 		if (property == BATT_MODEL_NAME) {
 			if (payload_len != sizeof(resp->strval)) {
 				dev_warn(battmgr->dev,
@@ -1617,6 +1694,7 @@ static const struct of_device_id qcom_battmgr_of_variants[] = {
 	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
 	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
 	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
+	{ .compatible = "xiaomi,taoyao-pmic-glink", .data = (void *)QCOM_BATTMGR_TAOYAO },
 	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
 	{}
 };
-- 
2.53.0

