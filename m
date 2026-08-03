Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D77F3859D3
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750348; cv=none; b=m7PRS2MdpXG0hL6vYp9mdzBi4bZlWJ46KGDOrti7FKNiiHLtI2SMtZmnnd67DJJKpxtXTaQEwJ/Xx9wsQl6QyIMalGY+ys1XQ1UGnXZdXIQqqgEXNR3y/DxxtydTB+oS17a7lTrz4VPYdZ14GmZ/jVsBh2Q6KfHyI0u/FpAcQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750348; c=relaxed/simple;
	bh=IqjZzKl7BNCcMxSaF/5GXH4dOI6iylxX8niIaIkSeSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuEzrBFId5uX4Rq9q3Y9Fn+klYRvtKYaZhW0UwLWfyy/NKBvPb+EpyAE2AJ4psU9GitpPOLR3FxvBQeGsmAg+I+AgYPlUfvtAIULzAK/PzP0jka73LQpSWCCNo/8Z78gRzw2CHy8axkxfHXm2E+UVWQEzWUGVcTtxjvUI84fOS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2+j8Yif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NURdXliO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2+j8Yif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NURdXliO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737A7nB3960468
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=; b=U2+j8YifrLrGpHLf
	DagnOKH5YQVkmVgEsYiYdrTjJ44r+L1oIRaC9h0ICZlvQSQuX8tblcc2WzG9VizG
	JiHWhc2kLcnsJJiy6+MJsZCOkLWm3VHNBXZcj77hlZsncMPAZSEmuj6G5nrUJ7ng
	8HgjolqMvaZEnXkE2kDllhCaJxKL780lKiWoM3YEC8HcCPQ2XOZT+aBsMIowwbv2
	GggyiZo288eBc8OaIuTyk7ffxS5wNk4KrK7JciNCl4F354usc61ksDbWt8F41NRQ
	GFDSilfhagTNLJEshhgsFEqiOl9kzsNwZafxenYf4llM+u2be5ynk1c0hVqV4jub
	o87HfA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajhxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:45:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso3836040a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750345; x=1786355145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=;
        b=NURdXliO8fehWGFeqFJANlG9ph7vBzzglU9yWB42hjBcYiclf07snKsR5NfwqPf1k5
         w+gcE7mopkdlXagYBjKaRmvyqFWAXSqtjh1pt63fEMSRf2pc3q3aX7GkwGJUcy/nmoaK
         6XdCsZfnzMzpaBuBn0KKL9QS0IH+MsJSZwzFo4grZC9KKv+rwBAWDeTkSWB1R3RMUcmm
         GGTZPGrgHqH90ku4px0l23FRDQiHMz7rFdWLTgb+tCYOaVCx4hkoUUqdbO0YAColMGER
         sQtjUMRwV+KnlmEoxpJ24eu+by68XDuY4IvSv2WnJ9sktRr3E6r7TCCATESMlk6zBLh3
         w4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750345; x=1786355145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7gMpX23LaFBur5pPQaddvCHQnd9R+tRGpPVMI8EOpA=;
        b=JBBgOzRjzaiwdMZAYuG5cO5koLycVeUXANar0OFy4RDDAmZJLa6fyWCDreVunQ4gZU
         a6BjV1Gvvii38jNY7hizr2z6ivKNVryF28tpSsvn5Sct0bpzMMZ1T2pZW8wlZxiZHMir
         2qMn8WsQDlTJJEBNLeCdKvycmQLTwhxy3GVpKjaSz0W7ETTgnQG9GTHaGqqbU01qP7dX
         WuzuZOVvotzzNts4538RVZVZBPNyZUv9UUPPBI6xVDdAwpAc7xr+QtYhnYlHQqKzo7xn
         EC3hKtWX/0uJDyxGI5cokq4q60IXvVZIt1O+w/TtO+B6wOA36GQE8zzYH30+jO5n18Gi
         CMOw==
X-Forwarded-Encrypted: i=1; AHgh+RpX335eBcoOSgUTCBmnWpP2f7GFS8j/+yG2lELF/0xIQaNbm173XjfEs7xLnbfFMbC6TGxoyFLp4KbEt6IC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl+6VQSyqtSb5qctbyt1MG4Z/VPIbPqnoNwiAEmLhmXfeRiEYP
	G/cjqyDRyRUUQA2k61hjDlDxY5bwQKB72pwxfQ2r1iZDjZh4WC/M56bZwJwQuAFWbRChyo0UFbo
	dqMruL5MSAG7VgcVjTg31IJMAm+BdmnjBefdc0IlS8ngERWD/pK+HBoocgc/6cSpYvWOJ
