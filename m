Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F44D8DAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340640; cv=none; b=itpmQT0ZbRmnwTpQgqxzJFxSOLEF/xg8VeMqD3Rk687GTkoOkN0J4gdgcbq1ToDc/CKK4+E+lMplQsGKoINhUl8GWILjn7KIL4mTLvn0LShJixwSncC09a1UgSLEgjV8PWnoz19ZCsjtaC7ol7bcYqG9+8XaUChCEC/kY4lS8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340640; c=relaxed/simple;
	bh=E9lhuuPceEzcrtwxHEW7FLrBs+KDkPNfNChM1KDD/e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bH5XegBv70g3PVYIWj0J/DyMs4m9gPlCCB5MnW1ypc+V1xUGsfTpivoLIDeTUlue8nbSmWgS5EjSsDaff+ZwBI/fx11ujXzyvIA16omI+ISBriNA6O/0OuJeVcBoRJFs+0jDnjprKQ95N3NjSZGOpVQsfXXJP9Tcu2tDQMBWGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pW+bK2aH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoHIVNzR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pW+bK2aH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoHIVNzR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2kip3341870
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ILFLFLBAWhy
	u3kdv15Hw22354Io0JE1gAt8uUSQ6n/Q=; b=pW+bK2aHM6gpsPJChSxO444MgfD
	SrGRMgxj+HFL7BSwksdrxW1c+iyGakrRJGMJyxlU49/Xmh+qwbYnFnY/5Mhmm4YT
	wr0DEEAkPF0T0qb44u0bFkNr4SWpNpvDGNE+Q1xBiADV7eMJxMVzHClQVcwsJ4GN
	69e8lKWw9iMLnJg3IprKrjzVcHS+Z3Z6uFeQzAkahXPjDJPjS07gKpLfOHEKizAC
	R4QpRRqUGRt08hSQSigLE9awbEVH4rsSYByeQvE6ubcxFoNOJqmmFfIDyYVzCf/9
	QPiETycAn+RNl4aGukn+xUgBa9UjJycHpoge+KMLcQ3akD9cg2V5evoPTdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3ms6ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so20380595ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340637; x=1785945437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILFLFLBAWhyu3kdv15Hw22354Io0JE1gAt8uUSQ6n/Q=;
        b=FoHIVNzRcXko4puw2L051dzNQkR6Vj2gQOS5LjAx0jS31NSE/uE9d9fP6xYjxiKXXC
         6Ahz3ZPdzsPzffGMpjQr1ClNI+j1KK/n/vSr2jH9lyBepmEsFLDHtL2u2TpiqIs5A0KI
         qWxGSGkWCPeLlpryQlH0xTt0H+x10VgPGA2V0Hp9nZNc20XI5bQYIn3xkknBlBVk119n
         8ks/6Ywjn/bwwwgLX3yk7xQn4cj5m8EWG9JCnFkDiIqo+vbQS/3QXGqnbkLySBrBWzFN
         k8+ZwNLXemnAiPrTLaY/NaPSKJ+TWC3kWRA+OwGVkALeHdjh+zb/4D4lBpbt+0Dn+zsl
         BiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340637; x=1785945437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILFLFLBAWhyu3kdv15Hw22354Io0JE1gAt8uUSQ6n/Q=;
        b=B3dHkxQeSukzqukJn6gKCMCAaJJZfA1Iu6tEDXVUOYik/n8SO0kHDa2imrRdpiHhY+
         06K1uZ/oULd0UnbeRwNdgQ8I5tFpV6sedQ4UVOE3uZqKzzqKoDt5F6DdjbEQQswfgDYn
         TZHNtTidroErZcWCbsr0tkXTk/fLMJTOqwsKmft41+gAcNrIHc2UTOnnwWxnekckv+aN
         N5jasZ3R2hDTLVOzfPfsDTjunR05e+u73OYdBgmPyWlDQuNj5jHBZskNqKnCZku+NbBs
         jpp7gw/g9+w2OqGpVHjQco16vEzbLrKqdVq8W8AyDZyV56r3q7MJKcA9vAI/UApH4ngP
         dOfw==
X-Gm-Message-State: AOJu0Ywg5q5oHm4TXM1hqdZA3YZHVqt75aWmmR+smVSoMMzu2FUeIkNN
	SN5VyyXqJS757zN/bHyhtlx5J0gBfURr5IO9Uw0q5tq8OErcMlquVB30MseKzCS53mWgM7DCWt9
	c/Be7xAye8hxxHYsmxFLi/Xc09gDxgDUF/PXQHnv1fauFvB5XeksISU1p4UhoZ+zo/CFX
