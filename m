Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DAE4EDCC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972116; cv=none; b=HEPfeyvgbMsyYpo6T119/NQ1uZ7ejs+1GmrXOwPn0d2ztbCLNySmkmwRxa1kz9+ggDMluwV3MDnXrWww/cLht0x2NPSnuVGbsXTKhxOpJgIRHlmhmQ9oGSNdrxkqpTzmy8HsLN+TsBd3orJgGfxT1/AFQejLn/YOCdsm0TIUhTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972116; c=relaxed/simple;
	bh=ON+QgnIKwGv2LBQprhlnNPZIE/Pvu4pYiUPxZ8R4eWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJqx0QVHa7st1hwYI2TtJzJDUPAPOtrMPTl6jkD4JNetk1ec50qZxXAiL38nt5WQBPfRtx3FsWDLGdKNUQft9HDuo/qWREq5Hj4Ti3VCr3UFCrGzzCxjLcwXCvP+gf1oW52oom9Qx4SLWWo/u1mpg3mB8PJ6Ct12F+IOvVvpfBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJq3j6ql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnP/iv0U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJq3j6ql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnP/iv0U"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7iBir3018180
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KYAhXRWm3xzZ6SvXn/ll2PlfSnw2KKlCGr+A3e5vs6Q=; b=FJq3j6qlONCdGMPC
	GxPx+vBTE26jjoEiWTDkcHMKPG9XrwRYJT2B4Ipg+Gz0f5BCmvRTSjbR2wkuZyCY
	R6Eb8n1ZJlc79xQvBlA1k906K0ZeevTEoya6piwIHKs+uSNn0IY40j86PUYngLCt
	rYQH7CkyYyLBIysAbWznzydsHxSvg0N3RcdikpM8smu8yx+/KRR2nYTyTVZEEaNF
	y8frk1Ub/ae2mIuyEVzn1l17fzadqJmxKAw2TxOgUO5jT+Ad0k2i4EGcvJnaVJtb
	rQPydkDt5rO8EC5JLidaNCXAKuNmNe7rXu++ORqSPffFnPLDxBMq+Lh41JysBJhS
	3a7jjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3qfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:01:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so27807085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791972113; x=1792576913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYAhXRWm3xzZ6SvXn/ll2PlfSnw2KKlCGr+A3e5vs6Q=;
        b=DnP/iv0UWrnkyyxSohNEbpTcolNqqiyL+9rAMfyyKmH7Coop3P+uRZbsP8xOGbTchQ
         RigKL53544DN1DGZuL6isuMUcifXxqFxWQzRRoqAI83igcI//8vjYQ3hS2WVIZQIajWr
         GS9TLW1kUcXApdApu/e+6RXnkk5lkcRz4Sq75kC55DeOFihsinOVgIEThI6zptMqxBwX
         DL0ZE4xUyLwQ4sFmBHvTO/cURt8IwVR+raV265AzxUq1X/g9f4/C8Zehog7KUnxbc0fM
         0m7zTRtVZplLZ8w1ncstEFkItzyMQo2KTot7l51ULoLEbTrWUpMaTUS5w9l16f0+J0nn
         eofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972113; x=1792576913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYAhXRWm3xzZ6SvXn/ll2PlfSnw2KKlCGr+A3e5vs6Q=;
        b=JeiSjx7RqGtHfsBT+X1dCH7bqBDAIgTJc9ljspeNB9gaCxm9zzaGpA8oOtR6681Vst
         WpKC5zt7h8lE4FqBsVtf9RUZeEsydXNKLW5u/t5df8sWWB7YyGfW9H/PtcRn+2YBIw4r
         G4RznVKVTWVCf9KW25LT0S7TWgHs1r7KqptsECg6YE0D3rz1Xq9cMFYx1uvAu8bpv4yx
         7e9lhjbh2f+XOW7SimcAcNfZgt/4Hg6gD7NLpmDtXtH+Xo6r6d1QqJGi9x3gEH8i5Poz
         2ThEosO5GyRqpxUrzz85TOdt2UZ0LJmgkiQFS2Mrp+AnjPWadFw5rjhmYI9HF1QHV0qU
         czSw==
X-Gm-Message-State: AFq9FYKStPRO9wqvwvQgJWEon9p7hhCa+DjOr6XIc1W49YY8vFmtZoJq
	xGfZw6fDUKsAnip21NtL3JUJcStIdONAduhR/TIzyAomib9VWEfQJrb9ZJvmROs6hc2ZQ8P6ljS
	s7CIuzrtq+/0yGdXpmVA8Kt0uoq7ZSQeAU08563KA5CIZ/60zOeQahvA7/jPLu1CXIkgU
X-Gm-Gg: AYBFou13YcK5mZAi0aCvGgpXuV1zmBXlntwCZSptVDWWD0me1SfscnE3l0eIFNjT8Ou
	eKB6LtNXVeuzESTChUVApCVTdjAuiy7DIzygYVBP0+hslGI40/4wfO0ubCaz5/+q7lNbwct/Zhr
	77by9CTbaMlmC9I62X+5EH5g5JDi22umuEetiCxVQlimiU1ql2MsLhpLFbru3iEtTINTiPpE/R3
	bHaPSawxykXZuVE/DPEOWoGnuI4+FwF4YJ8TEIBvsqGCdhc0Atm2s9eO3ahoO8gPHf6r9ehyhiU
	1DVZeNSYy+JAZy1toGHEkK7xBE7Wjl2HXfAckefyarj7AOB8whBb3+tPdNBYvDVDZ77lWdYnG3F
	JtSCpQQ2lCLcFblugln4rEJ/ru36k
