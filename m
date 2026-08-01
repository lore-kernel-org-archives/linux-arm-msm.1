Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1786C4195A7
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571261; cv=none; b=aUHbuYaI9f7KaI0/yoOHHJW2VJWX75D7Hbpn/nLXQaPFy1RNBzdmp54SYr8wpOAspXzO6GcNyKy4Uz20GywOftZuhRDgx8yESczlAltDZXWENQ2nYMkLc2UAAfN2r45SQcBkiI5AWKKmrNfBTNsd+OrZZQSgMdWg7Ly62vnNbgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571261; c=relaxed/simple;
	bh=9a1uHJo5Y96F7ImN6IHhzX3B9F4F4g1x+tq0aKtf+h8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BLoCTjw+agfQikMjRAd5pSUELEU8FkXiF7WaEVVOeJIRy4kAN0MvrygBUMyjhRMj/df6occIwhlncIkHQOj4tKRhEe7sDblBhD3JujREgWyzlK4m8CrETrbZDxctfRtZAfisWryj+Bzl7nEMN2bQq+c52ByUyhsLZouG4ZnygOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwN9QaiW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3Ng4N+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwN9QaiW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3Ng4N+k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713MLBt1791978
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 08:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcmVta0Pa8sSmmUXmFPYxHNkHuCXA+xs6KwVmk1GcFk=; b=OwN9QaiWwC0aAfZ/
	Puh3B5VLtBjVUFnA3xvFOcM5aHsRGtkjBM7wxepxHd7L2LqwN4d1VqZpbZK4selO
	ex9vOuY3ih543LoVG9EHPurRHSBAvbGTbrPnqNjWAuYRwzmQE42G5ma5mxqK9Yxh
	8lJ3V/VCJwMONoCAJJXcxewNMzddIZalSk4AFux7ECXVgyKjDr6sfsK+CE0l2QGx
	CJySWTszBv/wQfj9f9WB5ocaP1fFdO/r5WdPM02CEDzPxZzEkkN23O+udiNwRZK0
	lUm1PlydOb36Nv7CJhqhj3qkOSFqYa6DzcURivwbx/bqriFqGvxuv18eUcUG+H66
	KR9R+g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u98gre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 08:00:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1388495a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785571257; x=1786176057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcmVta0Pa8sSmmUXmFPYxHNkHuCXA+xs6KwVmk1GcFk=;
        b=B3Ng4N+kFJPdMKLF4HGu+3XUhlIJR/g8IbU43znkUV4AJNV5QhypYgaAyKPgTGbGDJ
         ryWPLby2kxMfWqNCm9Vgv1AIkFI99Ay6/fy6b3eBGdUqlR9WutgPifi6mwUDDkNGZkOg
         +a+z2RgcjoWhsPigyEFYxnTCoZCOL9wnU6DyUhYy1Ylo2bsNUb9b3yKgeB7P8gHGexQ0
         og52AuipO8mW2XTfnQkUUGCpxC7Oeq4npMerJNJ42kAahny3RlSa+6xBtDS36kANq0uf
         1PKj0noBdGbcVE9BF8ipnUhbsTaNF0cKKxW1w6KKz3DDKD9/vRxtKTKgE0VOR7jDPAFq
         EjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785571257; x=1786176057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcmVta0Pa8sSmmUXmFPYxHNkHuCXA+xs6KwVmk1GcFk=;
        b=N6P8N3AdX/sYfmE7OLMeltspYoVuO3G4dhuqrXmMWep3aQMdw6YyUKko0ZtyU4dLxQ
         chV/16FHneGI4x1toCnskh95k8rZieNeI2A9iHnP0exvc38TRJZEKWFkNY7Uc4GWCzxa
         dJqiSMKvFzr8XVgGYO3XKDYiEVAYtzCA5xBfDL9kaHShxgGz2HaaCWy/AFrcvyBtMtq5
         b3yWUOPqhjf3vuhdgKRVdem+TCS62Suq8Vrkfp+Qyeo+jO2ceZgkpCD+sASC0rpKErmh
         ODMIkY4jtyjaNkDJ+shZNtoHW8tVhy0rpO3KP5Cu1+e/ya2QSPcOnOS+PeljvHSvaPFG
         OcRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCWLNrJj2vJ/4sVPurFAmlVDy5gNod41iHLqRvd1TzrbKP3+zDkws6J09DusUTq+/LtMf4L5hfrUXyEgPX@vger.kernel.org
