Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBAD42B724
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299588; cv=none; b=rMeN3gc1HV8TgAml9MQKiESPuiepJdiGwrzJWAf4FLz6mUL2clJZ53xjkLgAOY3yT5kvIjbNuBtJjmOo1iZtxIEwXtalWR3ZA1ZfJbkOGM9o3mmg/Q4I5CatR6nqIhGMljTt0pd8hF/Z7eISh2qdsMwduD4mQLqKMhN/8YCZWGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299588; c=relaxed/simple;
	bh=SHMrIaS6yHyhN7hIfNsSI2APEMkhBUx3UNbQJXjB6Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bslFpWv4CZCtsGawMvH2TujGhuRZMZ+jUbXpPIOwh7D3w9h1lLDcc6PO0ssog2m96WwLMN/j139RILxr8Nj56UlvFsdj12GpP6WXGpGLm0bNpjjPb4NwssBEXkbPFBW7xfCjLFtU7vl0SuKE/ucslPmphAAdcxbUImbvFwl6cWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLhoDabl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewju07kD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLhoDabl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewju07kD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7wEf1839042
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IJVHSO1u6a/
	Hfz7sqtNZdF678kjFyDUjw1u5+bJ5TaM=; b=XLhoDablxd/mhdo8ez1693QDxIF
	71qWgd0edCXFj0Rz1v8wKBbgAhCquMMXNm+QLqj5/FAlDufws9TACRMTd12vW2cF
	ylTN3CiwKhIUtZ8OMTz0I0UgauYIh/7GwEXI99vvk4/Ub81O/SFbonTsaq2dyzuI
	HFLJUEffr16K9D4irXhtqDpnZQY6SZTPpKZ5mehuhNsxFjMCFNYxz35TcQUT3Qjw
	veTT7Ikt6A1FvwSjmkTcC54cAy7oDD/kScH5rEL8td6Kni+fD4ZNFNfXAIzlZRpd
	HbBh7lSYfARwPIaOu+Y1gUSdTjL3q/JUpukcqVVyjzBkptdPkSzttD+fW8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag9rfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21c01cf3so98152481cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299586; x=1784904386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJVHSO1u6a/Hfz7sqtNZdF678kjFyDUjw1u5+bJ5TaM=;
        b=ewju07kDNwPZ6Hiw2ytfRxGksTrupM3In9rsUzG9qbUQHeqjXUtj7n+P0kfwidPSf+
         w8ztXT4J+1Z5QfztGyMRlp5pzrT7pDCpGbwGt9SnZ612F9zTjeLAJ/Klf4aYlOjtJZZb
         VZYBS8/jTbXked7tzLrdtDo4SHY5Sk8vJxI0//G+nKoEHJRG1wEH6JaPC0z3EnKTG/JV
         hPMhL8C1KYKQT1TOWPlbvK7YZSDWCvwwqIz8fSlY6e//cacO8lzESPq0V4xx3EP5/xIR
         hp4UdoU3gK95WF3dVBQLw3MYnIz8kn01MOkam+tUQXI86Y4p3J1vZVuslUnlNY2Aud9g
         TV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299586; x=1784904386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJVHSO1u6a/Hfz7sqtNZdF678kjFyDUjw1u5+bJ5TaM=;
        b=gHHoRoaQLuwt56R9UQUIW+Ggmb7qD2ob2rQZ/r5SYvgm4dMLvbS9VErPFJ341hl/24
         G0V8bks/X8BuvD/q5r0h3HOQcNZX9NSCUDq8Lzd62Zc+SftHaWUQxOHX2qtHelV1Xqnq
         Pf8Eh1pgocUOGMfFny6xbfml+NwAwOcruTCB7fEqASXZxHIRV1scEIFBHz5JFDNDjRBy
         nhtoyhIh0PBLoPhuVg/oc9C21JOs0yjQktfFKHQ9tvosXoARpAOpNDfDpHfVfINnUtcm
         xYLFcqOh5ZMtsBMARbaf4dXfBqgJh3HRRi8L89ZNex+PWB31gSzg0to7WWRTneGYxlk+
         HxDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKtSOA6CzOshYNUf7wLKJnaReclfrbgCjhEsds6g6YKreeF9xQVnV/cuf1/2igpOtB+yfApBRxNM4x35Jr@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxZ3ky0oySr5QjYS9WzPnNHmflN+ko+MSixl3RbbsO4ejuRrb
	qiUF5429ABYP1uxhaqZMHdiqvJhnCMsdwiVhBriTLvtYxTjBvJc0ZywxfRWxKC4ihLtwIU9X8Wh
	sD9jg7flwdfQhX8LgIkrgCyIPtklg+evlRzMijefc6sYqQjYR/o58OD/fGI6i3B7oC0nP
