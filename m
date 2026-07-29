Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D04052BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340629; cv=none; b=A2HZd6p1a3w8RNoxjRzpIh6FYIc4OoSvDIr3h0/UqaiQkml+CQ79HpKr0jSrB8AH4ONeP9trWgdOyaNM1eUuAeAf+T5g2zNmWFXb3zme3u6wWnOmXG72T0ZTNPFtFsDz2DM0b6gsWa1yShXMQiQTAzm951jJnZ/Dtgy0czK4Eso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340629; c=relaxed/simple;
	bh=GxZFku0kvsa3uEnAi/89TufUaclwCvO3NT6bp6hwH68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvBPZY8MBCl5bFzxP7/bVAs1a/e2xukggPJX8tK5Sq/Fs71poLRouN12kG6r5GgoTFOWJdUEbgKNMFu1TbYagL1udO923MuQNuppCUm5RdVfXG+POe2SChCqPvP9Z+7TXhy88/nF8igEX0+dHGaiFWjtBeghYuA8uqxtvp6reg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHTv4fE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUkgpZ1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHTv4fE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUkgpZ1s"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF325C2328238
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6DIg0hlu8qf
	HUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=; b=SHTv4fE1R+3eIyGWde7C603jX+y
	Dsgp9SUmQUeoFY0nDGSX1TGtMDuMPXvDzZYEiQcgRdC9RffSX8ptriMsut7DLkhx
	sRu1FD39aI08Pg4teGEXzUFAd1N1HrUeaHVEzuQkjz/JPJ/pymgYS4nvZnzasfXY
	JE3oKFeZMrbSKmCOGfQUdJBriNoELyuYpTj13lC5ALLqP/Sc6JRfnErtIBCoHWba
	PPWwam/+y8BTwsUUKdjpg3UWzCmdD9eMGTjAn+waYjSJZJhUHtoMc1t3cX+qIgCi
	q7ds0sFXOBn0Jn7pOlbCdHrqtW6dW44SaSQPCbbAD1N2OyJ7Hh8/JPyDm8Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrch9c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfe48ca1efso16178625ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340624; x=1785945424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DIg0hlu8qfHUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=;
        b=fUkgpZ1sdxOAEjYVgMYl00P1wXK51ARO1t2kVwGuljAiS4YUJ2o5IJ2CU9nnOuhXOB
         rFGf43hipkK9+XbvHyUE21jaxDTcFpeJcqBPrGl+Y+qR2NqL78K+UZDFVaap3MW0UumW
         dRLj0gIy/6XRqKEIbe+Rp1IcnIWZ+/3+Kl0yYt/v6FhdwUdaR+csxBH7jmK/2y9DRQL/
         DcMoJllFpnPTp84x+52P0A+F4OqKh38DppVLU/wKdlDnQuv8tyHw0YKZyayDBobVi1m8
         aN0sa5fkSMFn3wCwVcqup7A+p+2HSwVzDLWNhlEPoz8/Lb0gPsvg+TbIDE7QtcYLMBgY
         M4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340624; x=1785945424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DIg0hlu8qfHUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=;
        b=qfSnRwBOENNPNKbrkbz1WexvtzQ2lFee1D/Ey6AHpY+7QD8lOsc/79aW0EyGEeiTKP
         Xzqk3doPSlI+1ME5wlqeDPRkk+6r42YwcF8/U3M6YyqMZCwZ8i7hvEne84WPq6zeuhHf
         ameMTrz5lXiKsngA/s7JXjEGQMYJybayXTWvhFNKiT3HpD5n34Ho7gLf8Faogwxu7Qpr
         /sgnJugrhlYh2VrVADbzOAN2SLX+V1gBgIl2rsDfAxd+YWcqSD6aN33oJes3cTl/VFq7
         kJVWnuge1KtATBh3VeDrf5XrEQmE8rnMqqVLxwiHwP11NJ1KOSL2E/BMBLktUVZQNpoK
         Ihfw==
X-Gm-Message-State: AOJu0Yz7TLcmvcq0Z095ckeqOQwzjdhXv7MqHABTpzjC0NCO8yP8YfAm
	zVRhwWUHVVegW031P3G3njAwmgKcKnz7Wc8zVGHgGLTcgtFsxTALLYvVHE2XwGQnKM4W9Jp4TNH
	5KZCsRZFscFbj3dymKWji58FLsNybzljvGndCs0EJAZUtkAc5Eb5lkPewreBSqalSBMKR
