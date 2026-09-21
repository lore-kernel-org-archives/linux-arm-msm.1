Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809249F104
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995553; cv=none; b=Zx2NIX/oe/YC2baK+GH2nby3Uuto5BZKFPYET1Fwd1qUzPuGnYGiNY8+Aiu9nlHDPFcIL511nsUJJhoafYdCeQBTCkcHKBAX7+v7FUMdmiJtN+CtK0c7PneifO4UtDVpGI5fehMiBFEK/LvU2UoO3KOqSV63PCGQ66uY5mnoFVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995553; c=relaxed/simple;
	bh=E327Pomf3JKllBCL3eKN9FPAVurkOetH3xJ+MFfA5xM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqJ2KXG/NQc9vxpnlq2V+oPA78NY77xx3lxjpQGQwvE35UMfBdx5+wzYlqmrW9bA3kPz48uc7gxsV06VzZNDMRsQ7pPPZCzoqFcFg0dOqEm6ej7JU2H12E3J4WGgyrzMYJsk0CcC1RiToVmKnK4neKuKvYxyzRIb/ffWKaQ3B4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jT3eFuSz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5epBWkG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jT3eFuSz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A5epBWkG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAduH6287294
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AqSFKEEkwVYj+NtZ0MDSRuOaTWu6Z2jWfDJcWGHQ/A=; b=jT3eFuSztVi0e+i2
	SbwHg4kOwD7T7T/0jFLOyXg6lgKMRcFXDWJU7M4K9IhfSRAmDrGsI6hf8oanaUzU
	qIpVOcGntXsoNne6PFRCe8f9+AYV/HrM7xwpmFUuu4nCViqpmRz6sFdVXjp+i0lg
	0HX/IQEBvLEwzk4LsIDUySFsQJC7BHrO4nwk8jpFXs0fP8XorSZJSJy4nGZsm8Zp
	Eqp4TCzKsltTVxUDR3ZV1S2vLg2KD5iGqeunU6feczilIsHTSbNRf1ykWXoNTOBS
	Pm18mWNVj4dXUZrUs/wVNNXXhigqTMmpv6plARRUIhuDqc+32z3GNiUhFSniSsMp
	PtggVw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1548-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78f2fe53829so2632883137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995549; x=1790600349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AqSFKEEkwVYj+NtZ0MDSRuOaTWu6Z2jWfDJcWGHQ/A=;
        b=A5epBWkGVNfWpTZvBThLsGnP/DjQBhxHT3INN51FjY8GOKWODi/5UlNEXBh9OZ8xas
         DuqZH4zfFuhtlzEIFTHJWf6lKah2AjFauTQojkvj4CFzCh91QgcNVW6epKiUFjj/XPWd
         VcVJhx4dN6IMWAoqeqBx60RiGigx6WkSK7wK0+y/jcY4ziT4xKgniv+nkKqmRvDx/lJ0
         1OCDwPdq8nFPMXi9KhyYQ4G/qrF4UAKjyjIA8ciNmaKRoQMf8ieAqd0KFup1/UcH9EUS
         hdIaRY3eAWNl8qKpOaXhb5FxyxBcoQs3vvrDUmvn3lcqeN2bXGfQmhS2ZL68aNgLe34y
         sfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995549; x=1790600349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AqSFKEEkwVYj+NtZ0MDSRuOaTWu6Z2jWfDJcWGHQ/A=;
        b=SDHZFSuHd97qdr9mkHiELPBCIs5T5FWvAcZd1mquHzK68kviHzV0smFNrA5X9RkWd3
         Ff//zztTCAjQkggP/nT2iM2bsFxnWxxTWQi383WZ39OAX/kSqc8rWnU1hXZBdOmkt3dt
         pQtyrnNNPojjlHNL2w9zFBMLLzs08GatH/VVEO9v+MQqntnD63lItEhUnVmhVYEQpZdn
         XiwCNvow6R2wJ8IP098QOLgeVXqEuagDLNamCxITEg2FBO2WvtLilV0m9oXB5u+dD6a4
         nNhYXf6O7FQVMFVzQ5hrdJib9tFTn/bxLopAC3izAYndhlLRLpOhU7op7ZJNeMyykFoY
         TNaQ==
X-Forwarded-Encrypted: i=1; AKwUvByqHqCDelskfMoUnYi5ced+1/KTsqKsMyn2GOG9c9O/4P/seT3DsEbmQ71LJ0QZbam+sclnqLn2vBdQnHCI@vger.kernel.org
X-Gm-Message-State: AFuF++kL+Z7vrLRv1Myp3hizzQ7RhL1jTyqffZ9P7J+0zSiWPBeUFhcZ
	/Cj0g9AoEZ3x/ZmsvKx/O2X5WZQmcPbGIz32MHu3XK7WBIG3NKyDdUEReOGPFaG4+zh/0A7H/c9
	YyuW+cu6s3Q2MH24XUaIJethwyaqGQapOWUGTvr3uLRc1Jku79ijtDytThCrwO6FtvjAo
