Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA647AF56
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258524; cv=none; b=TkTaQmGOQWkiHHk5fg56UNd7mf4XR38bU4Zw5KhkAbx4JaMXbXxEJTaKy80jMdGA2o3wbrkZH1SjFctkts928k+lx6Fr/5evEhBFpEsCSxirDCK3rCc9Iyyt7SjLhErFDgIJWUx7s8gcUWi2YmEnFkFVgBRpRdOFhCVljBCk3Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258524; c=relaxed/simple;
	bh=0GwgubspNV5zxDW2zdV4oGwh5cFCZ9ky+Yd/wUF1WDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YzpfewSXVPGHY9kV0XOlljZkl4uiBk0VbjcwR5rH43gQSg/Wcepqp/XK+KRCaQD745eGH/+UQdq4T2HjV7ObRAwZUkn/K8YrFQdP5aAGsbhIQg2eR0qXonlvqM5OQnYWLYcdZ9rvTA8hfDv+ye66qY5XSIiECOqQoIzM+jVsgfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B96bc31K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYsfL7kT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B96bc31K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYsfL7kT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJUdD1641773
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 10:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1iy1mNufOF7R2Q3P9yUuJYIvgdrbYvd8Ink4Xbc3dtw=; b=B96bc31K4owjzrvh
	cbJrm3YaGK7WPegxtjAu9O7xvrlpI1L+JLhKiZyPvomVMykaXVt7H9pZWAZpukHg
	9fDl2ovy0b7xKyvudxgVN48wnTz3cr/G4jiJQJft3ov8t8GBu37zRWSymz6OKjs4
	MnOhRXTmRMTxJsDE7ApzEy14SOy4AgvlDOAD03ubwOT2rvQZuQlPc70lnGcedtSC
	/NsvYqQiXVxnULtzmU7/qggfseNozPJjHiSdwtmjzgCLYfevdJpZeurmWzKiIj2Z
	7M48jJ5Eq3OEG/qQBaQBllkEK7dFMHZ+Mm/+mHjxIw0dkY1faPxHF/Q2Rm3b6mBq
	rnAYNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8t1ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:28:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so718242085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258521; x=1788863321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iy1mNufOF7R2Q3P9yUuJYIvgdrbYvd8Ink4Xbc3dtw=;
        b=LYsfL7kTUZwRkc3KCUugpxTLo6B4Xc+x7DVIBYeoFXNVSkEy6Q5UkFwRynEkOG/z59
         9ujSbqgA/EhlJ46TZYm1KSdKoDczouhRaCNVBSln4y9SsZjbNb3th5sTp55EdxYFaiGD
         7XN9DgWswI3KcSgL0TD5Ef/D+X0Qy9iktThkJpTnMRkYpQXlR0W/B38zg+8yZBkOqOkD
         bkrBONm1+CUKPGPl5hWGUXARBM65Q4woVsLOx+vdxKVnKbF0CPkcVoL/9zM60erO0LMM
         3azRGX36kC93k7YNGmjicUmvCoZAjWeCGUZFt/a7UpX/eFnBS4+X0OflkReEHGZ2n/yZ
         LWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258521; x=1788863321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iy1mNufOF7R2Q3P9yUuJYIvgdrbYvd8Ink4Xbc3dtw=;
        b=ds6fuuau9fRBWW2i3nLMDroyXwWtvpQr+oFl0zUXii65vk0vfGc4+7zVDDPPJI5m3w
         Vp3NRz7DDr2VuUSgMoUAKJEKlV7JzDtO6uzvRJcFhpRjBdWEbx2VMQD7nsze+T0JdkY5
         XML9HI6LkMbjhMhdDcqq/mwosHyZP7/uwtvwwAYdhEvQg8qgjvp9Yfkmo1GxKO+75sIC
         y+KJqsMJ1hzKU+ACxRPwol2BOB94seV8/RGpGVG65EQRlzWEw4tcHgEMTO642bKzkPHN
         RPffFYncIV+jXpz2tVah6g3DxkHNtAbzlNQH2HtOSTaR3WKKHuvY9yXFEyLERWteALsU
         VWhQ==
X-Forwarded-Encrypted: i=1; AHgh+RorBJxsMxSIecn4hbJBK9q1q3YYlo7Epwd/g9zGPUXPY2bsJ7r0nvKbU29fNw26wyVpcg/cpGFNXHLLtKd+@vger.kernel.org
X-Gm-Message-State: AFuF++ktLkSTscGFmyS64tHHGZjw5nMxc19HeOngjIFai/2P7l26RdHG
	cZF0dbYbLzDQ4wBUtmip859KCM6yaq+ivgEzfGlD6fuyQvAXspPfVP7xDNDkWfr59CuGXVFcAsM
	ND7XuSHm6MiMOnBZfE+lny18G+9H7TCRM9GgGCAvVCoq9qwI8Au0Hoyh2ETOlGVwsWYRV
