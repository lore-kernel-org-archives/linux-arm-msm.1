Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A648256C63E
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965821; cv=none; b=moQN5yvLdya9kJn3xbuqEHl6lCtG5gzDlfE5ejQ8TBTHlxKbhKXBWRwiYx7W5eK1I8FjoR4Nz54DvXQyqldF7rgi764u9C6WaQlrE7q8QmlD82nSuhTE+pSJbY29s9pVJGlY/bTXYyHpX+YuiQ+6sP9zwjgVyGhJzA12Uvdhmig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965821; c=relaxed/simple;
	bh=1R6Utv+qvsm3BmK4wvwwfQiFexp4no+IiiaI9utxCE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZBguprVyo8nzYvBKm65d804AK65Au5l6s6Rq/O6+BKIktLVajOdXl6XpdwFnn3XUx1ZRIZ2T905Dzh+A40qUBiKwxqavjhs3q5Fzw23AIwB/KsRjFghlpvMxpF2ajupjkpN7Tv7MZC+gw6PHj4vq20WytnJoteiPw3tLFYw09w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lgf4mi4o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rhzx/5kZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lgf4mi4o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rhzx/5kZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIR292080975
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GSXR5NyPzEt9NCTK8oySpuhpLuRDFNxcln3x4lU6wo=; b=Lgf4mi4oeIpJHPsd
	gqEioJz4riMb0z7TpV6uto7EfZkuD1/A9bwmYAhO+ABMjfolQnrV1mNcJv+KQXGZ
	YgYjrc7LwT8sXFMKuQBmF5QaYOaB11uGel6SDi1N4lN++jU+0IGlXDt1/iZyfd1i
	poPd+GkcdwKLoKdjdEMZK6GMmoWgIwikTYHHepAjb/OlX+XoKog/oLd/50mhYPy2
	dCAdiSJw4WdQQbUc5Q/EFwp3EGPKRP1sdWPaAdRxiPTEHMUFS9RbyXx5pNacQKyR
	UOGc8CKpLa/grmS9uJyhPCn3xDMPeqE78dQVH44Fx4dgqjj9y5lRpQMaEV+Kl3SD
	cm61yA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r0frp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:56:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so708181137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965818; x=1789570618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GSXR5NyPzEt9NCTK8oySpuhpLuRDFNxcln3x4lU6wo=;
        b=Rhzx/5kZbKFAqrSeeIohpRNbFcM28NgMdMflBUvE3/7jbqbgXyww2Up3s4X9FKZtiC
         CtKlzgaZJ8wasxavNg/zUOT13Gw4ElLFTVO4v8i5bK28n5xYs4y5uGPC6R9CGE8I44SV
         NjcihDqUwL5Q9yJTVgUg9/Jnz3lIFECFXIwmlNy1zDcXVCl6Xf2pwyWAu2FLywTDgULj
         LeoCx4OPX6pwxSOLE8hddcQhkLpx3Zjx9BZ/MnZTPJldQqyKlr6Q6cNA5X8cD7tZ99ef
         UqwYya3ieDJkD445278mH70aiUCtmj0E3fRe42SMCcPTbcYdcCB37guF+0kaAhCKWkeh
         4KSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965818; x=1789570618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GSXR5NyPzEt9NCTK8oySpuhpLuRDFNxcln3x4lU6wo=;
        b=cwf5Yk1kCOg3A4pwfKfQPnpC2EsJhG1W9GPWUVBlMG84cr6DFF9V/R8vy311+yiJT0
         w9MGMObvtDBmwbyFyvY7/0Pd2zHTbiZRd2Uapa3Ud/NIgfzrYobNN6KU0BYJVp8IYPoI
         +56ySAxg8/+wsF6Zth+26tcXKsr2dDL2jvR5nnnETcIVH7jel6Xr6UMVKSei5kMdcsPL
         XdyOPrj4YPmZaB2rJV9UYW9hCFou/Z0uOcklbr9LajueiKE3KP1Myz7V7IeagzMNaXnc
         Kd0PPQb8zhdCRvLU9r1QbNkTeQt8mAgJuENPhpUSsNF7JBE5siWxU8Q2NSGkR8RuI/Sn
         y3cg==
X-Forwarded-Encrypted: i=1; AKwUvBwIB48mxITcvfOrqUC/3aqDc3/bDi8Rb9a6+yMo3XRrbeg3pjnpbE21lvGrfyo81WK2V74SSWdLqPoJ7PDD@vger.kernel.org
X-Gm-Message-State: AFuF++mG+GItNju8EoyqVV2+f7qZSENIGrYFnxr9zGc+uO2ZpS5YUtnK
	axgDNZrBD7HbaAR3lGcu5pXPkadgRJ25bwF4XFv7fACj+LazXYkFTKfDfZCPlPi1RdKszFLakxG
	bdS5/ugtyY7NzlYtHxZXBvpNxNJjebSpTph/fj8byVti3vxRc5nWKXpzVVbyBtYiDCarx
