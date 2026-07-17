Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82283A9DA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321347; cv=none; b=tIVvn0wu4K1HfcMsYZai63ztmmi4/L8axWscnOqbTS/8+JP7fCeluFEKwzbXKmF8Z/mNfn4USc6A1rOYxNJrvb6SLBUzL4U7cq2J88NT2AZGKNyf8d4RPCxl3ONFDo2t9kvAEHnVrEU2kej0XAJ0rzNTFk9S1ViKNq4Sc0FWJlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321347; c=relaxed/simple;
	bh=FEVhhN1Tu7fPtcshXYip5B1GaOhw9gRDyazaGKTnIDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxUGnkcCU9UMd89oHEUETDIHYmWQkjGz0xqa+AtBOvl5O/ii6/NlQ4tEdw9+oliFZ5PzOyqdXET47uwYW/p9FVrU1WzwlIvyKG7btGtHn9ncok2cnrzoHb26SxNWLpPXjcNYgfbU7N0XMiCkROIYDfJtmZIoh/uLds9L0gn1MmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzgWMNtd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oj6q80f5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzgWMNtd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oj6q80f5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtXgo2652977
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L6JvWLUmlfs
	jBa14lcBw1BoSx1fLycflHxKxG02lUBQ=; b=SzgWMNtdFSoIESyCO5ht+jZrHyF
	O5sn/pAv092HvPYZWgrMVeoKHhKhpf34fXHihPIblOapjZRvlQ5/RPiO0MGqFKKt
	F3WT2T+LyS+pofMxyvDHMMawCa7bVZ4CLnl5Pf4Sdmyr1Md4R7qzHdvqymUObzI8
	b8AXf/Be9SIvGpkBmJBXfFPgLzC9NxpSct65KQ0ZWKRQvSveXSXzbu0sH1hdPwoA
	ECGQi8dQnCHo24mM53GrX7NHJWUMNuTkFX/FLwp7tjSMvMOTUHioUkNghPpPIhNj
	5AYJRGRTi2Aw6KWFO3sqYQqsCQQv8ukJv8N44PNLmD3Imww8QXhm4Ko247A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9pb9cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:49:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so15450615ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321344; x=1784926144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6JvWLUmlfsjBa14lcBw1BoSx1fLycflHxKxG02lUBQ=;
        b=Oj6q80f5GFs0ttTACXIyNLmdUWsFK5qTxSdoSXLcNXVBQM5vjgRHtnXYLzvUYzaDy+
         g+/YeispnAbCZ5QI1ZNV9n6RxObM3v76a+8sBgYWQG1Nhd1ULe3vvQE/X6eKRVF+qXcS
         Sa1W2QrSpSYj5mob5ywu0pspzvqVq2xYBBkUkplu0PQTjHW417M36evNk409/HCTIhmC
         Js47d5Z/r+ByGfcWKUjSSeviGJVjDEsgZlvTGfXBf8reTbbmKWiKU1DzPTEjUayN0Dkb
         y/hC+NWxaIy2q2lxT+V5aBzRWZnWf258xwxXAjiz0J6m5Sc9hlhZkL45xTpxAfn2o4O/
         5mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321344; x=1784926144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6JvWLUmlfsjBa14lcBw1BoSx1fLycflHxKxG02lUBQ=;
        b=pns563jcupmny/+lD9jgsWoCFeFAAsYE0AslqdOuacS0nYOEM4yngTX+CZLWWQgdah
         YrcNR+L4M3DIt1exdtNV4+/dNQ+flh9L+7qRzRDvTJm995LOiax++NmMhS+HHXlNGsj+
         t5L7rARJIBhQj7qsOqCvq5yKn3ovVocNZmjb9D0Sa7nqTkx7DtUDN1rxsD5ff6as61HB
         GBkvty5uYz9JSGJ7sLe3VxAA97g5m4vsFlLGGiUgq26pfR7PVuaKq4J5Ftd+MxS6ArwF
         8O4QMhCcPGYNQkny2N5Q0IWgHuIVtBs4c5oMWTJNLVzHwPZP97R4r2Jah6RXSvK2MMMT
         MgZg==
X-Gm-Message-State: AOJu0YwFEzQHsHP5j+eoVpaf5bB6J7iPjTR8z4PduIa2/iERFkqPJ+Ou
	C3y57g0VPLKrKfFlJlYPuSDTDdSTWZscL/Y18/01ji7YF+6qrC2QwKW7yRSwwFQDb1Z2YZcn/Q8
	9TKvVSBAfjwAionO3+f623CXyUq3hNHbTaFEX2CCn4M/qXJwAhY38dPNEmOoJYAk9HS/6
