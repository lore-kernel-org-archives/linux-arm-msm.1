Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837852;
	b=i3hULWf17GCCRPmowWCHAsx9ZUMplxStYoEPKo1qOOZ54C2JUUhnHsBxmHb3ugo7e1Sw
	 4aTX55T7LF2TSnGQXxqOmbsCfl+vfqHKGN8GevhgLoBU49rsOPiFJ1ehp/me0oOLO+w9V
	 0aydcgTzex0heIhdQayAyezqnhV7sldlopE4yeFZ2bf+jIg0bdhRdNjtAXf6TXRS/NrBO
	 PI/YX4Bv01e/WwygI1w0wlyYfg2GQe+hF/sT2ff+KEw2waL0eTsrqSKB81hny0FrAFUU1
	 p5UPZ2OSfxLV3OJhV0/VBMvInL7QYYIbkRQ/m3SMfEu75rhq+Av68OUK9GKlr2sFxGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A2cReWsSiTJKbfzFTEgcvWxEdzaCiferPXrh60qGdmw=;
	b=ij3DbIBrMJa3oJfG0p7hrS9jmH9u6deq3ihW05LYwF64tNgkj+YRDD0UGRmP+ronFmxu
	 TMzBbGDUNTiWqHFnMinIaeSCOiFOVO+yubZyWFd7NsqmAAQGM0v2gD9FoL6FPevBU2OJM
	 bxaW9utZxN7ILLS3a2PZ/+RBfBkGzgfZn5WclmH+jF9u2ss6FGQ6gpvZbORJttG/KyMIS
	 Qhf6iLFR8iFh0GRyrHTSg2Z6+Aw1b/fjq+B0HXSw+Uiv4qRXgY8ibh+xBBLLqx5jnnVx4
	 ojuS51HbMFDZFdcdmm95NYurVK+zGzg22TE5Ggs1JV9rxVO8Ml0sLttDOwTsE4d7m6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hbFw69Za;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKIexss9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE5606A32F
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDE5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hbFw69Za;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKIexss9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oEpl2209543
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2cReWsSiTJKbfzFTEgcvWxEdzaCiferPXrh60qGdmw=; b=hbFw69Za6+9aZVUA
	HqU6MRuyyTjYdXcuuPU8rrD8BRNE77vyWRfOoZcFb4RCcAPUd062hYBXO/QqDobO
	eYoR1KxBuc7pv32sv7QWw2jkpBsjnxF4BLvOkY0slRguf7UdN2kIWihywZ9AYOD0
	kHT/EGg8ATp50XwlJU+YX4FAtp6RLA/eioveQaC799vQn0EWFRd+Mrgxn8wqtdwH
	nBrMnHZde3C/QYDkfV5O11mf2M4oVY6Fn8KbeTbTVY7IaVM2j/tjKcfX6TTEAppL
	LOiCWUUr+23O2o441ldrvC/Ek68wNMdtAdX95yS0yPipsPM2L0Rr457a5DE/5L68
	1mR4jA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkms8va3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 10:30:51 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-186c1aae818so5408308c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837851; x=1793442651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2cReWsSiTJKbfzFTEgcvWxEdzaCiferPXrh60qGdmw=;
        b=SKIexss9vUcxOC/xT12s2bHjtSm1Admf0MOP8XoUqDVSGsOJoFvvI8pUkx2XxJD12R
         rmDEnrqKt9M/8UNUI6BgRoRGTDeegX0mmO9jQyEeYxICwG81XLEcbhC4x7stXdO6QQWQ
         N1vB9iNF8H8xJu3qQmn4NeIvPU+bxnJDVdVWlZCA4Jrfn0S93hkP4kcJMg2c2mXLMkt8
         A+dpQ8zWx53oCExcdPb+FKdlBoJaIsvcbK2vBOGAVx1cfDBfXk4qtu+dhzX1jjTnqTzr
         spP2Z7YddgMg238W6wek/DXiIoCSx70cRLXUPinLludxP9fQZJx+51jg/HOawltyH6j6
         aJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837851; x=1793442651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2cReWsSiTJKbfzFTEgcvWxEdzaCiferPXrh60qGdmw=;
        b=qaJ/ciNpmeF0Ly1dBK4vKqh8tuJ431U1xi8IqQITMENMabodSBd+FKvuK1xQ/Wfmk/
         00sVSCRjSul9B8zsm2jBRTXVGDkGnK8IQhd8j7nrvZ/0Rt2lU8TrvuR+IITWIeXPTpuG
         BoNy7cteVPhSxHKPddDEWaIwgiwMhAuMBKHxRGI6JTVxebS0FuYnEj+elh1kVfSjcr+8
         vW/7rN6P73GXunXLw2OPvuJyZ7Xpg7FH7wc8Hx5Ll8sFNc7YJKBVbn9PAnqY9031tgMr
         bwYhmaMjcZ1kf7qte0FffWYo8IEjUSQqalKXr1eHn9TWrd5wOyDwGNew+6XDWHSofzO2
         1q+g==
