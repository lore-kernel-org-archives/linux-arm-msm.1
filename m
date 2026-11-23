Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454433;
	b=oYOD0Q4TXJ4cL8HloMvlUfC+bC0jt7DME2EVoHAb33Hubow4p5eVFPe3V1av6CcG2pVW
	 AZJXxzVwJ/pTXvu+dtpFxF2dUxhqD8MNxRTHqUs03Mu9yFW/ze7MKd3MZrIs9fnaOgu+O
	 VrimGKbO3/aVnNBBqGjhpWJxJZMcwQiK/3ZLuA4g7Yb1WouE4+SgQ3hpjBsY2ag1sHhBk
	 ObPC5HjSPV248za2JdgbivaVz6lwPrQAlMHR9umn1LWvKpzUn36JxKcsVs/erUUAkIFdg
	 6xv3jfhApoDoLDtia7HauTcukOtxYU0sycbPdIXbmiyO/rr4oSP/SvWn0ocnHRqZ4LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GhMv3tUfF0X0waf9LUoKmzlbGF572ZAv+KigzstD1XQ=;
	b=xs+B1+tL3jwbWsQXTacmmnqpi0uiA9JHhmQG5h7YqfnX6Os+RF7iW296z2Os1uJvsj4O
	 A12Rk3kFcZDS/zyvb7MDHjQJc6l7sW7J5llcpNbg1hQIi2QwoVCb/eIojJth94kgP71RP
	 mihWpRxjHUxvSFU2FgE1E6N1hhx/unAlJGBV/0tkBWMKId1nrfI4SsOYSTmaBV5rDPCQm
	 R2ePrUZamQzN0ZnROVnbV3SvhWqm+jqPBI3uToazdkKxA63ab4wQ8qSbKsg5U55kPdC3q
	 YmTpJriiaYwO6WyLHuARGYq8lqqjPPNYoXXDx8YJp+0b6mjzRjd99FxAvqvuGu+y4tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXmRdqzK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rmwk3IcZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5944A606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5944A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXmRdqzK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rmwk3IcZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnUn3730230
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GhMv3tUfF0X0waf9LUoKmzlbGF572ZAv+Ki
	gzstD1XQ=; b=PXmRdqzKV2K7IDecis6FOQVkzj+jWxMrlsvLrfp2aP6AKzH+0xM
	GXRNJ5Z/Ei4ogq6XF+V2FFseBcnaDFHSQmpa3ZpCwtLKtAPGKJ7pEpLPi1CjBWnT
	NhFHFyuiHLIED/PI5wEwF9s1dRQaB6v4fWhhxYVGi7wmQqXPhes1vhfFPi+mO4Pg
	lgxx7MOW8WOKa8p+x/tA99QHR0Ajg5nRQFAfRPUM/52bxoFYwIM/czwVzaX9ifcG
	hDoaxFE1z4VVXL5H2gddpSxeUWFLV0CnpTNo/skMMl32D1kcVNgmhTcZ0K6zZwhw
	Onc3LPf+dAaBLsApVsxU2S5lqdKInPtcQRQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2krk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:20:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so3043240a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454432; x=1796059232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GhMv3tUfF0X0waf9LUoKmzlbGF572ZAv+KigzstD1XQ=;
        b=Rmwk3IcZpiFjPJJuopGvM44Z1ocXFVL6iDDXDTCDhKEVSxEBLxkhUv+1GEAGD8cT28
         3dQnnSX8GRTraIpTcYCQDWBGEtAMMJssbzTlpWd1xQbNnqB9DMq+qUzoFQQFVEzxqEPm
         QmYQZK5rM6Pq+kmU5VT42R2z+lJUHllSbUgjqlwoS1qJLH1ife6x9/OvTc5pwuQkBSo+
         +LoLmBxiTdBSIDi1ktr77oRluhS9NWdPj0p6rNFzCWGpQyzMQ3neUQYfQBhx5ecLZvP/
         09LHODyOdvezNq9vm0K8dRfEY6Xxilfqkht8g9h2bXLlyQ1JpFfycgQccbwUu8KjyhY7
         w+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454432; x=1796059232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhMv3tUfF0X0waf9LUoKmzlbGF572ZAv+KigzstD1XQ=;
        b=sbbT6xxND6q/vMrITKL06z72XsJSwzLrAz7ZYbiv2xGPN998KUKKoTGT4UkdUOnLG/
         fi4Rwu6npoMQQ+UBsSD6WlhfvEgMqOyDrk3DV/eit47+KNoD7AkEJzdi8GoWc97ROoUi
         ppf5GWDTchtbg+SZenhV4/dbwpGNOmlKenxUqrybIggs32iQIVRqmGgA0F9U7NSVj81+
         oT+e4H8jVUUJNAo9g81lL6k1DnyvQPTdpJO0Qc5yzkS1XTgeDnue5Bwr3twXYvBUlsff
         6KthlBQTXTVfBo8EZImHGslp1dnB6RLtyhxfYE3RNIMOkaeZ9GLXksGXNE6nXrEDIp3e
         qVKA==
