Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007410;
	b=b2bbqxtP+QV8qgfYEgNvX80zqxvn87Jdy+1sGtPCkNmtgqi4k+VBMSj++fqvmFicXw8P
	 bC3t5fAYzMunpgX6eX/ekw3U1dDAEM6q0c2SX3vVM9GYO4k8l4J5Q7gn1j1oBeMWY246w
	 BuEeYW8c9on76KqImGGxUz7Xf8002JQREd18Ou2i2QCWhaLKAiSHBpdSTEIyQbQqHSUPV
	 Ykw8tJKnN6vm+35q4Hm1eV3iGxdfycDGaPN+pGR7G1aTF7enOS3XeVAmffhQ7tlx+xWRV
	 OxNVBu+1IvW9VKXNJ06XtpBiSkHdFjd8MupUz5CvkwxDzpHubqyz/HYNUeUXlmsnw2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
	b=3UtX23fF0wae7H1ZtF4PkazOjOqeHo7H7mxTL107B1bqvGuoUvgfMl2XfUN5frXm7kjR
	 XYJvgA0snsGRqQs5yvN72JXLbHuIoU4nKYVcwkkvulyiRbu4mBomnPKkkr3si11qyIOEE
	 sv8tnZWlwjCs1/8Kp3BwNPT4Sm8VtqrTMw6YOkQ53yQf2igzdzFclPpqPT51bYm2JgHBz
	 g8gE70Zy3HIpslOjEb5Y+qBvsHrKSVOHkTFxvyt9ImyI2qN/xYAJ21mBnD0FUuPvwt/iK
	 RPlQR3TdH91T+1fng/A7whiXat2TtYALX2WIidllBoDQNNIQcA6WcNPWitQ5QCyjgyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7stuwK+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqKE2GwR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D1606A337
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A64D1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7stuwK+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqKE2GwR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo8L83696176
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MLNc8w9O9Js
	SERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=; b=b7stuwK+HVYAdAW6thWiwzyjFuY
	4ltk3YWAT3xXILLdbuRx1suBodg3lw1cSkZbejWhF3QunqaV9m8nBTMrn/BFt2lA
	GiMdvgOqbFJwyLR6EI6Lc+H7Gsq0KnR/oaY9IKnSKX/vCwZcKFh59STHNUvtC50J
	+ZggkgeO6r7p32BqWaASJUEDhr/64RQTDxqdtfPkKtpM+6CMGI4PModPZ+0TfcE2
	TEES6HQrXFdv+RFhJlt/EZ03hoL+mn2hp4PTPoncsYiMEMtpuie4qqKu+oHhCn0E
	v/4hbwNCI9xyxxNPRMnksSncxqXy7gFIDepc99FFkCC1egIDN6ptJnCdBVw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyqrr6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:23:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb061cc4dbso90826a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007408; x=1794612208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=iqKE2GwRsxMD8CmwdOSNJPpEeTHRM/lGOt7enjkGwMCUWgh6zzye5brzPd9CraFh2R
         RBVddTrxA8dm+rCiKmPCgJ2j0UTxtWn2+eIwgnja+rL1LpBCyj2ySpJoXPGfoI21fjBs
         VhrOTsmg2GFqN0w75xBnL/KngnivJchKlm1Xwe4YNXDz9KRajSCkIZBld5ETcAHZB366
         zlv0uZyxT3SF6t42GAc1pv8fv+W8LTxM5Rq+l4WJmQje4enswvhd8dGbnWXwtiQn43F1
         gNHe4ITFavz1WAqmakzNv6qMfwizURZY/UMKN2p+5VcwKWziyFrwWNU+KWTT2Z5CUFwk
         p6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007408; x=1794612208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=CxWHKdPnojpKrolyxiMaZOiB4dxrvvpHCdEuRkOnr9A44/MoBZM4iU3/35Ax7Q07qG
         ldkES83vEL9WyQB3JCPEX6k9NJFKiuAzu8C6X/FEr+A/+Nte1bqEgzhfQD1Z1nHACN5D
         v2Q5NcdVE4y1Pe3ru70IdUYtrJKcshGclWzxLaWdoYdtAjyZlSx/rUoeQ49xL3feubIY
         rYftQDv+OlefGKPne8xOwqzUpc/X7ZXa9EZ85OdtmfJyXRbsPOobq/5VOuuLmLKaq0Yb
         XQvu128YWczhMoRUGGe8vLf14uu/QsmUyKHI0oEtr4Z7NbEtE76tK2VWjbaLTe9Orxva
         cK7Q==
