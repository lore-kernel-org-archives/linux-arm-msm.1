Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406663;
	b=vY/amaoTcDhD50sBeOZogHp4b+WM6WI1gUef8RWPEtN4NgS7TkudamfxvK2NAJU1tNcl
	 30tGx3Cx+CaUL+O3TFOJKmS/O5OOnQ0wQ7KhALGeeTrQDESwOSsUYpttbPJVBEGwBg6MH
	 tpS8r20mWYaWlkQdLDW0cubd+33pRj66nNsAsWbN9Pt2Rvwt/f4ohSHJBQ0nXsCh1ms99
	 z8LkG0fAxJP2lYClP1GesY/5H3dDiTvcXqrXQbt8kf1QICgPt/Rm9qh8rMkeZhHtbjUk0
	 DXptPTdusYJyWa7Gpnd52dZJC1wD81xPjQpD85Xh2lmn8NmWgQXKlfkxWr7xBcxOc9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EbYuLbuCu6GHLhZz+1gsbZOrUrWD8uGqE3YcaX6kj2c=;
	b=KsM/+AQOBhwVwn7QOWVGldJ4PHSyhYWmcO5WIWaRgnqwD5pI28WtGT+gOPaMlAaltmHv
	 4Eu/qe1XGmRQtpTOAJg6PCMYLlMGOwEE3dbAcEHbpqIQ1VLD7MIxDp8hpsK8uUUAq5Fou
	 gcPWW2bg8VGqhcGYJ/yGi4w+eTdBRc9GudLrJzSWId1N/hMFuK26LdFPFupDFLkRutCZc
	 i+ggysILl5lQHY1zQPTLDcpPoOlFWEI/e6J+6aDsyJJrKla2wzqrapn7Ll+jrC6AfAAkQ
	 PzSq4GDV3EhV7O5LzCo7FBC6B4fYwBw29md9+7KDb/qLpJZpZNzl1Z44l/aOxQDm/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RM0BBs3I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnK+2xsj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74383606A8A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74383606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RM0BBs3I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnK+2xsj
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZH8o2975688
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbYuLbuCu6GHLhZz+1gsbZOrUrWD8uGqE3YcaX6kj2c=; b=RM0BBs3IKOBedbUE
	/iUSnxzHYbKuJeLIt4Bql/gwWvKPniNz90Wh3Au0zmaV7FLe4nsT42FjAvuUGdZe
	8rWfLKJ9wur+KYOIjdkml5yzM9jqDD7d6cMvOgQQqivrD5teuSRSGB7BRxK5Pwqh
	fzpkQZleTkB0PuyvyYR9Y9q6xF/eEk1k3nqzNSOwYivxmAPkVLqTe7ZScKI3zH0Z
	1K+YvSPIdTElewctsApbtzeZCZQ6w7hxLwGrWyJiq+ldIbpc1kv+ki+l9P/PkCDM
	ITz/eaus49UErF30O2xkKl91k4/mPAIRK8Cw4MZoTgGzyqzr+4AD4d5nt789mMAr
	aVKeKg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cc6jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:17:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so6734331eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406661; x=1795011461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbYuLbuCu6GHLhZz+1gsbZOrUrWD8uGqE3YcaX6kj2c=;
        b=dnK+2xsjAtzAMi2bPlsyHKnRITgJFkNo41X/3WSycXFID7yjGknIbDwyLVrGmkbAop
         OVuLBpXS1lD/D1WV0F+CxTdEk2CAhftK+e+fcouSSoejJuZVycWBQxEnkzvULkpuGJdt
         bj4bsOuAVU56KoJX0jru2NvPalWdVYldILh1tkXM30Csf/mD6PqlXk8O2yltvy+NpOcR
         JQclUs+5tiFV9X/e+lM8tNy9GOegAuI97m0QaVJHC2HFXVL3d87Gs9VB15UHuZ8OgIxv
         X/GxQA1vZMjtM9twfHIqiavDyuWYCrENQzE643NX2fxCVwARV0E+8H/Y2L0BRYsgqtZd
         fyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406661; x=1795011461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbYuLbuCu6GHLhZz+1gsbZOrUrWD8uGqE3YcaX6kj2c=;
        b=ZhMvKflZ/9IZn0PjVk6YjbuT2c3wDwSFAMkFsdK47blynCQPmNz6cknsJnbVrZ46P6
         v58wnNN5rWm4dLVpZQuHDCdMqvZV6NWxq+rKyjE6K0CxPx3enRGhoS21P/THVMb+3cvn
         PSmPmgfERjmpvAELt5UxjStD6sNwuA+0p+u5xbBt27t8MXEJATONKyodPg6McHkSOHuO
         9wvTeIpnnx49s6c8IXSg3pqKizg7Uk35HmOyM+9e5wcwXU72KMARCd59mOyyHih8eQye
         NL6EKcvjXItwHw3Mdh80122aY3wATdejyLTQVQVWxIau6gMk8zORYHeZAlr4gWJXozhz
         WGXQ==
