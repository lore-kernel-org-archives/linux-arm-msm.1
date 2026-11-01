Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555362;
	b=bP8Dw3IfgpjEtwDSbUAkkbkkbIBNXJGIVLFfmdP59fS8Uv+39BPQwqPwulojumhMzGzy
	 0n6N1dS0ANq0V58Jc9LS6SfaDVuEg/pgQKjjSw6wW4ilc10y5rPZIb06n+hE28SNqGOJa
	 Y+Z8Gc8s3g1WQ+4Qa2o/2+NPZmhHP1AjGk5LDNsNbncM8ePoDetc0bLbSOUlYv5D4XNgG
	 Mg9A0S/LXL6Aj81j+5FmXZo6QVRzN5q1fRO/Jwl4PXgX/YyQOEfTydQfVGfR9zLukTXd2
	 ye2Do4ZdxrenKOje8FMnDTefaTZh3aJfODWzWwiWosQ+/dPuTZosBhwoanoQ+MWWSMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yywh0hDJ/pjpr1YR/EkxrAqjq95tRwDr0CnZD4CFXzM=;
	b=mRVMP16Tb8rnwydDpAot+R1NDzUUWs4czLlq0jaIEc1/5HMm2glh33Tfftbs0p7vahYp
	 IAqNQTeT8OX8WiRuRMM7iv32kkcuqsoNEoT9bXN9/NVtQ3D26S2DDYl9gjliSaS63Jeev
	 PqiPvo2R+446suSgt7TJFzJ3rGvmM5ZTyzGp4G6H728NpMe30Hpn4zWA7X99uONdsFu18
	 rM4vUCZLTFVVF97xBr/QEL/yPxa/EL0XqD+M2JyppPgpDXqnt+OsSKLayNNFKqQh2xzE+
	 IQUQuwaaZxba7z3ufIvYtkqf5vSnNzOA0xmnYNvshZ5nDmRL7SPm/cEdRcYWrAs0XWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+Rhihmo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRZThYMX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64209606A335
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 17:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64209606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+Rhihmo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRZThYMX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQe5B1413860
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 17:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yywh0hDJ/pj
	pr1YR/EkxrAqjq95tRwDr0CnZD4CFXzM=; b=g+RhihmoOTsgP4hvhBu5oyBIo6b
	8AT8EQk/67JJs23ySehvLA3TJk+R/kH3LjiL9jz+dysMXOc6dS50YaNIJBfygA/I
	rZd3Rfz9R0+K4MSfDzpzIyqZWjqUNqeGAQyl3enTsRxoWXksFO+BiTK623o4UwEd
	dOGRfIrgDpWn9xrQTs+UFKaCgcAr6otilS4SyVnj4LohD6G1/oNJE22BM0T0sT7L
	zBby7d6e7iiGFyHLkFcUCVO5dIxtY7RrQEfHOZW41VfmJj+VjSZnk4avZxBqRSWC
	QOf8re4XJfV+Oop58a3i+J8lq8283G7rN59kxsbVXuSPThGKGgnr402IwAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2uvtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 17:49:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea71803effso24554985ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 09:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555361; x=1794160161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yywh0hDJ/pjpr1YR/EkxrAqjq95tRwDr0CnZD4CFXzM=;
        b=CRZThYMXgcMPKqylAHZTI4WjXalAZbt4CWkXWv/O14/aTY/XwWMHERY0FawzK1o9lx
         xpO2PgVpet5sfgveRSCKpBdWkC5Q+EB2SdwO67ovuNYEhPV505/7JZmHBqMiXTmeJQC/
         XNe+d3XB2OzOP9xvnzAehgFid/+Rgm8DFLrln+9gr6WXdGxhgRrZ61DgU6UOjNqNAaqC
         jSb9XVP2pAujfwzZav8jyxKZOv2pyT7cADgXAEoO57RjjmDu+pojmbUA9y7z9tAp+ENx
         WThlmvqgHHynr0e9TJeaMzHbw1oc3Ti4rhjA+4sN+A0BtCRl7uu/ZAM8yEzRyRBQoGbQ
         cKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555361; x=1794160161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yywh0hDJ/pjpr1YR/EkxrAqjq95tRwDr0CnZD4CFXzM=;
        b=lsFAArJP8kyjPJXru5LjMko+aynf7fBBF/XEV/PrVcSaRDy+7jiTFkK5dByfTbvcoA
         qJjWwbwfsIVND+G6TUBaD3Agdf6LrzeyPwuu8MRRV9eIIY4SJCVfBdMS0HnaFZpOoGaV
         Rw/FLp+2IW95ZW+QYBA5/uWqRKK21Mszcu1wkvthapmjySF3LE391B8UGfug4fDVMa2g
         OPMgUK1W3JD2Z4yv2Y6uzIK4aZgh9RHOQwl6WhlKeRIhL5JWcz3z48fzMUEquxHtygRw
         u+yeM1cjAPJmyT3eXRlJB6j1smAakRBHII+vQeV1Rrh3B2KRDzc9E2KCSNr03E6Cdrzn
         pnVQ==
