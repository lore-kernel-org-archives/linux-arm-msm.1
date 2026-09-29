Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76AF41D133
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651877; cv=none; b=tvT+n5/VaULSA/4b64mQgyk7fv1SX0qEpGW08TU1DtoTHwWWP5JyDHMWesVJhJ9UxtDxF3t3ymLH6KAUvIA0mCvhrkXXaYDfclMI6hy8eCfncmj+JUaoT4oBxWKGHKNO3n39Iv0EdYlO0I1S7z6w8tcNcR5s0N8vSh3mtZ7EfLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651877; c=relaxed/simple;
	bh=ND+eFkDAA6lA1Hvzr2cEf42GsP5u1CTq/6obWXCSr2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0zkPf9McZDQE3jbheMO/fPufTuOhIFSTPK9oPrjfZbY+mPPwblPEREF0vLfQcqRWELXJxSKYrbVrr/175p629IdbqmioDKMBNpXf6TvnLRSs2+/J2mwYTDKBp9Ey4gFk5OJIbPYYlwSe4RBNxYF8St6FxYUHCJwq6bTPDNg94w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBaK3aEH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKuE81ZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBaK3aEH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKuE81ZV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0j23e2341777
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYZA6IzfrtVXBF8cqfLfidDynaxNcZHoZMTCP6wtXsw=; b=aBaK3aEHCjfBukWV
	NM5mou+lpo+pfd+0PuWXPIDZ0vJ2DlvOXJhbHqmgnFxc5fb6D04tb53FpG2Q/YEL
	50JnAIKzOemLiPr9ugGIlhhjqt/v/eR9U6YjqJRFRpLL7LACiaW2dgnj+2vXh0uj
	A1cfjRlm03FcyrTeEtvsmm5AzZahadCCwWVGw9uqrybliON8MGKfGND9Do4I/XeH
	RNPuzeT9vq4si1iTjXIJNd5N+C8do3ovbFxMVpf1wUwJmouxDTIK44U7RDHDx2f9
	cJH/hENLiuX03M5b8NKaPlWjrv0pSnFlYEYuogk5XQwb/514iL4fiiZS1aE7kyks
	VhoTxg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw21w39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-349ffa249bdso2374134eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651869; x=1791256669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYZA6IzfrtVXBF8cqfLfidDynaxNcZHoZMTCP6wtXsw=;
        b=EKuE81ZVGENa6WvCx6GSzR8Zzpu5NBKHSvBatSFWSi0QVVrFfOgshZGCzezsb8BX+H
         yu3VqGlc5O+ORtH8lki+G8vGHkTjeCNVOzQ4qsKhwA8Hd1WPkKvfiJk4XoAMfNewNhLG
         Vxg8Ww05xoc+VXH2jJkbc8dqkdVtYM3m0SNhOkMiWg/P4pRVUx8yw0507eoNrQR6YrLc
         eEu6MvFhepOdjIwgYhoagiL6mv3K80wAEy/g9fbPDxj4EatbWUglDqyv22X2UJZBJNsH
         PYG4yblHntPe+SQNNvZDg2g2QVHDqJP1oUFAkzfPCF+P2DAdR98E6d1xEtTNCp0s0mY4
         2rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651869; x=1791256669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYZA6IzfrtVXBF8cqfLfidDynaxNcZHoZMTCP6wtXsw=;
        b=u2oEJr6oXTFhTQDfOa4Qem/CeONGW6p1GOYO5WiVhhj68McbDmyWkouQ5iBigoVXC4
         uz+10dko2L5hCpw0RQKFYG6BmU84O1N+Slw++pF+zWu+5VdJv/6HsuS0MPPlk0eFeUDT
         bvWcIYJcAcv5VkrA2hUJiibraxju0q9rJPJCJKMcRTVAbS3+cSAX7SgYw+fU7UtFxf6B
         gzKZW9AFR5RMWvqu9xvydRz+Jft9GTpkHvyfVtqsoX9dRyUMBXCZBj+AoS30f9zeUJgy
         X53oku2I9wmbGg2j0rVvhbGbdIl9cCW8D8T8pyu5sgfg4myKYvr/wls2PjCN41YjNeYW
         fyQA==
X-Gm-Message-State: AFuF++mqGIO8ecoHc1uYMoVU4fhGrAch1Mn8Ajzg9pyUrAyZxqJ93BCr
	UB5J0ruIpTrOkaSFR/CEpJVsbxtU1JZo/jd1p4xeEa0LV3QPDmCp3tF5IYCESiuvzv+SCQ2HKEL
	bhQYOIlHp//ZbWVDcuA5QQ0UU5rA/XoJ/25qRFW60u0g/kkUhrhx/WAtHBsLgOsgcz+E=
