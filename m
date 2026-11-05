Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911290;
	b=0PKHa9PekCR8lck/A0w14ovr7rhs0sraIAV/I+fkO+TFegiVvnfQTCK5i4ACukK0C1pm
	 /VfHwK1DrM6hgWOHDQVzfSAkRcTQN1etG1bhg/SWyeDnLs5F4g+MmWLx5VBkgUOMbbQJO
	 YXC2C59IjbSC/hWuIFYYq3tuhyFirIcvkVUvAJ+jyZmfmRD6XQKM262ACGzFkIUOMhE+b
	 dl7lq3Sg/guzF04WsMgInUnIjq3N7EecbtaOKU3CYK23kiUBbMw1TKa66EtqfJPSvnq5e
	 jUc79NroKamKlH05ijaIJoLdIfs8eY89bC3IXWVGajactJLDnQ12j0FixKyo/Enn6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
	b=nLJnxLNjKjkRGXgB3f9o8gWV0NaD+TFWV60alofwFwRghufbS24Nn4lZJmquYgymGpkk
	 Sug/8zPce2Pog8KtMWtM++lAgzostNYN76IUcXuIrxztaSwH+ja1F7rB5Gh+4p+02U+zN
	 +iCEbXstoz+h6u69e7soBREH6mnsMnbi8Mgi7ucw7L90OFf0bwIacKo7gknxvJXeQmGjh
	 TZeEUj83SeGg5o/MNAkHwyxFz+ru575kSrC6YolDlzwJVi+Z7CGOENJzaxNiWenQJdWw7
	 JCDleYUGLz9DPuV+3cSArB53JZ7OO+7huwqSoEv1sldlIqtbB+xE2z7SzHglFhZ8YIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJfkeRG7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyG2m6d5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C1606EEAD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47C1606EEAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJfkeRG7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyG2m6d5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JL0J8751434
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MLNc8w9O9Js
	SERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=; b=NJfkeRG7fXXps78czwVSHql1SEz
	+yEjvlAKxpCDE4dtWezDUWS67mbjFPotDaP03r77m2BeDrikshF7d0W9leSRFaiQ
	pKuNAAaBUsXC++KU4urbgzonp9Opf7X6djvuKkR5DsSc/N6MHrxILWDb4kb53GPK
	wvcWq9yS8MlmmPifV4CkNtxFPbBpJN7Z+v7B9fXrNohpsMSnZMMkjeat6CV91uOT
	EAca5RSTbKfaKhJNg+fWamJCUQjXRgIOgzW3LuGhKV72C47tsS103kqxbC4qB5k3
	jRoqH/59NbTlfg+j9KECvFVawSLDpBWO8xJS5ynmo+RRM/OJZvTVKfJ7tFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvp8acs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:41:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so2584142a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911288; x=1794516088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=EyG2m6d5lPE5R1R3zXshEDXFndkZm+G5meO9wqr8LdMm7CTbiFXDmn9pCuyf5z8jZI
         dXCSALj5Rc2Fqg4eBzAw4Ud4Z/eKN4BsuD9O+7Pm5zXQJvTaL3nir/1A5XNQYrf4uhLp
         LPC9rTG1K13ywRBNWUZQ6d6XpnT23VxpRcIjK0c6GXTbUzmlB5f+0YytWe8R01RHiJfZ
         K1HkxxadYq7PwQ2fAwx0dSl1N64Y+acCN3zrMBu2egMZkE1gzumG5rci7FYE4GLK3qsJ
         7fsiDgX/rLLjTdknhZt/9ApaIJbr6r6TsPRW+0GurE+zPNiE1RXEZVXcg6OjKuCLyMgw
         W5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911288; x=1794516088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=hn3bxC10U+rvBstZBNIb/nv6cOH6ZD0Dxh2xjtZ8J8n1hNYkiGFMzytFJ0eYTT7PVR
         vREq9zGZ6ZJbt1iuvtqgxl66HH1Q+7ldMG2H/iCo5TRXIfAGYEBByJwMnpt8/PtchO12
         jr0LMqB1B0tHlUcQTE0fCYGytW3ROU47gLPTfr5VS/3zbtTf9W4HIEa0DQlZqWjqU/tJ
         CyXFsGqjRydIewAFFwWPzoEn9R1CNVR0sDucKyynvNbcGuUSVu1nrcrUyfPlYtpOOgQj
         ppnIUSWgUJKX1+xqPoMDHLc9g+5JLbokqmM71TgB00ETWapb2+KpT0SEO3HrWmE1tikz
         K1/Q==