X-Gm-Message-State: APuU4Z+OjKdb7zV/nQthFL1ZlAArctUpvkgLmYXwr/VSfA5v68J1enYk
	cQv8QOZkqb1crLlsv+TnuEqa+jktV9kKRaK4IIV3GH9NgRN6QA/g1bdBTS1uDwd8l2Sl4HREdyL
	UmpFcHLCKHKOrGH4x5HwBvkQa4hCL/WislB/iza27Nw492CGkb8ms6Zxqv4pDpkVBIrP5
X-Gm-Gg: AYBFou0w3aHFp9vXAV9bQeibdq7xx5+JzKkCCx5zy+LJ8OLJptps4hfDr/qudlkfSue
	Squ0OvGQg6r1e8798s20ou9qyuVmBJv/2Iz6hyg+ShIKdeBU5OPL4oFNSIw25fGujFzB/Tm54Hz
	3TOPYd4fCJ2KsDEVmMKlv0M4YkJWrWhNA8ie2+oYMTFA+US2N9BAiKo/igUgQe3VHK1Rcdzk3FW
	QYGyLpkhnxo9lv/gDCQlcSjM5NOBCYdL7GeJN29eVMgKQpgWthL8usHFTljKKAuahEG4veMReMf
	7cxj24v3SWIIKS8kp5vextKTxFpc6la0GkT4OuTIRdCBXLSZirkYuTNYOLyOUHEsGx+P77uEyHA
	ufuoFe9uvYeFcgCho/Nf7DnaE9sHdzgw/Kc11fPpPlKrEI3UQiSaOtxCoS0mhJw5ofqAcAdFskL
	CZfwJFTvSRWKHVP3L86IfZi0k=
X-Received: by 2002:a17:903:1251:b0:2e9:8510:6aee with SMTP id d9443c01a7336-2eb36331b0bmr73784335ad.0.1793555361098;
        Sun, 01 Nov 2026 09:49:21 -0800 (PST)
X-Received: by 2002:a17:903:1251:b0:2e9:8510:6aee with SMTP id d9443c01a7336-2eb36331b0bmr73784255ad.0.1793555360662;
        Sun, 01 Nov 2026 09:49:20 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09703b2asm2121905a12.19.2026.11.01.09.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:49:20 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
Date: Sun,  1 Nov 2026 09:49:09 -0800
Message-ID: <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bkfAH-C2YhGGwp4kLeQw4h2rm-C8qbHG
X-Proofpoint-ORIG-GUID: bkfAH-C2YhGGwp4kLeQw4h2rm-C8qbHG
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae77ba1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IPD_lQuv09rAGqqMs-UA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX707Nqieq9b4U
 IzK/HJoSPSmTWvk15kuScqFGwE25sTYG3ULo1f25s7YP/Rz6PD7F+dtnSItHK+CoTxW3huHCfm5
 rt6zjhYauF7xO70MNU4Xsb4Bkf3PHQI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX2YmQaD+ZX15k
 wWfOi9stEmA7S4oCGpW+Z2Fuk4xiQlH7SGj+1NK7i6AiOEXDQ2u9ThLNB6wx3MsUrHwvXh7Dfme
 cC04cCAUym42yqcUNPMcVCbmc4GzK1CnTykHtLxxC+f2uGSaWzKCItE9CFBNtWd/cg0M1Lm39Tx
 aQM3Dtpk4Ynb+VJEAK9PO7PJ5QxnSzzAXTh0XiAGRXDXC3Z+8mW6QeWG/GV1pBlT2z4sR7darX1
 zJprBVL03IJ0y/izwxjVPDTma5k/Tnwda03ReAMiD7vjRjGV03Cbpy0tVspPMolCOvJdFse8pW5
 OG/NMMlyMFZSxuNry4bDalk7IAT65QhKFeddrMGP3ZuqSoHmVruQPxGJrOCBpxJDeaxXIR8h+fb
 o6/fb7528W9I4bqu3NtKSx4Rr2jfHcUekYa0pm0Xg2pdRKaEhroyGl2CekMxTL5s1M0b1AHQrE2
 FHXdHuagH81XXi6R/+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

Use size_add() to guard against overflow.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f687a629629d..16b3870d5e90 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		op->obj = obj;
 		cnt++;
 
-		if ((op->range + op->obj_offset) > obj->size) {
+		if (size_add(op->range, op->obj_offset) > obj->size) {
 			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
 				   op->range, op->obj_offset, obj->size);
 			goto out_unlock;
-- 
2.56.0