X-Forwarded-Encrypted: i=1; AL+hErEBYEV1fF7pvA3A01j8ijcruiH5PFqE/RcCM4C1CDs5O6Mhm0wV778u0OVn6+b3r+fWRm4DlnEK0nYloDgs@vger.kernel.org
X-Gm-Message-State: APuU4Z9iZgJYEAbCkNZ8SmUxZL3Sy6/v9VMlrpWLunAXHwF3NjcEJjgS
	4SC5RNx1dSjV5wq24geThTSWyNR44S0Y9ia+a5hB40dd0fMt9/b/TSFG6CHLQ3WrNLgZ8bNJ1ma
	qLyC/RT59BL8NHLDs7xB/G+Nf10+7L6kpbD4UT6fSmkBLFniH7P5k82SP/+hIyofzOpE/
X-Gm-Gg: AYBFou2pW9NlalZUDOLN/H2B/jWIp/8kwgs9IsQIZQ0boPbSNGEEkzDdNrZdMAyWZGI
	OSXEwBuguHqYZdaEBPxxrOpf7uoQu6d87muTD+afL5C8fCLFNl2tL2emWrz47dQtwkX1qrVNj/Y
	b0q0RB39dNPDF1l6rKIsvi7k8nlkD/5g4gXytrJM6S+VcygYyWJcJoadK4j+Cc2jP6lzjf4o9YW
	+ndtd6S1Wu5Ox7BgK/fmpMPU4/pJ5zl912XFH55VPn55+hUBKqLodsihhg48fsVLwK5c+wYISaK
	hy0/iCbQ2IzmVJv/5E7rba5N2kkxCjSLoIYQgU5zK/foUrvAJepUbe8PMCyAOBSkOBqF39gxcHq
	GKb1ye3dZ7XFzHvR55cbYsCTpxK09H3Jp9OiJJjFzrok78QSeGwk2F1ca3Ah5kfF1tIrO92hkCw
	==
X-Received: by 2002:a05:7022:7f0f:b0:191:3c:aae7 with SMTP id a92af1059eb24-1b3c032edcamr2238347c88.26.1794406660669;
        Wed, 11 Nov 2026 06:17:40 -0800 (PST)
X-Received: by 2002:a05:7022:7f0f:b0:191:3c:aae7 with SMTP id a92af1059eb24-1b3c032edcamr2238312c88.26.1794406659867;
        Wed, 11 Nov 2026 06:17:39 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33747063c88.10.2026.11.11.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:17:39 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:47:04 +0530
Subject: [PATCH v2 4/6] tee: optee: Register TEE devices on the platform
 bus
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
Message-Id: <20261111-ice-migrate-tee-svc-v2-4-29d19f6c92ab@oss.qualcomm.com>
References: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
In-Reply-To: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
To: Eric Biggers <ebiggers@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794406634; l=9180;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=g8hrXonUjMAbRhuTx2hbMpd9FGdmzLcfToO/WIbOHXA=;
 b=2k+B/kFL0yK3VXm95Likwpf3GId+nH9+I89GqjV/M7CdbQJcCBzE4mXWoy7bSZOWlkZ1UAWpE
 AEjSf4+0/0VB5hum87wb/D7p8DK/TT5TqMrQzLqdW780zRf+t9lM46X
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX4XmAywOLsMd/
 Qkkmb9mKkzq99ciY+eqQqDjE+jtNGde1e5dysz3wIDWjY6tjGJpHIVNHlegYYmESl7t7m046s7u
 FONU0p0PYU9P4VMwmVSj+kj0kGiQQ4Cki33vdoIXa5PkgXoSRUKF0cbK/7ugfwFkp4homn2ZVmi
 4ZLqT856vNWZYkHeYo1r5iP/nP/ff0n0nHC/HK5wLa4ZBHF7lEjEaIpn27kgK/7kklslWTaZ/7q
 9ejDIj98eRRiWoWLWEkbpsqozF/GdzxrzMo7yJ6OBED3OCJ+Y5GfYSlD8qxzhc4v7wZOeWqap/l
 1eek/CtsyVHgHW3xNeV1N/Pyr7J6SaSrYIZlTalYIh02iOoEaSK8FTRs2kL04TY0VqfcmNGMVP8
 Ky2L/iHH9viVQSDkI8QhJ9mQSX+4EnS61TSoc1Z0O1MRLvES2zaTWEw8hShJEwyBplwlNIT+SKN
 809eD7oLoVcumOPC5/A==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af47906 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xMNAnnMEu-nZTh-EPAMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: tBBb7hCt_FRnq4KThdIu02SXLy-2pHBx
