Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463133;
	b=dDdO0sLImGd1Rcg6BeZzHvfkV6gsxrAR4+szeo7U1NtBgFe3r6w0mC4mn+Jr1JOqUuKI
	 vtDLarF6ITiWOWLYMayLXZkimWcjwQQZTxMTqmra4GuhVt5YGhC8gSz4xUja4Ve8xgmVZ
	 8bXBb3b2hs3QSYJxxbZoP3hfZj/d1I6mzMwitVNUcQcceHlsYyEEbgCymxfaYwmuOD0ZS
	 T5hj4zh1IPRCkX13JtpPjwn+8afxLFgQi6IiB2XY1Xk7AGztKAoaaKTwFWg2o8qwNzVo+
	 wkV/MBkmidlZ+9WGp2ktVlZeTiTQG0qTWDQ5/R/QMUOQxTUnQaF45HLth5/EhUUHBxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YlNWAbWxc2wGAyprwee+/8Ir/9KyjTs260dvwuhzGw8=;
	b=QNhZzQhvJgVlkZ5fLI8bSb8ivyd7zEU/OBObfvyk1+k/lt93Rq2r2udVfTQCQDsvku+v
	 5mmYsSzD+loARr66gTeO8HXAtowdl3nsudhvr0uCQYO2sWO5BILttl7WKVg0upexJvLpR
	 /NygTQ0BX1xjCAfOkoe0rJ8xqXT50MXfdcuwhR5aPThKtLYx1aAYLGhlqr4I42UtEANUl
	 3/xwrJJmmFFgnI915NCLktT4xjQPXQstB8nDksKRMIlQJ1yYN0nL2s8tV6r/ISrCyHyks
	 FBqIUmaVfsTIh9NPbXpysJBLl2L1t02tO03Gb0a+SFu0ykAqxNmCd0eWN6s6l/2RVng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ul+qqobJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cu2qe4C2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71BE606A330
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C71BE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ul+qqobJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cu2qe4C2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0Vet3209489
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlNWAbWxc2wGAyprwee+/8Ir/9KyjTs260dvwuhzGw8=; b=Ul+qqobJ51OrUyVV
	CjXjwQvobQ49QFcavLbVkrWBwooT77J2i/NX9YsVJueglIxSQIEaoct3kAQTUVEl
	4XFf2+vMX5I2adkRprrBqLk1TR1k2QREr7CQOOlJIxQmR3zIJITTXVvwUwFGgh/E
	cSiE9M5/WlAZh1WSrnLiULVx9PYbJgnyyi81Ab+TxUhnaVM1KD4cKl/Zsjcqo+iz
	2ydMYZC5ioj2ZsxMKhDnQ+AyhWI5lZYRdnROxTUPWapLm+08nvN4jq8RjtafHJgN
	4FhlMn608LbAlsUsfAB9aK4sRo6DziI/ubbpKfb6wL1tJp06vPZRlMBsyvfA/I6h
	TlkNTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rsmra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:12:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-534f3fe0236so12414861cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463131; x=1794067931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlNWAbWxc2wGAyprwee+/8Ir/9KyjTs260dvwuhzGw8=;
        b=Cu2qe4C2J0Q1EtWZTDKxb9whGTsX6v/7biznMDWNwQCoRSl93pBfW8dxb05oBStbOM
         0gTDTpxfP67aLxcCMjzxOt0cxl1ltni1F1Y+xhLEnpu2+ZJe7nMfTnLrQM9dgYbOijzq
         wRszNZgvwG7pVuBkf12yOm7pZ6MDIfO8VIv6uqjM0BRThRciek7e+7gHNYzeZc3PeoB7
         LBL6S0Bgc8ErTO96lCLl6oCz6cwTZqBT7+OiuwO1nspzbCr0KgL5IRETFfvqUwopRSBw
         EzXKe2Do0k+/TPykJ/1YmXZuyYuwqXEjWmCf7i5UzkMgi9fAOxmXXjbR8oO26xSRrb3b
         yw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463131; x=1794067931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlNWAbWxc2wGAyprwee+/8Ir/9KyjTs260dvwuhzGw8=;
        b=uf2OHRmADpc2IIKFyAf+6VbqsuQT/6eFGbR7qXQJ9y2YZj/i6MpQ9XOmtWpfB2S9Zy
         9kuxqffh6izNzYPFnFzRWsCSWPsx5UAqOzgetTo1aUalc8N8Hw3KjJNbiqddYCO+40bx
         nSV+aSe4siWAbMtRx/MnKYjs3KeoPTGgXSbHBro9QIQDuWqT5q4wapC5xdItwARJVkVX
         j68ATQq68hjnfUveXpOl6nO9K+WXKCg2YSQ0z+RXGrTY+lm8FKo5noQXT+v26jxlYysF
         9Vv4+uptUU+9X4zCjQUXN+/gQX744IwEGDlLrXgFUoDgECJDU9oxshKlE1H6NCjGCDK0
         T9kw==