X-Gm-Gg: AR+sD12qu1haddOSkdpUEBpjuup94yEdfUmLOfAxJpuvLPYkEXz81BHhpUYZlAt1uLm
	eap1RWwjA/v6Am7yq/kEP2HsoYcc1ZYcgc3qXDQuRZz+QD6tImyoM8vgTiOI+597su1HGv1tupG
	CmbZVKzfjIUyiikCJUcOGXslOOoduFTd84KiSBfe+2sZdeDuFkzokhxacJvj8CqIKFL0jbxoels
	wHKZ7M/m9Gi5n2Fv3uyFuBKRV0A10aWKqBn1zUF+tyNgxcZnlh+Av5270J2UTXNsPAKqLv34PW/
	MltP/k+H7ZZU851f/Qz5Tsqs9vnEDUCIzIAeZtY2HICHpqBuw/jdw+tox3UBZ4jkuVZ2JMtvJ94
	LwRAZ0vu63OKpUPzkUg0BLWr0slgRtJdE0Y7nyjS9wMgMCaM=
X-Received: by 2002:a17:902:c94b:b0:2cf:9cf2:3533 with SMTP id d9443c01a7336-2d015a83b7fmr82751075ad.18.1785340637578;
        Wed, 29 Jul 2026 08:57:17 -0700 (PDT)
X-Received: by 2002:a17:902:c94b:b0:2cf:9cf2:3533 with SMTP id d9443c01a7336-2d015a83b7fmr82750725ad.18.1785340637166;
        Wed, 29 Jul 2026 08:57:17 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a167b5sm13576585ad.7.2026.07.29.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:16 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 16/17] drm/msm: Fix per-process-pgtables check
Date: Wed, 29 Jul 2026 08:55:53 -0700
Message-ID: <20260729155609.20190-17-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXx5LYJ4unIxJC
 0zxx+f4sVD0sv7dzHuFYNTiEjUFNZsCogi/gYHaSXPB99v88FAcyIoa7JEBwwbaGZtQbbE7S3oU
 V1AFsZKqdGF9qL9crgMiXi/tZbLCxFWZcxaMGoeTgJyFupcwX86YIE7rZpezdMuj+6HHOUmQUfO
 +5+e4n84+FjguX6DcJ0Sj9IiQ5sS1fLOhU1Vvu7mcLbfa2xje7WZ1JogYxkC+L+6b3n3Z9Sx88L
 2VbZRU6UkQf6h9FtHVvYex90179Cuc9mAMtndWgSvXqsnNGuTwCxB/kmKE44WUgfvD4gsI0bsYG
 Z3IPhHabZX3ANrlrvGO7p1ro2GDH+YZHSK5fb4/B+bCDY2eqcuMiC+QYtw16SLhhy9ykXpMmRK3
 gpWSqGZEXmEyMyX3d2n2w6QG2C0GvDbWWZbSnLefVdtQfT2oNnZAch8A4Vyd/SuhB0eBHhhoyGZ
 yfdfDF82e8tdnEED61g==
X-Authority-Analysis: v=2.4 cv=F49nsKhN c=1 sm=1 tr=0 ts=6a6a22de cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_1v2yp3k2DT7xr2y9HAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: g_pOSqWlJRos5CVA1Yo8d2jbP_zcEpFf
X-Proofpoint-ORIG-GUID: g_pOSqWlJRos5CVA1Yo8d2jbP_zcEpFf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXwjvIxPyD0xH6
 X1venQUfVQ2V3d/CyFox01nxhfWOv6NYpIQKT3sBrqKVVIE5fbAyHGflE+TGUTxjMTZP7MEEY0V
 M+qO11vJ+FvT7ymDgwKd2L5A68C1T8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

ctx->vm should not be inialized yet (or if it has, an error is returned
immediately following this check), so this isn't a valid way to check
for per-process-pgtable support.

Instead just check if create_private_vm() is supported.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 84101e534ebe..3370cd44382f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -513,7 +513,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		guard(rwsem_read)(&ctx->ctxlock);
 
 		/* We can only support VM_BIND with per-process pgtables: */
-		if (ctx->vm == gpu->vm)
+		if (!gpu->funcs->create_private_vm)
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 
 		/*
-- 
2.55.0

