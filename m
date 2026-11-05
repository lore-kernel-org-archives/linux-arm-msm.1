Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911231;
	b=SnAm8Pwu+Ws9rUjSXMPJuKgodtMMANox8P1gM22IW+sZmivOLor9HoK6KfbwhFs17Hby
	 pSOu4Ct6p2sknOd1MR6YecOHgMZ8J2I/dJlBkOuiLontMrU3h9xHTG9ytsGCIXqLHAvBB
	 YfWzD21WH1JxOldWWyInV7ckojSUCgESnnAv7E5zRu9u2JPitVjKj+w9PJJJoIEPt2loD
	 DV1kTzR/NNedzrCaNowtebTGRw6E7IupDYHtVjNNG5MGqtaOccD6KGGBlG7I78GYGEuZl
	 t2K/HKgEw6l+1RLF7Q/TvsbwqObTzW0ijDJ1lJJr509OPHLw8t0sNwYsOhzCrA/2//w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TdGMxBvX9I6tC8AE9/vKCHVlLgBTvfhgz9mh806xJUc=;
	b=GslRcjFOlX+Y9Gn4txglO8ZL3PLnYPs4PyheBIRFOULyjWaWgHawtEwA5x2papIw8Eh+
	 9hEZ7ySZflhuBdhFSeOauTqXgY8KwSpyp+xymzjXoX6JaB+GcQPCC+7GwrgRXT/6Q3HXo
	 6eCVUjT1+JxqsVBlKrlI9SQhouoD6RDU/1JGle0kK3DX3zI7gsl/RlPK92zS+zCFh8WqP
	 XgWOEiEa4bGU0rzEokLabC9AMUe7gu7N0rJ1AR4OhKXvEonCKch3IsVLynz59jjSSOJGj
	 HSPmS/A4eg/tiZAkuAzsOz+evFHG1dq0TyI+L3ANuX11Vi6guREt3JwtiCw+pyidXPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n+o/eohJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+0gnTnz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC4606D830
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BC4606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+o/eohJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+0gnTnz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JLjT02293973
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TdGMxBvX9I6
	tC8AE9/vKCHVlLgBTvfhgz9mh806xJUc=; b=n+o/eohJGHAnJJv3gjCciox2RrX
	Y5HGuXhCZoBpv8/0bWbxU4ayg5VhzaIIlVjmQI8zTr/xo21ey1yftOOuif6nQ+Bi
	pMI305hQoPGJ8ld4MicoNsNyDZZLgPYOi4ZV23SFiRM48x13qdWvcxBgalFBX7X7
	kWxGAKqOZMpPKkliC6XtR3j0LdDNQruFODcJadS5cQ2Qi7Pd2GnJILbSEzP5/8jD
	fzzlyCemJkDarwvrtLF9dudko+hs2TmpVvZnaUIaFPUbUT9bdYaQLNTEWiZSkZFH
	oIpWGTOcOCEjPYmanoedgy3ljiouvkNjH3okboEvKkC51kfbmKItLQicvMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryw18aty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:40:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so2480380a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911228; x=1794516028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdGMxBvX9I6tC8AE9/vKCHVlLgBTvfhgz9mh806xJUc=;
        b=W+0gnTnztRJsmCfozQCmAwlFIe4gE5Y+ndaWbhEUnAPVf6vcHTIhFEanlR/P5FyCys
         Iduxdfjem6hMU5xCAZxVmMJXJLPfh6MuJtJGHkbLYKRWoyBdMLBqIKXYnM+CqZLXCwSW
         s6bjXCYHVS2+7ppvRuPDucwzS0c7erOyjOWXMOqFOvY/PkTKWUR73ZfDWiQumYDnkXPF
         DQFy1yipcILJntNSgNdEx8z5eQyjMN0Xt4Zmm8nQDfY1hg/9GgqJCXe8+iV63G1qFgYe
         0OEvclqLhVlmyyZNzTn3GreUifr7Uqp6YKHrO6/bsQo0yltD/BaiFcXa6A07I1L5JHPq
         eukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911228; x=1794516028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdGMxBvX9I6tC8AE9/vKCHVlLgBTvfhgz9mh806xJUc=;
        b=sjmChxsqk0j6hOLtRR9Hem4mWFghfofaZB8L/qpeo1WMOZ0D/uq45qO2dvLUsebMYe
         yk97MM4mlSVHiBea5EJKnz5JIdvj56a6IahP3GmJ+3pk/5Mq5dTpHXkalLMqTO+izoLH
         wJad3w7cFDrtju++/4h2vx7yikicDf76H775HgqXY4CtmiBq2U56J0s2Jn1v/WgNBOG9
         H27Ue2ZcDAylXeeC8ijheX9wDFBxp0Uzh1nOKdxVHnsQU8YCe4ylNGL2cjw0FjgEBA1k
         +8FKQ2xyVSpk+zfKnN1ue161aanX2/BwGRC+Z613XVuJkfiY6MVe7PGGddR3X6uGSVCY
         i+CA==
