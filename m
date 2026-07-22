Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDA3DA5B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703622; cv=none; b=ZMAUya5RMxbd86j2Dm0UN0Gp3ex/FCVhKxJlZ0gOmn593wj+l5wlzZtrCBfmDpFHIScuYv/Hp4h7ubfBkVOgeIhDKpidoDqRR9co/ioOqxoVzNBGh9u7ZuC3zkxceT2RD7/0JWr8HM9PiZfLpkMk6fwZQmD70PQ8qjpYwh2B0qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703622; c=relaxed/simple;
	bh=LosjvZDIaSYjB3Gq/q9l/AWJ3RurWA5UZWsVfICp0jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBP5zVhieysL1X9YLvuKaJW7RbFhM9BTaUuVhaumjnqeGawwKQtXNJkRrIzIj5WMy7FUcJp7gUhfZIPn2kNWbXhzwU1llsvv6XuiNV1x+pBl8oNSBqpXJYthcHStGas6wnhkjQ6IrTwz86xOnI3C640aJoG5102Gp7ujBzbWe1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7dEPz1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFmtVcje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7dEPz1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFmtVcje"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53nBr3917721
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PuxTn6tqXxb1UzBUrLi98bIB+U0tB5y7IeqUgq/+Zo=; b=F7dEPz1m5gjDttwk
	pJbhI7KpMPUUrvIHLIyrKr3fGKVUvkJHJC/Vcw7ZILPm85sk6OmU/6MZ1PYkyn7G
	jX9NaW2P7KxqlfWnsFE3sYmjJWkbOyncPuSbQUY744zokQg7/jrr+bCdg5A1WvfC
	SrqMphAcEthUsD+gdknhVUNnr5cMk5OEKAESxcgJemY1lz2dA9sQfMpOUXMlWePn
	zGXd7HZnw6pHvM0jh+OQdH7twcEek1a2SnThgnNsmrr6Kq9dchF6KTuvMJRGXKMa
	s6vXAvacWatqROEwGEDXEIhk3WjRHCmAWimY0fTl2UM12iAr6b0I5IG8gtx6XkcJ
	R25Wqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6aamqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:00:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so124878585ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703607; x=1785308407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PuxTn6tqXxb1UzBUrLi98bIB+U0tB5y7IeqUgq/+Zo=;
        b=GFmtVcjet+jMHv6BsitaccEbeH87Uz9dq685ehTvWQhyaVUkLBS302s6PMDuvIXZlv
         dV83P/5jlAExChh6pFKsRXliFInGA7PI/6LCIFBtOFgG+kr9mC/MRDw0/vQpvrXL9Skh
         eTeq3RkBBIteG+aU8wpaxPtuk6pSDYcwc+vb2pLev0zM20QWFj09Mp+CPfX0Ocu3r36E
         XBGK5gcqa6RF2K+uV1Su3EDnA41ZrT/u33phrjAKr26QKKcjyQlFxBEnPln9bqL0SUjs
         jCz/F6uBJ6Y+Ol8mhaWQMGmY2rLLUNbh9Dm124wWnN72ine/eXA8bCr5vRMEAPQ1ytch
         VDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703607; x=1785308407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PuxTn6tqXxb1UzBUrLi98bIB+U0tB5y7IeqUgq/+Zo=;
        b=Yf+lJq6TaUCqTH+Io1YmZFFMVoW1FMQnCUjPrVrOCOh+PtDRr9V3D4yHPu85DPL7R4
         XYcqBHpLe8bBUu2wrZsbjTaKKLC7uyXofn461WX66YGPFPVferVy6R68ky4bG9cQ9qjZ
         mGsuWOWx4/FOONleIfutxIHzbNpdqJnNA9/86AmKe8Dbx+sxU1evyHK56mN8sLMoLUu3
         AsKns2QNT9OGhcKA4Wh7bK9WcATe+8CYA7Oy4bjDDbO8xIsD3QbVS5iAR923YJ5K+NhI
         bvPl6FNEw4Q5cGuUXKbUS955NlXrt1GOPu8/vwxJ8hHL83lrtu6xoAW6XiPjmKBZQrh5
         LkuA==
