Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A5F4BB7F0
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970300; cv=none; b=MSB8h8K/lJYwebhxjULHWnOiGFJwwjUka4h075BnPFBsN9uhhOffvNTvXXBotMs2POhKWr+YIYCyZYlZ08zhyP3fU9c3c7CA3pUkVIeshWG5dr2Nuraaw66tt39yiZNDajv5w9k+KNAD/58Ua2NNIK6OEOmFJKb7qEwJmL4DYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970300; c=relaxed/simple;
	bh=kRi9KUiyiURNB0UatawZeEzDOR99f01j7cgA/n8HIm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXbZx1XbG98pEie9CxUA5JO+oJtLFFarSIERu7Z14tR8+g55P8zLCXdcvHPdHls1AvZSZ81roRTsOrzdTc1wjwQhsWCVHZyeC9+1JhBPh/wF2gMZkpAJvPKCI/uh7aCrGIw7XJO6IYUNAPR132wwPEMxWo2XS9gybwsKDtq1guU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XP1G1iBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpDghLnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XP1G1iBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpDghLnp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692HYE2r2174741
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 19:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/ZWGbUh/8jG
	NuneT9ps/eKOiY506yMQ7wobsGaxA9p8=; b=XP1G1iBGgqJ2QegAfN58Agwy8Qg
	vr7J/W+1g85OKEwiqKl3F3/qwjcs+pXJOaldfgacM3/A3/LKlQ0XnkhyDf2cze0V
	j0snU+0hxJQG+xjwbDfGpgjx4PnipPX+oHxwQQGYsSlOL2ILGZYs9pqE0ZJToXLv
	qlNS5UhvNll3rQibP+wikBgrCGTmhsROOEJ9zLo40orNOEEo2vULkaC6qMYnuunT
	xty5CgBecfLGG0xM+dNZAFFwFFjfbb+BCW1zIvaRCWxzPBu6K1lo/YSZ/yuI9cui
	Z1CoL9lKTjRB/zcnYk841PxyAB/VoTCpW7DMUqWCv9Va9O/TUHCzEBaNtdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2h4krg4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 19:44:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc40759b2so278668685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970295; x=1791575095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZWGbUh/8jGNuneT9ps/eKOiY506yMQ7wobsGaxA9p8=;
        b=kpDghLnp0cf68hZP8ZveMHu4NszDvptfLNDFAgUZhqSv7c6Je1VC8bfBB6aVCep0gE
         VUAkswIwH47WR83HUbsELJlVc33UELmFJ6BapQnrBkgh69KHyHCZdH2SeRRyGA1/fVxR
         1xxHAeSj9M6WS3FHDjGn588JVkjv3CkSUTRD0g/8Oke6gMPY1tvBKejo+MQ/augKuATy
         VonekdPk9wmYAuADcnsPnH+y4BvCxOADW21I3Bc06I8EcOeZppM4hIFxOE3W4QQ2UjaI
         v6NbJzm5oK3hh0RqgnjP5rDQQADo4Pn4JdXJXkU0ewei68oLHi9X+MDptJUCwI/hZu2/
         +3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970295; x=1791575095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ZWGbUh/8jGNuneT9ps/eKOiY506yMQ7wobsGaxA9p8=;
        b=egq9DWt7VxtZfQwiX+cgaXBttQ7nAZ9MsbdEpx3SbTMAzMxtzCQ7QvG/szAkje1UpU
         U+JiB+ZXAA0Flbr3r2YC7FI8vcvmlmOEuxYIFsbs57zdnlsJL6GvsDNG6Ffn9T7CSIGp
         hUMXY5/YzDWRTaKcG14S55w2Cf4lP5SlwBMMu+MP7939hYMe+Uvj6rq8uv72VzioDiuT
         Q1ChNK8W6QdApKLlMO1xiRnj5h6k0N6gL+9lCdetwGnnCMO3u15r+VQO/V30nQvG3kOo
         7FMZwcaFLeHWIQIqTdwys1ELTj4RqJKvqgr8NAFACmVLaFMfDyQ6ompx8nk9hoVbadk9
         TeTg==
X-Forwarded-Encrypted: i=1; AKwUvBy1RQDaqS0nv7N7YA+Qt+ZRScstY4L0tW+6KTEjflkaMZNDGXAE6ZN9UN3aCM8a7KE/XRlRyn1310IYb1aX@vger.kernel.org
X-Gm-Message-State: AFuF++mvciWPuetz/FGDJE66QbUXZLpmCMD2EV7jtJ9hpIwoZIg840K0
	ZFJ1Xxcg+cTonFgSHUmAmjNWRhB9XTDN7OALW0nXlJxJw+edjcaC/uJ4c2JgczUbrHxM0sGUfuh
	DY0BZp5/ks8GppK/oTdV+x+MoPGfteBUNokF0wLJ3dIxODn3Ub/PDTtlcQNBPVDCzZhML