X-Received: by 2002:a05:620a:710d:b0:93e:5daa:67a4 with SMTP id af79cd13be357-93ebd225a6cmr2461670385a.29.1791972112721;
        Wed, 14 Oct 2026 03:01:52 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:93e:5daa:67a4 with SMTP id af79cd13be357-93ebd225a6cmr2461664585a.29.1791972112146;
        Wed, 14 Oct 2026 03:01:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm10382169f8f.54.2026.10.14.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:01:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:01:35 +0200
Subject: [PATCH v16 2/2] phy: qcom: add the SGMII SerDes PHY driver for
 SCMI systems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sa8255p-eth-phy-v16-2-6310fac52e85@oss.qualcomm.com>
References: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
In-Reply-To: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5465;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ON+QgnIKwGv2LBQprhlnNPZIE/Pvu4pYiUPxZ8R4eWM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz1MHAVazZYoE2TiG6gs1bRbgZBj6JGjuOEeQC
 gCh7o4LJw6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9TBwAKCRAFnS7L/zaE
 w0rDEACoUeiI/sJkNp/JFUpE23fY4xnozNxVk07bI7l1ltFX879BSE/i2T77cjqvAey5B3IdM7o
 3+AAe0vSaQfvtl5PuUGp8Cg58+Q7/nRnyniNQ9dDKUpBXYPaceGGqC4wsWifgfIVpFo3CJfMuG+
 /rSQ3wRs2QAiN6bVzWsi0yZYQ49rh0pm5QTotSxBxsZvPgFblO5F4sYYgEO/biJaN+6HUeUfbtT
 xBo7cWH8ZyoOmQWPFxbg/qeVux5Jzt7Sv/9e/TL7QqmMxjAdX1AIQ9mH2fmUFC25AKwZJtt7bGi
 t86KbmJkr3M7WlXB5XRWoBpJ9Nl2nm4pgkdhFAjyyLMiHuhbuuvqYUSp5i/a1cLrojAJ2NTAXH6
 LZyy2W9i4hyslZbwwzZFbBNuoWjqx2cy3QBWe39Xf64kvuZ3zz6u7Vf1A5+OaNWmChAtdDsZtHO
 s+5IhvEntlWi0CZ79CGSeUC3OkAHpaLCoCAQGUtKxt22Mk2n6FkClNmVwY6AxuxUjwIAoAEp9zW
 PLJS82Yc1euQbl7JXMZglOMZLiX2rhHGuMz7jB1H7jkAQsSTlIMNOYROj0I+AE+V9Gh82VgXXcf
 a9tIOmUuX0WuPmxqzqknrBm2E2n9O3gNustyYxU1nxSJOYaMfOIkoW4QmJYiwt2r8zRikKD9RNd
 lD/dsDZ+xrR+KkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf5312 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hTw9fJJfFBl441PWpkgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aNCcMi3dHeOz35uVxPOTJIFOuexZL7Up
X-Proofpoint-ORIG-GUID: aNCcMi3dHeOz35uVxPOTJIFOuexZL7Up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX7FunIZErek0W
 ManLh3tnKHstgAVmExzhYPAjnWyHeCU4IYO5KNHABjLiMRrCZcF1osA7jhNsfxyshZzvhWFpRdw
 2y/3FA5lZmI6W41r7Wf2E83BqkcGqP4Vf4ZccBcGbkgpC+HIcuQ0RVmIXYBUF29oButuWxFw5bO
 Rn6ECa9FS42eLjh5zCOEi4mDwpZZcRX1ojfBPeKId9tNYvakVew+1L4ZA4MUBM9F5fx3NGTrVeJ
 BfYlkQLU5aHu5T+ZflKN1TxV89fAuYpPXY4EGaJ+xhxjLlzqLVVCVjuLHthegYdtQZnZeb4KRPz
 wXcrUoqrqWb77EvDGwZC7SbozAAYUouK30z1pSK4D2Jn4Qq/qC++9y+25e83wJwy3dwm+TwNsqL
 fqetfGfaPckcAb4/dmutO/Ath41UIYW6Y+dlrhrPbLl7FIYEQfbSDHYZwymJLcYeAXMbJ3CtP5Y
 F5OfzLwCvxi524AjmSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX0V+usPAMYAo5
 v9fFCTnCOPWz4TDRcA1N+8ES+al10MW2QzZMeSCiMvddSlQs7WdIQwMVLpPDwmOGQGdxlTQewEy
 KT8bQeHWD0QgZgNlGoNCGuKUnMWKUo0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140039

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 +++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 113 +++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 204b81ca658569b713bca34e296ae5fbc867bafa..0f19912fe1abe3c20a9ece60267697f17a5b1501 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -258,3 +258,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on PM_GENERIC_DOMAINS
+	depends on PM_OPP
+	select GENERIC_PHY
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 4b5e6640a6faa05715b96cc8e9512208340fb595..41f192c9f4182977573dc8755b34575b13212fd7 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..81bed5702bc17d2b05513122b22dc7a5cb75fa63
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/device-id/of.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct device *dev = phy->dev.parent;
+	unsigned int level;
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	level = (submode == PHY_INTERFACE_MODE_2500BASEX) ? SPEED_2500 : SPEED_1000;
+
+	return dev_pm_opp_set_level(dev, level);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_drop_level(void *data)
+{
+	struct device *dev = data;
+
+	dev_pm_opp_set_opp(dev, NULL);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	ret = dev_pm_opp_get_opp_count(dev);
+	if (ret <= 0)
+		return dev_err_probe(dev, ret ?: -ENODEV,
+				     "no performance levels available\n");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_drop_level, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

