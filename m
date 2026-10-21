Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597425;
	b=cP4CkXTvuxNyb4Rh4R8YVsgQkxrvBlMotn3cWenxWS4tcq5Zcp6LTH97Z3cLCofv103/
	 Jq3zcIMdP+W63ldx9w+zlZ3jOdOID5ET1HpIx1yRb+Tqz7N08RVYPTP3uxr865BUe1Fbd
	 HuMfeSF3n6Iyst5sbEEZSMBVlwlifBURenhHm4iH+rJ774JwLv7czgwwjHQgV1UX4MpNc
	 80yfRSQiXxqhPIVOcW+slOHPr9rpfEFKpfO9PwlHMjAj+PDWcUAA/X9Za0cJWy+hZ7koR
	 JY72a4ZSrWMBFc4tPYu0SiAsy5QBdRGq725Bpy8DWXu/ejRfDMh0hdKNRhJCMQTlknA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7/aF8g01Trbdxz8TZjbr9PZplLDUT8OZook3IGPzEqc=;
	b=mbtFSwAYa51A/oTXJZCLWOMcuODFUms3PDRFYzXOqGzuTTmHXawpgJpXeZfKOjbiQtZ1
	 10C7tDhVCSoGgtUoyPcsyxCu+DoA3Z6A//MpfLOpBBTfv0XFSGur6zLjZ5qVbH1q+aFlS
	 IAR68rTzZ0ps4FVy7/UzcluGgU1ryRadP2iBH4arUCCbK3zYMMBHc72SdOTenTl8qV2IZ
	 2Xc/t+fC/saA+zs7FYvrlVerHA8+AZQ7/ShZ1fLpe4fGv366NyWaIk+R1IeRlEJohFtfT
	 P6EOc/NLF2XglV6YfQ/dkd4StjWdRsQV8yIaUgnGRfGFzatMlU717PbkXyVe6e/UnOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATT8dEPL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a/AKCV4f";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99DE60A5BC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99DE60A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATT8dEPL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a/AKCV4f
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFUHk6684400
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/aF8g01Trbdxz8TZjbr9PZplLDUT8OZook3IGPzEqc=; b=ATT8dEPLOVtcZ/GT
	5c4qYDbF30/M4HlZbwrep4CbQbcmIcaqP77yYf4WhgjGx3lBhl/iiMzQK0H7h5Xq
	lhg/FVgG94JtUM+75ND9RKjCeRZnM0x/wveE+3WvAJOEIT2VPmYCdvQk5UrO+d4r
	2q991aC6sYupCA4lym2u3FwO98fVM0FgeGYIC3o34TPXDU4QhkkVXR6phhokz6Rd
	GzfXmqKUGU66gEnm+gSYVaJ79bwOzZ5xbZrl17bmqTH0E9WvxnwhzqdYzY6fVzGP
	cNjh869+o8beRQgCelC/QgCvQhlukeU4QRvkxmhgfgaZLIZ/KMCbCMMcfri+vKiw
	I2ScYw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vrmvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:43:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso1423020eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597422; x=1793202222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/aF8g01Trbdxz8TZjbr9PZplLDUT8OZook3IGPzEqc=;
        b=a/AKCV4fodods1iUzafRvdQjqKVLh7DH1vYU3+t80hay5kCl0DBnErRn1EUhfFFP+T
         RbTpuuCB4zBNACrPcdreMGjuPAOfAaanTzHF/f4dDPKBipSydjCFKaURg0//H1veHgLB
         toLs0e9DDMnXst8l5jwNe6C73itUBZx/5FR34fDBRSHJoznhGBL/mXiGjX+PrziKregK
         4iVxFF1NxM9DTlaObJqvpX3vCJv9QloZJpfmO2Fbmei0BJE/g1/F3ezF1UT4sIP3lCh4
         rrOkndZTf/tR1LRNqLQQHS+zOVG8NEqq5AyLGEmD9lfeXZLNhkIxblqOPAnmOKM1PaRJ
         nnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597422; x=1793202222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/aF8g01Trbdxz8TZjbr9PZplLDUT8OZook3IGPzEqc=;
        b=wapgFicxstFwGn+qsfmi/EWXjNqo17ZbBtyIbccMLa6qJLVMDVJ9D8E8rztIMAgC13
         AufOerkqwovPpgA7eqxy3RklXKymOby2Ry4g4fiRRKrIaPXVC8pdDONdV/NATNSK81y8
         5wjDNZdA8IojIJHVQ2Os6QXz9twGfqy99W5vgKNfHryr6RgUeZ7p/HIccxk3FVPKfCjO
         neLBklofWmD/FRUB/nfKfZwdw7Rgqqh7LDtxYRvrmJOt4J+n4y58fEt8BcF6ZtDACb9L
         hzEpW/mopcApwF5cFgwdCW3mHCFWCEpDI2B2JJ56scq6JKZRVGR1iRd73lY7wqar+vnP
         BPkg==
