Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815181;
	b=mdQxhoar3Vzwm/WS1qGgRc5zZwAIPUBusLmulPo/UaDLQCIeMtSpLyXPgrQ9dvyL19j6
	 rRT1PJth1Xmx/QrnTyuiQHauoYcrosgMuveoXRX6gUa6OX9W/EBRUC3svsm0gBu/HGoU0
	 lvG8hmTS9Dpu4DDxRblVW195VDAnqfpRwpYPCwAI5XbDSk50tUTn0Vct0ZMYKhB7jzFlX
	 yv8FLYoAf4Lcnq/FgCn+hHswvL3Ik3XVrFRILDwmoVxb8OLpVx1ZhtUQOfJ5M9XWtSlVC
	 3fUhHLJVSKxxDA0MDPTbL6q6h4w4rl/Et2kFh9hFvjS4AtD4PgYNooCfFfwgZFAg8bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815181;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gzjrY8YLclt+Cdw4cM+IfVHKe+qb0Pzmu/tMZyi31YA=;
	b=qQDDFpCGfVb6A0zfwRQY5LrjnWqthmDeMSt//nyVSNCeaCj/LcjsX1PtgKbivtGAZe8E
	 S8XqHw0XbXny0G4vvkMY8vcl3BtD0hvQms/CcMgojUagreRADndaZfPcVg1udhEJ2Pg6n
	 aOnMt3QwuqYvMwxQwSSBIIX04VhfAxDbM/CdQu3gbWUew36zK5RjaZIvcdZ2WigJChYBg
	 iEnpsaBg3aN3JsFKscKPAgw7ZW2oHvDY/EP8LZqtF0LdK5HBg7Aqm8RS6yo8VGpE15/nj
	 QIjdn3ZZNHKz3hbh5nDbA2isGAf2TNylZOVBjma8QUv7fewMR0LVGXNTxnVeYxWIwNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bH/Dfs8d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="elt/aqAY";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C06606B084
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 17:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C06606B084
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bH/Dfs8d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elt/aqAY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjF5Q1692637
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 17:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gzjrY8YLclt
	+Cdw4cM+IfVHKe+qb0Pzmu/tMZyi31YA=; b=bH/Dfs8dg9auMVKpYtfJGa7/9Qk
	TbzTsxOfygrtvPZoeOj81PD/MAPgSe5o1bMfOCb0it3ifjfKDjdYPlDckirzd1Qy
	3lUcszvK3Z4Hyntuz69QXvjHGa9uLgBvon4frPuYk5UchP1f5L5YFC1gnxSPfwVs
	cYF5HjMam7UYJynwbYk0/ERqzB4PSdo28RpeVmslrAh4S+7DRo7l6WiXasUu7ucR
	Joks2Y9bJF8OHYAGe3sOv0WqrbgoRf+RzKGkRXkExWkyNV2hKtkKs1PJJeH3mC03
	yPk/emucw5jO67CXryCSgx7HBMqVBpwH2QA8POMuB7oGujdsnEoQgfGdMpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0x1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 17:59:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdac99e77d0so510658a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815178; x=1794419978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzjrY8YLclt+Cdw4cM+IfVHKe+qb0Pzmu/tMZyi31YA=;
        b=elt/aqAY5HUGDZPKjZHkRTpxb9lXNNhj732TAfd6Ekmak2RTuc4V6H/WVvgWGrdcA5
         R5aZR247Qz9q9YshVrHqAyCy8IQ1qfavLeuZjUItY+MpDOoa7S3AivIDgyZUKxUtZ43w
         AMNpieWaiALuH4Q/9+SrmhL3SE/ZGw5S/AqjDHttxFdcXx4Kc0rY0MJ4nSyWP9lJYWql
         uNk6MFnx/1lLbJ/N+vpotjHNuMDai5glReFMoH1S5BT5RZoPS5l+PgsyW1jJZi02eNEc
         4hmIvEwO5jKIujxz4JNe144dTewsFxcmJ8+yKp7rkjINvBzboYm049Yr7JfeWt5DdbAY
         AcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815178; x=1794419978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzjrY8YLclt+Cdw4cM+IfVHKe+qb0Pzmu/tMZyi31YA=;
        b=qM40k8eU/NMsuEpLp5Ph4WbycP4ixUXvRkFWh+0L9yPeXl6WhUJDwQ3h4fUVQGy3H8
         sYlJBFYZjgIGQyUkI53uAYq3vZmRx0M12oXTy32fROktNl0cXnnT20CTUho2lst8QFH/
         NL54RshrdX9W8z3XpNnsf5vqnJuJ2iIJyiLIhwipf9bx5/VI++TnnnxUlijMXfWNYjo9
         pIbgcytN2DSFROnL6xkpgn1wHEOriJizV91UBUvgEP6ZCg2gbF0K2Lr9gELujZYrMXKl
         C9HCeKNddosHPzSvtngj9wUJYHWWj8cXt2kZnapDPZzHEYr5kJW8ULFrZZGmCZXKYP34
         iRWw==
X-Gm-Message-State: APuU4Z/y7FpT0NaWtDov74B6UQY8ofwScu9ibaapTjaYaAceY4Z3/5ml
	AXTeJCLwSxpuBGYplJZhsUN7i7YdztM+mp+zvqIUu8PKGJ/BFAvLN+6uQ4DVJb3WqgImklLBak3
	T02vMieS2TDenbyj2nr8ICXmmMcODQVF/IHtsGAhPFZ+xpa9BwGHrXRpJWYYEJznpaykh
