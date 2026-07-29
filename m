Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9E4052DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340622; cv=none; b=qC9My5x6MnFcyhSZbkfl7GpUFNeupwQwsYF7+MJYdj6gUYSKVwQiHJj9JCwmogbAq4NwnsiZwZTjJ5qaXUG+wYb8SIpRJ2U3k164FijXvL5pKsNGZmDWIBYWSWeOQxAn5vI15m14GbK5Aw939BBNLFzn5338+lwWD0vWlJx31YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340622; c=relaxed/simple;
	bh=wZufhlf2OrTXiXq8s7psP10WRX750jNvVBTi3KYm6Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yhtoe6GMZIkkw1Bj/q+ndtajm0mRc5UEXYdX7Rbkb7wrKY47AFBBZocsPVUZFb0LzA+bVc0QDCh8ikU2Lt4Otu7Ulpd6joYDEhiVBjDp9NfRlaNKjN0wjS6r/1wwR4Se+gsyrjG9LDT4nYS1Ot16LRbbXqQRuEBOYaDxUqTXgrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzNILbgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2ZMG9fP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzNILbgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2ZMG9fP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF35G73343162
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ss8T08lcQRu
	h4LT8qU7cdiXED4Y+cvXcR0q697Hi17o=; b=DzNILbgfKW78+tLPUtiCbtGflhN
	Tz/XvVk97izyIUHbklt0XAt9d+WcriUW4s5GVya3/NQ4KhV0EqpoVoiThe1i3Jmx
	E7psVcT9EJpZ+svd/U6ROffu3yiNWFxzU/JFlcLhVPVeBniU4Wjbkeygp0mzFW5z
	wv9CWV7UN8CxfQHvEAYRZDrpaZZ5LzzUGtomS9HNQzP8PBqZVlXO0bdbRcofMjCc
	JLmiCZbjODMCLxClSGfqLp1HcNWGyb3QCeZiIJea5+esUz4c47bRDu/wYnu/3FyH
	Kf5oylTLw8ipIKYixhIRlCRlRw7sbpDju155k4y4bOyag/DXopg6Zk0+IAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3ms6ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:56:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so21569515ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340618; x=1785945418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss8T08lcQRuh4LT8qU7cdiXED4Y+cvXcR0q697Hi17o=;
        b=B2ZMG9fPp9EzjGlQZIZ73M25XEm3Cwc01ZzQouiMcOjvHl8sX9qy7vgF9hIODJxPud
         vwiDS8GdYTK4y3OxrEvBnsCXUbU4sWhMIW0Icqf6fyujrSFeuqvwtRbHtfTdrgYGprl8
         oOfBNqv1aWHAkKK/cJAGNbv+NL4t8UGI8EsERMBy0ge2ESvQjBiQy6OBxTBKae3wkV35
         aqooEXQUdXKCBzIPmUF04+0ZSPNgmC04nTy1OA9f+EBiIBiLg2Fl5OEX+2axy414R7N6
         PD0ScZ3ZV013BUv5qIR2Th8qehLIApH6dRG/DVHfm5DUa8J2AfVgX+g+b2hDW1UFDokA
         SKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340618; x=1785945418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ss8T08lcQRuh4LT8qU7cdiXED4Y+cvXcR0q697Hi17o=;
        b=FIvcsIlyz4aFn2jGFFnc+bIjHzo6EAOMAWIHA5/2Ud8k9NaUsXjcS1uypvrOw1Sx5p
         /Wd8P+FRWBEvmAwSd7yTKJs+SOSivulEUE8k8k44b/ICr1KkPFaYP6S5iILQONF3O9Yd
         04cWA3XWBw35afwzBq/7neGnCvZGe4FUekLpyHQJ8bwvsA2oVjvdNJH4H64fOIxqqi/T
         oV9ttYRHF61VkcgZ1Y7NmXBATZ1BhbFv5thmOPtxCfQTKP72KGGfpuDs17mM9Kz0cqLA
         DaC5EydP4MHWmG5SJzA+hHGAud3pGEtljshhTovbPMusIsshi2WIglkKqtf4HuJXnt16
         tsqQ==
