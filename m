Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D547DD4B
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217319; cv=none; b=Jckvq+S5pDTlD8a9uJOc4qt0f/q1R7k26V7xuF9RXIA5j56PWGN6wsLupYSBEurSEi/txgJdc8UkH+wUf6/ah5mhpfCNfTLjJmjGTZBeHhPZYE2cfPf1W3AX1e2BxjYJAR5sn90RbPxsV/5RjeqEcq4+Hm7maKelcwKB+1WrI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217319; c=relaxed/simple;
	bh=42MaHuKsi9wtmIKNRqT8ly0SxW0ZKEjpv2W8+Aag/4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKQ9j8Lkt9djezYjstcDtVW6x1bdedYFgEC9C68X+HJJ9YRh8hRLTGNIjd8RiVWJMUHERIqPodwe4IlXAXQBwQS6/cREx7EyQCsau5y0+JioKMa6EZwkHO15C3RJ9uVzR5Xj40ZNT0RWyhFAbR8Sde1dDECW1IkTNLRC+FcvGhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF3eXwSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkMIiWyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF3eXwSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkMIiWyr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdXTg1707164
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=; b=HF3eXwSLNRwlfJAz
	fbY4/3ikrLE6/gmkZMGtiLcv46H9XsvE8/slsLAlFqw/nQvBPCp1ztBsg7gsSXRs
	Z1I93rQ+qQo+RfO3K2dqPeGnDOlzQXLBcbZVGeKz6Fg9aH2fK1qtEzh19AmurmKL
	COy8XceitD1QmLQLa47eKm1V+LvHZbyiuN+lzIWwEEsfEqPdMIlUFptu/m2QVwXS
	wz0o7xh2gAuJN/WYebtY/5ptoq6mxJXe2Qn9IbYQ7kLbZJcSD0V1fr0gVmjbPMFE
	7nioCxlYzxfSKanz+aI8AutktBqvo6BQy/VPJ9cSvENQyyOgyjYrQR3t3DgSdGgI
	jipN6w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh0v40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:48:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fb9f59781so1445586137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217315; x=1789822115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=;
        b=TkMIiWyrCMrdDaW+nUUpdK3CQeWApcZ5/PwmPAZhEfJwrfTS4vyzCMt1cjGNJZ4rFa
         6/zKw6rzT/cGVHvzgUhZz/tH7bAc780DIAfGhD3zTa4M8xbG/BGeARlOgD4OnNayLH+t
         28IYPijtXtKwx0TTVMp9dWRxVqRNSh7alEjlrQvuBZq4ECfpGPSq4hUbfimj9paDILcH
         t0REt6mh0AvoB3GAOc8RL9QjPzLDqflHaHKjpHDWgWGQY6PViTceZvjxspLXE8r2iyHW
         OsL2J9WM0RNviUEyy2z8jViFBaiTXEbw+iIdOZMt+qfG5NKcq2v494qQ3rk847bWeuQQ
         qltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217315; x=1789822115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=;
        b=UW8i2uLtTJPXy3/HOJb7YZxNA2QdOpbCCdPW1T+DtzN3DwzmbO8hzWC4XQyxUCEvem
         qruk15bvuUNHa/66GbLAexlOd/QHqq4K7ZG9bZIUCm+3IIYNNzJDzQvlAQ0gLRwf/4IU
         bKQmx8MaujCo7ffjjOEf8ttixnlUzzkKs0WALB9KwiWWQWVCw7BKzLpFxyR6ETb61Pi6
         gzm9E72hmM1bBJiRtADlYsQCMR4SxsweFA5h7NQ9ABNMkzg4Fk/WBG6e+Zv+6Pd2vWGm
         bXyZVk47jzuTtJmYl3gfWK/41XhtgJLGMcVnLYwEivWb9BZDyBH8eSDcbudip3H08is2
         g62Q==
X-Gm-Message-State: AFuF++m1tTCNZ0jUcKYfbCsp/HDoZvqZg6IRN5TD1JryykNMB2xp7WUk
	sn3vlFg68L57X9GUNifSU4Xry5n//b7Jzpa7JykwSqTss+2rPXjnAe1w/KJECmb7cxEgAdkdyJG
	jqEePcLGpefV7QdQj1C6kYd5iJfVIS7n3OyucYqsSahULBlLvCu5PURsRx76rHBlGmPuL
