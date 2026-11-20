Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172040;
	b=Yf3AWFjK5d9H+CTHv0anG+VLcTMoz8FYNQ6g4oCScNYJTuJI5p/qs+JFqnmNC9ptJfE2
	 kvqASiz1i+iXxjhN4pk/yjYYeirDQYbFF1P66tdCZs39mLTph5rezoFHJcgpd3xlUudJs
	 Tb/3it2SmheVBG5eL8w8tW2CDuWRHJP0jwMpvqvXRpEmIDNf8BseMneO81BOs1l0mKAJ6
	 KHPbV1ZtEYhoSFFD43DyYGoqTAXPkfC684yG09b0Aa3wgTUporpR8hYCoDk4h5stq8W8N
	 JUE5ov926eO4A+m/Ud3cqMbEvG2E7CJ1uvm+tLVLjigXTeVlP40nQei340ol6GqhdMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HalKuV61lyqWAdnJDjW0TeXkCSTCZ7rHn8nwBTxCFxI=;
	b=rsX1dZffhautib5kuYe3cAsk1TapH9uiOjChO22lI3gHLPwG00ON0GoWwznEUCRloCc5
	 EeyouWhl+/PzOMRihvbCQMysZmcdyNu9G7c8IXLbWfvHwMYmFc8KwEi7s8CGBb/Z9DNkc
	 iSGbxt6278CfqWFXF/gvyn8CCwHj2oC1JRyKx2VDH7H/bfq3By8MF5BceaTzYWwycVyeL
	 Dq1UE7HOcfjx9ZQXcpW530Y0nY5MQwTPTILgsg4HFkf/x/xqHHHSsnkgelfYB2jbMF2uR
	 1pkIeuuNbALL+NQwf1UMLRJr17J4O2PtQUBrkkwY9RG4juvhhIXXlvwF7oD/t+MvosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEXr3+Lb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqYhxwBv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E83E60A2629
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E83E60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEXr3+Lb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqYhxwBv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkCx53987461
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HalKuV61lyqWAdnJDjW0TeXkCSTCZ7rHn8nwBTxCFxI=; b=WEXr3+LbGUvdqNG4
	JFr7lAMzVQdDJGbQ9nM3CzHtvwmqhwrjokSKf0PXCu8PI8HuiQ2Ebva9YLqin6IH
	Ezq4zekAXEnn1iHlGF7DxaReqCpGzTS/u7QxBU1QiVYkhCja5bxZgo/ZRlQnuj7z
	zM/WQAU/1rBYig4e47A/i6zjlL8kkxV7LYmm2f3ZCZSMBRaGAgseyYN14LaLH1aO
	kq6oHLpQ0PmtihpcPsui2cIrLUop8+bPxWtqg4CCsB3wkcU768ey8yokXpY2yiOG
	D/CFTLUXdOOKXa9fYx/e+UspYLtrYOW/n7pC5Trg2qlXEVhjB8pOeQKmIZeL5C0a
	Vlxkig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu812br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:53:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so1221143a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172038; x=1795776838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HalKuV61lyqWAdnJDjW0TeXkCSTCZ7rHn8nwBTxCFxI=;
        b=hqYhxwBv2CrXCzNRsEic3mv5cTda2JFs4ETrDFGVNlrHT2upPjwpR+HA7tl+sFIzmM
         7EcjAF/67SnnfcUduEDlQDZQ37+v+MFbaHRhRToQ8XE4l5brBoDfunzFMMvLXmSrfR13
         +aAzmybFqrUQP7+R1PnO3iSED5cf4mD8QrQHdXVhNtlL1LwVdoWXyG8PksQUP7f4MgeG
         e2B0NrEXalRHr7f1vImISmKSRvm/cwzGca52dQSpRn18cgtdaKQe76pnw4h5B02SA8yy
         Mo9nO5Ry3O6PGCi/I0lalh51DLNqNFjewDVqj9MZ4UqnDSwCragBVlUvSrH9J4uPjrX9
         tfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172038; x=1795776838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HalKuV61lyqWAdnJDjW0TeXkCSTCZ7rHn8nwBTxCFxI=;
        b=UpoJv+G5sK2hZJcjiHCPcGWXtU7/qy3eXNIt3AEPzZBGMII5Us8IiArRG0lvyF9pgc
         8gnCEoInuevwK+XkyCWYB9sHUxhJAK7aOlSCg4VMcHTjIFYmLz2zhgW7Izk63F3S85gu
         GJ0DgQWW7sC6UmmOMRnXFv6PYCFquEnu163axYjVgoVDFx06+33Dt5/6iS4SwTO4uSZf
         s7z4Ugt6SMTEicCNX6sF11RJenT5rmpqdhjAgUK6p6wZ5X8y7sV2CmuRvufl8WFrnzaU
         NIWCzURHgSVgrkeVJJnp9rvV1FojTuL0dRwplp73d0rpZzZ3Wbw88pi1OYyobJ43ORA2
         MCgQ==
