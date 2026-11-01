Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555213;
	b=21P4o2rSHaVwHwUbTW/DpvaHxN9PRC1YK8i2XOhMvwQatlni0m/7s5YFEG5MVak9X5xf
	 myW9Vi8aUceYpXYPbyRq/jkIMvOUzkOi6EpVNzM7mPRKdOwd+jCZTHtb01f4CFkvLixqS
	 DabwB2Vy7gyaVi5Mw8HlaCuAExvQ3cckCGT60iXaYuYgYTAnU0uVMvVHWB9KT4QdvdHyT
	 mCzzR+raGLLt9bwy0amtIx3i1agQff/vsM62sYLqFTzjCHgrNSEFwf0UwCqd64wCOKMfE
	 AS8AUQMg84YOqZ14AUy9lzj+1DY1aBHCSyrwdb69N42eR7zGPeOVdYAMumId26Wn0FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNt1SEURO6Fp2bP+i5dHn8qQfR3UbcdxoVQanIQ8xmM=;
	b=hy9g5SD3VtkUjgRQVuToejETbbwY/gZMCuOtXijsl8kRhUBwddH6BCmunpB6P4xEiOZH
	 MLM0D7G1KGjgeD8rvxhUkrDnb/Ehaa6fxhEmLa8+Uge5QbyjxxtUgBFlRPbJXPrLQ9c9t
	 fD3tUGxKHO8js6xKaocAC1KzaB7i0UOJaMMNWV+B5RcWnESA8uGEnHXLrjo3GXyOrIWKR
	 4aTkJ0s1XyDarFSCDyh5vCnKMkSniNl4pcy3IFfxmPF0Q/mtSK0E8WhndCVeI2PQQ2LkA
	 U6hC7rA+3BrGGlCg7pLk4+UHec3uODHYuG1evyMlphgniaQWKYPNvS2SIQ3xEC6HLCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgdbfRuQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGxjcat8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6857F606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 17:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6857F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgdbfRuQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGxjcat8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HPqLE1412712
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 17:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sNt1SEURO6Fp2bP+i5dHn8qQfR3UbcdxoVQ
	anIQ8xmM=; b=SgdbfRuQ7cehi3Gl4/8xYqMO3//7VC0XGpnfIv+d3BWvGvT8+of
	erljRqDDDXQuzBAdMV3yMlH62Vq34jM5SuPiQB0WBZHwbPMu03tBM0UAGSEWeaHa
	WlfX7HJlHUNaFEyL4Jkq0+vWGf1JcxLfAcWIEe0KJkN6R3XZkgg0wH4Fk1SAepo1
	53atyLDOp5qISRYJYxqfPtPdi7KdjyYhHR/IuLXitjLtn5H9r7yZ66tnwfXW2lCr
	1x7SCw5Y4RjUtsgp/JWVAJCr6l+mr/CBqMsSYPNNsc84lK982rwtSnIkqonquclQ
	CTp1DFBmlpKucCQSC+UmBHFaCFCKcm46BGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2uvnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 17:46:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea446ea8c9so25625115ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 09:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555212; x=1794160012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNt1SEURO6Fp2bP+i5dHn8qQfR3UbcdxoVQanIQ8xmM=;
        b=YGxjcat8CjvD3fL3qsnqNiHRuNWTGoIPkRHlUVErjUFxIB9O97PLLR1suDZ5hM3etp
         iR6S0799EkzEiQNWLhymvxVQ6EbyidHT5Ft7nSuVT+lS/T7Ldqg757vJMaAVamZQpqCG
         qucBbKYFn3AIbYPI8JFm16iHXnz/aEObeKV2db6aRXK2raJill6CHttqqyBVuXBYYpjv
         MVRC9B/+Gr2tPLLRT5T+T8UfDQ3C4jg5AS4JNiDyp0y4u4f3CDWhMCHSWfo3QtPCQC3p
         /zlBIXUi/9CPoh93pnd73Vd/d02wRy59wrptMUfWMeOS9RASfM0BBPUrYAyMPNWo/3M8
         FrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555212; x=1794160012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNt1SEURO6Fp2bP+i5dHn8qQfR3UbcdxoVQanIQ8xmM=;
        b=aR9XwsWuM3ft3PmHtpM3hW2sot4I/fvvZYRTmuJeOo6eP54lJXk2ogF0jn8YKNLfhd
         O5/3bNtLOMz4qP18rSXvKCUgkTh/TUS0CA7Z190m5K/coyvGErd5Sxgq0sk/+F1pPlO/
         0PQW3V94P25YJqm+OMpjpUaPMQV+6fxBDIgDhTccLHGJGfVaWmOCCEFApH31PM1DAGY2
         Tr57pEntggp1BWkWauf5j5TSZygoE4mYzVMjscau6gyeDm1He6pmxeyx+/4epmbNZUVA
         Z5eiac6/jVV2flYy6ZZI9YFdeaQxVJJ7EugPPjohDwf91V1eLsTUnQJsI7QKCJAPnc+v
         YjfQ==