X-Gm-Message-State: APuU4Z9rmpHB9U3p0njgBuue/euyMKjTnnie+5KNprZCqGqI3fzjHaLn
	GT6rYxIgFvJQqAWkkHOgOb8hKQP5M8ZDbsMQczqFxQLNwJLxIrb0sjsONX7suXVsxEnb0djjndT
	X1hxDQwKA7b1baQzwHV1nXgSmbxjACivk8QbkvndCS/y2OAkH6gTCLSsaUqttWcnqzHYD
X-Gm-Gg: AYBFou0t9GWgNU/DNPX3kw64PQ6dmXfHn2tLu9B1BiV9ojDFUQuOhcIjkvpUOcdKEzO
	L6RS03G/AGi2o1nTjxEsGENVxh5wFOKWVE7oXei/Tb8bTOTY5HQDJhRSpUGcmdUJnWfl2+nZQb8
	B28KZK2wSm71YKv0jTzXe272h081imdW3WtaEif3xpen5xS0Yt0GhF5yWigTcH+LkhVzqJvg/4+
	wL1inCEnMN4jDjIDhINv9fyJaqLSJGDsVOyRvFlorzIT+heXniSN2WVbhXwGFk/IbvSP6/LTvLf
	TIBCwzF5XzP0Umlae1xyFa+tn3ydg1lef1S1gss4LwTXC9bbwITqgYDZO87EvuV5c3+rVUwpI2d
	LnHt7ffYkGJP5Q+dHvWlFs1o/nTQDgFZamWzS0nd2EGGd1AIgphVizLncq06Mas3gdJ8aaaNoQd
	pXfnJo3ARI9lwBrg517x47i1f10M/QJBPz2PylcquUyZBHODJ2l0SMJuntEPQZ
X-Received: by 2002:a17:90b:54cc:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3b0db705cedmr138277a91.31.1793911288261;
        Thu, 05 Nov 2026 12:41:28 -0800 (PST)
X-Received: by 2002:a17:90b:54cc:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3b0db705cedmr138248a91.31.1793911287831;
        Thu, 05 Nov 2026 12:41:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b90def97sm4817238a91.7.2026.11.05.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:41:26 -0800 (PST)
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
Subject: [PATCH v6 15/15] drm/msm/adreno: Remove temporary __maybe_unused
Date: Thu,  5 Nov 2026 12:29:41 -0800
Message-ID: <20261105203057.66520-16-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ib4Symqa c=1 sm=1 tr=0 ts=6aece9f9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: i_FlU-x4wU3MyTMtz5hZcgKJGj2dkBh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX/TahHcFL/rM5
 9qQiCcy7ZeOdOnYT1EHQUrNHaa6kI6GvrlddJgsLVgOME7kuwg9ViJbHChSM++RZATzyeOLyhlO
 wz6U+GbiiiozTrG9PsdaKx1BFA6qH6lLrGG3vEgCtNJLRcuAiHOkItIBx6MH18IrnW2fgzhIzeC
 Yy5MX6rACAbuonv+qCNxVWjHQDJG/UoWKlIUXwTokH/NlUS8wWUt8nS45vmU2UJ7ne/OnVET/TI
 7bChaJSpFHYmKfX953Us8kVXbY675mxVfNkiHTpvCLBYd7+wh3LYoL9hAxYY3Jyfly+FpYx6TBc
 p148wiNz15NsXcs/eKVYV3+9tr61yDkJahljSCe61MUVnrq6i9UpVCnnQEGoz0oaMoTFZMEq4zj
 g/6N+Iimhx9NG7XDy5Vu70OPKOoCr3OUuGjHbSDNXN4gDaG52k5L1Puy4M0//vYrEagW8bc2nCb
 YCU5txUu4qYnBLOOJ6g==
X-Proofpoint-ORIG-GUID: i_FlU-x4wU3MyTMtz5hZcgKJGj2dkBh5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX3ZvepNfFd4Aw
 eECaLr9d0rY6Bbv6hBnzXszbd20dxcln//YlaFevUEIR4+nvN612YFPNwyeuUVmhMX8soHJQ8lR
 cVEI1Y2G+t0958sU+HJOikQ/97aJLsM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4c4b904a8657..c5c928c1b084 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

