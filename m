Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C0E348C5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232966; cv=none; b=q3q1/YIm4k0RKKpw8EmcufuTDpqiUteAOW7Zd+Ugiq3m0yFM221qF+whoqL+SogrcgoYu02khkRG3YhlEph+SiupbRhw6TN9PcqCsPEW6D7CLDIgVcVCsh46ex6PLkcKSBbXfCy8p9fgMGQju83aGw1RD57P7+Apr/57L5j1gZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232966; c=relaxed/simple;
	bh=BIEYTFuB75r+2z2PSfxl7XWWnk2BAVfT6zAz5sKAhjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qet+o/f7DHubjWkW/wBSPJwanR5pOL2IYi4pimJSny1L5FYCwq31rLlDtooi4u3fTKgYVawyfyMbZR1b7hze59FQw71pJ4w1es4KvL1yr1Pz9Wgde6XtM+qc6PZ3TZcCDAD7zQNk+1U9RhRcdAYlANF8oSoNpzlhS8tiYA/vhIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1jx/h6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tj/F4QT5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1jx/h6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tj/F4QT5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJoDOP681323
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lVmTyponL2t
	d2Vgd9VyadgypYllVDsYovlktjbjmFb4=; b=Z1jx/h6ECaP+0UGsopfv3e3DiHm
	kZaweQRbd1+x3BgyE/UNPXYUEQT0MHEjj7zmL5Q/Jt1gBWwjFZkjGvnlj1DXY8Hf
	GvTHW9XVhzW2jDiwV1fEC/txUDFbG2li6kGYBkWxgjUEvMOCImV8TQris7CYLxzf
	p43BHp9QCHSqwdGMkM/szJKvPr1TZn2fo8iHJFbGqSJpQKpmNxH9Yr1slKi7zIS+
	4bJ3CLC+rOIcHBcCSPhBhHYHofxyKBDzkxOPpqAL8jfWLlbVr3+fRTAYts5yJxZG
	Eg08bXAyzUzn3YQrsjdwINJWbxuNPs8cu8J/LRe0dhHUsE3/Ipa02xdH3IA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6gkcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:16:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc101287aso8089473a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232960; x=1784837760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVmTyponL2td2Vgd9VyadgypYllVDsYovlktjbjmFb4=;
        b=Tj/F4QT5HPeC1dRwVnhr7/FFbCeh7QFRJVTX+yle3s9wEy5OvGs+HeD2cCF4AKa56+
         VpqDwg4hJTnGW/BQK8+MnmzaJcQZ5Q/Q7Y4YFO4Nt/YV23efclpj89kgOysunFyyMENv
         BJv4Yro/rJwa9eTvgh68dmcfbO2pr/0OsHp2hwncRRDjg0e0ZvgQzZjc7SZ5s7QdwCJ8
         t8PJF2ObVgRIQJmX0/QdY26T6JUIsRforXxJPGH+ncANRdl/B2Sc4Lk2RoxPjUhcEn2i
         6oHpGIjUgJzGxaHpi928Qx/+1jvFbAlKCh7brtzUHVkD02kLQ4YC1zzxPsdZmDIq57x+
         0KJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232960; x=1784837760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVmTyponL2td2Vgd9VyadgypYllVDsYovlktjbjmFb4=;
        b=AnPqLThrV7RUzVZyXgBtXzJd/LBODiKaMkwjDSXF5np/gYLtktWHtuvmo2OqkKaw4n
         v9SpDXbgTJ9kKyN/vVMIiV4HrG/sr8S4TT9FdsNOHE0SsCPvZ9VORWs6zsz5HJ2N4xGF
         0hnCuaUH28pGJHqHFQqyuf6hvhZZKmoKEUfTBuFiIb9UW28pdTYv4VeAronFLCtGZftl
         fDitmmZGTSJ98pcc5GlptDDJQzgF6TqUG3VZALzhO7SMuUUCHoH8hPCrZ8+J1lR7xZyb
         OfQ2FX0BF2YdGgzxm1IYOwQLCK0PKJW0+sv9Hhk02nZFZ+ncKep9qOjuMiJn07SbPi8U
         zVOA==
X-Gm-Message-State: AOJu0YydqInjAkgkY5Koocv8Ty2fvkFgoRFvV+r9lYAPubmrYNxZR8jX
	00+wJwqmHvAwBmK3LtC22awEoKGQT7qMfS7akLQ3j+smh/0iX9z3W6IEYA8m/On68R9OvmWsYbM
	8Xe4fCJp/IpoKZc/oEyYDM97N3mIJh7ifMETuoOWjyJrWEkB8tncywFMZGq0iKgGCKI4T