X-Forwarded-Encrypted: i=1; AKwUvBzuHmKGS3vpE4SGgYDpZOxYC5I83PRHoLsiF8tSaqI4TG8RSIa6eKw1g0pGvPKByvemJBoYBsdVGYr9Jh0l@vger.kernel.org
X-Gm-Message-State: AFq9FYLK3OjN/g3YSirB6nCYDe1CXl8i038GRiUuh0cHPT6+zn5vjtkd
	nhVD6x1aXSy2KHbqDG8XsDNhGe+Wi/+bn7TbvZH2BC8IRIA0DZjMNpWhnEdWDioEItaIrnRjG5V
	mEbRjFkSAnfXGgpdUR9zkjCSmud20QPPBwOXa+WYq7HG0uvwtzX9TkYh1lbcV8VbovjiX
X-Gm-Gg: AYBFou2kUkJmNTgClBgTHtUIUP3iniKI2fIGL62bn5gxc+NdaX6IfYM4k67pgT6wSQe
	AVt1C1hsEzB9A68nLjdk2N0sLV+UsPxLtZzipKT5nBtEXr+AkA9KzIlWRONIZv3mzjpG6BXq+2I
	Ok1AhR4JHoiZRdRxs9Egick1mpK/r5zBLGEkTxIwQWC5hWwRZFVZMlVNvC4s9IrUSiKV+6O6936
	75KnppdpVfjF/cGWBv+lguf0qRdyz5ksgPaLB6OMT218iCO0utE569DqR/niR3iFR22tWhBO4rK
	cx5kgrwoeBF/Sr4gvZlhke8auPkjHXKXuzjvsR4GOVI+2KkWBCvT4X1Ed3jA7PEe5o4bGRTlRdt
	V4967lJLrcpPJvTu59H9GRiyR
X-Received: by 2002:a05:7022:ec8a:b0:168:fe32:35a with SMTP id a92af1059eb24-190a57ac54dmr3475732c88.20.1792597421173;
        Wed, 21 Oct 2026 08:43:41 -0700 (PDT)
X-Received: by 2002:a05:7022:ec8a:b0:168:fe32:35a with SMTP id a92af1059eb24-190a57ac54dmr3475677c88.20.1792597420487;
        Wed, 21 Oct 2026 08:43:40 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1902f96dc4bsm7937768c88.0.2026.10.21.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:43:40 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:13:09 +0530
Subject: [PATCH 3/5] firmware: qcom: Add an TEE bus based ICE back-end
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
Message-Id: <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792597401; l=12871;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=fja1EocfzMIrsKQbYh7D32xrr8xUrvqluhCasdjihlA=;
 b=Ak50a0lT/3tGCVjFCofD/Oo2BPV/Kx73AbD+TUAL69VdxGSKsZcTn/7MSG/NXD31C0pSLOWz6
 lwalL8w06flClIa9/ag8lVwMFXyTFqZmd2VSUIdbcvDGpWuV7qvURC+
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: Nm44RsWXFFL_nXBx4sAyIMDLU3o0L8L_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfXx2IRVgKSIW9U
 XwJTrfcv8z1UVf9Zzf3vzJ9RDwT/tYgXy2KjvUYH0V4v0L3Eul4BGu9giZTCLwzc74U/RHB+z/r
 uY8D6e3CZtevp3BZO1V630NIODkSz04=
