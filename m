Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309033;
	b=IoXgECkKvXGiqEKxZ022RWBQi0senB7r+914AaERtzQk6oLEPztKyAN7tbh/ayMiuhfK
	 ixhOtRL1oPxtQ8I/hzBecZeMxU0uLP5BogOD5o6xc0kMs5O5Iqz3mtacsuZZfPL0eSIOb
	 E+f3wH35iIl9cpCddykpF8W7t1Za9XkVypoDKoMnJu6EZYJX7x+9znZOYQ346f5JFCLpR
	 OlgIoUplWpF9aH8VhF6zzeHgMKNIXFZCubotBi2gVoqejjzIMq7+xj2cpyFDZVo7mQVWe
	 e8T9yTgu1TrsLr3lK/CEP0RWvrDLgUbydlznKl8VJUQ/ANpC2gEVoeyrEe1Xvn56ulg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k99yZnPO//ukQtkYAl64CwdQpomDxI0ACN/FhmeAnkU=;
	b=OQZNlaWUXdR9r6yKE0oi7IsRjl5JEEnXbYP57RLSjuiwoYA9CMFj0f8r7qoePePQ7Eyb
	 gfU2dzx2ICifFwpkdj289D3A7VkNw9r/FI4QKCHQKQeokyw2949qj4XSIyojnBeYSJSyf
	 1FfhonAaefM5ubgvgIteM1TCTJdvFwMAk2W9GPIfZUYfik4baWD5DePRJhycmp3YzzvU8
	 oldgul5g8+EsyzWwmvbtw2UIPbNVT8LaseYbpfl8Dviaa21bvlS8GGZ7uxGa3uVBGh6re
	 +En9Z0hpAghIiBlASZrSWZc3rHBnJQDTKpsFWHtdMw9/HBJe8GdEEcv0BcbQ04njYZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ph7Tec2U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbBEcRTr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494B606A333
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D494B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ph7Tec2U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbBEcRTr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjYF6165285
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k99yZnPO//u
	kQtkYAl64CwdQpomDxI0ACN/FhmeAnkU=; b=Ph7Tec2UImH0TA0hHZJxI9PY+gV
	4RgrfuGlj6cfSV3KRpT3h1tiZIc8syLaeQpZM+h2XLHL66cXuBkY3QO7u643dA0Z
	TGo2gCl4ynKB9v0b2M+uEta1c1qA3g3s3fF5RHYGtxoY4lR+zcLLABWpcVTT9zXt
	mCddJ47Zexo3Lke5hBHl/14zWyAuEvEfsAGBKFcxYNvn2e7XDwc+QHryNq27V0gr
	13AXaRadWKoHjQ/1cE3yMs+hv/Xan8eyHTQKqSVx9pAFstH/nlWyyT0+ZtOlY5fj
	rfqxGd4WzdlYtFw69ak3VCW98XohMaRpPVxQwAzAtWQFAD5Fdw5qwMuv8Bw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm762270h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:23:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so2795830b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309031; x=1793913831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k99yZnPO//ukQtkYAl64CwdQpomDxI0ACN/FhmeAnkU=;
        b=HbBEcRTruWlNdQRghcLegMwEvimc/YobMwqZcbsrDo4cWzW9jiNurjKi8cGzsVY2fb
         w3e0/a3WNG/Ra3+Fy7KDmrhUfwMD2qYynRzAliyf5aFm3FhHI1Hylpl9HO1rTNpeCgwz
         alZSxjGc0KxjwDYBB4+JFZk7S0sCKg/rXq0pAB9ZuwW8ltXfgvZJ5sIekr3Y9Ht4Uk9D
         HMkjhzEQMuLHxJNtacnva9kcKzxuv1wCJMh/u8FmNqAS/j9E3v+p0NWGmpBOo/uvy1br
         KWgconmfZcSt7CyxAg6WcFzfE4Ri01mgR3TeM5WeHp3cAtpUhVisBPYjjNqvhzjtyuPs
         roMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309031; x=1793913831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k99yZnPO//ukQtkYAl64CwdQpomDxI0ACN/FhmeAnkU=;
        b=YoqMr/wl8z4LVU7ZBP7us7zKvxM1v054XtCPXPImdJ2GgXC1UBy8TvhuH6yI4HHqEG
         Qgep47Y77BwSshHDFYV5PuO+JlbPApQaFnqfq+Uc0Zs8Xh8ZQUCATYEDos8ubUBig5yC
         dJqVYmbOGN/t2IE00aUGiQxtU+sF9k8tx3wBzIRiI79qHN868Y8jBGmwkMb7Csi3BnQp
         yR/HoeGo7EXecoeG0TR9W9vB4oPhuacfjfzy0LKPyUKVs7l88DJAM2eA+LLKzx6UoOvO
         Wd1VNS25bxBdFKNRwHJk0tmnTkKf1d8bh4yokbvbGGfQ7zCMo5oRs84AqP3zh4VItM8h
         Ztaw==
