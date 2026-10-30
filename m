Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397925;
	b=jdu2o7M8uHkDXm+c0w+gGc56/jMi36XF4rbS7HWgdN8KAi0NL+rBnIMIH0eQiJ/x4ZAw
	 eD8Az+MQXB8NRULrNvllzVRhVv6goyQQlecJYPN86AX7+sO4Y/CgCzXBadSSGx5Edw9Hf
	 MCk+sevhKPlID62j5WdTW2MtpxnI28tvU+/rrXn19tG0x+buNhuVvRIC1wcBUtrAIbI3z
	 wMdz+JQVptYSSSmhSlRAo8j6MjRgABCmY4q7m4LuVWb3ghh0Wjji4NgBnmi65LtgWPVXa
	 McKOhtPAflRqnBorexHgomjvbE56eEC+v8Iwe13t77s4ScM4GPuSzLQEsXjZJXvYjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=;
	b=c/m9TQeqSVuMbUzUCJDGCEmgtj2KRWiMAMsp5QtGiYuW+4KUwMrx+ZNLCQg9ZlXoKPJa
	 uQ8Bjn/uX4hM69z3E5XguBNxOffsrv0zBevYU1HV30Q4WAy2dSYGE0Jl4lUl8hp+EM2Xo
	 lNGYpvwtVA60Y32HoDt+Lqkmc7IgwtoWCJ9YYCgIuqxCH6TOyfmZEuAtzyY2J87OPzyFD
	 LeLce1GqHo158chnh5tcK7m/UKhUBrr6pLoalC7sf1Ij+5YQQelyXB01QJPJ8zceePnuZ
	 Aw9VUQkDJkbYcXJ89/75LMVfFDxVt/ecaGRPH/V711982fqCiyCD7QworaZBDrzQTBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R57Jl92B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGe0w1Cu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C280960A260C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C280960A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R57Jl92B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGe0w1Cu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtNAG3463635
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=; b=R57Jl92B9rMbKq05
	z/298LSgaT9g4VoRCVs+DSDF6R7HUvAC62cd6WVRoVHbesIhBQQjBjA4F6DPY2xv
	MhYThqYSbgCS17mnuQXT+XokUrE4QL1/09vMDuL4ktLDfdawMlflCgkyHA/ywi8u
	nAql5LEF7E7AWoZPNlNadov1mQ+LtYBnrNIahKYg9f4/pwVe/SX0UCv/70uCQ4Xk
	YE3a3Ic/gOxd4eZU5qb3e7lMOBoBj3bdnakl/iC1cuqZN8ZsS2NN69MUPYqTL8ZU
	gbdZ5CLpXR0VZeGLMLyeNqaONFXKiTFeD7qKTnvTSTfJfPb31PJTRqF5Zd1CW5eD
	GMv1Qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0852p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so109882885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397923; x=1794002723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=;
        b=NGe0w1Cu0nHy01CHfg0o1SVcTxd+cEkSFMAm1HWqUJ48tQKWGJwA6qP1Lrdb7a0qPE
         vcq6sJQNAzGrr1pAP10/7s1ShGgZZszoiAtwIA5ls/bqCIapE1TtiwWH/tvNrG54p3r5
         3dKESOyaToSlbuqPccJBacjvFu+Gz0Ae4JITNyMcdKO05hjLHoq2xTTbinpbqsgxu78S
         LHQmayTL9g2KbzxztxDra2dzz4SDuWsX4Em5+U8K9eT0eFhJyAZjvmDOAcrMUj40rnov
         0wuZEXbrn2VVN6u69+Odv4HOXHzYNj9ZTxCoUZvkLRxbCI4e2JsdpnOEIpU9QhzDvBHy
         ym3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397923; x=1794002723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=;
        b=i5WQOqe062ehUBJwBKDJlRqBjGO9yI+rfOC7UJ+2+ZaEsthgqpL8TKgZQXey0cHxTH
         /tT3gfcsUnybr1S+7OYdP4Dv5wdW9236GBp7f2J2BAlYGn4Sq1teMLgzJGfxmOQgqhbk
         la3QEcyRMAoC1FKAydYFynj0dIbXx6zmbMyJfXfOIUgaUCDjPWO6iLeLToRRG8zso9Hx
         vK4GbJ10PLVKbqcjg+4uRaADcbKzY1e/r68O7FeFgOW8+X0htlRljVEdZ6hwDKBO4p6g
         mzDjq47czQLO1JOHYb3X9EsEbXE0Q9EoliN5Q/XRx9K8cdk7cl9byIFcsgNZNHAxj1IT
         9Spw==
X-Forwarded-Encrypted: i=1; AKwUvBwwhrsMslguWUdWPqz7GmGHRlgAB+t/t/7RXbaQWwalNBlkFvQJuhZsVZSATcL5fAPq7nl+gVDrNRIVrvQt@vger.kernel.org
X-Gm-Message-State: AFq9FYK7TlI0MifvixNz/tm/W4WAcKaNSoCI6STxQk8CTwqLG9aWdOl7
	tWIgKM2/mP4BgoYPdTSHfD+L3g1wfe4md3vSd9pnL7TaIqWuzuTwcfP+gFEkG+PAaLtqPDK11et
	cW1VZIjgJRH5loBv2kl314fpvLfocMZpmiPJVt2I/TjDvEsQhqZf8+6U4U8R/yVLIBjfgSfnHqx
	8H