X-Forwarded-Encrypted: i=1; AL+hErHLs35uTPfR6a6Fw59OIhpd2FFX/3+Llg+N2Bkc1ETqbUKPvvmBaHLdjgvTKFdnXWThrvhd4yvuaqMfVc0u@vger.kernel.org
X-Gm-Message-State: APuU4Z+DkwbIlvdr3Ug1G5MB6IdhRe/ip5rzh08WlonLtwfx9t+THSii
	mKnRQoCHaMsHpi1FRyQ2tmcJwPMaastDS+ZzvacIlS8wFbQghrLu6VTcMHoh56mzdl1P3z6llsD
	T4b+rWJrqd9vZO+oa3cYaD3rvOoD92NT9coBKx6rcpXJDrauKicx6Y2U+oUHDu0Z4Qx30
X-Gm-Gg: AZFdTZcW62IMkWUTIHE02GH2JBDl+pBeVNf4N1LqwIYIqL12A0bCbl0GR4eBvP9IYe6
	/rJALPFpZYn46IiBfS+7ZLfGchD5W2U0zhWhG1Az+omt3Kj1BpNO1dSwJx5KqYiCCgfPwETnGpB
	lcpBWHfBUqL8jeqqF6jKkxtuLIGjtr3vJ5TI4abK51HTnpjxUeqMR7HstSA4coh+pn9CWStF0Gq
	cfL8CbmYXkiu8ai2AuHsnu7lGcf4JcXPt4LxnMGUJ9QL0BnzfQ97OEekYVHGVJEidvhN7RDODaE
	V4krdmlkHMJEcAfGJBw/BEb8jRqR25vHmwIm+a07MYgZEDnh0M7uarn1BIkFZkpnKbF5w3ij9Ng
	5qbr22p1VUPMxsHPM21nacf+zR0zWsjEm9nVNUjaWU4n1eGjyToJVhWbCVDFznXMhKQWirf/ybL
	fALeWEyJ4=
X-Received: by 2002:a17:90b:1fc4:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3b41c991668mr2539597a91.57.1795172037746;
        Fri, 20 Nov 2026 02:53:57 -0800 (PST)
X-Received: by 2002:a17:90b:1fc4:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3b41c991668mr2539578a91.57.1795172037239;
        Fri, 20 Nov 2026 02:53:57 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22888esm1559604a91.3.2026.11.20.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:53:56 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:23:33 +0530
Subject: [PATCH v5 2/3] tpm: Introduce Qualcomm TPM driver
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-tpm_qcom_driver-v5-2-3d9321ace107@oss.qualcomm.com>
References: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
In-Reply-To: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX6PxUAQuFEnrZ
 oiX37ZQpqoQk7TxRYGceltX1xm9z+NeIDgfl4ud7xE/4cclyzJjhqjhIoUuKwTzIuHO1ICCgQXk
 I4QIkAciZ+6VOdxpLKdhGj94FVWZVLKcAI2O9/EEcWVK/hwJoEBGFuI6maZWrE6NcQVEitAkp7p
 zGC4/x7ero3j9Mhee61sjv9ovxS25q2E/aqgVepoEPzd6b1P5269OMru+y7LrKgBn3eJfEBR3MQ
 CvpNtAThqrIVg1vMhkxZhvOIhdYeMMRZ/ujkhZ8Yq5xpHGyGgrMambKyEWMc4cEy9rb3NQymP4k
 fP5BQ2vai6yWRWUhhr16qQSBCRWNRTdE8uT3J2Ia+ui/671+PekIwO+vlYuhe6UJn5RJjzo1ouy
 W/Ii40EgCvcgD34I1+d40cudg8enN9NnR/zA4V/0PrW/1/02/q6xtLmaXiYBNC/Cc/d5lP/kSn5
 UCF7+Z+g7VAlAYeGymg==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0026c6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fRNFA8eTS_BfqSrSx7UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: SBEUtVDOfYqBoIBe1_yZtkW2EYIA_-2E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX0+Kzpvan0DWa
 ifJIAoC8Rd09ZdkIKD+29qZM24Ga2+SygMCxXPs8kUN5TKZ1QZ5QHO0Rct0ECzI49gPMSyoYTtU
 o6B88Hky4nNSrj1n5hRktZt5YpXlUzU=
