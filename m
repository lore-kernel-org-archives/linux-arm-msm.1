Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A1377AA1
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422028; cv=none; b=MrLV7jugpXuDE+NrhQdN+JUB3JKS7ckaRHIZu+5S40P51Hj3zrXBlRKXJwvDkMMl5Mfg0VA+xYMUZu/mVPHuuciboJUjQhZ8j3CJj9xzx6q+3btoayIElTMHe/bR7K2gcf9BhxPgUUf+Xynkd00T5hALhAIkHmVEyISPimJPN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422028; c=relaxed/simple;
	bh=dC1TmoCxNKoe1ZHT/oRYda4bb6bgtNVLvwsF793C1Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuoEoD7dUWjFOyT5CsTgB4IrVp1OYpBXVBSLO2tcN9YXxYy2/g+aPJXtd0j+aGM+PyUi7+fdCkKXMLcfxnYTcw5QYoPk2lb1lQu76PHnoJV6Fc6UqB1YZlb0GpSCsO+EVD9Bp2VkL99iwM55nCRaQ3Gt4OF8crK0IX9ZdKm05RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULr4dj4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmZlusye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULr4dj4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmZlusye"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lws34024082
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L4B18C8BAWnluvJtgs6sahdr+TMhXOEeOZlUfDbIV58=; b=ULr4dj4L7fEobU5T
	77M/v6YLabRJr1eKiiFatkWPda1vEYdhKQDcSwGCIU9idyOExuyqJ3UP43UawC/1
	0Jw1ZRhjvJgRBu5s/DUyFUcYbeit1FlVacFlbveQYPf1GmIxpe9C5bbuH0qVbSy4
	wytlF2UWY/DBtCiWbUkvjgpBcycZ0lKhDEehkWqMMfqKeGfOpeogYShPaQezpH+3
	WRnV1q2r8LH6Oeyn6GWpeHZeqir4q3UYQkfEKfu/lr8HcN6rGwyKJ63v7OtTunKi
	GgWXiyIq8U1dJ/NpNU1bT7Uw15ILFBbGfY1W4iDocptQxCZ2MYbXxPtmaWL2B2eB
	i4q7ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc2vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:53:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939281526e1so108136985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422024; x=1789026824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4B18C8BAWnluvJtgs6sahdr+TMhXOEeOZlUfDbIV58=;
        b=UmZlusyeIhbu4pXebs878i08WFSIR67SaaH8ql/OC2SkE8dS7fWdS3Mmag/gxH7jxZ
         Oa00wkfWUcXpeJrLtkGjLy6NTuLLEJHvT4iBJl05phKHsZedG8eFoHfjKU4+2tQ0tcp8
         cZYmk6pQf4TqUu+oxVZSl2q4jDhZzq7wK1picjQYWNqt8hjzZA7t+qkltwXJKvfFvTgL
         ormOCZGtXSm3TRCGYFPvlp3fiyqBgaSDgmzUzALnJqNQE08R5Qe2GYfKALDRLVUNuR1z
         SBtsptYGLME9QryezPFL0moK+AJzRRDhSt9dG7fGHj83E1P6T/ZqyZZw/MkuIeBa0pzi
         LDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422024; x=1789026824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4B18C8BAWnluvJtgs6sahdr+TMhXOEeOZlUfDbIV58=;
        b=ZIZ0eQEi5YrknRSKLseXncGTlChTUTGlpHHykSDWHIuBeqJaTNyNW0b3drLA4ck/hR
         tomJSISR8xnQEN9XhaAAHdFjNz65kipu8wUHvkvq1l84tFt4vWP55zDfT7K+tAHUArWq
         D9u0BVk9w2bD7ahi1xByKJefs5LSjxpQMqQFkeSVYjqwzoOE/V7c5hINwqh9ge+UDWHh
         dYpiva5oZOIsPp3cuP96kEWRbYaMruT+LYFnxxrlVVFwI1mJKLj4LFtnGrkTXOWv0mwy
         gJ+FrqMU5SqyU1y7NQPWOm1xjLmPbjvos3aLS5CILHMi2QqzoA1TYpvUNEbUzg5Pl7nX
         VHyg==
X-Forwarded-Encrypted: i=1; AKwUvByzzS2T3C2bz3nenmiRQGHkwRGR97aVKgRNgPb9pG0LQPYq0VMapW0MJGOA31nnA+9oomSynBkEUpMjkyF2@vger.kernel.org
X-Gm-Message-State: AFuF++mB+d+7uQb6XSWjnvSYEa43fQoeTJMUGCf4AZ9fNSCm7Ocvsfmz
	c04Wjn3mDe8E5MbXbnffRxd5d1/+Rx+9pMT3/3cdSI1cB7gGFuuHgQA80YvHwEXmcaNSp3GobZC
	Tb+YPDyeKQtctt/B0Qg0/hNmsLsm8O1rUkIbmIHvLl6md/qgrvZborqQKHxTZuG6uXY9V
