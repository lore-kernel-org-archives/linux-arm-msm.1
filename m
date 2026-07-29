Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E5B4119F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340622; cv=none; b=sfVmCBgr03sI1dy6Z+Gq9SXYTjSooKPNw6ulDMXd6a3q6AbUiMo6rB3RZXaBHk+kXuE2x6FBSrRMZG/x/OjJ9voLv8qXcJac4QaVXFyguzfMUEYndtNYoIZBPKI3V/VDmaOcP0h+CrT7eqYFOQuptKXgXQLMhdn9Ww92EGJICtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340622; c=relaxed/simple;
	bh=8PFfTxM13ahnT0/lEem0uzt2tuNNGVbRz+lfpQOxU8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/6YuPJ1ccjwqCJ87Wm1Wi2tYhX8fMnjnt2os3O0lr7JTZINBBhhij1f1XujfnZqdbd61XAX6OK6REbwBtuL8+y3Q6/NBPDgp6Ef8lDHNaFsZygoRb0jt5VJHSDBp8C0JdYDhr9YwZsRCbHdD7eDlEk0l+0k8mRoaiR7I7UyaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXHWtps/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCcEPcOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXHWtps/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCcEPcOX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3Crs3343292
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nr8Y2kLGOAQ
	fP+6If92MLZogonNmCXdm3m2GqTYBhjE=; b=kXHWtps//Rt18b9iSdW8msUMbV3
	/yTPPMO/9q2Gw4dAShfKKmTJD+2aZ3Gj9N0v/GQ0cUCdmQvwiXyBxCz8aftN0Tiv
	98C8qYyJ4cqe0iJ806MEU3IAgPi2Ar57kC/Dzpyjw7gd9R2/QHuYZKfgr9p7NXff
	AoHfHUfTaArwMMlUqfdJ+Zq3/LVm/NqBVpgTEEzeU09WDzITqi7J7Dabi9H81AxS
	of0H93OHa7AjNIer3S5IAVBCgPQVstNGmXGjHjR9Sdddrih0vvD/pWU5EjiVP4yk
	JKpvNZI/Rl063xqKgIlQvHKPtWBZ3j6TKFYYRzOyhnmv5lq2R2iN7oQKQ7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3ms6rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee894b3d8so20180705ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340620; x=1785945420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nr8Y2kLGOAQfP+6If92MLZogonNmCXdm3m2GqTYBhjE=;
        b=OCcEPcOXsNk2wqzrHa5Qnnu9KhsA55XVgWxezBjcviMNIA6h8kBsSSQEZLbh1oyOFx
         vFCuhLZvB/oapw6ZwCBzeuKZ+xc2EsOAMZEUmPwO3IJMe+PIGkd0x4jX1F3lZCHeH2DP
         OGgxcM9O9lmTSYSjUMhw85M4RK8Tojig+lvTmj+djW6o0hxLFs6fN3/7mGctW7u/SpRH
         YHle14zG85qhaNn432rsj49V1b+PUzLC6+2MppEcokN8lNLCMGHG43PGRG1Ug6t1MGmw
         CyLUaPQRoIbCdicPqX/RuX66NAQagP7VxPdd23t9Ow5nwSZ3d5Yfqlyi3XpXLBJDTb4K
         SauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340620; x=1785945420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nr8Y2kLGOAQfP+6If92MLZogonNmCXdm3m2GqTYBhjE=;
        b=pCtu4JPsBtVf2QAJMGEG9/tv7I7ri2CKeREqDtWMfmNYPY+HH/dUyqZSPFHQRMD9+R
         QQopQPCNKm2DwyPIREV/kBlu3txrozWaMkgeG0H3syYL3II8TjCanjO0Cu7e8xa4weEA
         qehUY1+dBIA7xYCatTTAeqaOz5k+fm6yiJLBQJSucMAXA7xM6AjtnepIDGKEcURTp41N
         7i1oLGX7z6j0QMngH66I95syEbGyhtt6YZ9evDTuoWQMDXgqoJbbIpaqIYCk4yKFr5ZH
         1hM0npS2OubGq9ZFw3smFhKmwF61SKDf/zHb7PYz3/j3YyHTYqXsy5PvDyTvuft9phiM
         iH5Q==
X-Gm-Message-State: AOJu0YzCK5UjDJJLZDjNpli+g7F8O97SNvmPBtt0xInHy9TZIVvPqAmo
	3yuY1wZusuhuE9KAN+xmkmE307X3TaVNp/CuWSaOAiwCzNpFLPB7+AJLut9k6KfdubGR0P24zDE
	+gYhyFpbSTCP/NN3z5xnl8UXCXEPWO42dieUd1F0sVP043r4RIobRuxwTJcPwJ50AqypD
