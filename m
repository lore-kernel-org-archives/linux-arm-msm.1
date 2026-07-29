Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBCE453A50
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340627; cv=none; b=A42nB9wUlwfbBzY5zHqU0sveVvnvym/sNWZfWMwAlbVbmgNPuD54YxLuUuY8rvCT3nQAd5YiSHcXuEjPWqoxR4doz+c1y+iTMRuMHtM4uG0t8K6Hg0Qqb2lAW38uPoELHg+FtTsB8PSIc7jZE6fbeux4f3Ys4MLl1Pn1Dftvu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340627; c=relaxed/simple;
	bh=4N17iOoD/clJzRUe2kNuCYy7t9AE/P684XfMMFUwlW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBmyICUKMcoG6x4ROl/XcaMJs6mIcPIl7UJcxc7Ad3v7Gf8YCBzef5JyelJ+YnTWO8w14ed2d+arY3DZ2qrmqp/KrGLtbCRzq7h03c4HH39XJt4qxoNmS6WGLHspMnnaTr+FnezjqcmAfGzFYPxdKtrNgSMdUxzR7jRfvHoiDQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5aytkWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCgoZEjg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5aytkWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCgoZEjg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3E162328465
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DUl9fsdKYPz
	3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=; b=U5aytkWZaz/fVU/LGUkZ3JhxZzd
	hwrJGvk28K4ajxjw08ae0sycf9kwpiW20q9XsjBbP5n9MJaMeUI2uL9KuIJxOTiD
	FpJFDtQVbY6wNuY6N5ydHZdyCkuPbQI6Kdo4f3ORKjcMj1luCuUxc+40vTjiBVvk
	PyXjR8yCqewem22EIg519WZyiWIM+U1PweuaK9AUxaC5sd1a4e8yiwevRUyKo1Fm
	AGUz7Ip7TavuxAMSweDi1qP4BXh89MY/OewBrZ94rfyei9Kx5RsF/pfewsAmKdyw
	axdJLFMc+efpQEeCjHDCiPdo5lrp89LG9yPzUG7mdQzLdiXbWRMbGin+95w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrch9by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848662cd2a1so1302132b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340623; x=1785945423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUl9fsdKYPz3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=;
        b=hCgoZEjg8TbqIApPRsluLsLW+wqMza9Ig0bIJ7oClh9sfSVpR++owR/hmrqDVKtiG2
         P5R/o+rl6mdIviSH6YNLGjgSr6MRSPzseinkVBjLeQ/xXdZJvKCNRvy6YL3jwo8mGcnv
         7w03ml87U/PPKmhBkfUT5KwdZVG1dcJMIcCAe+GkM2/fy5P0tvrXf7tRGnkUkBi2TLTw
         ZqjYqe2qhGZn/TxXSNRhsuPeeodWxhSgyIlISyhTJ6E94ZqegE4sKUjA1JRPyixaH9CM
         xGtR1uCEjmh72EVDTSUsulhqTVExQWsjX5TcFDEM+TyPdHP+g+z3LbpVezHAY6yaGQaI
         N+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340623; x=1785945423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUl9fsdKYPz3kO0o4cBY5wSMLk2mQuvR/wBV0AkKLB4=;
        b=nA2jALDhPm8Tq+oXcyCk8YsjWeiMubyFZQ2sdN73WEUkouP/TQgfVYd8q6f+g1cKIy
         CxA5f0lvalQ9cBqHroHJMv0WS2jzLD0lVrVbwaD5XcIcbPnxyuMryeXuFS1FQ+sU6Ix9
         1fulRhGXi8hHn3S2j/G+0YvBqqE5/LEpZFmWgf4SyRcVS41jXrdgl2g8Hww9NmL68aNn
         p6X2DDsnGCMVkALYzP1Zr6xqX+xpfKwb4a8O9GmenZ8c8RLPO2mDMAC06rL1EoBCiPr3
         hu9HD4TDKuI8kviJLmJGA/8g0OpMWh0ZSpvdshS4IWKMhQg5cORWV77KAiwFsA5nq6v+
         nERA==