X-Gm-Gg: AYBFou1PkpO5iwMiGAKN8H3KgusZvSaKZ6W070bGSILIPgQFugHlJhBSLYDZwPQbG3r
	ddYeI1KPPg6hxcw9+01zDsjsxg5Xp5WquPO4gPusa8RfDdtmmBUct6PgbTWYyKyNxqU+XUAyOCs
	VkbF6H1R+NniwlibNI4G4PTbPmf2ge73qwcWoWinrgnl1gzx7C97r+0fbOX2On5bL7ZIxJCzSIP
	uNOWctHPRDjMraDP4s6E8xci21EVjDWBh6gLdR79wDeFyhwQ8MZ59rBJ2lyVajyl7AN66mKaMLe
	/V+VTu8H3eJX1/LE+mOLeU6UbeYFoBFLEhxmCbX/PhZqQS2wlYHIzE+FZrUyKcrZDXn+do+OEnm
	3M3w0g3J6B+2rig==
X-Received: by 2002:a05:620a:72cb:20b0:934:97c1:ca5c with SMTP id af79cd13be357-93960dff178mr986227185a.16.1788422020553;
        Thu, 03 Sep 2026 00:53:40 -0700 (PDT)
X-Received: by 2002:a05:620a:72cb:20b0:934:97c1:ca5c with SMTP id af79cd13be357-93960dff178mr986224785a.16.1788422019980;
        Thu, 03 Sep 2026 00:53:39 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm13415139f8f.14.2026.09.03.00.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:39 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:52:58 +0200
Subject: [PATCH v2 2/5] gpio: tc9563: add support for the embedded GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-pci-tc9563-aux-v2-2-34c625b542c1@oss.qualcomm.com>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
In-Reply-To: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: vclzZBXca29TkMHN1zu8C5i-xltV7RYH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX+vC1Ofuc43Kh
 d0IBbE0XOlUtR/mC/WS17qk7UwgZJeLLCIPqN7s35ZwkvjprztXQZOgE0uLstw14zTjc4TndqCz
 /6ODX38NhA63bhwoK6W/pkJF6dqPyTVT7Efy5yOCU19FG2XlfdeuziNg6a3Xs1cTvpjVcKwugmg
 WfjcvILXs7FsrRR2AQ+ULJY08zElkO/zkL+dsGS/U0NIwE6HqaxuqmJzypl0cwf+qeZXilI7Zqz
 dNAEv1hBdRIuzIsPHWvp9QIg8W8XII+aQ40gP63/JTZcn4/iYL36c2s/5nDJTpP8HuFCHe9lGLY
 8nln9sUhaQC7OB0tvoSlnsj/tmaWUNnYSqsl5EyxjnA5SgYI5JOVjLOrrtWDICDR+2owBMKGQog
 cXWjig/7WN1KWeqSIkr2i6E9QrJqVU3Gy+ebzAnpCg3JoaLiYlQ+xMKVnGpxNnCp2Zzzzey2V7M
 t3uWO4DBiStunIDIqCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX1JTMGEPxf/IC
 dcUWmwJl/LGuMp5gSGlj3koE5IYwuzv0/pbaBtjHxQKycp92QkmLyVw1rk6FwKSmWGtpF0R2AX/
 3m5VtoaJt2C4X0Sj/fuavR/VJ6pET7k=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a992788 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=xgoTPrYxRPbxS4DbvaYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: vclzZBXca29TkMHN1zu8C5i-xltV7RYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

From: Alex Elder <elder@riscstar.com>

Add a driver for the GPIO controller embedded in the Toshiba TC9563
PCIe switch (and the Qualcomm QPS615). The device implements 35
GPIOs using two register banks: three registers control the first 32
GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
GPIOs 22-24, 27-28, 31, and 34 are input-only.

The driver is registered as an auxiliary device driver; the TC9563
power controller creates the auxiliary device and provides a regmap
that gives access to the GPIO registers, so the gpio-regmap helpers
are used to implement the GPIO chip.

Signed-off-by: Alex Elder <elder@riscstar.com>
Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/gpio/Kconfig            | 11 +++++
 drivers/gpio/Makefile           |  1 +
 drivers/gpio/gpio-tc9563.c      | 99 +++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/tc9563.h | 19 ++++++++
 4 files changed, 130 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..2179eaffcc48 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1830,6 +1830,17 @@ config GPIO_LTC4283
 
 endmenu
 
+config GPIO_TC9563
+	tristate "Toshiba TC9563 GPIO support"
+	default m if ARCH_QCOM
+	select AUXILIARY_BUS
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIO controller embedded in the Toshiba
+	  TC9563 (and Qualcomm QPS615).  This device connects to the host
+	  via PCIe port, which is the upstream port on an internal PCIe
+	  switch.
+
 menu "PCI GPIO expanders"
 	depends on PCI
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index dc9e6d643b5b..792faa2668c9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -182,6 +182,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
 obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
+obj-$(CONFIG_GPIO_TC9563)		+= gpio-tc9563.o
 obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
 obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
 obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
