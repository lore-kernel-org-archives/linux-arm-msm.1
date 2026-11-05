Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896929;
	b=wdgJ0ZhJCsBt9ZW7ldPMk6F3mQN3le2Fqa2VkkemHlfjKn4Tsj/H0qr0pSAZgvVggenh
	 veMi3PYSRZqQTp6txY2gVql1IZ4BhJIgmR4dc6VQ2Pfp1d+E9LpMVD5tH0jH6GNYCyHMr
	 gAUeCrXOo4humb24JTsWMpYa3b5z8yg63ArNxt6m3yL8ZiDSZN16vAGDa2qc2VFNJxQbz
	 dXysGnyWCSxyU595RrjoIkeClIiKVshmdL43ilv/qg6Lgs1vkjaj1P/aywfHlPAmlQZxt
	 +fPDbYkJk+jNnIyoie24CaTxv+HXerjGGP+VSg9W/FWOqdFGH/zlDhsTJX3xko9e3Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ze3u3lgW/Uhu08HGG7LLB4H8V5Md7DfsDjlp1gfGKWk=;
	b=2V4brUkdHO/wx3JFfxC7QlxfHHmGfD41cfm/b4pKvQ16suuWyCMlqT/g79Td7beqCNzh
	 5UPETG6qae4/3UIRTR4LXdS01SFOj3bHbv86XC4Go04Kl/pDqnfT8fG4aegFSQQS4QD0B
	 zKHCbRRhS9M1Tehihuy3UnVQCBjcDfIRhOG94WD25eYhLGfsGl3u7KuQmJKBRFNm3U5Ax
	 L/vXodoP/b5lhu9tKa4tQBpuYyQd+r5CXp+fu0f1U9K/bWqqkeivtbYR8naOAA3dq4McZ
	 kuoy/iil9wlfnler/EfcDqsNYtcA8O0P9aq9JrzHzPPAJzjDAwcn4YfzwvfZC4TrmjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckzXCekG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVzXKdYU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E33606D824
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E33606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckzXCekG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVzXKdYU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQXok1657353
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ze3u3lgW/Uh
	u08HGG7LLB4H8V5Md7DfsDjlp1gfGKWk=; b=ckzXCekGh2W61R2QFB1LVxLQMJH
	yW2kRQ5LF44B4c5a3TLhDUJWEixm5N0xixypY7dwtmoVTat9NotuKel9bJ5ha8eN
	CuEbTjic1eBAPQUr66pW5qcD221M1yJZSINJrt0jYiKAgncaJxOKofKA9/R6wMbl
	VmKSsN5/Wj2QYIB3gG2xWcs4FWyzjAwP2AM5BC8/OcLsgNVnslicjyr+mEzAwSEy
	o9C7CYmeeYQ4b8fry18ReVX7NQhWxVLll5fNNwwPgys7VQnHP+uf8m7f8b2hUQTF
	zFjGk885vtGtPzF4dCte6wymLbLg9ES+OQDcRF5eSv7XCMmVMS24Yk8FhRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f9t7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:42:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso1030140a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896927; x=1794501727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ze3u3lgW/Uhu08HGG7LLB4H8V5Md7DfsDjlp1gfGKWk=;
        b=LVzXKdYUlxd/3FUQVBuEfdde2QRs8Ht39nsAwm8uO4lbRutl2WB5lj1tsSPEctW1pQ
         EvG7sS8d6iBiTO13x5jDFDQyQQrkJYG9z5bcMO/rLTrTJjgggq7q11P1RsF/pY2c+abT
         AYDLFR1bo2lBW/f5Gqyz34+VkArY9DRrwRtgdu+T7M583vrtQM8WtmeLsJuAlqGKmdMH
         GgoeUgEuWVwCd09Qap7m7gm8D17nItqUAaQejJB51j8/Jlpi88TnGkgP0Sgbc9XuCYnk
         MZikUUPTIZ3K5h3fQMlpSfFigZu0D68AHNjZP0JleUWCAFJxKI1qmF4tSbt7JPtHyf9B
         pD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896927; x=1794501727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ze3u3lgW/Uhu08HGG7LLB4H8V5Md7DfsDjlp1gfGKWk=;
        b=KayXHQiQtgrffCwhP50TdQwo/yHpnqv/2XxtFzKj0mEhjTPppMffp7suAo0t11Zfhw
         ++5zeWLjsTBRdjD1MKiQDXmBBFNYdw3XtKby3ZnJkuGxAlensa6XpP0tdbEpXmqe3we5
         /a+5OEZVvfGwP4cTXIi/y8bcxuyOnWIIosYFGNktSZiU0TugWZTb0WWUYHD3c+S317VX
         chbzosm4sAkGPjsDj+vig4uqjonPZQSTAM/OAhnxA1+Dx7qQDgPRK2efRsPDaWYCEVqI
         F4uKh1XLWT2YandhYkh34FzM+G/StlrdIwA4PCzIRZHzb4HEGh4Cz14nLcTThTaEBDS7
         oA9w==
X-Gm-Message-State: APuU4Z/NPImk4jnaWev654wDCu/gY6geKG7pGjxH/tzJOxjOFBjyoKBo
	UYg03gURqQ016cE+21BVWxrxg6iC6ZO64GZvsD6fvmahizLj3KdfjhPjO3vJPuLExyteIOVd72B
	7O8jT3SuiVGsJPOzFSNQFnMWsC5KNLnoyBsQ5Bt8IF3IOtz5XLyEVbOXQnRGUa9W3ZvbB
