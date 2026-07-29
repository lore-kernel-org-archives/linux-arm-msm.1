Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6A4D8D99
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340639; cv=none; b=fC6DAecy5Brof7N5Qt1fgnsMQFGaupCTLZUG+RyT5PFypWYrZ09SdTnjq3pW5ESqZS0WSht0Jxi8ydMDjzCSYUS2v8TcvSrpD5WLXu7xw8O39P0MbRzZTZ34xLeAZgYVcc5vJttLSZRYwKjy4mTATCyVLveiXrQ8FD3pnuXO23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340639; c=relaxed/simple;
	bh=5jusFGwn3Qm4zEYz94oUfi+TSGTz9Tl8cBbI4B7YQDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtoP1V10hX4tXkh4Ep9ps6GMaN+b+eBkCCNYThNUqZCLKnaiTXwA1hmO8HtxzgLK2lrdWKgyTUX0qk5kaEvbO3bUlrcBGdAxhghWKeJexxgcq2NFJ/cGe84qIrjKzEK26UJjnLBLfNTdSSBA2kozNxot9skLYvLiHYjyuv10cxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edD/tAPX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbyCXReg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edD/tAPX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbyCXReg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF37uZ1962793
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4y99CIHhO7Z
	Ma20JkU9vG7q5Jf/ock0IskJ460LHt8I=; b=edD/tAPXdh3PRCzl2ZeF8A5Au0W
	C7hMgP09AgYNb0zhEwVFeMEcJnQ4NFBF4gW7hcexatTK8vTQdczGEObq5UOpuyK6
	Qd60texAmuRbhNoyyZ4bOpspf59jalVunlzJHibw4AZG5UHvrC2BqUq08SjUOzDt
	HRQsrXI3JtzntdUE27qTWKU59xfygrF1kAmmTsRCDPG0QattencMgCAGUpmrwTye
	sKSae6cptA6caE0OyDNVoVVA+eLIVgV5wmekTniuDpWu/DvrrIZRPw4v33g3q3Wn
	4oNyRFHNWN26PWsObj/1AEL0F4kZPZMrPRv517JG69WuKxEwofqzYOX/Tpg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy919dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so15327745ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340636; x=1785945436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y99CIHhO7ZMa20JkU9vG7q5Jf/ock0IskJ460LHt8I=;
        b=IbyCXReg99mKUQYPBplqSok7pYjz6QFTT8kUPSpu6z2NunNQMhQ6BQ/N3PlAJ8Q7pG
         6YhTj5C0u7XVMnvv02t3tZXd88exXdsk1Uk9x7LRyV5wIYGOsh8eTOHsuR1elcqOjDwa
         Zc1svznOscBftxnbFgm1jey2KKywz9Xmqt7OUb4gz+LQYOSoxENyKLg7gKEK9mU1OQ71
         g0p5Ve9qb7qeoQqCSSx52mmQrWx+ujyNKEJrnmNCRxI8GcQ5+OPZCQwZVUJqG9z6vtL8
         bntNqus8Mr0K7XV8xBO6AXgx0H9xpvwlxPqW2EpRcSKmlWzpQzvGuCISnNVkk3qPAh66
         bswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340636; x=1785945436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4y99CIHhO7ZMa20JkU9vG7q5Jf/ock0IskJ460LHt8I=;
        b=iJq4Q3eramoalZx0RbFOheDKc1jcA4qFZCr/hFh8MtHwQQTyZOBQ0i6GzRbKfFtVqK
         49qIXaI30o5CftbHc9CnpDS+CfsE8YLqYViBdBvz3b4Tm1rXsviv6G2cwI2DzEEpWUX9
         oxdY8DpVNxNt210gCfR+O6onSJS0Um8bf5vhxbdgyWl4MlIHUmk0H1jllxN54jQRhfG7
         oVhYp8Ui3mIlO/HgrJNjs0CwLjeHmyxH2imeqmIysxFRSjDtHk/LPyy8E2SXkBDdW0ZA
         +DtvqwAD0/fNpO+F5ayt/HZQvXm5eNorW/TzlUAiR3+zaYNf0vIKXoBifrE5gY50GWoc
         +Vww==
X-Gm-Message-State: AOJu0YwrSBehvVuX7aOInkZpadof+q2NLnkQa0qPHtb5+IJ0MmpJ0rfY
	AfHizIJypD9cnVif7IL4eG37uVZSQlFfg+T9jWdmUiVmQCGVGuYtU64w0K0WpFv4NMBIr8xmkM/
	4JlezbyJONE9dAMqi8R1Znt3ajE1CaykDqFX942ofsWndqyQvU3SuazVQZE+1I7W/Yent
