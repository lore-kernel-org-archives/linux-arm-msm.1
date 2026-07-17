Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B44335E95E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299593; cv=none; b=BAHg2qxNkl4lB/+mN/YHLV9vgRT94o4m6kvrBBuhrjnbIgAxTKHa4VWNVQgZOil85elyJftEAaZpX0zYnwO/EevRQKR4097peymMXWly+AY2cG5j8/oe9tLQEKz2tGwYq2EM+X6fGNAKXpvzKX1UN2fQC7toeBdHrq5+KiNAJOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299593; c=relaxed/simple;
	bh=Q5Zhxh+S9+V7GhxrObo3WbR4OQ5znsS0Y2jHcq5ulvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnrJchuBuhXVnP+Obg2iDqeQDc+700MibtUSBbHPfRuWzcaubC0fba1ZEKmAT/C7byxMcEf5H14Sqx+zuAGjmnHdkUEw+elfmdSbLkcs6pPKP8w3zlBnYvFA/Vpg6mgQQ4lQztFIp/u01ZRZzxGlc+4tuPkUQZAD4MlkcgV1yJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpCJWEpL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImM95/gs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpCJWEpL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImM95/gs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE8WOk1677457
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3uivIe4Q1p6
	JPBZcaMSYc8eXAUuOqshf8Fsi7jMSrjw=; b=WpCJWEpLxEptXN7UO3vw3bvMR2s
	WRsfv2IGmIYdeQATdBtLosTFLH99BDeuAAaQSZB2qxOkaXZ4rJ61owpQw8jmaRFr
	VHCZGP9Os2RcJFEbBSA7yF9WCHyXImihGmDuaJK+UQHxXBZOC5EVmn1jBvPbXm6Q
	mU1BvkjTk+jfb2HJpBszjq6Ul5iH0lPcux9KE3bDLLlOFK2MnjWz05hyKOiSPamR
	z8bjLw2ZYGS0sfJkwPoJnuobuF+vTsm/o+qr3Ou/pY+7d7JeTlI+oTxbiME5DrmH
	GvL0B5LiaAcmcWZMVjC4dg5UI2ZyuWgKqwe4LI5b2P+xEcIwY4WZwC7YSkQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78s1h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90284139cceso28442496d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299590; x=1784904390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uivIe4Q1p6JPBZcaMSYc8eXAUuOqshf8Fsi7jMSrjw=;
        b=ImM95/gsEGAJat6TFzK1molspPP1aI5qtHYqIi/OCrBpcSncRHQm8VOfh/EFvcx9JZ
         ro4Mp6hph8NZNvnZlu9LtX0ANDLSR/09AItolLrds/YA9FM+72At3XvDxdAGHBlTsOSn
         9YNw62BUjliXhG3kOHnZv0FyM0MR5kjjEKTlPZXCKLTmJp1RYwzQ0uljAdvitAeyxyAJ
         dNuiohwLsWZwcHU5guyApwS3JpDCzdQypol/+ibBELpB0SnSI0ZmjdPMJxWS2A94jjp/
         PKciK0dbCTYRwP9PJ3/TJU7cMwILNE+sra7t37VaQZp6V28cwaBIhINgShXDsrkT4e5G
         vmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299590; x=1784904390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uivIe4Q1p6JPBZcaMSYc8eXAUuOqshf8Fsi7jMSrjw=;
        b=bc0Vw69gdVhTY7Rf5Je5f0rXr/Ap/2jPHQDdOTq1IOOp/RDmHzp7KDx5WlnR5BGw+K
         ndwIAw2oEAVIzFPy8M6rW18a971w0seTSO9Uu3xxGh6jqw9dZf6sFz6sCmwpu00LX/FT
         VR7JM7g6NtnM79CSiTH8NtNW3RCth50LFKl+PU7MJ/T69wZSnlJL5EsotVoRpc9JDNnp
         ljBU+PdncuyIdDv/bYW96N1qdLXWH0YiJmVZ/fLvyJGuZ3BayhmnaXjkYWxxrDW+JAl0
         85h0d4dH5hiT78qOY+nM2e4Seqkj/g3bPH4ymMjpqd77WMp3ggOVQy/SjGUgv28Ohnij
         YMOw==
X-Forwarded-Encrypted: i=1; AHgh+RpVtJEddDqMvCq0piPuEDjWdd12OkNcLJ3wb4Cr/MD1SDxfrlSUBXoAraL1uZqa1rZ3mrLS9OWv8yGU5lYx@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGemi5yuOK4FJlP7sCiphBaKMgjTQH9zucp0vl30QFxOyntrQ
	ArnqZaf97IxH2wsf+p4feHJqlbVsbuyHakGckipnEvIeqPHNvANpS3f041fbMBo+pZrrVgYvb6t
	e/o+GNqHvO5sPgz/HOcLjN3wzfb1YdH6Lj5q1i0HC3AgTCy9EWBZi82pC0GGL38m7u/ir
