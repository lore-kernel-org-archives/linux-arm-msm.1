Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828908;
	b=mjwo7hBk+dc6bHvs9VIg6KAzDa+Y9N4c/qgZ/wvzZ/4G6jL6Q9eKg2aDIOCZ70tLxoSV
	 DwR7+t8ZRk3WN6VUIwieKBjwbyU0sGNsPPH5E0cpABnxjtTPWdusjX2qtlqw1ZJ+51YZc
	 foY/ofT3NiB9l2iPf+hKELwZG7VrWCrhJY2hjkK+9mc4No9ru4Px1BACVpzl6HF7/Aj40
	 X66wf1OvgUBH3HVJcQDLeMyvcslQk25Ue+1stexWmxAbWXM46FSwqhik4/nRWc7NqRZuQ
	 wiVdcdmN+mYgepVR4ddQQ6ZLZQm4/yy4zr/K00CEjEVfk+UMTMDKtYo2/Snk5HLVMDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
	b=MzqG6NvY8cQih7TDxZzODvotpyZCS6174KjXdQXtP+MHVmvfQOPafkOmJcKfxN9K5O4i
	 9zpPfrhMYncMVT0WoS/LrpOX3yphnOHI0ZLkwOCkVxNL5LEiz4kwJmWgu2m7ScjwzKsE2
	 adO0nxfSMgNOmNduGxziRFmpDOBA4ZAyI3fdSiqGvaLrrtGgnZz5AcNB/Hi5XLmgV5zmd
	 DUPhWSLppj63rTQ7b4iizWff6KJ2Muz+kHaup4pdQzzt4u25pvSQNmIBjmS4i/T0TjF6P
	 NqPo0H6CaQgLL4gZE8VTGCD6fs/d/ssjEgLYhEppwxUPz/0XFRsbFYuP6yS0UUyiYdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyEHU2yf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKwg+zJW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A3606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C9A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyEHU2yf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKwg+zJW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBM0IW3982736
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=; b=eyEHU2yf3na2RhgC
	zBGWYyi1hbO5ftFunLalAMAcb9qmCmqj7nBaYUt7RVVVVa/iytA8A5NEznMYqXJn
	2tV70Qbny2L15v0IXqF2CrwDpJnR3DMBvY+CG7x9vbK+BSKLsfOUMqTW3CpWdjUV
	JK10awuN6MznRdIjoplOYie7mwXG9JbIkMVg0QAq4PCxwFynQjizLEtJUuuw63m6
	CQrysqwfx57/zictEzYYK0tyUk+AKA0DSpggjoN7KnvIlVcoRFf7vLT2jOuC9ZNH
	YSJNkqLhMgk0aW712RFr/NuO9TFzhmXzWrjtIjHWsdbnOw34tPxEQ6LJV0mxWtdS
	1AEnrw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmce67x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:35:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1684264a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828904; x=1795433704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
        b=VKwg+zJWjFtd+HmY4FZUOgrkUY/iIiCzUw3Cf6fBnyDPTdYThpn0VXCD4bnv23ZGQL
         UZsnkiPRB+qIvq9iBoOYkCTXMNguiXsJ3u+Ag/nQKMeu2IeRPGp/E7PX1pZeAGZB0jbq
         PIbsci4CmurrJY6w68GucvvObL0gd7KnF0kVRkCLK/VG+vlfx5CJKbDgNPz8cgcrqv1C
         ahicSEtbGfrHF3f6wfS/M41cBcnTqheyzvVoDeQ4oba7YXluNtsza4KxtxD9fFeCeftJ
         70Gh85MsW+j2T5HrHJv8Ced+4PLiGF8IHRXDckx8G0Va1EI1JzqNVk7RWwWjJxkLFeSr
         oz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828904; x=1795433704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/1SV1MxSZ8LEB+jUbrljc+qxkLslb4ZlD6gjwnwhJg=;
        b=rbZLkMzTg63b3nIAl1fuM11lGRRy+N7mHTpZtfzqnyFKiJMz7Upoj+lrWuHENo9TOW
         DYuo6qOwBUsJEZZcS23+3dKrfc1QDMeDYucz6le+ntH7PjhJJJnn8ND/W6uV1/VgJZUk
         rg3WQgTLgwO3lD80FXu8aIQtPR2yvDUBuEaJhm2YLK+UyzQom5jhAEfUkWGrKCOU4Gse
         T6tO93rjETKMSFnz9w0XlhhaK1zELqLLfL9Q4HqQPCeqw13Wr3+wnZqVuUUYO4SGyaHD
         oDFH0923Qt+TxvSPJRPVNoMbKnQsS+eQXUC0e4XGKQoaIdflwvOBxqprEOf260CVL5Pr
         vc1Q==