X-Proofpoint-GUID: Nm44RsWXFFL_nXBx4sAyIMDLU3o0L8L_
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8ddaf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wV6y_F6WGLPFbETn8MUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX324vTD7fvcxV
 NdS3XkBiL2L5WaSVK3xjISScMKrntTyEHHtn0TMIeFAeaj0NMCzuxR0vlKProVMV6bQCMICJDtg
 bhgXvdnDzNr5HXjBLLIeeWlv0lQVnDBJtVrkQTSUscceBOapt+SKGiFofPKlwAg36g3L06oc4jm
 LR264wbH3fd7xCPapTqajsvI1+vNoHnRVXe+PVk/b38FjxAiTagG5EueRECUU0bAORlbXyrl5eD
 nAZtRQccebaWqurGbwlR9azAdN1dRSCL6rSCwcHJpG3wvng8Ktg4W/nnKIjbbmyQgLBGPMajv28
 XaNaK3KeGX9vMh89+yiDePoTn6nAwMe1vnAG8dxdAkgC02vuGtcqwmy0sDufL6KmkawoA+LHlfI
 gaIEDMokpTjAsyB3koCig80npEwEOMzcDa1XUn7w7Q4l0u5NJBcrBXpy1/PAdpB1nOOis11C9ER
 cL3gaZ2M4C0G0feFAyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210062

Add support for a TEE client driver which forwards calls from the Inline
Crypto Engine (ICE) service (invoked by the ICE driver) to the OPTEE ICE
Psuedo-TA.

The ICE PTA supports both ICE Legacy and Standard modes. In Standard mode
Hardware Key Manager v1 is supported.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 MAINTAINERS                          |   1 +
 drivers/firmware/qcom/Kconfig        |  10 +
 drivers/firmware/qcom/Makefile       |   1 +
 drivers/firmware/qcom/qcom_ice_tee.c | 384 +++++++++++++++++++++++++++++++++++
 4 files changed, 396 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a80b776896c..d5d4f1ca85b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23014,6 +23014,7 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	drivers/firmware/qcom/qcom_ice.c
 F:	drivers/firmware/qcom/qcom_ice.h
+F:	drivers/firmware/qcom/qcom_ice_tee.c
 F:	include/linux/firmware/qcom/qcom_ice.h
 
 QUALCOMM INTERCONNECT BWMON DRIVER
diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 6cde1704dbc7..bb67bd93cc51 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -33,6 +33,16 @@ config QCOM_ICE_SERVICE
 	  plugged in whether it's an SCM implementation or a TEE bus based
 	  ICE service implementation.
 
+config QCOM_ICE_TEE
+       tristate
+       select QCOM_ICE_SERVICE
+       depends on TEE
+       depends on !CPU_BIG_ENDIAN
+       default m if ARCH_QCOM
+       help
+         Enable the generic Inline Crypto Engine (ICE) firmware service TEE
+         implementation as a backend.
+
 config QCOM_SCM
 	tristate "Qualcomm PAS SCM interface driver" if ARCH_QCOM || COMPILE_TEST
 	select QCOM_PAS
diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index 6403e8a17249..db9c9823420b 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
 obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
 obj-$(CONFIG_QCOM_PAS_TEE)	+= qcom_pas_tee.o
 obj-$(CONFIG_QCOM_ICE_SERVICE)	+= qcom_ice.o