X-Gm-Gg: AYBFou0CgKvwPc5sB0eB/UYwOINkUH4VabqSqm+yKkzSJyy1z3nxsaW0K0+2GmnjO+o
	z2GCcMEsun8xLl/DcNG2XCBvq5Z3Zp8ejsOUpic3hyK9EqbTTOOzlTdCv78R0nhPQv7MyKQ66cg
	cWtIskiAJmuIvIGnI0sU1Fgtxn5ORnUW23q7bFOpcXSFUHFqgYYNyEVmPVHuLrQx4Qcx/rTWdB7
	tCxcni8wr8YIrVF1K+m7Uq0u84YvHfRK4eiDsQ9ML6CdGgD4jPbLqZRA6hkzbYli3Kz+VMglVbu
	zHJJtNQtsjPPKXI5gNnyP3W9oqqY9nJ9rwUhGTl1bRib+IXKUCGdtEUrjnH3jHC7TbamTGIYAgu
	193To416Y2Zmy
X-Received: by 2002:a05:620a:3198:b0:934:ab73:ac53 with SMTP id af79cd13be357-93cda7fadf1mr713350885a.0.1790970293887;
        Fri, 02 Oct 2026 12:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3198:b0:934:ab73:ac53 with SMTP id af79cd13be357-93cda7fadf1mr713343685a.0.1790970293325;
        Fri, 02 Oct 2026 12:44:53 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/4] clk: qcom: Add lpass audio clock controller driver for Glymur
Date: Fri,  2 Oct 2026 20:44:34 +0100
Message-ID: <20261002194436.1275056-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G46JgNk5 c=1 sm=1 tr=0 ts=6ac009b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7GdS1con5BCYmhUutoQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3Hb-36rdRQcglvHPkKDhu-cxqZ8qHZtG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX5SRID/OMDgNp
 HcUcypJVZ1sqywS8UImiyq7hqEjKxs7eDPfHnOhqrNXMinWrc3QkM/9reZSct8VP2WLV+blfZUZ
 oiunlY13PA4NJ+eou7rtDwWm7z71evt5mT8o6VVTmDSmHyjIwf3b8yaIunP+nHhiXTrPMK1h9Tr
 UY8kzeSGBkk3yCaCWpj+I/YpWOtBBw/GsPBRg2+w5uOTrhIPaE0xjl72bR+JAg0OtLj5QEOa/vc
 42i5I0z+lpYCwl/JgeYilPOaXQ16Qj3lQjUSLSDYRw4/na9AfavMFHM2gAq3fVJE4oO9tEDhFWx
 UaviqA8pt3ePppspDQRPAW0yJ4J06NWm4QkUFzyyyLNs0H4cqvPVLKJvOTcna++JbtF13PGW1gw
 yVntS4XljTJDcvXNXwG9J1rm8RXPgn9vZAU2Ptbh9cOLmIi0VTFn8TwMKXBWoJjUMRtB8L5QdrP
 bjFb8fWaybIY1kZsocA==
X-Proofpoint-GUID: 3Hb-36rdRQcglvHPkKDhu-cxqZ8qHZtG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX1/RQdZkw5Qyx
 4stVv044E8/ezxE6A/bIZdpQzSx9/rWJoJQMP+Elti70+TA8LoG4kuwY9CUxm1MlXU6JiUok9/S
 5pvr4ikJHdcd0odgn91iA4huHGNiEYQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

Add support for the lpass audio clock controller found on Glymur based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig          | 11 +++++
 drivers/clk/qcom/Makefile         |  1 +
 drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a..89e6a636e497 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1274,6 +1274,17 @@ config SC_LPASSCC_8280XP
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
 	  controller to reset the LPASS subsystem.
 
+config SC_LPASSCC_GLYMUR
+	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
+	help
+	  Support for the LPASS clock controller on Glymur devices.
+	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
+	  controller to reset the LPASS subsystem.  Required for the LPASS
+	  audio macros and the SoundWire compute-mode controller to leave
+	  reset on Glymur.
+
 config SC_LPASS_CORECC_7180
 	tristate "SC7180 LPASS Core Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f26..0c7a67b9cee3 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -151,6 +151,7 @@ obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_8280XP) += lpasscc-sc8280xp.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
+obj-$(CONFIG_SC_LPASSCC_GLYMUR) += lpasscc-glymur.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
new file mode 100644
index 000000000000..b7fdd76df2f5
--- /dev/null
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+
+#include "common.h"
+#include "reset.h"
+
+static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
+	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
+	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
+};
+
+static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x3020,
+};
+
+static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
+	.config = &lpass_audiocc_glymur_regmap_config,
+	.resets = lpass_audiocc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
+};
+
+static const struct of_device_id lpasscc_glymur_match_table[] = {
+	{
+		.compatible = "qcom,glymur-lpassaudiocc",
+		.data = &lpass_audiocc_glymur_reset_desc,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpasscc_glymur_match_table);
+
+static int lpasscc_glymur_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc = device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static struct platform_driver lpasscc_glymur_driver = {
+	.probe = lpasscc_glymur_probe,
+	.driver = {
+		.name = "lpasscc-glymur",
+		.of_match_table = lpasscc_glymur_match_table,
+	},
+};
+
+module_platform_driver(lpasscc_glymur_driver);
+
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>");
+MODULE_DESCRIPTION("QTI LPASSCC Glymur Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