X-Gm-Gg: AR+sD12523XzP87kULS7TWj0A283/zuhIwGgqqAPfHfd8WeJJZAKd5ddCQtjbwPphJ/
	W7Id/8vlSzmTBdPsHCbdvzUj3r9XmlZJCSZf/iZmD0FdAIWUC4J94PNtRV9ycE33+ijy+JteGbm
	az3cBRIteAOssd6zz2gWXwBbiTDoRSgUZeqq0JeH5J+/EmxJ13iAkzYTqgEUSZIWjeswCWRvZ7K
	mdhNh1n9BvgouBo/PfSD6fOf+tJ8vH7uucnRdW/+JtD9mdP9WGYgnoShDXiQJzaBVIb1bJTjY+m
	A4wF2IVEYzzhs/qGWLeI/sq1f+YWhWVIo8Z4ymefBy5GePCVUrRSEEzuqHPBxMRTmBMLWswT8zp
	mQ6cphnba6G8na6nZPTK6Q1ocWMGY+Ji3ks8t+tIT1sFxspE=
X-Received: by 2002:a17:903:291:b0:2cc:f4d4:299f with SMTP id d9443c01a7336-2d015ee2321mr87596425ad.27.1785340619765;
        Wed, 29 Jul 2026 08:56:59 -0700 (PDT)
X-Received: by 2002:a17:903:291:b0:2cc:f4d4:299f with SMTP id d9443c01a7336-2d015ee2321mr87596035ad.27.1785340619194;
        Wed, 29 Jul 2026 08:56:59 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a4af04sm14176905ad.31.2026.07.29.08.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:56:58 -0700 (PDT)
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
Subject: [PATCH v7 05/17] drm/msm: Move nr_cmds initialization
Date: Wed, 29 Jul 2026 08:55:42 -0700
Message-ID: <20260729155609.20190-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX/K/hxu7xiEmG
 uQZ4WDSk2qqzBRtrc87Ac71r8ZlktQJYenKrxHou3eo/riFHKCSs0EWtJwJpp4xQNFAat6JdxbL
 EsgtKCGCR4IV4nLAfU/cah85dxmV19SLahFWHCRYXLRdw6HAAjpIZsY58bgcOdcNqtoFoHOzlP+
 FTHI9F9lxYVrLqsYR+/PWlGMFQ7E3NkgAJOkjhzh3eVp/k9r6yePa2Cwx/WZrr+k2hsldBQWslb
 cwtIOXbt0CZhUPIVApvsAu5H40Q0m0vlSt8ifMmGXLsV7OM2bYM7m4syZfdEG/u+vl1MN59UyA3
 4l05rQISKUSxpJcmsIi6bT+oQfEajXTMNpm2sVUaRf4sc55q4lfhWNlHh1+w34yqp6efHbUUjuN
 U4Ro4vc2rL1p0PFADL4fDkUeek3wUT5bcpMiHGVtaYQpfsrv9Ezr81/T3TDvIjLHDT/erDpZwID
 1Ex1KyZ/HHnT3QdPMlw==
X-Authority-Analysis: v=2.4 cv=F49nsKhN c=1 sm=1 tr=0 ts=6a6a22cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=F5a-vUUdUzRQ_IYq5r4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: hyySjyqaANtC2JLBlrNVvDw1Zm2iYFSj
X-Proofpoint-ORIG-GUID: hyySjyqaANtC2JLBlrNVvDw1Zm2iYFSj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX2OLLmWIYo9Pp
 oxdIaRMmYAO79g3UGPNBt7QQkl4fimQwG/E4y5y1P1Y3dlAQn7g86e0lJhqv6Rh7sYOXXRwS3pX
 d6z5SsDt9SpYcdDqM1PSuPkbxNJ/kKA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

Previously if we entered an error path between these two points, we
could leak the relocs tables due to submit->nr_cmds still being zero.

In practice, relocs are disallowed on a6xx+, and non-ancient userspace
will not use relocs on earlier gens unless running on an ancient kernel.
But userspace could use this to trigger a memory leak.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3c6bc90c3d48..aa48ea4e7f58 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -260,6 +260,9 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 			ret = -ENOMEM;
 			goto out;
 		}
+
+		submit->nr_cmds = i + 1;
+
 		ret = copy_from_user(submit->cmd[i].relocs, userptr, sz);
 		if (ret) {
 			ret = -EFAULT;
@@ -719,8 +722,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	submit->nr_cmds = args->nr_cmds;
-
 	idr_preload(GFP_KERNEL);
 
 	spin_lock(&queue->idr_lock);
-- 
2.55.0