X-Gm-Message-State: APuU4Z8d+i3dfGO6G0cBlSv9IMZRD/b8i/zHnOynQDn5oFA20eqKWZno
	tyJeiQTgNXajMLvYNYXGOvZo0MI7C5J5mn3tTPjL6qKRuaKrkU9kDY8HZ5SbbWi3BoR5gu6o/Rk
	03heDaNlCKHMLxiFILDsan74gvYPJ3TSFNrx9gjp1eqWDRlRvzkBEOcgD9B47rsxRvjwn
X-Gm-Gg: AYBFou2S1K2nbdrha7XS4W5xtypf3wByePn91ukCuTH9hMECA6zDXVMA0w8taAB6b8J
	6gjwje7e0KMIIZ0GnAi6QqAwR/I7SVT60r3jCMyNzhz0uVqinroJ5DNcugcUJj/wNWWmxJi6u1c
	Jw3crno2per2W20OTyst5KaJRmw+kU4kunqDD8oTvBLrvi05O80KP5+RTcP7vHPgOS29spfsP7g
	BpTGsmPKDE+R917OZnSaFNqnl4cNDGCs46Ztj7ovD3odPMzMBcdDIJBh6YnD0JwqE9CnQpklh3f
	yWMS7b9RaGbLoecKNvVAmfyu276POUYAE+RQHkTW9v3pgGRTr+ZCP4TOF67bH182ewSrK5FsTX5
	s/PXuJyaRa+837uw22qa51gT7X4Uc7/Pc26TyC2poRptvRQI0zmQQj/dU8yklV1JtiuXNaYkSch
	1w+WNfutwVCo8Tsru5dMaDYQmT+uBLZSrqYo/qkKrBF6EkdvE8FXsb9ygLWJiUYw==
X-Received: by 2002:a17:90b:3f87:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b10637b0f9mr310986a91.28.1794007408324;
        Fri, 06 Nov 2026 15:23:28 -0800 (PST)
X-Received: by 2002:a17:90b:3f87:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b10637b0f9mr310966a91.28.1794007407850;
        Fri, 06 Nov 2026 15:23:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm855983a91.0.2026.11.06.15.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:23:27 -0800 (PST)
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
Subject: [PATCH v7 15/15] drm/msm/adreno: Remove temporary __maybe_unused
Date: Fri,  6 Nov 2026 15:21:07 -0800
Message-ID: <20261106232220.47602-16-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wc7bHvAammgP4MPFx2M-jNnBxanzoWpT
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6aee6171 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX5sCVsTf91Qb6
 GsduLX93QzCZ6RTv97g2dhd5sw6WNQLZ59nax4V9FsiaNHlsdRK6eOBiUn0WS7TIO5x17j1yLO0
 rpIEg//QQ+3t44jeElYsJSqIuOA0uok=
X-Proofpoint-GUID: wc7bHvAammgP4MPFx2M-jNnBxanzoWpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX1lqOlRLE24y4
 YXBDLKK/TURGSeOL8Rqpt6zOb7qYkKU3Y94ZINNvtaEFloQx+UP+IWfiQHrIBry5/2JjPRqeC4G
 Cq0NF1BqFeA19z4KLMxRRBtmL6H9WiuCS4lGd4uqknAL8e7jB2PvtF+0jaLghZ5R24w4KfHn6PR
 SMaVGFgZXYya2H2Qcw3AAzAC0CmxkE5QiChP+0O5aiyIo+N1HUIgQ4CxwK56w3BAvIhcFK8a4zW
 4r7WQhXD14LbpHVse+PC7HHPkKLbaaRq1c6gRU6FlEHEROlw01prgMH4mgHHfuka+C8A32/jTIs
 38FoZwOEm647b/0VH59mgqPCCpo8GadGtXdMDRoonsYjIsRfnS9FRuS2ocgvYJK/RDCigl4zXwX
 wTfmlE7D88ER4w7jALkmT9oO6UPiGAfwQ0xj1qdwU9WIsc29e+KnOA1xe+RptsBxMBRzh9EFqA+
 3SM4kq2z750xNrMU2aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

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