X-Gm-Gg: AYBFou2cfz4I3YFTH+WbqGKV4w/FodHtYrfWaeGu/SMcoSUIsaHqM512WEuh6BQOnlO
	VRc866H3MsGUd6R269Ck2ALASUZnfnB6lV8lvwwY7e+QmlTJqcGWx1c1BSD/OR0Phtvg9K5ysd7
	ccDPlJTCYh0KFF8WcSQRheuSA8Zy42agznuJf+npvICxPVTnPlCh9xWNzgluyOyoTWNlgK3AkEG
	mChblm5BNd8nZZqAkPxqKHWx3a/yhMfv3kc0SdC4ib4jBMjTGRBriaj/7fk/eR2ijfz67/XkhLp
	cVlpt9yXBxflPxLrNbJRa/KxXaIqnAiXbFwS0XLfsdwdFuZvzgPqBm/QKmbXP0oywrQnfxjIsWO
	GyMus6RwiCqSBAyTZmy2581Aa1iPuMLTa63VAw+n2IJcPnhNzSELBHmaU55Dsf0OcECj/hf1Hq6
	7hNrHI7+jUTg1tkYxT9BewaKtqWhoKymC5fLgtM0M8kCx3YTGkdCgBFYhFQv8h
X-Received: by 2002:a17:90b:180d:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ae8983f058mr16924436a91.46.1793896926684;
        Thu, 05 Nov 2026 08:42:06 -0800 (PST)
X-Received: by 2002:a17:90b:180d:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ae8983f058mr16924400a91.46.1793896926095;
        Thu, 05 Nov 2026 08:42:06 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b90def97sm4175495a91.7.2026.11.05.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:05 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 2/6] drm/msm: Resume perfcntrs after hw_init
Date: Thu,  5 Nov 2026 08:41:49 -0800
Message-ID: <20261105164158.23263-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfXyFqBuD53hEcG
 22D2TESHdhoet4KOWeuM9HG3hGbGNaQ/ag4R6J1B3fk9t6wWzaf0QoyJK31TdfzK8jNv6zAPshr
 3OKr7rx1GK8F4+OxkYZGOAOuUiU8wWA69kYNSFZd5mu9FPGvuZsD0AteBwuwYmC3fHES94nexJ6
 3SeSJf8CloT3ThPIUlktrizmKvQYOwobch/l3UULh+YMeCZj+YLKPefg4MLeC1mHm1TwvP2rUIw
 vhs5rqZHf0VURlYMdFWjTsb2YrKS2AUasjoumhKCF6jFOksw9W1x7Ey6ZKD8ifzLBRHy6d1g1zH
 Kra8bIjd96Txdsl3K79YulGUqfIggUwMdpnuIgc9p3Q2cU+QbyrB3rlLpYTemxmy0GFYWmqEYxP
 7PbcXxuSl/JJ8VYrhbqklw9s0GLhKDlV0wM4mgF1pJkjW15Rrtp9cABqLqsHBfo2VfnRK2ZSHxC
 DKqvp9SKhuCv/aW/KrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX4HfJUDDNirv7
 fbNarkvkw/+5OSbKoEEKmP1CESxTaN8YAsmSrBAA1TOmfxJ1ACCWyEdaPkSFg6ff07vB7/J1Ari
 EOvv5aGTEZgrfCJCVbISMwImj+IGJCs=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aecb1df cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QD1EvTAd08FZB_lsx5gA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: eL6IXU6Ph7SAK7aIA7w1oBv8FyDu1UCD
X-Proofpoint-GUID: eL6IXU6Ph7SAK7aIA7w1oBv8FyDu1UCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050066

It isn't really useful to start sampling counters before hw_init().  And
the next commit will require IFPC OOB request to come after hw_init().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  1 -
 drivers/gpu/drm/msm/msm_gpu.c              |  4 +++-
 drivers/gpu/drm/msm/msm_perfcntr.c         | 10 +++++++++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7066be3b8e15..a3b2440a1a27 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -315,10 +315,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
 static int adreno_runtime_resume(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
-	int ret = gpu->funcs->pm_resume(gpu);
-	if (!ret)
-		ret = msm_perfcntr_resume(gpu);
-	return ret;
+	return gpu->funcs->pm_resume(gpu);
 }
 
 static int adreno_runtime_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..f9a546a2cfb0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -722,7 +722,6 @@ void adreno_recover(struct msm_gpu *gpu)
 	msm_perfcntr_suspend(gpu);
 	gpu->funcs->pm_suspend(gpu);
 	gpu->funcs->pm_resume(gpu);
-	msm_perfcntr_resume(gpu);
 
 	ret = msm_gpu_hw_init(gpu);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ab04a442ca9d..44e5da9d6ab9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -168,8 +168,10 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 
 	disable_irq(gpu->irq);
 	ret = gpu->funcs->hw_init(gpu);
-	if (!ret)
+	if (!ret) {
+		msm_perfcntr_resume(gpu);
 		gpu->needs_hw_init = false;
+	}
 	enable_irq(gpu->irq);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 7fa2e858bd08..189be6cc23f1 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -199,14 +199,22 @@ sel_worker(struct work_struct *w)
 		return;
 
 	scoped_guard (mutex, &gpu->lock) {
+		/*
+		 * If gpu still needs hw_init, bail.  We'll be rescheduled
+		 * after hw_init, and there is no point to collect counters
+		 * beforehand
+		 */
+		if (gpu->needs_hw_init)
+			goto out;
+
 		guard(mutex)(&gpu->perfcntr_lock);
 
 		if (stream == gpu->perfcntrs->stream) {
-			msm_gpu_hw_init(gpu);
 			gpu->funcs->perfcntr_configure(gpu, ring, stream);
 		}
 	}
 
+out:
 	pm_runtime_put_autosuspend(&gpu->pdev->dev);
 }
 
-- 
2.56.0