X-Gm-Gg: AR+sD12Cs/pptXw+cxAU6pXygXgIm08JvUQsnvkbXN+fdKh8XfjYzD+ZaiNGzr0sHZv
	sLsUvk2Sc8g6lsgi3viRb6p4w68797tDC0AVkZumEDuWK4Y5e/2IgN+cRTwYNl1QbL0TX6fFY6C
	BHSUDvKLkz3Dg4B4FsrEJOkBCeI6j7IBYBsOIB3+dADsUIg47FGHUUgAeqfob4Yij7it/5xlXhQ
	QyNRJ8AwqoE9jIvkFVG9twRdZB1Tf+554oROWeWa9HBmP71eqwsBGolPGLVmqPPgaAk/gFGxDaV
	UDtSMRdHT1n0LgfmhBiw4zXuCD7PvmVkZVWNszt/cNxkGwfyOuJuG9kdGjGx0EE0zvAwYKM4qPW
	FftZyc29NPIZlLQ==
X-Received: by 2002:a05:620a:6cc6:b0:938:fd60:4f9 with SMTP id af79cd13be357-9394812a6c6mr858245585a.27.1788258520688;
        Tue, 01 Sep 2026 03:28:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc6:b0:938:fd60:4f9 with SMTP id af79cd13be357-9394812a6c6mr858241085a.27.1788258520121;
        Tue, 01 Sep 2026 03:28:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0d936sm54353435e9.6.2026.09.01.03.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:28:39 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 12:27:54 +0200
Subject: [PATCH 2/5] gpio: tc9563: add support for the embedded GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-pci-tc9563-aux-v1-2-dd9b80738e70@oss.qualcomm.com>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
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
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96a8d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=rkByY7_DmpklfAL6bA4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX/qYSTeJ89Mlw
 Mnky5dySocR8+Yow4UeYd2xvA5MKucuRG7mPrEd1QmRG5Esh6BxosE6qaAon1nSHyThwZ9GrwIl
 tl3xVA395SajfJIYgikRbXJSfEInNu80FFX8GEQCncAIZ5X+70Fxco3h+a1/gw++M9WtI4S7yPQ
 LxTgKMpiJHO8hKCSGTww8MdRGs98RWVzfQyuxecgPDp0q6oOiw7gmFIFKZCzSG8vXi/FZnQIUMt
 XD73cMOCBuBu1hamxnvB8OQ5NB05ejDy5z8LIXMVk5PCKyqmiPcts5SJPzAkwGfPjVXo1U336IX
 n01ZycToT+wR2wO2xrvnhe+JzXvZJGjQC/YyqJ/ZRVcbYwBjEm1Ace83rxzt8wCrAnmZ5BV2f8i
 ceBbvoHPmH7aaKh1PvsLG8BRR/kejkF+cv1vvemVVl/wqVEsyHTS+3gnl1qsJBKzVlWLRYXv2DP
 mGH2/Qv9RqTQ6j78eXQ==
X-Proofpoint-ORIG-GUID: LMqKR2Ba-75QeLIhkRecKLTRJHhXjKrr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX0DsZk+4LFC7Z
 jtqlER3D2Vxp+DGnwEu1syeQImALQDlf16vXuwn0S7zwzcrT0WN+m26xupLcIV3evb3hMWYhAB3
 7475sl9hLtKvTqV7xwz7nPzD4yw0TJQ=
X-Proofpoint-GUID: LMqKR2Ba-75QeLIhkRecKLTRJHhXjKrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010091

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
 drivers/gpio/Kconfig            |  9 ++++
 drivers/gpio/Makefile           |  1 +
 drivers/gpio/gpio-tc9563.c      | 99 +++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/tc9563.h | 19 ++++++++
 4 files changed, 128 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a48586bb8edb..c522174e630d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1828,6 +1828,15 @@ config GPIO_LTC4283
 	  This driver can also be built as a module. If so, the module will
 	  be called gpio-ltc4283.
 
+config GPIO_TC9563
+	tristate "Toshiba TC9563 GPIO support"
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIO controller embedded in the Toshiba
+	  TC9563 (and Qualcomm QPS615).  This device connects to the host
+	  via PCIe port, which is the upstream port on an internal PCIe
+	  switch.
+
 endmenu
 
 menu "PCI GPIO expanders"
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