X-Gm-Gg: AYBFou11EC4QWlgGrUK+N0fnvBrGs+cByzUL95D1mpAR0fa8G+LLm1v2CZZqNh64k6K
	Rin0PZIwv2oyZ7UYSrChyo0cUxdcb74yJ8rlRf/E1qWDfqI8cHjHPHcrjU4o6sq3v+BxDpq380j
	7RVF5wEMEk4UbEz36p2kQ75NqHuOK05WOrjWa1UyiQEQJkxLjLDjNEo0bFJfCUo2u0kZmQFfnnr
	VFfQ+L8l/iXLMUzRAoMUdjJhwk/zEJfkH1UEFwjZ8yK1nSrrHUjVg/V+Qi22TTQj5T6GX6SZsAw
	xg61GfhQ4RbHDPfHBHD5YGhEensCncZkU0HjbUHui/CM+UXFnjBcnVM0PJKxjgIciKASQm3RZ6g
	6JqUCYcKbIRWy4IUYxw6uuZQVdRsVqDI2S4jHyttBKc/m6E+sYBeywxBGAfVJvIG58wlKvQA3oS
	ckiTaYmehZxQF3
X-Received: by 2002:a05:6102:2592:20b0:786:dfa:c5ea with SMTP id ada2fe7eead31-792a5b8ec7fmr4320404137.5.1789217314816;
        Sat, 12 Sep 2026 05:48:34 -0700 (PDT)
X-Received: by 2002:a05:6102:2592:20b0:786:dfa:c5ea with SMTP id ada2fe7eead31-792a5b8ec7fmr4320392137.5.1789217314461;
        Sat, 12 Sep 2026 05:48:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:25 +0300
Subject: [PATCH v3 5/8] drm/msm/dpu: clear the DSPP pointer when no DSPP is
 assigned
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-5-a7ddc6fe2032@oss.qualcomm.com>
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=42MaHuKsi9wtmIKNRqT8ly0SxW0ZKEjpv2W8+Aag/4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoXJtkp6xzhmqkONLh41KlY4RqHvvU3nyLSz
 yg6Ldhr4ICJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFwAKCRCLPIo+Aiko
 1Vw9CACWmy7M/jD5kaRVjaa/LjM93maKtO6/NwlYADO+O4on8dxA8tmlBt9L6s6LHatDjap7D/1
 spoGOXEdS7eZIbybnBNuJEz/INBcSm7hUAz4DWNiLe4rwrCZo7bWdUcawl9cV0UmyTK34k8uBnd
 5qT0uxHad1kYx/vRmw2SIyRZpb0JRiFfgLaEoo535kxuoFrYSHi9eG/fMiKN9VxO0yl1xpnu9ov
 FtLLPcoXAgsmM/aPs0F7AcElqrJ75rFL7qnA0Acq9OHl3g0wDJjNU4dXotQhGlMg7gTnR9sPuzP
 96PVsx/yodrA6p88BXpK93mtklYxAzhJDg+UeL3aO4o8JlFn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NFwW0TMwuHmKR6E14F7S298f-H9pAAxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX1BF1fpxhyu/y
 2Y9jsShiImEjXY6OgMYLzJinpzfkQQtUAZUVbMMu90lhRBcd+kMUg4mNwf6dgdLoWcuv/dJQiZI
 RskcgIlVPzfXNJgwRct3S7EYW5VutjT2pyDa7+q8y0Sry2PHVeAufsVUS+IHMK21forF9NYoPPI
 0ZN2F8TBFD8yW6x+RVW4aIe89Uu1sC33OCw2PLg9Pi0rYGBl3xf1HqlnjzaIMK6Ho8jgf647ZwT
 QCi3oigik9AfjSjb/5V0ICxIkpk/UkBC7K+8xkjxV7oPa7umZqcqzO6ueG6TDoFjd6t+bk8jKfv
 LiUdX2jhXsButiD/LHuwLkHqXJJjlX/yuhOa4qJPoSk1231psyIfv6QUoiSP5GRDxhrBRbPwEBf
 3KpPFrJdsNnG/1fpw2fsNHMx7i+8iDR5QXBULXISymi4KUfbP1VDWLLtO4ybpmGapOMGCObPgUB
 ooE+awIr2CzcnfIXHbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXz8hdQuFq12lK
 UAPK3ZMBElxEJF/S9/dxY4eQy1bDyqZ/E/u+McP6ynIeqdU7h8Q6JOff1dSQv9rIKaJEOxXbxJE
 CyxMzEU2+XXGNAKG3u0s5jAJfCyrxOc=
X-Proofpoint-ORIG-GUID: NFwW0TMwuHmKR6E14F7S298f-H9pAAxP
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa54a23 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jpbDcG_WXHA3xrgMYRUA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120184

dpu_crtc_assign_resources() only stores mixers[i].hw_dspp when the new
topology has a DSPP for that mixer, and dpu_crtc_duplicate_state() copies
the state with kmemdup(), so a crtc which once used a DSPP keeps a pointer
to it for the rest of its life -- across reservations which no longer own
that block.

Assign NULL when there is no DSPP for the mixer.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index bf593020e8e4..5dc0c9aeaa5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1480,8 +1480,8 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		if (i < num_dspp)
-			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+		cstate->mixers[i].hw_dspp = i < num_dspp ?
+			to_dpu_hw_dspp(hw_dspp[i]) : NULL;
 	}
 
 	cstate->num_mixers = num_lm;

-- 
2.47.3

