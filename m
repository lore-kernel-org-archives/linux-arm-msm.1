Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1164842B72A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299598; cv=none; b=XvOUfa45KvPt5xAycxLNnjC+i/zy1bMp5lWWNF+KOQKe6zgdMcoEeUY8UE7z+kJhDTNPszUjj4l+S8s7UECtDEHf+pbBGTLqnZ+tz6T3VxEqvd+VnahuJrvbOLuLS65A48YYTMWzn3py42FFDeE1ui8K/vnPuxLO3nbhpZ8ymFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299598; c=relaxed/simple;
	bh=+AcolqfqLs3ehzGtgYntRTK/C1Fz2e1x6L3BiJ0GYk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl8Uz6BrsaOEWuQtj9gIe/n7ucaIrK5yJYqeCGJ+SIYdVCRZqAn0xtqHxjcunkqkBPIgmfv2Zr1Mruw1qro10EbGxTfjFLhFMdOaok7wSeESLcpLDiSSHk932Skt0juVI2VeUA1VTeB2zLn8U6Nuq7m+sZbC6cl4x7LwYDmvtBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJSKGLFb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i//cJn9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJSKGLFb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i//cJn9b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7quF2002096
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZDrBspdOlaS
	i5AteoQZ2h1DwLsN0BlKCwWO7NZ1k6s0=; b=WJSKGLFbMyVOizPVAe1QCbntT19
	MjaP6YIp8+oldMH7QRfinWFpZeO05GYQUbmU9+heMGeJ4d6pK0yeOqC7TuFnB6Aq
	zZ5zBDaBLNnq3twuKzsduuqU11NVKvjSxrYINKLEmULA1XKihKqDOu9yvElFj9hx
	etdeG9h5ilAmb6WLNnANz1Shvp+nq3JAlZuiVoViWvNaqacmH4Ii0PAc7jXhXtTo
	M0MYtllxR8wnvNXMqxiwt/r+7bBx9MJ5ceUPXSYqEWAFkYgwZ51FQCRb4zhFbZU5
	fyRF7vNP5AUboPZWtpvbhBkg5REbUQX7Q/eSUrTt5euAICRC2ApqkzU5zqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gsudv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso97901741cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299595; x=1784904395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDrBspdOlaSi5AteoQZ2h1DwLsN0BlKCwWO7NZ1k6s0=;
        b=i//cJn9bcFgFOgrwQ6J2KdVp9xiiWL94+Z61PUrHlbdVy8b0IyzTjb49Rjm9AqJidz
         2rX8nfSM7DvVsIEfaf7enilCoWiNQewZZ5fOyyEIg2pwDN1bzpqbuc7EHm2dQHFhYYRt
         TTsLWFCyE6bqJm3WjtXjootsvH20wWUMjYrNh/eo5E1bvNJ0s1GXAnjHmJKCOY5jp3LI
         88Lfk6n1U9dh5JFJv8YbmnW/67qXeeP1HbAj27ty+CdvpF74zRfmJeK4P9EtOkvKlxLS
         q6LS/vgbysiEFOfBQH6X2XwaMtIIF96dfLrDRBRr1q4ocxhCsgSgGja1nZ67QXwzhZ1E
         cvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299595; x=1784904395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZDrBspdOlaSi5AteoQZ2h1DwLsN0BlKCwWO7NZ1k6s0=;
        b=GH60yjh44VyZDLIahhZSm2tBo1j4uho6JerRDJkfw493ixefyo5o6g44kdAj4/1UGz
         Wt9drn7XFbqTybgmI+77xgVX8nryZNOhxeAMd+6QkU6HI8Xq1y3jY36jCX7EWLkHzzsF
         PAqvL2lSCVsK0OK3Nk0bB/qxTKzdxOdAAi+43Iq8K8W29lum6JfUcnSW+sGzw17Yqvxj
         bSUbSWs117Lztk5AGxYYGvqoF9BXpOW/IFSmVzWN9Qvbk2gt6BUqdxoH5F0aHda56v3a
         wPjLw6efScdL+FKi2hdmwELjBEFMcdVV0RzoneroUtsbQhu7qjfKrmcWx0Bb3gbw1do+
         eqTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7va4p3eaycicQhzEPkpiPJW01Dw5p3dguaWo2GdTs/Je9amf+8v3syje5PtZ8m9AdBW4Vmd1bZRZSbb7/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TyhlG4vyJ7eODoC5zApHlJlaxWi1sV5fdUhvKxx2BW+XJuZH
	HI+VO30rCOFz+YhjnwU68r9tj23rT6saf67x9odMpS3m5kO4gV0TWHhzWSnWkI8mKdQ+LQ7075w
	1f1IbgR3gJi2HdARCbDhScM7dELFdT7u3u3K9IfvJVTM5SIth6tTQjI23bhR5B+LDZTZx