X-Gm-Gg: AYBFou3lP14+ejCYA9J04Ny1o2iJ/apkF8+Jo6P+ACWaOrpyRcTwXuQT2QvGUySdLjH
	yXYd/nadtyYArFz6sAIWuXcCWMXbv87nqNTSurqGZ0VdHA2Jmx0yJKBY9q0FL+QKvyDrGi2qIp4
	8WWrFlHp+80mANkA6v2MDmGxCMsUt0E7WSUlQKF+Zxy54i30Vze0dwJrWPDXwY2FfTnbzVZD7qg
	3pFLzboCwNTOHQcho8BFHhfxP/opBsMQ6Kzurwk8UwemwJgoyCDVzU/O2aQKH9D8vjOtsKQQCUo
	C4BLkkRzCnLTmT6b+hXrvDu80kcqHqcgF8gw8bCD2AYKHQxdLAjuovj67LCsTjZcsULywimtZWP
	mQPsClfKr445L7pT8RjHXF22Tihf3cRKIVr/YuA4M/FR65ZyJ0GzwvSB1yZs3NZfQ/dkrcw1/V2
	3uVRisvTsb98r8/TxFOJwsrmDpEx1MBdSDlfjnHiuptbdtLJjNbbrGvfBvGDc=
X-Received: by 2002:a17:90a:c241:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b096b4d4e3mr1971703a91.8.1793815178205;
        Wed, 04 Nov 2026 09:59:38 -0800 (PST)
X-Received: by 2002:a17:90a:c241:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b096b4d4e3mr1971678a91.8.1793815177708;
        Wed, 04 Nov 2026 09:59:37 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm50146a91.6.2026.11.04.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:37 -0800 (PST)
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
Subject: [PATCH v5 2/6] drm/msm: Resume perfcntrs after hw_init
Date: Wed,  4 Nov 2026 09:59:22 -0800
Message-ID: <20261104175931.28475-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXyXCcgYbDaDuF
 3UvZBjycfAkTDapRx0NuzO6Bxvbknaphk/HiXAbTxEkUjWaXuS7TL7qLS5aAB36ctZNXrvEXxS0
 XUGxEO04WNDV22YaTG0zjVeG4IMY9eGeY+CUMPrnJy8l41p1oa3nLx51j/mjPY911kZlyAQsb12
 Pd9k5GivbxwHuFd76Ujh+qm2p3e32FmxkPbsHYQq6IlJwdJNriYck2WU2djDwKYJLxyDBXKs1fd
 lCi+0/GUbcOZgtE4OQ6rK3VTJlQumXphMM9G1gT/gRXZ8KiIg5RW7PbMWSsSeTSlO1DccBJPkuk
 uLKNwcnMc+DafIbttTyJaqFXkU8ngdtbLvH0KmyQ/N2OMR6JUHXrs+HZwcxjBeWrUcO598Sd6aD
 plLXn6SXwmYw0KCQiwJ10sEyC/yF9RGjudeE6+szylDtx/H5ETTvKBp9Z0kqNmiDveW1Jb+65dA
 JvTqqZnYJyEbjNeKdLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX2BZzec21M+ER
 KCKf+9KLtnnKGaFTcKzPVMV0GChG0fXudQKGkWVWJBlggWm3jmudAYYIvbIhk41suzUXlR8tLUA
 0gbGaGPIXzUjrY9RK3MRQXqCj4J4h20=
X-Proofpoint-GUID: XCNUwbxuFDo1E4RfU1hggtXy5o6lN4uj
X-Proofpoint-ORIG-GUID: XCNUwbxuFDo1E4RfU1hggtXy5o6lN4uj
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb728a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QD1EvTAd08FZB_lsx5gA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040071

It isn't really useful to start sampling counters before hw_init().  And
the next commit will require IFPC OOB request to come after hw_init().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 1 -
 drivers/gpu/drm/msm/msm_gpu.c              | 4 +++-
 drivers/gpu/drm/msm/msm_perfcntr.c         | 9 ++++++++-
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7108d4aa59b5..749269843e42 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -309,10 +309,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
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
index 6db6cb7eb287..d074f4df78f6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -720,7 +720,6 @@ void adreno_recover(struct msm_gpu *gpu)
 	msm_perfcntr_suspend(gpu);
 	gpu->funcs->pm_suspend(gpu);
 	gpu->funcs->pm_resume(gpu);
-	msm_perfcntr_resume(gpu);
 
 	ret = msm_gpu_hw_init(gpu);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fb07803f5aba..ca21b3bf20df 100644
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
index ce65b1160955..36ce9a102c5e 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -199,10 +199,17 @@ sel_worker(struct work_struct *w)
 		return;
 
 	scoped_guard (mutex, &gpu->lock) {
+		/*
+		 * If gpu still needs hw_init, bail.  We'll be rescheduled
+		 * after hw_init, and there is no point to collect counters
+		 * beforehand
+		 */
+		if (gpu->needs_hw_init)
+			return;
+
 		guard(mutex)(&gpu->perfcntr_lock);
 
 		if (stream == gpu->perfcntrs->stream) {
-			msm_gpu_hw_init(gpu);
 			gpu->funcs->perfcntr_configure(gpu, ring, stream);
 		}
 	}
-- 
2.56.0