X-Proofpoint-ORIG-GUID: tBBb7hCt_FRnq4KThdIu02SXLy-2pHBx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXyipGwY9usw/k
 JB7olVQouJDKVZB7JMjK0G7CjLr4yIKHpXEnVedMv8x+98yTAuwfQnTNk3KXWKCD2umg29XjCB3
 SBW8qn8SYdM631oySn4X1oJZAkPTdbY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

The Qualcomm Inline Crypto Engine (ICE) driver is an independent platform
driver which polls on availability of a TEE interface (SCM driver) before
checking if the ICE secure service is supported by QTEE by querying the
qcom_scm_ice_available() API.

The TEE subsystem currently does not provide any way to notify regarding
the availability of a TEE interface, i.e. whether QCOMTEE or OPTEE have
probed. And so when migrating to the TEE subsystem via an ICE TEE client
driver, ICE needs to defer probe until the OPTEE ICE Pseudo TA becomes
available on the TEE bus. This means that for OPTEE builds without the
ICE PTA, the ICE driver would indefintely defer probe and the dependent
UFS/SDHC storage driver will fail to come online.

Add support for optionally registering the back-end TEE devices which
represent a particular TEE (say OPTEE) on the platform bus via the
tee_platform_device_register() API. This allows drivers which poll on
TEE secure interface availability to be notified even if the TEE service
itself is not supported.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 MAINTAINERS                                |  1 +
 drivers/firmware/qcom/qcom_ice_tee.c       | 41 ++++++++++++++++++++++++++++++
 drivers/soc/qcom/Kconfig                   |  1 +
 drivers/soc/qcom/ice.c                     |  9 ++++++-
 drivers/tee/optee/ffa_abi.c                |  8 ++++++
 drivers/tee/optee/smc_abi.c                |  8 ++++++
 drivers/tee/tee_core.c                     | 21 +++++++++++++++
 include/linux/firmware/qcom/qcom_ice_tee.h | 10 ++++++++
 include/linux/tee_core.h                   |  9 +++++++
 9 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1132e456488b..06dba76996b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23013,6 +23013,7 @@ L:	linux-arm-msm@vger.kernel.org
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	drivers/firmware/qcom/qcom_ice_tee.c
+F:	include/linux/firmware/qcom/qcom_ice_tee.h
 
 QUALCOMM INTERCONNECT BWMON DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
diff --git a/drivers/firmware/qcom/qcom_ice_tee.c b/drivers/firmware/qcom/qcom_ice_tee.c
index 694aa05847f0..39f7094439d9 100644
--- a/drivers/firmware/qcom/qcom_ice_tee.c
+++ b/drivers/firmware/qcom/qcom_ice_tee.c
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
@@ -22,6 +23,9 @@
 
 #define TEE_NUM_PARAMS				4
 
+/* This represents the back-end OPTEE device */
+static struct device *__teedev;
+
 struct qcom_ice_tee_private {
 	struct device *dev;
 	struct tee_context *ctx;
@@ -281,6 +285,18 @@ static int qcom_ice_tee_import_key(struct device *dev,
 					     lt_key, lt_key_size);
 }
 