X-Gm-Message-State: AFq9FYIh7pFPw1wlvMGvd18qvI2Z/kmPVxl4HOxm+AgfbQ68nksQlVYZ
	KepBU7YGTt9dZl/Vpcl/1bj/14dJwQ5pbV6pkwQlV6Vz9DmwARK6n+pZfxQ9vdDRtp2XqazYGnL
	GuhUD4OAT01W2yh4NOpmzG9MnMHHleHWQk0rUsJXjToX6xggBXCQm570Klx6eZ/ST5RJ1
X-Gm-Gg: AYBFou0LmbddelPwOk6Hk35bzIZhNvGsSJWcqb7n7lP5gpPEI0bjTwn443BoQ2xwgbc
	0rQT8IsSs4WqIdcrlvU+L5eSGsQZ4N3uZGSe+KVqFf8g2l8csKra52FemQs3qkx/ZpVjvS97bub
	ZrIUMN0Gz0ULei6Gtf9pdggjTTej3ueTd6zSbwqAG/hwEdLCM2BQ8qBbJ+JxpkVgWdMpRLObqJc
	wFbaUIKBl6m93FcffZtiqO/q0k6jT8YwgustOft7nRn3D4ek2JUOJEdZbqmqOKtUNjV+Yzxn+wK
	M+3JYgfpSwI1pMSJ/c6dRuKFDx4LvsrsRwfn2zDNG+m/SOGMCmRlqu5CojO8Dpo9XHOjtDcaqNW
	ldAjHcd++KGbi8x+fEOPn+Sj2AUFNxPi/R8qjw7PGiLifPOk2CVD9cvMEqdS9PYb9XNeQiDWGEw
	QlI4MaslojTIqXpk0iXKjYMo8DKa0pOCbWQb87SNGroSMETM44lb9nI/dKHVl0Tg==
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr964914785a.71.1793463130915;
        Sat, 31 Oct 2026 09:12:10 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr964909385a.71.1793463130295;
        Sat, 31 Oct 2026 09:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:11:51 +0200
Subject: [PATCH v2 1/4] drm/msm: share a page of kernel state with the GPU
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
Message-Id: <20261031-b4-adreno-timestamp-v2-1-0836856b228f@oss.qualcomm.com>
References: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
In-Reply-To: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4278;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=devFZRDNTr6q6aJyRKFG/wEH3BHC9t43r+Sc04fgzcg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5hNOz9wL/xUO+pSkXEeVhIU4b1JPmDaik6zm/
 nGpO7t6ediJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauYTTgAKCRCLPIo+Aiko
 1aDPCACV4otGXIUcaP/Cai51XWlkQ5I0qL+MXwcLy+AmXSLy4auKgXOOnts7LrrT3b/yExLBlUp
 uRnSjveAEV375p3PLLyZM5PqMoYxu23WDyL4NC1j86/6YpXZhgeXu3WzKdIEPtBMHy19lWgDHV8
 GRiKalOFFV4zlNJmrDn4uo+J6VRR2Q48pZMf+lW1j0NOXJDCZnRnRm5W2DqGZiUxtQl+Ws07Rgv
 Q77V41YdSomCvmkIfmRHWTZwggFqByCieRAS4rghDV7CKlc+h3Oom9X91HpfMWYFRqNIZDVxpZB
 LbuNi+8GbeoZn/BPiEosWV6R/BEp6k7WKeVHs8c9iKV9hg5U
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: U8VprGMmmEstzAEFFwKz43n8zGSq5Rao
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae6135c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Sjt1sVUzr0hdpTIL:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=h5xwza0VLmx2EBWN6JMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX5V2whjVfAk0r
 oV4xVXFgiALZWpcX1xxv4CXaJh7HDM7ZHDt7crmKZr/VTklZ3+5FIQvasrx7tYuAX3eg5VnIqAy
 KtbaNJdd2TJolKKpuUXVELX6tEeQzso=