X-Gm-Gg: AYBFou1lCaXfS4vDBrMTjD8sXwO4jO0PtFtKt6cKkY5qES3rFvht6kB+YXzcvNzR0dq
	CY3ZAI/m+O7lDw7YoiuUPF7PseAmTmRK2k2//lnZbSBNPg23yhzQtTDqNWNl38kCCy2FK0LqnpR
	a6+A7gQOdwUO3BkrazfaP5g9WVcIzlOTEBVkTTz03nZiQn3Kb1AJ7tV51s9iBD/fsS3EYv0a3W5
	F/N+YR3UajO7jImr+aYQmRtI5n1q89PEcXmFpVkIziWUBbO5pE2KqpwvjofOokAx9jv8FBOKTS2
	sUIh0b6BMvFUVZE95xFYKUM2dT4BRiuR3nzhyzqb/DQI6GFydOgWPRzk9I1++N6MjDLI14Mix40
	DEww1UlGyp01cwzVUjjSsoa+mku4=
X-Received: by 2002:a05:6102:6890:b0:7a1:f7e2:aade with SMTP id ada2fe7eead31-7a55c28a6ccmr4962293137.16.1789995549407;
        Mon, 21 Sep 2026 05:59:09 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:7a1:f7e2:aade with SMTP id ada2fe7eead31-7a55c28a6ccmr4962267137.16.1789995548881;
        Mon, 21 Sep 2026 05:59:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:59:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:21 +0200
Subject: [PATCH v8 12/14] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-12-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E327Pomf3JKllBCL3eKN9FPAVurkOetH3xJ+MFfA5xM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSnzPkzRZxhXl7foHcU+1E5GYUoORYlNL6MAH
 auGzuiarRaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp8wAKCRAFnS7L/zaE
 w63tD/4jVpOnPxw4kGs/0iApyM/Y9G214wzm8NjO9bF+C/1ouSz9dM1BTK1oyNwrr69SLJVjd+s
 V+FaAVwA2GnO6p1UrDqig6sjJ/Fq7+CH7apb50f/we+EjUa3a5fmf7tEnGPrpI8Xh/Ann3eQ1e8
 m+SC2j8pwZyyUBzsyZQunn8IQy5QxbOpEcLpuNLgaIcc/49VraiomKLc4tajB/39lssnRPi6mc9
 5Iv21zNF7mskkNA95VL3f6QvS7lU0TRFn0jpiXDM59gQMb/qcSm3/gwmFMK66Ytm1UZfYOxdfio
 FR13JdjerZeIiZCPa7CvCS5HnYHbxELR5qwhILylAtDWOc90YQyekhX/uooZeP0k2nt8OL1vGEt
 jIL4STRAcIkxGeMod6M30yFsEPOsu1+7MzSG07gUmcoDZ0KNWDM/wc4tz4RafDGZtRL6Swx8n64
 yFBOKytBp1WAQPuLWE4jltZxhesaEIm/khO0u2gVgsGq4b8b2Oqfl+3aEEiDr4BdplFvLWqeq62
 wGZpC2M4rs8tGLVORspQgvTVPuidY1P+tu1zjGZal6Mz+Z8TtEl/IapS+W9ghtPeQmXOqmf1OgO
 Tnj2WgZWGChf9WjMALz4UKB+s59HgcAWPaLbgxuAgav3i3EiAWYsvNNOJOu5CHQuIOHdcFXx6i1
 dwen9plIPcZUxnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX3c/fcCgISzYC
 8IQ4ucgCoxZbNGXcKqR3MTWgz7Aju0Z0H+79rwfe6Y4D+zl2NDN3t5Mj1xrn72+8l2IVGae6uUK
 nWoKsxbsgGKSN5w+5GZoRiQ4EDskOpA=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab12a1d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=EhY2VP3nYDlqWzrqXREA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ehGLzPbcqIWMwxxybKmf2aQWXaD5ZxRM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4OSBTYWx0ZWRfX/a07Orv1v3vU
 2bQUhE/hm0IvcMBwbuBn8OgqlFRapJD9UO4+FXEnB2iqm7XBbzGGItRBjx0NUm1V0F8AX+a8uls
 WUDhtW6YfsrCwmeTQSveGxqaWsE6HXHG3Fw8iPWBvJe6RjV0G0sw//UAwr2Y071hVHQ1ZWZi8Jw
 rmvlzLJXF3cDTxroYpTxZa/CPpu0zvzSI/JRba+4PJrqkA9MgcJW5JkUAl7dAEsDSxR5eXlLy91
 McXnpIn+KPq9h1NAkoLGqH0rnOXRltXipgzBXfrXWWfmUVXNGU/jhSx6sDip9qn3XU29e82IQ6V
 L9VMcWVJ2Opwf2QXXF+ht3Of7Eyz8yBjCa1D9tpMIEc5J4g5GYR9vDyVcpP16osyhnbJsBVT4EU
 xrlrb31eFoUtECH7hCgcC8NWEjpQgaMLGNbOPUEyg+8iYEKZBl1dPgRGFeGly0onwALRtQZpzlU
 XS1QfdNhLoCrL39D3Tg==
X-Proofpoint-ORIG-GUID: ehGLzPbcqIWMwxxybKmf2aQWXaD5ZxRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210189

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 9f703261d7ac6ccde861b8d29626025bcfdbda8c..81c6634e855be23698591da6d3743ef68b516006 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -121,6 +121,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 798643be3590cc8303854658fd483b7807d2230f..33dfef07e7db2c0488b14c78f098afebf689d013 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..8a9d070935cc87eaf20ae2db25f304cf4b2694c0
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	static const char *const *subdev;
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3