X-Gm-Message-State: APuU4Z/8up4UUo7anaiSX2XFYKx9ioy+6B2+o/TDVuqy7eooaEByQKZD
	6rJ8kBU6ItpGJ6rSnln8GuRRY2QueD1F/7JU11dDN1mvq2rW+BguxbLK5DNtWRkteHcRPcSWmd2
	BMRo+ZJkS7IS1fN65aqaTXeXaDYRNBrbmTlFcFDKZMM05zSWfObf/idCxlav42uNMStit
X-Gm-Gg: AYBFou2go81kOX8b0WQJ6h2+4cyP+rp08r3dHzOhEUNLNqxJpT3bJyQpTftDiGygs9H
	rhRfUE55+X0pIoQhjgI4mpZ9Hakv5xKDE/FrIjIjOoxLej0ofS3ArfXHBHFol4x74SSHjE9+/Nc
	tlzqIYZugvY3NgVMLpkIZJKS1cUpvFbYWjBsT+0SQMQOLMWRk5M52QhXf+IUscdGwYdbk61+t1I
	ubPNCRCPOMNZB7dIUnHMtKa3IEPpg6WU0DVx5DRk0qQNDk1ID8KKSMV1kBha3v+wQ2ERyul32BW
	g0OyXkFtyhGXPPQUDYOmbTcw6gbyzcPkJGZkycAvSsnL1TP4w48wyawyWhdivSIts5eWt/8GYoC
	HzczidAXhOlp3w7Rlnr0M/Q8ng1Id6z2MgI4iDUqjIBb3sD9OrRYzrShBFf5UVxKw6JAOAOKxX1
	LFihcDspEedMyTQMy3ZJCzHvKX7uXDbogSHEaturePviShTCujCuWJvxLWUF2xbw==
X-Received: by 2002:a17:90b:46:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3b0db6eef82mr149892a91.19.1793911228370;
        Thu, 05 Nov 2026 12:40:28 -0800 (PST)
X-Received: by 2002:a17:90b:46:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3b0db6eef82mr149867a91.19.1793911227888;
        Thu, 05 Nov 2026 12:40:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm5140693a91.1.2026.11.05.12.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:26 -0800 (PST)
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
Subject: [PATCH v6 04/15] drm/msm/a8xx: Export slice helper
Date: Thu,  5 Nov 2026 12:29:30 -0800
Message-ID: <20261105203057.66520-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Vl2Qtd083TV1BupXGYpxdb9aDZ36cNM3
X-Proofpoint-GUID: Vl2Qtd083TV1BupXGYpxdb9aDZ36cNM3
X-Authority-Analysis: v=2.4 cv=RdYFmFtv c=1 sm=1 tr=0 ts=6aece9bd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX7/MTsDI3hBl8
 xwtioMIM/zarxFML2RttwWKZLrmq4og6nV/wsLkOjCIyisNtYMQ6pMOE6Iu26DTsllZQDufDR00
 i4xQyuO5KRbh3ucTPnEnYq1KUQ+HI2V3CRe2jxpeNe1qPnwuEOT0VC6SyrPgMdX2eAUDSQAjyFp
 8TKJ/D9Bg4qDRiKWOu7Gt7Yk0xKU2ObinqeNYo20WrtNxjjV6CQquvPmQwTFe1wiE4eaIfY2j8h
 063ZcfA6/xfNrqFXIp4T/XyrdNGNS3LGa86SG6qgBXbbXntk4dzlXu3eyff+4yPYwGLMkJLeW7v
 Jxtlczd4E5PoSDqLrwicTgoR1Fd3ifxFV0ZfoIoKFpzf2xn/HOiVJqsSI5GYLMBVJU8UnVsM63d
 9corwUlIshandu6nBcxdVjSbJ5ihh7jmlfnHk9cb4xt5D8mTtkmieaw3Ciqkkw3clIYE805Wgiy
 Vu71Pq4rdmbMf2Sznag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXwZKTjxrL2Fhf
 8WhqDuLSWMTwAigd5LLxpn6cKcelyQkiyknQcGG60sJzeRyCT4ksHCaxIZI+5xt7GbucZ4IR+vw
 tlh4RtahtFltj7MUs4Lm87EiGa/AWwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
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