+bool qcom_ice_tee_is_available(void)
+{
+	/*
+	 * Paired with smp_load_acquire() in qcom_ice_plat_probe().
+	 *
+	 * This marks the availability of the OPTEE interface informing the
+	 * polling ICE driver that the platform supports a TEE.
+	 */
+	return !!smp_load_acquire(&__teedev);
+}
+EXPORT_SYMBOL_GPL(qcom_ice_tee_is_available);
+
 static bool qcom_ice_tee_has_wrapped_key_support(struct device *dev)
 {
 	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
@@ -398,5 +414,30 @@ static struct tee_client_driver qcom_ice_tee_driver = {
 
 module_tee_client_driver(qcom_ice_tee_driver);
 
+static int qcom_ice_plat_probe(struct platform_device *pdev)
+{
+	/* Paired with smp_load_acquire() in qcom_ice_tee_is_available() */
+	smp_store_release(&__teedev, &pdev->dev);
+	return 0;
+}
+
+static const struct platform_device_id qcom_ice_plat_id_table[] = {
+	{
+		.name = "optee",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, qcom_ice_plat_id_table);
+
+static struct platform_driver qcom_ice_plat_driver = {
+	.probe = qcom_ice_plat_probe,
+	.id_table = qcom_ice_plat_id_table,
+	.driver = {
+		.name = "qcom-ice-plat",
+	},
+};
+
+module_platform_driver(qcom_ice_plat_driver);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Qualcomm ICE TEE driver");
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 535c8619197b..8dc75c252f52 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -296,6 +296,7 @@ endif
 config QCOM_INLINE_CRYPTO_ENGINE
 	tristate
 	select QCOM_SCM
+	select QCOM_ICE_TEE
 
 config QCOM_KRYO_L2_ACCESSORS
 	bool
diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 452896b1858f..4844621b7497 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/xarray.h>
 
+#include <linux/firmware/qcom/qcom_ice_tee.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 
 #include <soc/qcom/ice.h>
@@ -132,7 +133,13 @@ static bool qcom_ice_tz_ops_registered(void)
 
 static bool qcom_ice_tz_is_available(void)
 {
-	return qcom_scm_is_available();
+	/*
+	 * Both back-ends should be available before we check for
+	 * qcom_ice_tz_ops_registered(), otherwise we could pre-maturely
+	 * assume that TZ does not provide any ICE secure interface.
+	 */
+	return (qcom_scm_is_available() & qcom_ice_tee_is_available());
+
 }
 
 static int qcom_ice_tz_invalidate_key(u32 index)
diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 702da7d98fbc..2c0065f3d9e4 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -1177,6 +1177,14 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	if (rc)
 		goto err_unregister_devices;
 
+	/*
+	 * Device should only be visible on the platform bus once the
+	 * child devices have already been enumerated on the TEE bus.
+	 */
+	rc = tee_platform_device_register(optee->teedev, "optee");
+	if (rc)
+		goto err_unregister_devices;
+
 	INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
 	optee->rpmb_intf.notifier_call = optee_rpmb_intf_rdev;
 	blocking_notifier_chain_register(&optee_rpmb_intf_added,
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 51624443359b..85ee76173982 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1920,6 +1920,14 @@ static int optee_probe(struct platform_device *pdev)
 	if (rc)
 		goto err_disable_shm_cache;
 
+	/*
+	 * Device should only be visible on the platform bus once the
+	 * child devices have already been enumerated on the TEE bus.
+	 */
+	rc = tee_platform_device_register(optee->teedev, "optee");
+	if (rc)
+		goto err_disable_shm_cache;
+
 	INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
 	optee->rpmb_intf.notifier_call = optee_rpmb_intf_rdev;
 	blocking_notifier_chain_register(&optee_rpmb_intf_added,
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 1aac50c7c1de..0d3c266b29c7 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -10,6 +10,7 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/tee_core.h>
@@ -1225,6 +1226,26 @@ int tee_device_register(struct tee_device *teedev)
 }
 EXPORT_SYMBOL_GPL(tee_device_register);
 
+static void plat_tee_free(void *data)
+{
+	struct platform_device *plat_dev = data;
+
+	platform_device_unregister(plat_dev);
+}
+
+int tee_platform_device_register(struct tee_device *teedev, const char *teename)
+{
+	struct platform_device *plat_dev;
+
+	plat_dev = platform_device_register_data(&teedev->dev, teename,
+						 PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(plat_dev))
+		return PTR_ERR(plat_dev);
+
+	devm_add_action_or_reset(&teedev->dev, plat_tee_free, plat_dev);
+	return 0;
+}
+
 void tee_device_put(struct tee_device *teedev)
 {
 	mutex_lock(&teedev->mutex);
diff --git a/include/linux/firmware/qcom/qcom_ice_tee.h b/include/linux/firmware/qcom/qcom_ice_tee.h
new file mode 100644
index 000000000000..a5906c5d4e39
--- /dev/null
+++ b/include/linux/firmware/qcom/qcom_ice_tee.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef __QCOM_ICE_TEE
+#define __QCOM_ICE_TEE
+
+bool qcom_ice_tee_is_available(void);
+
+#endif /* __QCOM_ICE_TEE */
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index f993d5118edd..d5310b404c1e 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -205,6 +205,15 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
  */
 int tee_device_register(struct tee_device *teedev);
 
+/**
+ * tee_platform_device_register() - Registers a TEE platform device
+ * @teedev:	Device to register
+ * @teename:	Name of the TEE the device represents
+ *
+ * @returns: < 0 on failure
+ */
+int tee_platform_device_register(struct tee_device *teedev, const char *teename);
+
 /**
  * tee_device_unregister() - Removes a TEE device
  * @teedev:	Device to unregister

-- 
2.34.1