X-Proofpoint-GUID: SBEUtVDOfYqBoIBe1_yZtkW2EYIA_-2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200043

Add a TPM chip driver for platforms where a TPM 2.0 instance is
implemented by a Trusted Application (TA) running in Qualcomm's Trusted
Execution Environment (QTEE), reachable over the QCOMTEE object-IPC
transport.

The driver discovers the qcom.tz.tpm TEE-bus device, opens a session
with the TPM TA, and register with tpm interface. This exposes the TA
through the standard /dev/tpm interface and the existing tpm2 command
layer. OS need not be aware underlying TPM instance is dTPM or fTPM.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/char/tpm/Kconfig    |   9 +
 drivers/char/tpm/Makefile   |   1 +
 drivers/char/tpm/tpm_qcom.c | 410 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 420 insertions(+)

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 5f672f2c01b0..05d704ed3632 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -243,6 +243,15 @@ config TCG_FTPM_TEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
+config TCG_QCOM
+	tristate "Qualcomm TEE based TPM Interface"
+	depends on QCOMTEE
+	help
+	  This driver provides interface to run TPM instances with Trustzone
+	  having Qualcomm TPM TA running in Qualcomm TEE.
+	  The mechanism uses the object-IPC based transport provided by
+	  QCOMTEE.
+
 config TCG_SVSM
 	tristate "SNP SVSM vTPM interface"
 	depends on AMD_MEM_ENCRYPT
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 5b5cdc0d32e4..471cbf49afd2 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -45,5 +45,6 @@ obj-$(CONFIG_TCG_CRB) += tpm_crb.o
 obj-$(CONFIG_TCG_ARM_CRB_FFA) += tpm_crb_ffa.o
 obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
 obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
+obj-$(CONFIG_TCG_QCOM) += tpm_qcom.o
 obj-$(CONFIG_TCG_SVSM) += tpm_svsm.o
 obj-$(CONFIG_TCG_LOONGSON) += tpm_loongson.o
