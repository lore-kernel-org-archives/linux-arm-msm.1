Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB88367B78
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321334; cv=none; b=gIxNs2GNTf9h6em0sWniUyF4yn3lty7a2fIH+nGEcLG+XUXfkuUxASYXyWBzk9BhJNOt6poci92rHcloCthECEkq6Tm9b2cix95QTeg7QmTIzESUBWIYc4IrFRpCDuhNryiRmz5qiPANZCT1QIDLTPiTpSCIW9xiUh1YtaW5fUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321334; c=relaxed/simple;
	bh=x6iVVANElOzzftScgIHxMzDKlbc0yJweoGktavR7ooE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4wyeKKRAfKeI17PSS/bMGTbiIj8RSW6M1zmBMfDBltohGXDseEbTXNISNVqL0UU08Gl4fE7EPuRyzia2IOGFMGouKngMg3KI8/OwrQ4i34sLPn67EA2q1GuLT+Tgopgn1MwF/eUrXF3xdknnzumofjqE5xdFrEuF1F6q+yh3Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYVF7vDY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9BO1BDC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYVF7vDY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9BO1BDC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtTQ82887003
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5Uxk/s1mozQ
	uhwk+cHuG2u1j538IneDvUnNY45Gdb+E=; b=HYVF7vDY2e3C+8BC/VNnDuMIKRo
	Hb3vOjhGh50xH16si8F+8QaaqKqXGHly7IktU02xVR+vJBcHDZh+BTJ/JGAwAvA4
	kOX2SAA/wz/22H7j1ZJxC9HWReHkPL12jZoWfz2HVhjmJerLDhZR2uw5ENfYx+lq
	eNIQf3FvZwiH0M+MZ6VIkmPUKnHDX8andEqJNBA6WYJdMUz+5Yz8q0oILwWVbyTF
	HWyLI55qFBlCqGy2abo36WCuBWwwb6bGSh6AGIVX6K8QLDK0Ah4lmcJAHQFtRXFj
	Q6YDAhyeZN5TKTDIKPcmBOO/3HWzviH43gtDeYULA02ctSZOi0SUGg0gOug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfjn4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso16459795ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321331; x=1784926131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Uxk/s1mozQuhwk+cHuG2u1j538IneDvUnNY45Gdb+E=;
        b=c9BO1BDCLzHG8Vs+qjA+Gbiabf67Mo1fNLAKWJd/HPh84xYVDSz2Jj6w1TKIOyP2Hu
         jQFNh6lYQu3yT7LMOhCkujI/9J2Pw9180H0iGxvSKk7tPQyPo2L4tOM65nikEvrMVjYZ
         +vVGJt6mE2T7AgMV6jgg1fJ/jtltXxIfil4KRv+7fj8Aro0+61W/TmmdLp/1AHfoMUvv
         3Bvwf657iqEDF6bOJQiAKhx6sRMRQ9DPRCEKYumoIBa5iOMZGizIwV9hZGyFEU5oLa//
         MfSHkAa/usU+tZY3O+r6EM68dnqY6JdeGamaDus7Ukv1t3ctNzYMVDJi719b9MmgRRgL
         IYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321331; x=1784926131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Uxk/s1mozQuhwk+cHuG2u1j538IneDvUnNY45Gdb+E=;
        b=G3p/h+AosNvjq3/rfs4aUo+/wc6EDYX2IuHBcE9rr01B97ZbzZ2faIscSm4P6oJEk4
         UUkcRZkMopKr64OFdLSc7NSzi9RS0uwn7zY6AH9HZATqRV771dAFHzC+0Acau/GSpI5t
         zv3VT776F607h7RNnQ+hB/6+Rru93HuDijgsV4m+xEkI6Kfp649iVTOV6ohQakci84aW
         NaZTEdsWABLQgkasd+v9pcUgMKtd+Sh5hEZWy4/3IX0uopwDOAtedp3Iux2nOtMCy2VS
         Pc+DoogSceIvFyL2gi0xnHB2zy6wX0IeuLWhrhESCyPLVL/pVeDCS4GR4hZ1RVHZnjWg
         AzWA==
X-Gm-Message-State: AOJu0YyqnxoWy7/kX/pYl8dhwX4CGtFIVpDj8FwQk5VXNKXAqJkpMdOZ
	d1OKP8mAPP7haKEhHLuQEmjOg8IIqZSYluuW4gY3kooqMNpZ+o0m+Fl9x68OVCyOB/vPncifg9N
	VxcsQCLCwBfhzzLdSAdAoDRIwkwrzJXszCeLH9cRK23iYT5Q+/c1ZDmwQUigXzLzuic1xb6P1G1
	0p