X-Forwarded-Encrypted: i=1; AKwUvByh7yZKzEx1lNqZ1IHKmk4XDQW3YnkyG+hvczYkVE/2tx1Qgkbbo8AvdjPlGqzOS3LdQxZHVxMXSDMXYFeI@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5deDmIcBsrOgPNlNF8J1Of8zJtvX3hpL94IDjkrkIC9vCNsuA
	WzLXxE7RB8Pu+RJmwlnE8+0yhved/rJBwp4wAmkBaXDTk2LQdywKsEKgfHU1CFgZTHGkBKLeXVW
	YlN1AudAW6hNr/FzTwbzJ2rgtV00Mj/q7VLRHd3mp+MpMJ1GMqgnVR7hS63+ReAUV3WrIJ7Wx74
	XC
X-Gm-Gg: AYBFou0VQRj/jFyTcs/txqDFy/MTZLbHKkR3kwbkUHDP38/lkSL/jrQxpUXX8tNKeWa
	4+7dJwmjXLPnCNR2OXkvlmxIW/lPRtLN2BQUeJin9Kl+fhyqUuXMhHEz9Krhg+x6SFdSAwRXZvK
	M3c1LfR57jMogPhydpJsziEvKy8rb+aniOSJuS5Eg8K93ru6+kWJr8IW7JDnYT6IEizR5PjfaHn
	TR4HpUVPXne5teaOyPYuB9nMu2m0+hukxY6YAH+y86K8l2zqa0Rl46KOrrTk1nY4UBTMspII42M
	ZXUCoBB3oOSoUBCp5VstNTcFYRe9B3p79OehtrWuWTIMNrxAPBT7zL6AN2hHYBTGNXsrLbdfFp4
	q0PauOrXrDXzNN3B+DXiUmmq4bSEciEV0l9dPNgol+lPnmPZwU7kTscTXPGmhtRueDe8/zphKjX
	+KkNixfIlkM8GYqrFYts/lHw==
X-Received: by 2002:a05:6a00:3a1c:b0:8a0:3ed7:93a3 with SMTP id d2e1a72fcca58-8a9be7790c6mr302322b3a.29.1793309031379;
        Thu, 29 Oct 2026 14:23:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a1c:b0:8a0:3ed7:93a3 with SMTP id d2e1a72fcca58-8a9be7790c6mr302306b3a.29.1793309030908;
        Thu, 29 Oct 2026 14:23:50 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98893d1f4sm294090b3a.12.2026.10.29.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:23:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] iommu/msm: Use identity domain for GPU and display
Date: Thu, 29 Oct 2026 14:23:43 -0700
Message-ID: <20261029212344.346069-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ET8euciPFYk0OWa4ADZKqC6KRIIyvwFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX/KrMuWN6zleV
 sKNmVSCg95BWPy44g803+gc5IRP4Tq+CIjB0MWmpGhmCxSgooWMsjBFYd2We+szZoWtx8HXVGoF
 iuxwSCC9njYNJant9RAdDQVVwK/EQMP5Q+lfkcSN4xt7Y0c4cWjEC0pPry0P9j1ZgjJZzl9xXTR
 IMQgTsPcGWUtplWtjkn/pE0/DHxVPMOICgElArLVq06nqLj0w8OXyPxC1MTdG48i0JOz4zy9QeG
 UXHy2vMtoLTc3B/3jnOM4Bge/D3N7KEmHmluaryygazRcS0+H1vtT0/9+JmedQCjYW8muoYs/yo
 8XPi0EcweIuck2n5SqGTL42vube625nTuAEZDJMg7tsZ0eBWpSseaih3HOCfvvnjiif49JHRflL
 Q6WR8Y6X32BnOrgkeXKiHl8sYBvjUwd6kOBFILmJsyfeHvEK0KaQHL3kdGw5JqyB4trcqP/oORq
 BXDE87MFoPTsVta4ZeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX+jwbYYPreeM/
 Po/bUr3gjN0/y5oRrRnSNvCSAOOBShrwO71YJyRXUEJJSwazak4nZiQfaU0IK5bXYRYi73zaTJ4
 XLtzIUKcud4OARf+AEDLgRTMvh2JNGI=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae3b968 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=554yuftmPdPD4gaTNL8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ET8euciPFYk0OWa4ADZKqC6KRIIyvwFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290084

Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
select direct mapping") for arm-smmu-qcom, match GPU and display compat
strings to pick identity domain time.

The drm/msm driver attaches it's own domain, which it manages directly,
so we don't want an iommu managed domain interfering.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/iommu/msm_iommu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 4ef1e8c8244b..1c5011432628 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/io-pgtable.h>
 #include <linux/interrupt.h>
+#include <linux/of_device.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
@@ -691,12 +692,27 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 	return 0;
 }
 
+static const struct of_device_id msm_iommu_client_of_match[] = {
+	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,mdp4" },
+	{ }
+};
+
+static int msm_iommu_def_domain_type(struct device *dev)
+{
+	const struct of_device_id *match =
+		of_match_device(msm_iommu_client_of_match, dev);
+
+	return match ? IOMMU_DOMAIN_IDENTITY : 0;
+}
+
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
 	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.of_xlate = qcom_iommu_of_xlate,
+	.def_domain_type = msm_iommu_def_domain_type,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= msm_iommu_attach_dev,
 		.map_pages	= msm_iommu_map,
-- 
2.56.0

