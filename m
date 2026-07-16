Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F60735295C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232964; cv=none; b=RfW0zC2+cHc1OYyrO0yMNQJrBayLT3bLdWJn9R6KbDa1W20b/q3QUvq/23PIY1wJMNgHqTCnvCaGxzaxE+yRkHvurAmihF8OAbr69nzPDpWplmq5bAMnCmnSeyEoYoNloQKSxfKo23ETqKqdqBsH4qB5BokjeGJMzFPmSAdSR18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232964; c=relaxed/simple;
	bh=GxZFku0kvsa3uEnAi/89TufUaclwCvO3NT6bp6hwH68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaJvit1FaSdxiE21tLSs6RursFfQ01v9+MTc2aKbY8abxPSsHYYs0kItAxdqIVOSdVb//tKwNNf/mdNCw3mFV12b4jo5W3aXdco1UrFejzarQHy3KUCUiTVoqJp1ufU9hh9ve2K3G9wYrWiWs9pJWirDYZTj4T9LF79xPUuO+q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwvSF+AQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENBiS9r3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwvSF+AQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENBiS9r3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJomQU3864069
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6DIg0hlu8qf
	HUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=; b=RwvSF+AQrKvSjJMlwzuq0TyzPaC
	fLAEpCdxm5RjFcXJOC49mgFKwn4mKpg9ya0CAyaLVvxHGwJpMFhr/mCSdCwOk/iZ
	k0Kz99/5S35bWorzqoAKq7cz8HZCZ/eL3E5amrXxGGsnNWSIIv11hVq9V4J0mKki
	NXBx/ajdOCryOyU6XwzKvh0sFx5DCzvLzaBLt/YUzRHjn/BalAYdqC5j3xRU+tlN
	QbTB3mIikMdwZ44xPubvA8vWBFyOvZnlHBEfzBfjyFagbZDx3915p4G3Vg3b3rNk
	tgGIToqrhP2RqVu9fDMGrpNQyrhkZhEToOLddD76P+5q0Uhvc2oejKDbBsw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10b8vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:15:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so53827695ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232956; x=1784837756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DIg0hlu8qfHUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=;
        b=ENBiS9r3B+djCDUYyxXBuwxDUXmFt/su/TQtRNJVt6Y58QKxGNWMV4xtFpZ/RhI5tU
         OiOFHevi3Iv8dAa0Z3tDAtXbDPDAYWHqN/zmXtqOqSRmO8J3iQzwdIyLfomNsUMey77h
         sAbd0cqBFXl3OZj6YplhSzig1S8BzLU7aTUJT5I+JjLvvKgL5AH3AE2KJBCsS3RpP4lq
         B+/94FEy6k228+9ljLAf45ZJcX4U7f2OlCa380EmIyRkyf5df92QL0Ab8FccT7LTOCGF
         M9OSpbITjrtY7fhDmU8zZTNQJR5z2gmrQqLplrTFGi8xUVu4HgUczlo9/9xTbztAYKH3
         O6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232956; x=1784837756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DIg0hlu8qfHUQoWpRSk0/2wgFEbxEIf2WTCugbqRdk=;
        b=skMIDbQ4BF+WmO/5aQf91gyv84J2Csq8IBNujdTYF5SL5FzK+tsp9fz0oLId0HvasQ
         e6kc1G0zeZgiLbwcpIQz5XbsbBdNryYTluCwHpvR2dhxXwNYWvjI9zcul4h7BMGWziyr
         eJSHPn/tA6vRNr/NO70y86ns2gGK0siY8YbSqy2DpbD1R0KBxxiwnz17dPHy8rFto+wi
         tuSnFuoPxjP3Ft3O82U2scTnoThykXEd7+XoBNEPpkxrf2PMlF41IPwAdWyguJzl9CL9
         x0VbHZgcsuSJlsoa0d8WAhjgostQJLNEUysp8pwn2hkfw+huWMX+grM3w8NolXJqJJz6
         sKXw==