X-Gm-Message-State: AOJu0YyEaH/5t0Yap94RaE3GhAs1aHq+EKOJYHA1FIQSK8uE9sWhAedZ
	pUY6AgHNRGNkDHj4LRa8r88RB8KX49WkAnmLaXuxLsb1w+eS7eUaqNlr2ZUpm3lKTakT+NZQy7Y
	bQ53EeXjfF4Hl5eznHaC9OGxPnoXhFLhXx5ByQKIWcClktHtwh6+/5CS1axknoW5A7jYx
X-Gm-Gg: AR+sD10ItGwiQcySFuI9VJgCQFVJEke1VW2tKTkXonFZ3qmb/9aQAtVtJFH9iDxpMwL
	9WkEGA1WwSzwOVPFh+gNxSOk/Pp/AYozjksuhsMhMtpGeeIDph7hT4Hpg+1NuDE4Q9z5B09aOZw
	k1noBrNn2W79KNddabnpaCwI14fRVAzzP4kvJYjbPwgCve1o5irZh//ACi43yz85aJ6qWjB0+5O
	2dp6c347XWdpKp9AT4snxhh9AI3cFxLcR+JJNTkkrSoENiNhdlwQXE5eMN98MWvCaNGPJOOnQs1
	o3+K/xuIunY0240Q992MsypmdiNa0AgxMMu2fNVkZ4n0K7Wh+FvOTjnFmcTZKcoqzTOykHYIWwa
	x6wjuQ5quiq8UA8Aen8fAcW7tX8A8cg==
X-Received: by 2002:a05:6a20:9146:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c92a99a4d4mr2520741637.74.1785571257283;
        Sat, 01 Aug 2026 01:00:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:9146:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c92a99a4d4mr2520713637.74.1785571256778;
        Sat, 01 Aug 2026 01:00:56 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm24739838eec.28.2026.08.01.01.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 01:00:56 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 13:30:29 +0530
Subject: [PATCH v6 3/4] regulator: qcom-rpmh: readback voltage/bypass/mode
 set during bootup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
In-Reply-To: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785571241; l=5923;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=9a1uHJo5Y96F7ImN6IHhzX3B9F4F4g1x+tq0aKtf+h8=;
 b=veC3v+M6OCgPq4KfmCTmLV/tyt14UfQOc94WUss4+rCGr/3nwa/C1QEdchyDWUamdb8qS1CH2
 63lrg0iSRPcBfG3tpYSsPFnI/d7B6eZNgvZ2e4HMh50VBw8WYjVnwR0
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-GUID: gOAAo1Yh5SZJs9LYeZS7IC7FjFHT0klk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX0g2yIRW8qXot
 S9cNRhJGpqvDTNqCK6XMszE7ifFVtugYSrm75EpuGQD6P6T4NIvffq/LGDNzEVeCnAfjGhG5P+5
 KXk0s4TEPYtn0bEy8MLlGUOoawnd3k7aqHiZgH1JIaKQe9k/JsEzGHnA4kSHvAnPuTLZa8VZ+Tm
 LlyxkZGn1kj97vf18zF+PUfeqMgQ65es0fJEP2uXL9IkYJG7Lx4+WVljK1h6OBP0+StKbFx/vbA
 JNxz4V247/05cwaAvyUT8KXoE9rtc17vkS6IURS3VtmMH2MMLsN0sSDwuCAAABJdGENwjS9lQJq
 d/w6X5HnHwfeujsLSVXtL3Oc6Zgs2NTKFrw0nXvlIkVJulSM+d6otUo6eNN3r8l4PB2IBhOAAZr
 CGam+CUNj3FenEuKHxmrjrRVCFPQvwDNHeUX8zok8UbNbmClgsZHE4mEh/Vu2zKx0UcJQILTePp
 HGArNmTAMgy40OohH/Q==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6da7ba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kSdVqfX7IcrkJ3FduXMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX1Bn/1qtbeF3y
 3ioCAfgLpLNs94uVU+z/ByDc2RgXk7cw6NSPunG2mWyfuhZLAyPn7Qi8/krdcfuZ93jWf5/DEAf
 Tmpnm/u4z2pHnPESnc+TCpJEkOu4OHs=
X-Proofpoint-ORIG-GUID: gOAAo1Yh5SZJs9LYeZS7IC7FjFHT0klk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010057

Currently, during regulator registration, regulator framework sends an
unnecessary `min-microvolts` request for the rpmh-regulator device. This
happens because in current design, we do not have a way to readback the
voltage settings that was set during the bootloader stage.

Fix this by using the rpmh_read() API to read the regulator voltage
settings done during boot and make it available to regulator framework
from the very first read after the bootup.