X-Gm-Gg: AYBFou2cUX0mW1FgRXAf0/SnmzOBOTmn0Rj0hmeF2ziMOswNMUcs0gnAD6Kyz6p4ETJ
	xxrSNJ+73MZm/puoK4SM4L/08C3XldlqpXflqhCiyGAdtbU3hGkQxB/Bo8mrciiAr8MRy3qIwiS
	Q85T7og9y9icKOahm7jhb+Deqh/nIgk2zwSjUFK7Cx17j6QMiywkkfoLPGV25v8HL51OvJEP/oe
	CfnqGIQ/GAoNBMjuAfo2nrHOVm8k4k8yjMGZySkGXOR2xxWhhpMU2tBa5gT5oNu86/DEJjtv5oa
	nEb9RAL00M7WwraxKQwZ1nkg3rLFTkncDovMTvhW7pjMhEoRPtppSZSIREnBZw0qSOplB3k1igV
	Q18nQkoBqUlo4RD9LZlS8YGYLlc5dFu7iUWLo5ewc3zttTfkSk8xbtCB/c4X0kU9VIe0J7qY0BI
	PD3UV8bbPXiWyy3H+wz+LJCHuDbhgdNGVVMqnFEMxu9QassDnx/1YjGwnOCnOW/Q==
X-Received: by 2002:a05:620a:170a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-94421541cddmr602237485a.12.1793397923069;
        Fri, 30 Oct 2026 15:05:23 -0700 (PDT)
X-Received: by 2002:a05:620a:170a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-94421541cddmr602233685a.12.1793397922535;
        Fri, 30 Oct 2026 15:05:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:58 +0200
Subject: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
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
Message-Id: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hIUS4OCCIduN5c9WA/I6hlxnzxJqYrD6RjEBkMJ6o8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSYzsCzXM1EEMZVjFupenR1Egu10IvqTfPn3
 5AyWZ2VVEqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUmAAKCRCLPIo+Aiko
 1RapCACKPnyD1GJeL8YSN6rJSnnQyuOTq1+5XOsKmmvnSGcAS/w/BfGCNi6I7J0TFUvkzTOFkJw
 Ss8qVwVjoHb+cBnAlRT+18w3DWvrfUEA9kZkdZjYbXfwFREvR0iN1kLqj5OOlQUCNQmtp95Wcf8
 nLwfJz/gg4KEDKueKS9zV/aL5weYMgDq3mYZf9iu+n9hOWVBpBpR9AhPV4uUXhWYWOERaAuT1qV
 SkBFbC4AJJ2pWCZdMVVXgHlFRkItKZ66MTePBiU7foVnOnoCdfwKlVOfkZMNBLS4cYRlVK2q76v
 Qd2ff3PfoZTdZEIK4BXm5Xkb3zQld3i/b2hspp4U2STey+xc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: r2Wj5uxiiH4Zojgabo2B0Zu18FRr3nsw
X-Proofpoint-GUID: r2Wj5uxiiH4Zojgabo2B0Zu18FRr3nsw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXzXyEQxpljCk1
 K3kU3az7m6f97w2dzvpRpqPm9uFRPi8gEn9wTo+QuT/3l/gLdGxLLIL4Z6EYbnG9jf5aMVWJeCQ
 UtfnLkIIt8i1KXfh3kMZvxo2Qj5FxRc=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae514a3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=9k9QU7PkdAG4pGQKEAsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX4/YCrhCsOuFC
 4kpK3KDGKNfh8tE1nwFEkQF+4N6k/tT16/96S6R6FRRGpg2w+KzXc1qguakhwmXqGC89ZKf4UkK
 a+AW110eMeKbA8RBs9NteHM3SS689kJkL7t8lhTgAzsQrd0IX98JNtsnTLz1U1hW9vOG4lKXebD
 56//iNpJBq/zm6bz3g0ispJa8T9cbCkjsytxjIRmTt6wPNE9xCt6n7IndAgql/iyEK8ENH/Yvem
 ay4VBDXfTFJybGxyvgTcP+7lsEYqtyHDBLsLpZ9GVZIbrJqrr6i++OYSxQQXE2wXm9TVaCDF3m6
 nj7nkCoZ7G4i8O0v1ZBzHKCmJ5EUSICRzEET60iFuWnNMYFHyiBZMzPtKBnXG5rVMTXSuRdWveE
 Zm1r1Oa+FDV/PksAdRP0xTanhCF3PFk//+DQe9x6gLXuELAJntJBZXhObkNEF3cTiOFYvjqPivQ
 LVp6oA958t923l9GsLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088

drm/msm writes the addresses dma_map_sgtable() returns for the DRM
device into its own page tables, so they have to be physical addresses,
i.e. the device must not use iommu-dma. qcom_iommu has no
def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
buffers end up mapped at IOVAs of the unused default domain and the
db410c GPU fails to start.

Use identity default domains for these devices, as arm-smmu-qcom does.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 54130c32056a..4a9c4cf63724 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -531,6 +532,18 @@ static bool qcom_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
+static const struct of_device_id qcom_iommu_client_of_match[] = {
+	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,mdp5" },
+	{ }
+};
+
+static int qcom_iommu_def_domain_type(struct device *dev)
+{
+	return of_match_device(qcom_iommu_client_of_match, dev) ?
+		IOMMU_DOMAIN_IDENTITY : 0;
+}
+
 static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_iommu_priv_get(dev);
@@ -602,6 +615,7 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.capable	= qcom_iommu_capable,
 	.domain_alloc_paging = qcom_iommu_domain_alloc_paging,
 	.probe_device	= qcom_iommu_probe_device,
+	.def_domain_type = qcom_iommu_def_domain_type,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {

-- 
2.47.3

