Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674731;
	b=M+03UwJ5eqMlahGwebmL81I/jaQgxn+h4yBooEmygSXTShX5A9e+BWQrS47fot8xL7BU
	 MQvaDWj0evXuKB2xvnmKWUF0oJlnDXGzjex1Ga3H9kFOsh87Fbkbu8RrNxVA6lHk40BIj
	 MGeg5rn4TdIjlRyoHj3Uu43X+Ipi40Lx1zf5kJWJacHu5fiS2sMnNcS5yNSl3HSk0aEUZ
	 qKH0IEKbo/CR+oLaiZ9zDW8qD60ifXcxfLde24xW1/C641CvKZsWur6tsEmt5iSltoluw
	 XT9g3IxCHr1Gfx+2ANoyT6n3pk3JFocgOcNXm9+OCDZ+byIgzuZvSO9z/RCoD5Y72qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674731;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
	b=Pt2wW7kWMrVb1TxuypHArwlPnLZPYNon5rrnj9hlKKI/WV+CO6Cr5G2v4k8lPpIVWpf6
	 sMtNxKTUldCQHtC/mKLv89dkZhlNU+tqmsoZNZPVB8Z3KS9fJaSmmYx3mjVX9NLnzxm1l
	 qB6NRG2vBVKXJdA9ohUPZrZvWkFmg8aOZp5QbdVLF14SpzWNlhx1hrldB+OhvZHKUGUxH
	 6ft9oXn371Mr6siDZFpHaAQ1oB7JW814M/NIWtzYN0fLSdc6jPHV70lnyZobaXVYsLUJL
	 nWAWP/eYht3COjT3dLAGIAof3FEE0+BWUfsrXmwdCDvOzVpQtvQUyJ0PITtK/3o7m2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KwLkEcN+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHuwOi48;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392AC606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KwLkEcN+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YHuwOi48
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36JFZ394031
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=; b=KwLkEcN+3tM7E/Jq
	zrm3P6u1PZaHxwIDGxCqcQv67I8AFt5Z6oAFSlGRZNygTSa8Zdud/JWqoU1ciy1o
	ZVUDxEtEFTew0UWzEEQhlj+leiGzmap8kC2czZcUp03ICNBUAoms5plgWzac9age
	WAcJsgbhjFE4f7BMXMyjKs8I7cG6IJrtN33VUKJEJyp0AcWn+VEDAuZ05Zl7cchV
	B7wsoLBOEatDcqR4Qx15WMs1Vf9vERRaioz7/HjuDhj/znDdBNmr47SurzVMqeMv
	7MHECDSdFczxFmeKZFjYehR1CVIwg5U93GZwcXFmvsvc7ZzlwqLVhg6BuI8JL9yl
	t4xmZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y1qtk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:32:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0467a525eso50567485ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674730; x=1796279530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
        b=YHuwOi48sQZqP35mnueZaBwuAd9EUBqR8x0amSmD/1fWMKj+gHujO2dUyFy+NHyfg2
         AXpQ2zusIwUv9TKmeHqa03rwzdYmtZbB0hPxCHDWoIlT+Q0RKNZqfzpqqTN5yQ7ckXKR
         4W1+sLPKrX2JUQGFEHPJWZcJ6EkYD00ZNNJfopwrAP6CU/WLHQXbz5J0wokC6KelJyi5
         6uo43YD1pxA0r72JDzN0HQKWggcOztz8EXswYWs2kefZ28TAF44q3zfd0yF4+mLXTtEa
         RoQVux5gXs38Kb3p6XrsOjnIDOYDIrezLfpdpojlnp2ChO8vLv4SuP1D7/7XfhSp9pVQ
         T+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674730; x=1796279530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeKH8TEoLZ+vJK0OK3U5kpUI+ceUEEYaOyX5flLErhs=;
        b=HnKQB+VWfhmCWEnNH0brONNj3kyUTtXBmgPoa0xdOdn7mjiXIr3hjswjz4yL28z1iG
         HGoAS9YqoLDFaqIWZo/eonLP5CZjmBY4Jz8Z6Vsq1IvWsK4Ho9FFPS/pQLLaZrSWZ8rC
         3UmIGulDCm4wdWIxY1ZR1IYxFBFMtHRY5lwatzcjyeuDGjPFIAYncmeWcv52OWHrBetH
         /3aIlkXg/hnnrxnrj9E5HdbBrUUu1iJ8w6+S1Bxr2ErGkqii9Rn5sKW7imyxWtGoPjkB
         7+ExpdsRvFM8A4TVRYdMt1dy6jceP+KVjCbpPRrkggJCwYUCpJkazeQBgj3OVujWZ7tG
         Os1g==
