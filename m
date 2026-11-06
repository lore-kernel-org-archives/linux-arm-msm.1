Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007365;
	b=UQxptr4TwW6I22hMudmxFnZZLYseU5bTF/JfBwAk9aRPRk86eZIv9Pm4ZZoWJmqq6qZR
	 LdTnw4FZXKnt6h8m0NyCW8YkwGOaGxL0JhEwmsZe04zrqQMjLnJmGijKyL5Rd6VpZPeYL
	 e0HkWSerUMqABE0CNrBL+L+HWhBBgCqcLaLprm1F1zhJJXMvYeCb4vcsO7uUAj4v1ZdHE
	 y4udgMfxL4/4n33WEgZiEF7ce6KqvEbirhKcMDVwadxX16x1GKEsLljyLLSl/vw8jky3V
	 PsYNXhwqJqg9qeHZlTlinPymAHT8hMsIPr4gp9MtmFx4SlBA2Tz38TGsxwSR6DsERAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
	b=uPu0jALV+8POoVXlvXKvPaL2deANcj24IkcTdQyGNA6TsNGmMCR1gR7AUGws10xbnEJt
	 ZpbPiOuuox+3oR+4g9Gl0iY/zf30IDNlMo0NFW/1+jk8EVhXiIyQVvBVktTElI1MJdzZR
	 /aDW1XT3kbuNyngfyCBY7/JZonbk++U7tuY62THR44k7kVW28J/aRALj85Axa1/tose/w
	 fml/9HW63MebzqFBWqda8teYAdfly/hf5DCwxgAx7v1sRCoHwVDpXB8Zk4bil9ms8kozf
	 KkaEEfKjo1lj6qPj1Q9hdEgumFJ/pja41+efQbXu1+9Ig/0d84iYiCxziY6jhcUusAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu0kvYhj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FxvHMXx0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F9E606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F9E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu0kvYhj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FxvHMXx0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo9N0149140
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VPp9DF6FAAA
	hRErFGqfT9QbAEpklRskknKR5KtgUiPY=; b=Cu0kvYhj7tB/OM2arS2p0wF6Udc
	mb1okHrMocb9MdEpYHZwewF9r5wORFgPUoKobjmf9UxKYlUzZ46d6N1NWYrmGxcv
	r0uIl+cRyBZeDhj7dW60k3RidEahbdnZ5gvvoSQ7+gAsBOjAEiGZXvnOPEJit3Zo
	QAuysBh9dBtuOv3maF1VVuwLMnfKzboBIuoTpoW17AI5/024s2xYeDCfaMapTEnb
	p4uivgN8lujzzG83laf4ckmybzlKhVvzHRol3vfhily1FzWBh+OskkmEQdTSMdfK
	JF3YxIIou66UjfOTA5MpBXy+7At+bycshZxUqXSt14jAe0IW7rpvVj2udiQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyk0rxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b1ae61c87aso860239b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007363; x=1794612163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
        b=FxvHMXx0acELgYWJwgt8iplZMkcjy0ATUfmJOlCV+GYcx/gzKmigGYwQkIDKOY19yt
         BmG/883Vmus+LdUDeQZoOBH9+W8HeXgyQ/0/wsMIgbTyOBC7egHtZgzLTorS92Vck8G+
         GgQOjmBIWtiLOfU4sZSa4lRW6DO7xG3KkPWHcxNQfyYDucliRVQ8yaZWNEV/9qZ59/im
         6wDlmB0wxTOvsmJEvEZkbtdSsxmvIwrN0jKsH9MlNnz+Qr8KOq8xtW+MxyiN/8KU90E4
         0q4wuU8Qv0SBUugSILqV55oy8EFZzWdnWq2/G+Eff0f+j9A3EvD/vLCcqA8a714PFKK/
         UKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007363; x=1794612163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
        b=liuSqQruM5GFBpDaIvZ5wR70vsNfJJkyfJQ1b7661DJMil19rxVvhbsnk1YXH/6iqy
         kg9bMAEof0N7FOFgESvHrx2g4lZZJ+X3VLNvRo0Hx7IfGptduwhr0xgPQy0XNJ/2GdD7
         PSwuLoJKEBmiGL9AAjiuKxzCPcstifgi9EoVT3m6c0a6yznIlIsqdig5qR7vw37Neo6z
         Hm2RWm6W3XoqbJdTopkROmGnRkZQkhkMSHkAYrzMKP18G76SPMD78dYdpEogqoBwKE/2
         6faPUCocybcRVs5HhnZVNllAtAKlGHRbM3U9H3WRLFD0Jjl6Brdkn07Fhoa03ouMOAN3
         xhSg==