X-Forwarded-Encrypted: i=1; AL+hErHHyVnj66Fek7SYqKoTFzfyK1Hq9s7q8jCktsvmqn9+53EdOiHhtiUxq1n9XVS5pZUs05UNhdIxQiNieE5Z@vger.kernel.org
X-Gm-Message-State: APuU4Z9b5iM5mrAm2oP9m8dsqSNyViGWt8xtM2GWIm48BE1F756/P7IU
	LUTZrAXBb5XKSUS8Gs8Rt1a/OdkRSgTDytEm2TRZdFXR7q0gl6SjWS0PD79j0PTEf+HiR4T7SgN
	E2HspcoqsUOdbXOOZJSRLTfYP8OoL1A/SYk2P1uCHfBIKobLxpv+fLNKiUoI7IOGx2DKo
X-Gm-Gg: AZFdTZe0+KQ03Dr2rwcn49Gl1YMIYJmam6cANwpyfUrKXrr28C9vwnCchZJoyXvGKil
	g2ld6B1t3DNOMFQcrVeLVA87Y1VOf8eK+aiSPqj9AItIev/eBfmCrtsnNGnBzToJwiTXDQS7T+Y
	Oe5vNJcqX68g12N/iPfJrsKW60FJ/qmLYRcfeZ4RYJBJPAy0tRinE6V7bFMT5C5FOilC/02mUsx
	SmDQ29RZnp1q1ilQJSW/AeHNu5y7l8sIfx2FJHVHmAadq8DOF8K9TXd65yDhtuxrCeXXWi3veoe
	NLfVx8lbMvwDjAax/fuHlP/7+0LrdEV7DV0P35RFMZo+BeFfMEyr0ReJ9eYXu3rYgHfqiYDQ42S
	HbVxye6jpd9QcGEcR14fZkgcOM10JJ8oEmihtOaYHuqsrtuaKCDcBupz5z187k7oSL+8gxUACg3
	aS
X-Received: by 2002:a17:90a:fe15:b0:3b3:7759:d2da with SMTP id 98e67ed59e1d1-3b37759ddeemr3746698a91.5.1794828904532;
        Mon, 16 Nov 2026 03:35:04 -0800 (PST)
X-Received: by 2002:a17:90a:fe15:b0:3b3:7759:d2da with SMTP id 98e67ed59e1d1-3b37759ddeemr3746664a91.5.1794828904067;
        Mon, 16 Nov 2026 03:35:04 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:35:03 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:06 +0530
Subject: [PATCH v2 3/4] arm64: defconfig: Enable the Parade PS195 bridge
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
Message-Id: <20261116-mahua-hdmi-v2-3-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=763;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=fqWr8Q//GUQkrbwoURGIWeM2InxPizQ4dIjubj7qBVY=;
 b=8QPxyxQOJYULHOVcD2ARScmoOhA2lkvadsuW5o6InSmPFE/Ak0Us1rCaI3dQCZ5MRY3f47FNF
 wQnwbBYgAJ4D84Fin48a13qJzMly0DIUOekaXQdAKrSeTsWDdmesn/i
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX0jP4yYd7QtOE
 Xz8u3qjhXfJYek3L1J/EcvTgQz+CmCq6ozU3z+A1hDEh9l+xjfmDP5481NTU8BfYAPinjI3QP/J
 CUTJg6fQ11svNwIez4TJ3PjtZ16f7Ms=
X-Proofpoint-ORIG-GUID: vX_f561h5hq0jG-F-6Cy8IXjHdafxkXi
X-Proofpoint-GUID: vX_f561h5hq0jG-F-6Cy8IXjHdafxkXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX559uYy2rl3UT
 pjP/LQOHZxbDvuC8JhKUbcfAF95UlXzGJyiKXpOrp6Sg6lO77vTbDP8NaDDZ3pp/QepRbBwCDXw
 6B6x2fNxenJSjP8n07Nppebj5TBd6xelVqbqsHGkX9b2zN+Z/Ul0L57dlFetdUpvUmVdcaZq1PP
 jH6irJYFBW/3GEoVN2Xnd3vGUkEBF5FL5LS2V3IHR2iw5CGRV64wS6ESAVsldJxIAtBVdyjhphe
 vR3RJCP4wZu96WGviPUMWHGWHZUBKdNrjwfTRKo5dzPSQzHD+Uh4lULjMlR+/FuvguzbhJc9q13
 7c25cxb1WNuCQftbaJNZEzLCEGOP63D/gHIQNRhLX40vzhVETJuIi/yC7KMgeF55uIQFJ5M1l9w
 lz/2fi+biIjDw0sMz68Jd5eet6uf9XoLQmKkMhTUTePSYX2LL/WLVQ5X+qhKliyzYrfJzAkNPPr
 AcYh5hxuCA26oANOi8g==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afaea69 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9THlnupo0N1hDek0eNUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable the PS195 bridge driver as a module for HDMI output on
Qualcomm Glymur CRDs family (Glymur/Mahua/Kalambo).

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..69db247447c4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -984,6 +984,7 @@ CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_NWL_MIPI_DSI=m
+CONFIG_DRM_PARADE_PS195=m
 CONFIG_DRM_PARADE_PS8640=m
 CONFIG_DRM_SII902X=m
 CONFIG_DRM_SIMPLE_BRIDGE=m

-- 
2.34.1