X-Gm-Message-State: AOJu0YypsDv4Y/6KWkFGUaoRRLuLN1KYxmnLEdZdhYnJ9wm9/nPt+lks
	4HLoY5TdWHuIOyA+Vk9FjPGAyjWjkXXMJEpw2LNbVx28H/pPflLG6iN1153m6rM3jc299+w9zmM
	C1zkYf+HOBZfsedj46Q2it51RTIY4GkS112QgnWTwH4nnN9jhWQJo8HfnaG1O2nA+MJej
X-Gm-Gg: AfdE7cmF3Oik99e9qOIk+L2y+4e4imk2hUQg2iEFeAsEi93fU7+TqZE2E7nyj8qFUIr
	KsDi020KqittXy+zuaGlJVOubwsB8/RIxw/Jp4FEJUHW0a4zAj2LVBbKL49QjozIXL0z2Vp6DZW
	fV22/dpGZuXSEO/Wh2oIRQ7duE3L4BPDAQt84/4aZXJEkwoM3hXjqoJCJRkKEQvU+pT4VPqrGBt
	EKX51LDzFb45pvKq3t+NsHGMTh+kXNTr29HhgN8FcDGrSZ86kGwd4uYj3iT7re0YI5Kwl8D8gcZ
	ipFWKlP1qBvOrEAtlV6P4YQfc8HmyRN60erPI6BdPVIC5d5WFumDMKmHtNWY+2EOTKcEQAbjhYH
	jUIe0VWStbQzWyuAmG61KwE1FwtfVaiYXIAdIqLEPwkeJ+vg=
X-Received: by 2002:a17:903:1210:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cf2ec54ea4mr9006325ad.36.1784232955671;
        Thu, 16 Jul 2026 13:15:55 -0700 (PDT)
X-Received: by 2002:a17:903:1210:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cf2ec54ea4mr9006155ad.36.1784232955241;
        Thu, 16 Jul 2026 13:15:55 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055cde6sm25822265ad.52.2026.07.16.13.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:15:54 -0700 (PDT)
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
Subject: [PATCH v5 05/10] drm/msm: Add helper to check for per-process pgtables VM
Date: Thu, 16 Jul 2026 13:15:28 -0700
Message-ID: <20260716201538.365824-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: _lDS48b577rZZd_AYFASo2inGavrCYZv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX47kMrpS76TB8
 sDcT+3YGK9symkpmYezzPYHEXgXvJf55F6EskE7eN+Z0l43R2IF3ZIN1oC2ulEfx0E217wOZH5H
 BNSgDWytQeDoiSAx92f7UEwenUnMMtWg9I2ZJyU32cUEFzmVcHXhPkDX1RX6zNz0BBMxxX0soAC
 7WOoUiwqd8xW/qi+x17yPHCFqqGp+8O9WaOe/eVk0pp6rBiph0Lo2ndg6mYTq4eK8aJ4THh8wy+
 zz+oQFV2W+gAZDVs/B72NHj0a4zGYNQsjvD+p4YpeGPJhsVSntk+Qvkc5tF5lgBu1SCwTGqK5Js
 Yael1/bwKXb18aIblbHj94b5ffN5R5LkMoPb45YDH7mltvdKlLjf1acjfqVwU4k1AwFmftNQ2nK
 LX4nNkfcYrofx+xJBjU4OWF0u2iraCHhvKzHjzPf7IC4miZzb6Xsw4x1a6PauNBS/STk12zCntV
 TeuNWCXuCxAu5Kg9UlQ==
X-Proofpoint-GUID: _lDS48b577rZZd_AYFASo2inGavrCYZv
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a593bfc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4aDCzPfTH0uMOhJcsooA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNiBTYWx0ZWRfX7sxZH/3EoOQj
 LqAVeTpJRXjvdwgLf87qst058vNSAe88TNoOPCcQJPxNPzY2KGuhCk9Kz42qBVs86mnf7WJU+zi
 XOqg6/m2c4WUdX4GyvNlXEOm70Y7R/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160206

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

