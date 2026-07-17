Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2461C42B333
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299603; cv=none; b=JCJQbvX4Q7OpmMXWkrYf0gyY7IWMVUJUvseqMPOd2eP2wfW4tp+1bIx6cMIHPenzp6yeylJvSS+vxjTL0evgvp9V0I8a+GUyYwt4pb3l8lacGO0/82GsdPJwAQfReWRhCsMdoiaPjGCxeZ+0h4iYFAdaB0bNM8ktLbPr/YOQfQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299603; c=relaxed/simple;
	bh=SJxXIQqT//xBWQlFhfXbmp7aC2DouDQBgU+JmiLe18w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2LnRnz+ZhsJlU/FKUWEazIMxyOSdaCFNDuxbzZkXJXpypLaMFn3kiHlIAENe2SP75hxojPy+XqJZWcrwEHI0sOFqCjtP3Pd/OYRXVO5H/3YY+tZADOmKmymV4xABrw78B79xt5/pkaHDgiduJxhnuIZ0X4bX4IGqOO8xHbwTFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dcl3uIUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RkXBJo/6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dcl3uIUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RkXBJo/6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7qe72002106
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z/6lk2kxW2n
	TS1x719Bxes8ej8Ufj/5F6jTJEH0kaK4=; b=Dcl3uIUwdol6XSOD4xXwUWtBbBh
	AlbqLwRt+YULgKoms56hrHdn+7deWYVfFcXknBXmyQOfgu9JAXZAMe2QRhNofxh2
	XMwiUJtiXQlDAXcD7B7DLVEmOiokKPPujSgSHWFIQmpy7tF3ENP8UuBtKmZVwRG0
	zO77DEi4h2xTbFE1+07cynDEaaZS23KOictYRWsUrv7Tzw0ub/GI8D8mCDb3JYiZ
	cWdPrQYfOdbm9eOTfwiaVWRmNz1iIst5W13Ee65jUUgU2BGi0iA2PeAkthq0lgP8
	5pcb3dFs9BvaYFAXxGoBFtL5qQMC+5i1eIgJl0s+XpIjvSBnEjlvvtjliKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gsuef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso195581231cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299600; x=1784904400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/6lk2kxW2nTS1x719Bxes8ej8Ufj/5F6jTJEH0kaK4=;
        b=RkXBJo/6wDO6apU0v2Uyu86g2OCUxiwsgYkenXLMlsMQW670maJgLXINEVbxkXOsNy
         al2M/DvvewWFdjRxkin3ZdGyEaj8fMg4jCaeMPgZnIW/AbFWmSDQPAfGj2xj8WLPXBeR
         TNUyTwEKwYc0d8fdrftwEpad6ABVS2aPPezkvnI2vdyaGFnrDhOi72dek/MRtL7haLZE
         FCbGdZPnpjNr0bkvw7M09kClimaUoJcJcVpeYxY6qOmNlhR1JERd92NRW8LweZdV5o7a
         Hd8lhuznOqjp/slg13u/b9DaRuvHv6iCw8rBms1jS0UXxB5G1EWLTcZhszPiFth7XbtL
         WgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299600; x=1784904400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/6lk2kxW2nTS1x719Bxes8ej8Ufj/5F6jTJEH0kaK4=;
        b=hzcOl5KexNrM96setPLiMZoeqWZNqz6wlilZctz3HXBmRl2ahBD6eCi6/HqYjLsmr/
         0tQAtjPBm4uhFxPXP3YV33VSuXOtSo7BR6lcR+JU4ZdszkB/DEZg2yhJiDC0ASCKtQYm
         TfjKr+Xg6tEOHPhinHEyBJLqy5DF2IRVVoBke4QbZZXmmPJWdRFcn8l71YrpNOOfaU43
         Z6XMVjACfDf0u19hyRnsQs9pvic5m3aOZ2FkIO0Zf7fKvMB2lCk24Aep8Vb30CwUodV6
         Bra27Tb95gCNZzyTbdl1od6+rUkEz8CmJp2Plt/GAl5H51TUf9JpOuUPhrJjqDX55BIy
         Fzxw==
X-Forwarded-Encrypted: i=1; AHgh+Rrj5y6G/aImDxXpdx10jRUKC7hLuYGV8xz6hgETNV1cchUBprxoriwlm3j0dNkQv1/9zFr5WKDIkGY12Uxb@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjFzFeTyjKnZeeGp7PaFfFpF0Q2uXUuZwtIicIZlq9wHeKM6r
	b2T6I/Hy+kG1y9TRUy5jm/DV4aRryhamLrcgLQ4sQ6SBMl6YaJ/3kT+Yonzz1Oleb6xi2y03e+V
	GtpjKQt1G74XlAWKC0UCGOe59BLHM+9a/MZCSvSWqNXl4Bu/mNpM1EDAVnhVDqy+psmmd