X-Gm-Gg: AR+sD11/HM3t6lVqxrEdSxzutQt4o/D4WtQchmoYM5U6yi+Jc8IS7pzAovljHO2ofGq
	FJ7g8dwrwbwd9I+TU7Kg2u78FwpAdF8mZ90IvDM/5i7Vf2yhUuK8m4LGcGjYXwzt/dRd6lpDGKu
	zD/CFEl/QG50V5VYXAizT3wpjmVO5gb5ezYoSI9e9hSc3/NkQ38AXas/Z4DQQqTQ9vs6Ihs/xhq
	3AsMLfKFtVswcgfmTCIIxjF6rsCz+p3Qsm3EkACULsXXpcwjdz8I73YNf7z0LOW3Yu9+cEVeTRx
	ACdx7B4twllsbuxpfTJfmB2R3r2Ylrlf6NEckt3CauErWfrFdYyS6dwl6UuIWtbYOKwz8MpC0e9
	W0+u3wdeypCw71/BcoPQaWaFvVtH/9WUig/1N6iSNvyOn9tE=
X-Received: by 2002:a17:902:e5c1:b0:2cf:c532:2603 with SMTP id d9443c01a7336-2d015f0eedcmr84854645ad.35.1785340624179;
        Wed, 29 Jul 2026 08:57:04 -0700 (PDT)
X-Received: by 2002:a17:902:e5c1:b0:2cf:c532:2603 with SMTP id d9443c01a7336-2d015f0eedcmr84854385ad.35.1785340623779;
        Wed, 29 Jul 2026 08:57:03 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a151fbsm13620435ad.10.2026.07.29.08.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:03 -0700 (PDT)
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
Subject: [PATCH v7 08/17] drm/msm: Add helper to check for per-process pgtables VM
Date: Wed, 29 Jul 2026 08:55:45 -0700
Message-ID: <20260729155609.20190-9-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: I0rKGajaJ3VxnJvd9tNq1JZkaIS49qQy
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a6a22d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4aDCzPfTH0uMOhJcsooA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: I0rKGajaJ3VxnJvd9tNq1JZkaIS49qQy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXy+3x03Z9BWHb
 /b67RDx/kJuQ40+pDTbg3NHU7Ikg9yhjow7xCuwuOqXmTdolMcIsoh51H+LF2ZBcE+tKBDo/YC7
 lgsDuQE2e6LE9c6vwm77NHdGboIX1No=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX2aeWxlfJUKyo
 7RT2vGGfUScEzjEssrxlZ/uIwu2f/40AJXuQryGSmN3qGJHovC2CTTX22n6JZnfixviGG338hKt
 DidymDiVKLV7tHQVgwgNoHPgdbrVxPFCxzsM6gJLWwm24fwM5bYqC1RL1yarz/+9pxP+LJp5jaU
 wo8GYwKV2zQhDr9chszdGTUHYdxUxY+NZ1vxaFI2Tij8+mSaG2Y4iJUR8m3AkFm4OFHu8QOcLIQ
 lXWdWpD4oQ7ubJRrOp2qxEnUNJrNSRZi0Yt/whnkl8CgJQmL4g0wnpZ9AxIjMYyGmip3fzORB5w
 BBypoUFeDC3LVc09tHw0tCTX1aKJYf9uZ5vvL9KNybIKsYYpqVpJTbu6zf+hrlNQs7lMrzCunIb
 Grw1oXIuzA9QwSfkuvrQi7yxt67k1w9sGrOlOJq2/F8DPUVdfBtS6On3L7is+dXHnsyFcnbfkGN
 LM+sMKizMZIgsFEhC6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

This will simplify a following commit to allow lazy VM creation to fail.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0d54141ff089..5738eac9aebd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -356,6 +356,12 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
+static bool
+valid_per_process_vm(struct msm_gpu *gpu, struct drm_gpuvm *vm)
+{
+	return (vm != gpu->vm);
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
@@ -414,12 +420,12 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = gpu->suspend_count;
 		return 0;
 	case MSM_PARAM_VA_START:
-		if (vm == gpu->vm)
+		if (!valid_per_process_vm(gpu, vm))
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 		*value = vm->mm_start;
 		return 0;
 	case MSM_PARAM_VA_SIZE:
-		if (vm == gpu->vm)
+		if (!valid_per_process_vm(gpu, vm))
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 		*value = vm->mm_range;
 		return 0;
-- 
2.55.0