X-Gm-Gg: AR+sD12eZ+qC18VajK3BgDx6blhykRN5k3EFJDN1DyLdR5gXbJyPrAg+8wIn87ceGpO
	E7wkOom8GdECtYf0Rx307FWEr8P7spzuJYIRaI9EQ1NmjzIRg1bqQrXHDRCGmwJJEKX1tPescIO
	jyiqfJPQWT96vjxBJfJ1pKR7/9uxHHiEe8PAni/eKiH3S3aMiRyeTQsOCQU/p8niC0DAFLMvMd6
	o72Ppca3NqNxtPq4DcjUpZjQSfUkRXyLyBLoRQt39QeuBZVoT8Ek/jvz47WG1p7ewi1p21edLd9
	xRj+ShX48PwIaW4xRN/qa+h8Mb2GpQhTMYrQt/JP7ovmFZ82UlJzRJtmTjtQeoGpKf2haVThIR1
	DSyRxvo7Ldrq3gW11NwcwzAJTBgB5gFaElsGy8C1q6pVuFcA=
X-Received: by 2002:a17:903:38c3:b0:2cf:b330:e0e8 with SMTP id d9443c01a7336-2d015affaf4mr86146445ad.10.1785340636240;
        Wed, 29 Jul 2026 08:57:16 -0700 (PDT)
X-Received: by 2002:a17:903:38c3:b0:2cf:b330:e0e8 with SMTP id d9443c01a7336-2d015affaf4mr86146245ad.10.1785340635839;
        Wed, 29 Jul 2026 08:57:15 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a15303sm13735525ad.3.2026.07.29.08.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 15/17] drm/msm: Don't fallback to shared VM for VM_BIND
Date: Wed, 29 Jul 2026 08:55:52 -0700
Message-ID: <20260729155609.20190-16-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXwqE/L8RUyQuT
 lQ77eRdUppDC5iUTrMVMFBH54RIjk3KcoB3taRWyNnTlG4R+UDlkG1AJFNPLAxldmk0dIhTA+NW
 OZy1gIFAI5rOFdGJH+XOOK/hP2FvwP4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXzJWGp4KuMAxN
 2KUDlA6OuPFQSIqPpJ/0RoDGUjFDvClbLCWEPeZns6Gfxb40LE++/Rbfp/llL9Ay1LJYxBfsFCR
 9j/ZM6+ascu4s2EHAr8G0qU8rNc+ZGudI3nj8D40vjKz6sMzKwZwh9eix5fg/L/ZXd9dml0tg5v
 tXffpWkGrqowoDEKgWd5YMbcfrtUzTeEAZuGvDb2TBUScbZpWm6n1m62pndf9hIHYnTKYEEeMfT
 kZ475vwvKHrc+Yq8TYeKjerEQ2Vmuo8tyaaJYFyLJIvbVZiri5nG7doy7VUNcjykVTMmyJqNwJB
 81ea1D4P3GhwtvvcECKVWOPrdRqgpy2l5KGbwCOGuoGpTQXabx6RTxx/gvCIsVqaciwEY6ltP2p
 08CGFQLaqjLeLZjwTmtFO8gFJZbY/CCn2PUHCnvXWe2qyVB9Ojidhn0mut5WrFbIFceqebDy9mN
 sNAo1gekgccifPwKVAw==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a6a22dc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pYkFtnTWYdhsElgv1Adb3w3DMLDh2hyT
X-Proofpoint-ORIG-GUID: pYkFtnTWYdhsElgv1Adb3w3DMLDh2hyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

If the user wants a userspace managed VM (EN_VM_BIND) don't silently
fall back to shared VM.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 52ff72d8e17a..73d99bde26f1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -234,7 +234,8 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 	if (!ctx->vm) {
 		vm = msm_gpu_create_private_vm(
 			priv->gpu, current, !ctx->userspace_managed_vm);
-		smp_store_release(&ctx->vm, vm);
+		if (!IS_ERR_OR_NULL(vm))
+			smp_store_release(&ctx->vm, vm);
 	}
 
 	return ctx->vm;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18ed00e5f143..a1c4adcac128 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -875,7 +875,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
 
-	if (IS_ERR_OR_NULL(vm))
+	if (IS_ERR_OR_NULL(vm) && kernel_managed)
 		vm = drm_gpuvm_get(gpu->vm);
 
 	return vm;
-- 
2.55.0