X-Gm-Message-State: AOJu0YxcOTVPR3uK0i7R6lgLV+ecJw9Wnc4FMOiC1cn0d8JW/a0QpBwP
	BFxbKbrC4TXWHS8HEspIhmkq4KjX7WNNs1Ic/C87KYYD/ntE/yAt6rCSQy4I8QH3A85vN4SJrrw
	i1bG+iQW0CwCHZ+hiFNyOuc1Kawl7LJkbfGpnczGhkgDRk1G+nYyS4xz0+YC8U0s9hXMf
X-Gm-Gg: AR+sD11mnP9dRzhyAl6OMw69qkX/tX/LVM+Vr1Us79JkiMAYcm0RzlnrTLdjtTtyOLL
	sHwtwD+vi9MbtEdBBTBGJt++rlIfufCybW1C/KRmnIffJ93l80YgC1gdXFOk5SV07zA1Y7mwain
	4iOUsL34IPAvCEKsI25Oiq/kaX+T4HH68XaAlwkKW3YJrCbLVrxyEKIQYS6NYWZe4y5okYZHsCx
	tGDc+oGWtCIHl++YFCf76xK34TIsCTWUND3thyyfo6UTB4Vp/MnkCyM+iRxLgAItsbMyBh/a+Wg
	wfiZsZ5iTtWAee8hgjv2RwtCef2BKsxl6iYGd3wO2etSsTys9MRE40vLvK8oeBkFUloLzFpYqzb
	h1XNRi+jHhTYAyAvBpHJD7+mVRgGzgG0eyNxSpIzYzY1AYSs=
X-Received: by 2002:a05:6a00:2e24:b0:848:438d:3665 with SMTP id d2e1a72fcca58-84e933e8291mr7776128b3a.41.1785340622781;
        Wed, 29 Jul 2026 08:57:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e24:b0:848:438d:3665 with SMTP id d2e1a72fcca58-84e933e8291mr7776094b3a.41.1785340622268;
        Wed, 29 Jul 2026 08:57:02 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0375639sm1609836b3a.44.2026.07.29.08.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:01 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 07/17] drm/msm/a6xx: Access VM directly in submit path
Date: Wed, 29 Jul 2026 08:55:44 -0700
Message-ID: <20260729155609.20190-8-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: -265FgIO24VdW04uqeegLwy_vvJ3bxpb
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a22cf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QS8Fz2UHHwPDOV3g--wA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: -265FgIO24VdW04uqeegLwy_vvJ3bxpb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX9vP1PR9XbxMW
 lJPr0zE/W6Qcp4Gd4T1fIR9/+UtFv2sE0A2JvgTbTxLNMkN7wqp1+aesGRmcWKdJyQ/r4/PWfL6
 uzg77d9pflPnpQB97zWN/4mFyqw5ib4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX3veNFj7xU3b/
 PuCfzpK4rIMeMy34EeVBx1PL5wC8454YWAshvrGDEPXxBhniV+IisffeVi6BINQxa+NMdBYFHaY
 Il4HdKoTySwokxvXSKmMwkpeLQcqLSR2wv1SS/lM//OKubuObKQPHBa32/YbzRlu1uvAUjljU5J
 48AHMSWjUhb38y6zJzSWuxJhv5/ezMacG6BxIXNLsibkvpTGCnT1MPGq0DUnXn2LisoXo5Kb2fe
 3aU7uG9kUF902NuwwZlaNHJiBLnzVI/ccJqYymPN39G+/4j5Y2OgvUcvrZcaeovatAL7hyjr6Qm
 RVJBpxg9HXmrivzK5kCpDcIEiNNZuDhqBZgPCkhXyGRUp4g5zM4WGA2HAsh/y0dHtDCSCVS9u2K
 A93XbKpe2MN2HoU8OxW5k9XCMQ/d6vEZGMSIFkg0DEXxrytJRZn6FZBQhw1wW8mpyGie8gI/KDw
 EVSoyhcmVhQkKXuPhlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

The GEM_SUBMIT ioctl has already ensured that the VM is created, so we
aren't expecting to lazily create the VM this deep into the ioctl.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b3bb2fd433b..7f1673163f67 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -229,7 +229,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 {
 	bool sysprof = msm_gpu_sysprof_no_perfcntr_zap(&a6xx_gpu->base.base);
 	struct msm_context *ctx = submit->queue->ctx;
-	struct drm_gpuvm *vm = msm_context_vm(submit->dev, ctx);
+	struct drm_gpuvm *vm = ctx->vm;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
-- 
2.55.0