X-Gm-Message-State: AOJu0YxXeiIRNhg24OBSCDZpM4AC/pp9tKrazijOKe2fvYKvtW4DOZKd
	WbQwchZ/9YiGmXll2XC5gG8UNECEeA7gCMVuzG9KhbDHn7Uiil1C2r/mB9LcXrDWa1Fn3bYRSf4
	r3ZxREtYhUGtVnffzfPGUdFi8iMYEFQubt+NCO2a3ZJrLpSnzJOIfBY7Mrm0zqwbF5p3H
X-Gm-Gg: AR+sD13tmvhk6mSHqHl0CoB7Pd6Gw3I6163+ZlT36UCvZ9Fa7mm+bDvKa6Gw0mLqsMl
	Q8h9MYOn1KyVqCWe5Aq7MQdLvZ6aKkQe//W+YyamGbJ4hz600zMXyRC8DMRRUwCIdKUEa5YtnXE
	SWgfEX9wUTE1TCVJF2gRTktOkY8waws+EINnugSOgSIBERdYtrfNyjXi7jDM9B76FtnV0XU6dDt
	KM039amkJrjq40+1vXlUzibPeQ74Tjd+oSP/8NByuHOuHSb3drjCePuk+PkvVajqdqzeit9TVua
	p7p0kAFH4J9o1Pk8yBpvMPOPybAUviQR3PYkHw3I4jgE/rHuAiMWG3hdYKDfRHOALljCWfJERds
	eE5h4YU0SHTNyxnzVvIJ5v72ugj94hIgwRpvhgmOVyXWcv6s=
X-Received: by 2002:a17:903:1a84:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2d015ee21e8mr88173375ad.22.1785340618394;
        Wed, 29 Jul 2026 08:56:58 -0700 (PDT)
X-Received: by 2002:a17:903:1a84:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2d015ee21e8mr88173115ad.22.1785340617955;
        Wed, 29 Jul 2026 08:56:57 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf99edsm13505125ad.67.2026.07.29.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:56:57 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 04/17] drm/msm: Synchronize set_sysprof on ctxlock
Date: Wed, 29 Jul 2026 08:55:41 -0700
Message-ID: <20260729155609.20190-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
References: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX3LyxEUANL6g3
 J+CEavOXAqD3OuVIrW1IqJRbhjYr9CjzorNnSjH5HISxPE0JLqGDAftzw+XjxGuL5MaQ74wxrYx
 i5VDwSYqA8ikoWQ0JqjIj8xdAYcJ14b5Gczi4orF31bCHOOEz9cxQVSB0IoH/ZVfH/SrLkV1uLA
 oMW9Sx6IZSztNcF5jQgdCQ8l/W/2XYwnXrGQid+lhXGVmVbZ2mfzXk14l7mesylUEK8mxvOBJgF
 qSkTsGbjziTROMnk1kdw3py9Q4n1UtCM0krdPHwCMzeXVl8uxCFI0IEMsFCiqWkGsPJCeUvWDPP
 RcmKC+myAbGcb3NnXuNGPzc4cNEDZYJX0a68NxTf4a/L6R8sC+lhohwouzyyTJrLoJTk8CfOqaL
 EVKDebQ+gDIGhCWWK/QfWKrMau27EeHTVIagvZP5VDoshv/1DQnYoinXthYZXAQ7jUHlnYvgaFr
 7512QLKnFaXyA1gC4kA==
X-Authority-Analysis: v=2.4 cv=F49nsKhN c=1 sm=1 tr=0 ts=6a6a22ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=A-0ye_aN_Dr-yZQka4YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: C42QDAtYUzcyRo2m4HRqLMt9Kx9ev0iP
X-Proofpoint-ORIG-GUID: C42QDAtYUzcyRo2m4HRqLMt9Kx9ev0iP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXwH+PcykM8knj
 OHr4R4Bf/WXzJTIYaYreHZ2tt+uYiL65gHkD3SamJmKEpRu9XRg/Ny5ofo8FEph5gwG8YsIBe0X
 R4ey8FPVrcX3QMLPpSiX2iWZQrh3SEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

A user that was perfmon_capable() could try to race setting SYSPROF
param on multiple threads to trigger a reference leak.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8b5980d5a6a7..233c4f35ab12 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -9,6 +9,8 @@
 
 int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
+	guard(rwsem_write)(&ctx->ctxlock);
+
 	/*
 	 * Since pm_runtime and sysprof_active are both refcounts, we
 	 * call apply the new value first, and then unwind the previous
-- 
2.55.0

