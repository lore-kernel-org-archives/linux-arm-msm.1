Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491380;
	b=zFyUqXea5sQAkCyI+W033gOLg0trYPV1OuD4IUvD6KzoYh/egZUP2cM7Iqel59UW6p7l
	 eh2L1kPNIumHHUwoAmXkHd8d1T8jZhiHw1kKn2nzBJI9C7R4Uc5oqdPNjVHkmPUpGzLLG
	 LULgbNVAlzweTojFMRmGmAS2XnGfgQd4ioLaSQuSksDLkptgrs5qIk7Dv9PKGLw0/PAP3
	 VE4sr/2DoPL+5IloGfQXN7yRW+R1Ls0qHN70jn+h2x9E3VWKTzVLlNKgp2ah7W1iXWe3r
	 JGKaxbjCKoINow8T3Zv6XLJbiAaaUODJ0kyef/HYYIzVSlg4lCbnez93Tse995ilIDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8J3SUwGBwfavLf/E2Ow5B5AwEe3aXOGkxMOfu/9pU4Q=;
	b=HKKEOPQREzZ74NBj1ozsFnwBa060KrDSUjS+6uBDJ+popQKbd/of72cQwwVeu1x6zM4f
	 ECaGdTulVZxqKrgBAy0wt2NaSyY1QmC7zBsElIUfFcuaoFEZMYB/icc3JNN/XVgJvru0j
	 y3K7ONyhTr9wjr0syrsP6CQLDn7P6ADaHY6F4IfKi8WaXilwYCdMnipPYZrfXqw3fP4Tl
	 3ImJotQzz4d6X3S1FCc3nnKFkEynCGto4r7v173wOgGuzHDIIvMJDZYWx9CVDwjzOK9VI
	 eYFZ7IbQe6vGmAeb2YAGH9laLCaMfknW0418hy0joI2cWJyjuljHf7bRFoUOrlH/l4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzUD2sS6;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60618606A8BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60618606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzUD2sS6
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3512736b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491379; x=1795096179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J3SUwGBwfavLf/E2Ow5B5AwEe3aXOGkxMOfu/9pU4Q=;
        b=JzUD2sS63ujpPtYga16vOf0Cu00MlBCD1ByXjWfdL08/dNnd94+SA2iZs0aQpVTm4h
         +6RFMiKpt4eq+Vozhcj54rW9dvwLM50HRyubo68BRB/Z5fTVPhtP65kvgr+77bGPVFIx
         Hwl+ERKpsRh+hsQ2484Go8J8PLvyqZzs4fSJfaizy7HUbFscH1dDciZA46RoXQQ3GQpm
         IAZRZtl7TySsmfXGkKusqMB92CAL8q2tU1wXvyCCsN+2WxoaHTIYO30ULgIva65WKfgV
         dtmwxR6UQJUmiPw2MeYzQf8MzhyV6uouxOlrQRLIjC7Zg4638Hf4fkqmaPQwBItQq3Nb
         1c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491379; x=1795096179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8J3SUwGBwfavLf/E2Ow5B5AwEe3aXOGkxMOfu/9pU4Q=;
        b=di1NOBa6cHGAKJmJbKSPEPiCoDM1bnh96R5s2afYwoBYck2wisMHV4a4Jo+DFsFJfB
         hhDumNL78D/1kJ6rg3h4Hv0DvI6qcSWuhW0n9TntRTI1Do5VH0fwCbOc60a9ckvl99/Q
         9hJ1YbqCB7VT2j+cABuSmWCi2ZacpgYOBn3lyZr2t3Ca8KGtJiQWPET/+2v06We/iH3W
         Zuj0TVDnNOprL+tKE8dWaGOKng8nhDpz+/m5+6yhbFt0jzk7X63twEJR6CI1XTfjq9i5
         jAu0yzFvlmoC7lyDvS8bZcFdfhk6KfYbLpXzsIGfupvbpk0Ueqif8OLkrY/2uL3QVFr5
         weoA==