X-Gm-Gg: AfdE7cly5a+29mu1fxLAQCszYmz9p0Cf8YXOuVLoKaE75HN7USwTNk1Yiy6o1DOH2vR
	oYYZtYaDuYlyTsQbiM/Upe/ITtYJPKdcr+qfndO8PcJJuXyFAR7DtwCJBdTrQlbKNa5/s/WQ4dz
	2YCZIimFyOV1hZCC0ofj+/9AyH0adk3TN+wqimuw8OFl3uGHE3+CZlZ/+4KcwV2eHeabacjiuop
	blabJ7zdeOxfgygsKtg/bEWfZI2XikVfZoT+CxuNiVR16wqeuLYO1iOfI0iwvf0EIRb2IgnLwow
	/mNCY8qFz/DkoMatiq3Av+U6UzZCDlQE/ItBqRhCEGtqLIOZsNEmF3Vkcn/BtksCmxNDXZZBBKJ
	NsJHJVVt7BFq0LskeXTe5fTLf3NE=
X-Received: by 2002:a05:622a:410e:b0:51c:fdd:f040 with SMTP id d75a77b69052e-5212b63cbeamr29077471cf.21.1784299590334;
        Fri, 17 Jul 2026 07:46:30 -0700 (PDT)
X-Received: by 2002:a05:622a:410e:b0:51c:fdd:f040 with SMTP id d75a77b69052e-5212b63cbeamr29076931cf.21.1784299589793;
        Fri, 17 Jul 2026 07:46:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/6] iommu/qcom: Check pm_runtime_resume_and_get() return in probe
Date: Fri, 17 Jul 2026 20:16:05 +0530
Message-ID: <20260717144608.3216274-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX4IfWZrOI7tFq
 znH/LJ+FyvWp+X7NbfFBdXrRRutrJ/MdBu9D5m4iEq1L0dDDqDqnj7+41oA2brKlIYJ3cMmCgEs
 za/ZY5vaLPlQ2c6uIA9/oT5Omx6EIdPx9b9fnHmTo+dkrH3WFVF57GbLK+oZRSsrGm+6bIGPGCT
 Cv1euznl/brcDrIds/ek4uGp3/xYpnTbPKiClsyLxyJ8neEItPYcswY/MfAcAnyyBmGX3w9wiqW
 aZXjrU7fidUwYqiecUi9z0+VPakn5zWr2k2EdkYACqWX9Lioxdq+fzJR8QvzqmPefWiNLBTWxsQ
 Cf8FEtz6iuUHAn/ZH8xURsRlNTEL4rCCTHtlgsBwIEqBvnfluP7/IOqRW2a6IDAJ/6tZSf2PuGO
 /HGW/htWPiN/mIFyiq0mFN21HxbE9xZsHM18suEpEVqnhRbQG1WsymmfAOnU3f/wK59KyylnYyr
 q5/ajHjjbnu7Fv1BP6A==
X-Proofpoint-ORIG-GUID: ZUkBFbVA8eYgYDrgl0SKzN_7_iVxh--e
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a4047 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=uh9JkKNIBQsmCcNjqRkA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ZUkBFbVA8eYgYDrgl0SKzN_7_iVxh--e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXym4H0ebAqdzX
 0iddFVt5RLQzp2P/aPS09rYIlu0JOqyDWz48342kNcc1iU0fntz9bSOQdLN6dEVJwM7BFF5+Gjv
 agJJ7xhvpOicU48svE6KNTEd2VZhJbs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150

The SMMU_INTR_SEL_NS register write in qcom_iommu_device_probe() uses
pm_runtime_get_sync() without checking the return value. If runtime
resume fails the subsequent writel_relaxed() would access hardware with
clocks potentially disabled.

Switch to pm_runtime_resume_and_get() which handles the usage-count
cleanup on failure, check the return value, and unwind the already
registered iommu device on error.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 71251aecc292..1d04f0a19124 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -861,13 +861,17 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	}
 
 	if (qcom_iommu->local_base) {
-		pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err_iommu_unregister;
 		writel_relaxed(0xffffffff, qcom_iommu->local_base + SMMU_INTR_SEL_NS);
 		pm_runtime_put_sync(dev);
 	}
 
 	return 0;
 
+err_iommu_unregister:
+	iommu_device_unregister(&qcom_iommu->iommu);
 err_sysfs_remove:
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
 	return ret;
-- 
2.53.0