X-Gm-Gg: AfdE7cmH4SiI/onMU18XuozkqZtVFpaBCag9PZ8k+ig5XDWFRqYXjlWy8YAaaaZpAuG
	RB96SkOdtgf1arK12YCmAXLT5N1U7hlYJuDcwY58F3hrNDMOSoT41eybICYfOpF+d82F3J1oggO
	Pn9wfbQn8ZbhO/WED2NjWXFAN4co8CxNpOvfoAj2E5L7HAc7SoYp1Juylz7ulwcNd4YRyKaja9F
	WhI1hNzTHYtLvJhD4ztRjt8gQSarLKQGnue8B+TTZHoNR+5IwzUsAcnCNeR4C/98lXg0G569Z5A
	tO6zwtba87Htn1wvs8Pu3bLZdPUmRs1uEkLPuDLrMVDIiD+yk5boI8kdV0Geyx9bBY9d9d4hUpd
	+/e1BZ85WJGpHNdiNrZEILjMwc47uQZB7PA47IIxsG3+Fyn8=
X-Received: by 2002:a17:903:1b27:b0:2ca:16:c169 with SMTP id d9443c01a7336-2cf1f2ee1ccmr94204745ad.12.1784321330725;
        Fri, 17 Jul 2026 13:48:50 -0700 (PDT)
X-Received: by 2002:a17:903:1b27:b0:2ca:16:c169 with SMTP id d9443c01a7336-2cf1f2ee1ccmr94204325ad.12.1784321330304;
        Fri, 17 Jul 2026 13:48:50 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34490c1fsm16779755ad.10.2026.07.17.13.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:48:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 01/16] drm/msm: Fix barriers accessing ctx vm
Date: Fri, 17 Jul 2026 13:48:17 -0700
Message-ID: <20260717204841.26120-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX2Mr1k/a++U6n
 WFbud294E9l09I0rh+UPIaFhUXcrLktdkwcpQqq61GCfrb5tB+UnKVXeha9RUzPd5TOWBMACwoD
 Lztdlsin3l6JoV6UmOYsbmnAYGEcktJ0jd7f1Za5kUS4aa4afSpSgfibMGKLDpcNvfmpZIlGiRI
 zKDSoXKKCxQ1Vm1IL2qhuF3Ce2VTXEFh3Cq7aKHmh4TEpY6P/riajZang9TBhKu9AdKZzjyy0Ix
 WSkYzLWP7q0UWgJ6RatGpbYWwAwOXDZ+U3OOOJcDsxyVgXxjHsqoYBKKdP/fuGdNpHxvFIU/2P4
 paqvdmefqcKxjiRTe66HY+02wWIZPpZFGNYl6AGpesrCJ3+2wJs+459BvPTmHPYC0FtfwY+ddPz
 MT0PwC03yfHpUIzIQP1f9kHv4Hbtv6csGeEp0VA8m/vm/qaHM8CA833fqxMDc0fl2pjMlIzVjq3
 6ZmfTqikw723L/0UORg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX0PriYZ/lXg9e
 xmtxUHtK+D8Pz/Xyn4dpo2rleMYI7hASvPJysWD12ZS5G/4glrYvKHHRS691yLKfvZIg79VbgML
 vdlJI5YOZrnu5cZqck5KDQV08RWLTwY=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a9533 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PXeb_Y4BrUyLDKu8J0IA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: b6Ph_KSwKykkaY3DM9aemTeZAdslXISI
X-Proofpoint-ORIG-GUID: b6Ph_KSwKykkaY3DM9aemTeZAdslXISI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

Don't rely on store ordering to protect us from caller seeing a
partially initialized vm.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 32d5ebea2596..ec88155e0ed7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -224,18 +224,19 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 {
 	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_gpuvm *vm = smp_load_acquire(&ctx->vm);
 
 	/* Once ctx->vm is created it is valid for the lifetime of the context: */
-	if (ctx->vm)
-		return ctx->vm;
+	if (vm)
+		return vm;
+
+	guard(mutex)(&init_lock);
 
-	mutex_lock(&init_lock);
 	if (!ctx->vm) {
-		ctx->vm = msm_gpu_create_private_vm(
+		vm = msm_gpu_create_private_vm(
 			priv->gpu, current, !ctx->userspace_managed_vm);
-
+		smp_store_release(&ctx->vm, vm);
 	}
-	mutex_unlock(&init_lock);
 
 	return ctx->vm;
 }
-- 
2.55.0