X-Gm-Message-State: APuU4Z8sIWvWbdnlzzm8havaY4xHD/PhhxhgXXW0MMdTURmcjLa32kUr
	lim51sHXWzCAykFsfKExAYSJB5dkHNmCcmQPUMaS0N1OKIJ+jzBrRO0ZPS1Q4vU7ApjcUReePnb
	bRunIachOaBCaOGklenfMSwNgbBpJTHaUzDIrr2wNZXfoldZ5g9lXz02znbQBTO8uVfes
X-Gm-Gg: AYBFou2pLhGPqreEzKayKK+/to3VWUKLrt9bbu8UI7F5RnmZLSqoSQZzqsWSoVaMtfc
	tniL5mNSJfeIGMKSDqwZWluSb5uK9U30BJ+ogkSx0GVDUEcM4tIaVeEdgJo5qzmV7ixtLiT7fAg
	RGgO54fUDJzJ8dXnruT8rQpvuhhzMCGTjey0h6YtccJKcOcNu86VWl2Fa24aGVxGEz82yJjHaB2
	JPcMUYR/+lS1NplKz3TR6DrB7h0tPiTgouKX59kKxIEAIZel4DSY8TpqULjD/XN6RNHTwnAOiXL
	eExEaKffqqeSUe5wlIFmRDXtbqxQCTaCp9CfrkhO6KyKm7W+nHxjHSPE+14RZtim0UuhSTqH7rm
	TWrbJ05vpG1sFD1LtYAA33a/Qa1LuW4hr5BmC7gpcfeQt3GYh4xC+bkWuMgM89B3nMNHlri4GCI
	FcNVerGkS4rZzqqw2dd78k+w4K0dqIRwvKhahO1qNLapsRaxnjr1FxNh16WZZi
X-Received: by 2002:a05:6a21:880e:b0:3e0:b1b2:2af9 with SMTP id adf61e73a8af0-3ebb2aa0e0bmr3888486637.60.1794007363498;
        Fri, 06 Nov 2026 15:22:43 -0800 (PST)
X-Received: by 2002:a05:6a21:880e:b0:3e0:b1b2:2af9 with SMTP id adf61e73a8af0-3ebb2aa0e0bmr3888460637.60.1794007363006;
        Fri, 06 Nov 2026 15:22:43 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35a3b3a1asm971793b3a.43.2026.11.06.15.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:42 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 04/15] drm/msm/a8xx: Export slice helper
Date: Fri,  6 Nov 2026 15:20:56 -0800
Message-ID: <20261106232220.47602-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: MSS6Ec7I97vFIF_6VyZfkR-JkDRnRx72
X-Proofpoint-ORIG-GUID: MSS6Ec7I97vFIF_6VyZfkR-JkDRnRx72
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX9etR5FW+oS4c
 V8McB9iqDfuFib5FKen0JnWvYC5iWVRf+WHMcRtPju3YyrsDin4D6t2mHiz/6gMcaBue/rlI3PD
 ULjiGqeNJMwobqitOm8HlXW1HRh2Tvs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX0qv8f5Snpo7q
 ht/YhiunkUVJtHALn1e3xuixo4UnsyLvMcpGsqdiK1mKsZd/YiH3lUfsbpWxlgwBHDV95vpBAxp
 +U+MYN1lW98tlEbPypzaO/UliRaB+XqvA9nT/sL+GH+cJMYIOQEMsKnIBHouojQRWbouedTWsJs
 G+F5pkIo3oWXsY/ZSXhR2agiC9hCtO4/evSOz8kFN+tlfcxw2+mtrIz7RU3nqpfUA0SCWxLgIDv
 cT4gO1wbZLCESeFScY09HCbIj2OUbvsUWtxzYCLM/ZpTf8dkilMtOU81xTPRXGpEI5Alzsji951
 wS4igIW04WDXcUqHUm4R1xaRySrXBf0qDX7hA152WgHVleTcwdB2dGtuPBestVo/szj48lSkspY
 ciWfhu5tinFgsCCus3pUayRZX4hySYfuY6KP3nomKZthtZwFM2MWJ9JK5Sugzc3PsVW3pMKVWEJ
 PGjw52Q5CQu78vTRz7Q==
X-Authority-Analysis: v=2.4 cv=I5Tw19gg c=1 sm=1 tr=0 ts=6aee6144 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e6ec85b20fb7..4a3898e58aee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -357,6 +357,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index be81f141300f..a29f8149493c 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -130,7 +130,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

