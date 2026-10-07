Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0A47CA72
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376797; cv=none; b=giufJW9PXg4UzQ3NG4O6Tt1RRUtCOhBFmuDLGBN4QOa4IfGVc1NMGFpT9ekkmQ8ZVNfXByiXGQhvAJtEs6cs827vhiSiH2D4LGI6rJo07FcDqZ38qfOPQzYjl4Rpbl7o+Hbvb+7vt7m+K/FgxatUabWtPJywBqyIoHSi/lf5dyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376797; c=relaxed/simple;
	bh=SKkjNCJ5WpJDPuaHvs6nYf73O01iPRji4G+T3ENRReM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRhEPRND8eQb+xYOZyGV9K+JtJDo210iS1gFUyrS/nUeAAdO73kCqly6IjADb1QypOFmGAkDzYoFXSc5XwYhoo++IAfZ13ZqpFgrld2iCtSSvFBZNVq7PkjhCgNY8NhoZ8St1yBL14ng3x2wUCMEn4jckRkL9OQ8Z+0BpzaIlQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dax66yum; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dax66yum"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8917c712f32so574610b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376784; x=1791981584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0D8m9XO+Tesp9dJkW37XxMOyt3NKohy2e1G558ub+g=;
        b=dax66yumRhLQQVizHxWcqW2aNvGUrVL4MSE4yQASgQ1BLdEUkaAwKHMm8Bqv7Vzyv3
         cZKvZ4ZiyfqBtR0oyyAGGKec6OnnbYSQ6zqMPaA6tTeccwB+o28mYleBCg22qXJee/qn
         siz6ht89eNN44I66fljyPSisXF99N3c+l5nfLFvFyRde4VRjHlDCdn9YNg1dQn8co0+l
         10ZQdKty/G+44fRCuy4yyFRXn4CzS/vlACV7//8Khwd/QH6pbCG29SYaDo5hqvRhUpq1
         e9eaYawY1JcezC5bQ3MIobDs6Rg2j8XUGpmcjr64lqziJwT2QoUswx1s/aF0fmyC2rq7
         vaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376784; x=1791981584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0D8m9XO+Tesp9dJkW37XxMOyt3NKohy2e1G558ub+g=;
        b=XjcxNN7uOjeEm3xmCLPJhiwJH1amagowOF3QmSe+dIjI/Z3zqo4wPSTqwuLcuRMibL
         AlqNw+MqVbUEXIjH11nbgURk+WwnOFriM3ei3KP4aiKriAYNw19vC8+U4vc9BOLq/KRc
         dj1yjnPbviNRgCEoi37jH33neB488MACpOQJWm2Qf9kYd9WmNOMI/AlWs0oLL9IKICc8
         rdkDIJ+akY/UfHQHelf2ONtfIlnRNw9sPjr4kYIlKIOFLIL4mZ+AzOjXS9Ba43rCeX5n
         9tK/lx5b/1/tY4uYLe2ASK2DP3mh/ZIvjAwgdobrWcahhrmsCzMB5DXVgsTIoseCfk+3
         oZiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpTcd7M+tqJjm9E+xJR13P7AervFry+1SSAe5YFvLOI52EBHv9PIPWOm/zqjvrhEYJcY8GcfWNLAdUKrJ0@vger.kernel.org
X-Gm-Message-State: AFuF++kDOSKASkC+o00Enr2+XJlDwwcJ5hiMxc+TmRICuqXv3Og4pUEf
	FZBCkvgCPZE4Eo2UvcECTOpCJTQOaPVVFarZL5hsTqKlPNY5rbB3zq+t
X-Gm-Gg: AYBFou2x6he/IYIROm36kSUJoxS9RZaGYVloS6lgQ+z0sFqzYJgF8Yzn0tKjCOUYoXg
	QP/TK+yJBFfemJv9Twad9N3za5WOkQkJWy/1Z32Sdq5iO0eQgP6+mkLucseZGbPwxZs7nxmk1HP
	pA7ItYiOwUF3MPdkLIXOTnE/dlbbjuBRfPVRe3Q4lfRIi1xRW3mYYJV5T8+2BkCfxTSbGEef2/G
	Mc+kDcK3hOfKRREgfqJTguItXup/IXTgfXU2mOYkFfezzd9Ut/Glma9GknelfeLigiwsCxQuJgX
	swavlhJzmScol78Op/l5+ZMNYImVuOy4eNE4qVmoa1fMivQEldh+0DMacvbBffDHcamE+pAzjBY
	EgadVAGPaBHA+iQIxCLcg6/gHFz1aX5wKV7N8dMw972b1pKJQ1VYUKqjPNoqQ1fWl0WpGZEVf5l
	fElAyoBUhDI66D2TjANfO9BgPvgDS77Gb2GEiW6/Ldo8ONMDVqFAnjmiJEnZTeguxuvI4xZtJw9
	CjgT2NSJ32Eaw==
