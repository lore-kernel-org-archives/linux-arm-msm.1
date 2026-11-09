Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234090;
	b=thWvFIYf/KWAeZQF0UK9b76+Mi5JLfpX7PlPXOBHMrlqN5phOHPXi37eDBCGbQvJwvoS
	 8owdS7SuYlsO4ofYrnnxxCzVBRcLRdS0m12gYNWdb98IS46lIQMGHogBkszFkHFSvpIdO
	 vfExM5dWIoOpVd7DSlCOywe859xAHwdPAAYKdGiBbFLH85SHplyx7Xge7Tt6l3MlvuEfn
	 8KAQ8WuZyNN9YAsHIV5UzNPrm4QbSYp40tRx4osWAaH3o2l5w2YfuCDzsTXnw66wjNput
	 NlrxUKsKMDVIr7SeUes2qzvJ9WiXwbX4lbeJCJXELj9KW9EKjn0fP8wud1aoz4V4e7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234090;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
	b=iox4OJeQJ7cXdPqc5kNBxobSHUF7qODqGM/WaqfVfitxh7DSf2alfVykoTwY8FVBWUya
	 Nw4CSqUp07E/getQp29rD/oDkmX/PUMOFMSbdOrlvad8AJpOZn2vvHONQKmAnhXDuqh2U
	 Tlb6f4nFDHMbr6OjiEoOlxTOLQ05gCBNeBufkZ73Ygpo9sLQCdesbxW7vpdbUTCtbzt+6
	 f3xtxLaf4WvWQs+d5nEfyyDDr2mcLxl/2LwkKOvZb9MeLGdZovw7P6xqhdnUOi2XC1Kkj
	 /s0EVBdERPMSlz3xUye4PD4vZKQKI7pQyqJjtgEsAfG4YXDKS+uA6o1Bx+i4FPO9xpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EW0B4fC/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TO8ncNhq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09503606EE8C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09503606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EW0B4fC/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TO8ncNhq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFLMK971519
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=srWWDrFCDRP
	ROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=; b=EW0B4fC/QDZC1aagVKgphxXkVXD
	sZvuRSbIb2abWe+ZD0XMtxLZ2lu5jt3fO85vMF5gYfLR1C02URSB0qI/fkEyS7ur
	nfxcLhppzXKh5lReIhNuS93O7xCg5yyyGK9Sw/NCfTmhVZoKmJem3RvNA54f9bWi
	zAIBeKBfR0pPopwX3KbYrU+9/4Ndc3ZR+IyJoItE+U7tn9KtYFKdyPn9jcakDNfo
	RvIgLmI3rSRRAFWxX7JJcd54QYRiAqFbs0S+geXpmRI7udYtt2q/cdYuXTYL6toB
	6xHn46xtFshVu8bcCInqLFslgcEDkNh6JGHjUUlACz2jhHKRbHW5+hzIyBw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3h43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:21:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b97460a133so524548b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234088; x=1794838888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
        b=TO8ncNhq30LaTQezUhEks0gro4i1GvrFnCWCdzlKyG8tPTFWahEmEWVBq4KXl+DZMQ
         rpJTab499itzGSt9i0QpeTz8il39QiBhmo0J/9fm9/LH1V0Pt0ZGWfJ0jCqbE65tbl/z
         cuoF3NyUWEgAmfhTQN3EqBXtn6FzfJ5Q2yuvp9fnMzpN1yfCovtIkZSnRhJzDwmW2dzn
         JmoW8eAjZex9YGCg5nUEwUl8I97mwE4ppapM0koi1YppY+he4Ef2U648FnGen+k16VsX
         cNCPCae4Li8IJvGUwLTAx33mTD2sxHgtZVuv+4VIcdkeQ36SUdbsD39JEihAgABOZQR5
         /2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234088; x=1794838888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
        b=HwQyNcyQe3FC/pvMNacHxEVSQJl5QNRtqMlGU/YSeNGX/SQXwGKXPGvgxJAdWc2ShW
         23OypZIV4CEe+uHjUsjdTpvC4evN4heUKWOZHnb3TmKcZnR2EGZYhxWjv2IOD6bwAgBD
         jQ6MC9EWpH+f6jB7LuQsmF1ftCnVGCrMzpJ4Wls5JP9ifxe8b+j0P0OFpd2XgYHRVOjs
         uoLh+xM7bGlUEPVIOC5FmgTDDlIbESzMwGal+LwHCfZtlAZHZt491I2r91+bfXYpN9xl
         jLRZ6obMJTWo5i8F9VYg0SHb99fT+MSB/i5Iq4DkbJg19u4KrcFc0R0c6eF1GGcr3V5i
         Q3WA==