X-Gm-Gg: AR+sD13raoW49S0eYu9WZJ0YQ4jOXjJMwq8uyKtw64hS0tphmwWereDYrdrl7Mdzjwr
	ikn4PhBiSfCeqxXv3LGCmEIUvIGjus1QG5kNfybsgCfZsCdfYh9X6VLEKYInONJ3/H9AZuIgjkm
	L0U8ULs4vwR7yntBOLM+sKT8+Lz5YHdG46pra0BINPg5Tkm0OVEapF1gZq3qTqWQufbhMnpnk+b
	F0xxxU5rSbenYIpXdgFf84ntJL0NbY6rGUqMDuDdrY/dmI+SnczphYs9N2qTnj5zY+tMQGwUBRZ
	tyl1V89Yaaw+4g5d/W/ZXpFiN7irJbBQOxCvJhsluAF9APO9KNDaAbyjU7Y9kyvZHWJ57y6UpUh
	20FkvyOzEZUQO1u1cq0F8bBp44HUdvJOXoLGE
X-Received: by 2002:a17:90b:2d4c:b0:387:df8f:1401 with SMTP id 98e67ed59e1d1-38fbc598becmr9021699a91.34.1785750344781;
        Mon, 03 Aug 2026 02:45:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4c:b0:387:df8f:1401 with SMTP id 98e67ed59e1d1-38fbc598becmr9021646a91.34.1785750344278;
        Mon, 03 Aug 2026 02:45:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:43 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:37 +0530
Subject: [PATCH v24 06/12] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-6-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=5554;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IqjZzKl7BNCcMxSaF/5GXH4dOI6iylxX8niIaIkSeSQ=;
 b=VvuvdMCCFfCnpfXMiifmJIg8ToW9mGWhz/YcyhcWBwYZyQ++L8G27zDMPlOvzPWKAgRM6T2dZ
 hAxw26BregDDZ4ndgGJJEgdlZIWzxDPFme60Q11ADtcSKqSRYEiKRjY
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a706349 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5CqnhzuZLWPXzHx0y-cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 3knippFaHp7c12kANyHr_NP8sNKPur4J
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX9yfdqMNWPfau
 SPeXZC/s4HZs30VAVs4usZPc28GTkCBXzgF+x2sMqkTbOszgJ/FitnO7dyRvUUoF9S/0Zp4Ej3z
 4rdib5B3LXx7zzX6S3gBEb0BuzYrHkU=
X-Proofpoint-ORIG-GUID: 3knippFaHp7c12kANyHr_NP8sNKPur4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX4lzuYd/HQamH
 uRbzXyR6TqPerhTVnvzTQQKKbUPo5Det9Eo1QHWeZxw6Kd20nA6lYaQDeokEH67bMR0YyiRRXtO
 s/Z/hUZ1acmCB3QqFYSJqTyvtWijGQ9bZz3gSq1Ak4blBzXlexj8c5Q29brV6KZaljluaB0C+Is
 L1JwopuJtlcXVLWEddMRCkSiGO5gJq3MtsAErHLjuI75HSuFoFXQbT1Ef6RDFYT2MPUoMagtARn
 G5DkwYmCIyCMqxVCuCCJdoyPLNazIzJQkxskiQenWwUh55EDpnbJi6VZnbF0XVwncPmk9JoL6hD
 9kqke0WylTI+MhLXP4dyVS62UY2WqPUtz37a+gz2TZmhPcM0IPolKmM6bpphx9utavDnNbENCys
 H+Q2/euqRNJJXO6WMGigx2shQ1djAgGmWaiAaS3SQyVs0V5FSC7krwzBVZxijdIEbrQqiVPFNGc
 u8CCzjs0MNUJZ0zRa1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add a psci-reboot-mode driver, and define two types of PSCI resets,
predefined-resets and vendor-specific resets. Predefined-resets are
defined by psci driver and vendor-specific resets are defined by SoC
vendors, under the psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                            |  1 +
 drivers/power/reset/Kconfig            | 10 +++++
 drivers/power/reset/Makefile           |  1 +
 drivers/power/reset/psci-reboot-mode.c | 82 ++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b6e4f89f319..a3339b98ba86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21672,6 +21672,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/psci/
 F:	drivers/mfd/psci-mfd.c
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..143f3260f04a 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -360,6 +360,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on ARM_PSCI_FW || COMPILE_TEST
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+	  the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78e..45d8aaaffaa1 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 000000000000..2f960fda8229
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
+		.count = 2,
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
+		.count = 2,
+	},
+};
+
+static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
+{
+	u64 cookie = 0;
+	int i;
+
+	/* Build cookie from arg2/arg3 cells in order: cookie_hi then cookie_lo. */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  const u32 *magic, u32 count)
+{
+	(void)reboot;
+
+	if (count < 1 || count > 3)
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct platform_device *pdev)
+{
+	struct reboot_mode_driver *reboot;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+
+	ret = reboot_mode_driver_init(reboot, &pdev->dev, NULL,
+				      psci_reboot_mode_write, psci_resets, count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(&pdev->dev, reboot);
+}
+
+static struct platform_driver psci_reboot_mode_driver = {
+	.probe  = psci_reboot_mode_probe,
+	.driver = {
+		.name	= "psci-reboot-mode",
+	},
+};
+module_platform_driver(psci_reboot_mode_driver);
+
+MODULE_DESCRIPTION("PSCI reboot mode driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

