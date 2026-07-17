Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AACA42B320
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299584; cv=none; b=m8Nf2r/aoNu7Vzpd4eGKWLK2EdsFVj0xx5FH9Su2/HOGKxX6KCjniWTAjtJJBL3GyUO8SH4E+ujFXFzdN+jw3D7y1sqyQoJMzS+Y+cLOUzcDDnPU34kt5HVWAaO3NDnUF2ACX8roZFev0hUuWNPNSwznFlxL/KqjcCoKyNGG7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299584; c=relaxed/simple;
	bh=MMP0o0/wLxlkOACAQ1AZ23luEK1+TS0ogSqOvAnVWdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R1YUBmwTcCg5it6PNlpr0oMXLFEjqEXr+Pc6Jy1KZ5pxdpHbRK58ngJaA5HXoA/yWOvVBcbeSdKmGWMkmMG0I7inFlvIdOZ+gUfSd+Mz+iUjssu2oj09AFMiG9rVowhZ3yy+84n/kXg+5hbuwxiTOKEOuSD8gHcAp697/0nvwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsCNE9vS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7Uafncd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsCNE9vS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7Uafncd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7rTf1809412
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WqxH1zDa0UM90FIlcAZOeYgVcW9oIh+YtN03t/bfm5A=; b=MsCNE9vSa5V3v0T9
	TOh0LvhG/ngqx7nbQ/VvRAqiPY3pwCGdJTulrwpFROazkDyqkzyxUDiED9tyqZ+y
	n+8QI/OcSnJq2dK6Pca9KcHGnPdsOAAjw9o6Z/Txt+Gpv2OG2X+UOB+luWz2Cegs
	LW5PvQLMtKAL6qvqzCpYsNPm239q9d2FrHBZe9clnkvRn++bnOpZjnOwAAdrUcHU
	vDDP2m6dkTbHxcQK8qyfLynvyZ/5dpOZFrRfuWKEFfT9sq5DVC7VICg6T27nm0eF
	wMftm7oQAIebMugVWdRBjRfzanC3WqUgE9PiQ2x5o+DArmArvSmLAIX2lru0XhGu
	5iuw9Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8m7qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso72407301cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299581; x=1784904381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqxH1zDa0UM90FIlcAZOeYgVcW9oIh+YtN03t/bfm5A=;
        b=E7Uafncd6xjaUVmQaybn/6K3f1YG+h+dzfWYQ13b3X3H7G3C6P+lxV46E0lmx5tiUN
         kwrI/wx9ObIUsNwFyxOGdcczYkRVcf/IY0zgfqD82XhBJhgnTvqyrZTiBemJa4q6YV1o
         mm8yto4tr6wS/io1KIEdnSBNLUdOBjLpRbc7Rbct+SRsbMuhyxHyFdTYuTQ/t5jrKuix
         qBpnk4Oz3sGIxzis1+lR2qk8EQvzG/FpdKn6ukPAeeccV6UcxZeSJG1mt4ESrpPVZFq9
         0aIYd0BvBUoO43PNXKmGeRwEuwyFzGwOovK5OPmRu77+5sNaou9HYl22t2BaMH1sXP6m
         Bl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299581; x=1784904381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqxH1zDa0UM90FIlcAZOeYgVcW9oIh+YtN03t/bfm5A=;
        b=cgR1KmTd7Eur9TVTdhrNrMB97l8CHZdF0Yu7t4dIvBTGYfNRZ+lDSXiNLjIyh6qIxg
         Dd4ihejlI2g2rDErNc+Ezy1Sj3LVZGCrqUoJ21nc150mqQ17KnK8udx8RcPW/rQrqv2j
         U9H7nNBGblqWFOKld+nZzAxUAW8+x0CuiSzleZ/W7WpWoBUFicrAaa7wjePogxQBMZnM
         S6NvWkh47b4kgV0T71J2TIUrsymg5z4SCaF6LHhfdwMMj0qTjCVq1pTu8AixFfas29EN
         5cnT54pCE7BUWhPRMURVj4zZuaaJlSWVu34zhW2RBG0Ofoi/EqWi3JDoz1szt0tOiFfc
         amcg==
X-Forwarded-Encrypted: i=1; AHgh+RqPhD8ov/JvJAqHXX+JimKUAIGGx7elFEjL12ayaCSX4E6m2KIe2cfFm7KklfCIcv5+2GJmHnYgxAxlSHJ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5aCa32+aY/h+mPNQs4KFKrue8Yz61xy/+oDwgpCfPNJLHuDf
	Vo8AtmtN++r+yUkkJLwmxCHu9pg02eOvm49KnUynNF3T4KWtbAygpMg0340MPfkQdVwwrt06Po9
	jiEYXK6UFutSC0I6+NrtgilxS2dqfMEhdrdvSB1joU7LOsigNmwJpi/LFHphaUsPYJ4zU
