Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615970;
	b=npp1VftBNS6KmUOatb0899xzerHGxQ2xofNHKLkGdByFB3v4aaqQ8G+ySc12bDf2ueyY
	 fWcVfmIG3fBDRFb3x8PvXNg6U/1fcsAAYU8TJqz9VbRUdtlkf7hA9dRZsB/8Ph32Dr5+b
	 cpAwNJ6cSWON0L9wfLsZ4H/N672hyUWaO8awmlgPojZ1JCVrGqzFa2+EbdKX5dN90QIXv
	 vsIh86NaT5xfwfxVtOlNPacw4q/bzGGUgJ/0SIaTRq/vrpdkk9h7mDGBwqGdjOvSgmNng
	 gNjgsHQVta9LBtirUm3X4xbTUMrovg786hZpBj4VO5i2+ekvRQOcesWfE/NXSHCmQWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615970;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
	b=IyO2heDo2+8jIlfNa36Dz0Vef0Ors99qTAe3e9fZOlic4VOr1FcR81676ZlgfTYs7Cal
	 y+ocnvvXzBYw8FuVlirvFT2T2l5g92ujrK7NrrxOnxwzCZbRiSHll/7s20eJC3FL//zei
	 +MjIeK6JHDOlKO7QO+Gi7xGssKu9Ts3sX9xhaMBA85gTkGxT2lMa3wbUUqPQpUBr7kiZu
	 yB77fzYhYMMok85XuobBmDGCHM2SjjUrmqqgc6ct9iIGk3HPLgy81ELDQsTGO1Gnwinal
	 vMmaLNkMnbVTzaKAmGox/ytCAStKjke7c9j9Oz1nItPl7QcffF31qwD5EiYVzyzkxgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EAzfE6D3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EBUKS6BO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449FB606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449FB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EAzfE6D3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EBUKS6BO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeCeN2160351
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+oVnjuYPbq3
	UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=; b=EAzfE6D3TvUrYnj9Y2k7DekNbzb
	5jW1oBwFZJ9sQDZMeAn45dNYvU2YqR03YoNbP/xMyvS905N8CsXx/0je/A32Ee/G
	KRsaKPbkSvoM4+5BJpmqyKxuChIayIGhTtAB8IbimFovRguom62Q/bsWfStNnIdZ
	KyZmJutjzq0vCWw28c8x3LwDmBhZY0ZAKhpFjGS61T8VWSm6/cxgyJ3vzHTbnm5Z
	IX7xhs03xfIecnmIbmXjTHNTtC39Halrbg1e5VAMWOFp55ruw81jieSqlvJDLWuG
	sEnXu6Peydzjy0bvBHxrlrx3YAzy/THjRYKVT0lfL26AyNnBkFk9KBFJDJg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3gpp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso631431a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615968; x=1793220768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
        b=EBUKS6BOC9re6QaHlB4lIBlczsUthqzR75lnghvanrUu0JfKdVc9dH9M3kzxPE4RrZ
         579DlLPYiOGG/d9jXf/T0A5jdtPeeMolQGOHcmxWLtfCpwQf8DXkO362mMhW5h8CRPxs
         3iM6lgX4Azwsaa06UEJd8fSHZ91j7UdbyzbeP7d7QUKXBfrkPo8iNfnd30/P/Xn/DoRf
         SwKqtyGRcPQhlo9W2gJWbsxeJX65/WAdHNhDKAgKfmywJo/Wfn8TBYUVpoZyypsiDijk
         Vr43O6vzWx8sCakuVo8NEwP2vkh+ACj96hgNtY1NjQrkeYxr+Wct7EPay+Xe6sQDOeEU
         aIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615968; x=1793220768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oVnjuYPbq3UHfk2AZIHMfqxpfWs5ivQGbBLfCTwFxQ=;
        b=vqCaGT+Vrs8FX/b7iQAhNpvIuEED3OY6vrSDBlQL02a0ILi6jJcwb/WC0tonf91VDD
         wGBV89x7VflkWbeeo2rwi0UVGZXwLd/FXIOIuaArf1qmjDVyZUCHHjs6jYZIl0E7cliw
         +lhBnXVSjXqjA9Ji2kU/8MZv72hen/wN0rAujXrqx8sjWWYmEn5UL10uSoCA19aORPql
         6BLOSIEy0SpKOibgDO0PJLMLKgb7CxHp5bjQkWnVa6FgieSGry5MW4kEOeY+dKz+zMFC
         nROooW6eEjMuTRuH1YD5xgf6cv4eD4eJlz/4/qMl0SNscBVmUguaBM5slHb6qNROvZf9
         36fQ==