diff --git a/drivers/gpio/gpio-tc9563.c b/drivers/gpio/gpio-tc9563.c
new file mode 100644
index 000000000000..f8ea3fc35c6d
--- /dev/null
+++ b/drivers/gpio/gpio-tc9563.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+/*
+ * The Toshiba TC9563 implements a PCIe Gen 3 switch that connects an
+ * upstream x4 port to two downstream PCIe x2 ports.  It incorporates
+ * an internal endpoint on a internal PCIe port that implements two
+ * Synopsys XGMAC Ethernet interfaces.
+ *
+ * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
+ * registers control the first 32 GPIOs (other than 20 and 21, which are
+ * reserved).  Three other registers control GPIOs 32 through 36. GPIOs
+ * 22-24, 27-28, 31, and 34 are treated as "input only".
+ *
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/soc/qcom/tc9563.h>
+
+/*
+ * There are two sets of registers, each representing (up to) 32 GPIOs with a
+ * stride of 4 bytes (IN1 is 4 bytes past IN0, EN1 is 4 bytes past EN0, etc.).
+ */
+#define TC9563_GPIO_COUNT		37
+#define TC9563_GPIO_PER_REG		32
+#define TC9563_GPIO_REG_STRIDE		4
+
+static int tc9563_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	/* GPIOs 20 and 21 are reserved */
+	bitmap_fill(valid_mask, ngpios);
+	bitmap_clear(valid_mask, 20, 2);
+
+	return 0;
+}
+
+static int tc9563_gpio_probe(struct auxiliary_device *adev,
+			     const struct auxiliary_device_id *id)
+{
+	struct gpio_regmap_config config = {
+		.parent = &adev->dev,
+		.ngpio = TC9563_GPIO_COUNT,
+		.reg_stride = TC9563_GPIO_REG_STRIDE,
+		.ngpio_per_reg = TC9563_GPIO_PER_REG,
+		.reg_dat_base = GPIO_REGMAP_ADDR(TC9563_GPIO_IN0_OFFSET),
+		.reg_set_base = GPIO_REGMAP_ADDR(TC9563_GPIO_OUT0_OFFSET),
+		.reg_dir_in_base = GPIO_REGMAP_ADDR(TC9563_GPIO_EN0_OFFSET),
+		.init_valid_mask = tc9563_gpio_init_valid_mask,
+	};
+	DECLARE_BITMAP(fixed_dir_mask, TC9563_GPIO_COUNT);
+	DECLARE_BITMAP(fixed_dir_out, TC9563_GPIO_COUNT);
+
+	config.regmap = dev_get_platdata(&adev->dev);
+	if (!config.regmap)
+		return -EINVAL;
+
+	/*
+	 * Only some of our GPIOs are fixed direction:
+	 * 22, 23, 24, 27, 28, 31, and 34 are input-only.
+	 */
+	bitmap_zero(fixed_dir_mask, TC9563_GPIO_COUNT);
+	bitmap_set(fixed_dir_mask, 22, 3);
+	bitmap_set(fixed_dir_mask, 27, 2);
+	set_bit(31, fixed_dir_mask);
+	set_bit(34, fixed_dir_mask);
+	config.fixed_direction_mask = fixed_dir_mask;
+
+	bitmap_zero(fixed_dir_out, TC9563_GPIO_COUNT);
+	config.fixed_direction_output = fixed_dir_out;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&adev->dev, &config));
+};
+
+static const struct auxiliary_device_id tc9563_gpio_ids[] = {
+	{ "pci_pwrctrl_tc9563." TC9563_GPIO_DEV_NAME },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, tc9563_gpio_ids);
+
+static struct auxiliary_driver tc9563_gpio_driver = {
+	.name		= TC9563_GPIO_DEV_NAME,
+	.probe		= tc9563_gpio_probe,
+	.id_table	= tc9563_gpio_ids,
+};
+module_auxiliary_driver(tc9563_gpio_driver);
+
+MODULE_AUTHOR("Alex Elder <elder@riscstar.com>");
+MODULE_AUTHOR("Daniel Thompson <daniel@riscstar.com>");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Toshiba TC9563 GPIO Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/qcom/tc9563.h b/include/linux/soc/qcom/tc9563.h
new file mode 100644
index 000000000000..086f37a40d80
--- /dev/null
+++ b/include/linux/soc/qcom/tc9563.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+ */
+
+#ifndef __QCOM_TC9563_H
+#define __QCOM_TC9563_H
+
+#define TC9563_GPIO_DEV_NAME	"tc9563-gpio"
+
+#define TC9563_GPIO_IN0_OFFSET		0x801200
+#define TC9563_GPIO_EN0_OFFSET		0x801208
+#define TC9563_GPIO_OUT0_OFFSET		0x801210
+
+#define TC9563_GPIO_CONFIG		TC9563_GPIO_EN0_OFFSET
+#define TC9563_RESET_GPIO		TC9563_GPIO_OUT0_OFFSET
+
+#endif /* __QCOM_TC9563_H */

-- 
2.55.0