X-Gm-Gg: AfdE7cmpHr8DGHfZPb56rDQNtpvTr//fUGSQcK771sZwtNeBKY7HMu0Iu8l6vXOaDA9
	YStxCGjJVJoyoAWgQlyG9pTV5heGr9wMlOQXdg5B/jnSwmf/ejhLysmzjKwOr/OgQnUJg6zb0gk
	4WpVsiB+BDLg1ryWF/dwvFpDH5iwfyUZqL4zwHlv+fjQR83c2zSNObjXp21yzSGGHjq0XeXTcRD
	oyi4ciJoWoxazkjFD2bX5EYnLqb+iXaAq+TiZeT/7FWkmrSVeYfTe8poHpFYRLM0YR3ZUWNv2K9
	Ex6fuG4FXcQId2LFGzd0of0HKMUAZ1SZwDTtWjVJpWJN9miepPL4wbIu0ApNVoPEcWDsEXsPJly
	IvQBGD4KTBL+hYUTeZg9owgNJCG46Fpu6znQfiTq9tYPzaiA=
X-Received: by 2002:a17:903:2ac6:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2cf1f2e71eamr96843015ad.11.1784321343728;
        Fri, 17 Jul 2026 13:49:03 -0700 (PDT)
X-Received: by 2002:a17:903:2ac6:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2cf1f2e71eamr96842585ad.11.1784321343258;
        Fri, 17 Jul 2026 13:49:03 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1ef8sm17884615ad.21.2026.07.17.13.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:49:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 09/16] drm/msm/gem: Remove useless locking in GEM import
Date: Fri, 17 Jul 2026 13:48:25 -0700
Message-ID: <20260717204841.26120-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 5VU5GpBE2wjQDsZU3x8WjCvoUKv8N7jg
X-Proofpoint-ORIG-GUID: 5VU5GpBE2wjQDsZU3x8WjCvoUKv8N7jg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX2jj1PsTF5oBh
 RcYUDE/RcfV6SvJramcCM4m+DsgEB0qYv4mCmz3fWccxom7PloIhFtkMSN3UGW9OrI/bCYlLGJ7
 fabtj7jvMrkGVCCypjmt3+PcBzB/5dnUka5SuAyMyZwhhJ6h1UPti21hxl+TIwxcNNawqbRjHc9
 JnkNTN0erlrNOTrwzAA3m9g7HwXZ5RId5N5DIMJRraJYUsJjuYmftoE4ea8jcSP+NazINF+30Vk
 jEebfkXS7iiQWUPYzbiYAz7obp4ce2vvildzyEMzSI3vWqW196Mqe8+PFsL+9bQ/nIXwRMYLhPT
 iSmgDsk4euhMKHrzdThmPrM63CtYpjrjZlkJeQF7gOuVBp+epyvj3C3H77gAp/EPGvltP02SoYM
 NIykE/oRkTnIb+1WOmucgmQ4rcF4yoUpyMpg7GeoOZ/FshvKZRXdPhbnTQ0ZL6UA+oKIN61h0hW
 f1AdJdpVRQDcyigLEog==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a9540 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX0MRebZ6CdqHL
 hggLdlqGcVla/uHuDEADM7HSXKWdGg35UHfon8ae2GJaUd420HROgov22bUszIMsl2nHNpCmSgW
 60Q6v/GoEkqphKMVVmMzdGG/rQe5mJk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

The locking has changed a few times over the years, and this extra
locking was the mistake of evolution.  Harmless but useless.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index efd3d3c9a449..1aa844ce4f2c 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1301,23 +1301,18 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	npages = size / PAGE_SIZE;
 
 	msm_obj = to_msm_bo(obj);
-	msm_gem_lock(obj);
 	msm_obj->sgt = sgt;
 	msm_obj->pages = kvmalloc_objs(struct page *, npages);
 	if (!msm_obj->pages) {
-		msm_gem_unlock(obj);
 		ret = -ENOMEM;
 		goto fail;
 	}
 
 	ret = drm_prime_sg_to_page_array(sgt, msm_obj->pages, npages);
 	if (ret) {
-		msm_gem_unlock(obj);
 		goto fail;
 	}
 
-	msm_gem_unlock(obj);
-
 	drm_gem_lru_move_tail(&priv->lru.pinned, obj);
 
 	mutex_lock(&priv->obj_lock);
-- 
2.55.0