X-Gm-Gg: AYBFou1RZqffIFfAi0iTeylvoaQhVrneyF/gGQCswx65ITs7ERrGv0ptX5Bwwc1hOOr
	+y4dpkIQyxmmxiL/piLApr3z4orHv9S4L8z/vIUnPO0DWnoVDvVFytmUT6uNxhbTGodj/WdtPz7
	hTE1TQp2vBzW3mgtyH11wp4tZRqDlK3qByDm1YHZiV4FpGO3tazkFr+XpAAqQXth3xEZ6UX7L1E
	20B+H4BAjpBhGkvqFqlPdt3mz6cdoOc/VhJ1OWvd+VexbkafMUHCkUznYEaf15St1e4qqFDchpM
	1NqLq3uTE2niqrGOPZG4aP6pFrE4fX7Kb+C0ab4XWeeRROrKaGt3Xr13eq5f06dgXJizmnxwUCW
	uBew3BnVPJ+V7Ng==
X-Received: by 2002:a67:f493:0:b0:774:ce64:242f with SMTP id ada2fe7eead31-78a2f0637bamr8730385137.20.1788965817583;
        Wed, 09 Sep 2026 07:56:57 -0700 (PDT)
X-Received: by 2002:a67:f493:0:b0:774:ce64:242f with SMTP id ada2fe7eead31-78a2f0637bamr8730368137.20.1788965816997;
        Wed, 09 Sep 2026 07:56:56 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm394333765e9.9.2026.09.09.07.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:56 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:55:54 +0200
Subject: [PATCH v5 2/5] gpio: tc9563: Add support for the embedded GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-pci-tc9563-aux-v5-2-c9b33f56c8d3@oss.qualcomm.com>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
In-Reply-To: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
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
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa173ba cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=xgoTPrYxRPbxS4DbvaYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX55bmwojsBeOI
 in0T+4O2qPxrVNInYhCkoaWf9GA/Qxc0A63ESWkhTAswA0hGYnrG272CTdIMYpOaQKLeHesPuPK
 m9feqifDEWJdNWYv/1kcryfo6T9RIjEA9eJVnrDGqA6W0K3Vbh6YLR+KILn1SaXt46zlXxuRsMF
 yKknr0UbLgVMJKSPjLXWMIlD3NZryD23OjEuSXUHikLudCB/nwt/a0mqZLnUUnWT8nhgoao8gZh
 3XZIH4Wvys6fe8a8OnUbx/Y+cXPcnIEEPG4BKNoaeMz7PPZ+x837BZTxMwli2HpdiOBQXZRyEPW
 hBGr9IrC4N3UqUjYtJYSYxrmNe/OMC0GyTeAI4mclKjQBGRV21d13EjBz6nyBIlbmN8OHvMfuxF
 zfUdA7UA93ArITGMihNpsuC9W89A221svgeWRSbl0WuydC5uxyTHDwgapLmMOk7QPMhEz53QfBp
 c6BW5WtAxSrlevgkdTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX1t1I+y+ZuFFq
 JXGu9f82Yy1U8psAm4nqz4TM3UpNRwYFOU2M1ahJ/Iwv/h18qac/GDILgdehZH9Hr4VtPERnKs/
 t/DZ0s04KkxDWfaKOyVTAJVrkHdiZak=
X-Proofpoint-ORIG-GUID: JsCSasmj8sF1l6SwkJQzhhc8ausveXM7
X-Proofpoint-GUID: JsCSasmj8sF1l6SwkJQzhhc8ausveXM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090167

From: Alex Elder <elder@riscstar.com>

Add a driver for the GPIO controller embedded in the Toshiba TC9563
PCIe switch (and the Qualcomm QPS615). The device implements 35
GPIOs using two register banks: three registers control the first 32
GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
GPIOs 22-24, 27-28, 31, and 34 are input-only.

The driver is registered as an auxiliary device driver. The TC9563
power controller creates the auxiliary device and provides a regmap
that gives access to the GPIO registers, so the gpio-regmap helpers
are used to implement the GPIO chip.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/gpio/Kconfig            | 11 +++++
 drivers/gpio/Makefile           |  1 +
 drivers/gpio/gpio-tc9563.c      | 99 +++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/tc9563.h | 16 +++++++
 4 files changed, 127 insertions(+)

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
index 000000000000..68c20c8cba79
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
+ * upstream x4 port to two downstream PCIe x2 ports. It incorporates
+ * an internal endpoint on a internal PCIe port that implements two
+ * Synopsys XGMAC Ethernet interfaces.
+ *
+ * 37 GPIOs are also implemented by an embedded GPIO controller.  Three
+ * registers control the first 32 GPIOs (other than 20 and 21, which are
+ * reserved). Three other registers control GPIOs 32 through 36. GPIOs
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
index 000000000000..0dfd25747b9a
--- /dev/null
+++ b/include/linux/soc/qcom/tc9563.h
@@ -0,0 +1,16 @@
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
+#endif /* __QCOM_TC9563_H */

-- 
2.55.0