X-Gm-Gg: AYBFou1s5xHM9ihNTXGkG/VyUDvtHJkEAZXzlap4AhFHDQSZT+BXzy8kvd8hpjTdxPR
	7zFxuq019IHoHtNifNBs1dl/QQuXrmAS6yD/qtMQkrbSm2nhFIL6aCREO4tw6Y6pINttSMoO790
	NfeKNXAliJUEb0NZTtF5BT3tQufuCYJeiATJ7YYoGIf1cxx6oaufyuVWpEPdPeqhJCJVpvFd9xI
	z9o3PF6+RFmicQQ+009eySrWbdRgDXup2An21eQHaB1HmXoyQcI3rJ9WvjUZthvtkKo3jrxSwtZ
	Vl71+bRJNAF8jxLFPfXul2mUhP8kIjsHQ45jwQJxJuv7XDbcIIQv3R9tVA3dWbZtzvPWVT27yh7
	RvTqGOyh28Pai0KMbmNbT0v93WsE1CjKD7qkrOBhDIGmaJ54GqMc2ZsjB8L8=
X-Received: by 2002:a05:701b:4250:20b0:143:298f:33b7 with SMTP id a92af1059eb24-146d096d14amr11692162c88.47.1790651869039;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
X-Received: by 2002:a05:701b:4250:20b0:143:298f:33b7 with SMTP id a92af1059eb24-146d096d14amr11692120c88.47.1790651868128;
        Mon, 28 Sep 2026 20:17:48 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:47 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:54 -0700
Subject: [PATCH RFC 03/10] firmware: add RPMI TEE bus support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-3-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb2ddd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8-py22VFfN3kZz82q70A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ZopBPeJgS8HgFn9m3Otfgn4TaYGwOPRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX15IUriWx2CHe
 LHWaN48U+iKnpFTfv/B0DK+7ZcLAcI86lOzhPBXmSDvdmSdubAh7EFrnqN3E+XvqncjqmUZEY/r
 dw26XX2mdQW0zZh2oTjf6Z2Dw3dUBzj6QrP4DyJdcWtroKQLCUAjLig1e1OJoO+UFH8pTyqP5t2
 lCvd5RSSBAP8LUT639tRKvx3DqtTMTxW7SAYoUZ0nANTzqxOqebPDEqrz8EJtczXBN2xDvLklGo
 FR9p9i0fbb8vk691jPY88uaMeTFkmL/EEo6uSaQhKEYFhreHer+q13c4itVSjoIlalDPDwktiyV
 9sFEWYzHRiszz58OD6Y8EBK/kKUfJbCoKtQDaOe5wyGWtD2n7MhPPFveuuhhQVzmwRBF9T6t2Ol
 wzHScWjrOzF+j/V2Uh0b/cqDNvvGXuB/laRPEqMdrw6sJZRyydw7An6SWBvEESQrsmJA4Ih2l4a
 ArRKZHnBflfgt++taiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXyekGjuCBNZh0
 jaCQ1zRnjVRyIXX02pqBsvvK5/ugJIGg7DzmndqPpektcHAQM57Xl6rOOIc8FIrzAXdg7Q8y7jP
 7YZB6ubn/aG5WneOoM6N+Z2Ds8ZC2Jw=
X-Proofpoint-GUID: ZopBPeJgS8HgFn9m3Otfgn4TaYGwOPRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012