X-Forwarded-Encrypted: i=1; AL+hErGBXO6BigGIfNiVEQfPbkxXqazQED42x6oQWvR9pANj5U/2oUcAUOh84omCmhHg1dMucsY5AB5cgB+KcV64@vger.kernel.org
X-Gm-Message-State: APuU4Z9SpAFwaVCHW8i7PjKnrCBFZPmVz8tfEL7KlIM2NvUMqh91Lmj+
	rPvW+zABLykblIJYOug3bZTYOGqf9rUFvtbu2ygP5fw4Vlm8XZ47OYsgdqUdQ7x8Ql6veso8Cg6
	hSXhRwiOufh9ak4XtTVL2z609lcda1W1eXyiTg8h+ATJCXbwVMZsUp8z8HCFS9rjZCNZW
X-Gm-Gg: AZFdTZfoifkOsOv0G5HUyuY41oC8AkMmO27ThDR/EaX8UMhPZbcD05Z106CNEF36f2M
	+p55d/lADGmJLehyWCkQN945EURHMc5MXTF3JILaN/yckclnHo6s/vBr8Qf+WNwIv08VdI5S6Ak
	NT4mBdCi6/E8QYHv7LjEcEZPSvYK1Tn2+X7qbS9flRvDC2D5MVZF3Bt2EJV5UozWkmL5/rhhTop
	LCGXQFew06nUP2S4xbWDm+DKql4rigxxc2kZ7WEfNbE1Y01frDEl+OpWynrvjEuxNxpK0frsveP
	Lb4i64BW61OKzBSFNJ8KJU/NKi/EgBfm8Fy4YC1em/0Aq4p2GuTlL5gzq8V22HxDnPlphSdNGZ9
	XHeW82qh9SeBjotHHyK6GknYZoG2/039IgsjqVL0Hu0v3ROSyWkesTCjaNpovQMK9q6er8G6joE
	eOKN7h8swy
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr218271035ad.37.1795674729914;
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr218270835ad.37.1795674729434;
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:32:09 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:27 +0530
Subject: [PATCH v3 19/21] drm/msm: Support KMS backends without a display
 IRQ
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-jshekhar-v3-dcp-v3-19-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=1191;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=OeeUkS71qhEHZfJKt5l7tFxYoS0sgnGLM8wENixTSYU=;
 b=xviT776rfCeMHIFO3g8aaW6MLHf1PKw27DBdPxkNYkyDI6t+nLjVEm6uO4H7Ode9HZee3kh4X
 Qit8ls5DWndAfFs+hSXsT9IZFIJa4EXjRfVkVEvK5CL6qZ2pjmmnDDb
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXx9Xg54Ct4KMR
 jVExPUkoskWpi1CPQnCCUF0z94WuDoOvo5gnupGqnQn8WUs2VaUw7pTwOqvx67eXJpD9JSZ/LmA
 KDg3R8SnWpFlfqN89bX9gnf8TOjOMzx4Dp314jl5xqDqrNnMVXuZ3p4Olfi5heKz1fwZDPjpKUe
 83r3kw4FoQb4YTtT51+MI3+IqvCmJJlbGo5Mth8EI6RwuZN19RIT5kh+YsQzlfEk3K+DaaRkNJQ
 2R/S5JULhJU1BToBipIxYyeuvoAxJX2kZeRAPOV3j8CBefy0EP8FQIlqxSBQIw6CAbdyKqkSmnY
 AmN/OiakKB1gjXFbKubw5yplQs8UjpsDUBE2URT10Je+av41N8L3i9dUW2/xWIUNqHxgCDNiLn0
 VZaGxJeDrjNC0/bOOkwflL4HaELaUzTEF024INT9APiMvIjx3Wni2favQ9uDf0sfyjLkZFxs/lK
 KVcGvzV5FWMbsKU6lIA==
X-Proofpoint-GUID: PD9f-dOAeP1Y95FfKNP9Qw6ngK_vTlI1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX6VyusyeoyIgC
 /ZvwZAdBNVMyKXQ5L9L4MTl7fWTCciMLdCJ5L3aRWywRnfoJ5OfVepmCe4/NIgIBXdpcjYnsQZk
 3pPqTLeMTmH8ByZjJN3MwgsrKwDWYCE=
X-Proofpoint-ORIG-GUID: PD9f-dOAeP1Y95FfKNP9Qw6ngK_vTlI1
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07d26a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

The DCP (Display Co-Processor) KMS backend receives display events
through firmware over VirtIO and therefore has no host-visible display
interrupt. Rejecting it during common KMS initialization prevents it
from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Assisted-by: LLM
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9592fa28c85b..fe6f290d7be0 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -72,7 +72,7 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+		return 0;
 
 	msm_irq_preinstall(dev);
 

-- 
2.43.0