X-Gm-Gg: AfdE7cm0ZvsjHbXVdMsOqUzQcPNA6j8YNtXEcxRoA4ofDWMq5qefHAb2zUP5H0fMCYW
	wBw3YpfsPzZJLYjqj3uNkqFYrGPgFaZ8hk8OD7oG/qMJatc+Wgr7g/gkc9uu3TE+kYAZhFTQ2i5
	yluj+3lXfzaiDSm/X0tHnsO00IN7Fu0DboEsdDr9Wb1RZKww5cBdC3BSbtIWyvQXtLCFgU06+KR
	7np1oHtxHcTMl0Dq5ZTl+TD/W/HuVsGIqYPrfeOnsdnAnvWgfwkLNaUUoHa8xbe3oB0Q7Ak/8e0
	Kuq3yYjSJdZcPhQXjw+BU4YwO0BKwtdtt/SwkhAK0pozDgCGgi3dWg6Ed4Ns4TdMTIYziO3FdDM
	Q/UZnlzjd89CV6WE3VszfKf3zdnY=
X-Received: by 2002:ac8:5d88:0:b0:51b:eb55:2916 with SMTP id d75a77b69052e-5213dba36cemr24143971cf.34.1784299581260;
        Fri, 17 Jul 2026 07:46:21 -0700 (PDT)
X-Received: by 2002:ac8:5d88:0:b0:51b:eb55:2916 with SMTP id d75a77b69052e-5213dba36cemr24143621cf.34.1784299580715;
        Fri, 17 Jul 2026 07:46:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/6] iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
Date: Fri, 17 Jul 2026 20:16:03 +0530
Message-ID: <20260717144608.3216274-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TjggvTGvL5_P68u5ogxLsGHnxkuDO0cX
X-Proofpoint-ORIG-GUID: TjggvTGvL5_P68u5ogxLsGHnxkuDO0cX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX+tuUiMFub0C/
 4FOXTkRYPy4D4DOjvWCmGQEo23J3J44T3LraBoRYRrlLdOiOMyxUhk/kzoO5BAY0MmN47wmm27k
 uYWd6+ihEvM86vQVCY2a0PcnQWqMZwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXzFa42LRMebyr
 TXFGwBqDhfMYu3/ZxPu/rJwiLaAXzYJ1RFe5EQK08BDHFYyN0c4+V7FDSrr3Jq1/ScYe85x+igf
 Z4uknhWlLp0oLbYCHon8GK8mLqT9APYfd3t0zhK2Dg8OH+kP9wIiH8PBrOes8NR0/YrTJAOjgyb
 JNry00TCtlXLzgX5OFOTpjAo9BZugvZ0S7eTPelA59/4IT2qRa7DQUk+lAPkOUHXQqkC2ZeBHYM
 dfwmc1Pudch5oxH08QXM4azxLFgsJc8HMcfY540QfXZnN8eUqKXwfsaybI62GMLcM3KPf1Vk3fa
 NpPjdkfJQwE6pdJPNofIcJm8GbTFkyrqXnQnAmlA7jbxA+gIRuwTA8YtrWTMiF5yPSD74Mn8dD1
 abuOSVOl8qIVLl1X+aJjTslFNHMlJBdc6+S5zCj0+lqC2GQzYJ1bp+o9KXWIdp4eshj7eW4rUUQ
 PlLuXXGhTisTVxbqX9g==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a403e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xmDQi4VeJV1Yj6r8B4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170150

report_iommu_fault() returns 0 when a fault handler successfully handles
the fault, and -ENOSYS when no handler is installed. The condition
'!report_iommu_fault()' evaluates to true (printing "Unhandled context
fault") precisely when the fault *was* handled, and stays silent when no
handler is present — the opposite of what is intended.

Remove the '!' so the driver logs unhandled faults correctly.

Fixes: 049541e178d5 ("iommu: qcom: wire up fault handler")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 32efef69e72d..09f2ee6be988 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -200,7 +200,7 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	fsynr = iommu_readl(ctx, ARM_SMMU_CB_FSYNR0);
 	iova = iommu_readq(ctx, ARM_SMMU_CB_FAR);
 
-	if (!report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
+	if (report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
 		dev_err_ratelimited(ctx->dev,
 				    "Unhandled context fault: fsr=0x%x, "
 				    "iova=0x%016llx, fsynr=0x%x, cb=%d\n",
-- 
2.53.0