X-Gm-Gg: AfdE7ckOGgl9N5ljdgXmMjl9hB0gKYGyoJJXLl9++uatUOd2AlRBAGQcPmuse+COtEd
	YRCuUjkIPnAwMbEAG94+GFJBzA13swrIND+bNa0kpDi7Z1SNv5bCGBwbwm4ijpLYqFNpnSP/ENQ
	9nxMVdv4zLUWdTITJODwK5PBXBQ1zRkCHgvA70oEixgaDUrRfdzVUddrSH+f3B6kPENpudC0i9I
	CqZRhGPmeUcbXgF/a5O7MddFy/23KNDUPFNolXxoIAoWpDcdah9JGUutck0iuxLA+oXuPUgH6rQ
	t1Mxx/VbPlHd/Ys4rE75TSTkZIh0GuZvKas8NIY0lr6iTU1b8qfVkr75SCNtRhPtt039JMmclQ7
	ieEEGSjICwFpnJW+ucfFQoiH32mfU9xSpuKJcVE2+IdB6EuY=
X-Received: by 2002:a17:90b:4c45:b0:38d:56aa:6f32 with SMTP id 98e67ed59e1d1-38e17f9e673mr12368734a91.38.1784232960542;
        Thu, 16 Jul 2026 13:16:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4c45:b0:38d:56aa:6f32 with SMTP id 98e67ed59e1d1-38e17f9e673mr12368705a91.38.1784232960145;
        Thu, 16 Jul 2026 13:16:00 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e1b8c4sm1804137a91.6.2026.07.16.13.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:15:59 -0700 (PDT)
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
Subject: [PATCH v5 08/10] drm/msm: Validate lazy VM in GEM_NEW
Date: Thu, 16 Jul 2026 13:15:31 -0700
Message-ID: <20260716201538.365824-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
References: <20260716201538.365824-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfXwcIFgOpHTs2O
 1dhhrFQ3QlrmvhVALrIpgBWOPgSIUj6O9M9WrcFE+TqphBAb1waLxNFj9LX2EW0+n2SQxpCFhWi
 HJlGcTqOXZeP5+8sMBOY34KXs3ytv6NWCqiivGitMe3zelF9gup0kXnH+FFfiMQPR644xyolsNf
 Wd4IW485Eh/7tTGY1Dcx6ZO4/2jkKMYFxiSgs6LBQR1b4rrrP0/GmLs+1V1RhQcAwbhM2/cAuzi
 89bXm+CCCIVWLtm+pLk3yT9B77TF8Dx5E1W13eLNnSrOTMCxvy0E2vxkxx0nMp4yL9FIkg903bN
 HSejGKKoALwn3RIxOjTvwlInaYUsfPfZChyTdNgX0npAQZKaSjBN2KuiYgbbxCbMyrTQUVQjNIR
 EmVSzrPKKZ97n/oufCzc2qN1uRoD6TMt7VQHW3VoZBRTLo1gttaY2Z66RMHv7NVMwLgZo2WnFxp
 AEjKzbs1SjtLzL18RLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfXyKHdzxng5Rp8
 59NPuxLh0k9gGCt3ov7A6FWHKiH/K9DB+t9KaI3RE5OhDmxQQVHfKYiiQmpPYenR0Ospnf+IhJv
 ECsP9Q9l5gXJ05Gf9Lw5hH8ocuQEyZI=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a593c01 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mcLY6QNbnPi337aWdgEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: x-8C_NOhnYPQfpU57Rn1C6gmSAzVFptq
X-Proofpoint-ORIG-GUID: x-8C_NOhnYPQfpU57Rn1C6gmSAzVFptq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160206

Otherwise creating a _NO_SHARE BO before any BOs are mapped could cause
a NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index efd3d3c9a449..afe0373f693a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1146,8 +1146,16 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		msm_gem_object_set_name(obj, "%s", name);
 
 	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_drm_private *priv = dev->dev_private;
 		struct msm_context *ctx = file->driver_priv;
-		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+		struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
+
+		if (!priv->gpu || !vm) {
+			ret = UERR(EINVAL, dev, "not supported with shared VM");
+			goto out_put;
+		}
+
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(vm);
 
 		drm_gem_object_get(r_obj);
 
@@ -1157,6 +1165,7 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
+out_put:
 	drm_gem_object_put(obj);
 
 	return ret;
-- 
2.55.0

