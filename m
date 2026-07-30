Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1D3FBEB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404111; cv=none; b=KOuqst9j74bbRTzBzUEk5LRNGwtLWAe01FJw5Lq309TyVgE31OPa02UoxM3hZtSN8jjPqhdi5QR0xezo/3bwzZNkLopDw9iYtrNoDFJqfm+AmDVwGJWlIQoHN8PDojNGdKieckyArmNf7e7RVmRxL7M8klnqEfe37TnigGhIxNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404111; c=relaxed/simple;
	bh=vkSeZ8X4pQE4BuTo9oUM7Hmz29LHol+s3w3lzRuGVuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsOBFdGZE+ug48RuldAF1rHO1USMBt38qQMvdz2RtOHE/kKFLcq/onI4omPw4ArBy25b85AvXXo2lkGrt4l10oTrlIYNMLmKxkEtl+i0XLHL5gowaL/cbSi2A0ffNEUvDP9NajeUQmPlfbq4CJD8ngNeqWSvTzdj65iApa+wCP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2akxTef; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2akxTef"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c169ae1cb26so102118566b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404107; x=1786008907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmAhfMCIo5qNxQmn+Z0q3zV1cg+1dJz7+jBwbd3a33c=;
        b=e2akxTefSdUsR532kyLVsIahDJoFfMRzE9A9ZqI6JIhTbxjgJIbvih5K0u5ly/RqoQ
         b+/LqsAtfYGjzyYSSET6FNsghOnoxFMloOLn7JSmQgeJN9NyntQY+GvVdzcLRDtBk7jr
         ETj1KHtdPw8lkWq96EryOgl031aLBvqJaHQffd62i9bHrejMfyYir3yUSacSOxFV3pp2
         ds/CZcZTL5gSY0O+ewSYlL5zuhPovnAJ281CTdFi1vNb4UAo7WTN8iloc4wOQSXjc8VH
         RCnRGKUMkfhifKnUipbqCR7sFjoOzszvvQxN6U6NjtyViHSeK6I3QKq4MPv7i0UpluRc
         tRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404107; x=1786008907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmAhfMCIo5qNxQmn+Z0q3zV1cg+1dJz7+jBwbd3a33c=;
        b=aqH3YUdLwSXTSM03DhsSul9rntItHvzx8YP9GAoWlsE2me6YJXAvfO90Vsr+WubJk0
         dKRKpAvKBSSmR9oHD4mCF3uhuRLZ8zPyO5NMQ7nUuwYCRXFT4dBvvmvsCMa3PtEPK1mQ
         ovauZzC6XJg7SfuvBF1xzpFiQmCXE0o/Qh6BiG2kGg3DSQ2ffEUDLziRy6FkoODG9I8K
         dity2Gq2JAimXuWrJVXQugedo4eYFOZKBjXMD1mauHBzc8F8G6jEy1GX0efF75w53gf0
         KwrEkEAtqNC+8fAqKC34khBUl+WDR2peiv2n9146ofrU5nJdU9KEqykpE/t48agvL1Ei
         nitw==
X-Gm-Message-State: AOJu0YyhYRrbSxnVzdk+5bmF/j4rq/GkD8dDAtHkbWycoriFSzP2Z0ld
	hwOq6JwAUk+YGzzMEpHsX9hXeZ1RPpdik3NILoWh1fVR+5qRaVQI5AF3
X-Gm-Gg: AR+sD10RoUQS2dvuaRX/flPgNRcKieb25KNZjktE5tQaMY6nlq0a9vMGVH7c8AQBpZ6
	9ixMRAdrb8fp2PAnmaa59iyIxh3fzGi8Y9H7XAoXbOwLcoxZ1Sh/PysMBzbq2nmVPNZzjrInHVw
	cLI8xGZSPHqCdUp0duQL5kQA0KWiNvxGswJj37J+/dJVY8x5MJbWTvROyurYPMAuTFH7Jiont46
	49pZbadhn5spP0ttwH+izDO2KjBc6uaTl0ighEDs0f50kYQ3YxcFHdiWejt6i2L0yGrlAzDG5U8
	hOVZJxhOBAr25FMVIxt+DFvXi57MYBpmRgBPhGd3R638EeSj2CIyQEBRbsVFy/j06OBlrDFA/gM
	W/G2ka+u7KiXzg+caNuzTNiQdTeEwWgqJ2leTMQdWBDSV6+QUIzuJGalR7lzXtnubCcSRa19QQ5
	HPivHoluJCw3BY6kBrIt6i34+IOgfh/ulfRfS26m+y1iDzxz+Haj5cMzRtcTGHD88MmnGZsaUJ2
	w+P/iRShmv7bAnbBS39GZ2ImqxwSgBh
X-Received: by 2002:a17:907:a60b:b0:c1f:e5f:4d2d with SMTP id a640c23a62f3a-c1fad038c03mr73551466b.19.1785404107470;
        Thu, 30 Jul 2026 02:35:07 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8577e78sm46733066b.20.2026.07.30.02.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:35:07 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
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
Subject: [RFC PATCH 2/3] power: supply: qcom_battmgr: add Xiaomi taoyao support
Date: Thu, 30 Jul 2026 11:35:01 +0200
Message-ID: <20260730093502.689505-3-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730093502.689505-1-zstaseg@gmail.com>
References: <20260730093502.689505-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