+obj-$(CONFIG_QCOM_ICE_TEE)     += qcom_ice_tee.o
diff --git a/drivers/firmware/qcom/qcom_ice_tee.c b/drivers/firmware/qcom/qcom_ice_tee.c
new file mode 100644
index 000000000000..b7434f19e6eb
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_ice_tee.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/firmware/qcom/qcom_ice.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#include "qcom_ice.h"
+
+#define PTA_QCOM_ICE_INVALIDATE_KEY		0
+#define PTA_QCOM_ICE_SET_CONFIG_KEY		1
+#define PTA_QCOM_ICE_GENERATE_KEY		2
+#define PTA_QCOM_ICE_IMPORT_KEY			3
+#define PTA_QCOM_ICE_EXPORT_KEY			4
+#define PTA_QCOM_ICE_GET_RAW_SECRET		5
+#define PTA_QCOM_ICE_HAS_WRAPPED_KEY_SUPPORT	6
+
+#define TEE_NUM_PARAMS				4
+
+struct qcom_ice_tee_private {
+	struct device *dev;
+	struct tee_context *ctx;
+	u32 session_id;
+};
+
+static int qcom_ice_tee_invalidate_key(struct device *dev, u32 index)
+{
+	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_ICE_INVALIDATE_KEY,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS,
+	};
+	struct tee_param param[TEE_NUM_PARAMS] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = index,
+			.u.value.b = 0,
+		}
+	};
+	int ret;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0)
+		ret = ret ?: -EINVAL;
+
+	return ret;
+}
+
+static int qcom_ice_tee_set_key(struct device *dev, u32 index,
+				const u8 *key, u32 key_size,
+				enum qcom_ice_cipher cipher,
+				u32 data_unit_size)
+{
+	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_ICE_SET_CONFIG_KEY,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS,
+	};
+	struct tee_param param[TEE_NUM_PARAMS] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = index,
+			.u.value.b = cipher,
+		},
+		[1] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+			.u.value.a = data_unit_size,
+		},
+		[2] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
+		}
+	};
+	struct tee_shm *key_shm;
+	u8 *key_buf;
+	int ret;
+
+	key_shm = tee_shm_alloc_kernel_buf(data->ctx, key_size);
+	if (IS_ERR(key_shm))
+		return PTR_ERR(key_shm);
+
+	key_buf = tee_shm_get_va(key_shm, 0);
+	if (IS_ERR(key_buf)) {
+		ret = PTR_ERR(key_buf);
+		goto out;
+	}
+
+	memcpy(key_buf, key, key_size);
+	param[2].u.memref.shm = key_shm;
+	param[2].u.memref.size = key_size;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	memzero_explicit(key_buf, key_size);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev,
+			"ICE set_key failed, idx=%u, ret=%d, err=0x%x\n",
+			index, ret, inv_arg.ret);
+		ret = ret ?: -EINVAL;
+	}
+out:
+	tee_shm_free(key_shm);
+	return ret;
+}
+
+static int qcom_ice_tee_wrapped_key_call(struct device *dev, u32 cmd,
+					 const u8 *in, size_t in_size,
+					 u8 *out, size_t out_size)
+{
+	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = cmd,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS,
+	};
+	struct tee_param param[TEE_NUM_PARAMS] = { };
+	struct tee_shm *in_shm = NULL;
+	struct tee_shm *out_shm = NULL;
+	u8 *buf;
+	int ret;
+
+	if (in && in_size) {
+		in_shm = tee_shm_alloc_kernel_buf(data->ctx, in_size);
+		if (IS_ERR(in_shm))
+			return PTR_ERR(in_shm);
+
+		buf = tee_shm_get_va(in_shm, 0);
+		if (IS_ERR(buf)) {
+			ret = PTR_ERR(buf);
+			goto out;
+		}
+		memcpy(buf, in, in_size);
+
+		param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
+		param[0].u.memref.shm = in_shm;
+		param[0].u.memref.size = in_size;
+	}
+
+	if (out && out_size) {
+		out_shm = tee_shm_alloc_kernel_buf(data->ctx, out_size);
+		if (IS_ERR(out_shm)) {
+			ret = PTR_ERR(out_shm);
+			goto out;
+		}
+
+		param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
+		param[1].u.memref.shm = out_shm;
+		param[1].u.memref.size = out_size;
+	}
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev,
+			"ICE cmd %u failed, ret=%d, err=0x%x\n",
+			cmd, ret, inv_arg.ret);
+		ret = ret ?: -EINVAL;
+		goto out;
+	}
+
+	if (out && out_size) {
+		buf = tee_shm_get_va(out_shm, 0);
+		if (IS_ERR(buf)) {
+			ret = PTR_ERR(buf);
+			goto out;
+		}
+		memcpy(out, buf, out_size);
+		memzero_explicit(buf, out_size);
+	}
+out:
+	if (in_shm && !IS_ERR(in_shm)) {
+		buf = tee_shm_get_va(in_shm, 0);
+		if (!IS_ERR(buf))
+			memzero_explicit(buf, in_size);
+		tee_shm_free(in_shm);
+	}
+	if (out_shm && !IS_ERR(out_shm))
+		tee_shm_free(out_shm);
+
+	return ret;
+}
+
+static int qcom_ice_tee_derive_sw_secret(struct device *dev,
+					 const u8 *eph_key,
+					 size_t eph_key_size,
+					 u8 *sw_secret,
+					 size_t sw_secret_size)
+{
+	return qcom_ice_tee_wrapped_key_call(dev, PTA_QCOM_ICE_GET_RAW_SECRET,
+					     eph_key, eph_key_size,
+					     sw_secret, sw_secret_size);
+}
+
+static int qcom_ice_tee_generate_key(struct device *dev,
+				     u8 *lt_key, size_t lt_key_size)
+{
+	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_ICE_GENERATE_KEY,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS,
+	};
+	struct tee_param param[TEE_NUM_PARAMS] = { };
+	struct tee_shm *key_shm;
+	u8 *buf;
+	size_t out_size;
+	int ret;
+
+	key_shm = tee_shm_alloc_kernel_buf(data->ctx, lt_key_size);
+	if (IS_ERR(key_shm))
+		return PTR_ERR(key_shm);
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
+	param[0].u.memref.shm = key_shm;
+	param[0].u.memref.shm_offs = 0;
+	param[0].u.memref.size = lt_key_size;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev,
+			"ICE generate_key failed, ret=%d, err=0x%x\n",
+			ret, inv_arg.ret);
+		ret = ret ?: -EINVAL;
+		goto out;
+	}
+
+	buf = tee_shm_get_va(key_shm, 0);
+	out_size = param[0].u.memref.size;
+
+	memcpy(lt_key, buf, lt_key_size);
+	memzero_explicit(buf, out_size);
+out:
+	tee_shm_free(key_shm);
+	return ret;
+}
+
+static int qcom_ice_tee_prepare_key(struct device *dev,
+				    const u8 *lt_key,
+				    size_t lt_key_size,
+				    u8 *eph_key,
+				    size_t eph_key_size)
+{
+	return qcom_ice_tee_wrapped_key_call(dev, PTA_QCOM_ICE_EXPORT_KEY,
+					     lt_key, lt_key_size,
+					     eph_key, eph_key_size);
+}
+
+static int qcom_ice_tee_import_key(struct device *dev,
+				   const u8 *raw_key,
+				   size_t raw_key_size,
+				   u8 *lt_key,
+				   size_t lt_key_size)
+{
+	return qcom_ice_tee_wrapped_key_call(dev, PTA_QCOM_ICE_IMPORT_KEY,
+					     raw_key, raw_key_size,
+					     lt_key, lt_key_size);
+}
+
+static bool qcom_ice_tee_available(struct device *dev)
+{
+	return true;
+}
+
+static bool qcom_ice_tee_has_wrapped_key_support(struct device *dev)
+{
+	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
+	struct tee_ioctl_invoke_arg inv_arg = {
+		.func = PTA_QCOM_ICE_HAS_WRAPPED_KEY_SUPPORT,
+		.session = data->session_id,
+		.num_params = TEE_NUM_PARAMS,
+	};
+	struct tee_param param[TEE_NUM_PARAMS] = {
+		[0] = {
+			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT,
+			.u.value.a = 0,
+		}
+	};
+	int ret;
+	bool has_support = false;
+
+	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(dev,
+			"ICE wrapped_key_support failed, ret=%d, err=0x%x\n",
+			ret, inv_arg.ret);
+		goto out;
+	}
+
+	has_support = param[0].u.value.a;
+out:
+	return has_support;
+}
+
+static struct qcom_ice_ops qcom_ice_ops_tee = {
+	.drv_name = "qcom-ice-tee",
+	.is_ice_available = qcom_ice_tee_available,
+	.ice_invalidate_key = qcom_ice_tee_invalidate_key,
+	.ice_set_key = qcom_ice_tee_set_key,
+	.ice_has_wrapped_key_support = qcom_ice_tee_has_wrapped_key_support,
+	.ice_derive_sw_secret = qcom_ice_tee_derive_sw_secret,
+	.ice_generate_key = qcom_ice_tee_generate_key,
+	.ice_prepare_key = qcom_ice_tee_prepare_key,
+	.ice_import_key = qcom_ice_tee_import_key,
+};
+
+static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return ver->impl_id == TEE_IMPL_ID_OPTEE;
+}
+
+static int qcom_ice_tee_probe(struct tee_client_device *ice_dev)
+{
+	struct device *dev = &ice_dev->dev;
+	struct qcom_ice_tee_private *data;
+	struct tee_ioctl_open_session_arg sess_arg = {
+		.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL,
+	};
+	int ret, err = -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
+	if (IS_ERR(data->ctx))
+		return -ENODEV;
+
+	export_uuid(sess_arg.uuid, &ice_dev->id.uuid);
+	ret = tee_client_open_session(data->ctx, &sess_arg, NULL);
+	if (ret < 0 || sess_arg.ret != 0) {
+		dev_err(dev,
+			"tee_client_open_session failed, ret=%d, err=0x%x\n",
+			ret, sess_arg.ret);
+		err = ret ?: -EINVAL;
+		goto out_ctx;
+	}
+
+	data->session_id = sess_arg.session;
+	dev_set_drvdata(dev, data);
+
+	qcom_ice_ops_tee.dev = dev;
+	qcom_ice_svc_ops_register(&qcom_ice_ops_tee);
+
+	return ret;
+out_ctx:
+	tee_client_close_context(data->ctx);
+
+	return err;
+}
+
+static void qcom_ice_tee_remove(struct tee_client_device *ice_dev)
+{
+	struct device *dev = &ice_dev->dev;
+	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
+
+	qcom_ice_svc_ops_unregister(&qcom_ice_ops_tee);
+	tee_client_close_session(data->ctx, data->session_id);
+	tee_client_close_context(data->ctx);
+}
+
+static const struct tee_client_device_id qcom_ice_tee_id_table[] = {
+	{UUID_INIT(0x29e87b9e, 0x012a, 0x4878,
+		   0xa1, 0xe1, 0xa1, 0xb9, 0x0a, 0x21, 0x5b, 0x16)},
+	{}
+};
+MODULE_DEVICE_TABLE(tee, qcom_ice_tee_id_table);
+
+static struct tee_client_driver optee_ice_tee_driver = {
+	.probe		= qcom_ice_tee_probe,
+	.remove		= qcom_ice_tee_remove,
+	.id_table	= qcom_ice_tee_id_table,
+	.driver		= {
+		.name		= "qcom-ice-tee",
+	},
+};
+
+module_tee_client_driver(optee_ice_tee_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm ICE TEE driver");

-- 
2.34.1