X-Gm-Message-State: AFq9FYKEyg+w46qPHPCDst26Ifij2W/7R4GT3Qm96CBXXxTFpyASm6EB
	9f9fZACYiV73ca+HOdSeW/VsnTtXKV4+7zINWnJ14S94z+Lkcsn9lpz77tUiGLBoNpqyTtec2ZL
	OHY6C8B51rr2tAX4iLE4SK2QjUMO0cSynUBL/57eWH0zXeFcc9JYnD6nVa9bfciql+mm0
X-Gm-Gg: AYBFou3nCk2+959nce+q8eIWNkji2Mw+XhLu7bSnDoXdiujQS4QQxDSow4K0CrQAlgn
	+1/xUsxib2/NuVx4FGhOOzm0s/h2e9NrE4MDd4jYZHJwRLEeMKFKsHRnU+RSuQRG/FyacYaNwD8
	XqbyW0MpDuRVV1qdY4clw+gAw+JJw0OHnbeOWu6xyEuKAJ2l2rpZqfedEAi8/DfUZTUKiA2IpSw
	ja3B35jslcvFxBim2dioYVdlC9jfnUtT646GUmLX6zRDDhq0Wqcr+8Nq/CcE1pSVDD4lKcnQDQ0
	iwokeF92ZREWB0+FMFICh7CVCvHgnsz97JsDDKZJPqFt6J1JBt9QJTeFS2x/zAN4QXnHoYUECRV
	YZzRohk8Cm31Z3oshaPUvJPE=
X-Received: by 2002:a05:7022:4198:b0:14c:be8e:69f2 with SMTP id a92af1059eb24-199363a06f2mr3358621c88.21.1792837850610;
        Sat, 24 Oct 2026 03:30:50 -0700 (PDT)
X-Received: by 2002:a05:7022:4198:b0:14c:be8e:69f2 with SMTP id a92af1059eb24-199363a06f2mr3358566c88.21.1792837850081;
        Sat, 24 Oct 2026 03:30:50 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:10 +0530
Subject: [PATCH 4/8] drm/msm/devfreq: Record idle_time at GPU idle onset
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
Message-Id: <20261024-assorted-fixes-oct-v1-4-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=1385;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B/7JK0auHlH1E5rs71vnCUiEOGLiVg3K7pfC0lEPdGQ=;
 b=OHcBZxDZNTeCg15sZVgW9W325yRHdMZt7Y5EKtm8SHncpfDafjAKZCIaSdMq/XWwJEHRJ3iWF
 s8jSVSyR42UDmFDV0cQIE4lrEBBUQUKAG7jkIMW2a0xZrPPBZ0xCjcb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: MNCG4ri-um9eEWft5ED_tkwZchN6rQo4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX/Iso2Pb8MYp2
 VJv5FNHlb68UqyV7cJnKEt0dbpvgDdbmhM4tYcpMTuRbTF0pAO16u/h6H/jZBwc2uW4D796kHS4
 X+d7QC0xb7ZhFlvtjYqdR76eJP5EaGqsE1PfxDoEFEs8sVC8F2GK7ixPy3k8zm/4ScnxVUoks/I
 ykWeBoMVEwe4lKbFt+43pzszXkDY0rdZeNrVK7d2eyXy9ayhj+A4Rz6nagG4Z5VzJsYup7G1tjq
 WCKMg5hezgmNJG+t4mixJXXOfeWeGrn21FLUvV+pr9EjlKVdX9yl2gsRfafNO9FRAkDrVq7HpFm
 tzy/YwYNyocE6Dg8M8iAQrcEhWjTgqQ7gDy9rahv9fvV+4k2WWD0Jv9C+ovvLpstF0xXHuAwKkQ
 Hl2PyNYWzXiI/S8dZ2GRG7LVaf1q7ucrfAZrD86UqA+JfmBBzBBXhHT1pWwe2Xeewb3qavBrT3w
 uQZCIeE0kYJ+4VodyQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX8xo5BipDWpzV
 DrbegGo6bCfayN5EL9kVKbtD96yhxW4lMqWK2mLqRpN+yakPwb6N+HQB9P14BDe9JXDrWCNjEAl
 resboUuHZqhkCQthsQgnFZJMD5hkTYk=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adc88db cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=8Gjds2nr7p1U5lpkA6QA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: MNCG4ri-um9eEWft5ED_tkwZchN6rQo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240041

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Setting df->idle_time in msm_devfreq_idle_work() means a cancelled
idle_work leaves a stale timestamp, causing idle_time to accumulate
across idle cycles and potentially trigger a spurious devfreq boost.

Move the assignment to msm_devfreq_idle() so the timestamp always
reflects the actual GPU idle onset.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Cc: stable@vger.kernel.org
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 2e1d5c343272..f3c664b20a1b 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -357,7 +357,6 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
 	if (priv->gpu_clamp_to_idle)
 		msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
 
-	df->idle_time = ktime_get();
 	df->idle_freq = idle_freq;
 
 	mutex_unlock(&df->devfreq->lock);
@@ -370,6 +369,8 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	df->idle_time = ktime_get();
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_REL);
 }

-- 
2.55.0