X-Forwarded-Encrypted: i=1; AHgh+RoVdXTy0WHb1O+dYjFDOnjXZ4AnBh/9TFpeHm2QKvSiih0vVd/bCt8M5NSpTDsgGdpyDXGwknd5w7zxFPGS@vger.kernel.org
X-Gm-Message-State: AOJu0YwbE/cPuW2hGlb5JWd3obbt+CQdpKL885V9papZi4RVbaZY5+xP
	5BoqGduHawfENcgp5/r25ZQT6s+IEQIyFOv/MuXlz+dFsAcM9LEMhKcy7ycpUmxlSWogr4Ky4ll
	aLALJxK34lyeER/8S74mC+Xcx4dPVRM8pL31WOJTbKasrJQwXbynIxQZRMz0SaqwiXa49
X-Gm-Gg: AR+sD133cPj5YrlGH+91waOpdsmJAcW7Lo/N7SMgDEMJMQJZAsmOMxhxFFWKF71rOd4
	n2SQ7qZj9cD1Ux5rqsR10ZslceYt2QzA6YXUN2QD7/apP/gIjw8dt1p5Tq2I4Mf7D4WiHZ8LyUX
	+PCbXWeAIs4YpfQlC48neal5+i66Et+oDdMkF12+7/CHuNqrvAjWFlJ6aNVFr6YFt1udaRpKXcK
	098LqTFWHLx9k8zaX15X4cQdlucyFUaX0BQyYNuK7yDUVea2VClPSnMxOuturk7tT2TYQxPuG2G
	rxPaKxyTlW7JTaC7DfqeTVi05ylHVK3VunV5xjbiuLQ56r6ziTpm+tKon0inM155eBukcSKqyB/
	+Y59fzu5RvPHewh68jRTT6A33tg==
X-Received: by 2002:a17:902:d2ce:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2cf34997962mr232058345ad.22.1784703606327;
        Wed, 22 Jul 2026 00:00:06 -0700 (PDT)
X-Received: by 2002:a17:902:d2ce:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2cf34997962mr232057865ad.22.1784703605648;
        Wed, 22 Jul 2026 00:00:05 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd88f7sm9428935ad.22.2026.07.22.00.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:00:04 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:29:17 +0530
Subject: [PATCH v2 6/6] firmware: qcom: Add support for TEE based EFI-var
 client driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-6-b8a8fcbe4211@oss.qualcomm.com>
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784703569; l=26036;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=LosjvZDIaSYjB3Gq/q9l/AWJ3RurWA5UZWsVfICp0jM=;
 b=GL8Pd5NDBHbqi734JZA1eYHtk7R6u5+4cDNw052g8mCFumrKvTjv4P5BRtatR9Q3bq2pfmgrY
 /kVUyTjbnv7Ad7dvuoyuGMboF5fFMByZtbiiQmo45Qz8CIvDL/Mu5Y1
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX0aKwzvekrJHC
 ugs5TCNGZ8Z5K1fmi9gX0iGfl03q6r6FIJZiRPcvLx7PYU3GsR20gpwFc1q9+FEHam4VJpZo22n
 P/OY7Qa9FIODK3nR71To325bKXaCEOw9+XZH5tdrDRA04YhQwJZwXZfbgQ1dFuaBgknsOG4txrg
 znhDcjzNkK3wtq50EpPTRHpFtqXrJbh2KqO1uBHFS5RCSQvqhEpnpjRC1+wagT17nUDfDiG9UOH
 DePcxerFwgmjY7ih8tQrIX09ppY8mFmAc5WBVD90fS6VY1aYu+m7aSahxr8m2J+ir+G0/Yu2G2x
 sT/QBcJfO4C/Fe3vdotouLvtRc+D0sgo2leQAR2P5PbAAV46q4V4DSCdhyyeOxOYnQtisXb0r22
 I3syJYjzJn9iZsRxBpvBlYgYeD1FzS11Ae0DkidRy0RQzK1tiT/iHwhAjGwl5Ipq0Ebp40HPPB5
 tNvSgZW31if7rpQ1leA==
X-Proofpoint-GUID: O0set2-RSWwFNxGUM0ZYEPDpRq3BaeHf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX8SvF5IMLRzmm
 JYFz+w7AXWm4ZIC/03mY2Nk6XPEi7Z2ZjGS6ZBjsBsYUcWIU8nJnJUr6I8sMbHXsMSv1pz2b7su
 kLUkcqK3Nk6pDxAcEjp1n+IcXgGbQME=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a606a78 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=lX1A334Kam2MR8cuwK8A:9
 a=ZP9I4r549iL3ZUHD:21 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: O0set2-RSWwFNxGUM0ZYEPDpRq3BaeHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220063