X-Gm-Message-State: APuU4Z+T9PJzp2+X3hxwZiBM3ecWxgX9cT316nJtCRpYoqlxupyK8nMU
	nLyO1+Laz8QTtJMm6kRMIt7SXJkEsBoI6R/s1xxqDOgTfI0fVc8fc9QSgo01tkioXFsWtu9wlSl
	jfA23Dx4eYUoiVQsciZ6LyPKxdiEYEY/TJBVUC3/SrN63UNqwnLfYzH3CCCCOhuolLtw6
X-Gm-Gg: AZFdTZefoKu3wp0Tg9bhE6rWA14Isx9iEI1gK0EYp9L53O91QXXUmHq7vjhy5tlA287
	6BbhBYrhpXr2JtSfnzqVO3uy2hM4uiiAJXGZpnrAL3OUAMZGMJxDdXxTZ3V63G5FJWuZ84/kv1M
	iHhJB+CWq6t8xqjVnsXER7brye8+2Wc+boGDhIjPBmfry4gvB2Qk9NhzLwX5kDjbKbmzcBYMnHr
	HQDFPua34fFuKLqbpgy1UuZHpp8SKUoM9MsZMQNIO3nCZEeMFrqXS7SVmfPhaAmafu4jy1iqmtr
	VwsJYmpY5y0quz7ms91GgOV+mm/QDQgxktyP2RZHhCDyTP9mxIwr9/2pL4VFH8ODkIBawzQ4UoI
	LBIBtCIqcPlCeH3bt5zoRCTwnb9665RP992VfQoCKEyXwet7R8NnC22eDK74CYQuWv0IywmoLmU
	44XOqDSdHAbG2dHLSt02pB8+2uI/q0UTUYkBh48X4qYDgdVq4AssqDzj2ij9hopA==
X-Received: by 2002:a17:90b:3d4d:b0:3b4:402:b3f5 with SMTP id 98e67ed59e1d1-3b41c8fe48amr12378537a91.22.1795454431391;
        Mon, 23 Nov 2026 09:20:31 -0800 (PST)
X-Received: by 2002:a17:90b:3d4d:b0:3b4:402:b3f5 with SMTP id 98e67ed59e1d1-3b41c8fe48amr12378477a91.22.1795454430383;
        Mon, 23 Nov 2026 09:20:30 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm6565632a91.1.2026.11.23.09.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:20:29 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a8xx: Add missing preempt_record_size
Date: Mon, 23 Nov 2026 09:20:24 -0800
Message-ID: <20261123172025.402295-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
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
X-Proofpoint-ORIG-GUID: _VL6LzDGmATzm2-PQjaoqTJNAyvNssfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX1SykS51oYgyT
 Pmjko0Sgq+JqeIh+ZmFBy6rFnd/I8uc2OBTQZqG6gg+pLmOgb1dm2uSTifNYdZP3k9ccDByd16X
 gO4fEkJfmcJyuHHJ9uMXdIST4c8xUq4fx1N4FMbAJL6Yy0UB8OLaMynsdpp9kVee3p0URDJ2gWX
 /XxBV/mp8mnmA5Ad8fN0r8kztucm7c92qpUt2gTEhlwSfTEo8yrPAvQtz7XoE0Zx7ewp3ym+7a6
 f6HkVBOJD7oZhtULQVjfDXW9APyP0Rzltz5C7P7F+UD+b/1FQHYN90QGW6xokHV7kkVtEvsuCrE
 LUrT5ZS8qGHsuktFZ+cHLc6EcIRbN5MYyICzLOhJrlCuE7nt/Ng8VgaQYK1BCBxtKkVIL8bWiLj
 6Y6cS3CcCuqJH1m0xYx7WF1WtUaCAxmfEofSqwSvBE5Kug4JZ00AQsoOV2zjhpZ5pe7I90oNSah
 +ratHzYyalEeeKzTb0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX3CUd55c2SDyI
 rPzKQnZAdw3HNWg1S7vlSZ3oY00ptwWR8rw04/2smgd2o/Bi/a/VHHyhDAKif/Xr8w7RLeSzDhI
 D6c4Pl7ZKfQu3IR7lRfloPezariXGWA=
X-Proofpoint-GUID: _VL6LzDGmATzm2-PQjaoqTJNAyvNssfQ
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0475e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=2OSpH8Mq0sc3u4_c0_oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

Somehow this got overlooked, and Glymur/Mahua were falling back to the
default 4MB.  Which is way too small for the amount of GMEM on these
devices, causing faults in cases where preemption needs to same GMEM
contents.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 0c6dde3cbea9..20fe93b83c0b 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1337,6 +1337,7 @@ static const struct adreno_info a8xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.preempt_record_size = 23088 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 388, 1 },
@@ -1469,6 +1470,7 @@ static const struct adreno_info a8xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.preempt_record_size = 17712 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 388, 1 },
-- 
2.56.1