X-Gm-Gg: AfdE7ckiCAfuDM2DrEfoXekoGgog4O9kG6DzxwXEC9Bg/LvsjS6n2uzGysSCD+eitSo
	dt5jJstjfjNSNE43FQHWAYzvNwycNJlpRIrGSh78XiJK2I1S/HaO8jpKXAhYmnUAauNrC5VJOZw
	+8Y+j8COqkt01iFcCgga8rYk+K9xouM4PGAev73XNxFVOzU44oAzS+wbmjQ5RWRrhs8ttm/r7se
	EOyUpeRvn4Q7GQChlcv7/NZTvm+iPKtNpmQLHPnSPxAUxkS+gK8oAy0N4HwZdnSR8T+a5HcqqUm
	hlXzZJ9U4F8XebNa7Hsq6IArRdWkWdQBcBWsCSCLsavZ7+V4hjRVeWaoQSV07q2l3Dr4RXmjw47
	zZuq+SwypjvV46RUJD1xEWEFk9HE=
X-Received: by 2002:ac8:7d0c:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-5213c201a70mr26554921cf.34.1784299595072;
        Fri, 17 Jul 2026 07:46:35 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:51c:94f:8ce with SMTP id d75a77b69052e-5213c201a70mr26554441cf.34.1784299594533;
        Fri, 17 Jul 2026 07:46:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/6] iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
Date: Fri, 17 Jul 2026 20:16:06 +0530
Message-ID: <20260717144608.3216274-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX1cX3MLSXAKK9
 /Oi6CDh9tvvm5mh4wAOh5YZSqlJLVhPbqYv5XcqGSldM8rac7SFP/9KMsr85NGLtmCIS1z4lZZ4
 YzoPs3yKggQ4m9Lz5MAAWkewMq2DyMU=
X-Proofpoint-ORIG-GUID: 8vEKB2gta-bVIZZWJH876oB2z5Uc8KNy
X-Proofpoint-GUID: 8vEKB2gta-bVIZZWJH876oB2z5Uc8KNy
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a404b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pv9nQ82OMFi3fEhVMZYA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXxNMDQzOaqBzH
 aWZF1LjI+Nx9vqa/MNv4u5WmXzkjdPSFqeD7zEIQq751XfW5zJfYwjCt1FDN6l/5eJuiZgkf5D4
 wnhOnYMbaO9/8asmocUd8t3gEmXRbeI5dGfVF8yyz7w3wO/KOrM7U7yZCDZXPgourE4h7vTPdCa
 CGdUfn67OySlzFTj++swv5GV8CqvY7FkIN5ZNWcO0cgnI1kTKu1Li/yMiby3PgxDYHdvZIR+6kc
 XjsjU8p9k091Q0jmXLf8mL3zReCXAJqdX0D20opUrxNnkMWmBlHjzmwUIIdD6HNwPz666djMOE6
 lKOyl2qdN29+KLIN0wiHTCfBnk6jCXVsChdc+eUZi1LyA22ckaN1IL02IibLTZNkIUGHS1eMRIv
 32Og5g1dxw6gxYzrsMRtdgLYIiL3s8pe0YNeXhUTB9um+v2/J+Mu8oPT/O4ZkV656+/N9fe+6QT
 tsM+mOHWc4Ps78hTb6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150

alloc_io_pgtable_ops() can succeed and then qcom_scm_restore_sec_cfg()
can fail for one of the context banks. The goto out_clear_iommu path
only cleared qcom_domain->iommu; the locally allocated pgtbl_ops was
never freed, leaking it permanently since qcom_domain->pgtbl_ops is only
assigned on the success path.

free_io_pgtable_ops() safely handles a NULL argument (covers the case
where alloc_io_pgtable_ops() itself failed), so add it unconditionally in
the out_clear_iommu handler.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 1d04f0a19124..222bb7febd03 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -314,6 +314,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	return 0;
 
 out_clear_iommu:
+	free_io_pgtable_ops(pgtbl_ops);
 	qcom_domain->iommu = NULL;
 out_unlock:
 	mutex_unlock(&qcom_domain->init_mutex);
-- 
2.53.0