On Qualcomm SoC based platforms, UEFI stores EFI variables within the
Replay Protected Memory Block (RPMB) which is only accessible by the
Qualcomm Trusted Execution Environment (QTEE).

For Qualcomm platforms without emulated RPMB support, specifically
platforms where RPMB is not located within SPI-NOR storage and instead
located on UFS/EMMC storage, non-volatile EFI variables can only be set via
a callback request from the UEFI Trusted Application (TA) to the RPMB
service running in user-space (within the QTEE supplicant).

Unlike the QCOMTEE driver, the QSEECOM driver (used by the current
uefisecapp client driver) does not support callback requests. And on
certain Qualcomm platforms such as the RB3Gen2, attempts to access the
QSEECOM interface fail due to lack of support within QTEE.
On all such platforms, a TEE based uefisecapp client driver must be used to
access cached/volatile EFI variables within the uefisecapp TA and ensure
persistence of writes to non-volatile EFI variables through the RPMB
service hosted in the QTEE supplicant.

Add support for a TEE based uefisecapp client driver which installs efivar
operations after obtaining an object reference to the uefisecapp service.
This enables the kernel/user-space to access/modify both volatile EFI vars
stored by the Secure Application (in-memory) and non-volatile ones stored
within RPMB.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 MAINTAINERS                                 |   7 +
 drivers/firmware/qcom/Kconfig               |  24 ++
 drivers/firmware/qcom/Makefile              |   1 +
 drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
 5 files changed, 677 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10d12b51b1f6..e8316007370f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22018,6 +22018,13 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
 
+QUALCOMM TEE UEFISECAPP DRIVER
+M:	Harshal Dev <harshal.dev@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/qcom/qcom_tee_uefisecapp.c
+F:	drivers/firmware/qcom/qcom_tee_uefisecapp.h
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
 M:	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index b477d54b495a..20ce8b58e490 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -74,4 +74,28 @@ config QCOM_QSEECOM_UEFISECAPP
 	  Select Y here to provide access to EFI variables on the aforementioned
 	  platforms.
 
+config QCOM_TEE_UEFISECAPP
+	tristate "Qualcomm TEE UEFI Secure App client driver"
+	depends on QCOMTEE
+	depends on EFI
+	depends on !QCOM_QSEECOM_UEFISECAPP
+	help
+	  On Qualcomm SoC based platforms without emulated RPMB support,
+	  specifically platforms where RPMB is not present within SPI-NOR storage
+	  and instead located on UFS/EMMC storage, non-volatile EFI variables can
+	  only be set via a callback request from the UEFI Secure Application to
+	  the RPMB service running in user-space (within the QTEE supplicant:
+	  github.com/qualcomm/minkipc). Unlike the QCOMTEE driver, the QSEECOM
+	  driver used by the QSEECOM based uefisecapp does not support callback
+	  requests. And so on these platforms, the TEE based uefisecapp client
+	  driver must be used to ensure persistence of non-volatile EFI variables
+	  via writes through the RPMB service hosted in the QTEE supplicant.
+
+	  This module provides a TEE client driver for uefisecapp, installing efivar
+	  operations to allow the kernel and user-space access to EFI variables.
+
+	  Select m here to provide access to EFI variables on the aforementioned
+	  platforms if your Linux distribution has QTEE supplicant installed and
+	  running.
+
 endmenu
diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 0be40a1abc13..d780490b2865 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
+obj-$(CONFIG_QCOM_TEE_UEFISECAPP) += qcom_tee_uefisecapp.o
diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
new file mode 100644
index 000000000000..9a5a6f145a9f
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/efi.h>
+#include <linux/tee.h>
+#include <linux/tee_drv.h>
+#include <linux/ucs2_string.h>
+#include "qcom_tee_uefisecapp.h"
+
+static struct qcomtee_uefisec_app uefisec_app;
+
+static int qcuefi_get_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
+			       struct tee_param_ubuf in_attributes,
+			       struct tee_param_ubuf *data,
+			       u32 *out_attributes, u32 *out_errno)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
+	u32 nparams = 5;
+	struct tee_param param[nparams];
+
+	struct {
+		efi_guid_t guid;
+		u32 in_data_size;
+	} in_cong = { 0 };
+
+	struct {
+		u32 out_data_size;
+		u32 attributes;
+		u32 errno;
+	} out_cong = { 0 };
+
+	in_cong.guid = *guid;
+	in_cong.in_data_size = data->size;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_GET_VAR, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
+	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
+	SET_TEE_PARAM_UBUF(param[2], UBUF_INPUT, in_attributes);
+	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
+	SET_TEE_PARAM_UBUF(param[4], UBUF_OUTPUT, *data);
+
+	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_GET_VAR invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	data->size = out_cong.out_data_size;
+	*out_attributes = out_cong.attributes;
+	*out_errno = out_cong.errno;
+
+	return ret;
+}
+
+static efi_status_t qcomtee_uefi_get_variable(efi_char16_t *name, efi_guid_t *guid,
+					      u32 *attr, unsigned long *data_size,
+					      void *data)
+{
+	int ret;
+	u32 in_attr, out_attributes, out_errno;
+	struct tee_param_ubuf in_data, in_var, in_attributes;
+
+	if (!name || !guid)
+		return EFI_INVALID_PARAMETER;
+
+	/* 'attr' can be NULL, however an input attribute is always expected
+	 * by UefiSecApp TA
+	 */
+	in_attr = 0;
+	if (attr)
+		in_attr = *attr;
+
+	in_data = (struct tee_param_ubuf){ .addr = data, *data_size };
+	in_var = (struct tee_param_ubuf){ .addr = name,
+					  (ucs2_strlen(name) + 1) * sizeof(*name) };
+	in_attributes = (struct tee_param_ubuf){ .addr = &in_attr, sizeof(u32) };
+
+	/* On SUCCESS, 'data' member of 'in_data' has already been updated. */
+	ret = qcuefi_get_variable(in_var, guid, in_attributes, &in_data,
+				  &out_attributes, &out_errno);
+
+	if (ret)
+		return EFI_DEVICE_ERROR;
+
+	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT) {
+		/* If 'attr' is NULL 'out_attributes' is not updated. */
+		if (attr)
+			*attr = out_attributes;
+
+		*data_size = in_data.size;
+	}
+
+	return uefisecapp_err_to_efi_status(out_errno);
+}
+
+static int qcuefi_set_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
+			       u32 attributes, struct tee_param_ubuf data,
+			       u32 *out_errno)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
+	u32 nparams = 4;
+	struct tee_param param[nparams];
+
+	struct {
+		efi_guid_t guid;
+		u32 attributes;
+		u32 in_data_size;
+	} in_cong = { 0 };
+
+	in_cong.guid = *guid;
+	in_cong.attributes = attributes;
+	in_cong.in_data_size = data.size;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_SET_VAR, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
+	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
+	SET_TEE_PARAM_UBUF(param[2], UBUF_INPUT, data);
+	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, TEE_PARAM_UBUF(*out_errno));
+
+	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_SET_VAR invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	return ret;
+}
+
+static efi_status_t qcomtee_uefi_set_variable(efi_char16_t *name, efi_guid_t *guid,
+					      u32 attr, unsigned long data_size,
+					      void *data)
+{
+	int ret;
+	u32 out_errno;
+	struct tee_param_ubuf in_data, in_var;
+
+	if (!name || !guid)
+		return EFI_INVALID_PARAMETER;
+
+	in_data = (struct tee_param_ubuf){ .addr = data, data_size };
+	in_var = (struct tee_param_ubuf){ .addr = name,
+					  (ucs2_strlen(name) + 1) * sizeof(*name) };
+
+	ret = qcuefi_set_variable(in_var, guid, attr, in_data, &out_errno);
+	if (ret)
+		return EFI_DEVICE_ERROR;
+
+	return uefisecapp_err_to_efi_status(out_errno);
+}
+
+static int qcuefi_get_next_variable(struct tee_param_ubuf in_variable, efi_guid_t *guid,
+				    struct tee_param_ubuf *out_variable,
+				    efi_guid_t *out_vendor_guid, u32 *out_errno)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
+	u32 nparams = 4;
+	struct tee_param param[nparams];
+
+	struct {
+		efi_guid_t guid;
+		u32 in_data_size;
+	} in_cong = { 0 };
+
+	struct {
+		efi_guid_t guid;
+		u32 out_data_size;
+		u32 errno;
+	} out_cong = { 0 };
+
+	/* Pass size of available buffer */
+	in_cong.in_data_size = out_variable->size;
+	in_cong.guid = *guid;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(in_cong));
+	SET_TEE_PARAM_UBUF(param[1], UBUF_INPUT, in_variable);
+	SET_TEE_PARAM_UBUF(param[2], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
+	SET_TEE_PARAM_UBUF(param[3], UBUF_OUTPUT, *out_variable);
+
+	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	/* UefiSecApp TA does not touch 'out_variable.size'. Update it here.
+	 * On SUCCESS (!out_errno), 'out_data_size' is length of name in 'out_variable.addr'.
+	 * On failure (out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT), 'out_data_size' is
+	 * actual name length.
+	 * Otherwise, it's undefined.
+	 */
+	out_variable->size = out_cong.out_data_size;
+	*out_vendor_guid = out_cong.guid;
+	*out_errno = out_cong.errno;
+
+	return ret;
+}
+
+static efi_status_t qcomtee_uefi_get_next_variable(unsigned long *name_size,
+						   efi_char16_t *name,
+						   efi_guid_t *guid)
+{
+	int ret;
+	u32 out_errno;
+	efi_guid_t out_guid;
+	struct tee_param_ubuf in_var, out_var;
+
+	if (!name_size || !name || !guid)
+		return EFI_INVALID_PARAMETER;
+
+	if (*name_size == 0)
+		return EFI_INVALID_PARAMETER;
+
+	/* For 'in_var', 'name_size' is not necessarily size of 'name';
+	 * could be size of buffer where 'name' has been stored. TA expects a
+	 * NULL-terminated string in 'name' and ignores the size.
+	 * For 'out_var', 'name_size' is size of buffer pointed by 'name'.
+	 */
+	in_var = (struct tee_param_ubuf){ .addr = name, *name_size };
+	out_var = (struct tee_param_ubuf){ .addr = name, *name_size };
+
+	ret = qcuefi_get_next_variable(in_var, guid, &out_var, &out_guid,
+				       &out_errno);
+	if (ret)
+		return EFI_DEVICE_ERROR;
+
+	if (!out_errno)
+		*guid = out_guid;
+
+	if (!out_errno || out_errno == QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT)
+		*name_size = out_var.size;
+
+	/* On SUCCESS, 'name' stores the next variable name. */
+	return uefisecapp_err_to_efi_status(out_errno);
+}
+
+static int qcuefi_query_variable_info(u32 attributes,
+				      u64 *maximum_variable_storage_size,
+				      u64 *remaining_variable_storage_size,
+				      u64 *maximum_variable_size, u32 *out_errno)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = uefisec_app.uefisec_svc_obj.id;
+	u32 nparams = 2;
+	struct tee_param param[nparams];
+
+	struct {
+		u64 max_var_storage_size;
+		u64 remaining_var_storage_size;
+		u64 maximum_var_size;
+		u32 errno;
+	} out_cong = { 0 };
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(attributes));
+	SET_TEE_PARAM_UBUF(param[1], UBUF_OUTPUT, TEE_PARAM_UBUF(out_cong));
+
+	ret = tee_client_object_invoke_func(uefisec_app.ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	*maximum_variable_storage_size = out_cong.max_var_storage_size;
+	*remaining_variable_storage_size = out_cong.remaining_var_storage_size;
+	*maximum_variable_size = out_cong.maximum_var_size;
+	*out_errno = out_cong.errno;
+
+	return ret;
+}
+
+static efi_status_t qcomtee_uefi_query_variable_info(u32 attr, u64 *storage_space,
+						     u64 *remaining_space,
+						     u64 *max_variable_size)
+{
+	int ret;
+	u32 out_errno;
+	u64 maximum_variable_storage_size;
+	u64 remaining_variable_storage_size;
+	u64 maximum_variable_size;
+
+	if (!storage_space || !remaining_space || !max_variable_size)
+		return EFI_INVALID_PARAMETER;
+
+	ret = qcuefi_query_variable_info(attr,
+					 &maximum_variable_storage_size,
+					 &remaining_variable_storage_size,
+					 &maximum_variable_size,
+					 &out_errno);
+
+	if (ret)
+		return EFI_DEVICE_ERROR;
+
+	if (!out_errno) {
+		*storage_space = maximum_variable_storage_size;
+		*remaining_space = remaining_variable_storage_size;
+		*max_variable_size = maximum_variable_size;
+	}
+
+	return uefisecapp_err_to_efi_status(out_errno);
+}
+
+/**
+ * qcomtee_release_object() - Release an object returned by QTEE.
+ *
+ * Each object returned by QTEE repesents a secure service exposed to the
+ * client. Whenever an secure service is opened, QTEE may allocate resources
+ * on the client's behalf. Therefore, once the client is done accessing the
+ * secure service, the object representing it should be explicitly released
+ * so that QTEE can release the associated resources as well.
+ *
+ * @ctx: TEE context.
+ * @object: The object to release.
+ */
+static void qcomtee_release_object(struct tee_context *ctx,
+				   struct tee_param_objref object)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	SET_INVOKE_ARG(inv_arg, object.id, QCOMTEE_MSG_OBJECT_OP_RELEASE, 0);
+	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
+}
+
+/**
+ * qcomtee_get_uefisec_svc_obj() - Get a UEFI Secure App service object to
+ * begin communication with the service.
+ * @ctx: TEE context.
+ * @client_env_obj: The client environment object returned earlier by QTEE.
+ * @uefisec_svc_obj: The UEFI Secure App service object.
+ *
+ * Returns 0 on success.
+ * Returns < 0 if client environment object invocation failed.
+ * Returns > 0 if client environment invocation was success but UEFI Secure App
+ * service object could not be returned for some other reason (represented by the
+ * returned value)
+ */
+static int qcomtee_get_uefisec_svc_obj(struct tee_context *ctx,
+				       struct tee_param_objref client_env_obj,
+				       struct tee_param_objref *uefisec_svc_obj)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u64 obj_id = client_env_obj.id;
+	u32 nparams = 2;
+	struct tee_param param[nparams];
+	u32 uefisec_uid = QCOMTEE_UEFI_SEC_UID;
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, obj_id, QCOMTEE_OP_CLIENT_ENV_OPEN, nparams);
+	SET_TEE_PARAM_UBUF(param[0], UBUF_INPUT, TEE_PARAM_UBUF(uefisec_uid));
+	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
+
+	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_CLIENT_ENV_OPEN invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	*uefisec_svc_obj = param[1].u.objref;
+	return ret;
+}
+
+/**
+ * qcomtee_get_client_env_obj() - Get a client environment object to begin
+ * object exchange with QTEE.
+ * @ctx: TEE context.
+ * @client_env_obj: The client environment object returned by QTEE.
+ *
+ * Returns 0 on success.
+ * Returns < 0 if root object invocation failed.
+ * Returns > 0 if root object invocation was success but client environment
+ * object could not be returned for some other reason (represented by the
+ * returned value)
+ */
+static int qcomtee_get_client_env_obj(struct tee_context *ctx,
+				      struct tee_param_objref *client_env_obj)
+{
+	int ret;
+	struct tee_ioctl_object_invoke_arg inv_arg;
+	u32 nparams = 2;
+	struct tee_param param[nparams];
+
+	memset(&inv_arg, 0, sizeof(inv_arg));
+	memset(&param, 0, sizeof(param));
+
+	SET_INVOKE_ARG(inv_arg, TEE_OBJREF_NULL,
+		       QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS, nparams);
+	SET_TEE_PARAM_OBJREF(param[0], OBJREF_INPUT, TEE_OBJREF_NULL, 0);
+	SET_TEE_PARAM_OBJREF(param[1], OBJREF_OUTPUT, 0, 0);
+
+	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(uefisec_app.dev, "QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	*client_env_obj = param[1].u.objref;
+	return ret;
+}
+
+static const struct efivar_operations qcom_efivar_ops = {
+	.get_variable = qcomtee_uefi_get_variable,
+	.set_variable = qcomtee_uefi_set_variable,
+	.get_next_variable = qcomtee_uefi_get_next_variable,
+	.query_variable_info = qcomtee_uefi_query_variable_info,
+};
+
+static int qcomtee_ctx_match(struct tee_ioctl_version_data *ver,
+			     const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_QTEE);
+}
+
+static int qcomtee_uefisecapp_probe(struct tee_client_device *tee_dev)
+{
+	int ret, err;
+	struct tee_param_objref client_env_obj;
+	struct tee_param_objref uefisec_svc_obj;
+
+	uefisec_app.dev = &tee_dev->dev;
+	/* Open context with QCOMTEE driver */
+	uefisec_app.ctx = tee_client_open_context(NULL, qcomtee_ctx_match, NULL,
+						  NULL);
+	if (IS_ERR(uefisec_app.ctx))
+		return -ENODEV;
+
+	/* Obtain a reference to client_env object to begin object exchange
+	 * with QTEE
+	 */
+	ret = qcomtee_get_client_env_obj(uefisec_app.ctx, &client_env_obj);
+	if (ret) {
+		err = -EINVAL;
+		goto err_get_client_env;
+	}
+
+	/* Obtain a reference to the uefisec_svc object which provides access to
+	 * the EFI var storage.
+	 */
+	ret = qcomtee_get_uefisec_svc_obj(uefisec_app.ctx, client_env_obj,
+					  &uefisec_svc_obj);
+	if (ret) {
+		err = -EINVAL;
+		goto err_get_uefisec_svc;
+	}
+	uefisec_app.uefisec_svc_obj = uefisec_svc_obj;
+
+	ret = efivars_register(&uefisec_app.efivars, &qcom_efivar_ops);
+	if (ret) {
+		err = ret;
+		goto err_efi_vars_reg;
+	}
+
+	/* We don't need to keep a reference to this object anymore, we only
+	 * needed it to obtain the uefisec_svc object.
+	 */
+	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
+	return 0;
+
+err_efi_vars_reg:
+	qcomtee_release_object(uefisec_app.ctx, uefisec_svc_obj);
+err_get_uefisec_svc:
+	qcomtee_release_object(uefisec_app.ctx, client_env_obj);
+err_get_client_env:
+	tee_client_close_context(uefisec_app.ctx);
+
+	return err;
+}
+
+static void qcomtee_uefisecapp_remove(struct tee_client_device *tee_dev)
+{
+	efivars_unregister(&uefisec_app.efivars);
+	qcomtee_release_object(uefisec_app.ctx, uefisec_app.uefisec_svc_obj);
+	tee_client_close_context(uefisec_app.ctx);
+}
+
+static const struct tee_client_device_id qcomtee_uefisecapp_id_table[] = {
+	{UEFISECAPP_UUID},
+	{}
+};
+MODULE_DEVICE_TABLE(tee, qcomtee_uefisecapp_id_table);
+
+static struct tee_client_driver qcomtee_uefisecapp_driver = {
+	.id_table	= qcomtee_uefisecapp_id_table,
+	.probe		= qcomtee_uefisecapp_probe,
+	.remove		= qcomtee_uefisecapp_remove,
+	.driver		= {
+		.name		= "qcom-tee-uefisecapp",
+	},
+};
+
+module_tee_client_driver(qcomtee_uefisecapp_driver);
+
+MODULE_AUTHOR("Qualcomm");
+MODULE_DESCRIPTION("TEE client driver for Qualcomm TEE UEFI Secure App");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.h b/drivers/firmware/qcom/qcom_tee_uefisecapp.h
new file mode 100644
index 000000000000..a014c18cfed0
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef QCOM_TEE_UEFISECAPP_H
+#define QCOM_TEE_UEFISECAPP_H
+
+#define QCOMTEE_OP_CLIENT_ENV_OPEN 0
+#define QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS 5
+
+/* Each service exposed by QTEE is identified by a 32-bit UID */
+#define QCOMTEE_UEFI_SEC_UID                 413
+
+/* Operations supported by the UEFI Sec App service */
+#define QCOMTEE_UEFI_SEC_OP_GET_VAR 0
+#define QCOMTEE_UEFI_SEC_OP_SET_VAR 1
+#define QCOMTEE_UEFI_SEC_OP_QUERY_VAR_INFO 2
+#define QCOMTEE_UEFI_SEC_OP_GET_NEXT_VAR_NAME 3
+
+/* Error codes returned by the UEFI Sec App service */
+#define QCOMTEE_UEFI_SEC_SUCCESS 0
+#define QCOMTEE_UEFI_SEC_ERROR_INVALID_PARAMETER 10
+#define QCOMTEE_UEFI_SEC_ERROR_UNSUPPORTED 11
+#define QCOMTEE_UEFI_SEC_ERROR_WRITE_PROTECTED 12
+#define QCOMTEE_UEFI_SEC_ERROR_SECURITY_VIOLATION 13
+#define QCOMTEE_UEFI_SEC_ERROR_DEVICE_ERROR 14
+#define QCOMTEE_UEFI_SEC_ERROR_OUT_OF_RESOURCES 15
+#define QCOMTEE_UEFI_SEC_ERROR_VOLUME_CORRUPTED 16
+#define QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT 17
+#define QCOMTEE_UEFI_SEC_ERROR_NOT_FOUND 18
+#define QCOMTEE_UEFI_SEC_ERROR_ALREADY_STARTED 19
+
+/* Operations for objects are 32-bit. QCOMTEE transport uses the upper 16 bits. */
+#define QCOMTEE_MSG_OBJECT_OP_MASK GENMASK(15, 0)
+#define QCOMTEE_MSG_OBJECT_OP_RELEASE (QCOMTEE_MSG_OBJECT_OP_MASK - 0)
+
+/**
+ * struct qcomtee_uefisec_app - An instance of UEFI Secure Application.
+ * @dev: TEE client device on the TEE bus which represents uefisecapp.
+ * @ctx: The context opened with the TEE subsystem by the uefisecapp client.
+ * @uefisec_svc_obj: A TEE object representing the uefisecapp service.
+ * @efivars: EFI variables registered with the EFI subsystem.
+ */
+struct qcomtee_uefisec_app {
+	struct device *dev;
+	struct tee_context *ctx;
+	struct tee_param_objref uefisec_svc_obj;
+	struct efivars efivars;
+};
+
+#define UEFISECAPP_UUID \
+	UUID_INIT(0x01f95dcd, 0x2d7e, 0x58be, \
+		  0xa1, 0x43, 0x81, 0x32, 0xa1, 0x72, 0xdb, 0x7d)
+
+/* Short-hands for these long attribute names */
+#define UBUF_INPUT     TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT
+#define UBUF_OUTPUT    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT
+#define OBJREF_INPUT   TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT
+#define OBJREF_OUTPUT  TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT
+
+/* Init instance of 'struct tee_param_objref'. */
+#define SET_TEE_PARAM_OBJREF(param, attri, obj_id, obj_flag) do { \
+		(param).attr = (attri); \
+		(param).u.objref.id = (obj_id); \
+		(param).u.objref.flags = (obj_flag); \
+	} while (0)
+
+/* Init instance of 'struct tee_param_ubuf'. */
+#define SET_TEE_PARAM_UBUF(param, attri, ubuff) do { \
+		(param).attr = (attri); \
+		(param).u.ubuf = (ubuff);  \
+	} while (0)
+
+#define TEE_PARAM_UBUF(x) ((struct tee_param_ubuf){ .addr = &(x), sizeof(x) })
+
+#define SET_INVOKE_ARG(arg, object_id, opp, nparam) do { \
+		(arg).id = (object_id); \
+		(arg).op = (opp); \
+		(arg).num_params = (nparam); \
+	} while (0)
+
+static inline efi_status_t uefisecapp_err_to_efi_status(u32 err)
+{
+	switch (err) {
+	case QCOMTEE_UEFI_SEC_SUCCESS:
+		return EFI_SUCCESS;
+
+	case QCOMTEE_UEFI_SEC_ERROR_INVALID_PARAMETER:
+		return EFI_INVALID_PARAMETER;
+
+	case QCOMTEE_UEFI_SEC_ERROR_UNSUPPORTED:
+		return EFI_UNSUPPORTED;
+
+	case QCOMTEE_UEFI_SEC_ERROR_WRITE_PROTECTED:
+		return EFI_WRITE_PROTECTED;
+
+	case QCOMTEE_UEFI_SEC_ERROR_SECURITY_VIOLATION:
+		return EFI_SECURITY_VIOLATION;
+
+	case QCOMTEE_UEFI_SEC_ERROR_DEVICE_ERROR:
+		return EFI_DEVICE_ERROR;
+
+	case QCOMTEE_UEFI_SEC_ERROR_OUT_OF_RESOURCES:
+		return EFI_OUT_OF_RESOURCES;
+
+	case QCOMTEE_UEFI_SEC_ERROR_SIZE_OUT:
+		return EFI_BUFFER_TOO_SMALL;
+
+	case QCOMTEE_UEFI_SEC_ERROR_NOT_FOUND:
+		return EFI_NOT_FOUND;
+
+	/* No matching on EFI_* list. */
+	case QCOMTEE_UEFI_SEC_ERROR_ALREADY_STARTED: /* EFI_ALREADY_STARTED.  */
+	case QCOMTEE_UEFI_SEC_ERROR_VOLUME_CORRUPTED: /* EFI_VOLUME_CORRUPTED. */
+	default:
+		return EFI_DEVICE_ERROR;
+	}
+}
+#endif /* QCOM_TEE_UEFISECAPP_H */

-- 
2.34.1