X-Gm-Message-State: AFq9FYK1Mq7ofFLAyhRd/r9uvGTcOJhNsu/3C4gM8I732Psx+MbwYVma
	YBNQ4FDhwWvO4VsfAEZtEXEWTfer3g4x/CP5JPD45yqA4A7Bd5mHg4sXnc4dTqm875IIH0uaFJG
	4nZ0+3jIzsBcGyHg2PPHiY+vJvNSDCHGmdw9bDbPJAJseMS/RuBbeETa+i7q7rJOnPd4Q
X-Gm-Gg: AYBFou0tXthc7aOgwneiIM+r4fK6QctO9sDUXDtRaXX7JoNVtXUjGqRaukvzW1rSctG
	ssdDLRvC/iLUINO3CN5ziZmdihwvJZt0t4YOc/8f+/rhlEWmfNPvsTsy/EWX768X9fybsI1oaAl
	JM7rBO2dWMdrcoo6Q45H3kNui9hxss77JrMb8iAN3By/UYBLxOTFyp70X7d/KFepr7ilfTKJi9H
	adzj7WvsTfwEkMKh8rd204j9/BRNM7HJ5W7giN/iC8mXctgHW79d3uzRMXX+7gLK96xStR+jNlV
	nTyzcJ3/toiy0mW6J4pIR6KHMmXpQ8DK8atD4YuAtJ1SCogZJgWeyQ0slafDAztrDcPOyaQ/R4j
	T//XwUBLHi/U4UB6jlqhi84Z8rNqaVxpU+Oh0Q7FkisaHJN+7
X-Received: by 2002:a17:90a:dfcb:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3ad86d1bc63mr2195131a91.31.1792615968181;
        Wed, 21 Oct 2026 13:52:48 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcb:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3ad86d1bc63mr2195105a91.31.1792615967513;
        Wed, 21 Oct 2026 13:52:47 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad83466e46sm3157774a91.1.2026.10.21.13.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 07/14] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Wed, 21 Oct 2026 13:41:32 -0700
Message-ID: <20261021204244.67160-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad92621 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=b4MSL0WmfgirtTH71F4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: VkR9srCwafNY2bbs6sYxn1jAnS1zcSau
X-Proofpoint-GUID: VkR9srCwafNY2bbs6sYxn1jAnS1zcSau
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX/cS2Nf5ZfhnF
 D5hl8ioKt6hFAilGGqf+kGJZL2IqwztxZQtosjtTux2EO2Ned3WDZ/9D4tIn52ZCtQWifH3kRCj
 2nNsjIN0p9uS1AfnC+e+7htNa8g/RSf3Ap32gHgo6HJm9YZPV6WfkWtcCLtSW7dS8ASBPl5gUGn
 OEN5sOo+U0pCRIOcnHwVGTqvYboIpPcYPOkocFIHrx2UKg8BHAJlKB4yVku3ygbyYxb8hNdK1Oh
 GzjPDC6famN/O97G76AZbVkpo0KmWCZ2HN+OpmE4kbUNgPUFwbLzQsoHd3WTIIw39pP7ZGeFPyI
 USSiJphG5HEAH1k4OEDRL4Dl72UWtNRpDVm2BLJ7uJ1vbKBo6ac17NaEnJeAr2wO1s4ai9RzRkd
 jaUpGi+pegqcO8TLhkxzCVG6hsBGc/7UxlU9lzRPOPM88gBWaIPaCSIJjLbgOMPXLVkwQ8k1Zd1
 lcJBXd7qTLYYeBy32Vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX3Ta92A54vSeC
 64APC3weyVvPqMJffeCLc6g512C2K8zCzjlFs8YgvHRK8SJU0W2LWkbRgVAR6+g7Q3tbcnWtOyd
 VaqaDYPfHMMZgCZTrYmCqYslY1PET9I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 795c16d88f45..a6146372cf7e 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -367,7 +367,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -387,9 +387,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -635,7 +632,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -716,7 +712,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -835,8 +831,8 @@ static int hw_init(struct msm_gpu *gpu)
 	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
 	 * non-secure mode
 	 */
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
-	WARN_ON(!gmem_protect);
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT,
+		        (adreno_gpu->info->gmem / SZ_4K) << 16);
 	a8xx_aperture_clear(gpu);
 
 	if (!a6xx_gpu->pwrup_reglist_emitted) {
-- 
2.56.0