X-Gm-Message-State: APuU4Z+tO4RIPKdA7gWUZn7GhwhfFyAM7TPJjuab3E1oItty42JfvTT4
	b0IJz8Y/nCcXjuSoVTfAh0qCf51fQh5aio7Uz8r0vODRLTVCI14DTqcOdqTUuztU+bMD6AhjsI1
	mPOxJrsO43kAspneMHs0yuwSjieosqAkCfjL4k2IyeAaZuTQ1O76sc6qhOaz66DHnJIWI
X-Gm-Gg: AYBFou3QZiDkCLNR9nl6YqI1aV1HyJTtUi6FtN/HkWORYRRCt3ch0kNz3S1bW9EvI2r
	DH3QkCj4XrpD6szyWdiMP/QFaHRt0uCP3TCC6hg2MeMqyg0mvROWvucLhAZfQID8ffvfvEYgzLk
	9YEBdzh2akjikvUiuZmBTIcCR56K9Ft41OmUQZ/ywk0Yp6wz/F6qEbCOd2yeoWPZ2XRsNb+ENBT
	+aSSWtgxHVtY9bwEvxz2y2t6jB3oCHoa1Ex5s/iv6cGtNuTLx+5rddpuIOKEpRfsJYHETe2StCv
	N1F9bOf8Cu/ZyyrIIkUBtN7CFPkPV1NQi3wMt3GBa2uVob8+of07FIlmSl6xHk1HCsC2NwD9hQi
	ZaS1oElE5amqQTcJAL+vRZZ6EenMegZUdXz/7kEelV0VxdsY3qjA51yJl+As0+mXSSkR/CrcJWq
	tGAnmGEB8lfQNcqEf29d8gKA==
X-Received: by 2002:a17:90b:1845:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3ae8974d028mr3953489a91.24.1793555211549;
        Sun, 01 Nov 2026 09:46:51 -0800 (PST)
X-Received: by 2002:a17:90b:1845:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3ae8974d028mr3953482a91.24.1793555211072;
        Sun, 01 Nov 2026 09:46:51 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm15076953a91.14.2026.11.01.09.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:50 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/4] drm/msm: Decouple IFPC disable and sysprof
Date: Sun,  1 Nov 2026 09:46:24 -0800
Message-ID: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-GUID: HpGRUGNCurUblISFFlkJtA4U_prr5FbM
X-Proofpoint-ORIG-GUID: HpGRUGNCurUblISFFlkJtA4U_prr5FbM
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae77b0c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=WAnUiRRfp7J0bigzDMEA:9 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX5GNoARUlgSTu
 pWOG9tG9ihydHbdDz4BLEuIPtb4xOoN0WzqXCTWiuvSd8mOxKi0ThdiJ1iOpPH/D8UVnGMnq1Ig
 nMTL/UqIoE9r08I+32MDmvGkNtZ2M0k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX+bvG6hvYaJnA
 5Na2pTblrAkWYMMK6H6h7cIFlS1PgDqAQYZgYwFEltUy9LTLh5BaZ7v1YptxCqef0nDXYuEH9B8
 LEkl3iHZBcqGL+zm/WSkuFwul1KdqsZGqOrk7MVpDy/8tGab3KVXQgAqZlEUND3OqxXsXOaIZd6
 yhTrXTWJ9IacQmrivOELssORY272usODnZl5S3zhJIGktHGQrKRlAeWq2Tmx4F9JFDKPQj+K0FZ
 qU+N3nCd37F2FfFrVg29SDsH6sdxygoJJUbZa1EEDbkHcJG6wLAmKa3vplcZuCdBKEXdROJRu5X
 RCRokModjoiGmZEHHgTrN25c/DJeVOyp3wJC+R5RmzlHc8T1Xw+2GAzq2Fn2W3i6Ao8Hv+O8y7k
 ds6ghcROhov30cFEYh66agQm/GRS0DzTD8UXQw1fK5rORzMV9jvuDv4boNQjX9/8nKwSklECP00
 v9+43gwQaYDoY3g+hlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

Rob Clark (4):
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  8 +++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c     | 31 +++++++++++----------------
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 30 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  7 +-----
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 +++++----
 8 files changed, 56 insertions(+), 45 deletions(-)

-- 
2.56.0