X-Gm-Gg: AfdE7ckHGbwPx4FMwjy/YwC8w5xYOa/G5iffUo0e8Fst+MMfY5aKsWBorfYAfdTS8U6
	szyogYioPu4ZSWsIoaYdDEF+G9tx0RkFrrblQ236wF8OV1D2eR3E93BftVCnErjwFnb9iMMduiV
	PwLRl4qWa4+Kpbtrwc07xFu+5XvmotTgDaytV8B3xPn5bmFJZA1EzTKqB4EA2e2JHl2RSUy0jeW
	0Npfjyyc+6Aoq5m1k/RdMMLCNup1hTLCqxNpwo6mBC+LFwfsqLu/yh+aKejTKL4JaFR7Ga76ven
	hW+lcQ1j5tDtkTwCZrUXaqkEecvE0EHFQRn0jYs7rOdDGacHxs3K2fF+71CsG0AI+nbU6zMKZkK
	ubDwXt/nvSPqSQm3DI4/5SereZgo=
X-Received: by 2002:a05:622a:1ba2:b0:51c:6e:ef23 with SMTP id d75a77b69052e-5213c9e3db3mr27724651cf.32.1784299600108;
        Fri, 17 Jul 2026 07:46:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba2:b0:51c:6e:ef23 with SMTP id d75a77b69052e-5213c9e3db3mr27724121cf.32.1784299599569;
        Fri, 17 Jul 2026 07:46:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 5/6] iommu/qcom: Publish pgtbl_ops before releasing init_mutex
Date: Fri, 17 Jul 2026 20:16:07 +0530
Message-ID: <20260717144608.3216274-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX3eIibUcFo5ds
 taQ2oy+/6GFNcNyZ/kMSLkE8NGQsI+X+7bbvaiyoDzi8MicOR9A1lKZMFcKyFUT/HZuRpuvsRMO
 5AajpIETMMbtfT6K/KPxr8bllFovmO8=
X-Proofpoint-ORIG-GUID: BPFhCi90mh2kEAVEffP8fkW2fzzPXVCd
X-Proofpoint-GUID: BPFhCi90mh2kEAVEffP8fkW2fzzPXVCd
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a4050 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Ya-8ghbQ4qwRuljleqkA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX3NPVMpLESz5v
 addljlsad9C+xEaIfRjZwxJqxEjv7WffOZenW6d+P+wd0i49zX99El0yTMOu1FkW+VekgbdG9sQ
 w7RrypCSvRt4VWcKXzwhCNLYxLIHx3e5VDfXIsZ9AgFDepzqN7oQmGbbEt5fA1bnqYslyMQEdSd
 0iQocu3AIRT1+OTLs0JKfb67Hc19rPftgnoefqnpjXXhEsGIQDH2BACRm992rlMUbYMrVammlGF
 3lhQVCuk40LCm/lQzLbqkmHMYJ2+qaA0nPMh+fTLfgzUVcV9YLfZN06vJO7GL0qqvIMlmqorKvM
 lwB6MGgWC4U9opQmjoxyZyIwaF3yQMCnD5S2HQ3iNvn1D8tfo6iKZJiY3mv779iv3OdN9DuBlVn
 LPpiBqHjywItGRfiq5uHtM87a5TnUdhf1CroYOxbtyvlW/jOBpaSfZv5iGIw+Xg5OYdqm5WyLqd
 +nqTBYp8iQx5uvyxBBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150

qcom_domain->pgtbl_ops was assigned after mutex_unlock(). Another thread
calling qcom_iommu_init_domain() would see qcom_domain->iommu already set
(domain fully initialized) and skip re-initialization under the mutex.
If it then called qcom_iommu_map() before the first thread set pgtbl_ops,
it would observe a NULL ops pointer and return -ENODEV for valid mappings.

Move the assignment to before mutex_unlock() so that once the mutex is
released the domain is fully visible to concurrent operations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 222bb7febd03..ecde5ca2d476 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -306,13 +306,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		ctx->domain = domain;
 	}
 
-	mutex_unlock(&qcom_domain->init_mutex);
-
 	/* Publish page table ops for map/unmap */
 	qcom_domain->pgtbl_ops = pgtbl_ops;
 
-	return 0;
+	mutex_unlock(&qcom_domain->init_mutex);
 
+	return 0;
 out_clear_iommu:
 	free_io_pgtable_ops(pgtbl_ops);
 	qcom_domain->iommu = NULL;
-- 
2.53.0