Also use this API to read the mode/bypass settings as well. This will
provide the regulator framework a sense of the initial settings done by
bootloader and thus preventing any redundant writes for any setting post
bootup incase the same setting was already applied during bootup.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 120 ++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index c47dc9f92279..77d402ee6bf6 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -4,6 +4,7 @@
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -61,8 +62,13 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
 };
 
 #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
+#define RPMH_REGULATOR_VOLTAGE_MASK		GENMASK(12, 0)
+
 #define RPMH_REGULATOR_REG_ENABLE		0x4
+#define RPMH_REGULATOR_ENABLE_MASK		BIT(0)
+
 #define RPMH_REGULATOR_REG_VRM_MODE		0x8
+#define RPMH_REGULATOR_MODE_MASK		GENMASK(2, 0)
 
 #define PMIC4_LDO_MODE_RETENTION		4
 #define PMIC4_LDO_MODE_LPM			5
@@ -248,9 +254,34 @@ static int rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 					selector > vreg->voltage_selector);
 }
 
+static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
+	};
+	int ret;
+
+	ret = rpmh_read(vreg->dev, &cmd);
+	if (!ret)
+		*uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
+	else
+		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
+
+	return ret;
+}
+
 static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	int ret, uV = 0;
+
+	if (vreg->voltage_selector < 0) {
+		ret = _rpmh_regulator_vrm_get_voltage(rdev, &uV);
+		if (!ret && uV != 0)
+			vreg->voltage_selector = regulator_map_voltage_linear_range(rdev,
+							uV, INT_MAX);
+	}
 
 	return vreg->voltage_selector;
 }
@@ -336,6 +367,22 @@ static int rpmh_regulator_vrm_set_mode(struct regulator_dev *rdev,
 	return ret;
 }
 
+static int rpmh_regulator_vrm_get_pmic_mode(struct rpmh_vreg *vreg, int *pmic_mode)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_MODE,
+	};
+	int ret;
+
+	ret = rpmh_read(vreg->dev, &cmd);
+	if (!ret)
+		*pmic_mode = cmd.data & RPMH_REGULATOR_MODE_MASK;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
@@ -540,6 +587,73 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	return 0;
 }
 
+static int rpmh_regulator_determine_initial_mode(struct rpmh_vreg *vreg)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
+	};
+	int ret, pmic_mode, mode;
+	int sts;
+
+	ret = rpmh_read(vreg->dev, &cmd);
+	if (ret) {
+		dev_err(vreg->dev, "failed to read ENABLE status ret = %d\n", ret);
+
+		return ret;
+	}
+
+	sts = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
+	if (!sts)
+		return 0;
+
+	if (vreg->hw_data->regulator_type == XOB)
+		return 0;
+
+	ret = rpmh_regulator_vrm_get_pmic_mode(vreg, &pmic_mode);
+	if (ret < 0) {
+		vreg->mode = REGULATOR_MODE_INVALID;
+		dev_err(vreg->dev, "failed to read pmic_mode ret = %d\n", ret);
+
+		return ret;
+	}
+
+	/*
+	 * NOTE: Since BOB4 BYPASS_MODE value = 0 we cannot confirm if that BOB
+	 * regulator has been sent into bypass mode by bootloader or if bootloader
+	 * just has not requested for any mode voting. Due this limitation, we
+	 * must check if the read pmic_mode value is non-zero before comparing it
+	 * to bypass mode value. This also is needed to avoid setting BYPASS status
+	 * for LDOs which dont support bypass mode, and have the pmic_bypass_mode
+	 * uninitialized value as zero in the vreg hw data. For such cases assume
+	 * lowest mode, if pmic_mode is zero, to allow for mode voting.
+	 */
+	if (!pmic_mode) {
+		for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
+			if (vreg->hw_data->pmic_mode_map[mode] >= 0) {
+				vreg->mode = mode;
+				break;
+			}
+		}
+
+		return 0;
+	}
+
+	if (vreg->hw_data->pmic_bypass_mode == pmic_mode) {
+		vreg->bypassed = true;
+
+		return 0;
+	}
+
+	for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
+		if (pmic_mode == vreg->hw_data->pmic_mode_map[mode]) {
+			vreg->mode = mode;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_INVALID] = -EINVAL,
 	[REGULATOR_MODE_STANDBY] = PMIC4_LDO_MODE_RETENTION,
@@ -1838,6 +1952,12 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 						vreg_data);
 		if (ret < 0)
 			return ret;
+
+		ret = rpmh_regulator_determine_initial_mode(vreg);
+		if (ret < 0)
+			dev_err(dev, "failed to read initial mode for %s\n",
+					vreg->rdesc.name);
+
 	}
 
 	return 0;

-- 
2.43.0