X-Received: by 2002:a05:6a00:928c:b0:886:458a:42e9 with SMTP id d2e1a72fcca58-891b5fc2e55mr1813898b3a.49.1791376784232;
        Wed, 07 Oct 2026 05:39:44 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89189cdeed2sm1349565b3a.51.2026.10.07.05.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:39:43 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] power: supply: qcom_battmgr: Allow setting the USB input current limit
Date: Wed,  7 Oct 2026 21:39:39 +0900
Message-ID: <20261007123939.1679-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SM8350 class USB power supply reports input_current_limit, but does
not allow writing it, although the firmware accepts
BATTMGR_USB_PROPERTY_SET for USB_INPUT_CURR_LIMIT (in uA).

On a Kaanapali tablet connected to a PC port, the firmware keeps the
input limit at 500 mA, which is less than the system draws with the
display on, so the battery discharges while the supply reports
"Charging". The vendor kernel sets 900 mA on the same port.

Make input_current_limit writable and pass the value to the firmware.
Handle the BATTMGR_USB_PROPERTY_SET response like the other set
requests.

On the PC port with the display on, writing 900000 raised the input
current from 494 mA to 891 mA, and the battery discharge current went
from about 540 mA to about 120 mA.

Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Legion Tab Y700 gen 5 (qcom,kaanapali-pmic-glink,
which uses the SM8550 path). With a USB PD charger the firmware keeps
its own limit and the written value is not reflected in
input_current_limit.

The value is left to the writer: userspace, or dwc3 through
usb-psy-name, which sets INPUT_CURRENT_LIMIT from vbus_draw. The 900 mA
above is what the vendor kernel uses on this port; the gadget here is
high-speed.

This is independent of "power: supply: qcom_battmgr: report the USB
type from USB_ADAP_TYPE" and applies before or after it.

 drivers/power/supply/qcom_battmgr.c | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 7716eb9e1aff..12692de7f982 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -1065,6 +1065,33 @@ static const struct power_supply_desc sc8280xp_usb_psy_desc = {
 		     BIT(POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID),
 };
 
+static int qcom_battmgr_usb_set_property(struct power_supply *psy,
+					 enum power_supply_property psp,
+					 const union power_supply_propval *pval)
+{
+	struct qcom_battmgr *battmgr = power_supply_get_drvdata(psy);
+	int ret;
+
+	if (!battmgr->service_up)
+		return -EAGAIN;
+
+	if (psp != POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT || pval->intval < 0)
+		return -EINVAL;
+
+	mutex_lock(&battmgr->lock);
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_USB_PROPERTY_SET,
+					    USB_INPUT_CURR_LIMIT, pval->intval);
+	mutex_unlock(&battmgr->lock);
+
+	return ret;
+}
+
+static int qcom_battmgr_usb_is_writeable(struct power_supply *psy,
+					 enum power_supply_property psp)
+{
+	return psp == POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT;
+}
+
 static const enum power_supply_property sm8350_usb_props[] = {
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_VOLTAGE_NOW,
@@ -1081,6 +1108,8 @@ static const struct power_supply_desc sm8350_usb_psy_desc = {
 	.properties = sm8350_usb_props,
 	.num_properties = ARRAY_SIZE(sm8350_usb_props),
 	.get_property = qcom_battmgr_usb_get_property,
+	.set_property = qcom_battmgr_usb_set_property,
+	.property_is_writeable = qcom_battmgr_usb_is_writeable,
 	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN) |
 		     BIT(POWER_SUPPLY_USB_TYPE_SDP)     |
 		     BIT(POWER_SUPPLY_USB_TYPE_DCP)     |
@@ -1558,6 +1587,7 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 		break;
 	case BATTMGR_REQUEST_NOTIFICATION:
 	case BATTMGR_CHG_CTRL_LIMIT_EN:
+	case BATTMGR_USB_PROPERTY_SET:
 		battmgr->error = 0;
 		break;
 	default:

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