diff --git a/drivers/char/tpm/tpm_qcom.c b/drivers/char/tpm/tpm_qcom.c
new file mode 100644
index 000000000000..4be939134ea1
--- /dev/null
+++ b/drivers/char/tpm/tpm_qcom.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/tee.h>
+#include <linux/tee_drv.h>
+#include <linux/tpm.h>
+#include <linux/uuid.h>
+
+#include "tpm.h"
+
+#define QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS	5
+#define QCOMTEE_OP_CLIENT_ENV_OPEN		0
+#define QCOMTEE_MSG_OBJECT_OP_RELEASE		GENMASK(15, 0)
+
+#define QCOMTEE_TPM_OP_SEND_COMMAND	0
+
+/* UID of the "qcom.tz.tpm" service */
+#define QCOMTEE_TPM_UID			81
+
+/* Max buffer size supported by TPM TA */
+#define TPM_QCOM_REQ_RSP_SIZE		SZ_4K
+
+#define QCOMTEE_TPM_GET_TA_VERSION_ID	0x1000U
+#define QCOMTEE_TPM_TA_VERSION_MAJOR	GENMASK(31, 16)
+#define QCOMTEE_TPM_TA_VERSION_MINOR	GENMASK(15, 0)
+
+struct tpm_qcom_ta_version_req {
+	u32 command_id;
+} __packed;
+
+struct tpm_qcom_ta_version_resp {
+	u32 status;
+	u32 command_id;
+	u32 version_num;
+} __packed;
+
+#define QCOMTEE_TPM_TYPE_ID		0x80000U
+#define QCOMTEE_TPM_TYPE_DTPM		0x6454504dU
+#define QCOMTEE_TPM_TYPE_FTPM		0x6654504dU
+
+struct tpm_qcom_type_req {
+	u32 command_id;
+} __packed;
+
+struct tpm_qcom_type_resp {
+	u32 command_id;
+	u32 status;
+	u32 tpm_type;
+} __packed;
+
+/*
+ * dTPM SPI transfer optimization:
+ * TRANSFER_START before a burst of commands, TRANSFER_END once done.
+ */
+#define QCOMTEE_TPM_TRANSFER_ID		0x2U
+#define QCOMTEE_TPM_TRANSFER_END	0
+#define QCOMTEE_TPM_TRANSFER_START	1
+
+struct tpm_qcom_transfer_req {
+	u32 command_id;
+	u32 transfer_state;
+} __packed;
+
+struct tpm_qcom_transfer_resp {
+	u32 command_id;
+	u32 status;
+} __packed;
+
+struct tpm_qcom_private {
+	struct tpm_chip *chip;
+	struct device *dev;
+	struct tee_context *ctx;
+	struct tee_param_objref tpm_svc_obj;
+	bool is_dtpm;
+};
+
+/* UUID of the QTEE-bus device representing the TPM TA. */
+static const uuid_t tpm_qcom_uuid =
+	UUID_INIT(0xaabcb593, 0x7083, 0x5536,
+		  0xac, 0x27, 0x3d, 0x2d, 0x89, 0x41, 0x9d, 0xdb);
+
+static void tpm_qcom_release_object(struct tee_context *ctx,
+				    struct tee_param_objref object)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg = {};
+
+	inv_arg.id = object.id;
+	inv_arg.op = QCOMTEE_MSG_OBJECT_OP_RELEASE;
+	inv_arg.num_params = 0;
+
+	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
+}
+
+static int tpm_qcom_get_client_env_obj(struct device *dev,
+				       struct tee_context *ctx,
+				       struct tee_param_objref *client_env_obj)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg = {};
+	struct tee_param param[2] = {};
+	int ret;
+
+	inv_arg.id = TEE_OBJREF_NULL;
+	inv_arg.op = QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS;
+	inv_arg.num_params = 2;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT;
+	param[0].u.objref.id = TEE_OBJREF_NULL;
+	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT;
+
+	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "get client env obj failed: ret=%d, invoke_ret=0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: -EIO;
+	}
+
+	*client_env_obj = param[1].u.objref;
+	return 0;
+}
+
+static int tpm_qcom_get_svc_obj(struct device *dev,
+				struct tee_context *ctx,
+				struct tee_param_objref client_env_obj,
+				struct tee_param_objref *tpm_svc_obj)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg = {};
+	struct tee_param param[2] = {};
+	u32 tpm_uid = QCOMTEE_TPM_UID;
+	int ret;
+
+	inv_arg.id = client_env_obj.id;
+	inv_arg.op = QCOMTEE_OP_CLIENT_ENV_OPEN;
+	inv_arg.num_params = 2;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT;
+	param[0].u.ubuf = (struct tee_param_ubuf){ .addr = &tpm_uid,
+						    .size = sizeof(tpm_uid) };
+	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT;
+
+	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev, "get TPM service obj failed: ret=%d, invoke_ret=0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: -EIO;
+	}
+
+	*tpm_svc_obj = param[1].u.objref;
+	return 0;
+}
+
+static int tpm_qcom_send_command(struct tpm_qcom_private *pvt_data,
+				 void *req, size_t req_len, void *resp,
+				 size_t *resp_len)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg = {};
+	struct tee_param param[3] = {};
+	u8 locality_arg = 0;
+	int ret;
+
+	inv_arg.id = pvt_data->tpm_svc_obj.id;
+	inv_arg.op = QCOMTEE_TPM_OP_SEND_COMMAND;
+	inv_arg.num_params = 3;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT;
+	param[0].u.ubuf = (struct tee_param_ubuf){ .addr = &locality_arg,
+						   .size = sizeof(locality_arg) };
+	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT;
+	param[1].u.ubuf = (struct tee_param_ubuf){ .addr = req, .size = req_len };
+	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT;
+	param[2].u.ubuf = (struct tee_param_ubuf){ .addr = resp, .size = *resp_len };
+
+	ret = tee_client_object_invoke_func(pvt_data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(pvt_data->dev,
+			"send_command invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: -EINVAL;
+	}
+
+	*resp_len = param[2].u.ubuf.size;
+
+	return 0;
+}
+
+static int tpm_qcom_get_ta_details(struct tpm_qcom_private *pvt_data)
+{
+	struct tpm_qcom_ta_version_req ver_req = {
+		.command_id = QCOMTEE_TPM_GET_TA_VERSION_ID,
+	};
+	struct tpm_qcom_ta_version_resp ver_resp;
+	size_t resp_len = sizeof(ver_resp);
+	struct tpm_qcom_type_req type_req = {
+		.command_id = QCOMTEE_TPM_TYPE_ID,
+	};
+	struct tpm_qcom_type_resp type_resp;
+	int ret;
+
+	ret = tpm_qcom_send_command(pvt_data, &ver_req, sizeof(ver_req),
+				    &ver_resp, &resp_len);
+	if (ret < 0 || resp_len < sizeof(ver_resp) || ver_resp.status != 0)
+		return ret ?: -EIO;
+
+	dev_info(pvt_data->dev, "TPM TA version %lu.%lu\n",
+		 FIELD_GET(QCOMTEE_TPM_TA_VERSION_MAJOR, ver_resp.version_num),
+		 FIELD_GET(QCOMTEE_TPM_TA_VERSION_MINOR, ver_resp.version_num));
+
+	resp_len = sizeof(type_resp);
+	ret = tpm_qcom_send_command(pvt_data, &type_req, sizeof(type_req),
+				    &type_resp, &resp_len);
+	if (ret < 0 || resp_len < sizeof(type_resp) || type_resp.status != 0)
+		return ret ?: -EIO;
+
+	switch (type_resp.tpm_type) {
+	case QCOMTEE_TPM_TYPE_FTPM:
+		dev_info(pvt_data->dev, "TPM type: fTPM\n");
+		pvt_data->is_dtpm = false;
+		break;
+	case QCOMTEE_TPM_TYPE_DTPM:
+		dev_info(pvt_data->dev, "TPM type: dTPM\n");
+		pvt_data->is_dtpm = true;
+		break;
+	default:
+		dev_err(pvt_data->dev, "unsupported TPM type: 0x%08x\n",
+			type_resp.tpm_type);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/* fTPM does not implement this command and to be invoked via dtpm only. */
+static int tpm_qcom_transfer(struct tpm_qcom_private *pvt_data,
+			     u32 transfer_state)
+{
+	struct tpm_qcom_transfer_req req = {
+		.command_id = QCOMTEE_TPM_TRANSFER_ID,
+		.transfer_state = transfer_state,
+	};
+	struct tpm_qcom_transfer_resp resp;
+	size_t resp_len = sizeof(resp);
+	int ret;
+
+	ret = tpm_qcom_send_command(pvt_data, &req, sizeof(req), &resp,
+				    &resp_len);
+	if (ret < 0 || resp_len < sizeof(resp) || resp.status != 0)
+		return ret ?: -EIO;
+
+	return 0;
+}
+
+static int tpm_qcom_cmd_ready(struct tpm_chip *chip)
+{
+	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
+
+	if (!pvt_data->is_dtpm)
+		return 0;
+
+	return tpm_qcom_transfer(pvt_data, QCOMTEE_TPM_TRANSFER_START);
+}
+
+static int tpm_qcom_go_idle(struct tpm_chip *chip)
+{
+	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
+
+	if (!pvt_data->is_dtpm)
+		return 0;
+
+	return tpm_qcom_transfer(pvt_data, QCOMTEE_TPM_TRANSFER_END);
+}
+
+/*
+ * The raw TPM2 command in @buf is sent directly as send_command's UBUF-in
+ * param and the raw TPM2 response is read back from its UBUF-out param.
+ */
+static int tpm_qcom_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
+			 size_t cmd_len)
+{
+	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
+	struct tpm_header *header = (struct tpm_header *)buf;
+	size_t resp_len = min_t(size_t, bufsiz, TPM_QCOM_REQ_RSP_SIZE);
+	int ret;
+
+	if (cmd_len > TPM_QCOM_REQ_RSP_SIZE)
+		return -EIO;
+
+	u8 *response __free(kfree) = kzalloc(resp_len, GFP_KERNEL);
+	if (!response)
+		return -ENOMEM;
+
+	ret = tpm_qcom_send_command(pvt_data, buf, cmd_len, response, &resp_len);
+	if (ret < 0 || resp_len > bufsiz) {
+		dev_err(&chip->dev,
+			"TPM command failed: cmd_len=%zu, tpm_cc=0x%08x, ret=%d, resp_len=%zu, bufsiz=%zu\n",
+			cmd_len, be32_to_cpu(header->ordinal), ret, resp_len, bufsiz);
+		return ret ?: -EIO;
+	}
+
+	memcpy(buf, response, resp_len);
+	return resp_len;
+}
+
+static const struct tpm_class_ops tpm_qcom_ops = {
+	.flags = TPM_OPS_AUTO_STARTUP,
+	.send = tpm_qcom_send,
+	.cmd_ready = tpm_qcom_cmd_ready,
+	.go_idle = tpm_qcom_go_idle,
+};
+
+static int tpm_qcom_ctx_match(struct tee_ioctl_version_data *ver,
+			      const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_QTEE);
+}
+
+static int tpm_qcom_probe(struct tee_client_device *tee_dev)
+{
+	struct device *dev = &tee_dev->dev;
+	struct tpm_qcom_private *pvt_data;
+	struct tee_param_objref client_env_obj;
+	struct tee_param_objref tpm_svc_obj;
+	struct tpm_chip *chip;
+	int err;
+
+	pvt_data = devm_kzalloc(dev, sizeof(*pvt_data), GFP_KERNEL);
+	if (!pvt_data)
+		return -ENOMEM;
+
+	pvt_data->dev = dev;
+
+	pvt_data->ctx = tee_client_open_context(NULL, tpm_qcom_ctx_match, NULL, NULL);
+	if (IS_ERR(pvt_data->ctx))
+		return dev_err_probe(dev, PTR_ERR(pvt_data->ctx),
+				     "tee_client_open_context failed\n");
+
+	err = tpm_qcom_get_client_env_obj(dev, pvt_data->ctx, &client_env_obj);
+	if (err)
+		goto out_ctx;
+
+	err = tpm_qcom_get_svc_obj(dev, pvt_data->ctx, client_env_obj, &tpm_svc_obj);
+	/* Release client_env object irrespective of service obj return status */
+	tpm_qcom_release_object(pvt_data->ctx, client_env_obj);
+	if (err)
+		goto out_ctx;
+
+	pvt_data->tpm_svc_obj = tpm_svc_obj;
+	err = tpm_qcom_get_ta_details(pvt_data);
+	if (err)
+		goto out_svc_obj;
+
+	chip = tpmm_chip_alloc(dev, &tpm_qcom_ops);
+	if (IS_ERR(chip)) {
+		err = dev_err_probe(dev, PTR_ERR(chip), "tpmm_chip_alloc failed\n");
+		goto out_svc_obj;
+	}
+
+	pvt_data->chip = chip;
+	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
+	dev_set_drvdata(dev, pvt_data);
+
+	err = tpm_chip_register(pvt_data->chip);
+	if (err) {
+		dev_err_probe(dev, err, "tpm_chip_register failed\n");
+		goto out_svc_obj;
+	}
+
+	return 0;
+
+out_svc_obj:
+	tpm_qcom_release_object(pvt_data->ctx, tpm_svc_obj);
+
+out_ctx:
+	tee_client_close_context(pvt_data->ctx);
+	return err;
+}
+
+static void tpm_qcom_remove(struct tee_client_device *tee_dev)
+{
+	struct tpm_qcom_private *pvt_data = dev_get_drvdata(&tee_dev->dev);
+
+	tpm_chip_unregister(pvt_data->chip);
+	tpm_qcom_release_object(pvt_data->ctx, pvt_data->tpm_svc_obj);
+	tee_client_close_context(pvt_data->ctx);
+}
+
+static const struct tee_client_device_id tpm_qcom_id_table[] = {
+	{ tpm_qcom_uuid },
+	{}
+};
+MODULE_DEVICE_TABLE(tee, tpm_qcom_id_table);
+
+static struct tee_client_driver tpm_qcom_driver = {
+	.id_table	= tpm_qcom_id_table,
+	.probe		= tpm_qcom_probe,
+	.remove		= tpm_qcom_remove,
+	.driver		= {
+		.name	= "tpm_qcom",
+	},
+};
+
+module_tee_client_driver(tpm_qcom_driver);
+
+MODULE_DESCRIPTION("TPM driver for Qualcomm TPM TA");
+MODULE_AUTHOR("Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.34.1