X-Gm-Message-State: APuU4Z8ioraaybgJV6ZJrPU931xWnnlHxAw28brvj7zxRZylzDPfCMbe
	TA3NpcqWi24VtE7xNn6X16ZzpOilNVZbrf2e24BVf0COQa+rUWUGB4cUjIaFGlRdEU+9RVVWTLt
	gcyD7gngQP9VR0jmICJQdCAlxqyZNJGETpyID0QKJnT43lcKpvyqg568CrlM/McIzaRqr
X-Gm-Gg: AYBFou2f7hbTwA46DUjSyNlv1Jhs/WiYXwAXMvOatz+KL6UXpFlmuOIaHJjFkTmUqDK
	Gqv6VILli6dwRCqXFrA3YgnbrvX86haX7QJYfW16Cj1QPWTQTIY0VWqQnaO/PxZlvHLjbSsxqyF
	2pcF16b33cm9IJoSEXiNrP01Lg3tm0eDQlcbcoMQD8XQ9M69b8ytxj1lIsri0Uf7SZl8Wt0ra8f
	Vg4zMTBkJ1Iv71PkuWMDmD0Qxvuk4gIAJn6Sw0IEwKRfrWfrnZnbWOuuVJLzyBO2dKvgJLIbqoO
	5LDrBgy8MXQRUBupMYl5AYXuVmAoZWlAk6D1VgILBSidNKDoMAXHar7v7Pftanrw3wcIaldnTor
	RzdfsCjejFoWoNvlCST/9sba3Vra2lSN3FcrwVJE2a/hPR8Mhdx/mdqigf0SxQjF6A1W2ZmM5e8
	at9BqTLOxjJ9tFzlIbm10Cac6OGEVb31Ejikbt3mGYTmvuQckXjuJ5MWHqlWkjaw==
X-Received: by 2002:a05:6a00:1597:b0:886:cae0:fb6f with SMTP id d2e1a72fcca58-8ba54af5ffcmr253702b3a.14.1794234088076;
        Mon, 09 Nov 2026 06:21:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1597:b0:886:cae0:fb6f with SMTP id d2e1a72fcca58-8ba54af5ffcmr253683b3a.14.1794234087610;
        Mon, 09 Nov 2026 06:21:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64a1e6232sm1454677b3a.52.2026.11.09.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:27 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 06/15] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Mon,  9 Nov 2026 06:19:52 -0800
Message-ID: <20261109142111.256630-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX1Z4nCvhNP8Gv
 XqDJQd/jrXxQtfiZf3GKIlDPsp0yROM9e4oIc0ZG8TNCJKhJjZ+68d4hOvQjeJQNQA/W2M0zQ4p
 3A71GglIeROJpXmUmHIaJs0nT0WWGe0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX4+gImJIePuBz
 nfj904FJygbFw0b04RjcvXCIOBRtDzUfEla5KE+dwFz4H8FbLbzS8KNooW0tBjIYY8KsgOI5m24
 UTx9p/X76e53OXI9wAWize8rsizmVJzseoTsMTpV7nnZb4DPa2nVGitjqKHv5hOXNA6yA7Rna7B
 /ojJqlaXzzB1QH68+wi8gv4+2KP9NIqS1NL/JBI0NiCHZx122tRgaBXwXhazoLoGLPuaRqRBCgM
 PX+fiVt76MK8gAII5H/YmtDeIIR1Lc1RM3H2R3lUUYaIhYxZ1dEpCPtGaRvTlqltJOs2WoDhJYQ
 /pvrPPP/6uvDe2NN0GJddt2qeTO2rGs78j+x0OsnaAiVVq05SS4cJ42keJiu3NPDmjZe/BbRf4M
 LSYt0EblsV453W7+wlxurk5qydNqFqsAJaxRvgHOjNIf5eZBmYaOWlHVDQxMhjqrWm+5o4L1DAE
 F4iULxN3JXh6adjjZtQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1d6e9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 8Y7D0PbQk7_JHnfrbcHbNyr-EActxKA7
X-Proofpoint-ORIG-GUID: 8Y7D0PbQk7_JHnfrbcHbNyr-EActxKA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a29f8149493c..59898b49a201 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -373,6 +373,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -392,7 +393,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