Add a bus for RISC-V RPMI TEE services. Each service exposed by a
TEE endpoint is registered as its own device on this bus, identified
by a UUID, so that a single physical TEE can host multiple
independently-bindable service drivers.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/Kconfig                 |   2 +
 drivers/firmware/Makefile                |   1 +
 drivers/firmware/riscv_rpmi_tee/Kconfig  |   8 ++
 drivers/firmware/riscv_rpmi_tee/Makefile |   5 +
 drivers/firmware/riscv_rpmi_tee/bus.c    | 202 +++++++++++++++++++++++++++++++
 include/linux/rpmi_tee.h                 |  83 +++++++++++++
 6 files changed, 301 insertions(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index c183d98c1e8f..46297332288f 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -6,6 +6,8 @@
 
 menu "Firmware Drivers"
 
+source "drivers/firmware/riscv_rpmi_tee/Kconfig"
+
 source "drivers/firmware/arm_scmi/Kconfig"
 
 config ARM_SCPI_PROTOCOL
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index a855d3696173..772fe024baab 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
 
 obj-y				+= arm_ffa/
 obj-y				+= arm_scmi/
+obj-y				+= riscv_rpmi_tee/
 obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
diff --git a/drivers/firmware/riscv_rpmi_tee/Kconfig b/drivers/firmware/riscv_rpmi_tee/Kconfig
new file mode 100644
index 000000000000..b0396183b87d
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RISCV_RPMI_TEE_TRANSPORT
+	tristate "RISC-V RPMI TEE service group transport"
+	depends on RISCV && OF && RISCV_SBI_MPXY_MBOX
+	help
+	  Say Y or M here to enable the transport for services provided by the
+	  RISC-V RPMI TEE service group.
diff --git a/drivers/firmware/riscv_rpmi_tee/Makefile b/drivers/firmware/riscv_rpmi_tee/Makefile
new file mode 100644
index 000000000000..d80ab5bc9dc4
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+rpmi-tee-bus-y = bus.o
+rpmi-tee-core-objs := $(rpmi-tee-bus-y)
+obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) = rpmi-tee-core.o
diff --git a/drivers/firmware/riscv_rpmi_tee/bus.c b/drivers/firmware/riscv_rpmi_tee/bus.c
new file mode 100644
index 000000000000..32f555c2f1f2
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/bus.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V RPMI TEE bus
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/device.h>
+#include <linux/ida.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rpmi_tee.h>
+#include <linux/slab.h>
+
+#define RPMI_TEE_UEVENT_MODALIAS_FMT	"rpmi_tee:%pUb"
+
+static DEFINE_IDA(rpmi_tee_bus_id);
+
+static int rpmi_tee_device_match(struct device *dev,
+				 const struct device_driver *drv)
+{
+	const struct rpmi_tee_device_id *id_table;
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	id_table = to_rpmi_tee_drv(drv)->id_table;
+	if (!id_table)
+		return 0;
+
+	while (!uuid_is_null(&id_table->uuid)) {
+		if (uuid_equal(&rdev->uuid, &id_table->uuid))
+			return 1;
+		id_table++;
+	}
+
+	return 0;
+}
+
+static int rpmi_tee_device_probe(struct device *dev)
+{
+	struct rpmi_tee_driver *rdrv = to_rpmi_tee_drv(dev->driver);
+
+	return rdrv->probe(to_rpmi_tee_dev(dev));
+}
+
+static void rpmi_tee_device_remove(struct device *dev)
+{
+	struct rpmi_tee_driver *rdrv = to_rpmi_tee_drv(dev->driver);
+
+	if (rdrv->remove)
+		rdrv->remove(to_rpmi_tee_dev(dev));
+}
+
+static int rpmi_tee_device_uevent(const struct device *dev,
+				  struct kobj_uevent_env *env)
+{
+	const struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	return add_uevent_var(env, "MODALIAS=" RPMI_TEE_UEVENT_MODALIAS_FMT,
+			      &rdev->uuid);
+}
+
+static ssize_t endpoint_id_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	return sysfs_emit(buf, "0x%x\n", rdev->endpoint_id);
+}
+static DEVICE_ATTR_RO(endpoint_id);
+
+static ssize_t uuid_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	return sysfs_emit(buf, "%pUb\n", &rdev->uuid);
+}
+static DEVICE_ATTR_RO(uuid);
+
+static ssize_t modalias_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	return sysfs_emit(buf, RPMI_TEE_UEVENT_MODALIAS_FMT, &rdev->uuid);
+}
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *rpmi_tee_device_attrs[] = {
+	&dev_attr_endpoint_id.attr,
+	&dev_attr_uuid.attr,
+	&dev_attr_modalias.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(rpmi_tee_device);
+
+const struct bus_type rpmi_tee_bus_type = {
+	.name		= "rpmi_tee",
+	.match		= rpmi_tee_device_match,
+	.probe		= rpmi_tee_device_probe,
+	.remove		= rpmi_tee_device_remove,
+	.uevent		= rpmi_tee_device_uevent,
+	.dev_groups	= rpmi_tee_device_groups,
+};
+EXPORT_SYMBOL_GPL(rpmi_tee_bus_type);
+
+int rpmi_tee_driver_register(struct rpmi_tee_driver *driver,
+			     struct module *owner, const char *mod_name)
+{
+	if (!driver->probe || !driver->id_table)
+		return -EINVAL;
+
+	driver->driver.bus = &rpmi_tee_bus_type;
+	driver->driver.name = driver->name;
+	driver->driver.owner = owner;
+	driver->driver.mod_name = mod_name;
+
+	return driver_register(&driver->driver);
+}
+EXPORT_SYMBOL_GPL(rpmi_tee_driver_register);
+
+void rpmi_tee_driver_unregister(struct rpmi_tee_driver *driver)
+{
+	driver_unregister(&driver->driver);
+}
+EXPORT_SYMBOL_GPL(rpmi_tee_driver_unregister);
+
+static void rpmi_tee_device_release(struct device *dev)
+{
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	ida_free(&rpmi_tee_bus_id, rdev->id);
+	kfree(rdev);
+}
+
+struct rpmi_tee_device *
+rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
+			 const struct rpmi_tee_ops *ops, struct device *parent)
+{
+	struct rpmi_tee_device *rdev;
+	int id;
+	int ret;
+
+	if (!uuid || !ops)
+		return ERR_PTR(-EINVAL);
+
+	id = ida_alloc_min(&rpmi_tee_bus_id, 1, GFP_KERNEL);
+	if (id < 0)
+		return ERR_PTR(id);
+
+	rdev = kzalloc_obj(*rdev, GFP_KERNEL);
+	if (!rdev) {
+		ida_free(&rpmi_tee_bus_id, id);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	rdev->dev.parent = parent;
+	rdev->dev.bus = &rpmi_tee_bus_type;
+	rdev->dev.release = rpmi_tee_device_release;
+	dev_set_name(&rdev->dev, "rpmi-tee-%d", id);
+
+	rdev->id = id;
+	rdev->endpoint_id = endpoint_id;
+	rdev->ops = ops;
+	uuid_copy(&rdev->uuid, uuid);
+
+	ret = device_register(&rdev->dev);
+	if (ret) {
+		put_device(&rdev->dev);
+		return ERR_PTR(ret);
+	}
+
+	return rdev;
+}
+EXPORT_SYMBOL_GPL(rpmi_tee_device_register);
+
+void rpmi_tee_device_unregister(struct rpmi_tee_device *rdev)
+{
+	if (rdev)
+		device_unregister(&rdev->dev);
+}
+EXPORT_SYMBOL_GPL(rpmi_tee_device_unregister);
+
+static int __init rpmi_tee_bus_init(void)
+{
+	return bus_register(&rpmi_tee_bus_type);
+}
+
+subsys_initcall(rpmi_tee_bus_init);
+
+static void __exit rpmi_tee_bus_exit(void)
+{
+	bus_unregister(&rpmi_tee_bus_type);
+	ida_destroy(&rpmi_tee_bus_id);
+}
+
+module_exit(rpmi_tee_bus_exit);
+
+MODULE_DESCRIPTION("RISC-V RPMI TEE bus");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
new file mode 100644
index 000000000000..c499f0427833
--- /dev/null
+++ b/include/linux/rpmi_tee.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * RISC-V RPMI TEE transport interface
+ */
+
+#ifndef _LINUX_RPMI_TEE_H
+#define _LINUX_RPMI_TEE_H
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+struct rpmi_tee_ops;
+
+struct rpmi_tee_device {
+	struct device dev;
+	u32 id;
+	u32 endpoint_id;	/* RPMI endpoint identifier of the TEE. */
+	uuid_t uuid;		/* UUID identifying the TEE service. */
+	const struct rpmi_tee_ops *ops;
+};
+
+#define to_rpmi_tee_dev(d) container_of(d, struct rpmi_tee_device, dev)
+
+struct rpmi_tee_device_id {
+	uuid_t uuid;
+};
+
+struct rpmi_tee_driver {
+	const char *name;
+	int (*probe)(struct rpmi_tee_device *rdev);
+	void (*remove)(struct rpmi_tee_device *rdev);
+	/* NULL-UUID-terminated list of supported service UUIDs. */
+	const struct rpmi_tee_device_id *id_table;
+	struct device_driver driver;
+};
+
+#define to_rpmi_tee_drv(d) \
+	container_of_const(d, struct rpmi_tee_driver, driver)
+
+extern const struct bus_type rpmi_tee_bus_type;
+
+#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
+struct rpmi_tee_device *
+rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
+			 const struct rpmi_tee_ops *ops, struct device *parent);
+void rpmi_tee_device_unregister(struct rpmi_tee_device *rdev);
+int rpmi_tee_driver_register(struct rpmi_tee_driver *driver,
+			     struct module *owner, const char *mod_name);
+void rpmi_tee_driver_unregister(struct rpmi_tee_driver *driver);
+#else
+static inline struct rpmi_tee_device *
+rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
+			 const struct rpmi_tee_ops *ops, struct device *parent)
+{
+	return NULL;
+}
+
+static inline void rpmi_tee_device_unregister(struct rpmi_tee_device *rdev)
+{
+}
+
+static inline int rpmi_tee_driver_register(struct rpmi_tee_driver *driver,
+					   struct module *owner,
+					   const char *mod_name)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void rpmi_tee_driver_unregister(struct rpmi_tee_driver *driver)
+{
+}
+#endif
+
+#define rpmi_tee_register(driver) \
+	rpmi_tee_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
+#define rpmi_tee_unregister(driver) \
+	rpmi_tee_driver_unregister(driver)
+
+#endif /* _LINUX_RPMI_TEE_H */

-- 
2.34.1