X-Gm-Gg: AfdE7ckYJ1jTE+/Upi+l4PlxXezBIFjtOwZ1fcEYX/AaGnTlPx/d9z0zQT8IMsSuhBk
	/6DjST6rAlg/FEoaiOkx2azInPK3BBNQdwZq1AK3Ob8ooyhOWoNYgrnuZ4lsXgtTOZ0NS3HgtGl
	eOYl4DimOZMZtUfsdaQdVsvh9/nrEBt+MjMU/kLt2uz0jsXm9VZEd7CbfxfQoYxYDXFjpo64QNu
	CbnBBOQ6jZf+n02p1RaqMQ9p59mEn6JpOPEzvO91bRTRVQEATpKsgWkMneTs6u7raYjcPTAa2kt
	FUhXAF6qUHTh4K2Ywor9ae8117gldVKLTMZu14Aay8Q6x1FSXzdSkRvImRkI+zfepI7S1N+pGv1
	b/I00xVUn2gzgjkaQpEonrA3PEz4=
X-Received: by 2002:ac8:5913:0:b0:517:6631:101b with SMTP id d75a77b69052e-5213f66b7admr24607101cf.55.1784299585624;
        Fri, 17 Jul 2026 07:46:25 -0700 (PDT)
X-Received: by 2002:ac8:5913:0:b0:517:6631:101b with SMTP id d75a77b69052e-5213f66b7admr24606711cf.55.1784299585126;
        Fri, 17 Jul 2026 07:46:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/6] iommu/qcom: Use devm_pm_runtime_enable() in qcom_iommu_device_probe()
Date: Fri, 17 Jul 2026 20:16:04 +0530
Message-ID: <20260717144608.3216274-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX4VhuQ7LL9Kw3
 CbEFtUNA9tqsORTembzYYbD2e0gq3hwuL6mtgRFVFJB6Qcl1UpJWmnsppB1IQu98DDziXtg2f5L
 kNbyqS5yAc53Nan9YhfRUqsAzVZc8EBBoUx68EvdYXc97GpC3pOPVgK8lgFzjZ5n7B2vBnukTC/
 7imYVMIIMI0crDThU7bBco+Qgt1hkOirfYaXiNcCF6DBdkpBu/DQNLe3JQQru4i5wJMcwTmAVFZ
 sAbHY6DTH4GMNlSgqXqlikiA7Xer2cRk6zWdIExyvn8ymrE5KPhCKeCGHRpK3vfQVn0E5Z144iV
 lT6E7xfDgOyD7U1CKMnieQBbu/oQt/9SEUd9ma+Kel4U0p+xLG1vEGtM0sdslNAbXU094Uxtvp8
 7JyN9SopH0CZCt96ch8+5fV3RWBu25ccXfocbdCdjMTrvvumCFHkq6hA2rXJjz9T6NAea1WwceI
 +HIzV0Me40RxsYRm6Ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX+AzPGP73qI3C
 hKHDrwLlz6EI+dGRurTHc4JQ1W8FZly6zAWgsoa5E/nSkxaOtiSmRfpiRL/mGKpGgbLoKYvRR6h
 RvhcDLXecQt4zsGoxGRXCABO/53doq8=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a4042 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ZhKRi010OgpVv_9PQ1gA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lOba3jXV-aInVVtI91lEHZq-q7A53dWH
X-Proofpoint-ORIG-GUID: lOba3jXV-aInVVtI91lEHZq-q7A53dWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150

Switch from pm_runtime_enable() to devm_pm_runtime_enable() so that
the matching pm_runtime_disable() is handled automatically via devres,
both on probe failure and on device removal.

This removes the err_pm_disable error label from the probe function and
the explicit pm_runtime_disable() call from qcom_iommu_device_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 09f2ee6be988..71251aecc292 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -836,20 +836,22 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qcom_iommu);
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	/* register context bank devices, which are child nodes: */
 	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		dev_err(dev, "Failed to populate iommu contexts\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	ret = iommu_device_sysfs_add(&qcom_iommu->iommu, dev, NULL,
 				     dev_name(dev));
 	if (ret) {
 		dev_err(dev, "Failed to register iommu in sysfs\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
@@ -868,8 +870,6 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 err_sysfs_remove:
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
-err_pm_disable:
-	pm_runtime_disable(dev);
 	return ret;
 }
 
-- 
2.53.0