X-Forwarded-Encrypted: i=1; AL+hErEOQO2Jqb0sego9Dw8gbGglt46Hx8GT/wjTzER5mOBl675ha5zJHmt7k73wu1P8kr2uxoEMOTKLZ7GPygBq@vger.kernel.org
X-Gm-Message-State: APuU4Z/wgp/zJe5hhfz5N6dbzY14il9MB6KtBj12pBlsAufe2AnfU0Gx
	+UGlYDttCsI8aC1ZINxiRGRrCLWav0NDcQ/pe3L1HsCXRoORjbxk5EqY
X-Gm-Gg: AYBFou364pYecmh/MViOCnctztYWJx+TCegxif8Jh/shBhV2Ua/+mw2eeamnmsf4uK2
	aI5vkhGgDe8fRDoKou1zsBfuUawqRd3Rd78VL+6cZzFlbQ8jFeaihHFObvks3kPAxJ7WgcVXHQW
	pK69FGg/fYRNQvowdEABy1iUUNplCIU+K57hgZDjn2FZDIFJBZ37E2sN1LyCkUQJh8k3ad3oQoV
	G+FLT3aTU1oo3g5oLHFef5dRqU8Tvq6RBDTGN8rMjh53c7VQwPl6tf8gVkDuqjfDLC7sYk4qUoO
	5NcVSHB9EEUXYtx0i0/5XgRHeiAUz3CBFHsuJqbRykxygBuUIGo9+wIFTxC4VVZoDsi6QncfEpt
	w3AXN9Lxm6vZVPr4F7jlLxB5jyuyy5QKcfrObrqVX4Xhu+4a/H8h7SXMdMcRjf5pE5sxlYC1qeD
	an5GxVouCxMfY/D0KizeT8gLZMXyJ9LjP3UK/HYcNyWVKIzFbCuRPBJTTmrMbOZjc/kuBUA7ZUU
	MLiKlMHbPcDsutYMVyVwiQmNHf0JxfYaVgqX8gG7zJg3qrEPGcmicREyBO2k1wsPrcTsGH23JNY
	OV0vkf8Zt6FAeVfNFvv++yrTXgQR5DN6hI+cUcHjCVc=
X-Received: by 2002:a05:6a00:178f:b0:89e:3ccd:b3c7 with SMTP id d2e1a72fcca58-8bc1c1ad822mr5507356b3a.33.1794491379406;
        Thu, 12 Nov 2026 05:49:39 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6c51sm3550580b3a.14.2026.11.12.05.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:49:39 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] power: supply: qcom_battmgr: expose the charge current limit
Date: Thu, 12 Nov 2026 22:49:27 +0900
Message-ID: <20261112134927.95-3-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261112134927.95-1-26rote@gmail.com>
References: <20261112134927.95-1-26rote@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The battery manager firmware takes a charge current limit in uA
(BATT_CHG_CTRL_LIM) and reports the highest value it accepts
(BATT_CHG_CTRL_LIM_MAX). Expose them on SM8550 class batteries as
charge_control_limit and charge_control_limit_max, clamping writes to
the maximum.

Also handle the BATTMGR_BAT_PROPERTY_SET response, which was logged as
an unknown message, and return its result.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a 45 W PD charger,
limits of 500 mA and 100 mA give about 480 mA and 90 mA of charge
current while the PD contract stays at 9 V. A limit of 0 stops
charging, and this firmware does not resume when the limit is raised
again until the end threshold is moved below the capacity and back.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2:
- Use guard(mutex) [Konrad]
- Return -ENODATA when the firmware reports a zero maximum [Konrad]

The downstream qti_battery_charger driver also writes this property in
uA. The thermal mitigation series [1] took a cooling level in
charge_control_limit; Konrad pointed out that the ABI defines it in
uA [2], which this patch follows. Only tested on Kaanapali.