X-Proofpoint-GUID: U8VprGMmmEstzAEFFwKz43n8zGSq5Rao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX+axjd3ZOgsHV
 q3nf1KFFbLGiO74bXiBbSV7KwmL7hzgNh6be2QZveBiTmlL1jmKB4RguqI1vmwfU9SoqfoWATbJ
 OLLNfzDPoO0N/t5Vq4Bjp/w+1IMbZtrANv7XpUlMykI+Lua+O3ZfNm46UXaODAHGWd44vUQs+7k
 qXK9DDgzFQ3UNG/xSl81kbIF2/ai4SpUVCHiAyQM1ouufo/Uyqw6UnIH5loQ0R7MtLXio5bjSXA
 jY899RliIS4qxBYZdYIV5geqct9tSgyO4hAsoAxactFWxTzg4NvyMXGOPx4Ikmr0lZZnJ3fEWyR
 5cgUlwBF8AgtJE9q5TYhfoSVGRA9rrm1TzzgI6ihNoasdnpqDefqr3jB12MTsMnMzkYy0VxzYEx
 0ltRfHtcfhA3uzOp2An8uHPGKN5KJ9RbR2hmG2JURQZzRVEgGwvl4DibjXqm+NhzfSx3pGDGUIp
 FxVjnX9T3iMlyawlhBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

Some state the kernel keeps has to be applied to values the GPU produces
by itself, the first case being the always-on counter that restarts
across a GPU power collapse. A GET_PARAM can't carry it, as command
streams need the value at the time they execute.

Allocate one page in the global GPU address space, read-only to the GPU
and not privileged, so the command streams of every context can read
it, and report its address. Start it with a flags word so that fields
appended later can be announced.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c           | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  5 +++++
 include/uapi/drm/msm_drm.h              |  9 +++++++++
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index dadfe4c69438..0adf56fb9563 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -404,6 +404,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 			return 0;
 		}
 		return -EINVAL;
+	case MSM_PARAM_VDSO_IOVA:
+		*value = gpu->vdso_iova;
+		return 0;
 	case MSM_PARAM_PRIORITIES:
 		*value = gpu->nr_rings * NR_SCHED_PRIORITIES;
 		return 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0c2c35636251..747cd90e329a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -989,6 +989,19 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	msm_gem_object_set_name(gpu->memptrs_bo, "memptrs");
 
+	gpu->vdso = msm_gem_kernel_new(drm, PAGE_SIZE,
+		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->vm, &gpu->vdso_bo,
+		&gpu->vdso_iova);
+
+	if (IS_ERR(gpu->vdso)) {
+		ret = PTR_ERR(gpu->vdso);
+		gpu->vdso = NULL;
+		DRM_DEV_ERROR(drm->dev, "could not allocate vdso: %d\n", ret);
+		goto fail;
+	}
+
+	msm_gem_object_set_name(gpu->vdso_bo, "vdso");
+
 	if (nr_rings > ARRAY_SIZE(gpu->rb)) {
 		DRM_DEV_INFO_ONCE(drm->dev, "Only creating %zu ringbuffers\n",
 			ARRAY_SIZE(gpu->rb));
@@ -1033,6 +1046,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->rb[i] = NULL;
 	}
 
+	msm_gem_kernel_put(gpu->vdso_bo, gpu->vm);
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	platform_set_drvdata(pdev, NULL);
@@ -1050,6 +1064,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->rb[i] = NULL;
 	}
 
+	msm_gem_kernel_put(gpu->vdso_bo, gpu->vm);
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	if (!IS_ERR_OR_NULL(gpu->vm)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..f78f3bc62977 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -252,6 +252,11 @@ struct msm_gpu {
 
 	struct drm_gem_object *memptrs_bo;
 
+	/* page of kernel state shared read-only with the GPU: */
+	struct drm_gem_object *vdso_bo;
+	struct drm_msm_vdso *vdso;
+	uint64_t vdso_iova;
+
 	struct msm_gpu_devfreq devfreq;
 
 	uint32_t suspend_count;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3d363f12f66a..f8bf48fdc339 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -118,6 +118,7 @@ struct drm_msm_timespec {
  */
 #define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
 #define MSM_PARAM_AQE	     0x17  /* RO */
+#define MSM_PARAM_VDSO_IOVA  0x18  /* RO: GPU address of struct drm_msm_vdso */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -127,6 +128,14 @@ struct drm_msm_timespec {
  */
 #define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
 
+/* A page of kernel state that the GPU can read, at MSM_PARAM_VDSO_IOVA, for
+ * command streams to use.  New fields are only ever appended, and the kernel
+ * sets a bit in @flags for each one that needs announcing.
+ */
+struct drm_msm_vdso {
+	__u64 flags;
+};
+
 struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
 	__u32 param;          /* in, MSM_PARAM_x */

-- 
2.47.3