[1] https://lore.kernel.org/all/20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com/
[2] https://lore.kernel.org/all/d99447c8-f140-4ac1-85e1-a235c37eecde@oss.qualcomm.com/

 drivers/power/supply/qcom_battmgr.c | 55 +++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 58e103e08..1c3cd034c 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -262,6 +262,8 @@ struct qcom_battmgr_info {
 	unsigned int charge_count;
 	unsigned int charge_ctrl_start;
 	unsigned int charge_ctrl_end;
+	unsigned int charge_ctrl_limit;
+	unsigned int charge_ctrl_limit_max;
 	char model_number[BATTMGR_STRING_LEN];
 	char serial_number[BATTMGR_STRING_LEN];
 	char oem_info[BATTMGR_STRING_LEN];
@@ -454,6 +456,8 @@ static const u8 sm8350_bat_prop_map[] = {
 	[POWER_SUPPLY_PROP_POWER_NOW] = BATT_POWER_NOW,
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] = BATT_CHG_CTRL_START_THR,
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] = BATT_CHG_CTRL_END_THR,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT] = BATT_CHG_CTRL_LIM,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX] = BATT_CHG_CTRL_LIM_MAX,
 };
 
 /*
@@ -709,6 +713,12 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		val->intval = battmgr->info.charge_ctrl_end;
 		break;
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
+		val->intval = battmgr->info.charge_ctrl_limit;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX:
+		val->intval = battmgr->info.charge_ctrl_limit_max;
+		break;
 	case POWER_SUPPLY_PROP_MANUFACTURE_YEAR:
 		val->intval = battmgr->info.year;
 		break;
@@ -803,6 +813,29 @@ static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, i
 	return 0;
 }
 
+static int qcom_battmgr_set_charge_control_limit(struct qcom_battmgr *battmgr, int limit)
+{
+	int ret;
+
+	if (limit < 0)
+		return -EINVAL;
+
+	guard(mutex)(&battmgr->lock);
+
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET,
+					    BATT_CHG_CTRL_LIM_MAX, 0);
+	if (ret)
+		return ret;
+
+	if (!battmgr->info.charge_ctrl_limit_max)
+		return -ENODATA;
+
+	limit = min_t(u32, limit, battmgr->info.charge_ctrl_limit_max);
+
+	return qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_SET,
+					     BATT_CHG_CTRL_LIM, limit);
+}
+
 static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *battmgr)
 {
 	int ret;
@@ -838,6 +871,7 @@ static int qcom_battmgr_bat_is_writeable(struct power_supply *psy,
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
 		return 1;
 	default:
 		return 0;
@@ -860,6 +894,8 @@ static int qcom_battmgr_bat_set_property(struct power_supply *psy,
 		return qcom_battmgr_set_charge_start_threshold(battmgr, pval->intval);
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		return qcom_battmgr_set_charge_end_threshold(battmgr, pval->intval);
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
+		return qcom_battmgr_set_charge_control_limit(battmgr, pval->intval);
 	default:
 		return -EINVAL;
 	}
@@ -995,6 +1031,8 @@ static const enum power_supply_property sm8550_bat_props[] = {
 	POWER_SUPPLY_PROP_POWER_NOW,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
 };
 
 static const struct power_supply_desc sm8550_bat_psy_desc = {
@@ -1618,11 +1656,28 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 		case BATT_CHG_CTRL_END_THR:
 			battmgr->info.charge_ctrl_end = le32_to_cpu(resp->intval.value);
 			break;
+		case BATT_CHG_CTRL_LIM:
+			battmgr->info.charge_ctrl_limit = le32_to_cpu(resp->intval.value);
+			break;
+		case BATT_CHG_CTRL_LIM_MAX:
+			battmgr->info.charge_ctrl_limit_max = le32_to_cpu(resp->intval.value);
+			break;
 		default:
 			dev_warn(battmgr->dev, "unknown property %#x\n", property);
 			break;
 		}
 		break;
+	case BATTMGR_BAT_PROPERTY_SET:
+		if (payload_len != sizeof(resp->intval)) {
+			dev_warn(battmgr->dev,
+				 "invalid payload length for battery property set: %zd\n",
+				 payload_len);
+			battmgr->error = -ENODATA;
+			return;
+		}
+
+		battmgr->error = le32_to_cpu(resp->intval.result) ? -EIO : 0;
+		break;
 	case BATTMGR_USB_PROPERTY_GET:
 		property = le32_to_cpu(resp->intval.property);
 		if (payload_len != sizeof(resp->intval)) {
-- 
2.53.0

