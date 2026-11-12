Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478569;
	b=DJCq7hGSKfF3yxJYtOOvQ3cgxUNEG9uc/TL7vowN3O/fweYSWdO6IBNv/T60ff6UNH1z
	 +CazClenWsjTTbKSgodKS3waiNSPvy9edih0km36SNkBXTDFIWajV3TiUF5VfaWCMKSbX
	 pmxFD7dhhZkA7rz64ndmBNb02rL8IuDbi1ICEywof4goPJ1+bnHSGHeKlGhQzyTiPhvCd
	 hEnnDIT5QNVxRK+E6Aa3WRDAXIDcbeOmElqO4Yf6g69IEW/T3BhbHjyhsPqv3X4fSRVWR
	 qLGSqCf4PvASSbAb2ZWPiUAoQKZvbJUNvFZpP0GBOtCKnp9tU7AWrCsJ4lWA9EF/Vzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
	b=g9EN8gWVxt5mUjh8fOfF0Yj96vcIpQNb22Ck2o73DwNUzhFy2Q93HWaJYCQgwkKOmq2v
	 o2DZe71nYkDz/geJgQgA2e6ewe9/YohA92xZd8pQJz/qel1fBiTvc/UyUaal7cQwGazaH
	 Xkife30M43V9sZWtFxStKI2xcZypgps85qa09g8KRKuktSf2V9lrzE7+q0gHwlYUyOh4U
	 2lRwCC0tj1dejzXj5V81FZeOtfdOGs5ivTTQSipbGUEcRKpqJdjhg6iGubUpL6KUaxgCk
	 wfkYoMLWDO21rGw6fWPKEpwZmWnGsroBDWJW0QHckE0VLS5GlZZKfVHTVFy3rwF56FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpVQj+cU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmm5dtuj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D18F606A8A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D18F606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpVQj+cU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mmm5dtuj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC53j6P3476753
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=; b=MpVQj+cUWHnQLRRB
	M7ODXwD5/iVwvCTq+2+cdi+Wmk7DMSDlL3m9t38XikfXP7kUWvkvmRW9Du56HaJU
	ThyPlxdQ2/Zz7tdzJLVKOAFy9sQzUrHp0ogk9v8gRUGTMw1676lIqAxyHHiPUouh
	qKKNu0W4c9MmiGuu/10RSvaH1EAsH+DYOGBCJ4pQqRVHf36CgO1MghQ9HwQHa/o3
	vZ/cMHJHNeo+TX2rkt0kOv4tWVF0SihjHUYC5aPDdqULA1mBqQV7aBUqxK62Aq9Z
	o8yKX4s0H5IrhrRQiLqCtvGaL0Tqo3npZuuaZWWZE4vHrLGCOA9DUXLwEdF9+bfr
	xUkcSg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuh2qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:16:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a079256596so3258921b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478568; x=1795083368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
        b=Mmm5dtujVq1k/Moh/Ow7AvNjbYwzh+OuEbopoYgXsCoBaAUzDlRergg4eg4//lYQz3
         N7/MNvoA8FenqJrZodVxbjZbJ9dmaaWtEaYOTCTpJonu38Ua7XfKbxCY8k3CP6afejFC
         9x4Vfq/u7ulHNQvrJ6N0Dci/XlYaPtbOO4v5t+MpO6suod0j7xVXwkd+kPoVoufDtv9k
         UC1IP8DapPd8wcj22GtyEAhSDphDh+M+aDwsue5yk0Gb/ptHfqX7EG8BkJK+TRzGFvO7
         AfxGPv2CJjPScAOvQJb20UEpD+qTOV6ce0lCJoiMZajxx9NVd8VUHg0aJN6YIc/WCe3P
         TW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478568; x=1795083368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC7j+bLk9a7PYeEVPSKQ1oQw3cXefAOiXA8ZNTCvJwU=;
        b=1hg2SfywwvySeZ7hAkOKl3Op7fSe+F99GGilIuKUCGOKTs+E/tjWKoRa9G2WKJtAOJ
         QA+SorYfGxX29MWdGxKSJVIj0dIPSWbzk6bO7IUhLl+KDQGcS0MPn/yI96gdUXTdEFeh
         bg7WzVEtvEdh45NshK9NdSl3wsn5U4xDeNrQdxja5SRg57VcQNYqcvUNZ7aaZi/eKs0b
         kLHE1tycgyf2fI4mBRfzo70Y6s7ywGbNtXi1CslrijYYNETgc/zit8kos5Vtcqm8nVzl
         DiqRFtp+yRtROQ5gNFk0CEuSW1hogRZ788jZaj9K0Z5jXvLzoYux/bDvEcSELRrIs+Zz
         875Q==
X-Forwarded-Encrypted: i=1; AL+hErFSgf+xA1YRB0fxwT6GZDRyo/Yd+xEd270xCma0BT+p/UVmyDWcqTGLnAvTL/zMvZGU5nzzgM2DAFyrVMnT@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Awo6QWkKHhUnLas6z53VZ8dZfcHlY/350dhHxDHpc0yVmpME
	sKxXQYlM/Z55uByS8efIBt/+Um/WETk5C/NHBZm35LpHUn2ioDlhHVvo7fDwJjzc3zSKJhOYZ4c
	AjiJtNX6i363q+ZSvO42FDNxtgdSjgG3Tbv0KHPA3crDn+BraHNoN9noH+jEiJH/Q0ti5
X-Gm-Gg: AYBFou0YMG5o6I4jSAgP/yiUrTfjp31MYT9p2tQVyauHg3dvp7R1U/SnsxGtg2/TppY
	1oEcIxeW1gsqAfTmLqn0ijplIG1LPWYmnUPl5YaG+2VlrNQ+p4EjUR81d7ZFi7fvQRnN6jcUk+/
	inRcv9L7bgNYIEQtSGTaQoV5diT1OdEUINak9tmbMxDMPf3bynlW5UiRFWgjpq4a+5GfQHQsm5J
	YaDxTh3Xo9wkU8OPD6OCW/YWb93Bs8xAu/G/anWFZ2Grco077Y3Cs5HeKFwDSJd2VwlKPkwASQC
	y1p3ACBU9smxriqWlDbBLxtvCj2TJ6ro1Dq7Wxu7m/4b+Zd4lK//bYlVTaxyt/8TGbvMPzOp0Tj
	0HQs6mUOBi5KUalHc42uFkPgmG0XQwyMHhm5qoF0A1leCOKYTXwGWRszCBy5+8yo4LmRo8kgP7m
	nG
X-Received: by 2002:a05:6a00:18a1:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-8bc1ec7bd3dmr5363809b3a.59.1794478568172;
        Thu, 12 Nov 2026 02:16:08 -0800 (PST)
X-Received: by 2002:a05:6a00:18a1:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-8bc1ec7bd3dmr5363785b3a.59.1794478567683;
        Thu, 12 Nov 2026 02:16:07 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:16:07 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:36 +0530
Subject: [PATCH 3/4] arm64: defconfig: Enable the Parade PS195 bridge
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
Message-Id: <20261112-mahua-hdmi-v1-3-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=743;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Op3gUFINVffD/rIMQugm4ViW6Z9HUJGr5mZ8N4cmk/0=;
 b=VFt2bDLQa1znRWwkyQjTJ6Itr1GLQr2wmVOMbafYoqo5llfO2tZtAICGK0DZFNw8vH2heK6Pt
 R1UPFH4ofI9C02vubBJ+HpSSnAxHk2NN/535QlUjIeWOuq0iWQ6SRXw
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: W3TWtCHcFITJ2FEFgPOMElhIneEPgF-0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX1yPwDPno7OFv
 J9sXviZmaCMEnGav/YD4UGI6Zq3X/JEipPzUTTJR4LkilWHFv0/Uv/3gExtOX4CWTmaEgQo3uEJ
 U/T5UWPMF5TyNq63CBSGrMUfLU/V45M=
X-Proofpoint-ORIG-GUID: W3TWtCHcFITJ2FEFgPOMElhIneEPgF-0
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af591e8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9THlnupo0N1hDek0eNUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX+baNedPoJm3e
 Xl9bnLDh8U4h6nsouMYwFupEdbm+H6Z5/j3SyUTBwc0QvYP21q1hNrrti4lJYP6TIzgoCqN1ZyW
 OHqfy0xjJ2YEJRe9eshLK+Iv3YP5iQbnRMlXKjYvNpYwunG3JcA3MM+h+bhGLRhFTh5LJ8zsU6d
 +iOXow7wXAcWe762QY3c6EwGv+h4MywXVSXyRkf7gm5u8fE0z7gvk7Oiuc3B4jSlDdW1mVnOcLq
 3Ig8zCIiqQaRAW+tka1vAiQelKaN+hklNG+SYpTOZ0ii1jlIXhkhSvlwgS34bm5p8XfIrlyezuE
 tkws7PYqidNuwm9PcrJ6uByk81JdoOhewEpcQ9ckrV30DzjFvWsGv7VTEGX6hCnvX2R4Jbvi6Vl
 XiE5srmDZ/n0EE3n8i/DF5LvxXZen7PbXDOFSfeMYH9Q92H6rgTJmtbb/1aP5Klc+F7u/dxF3cN
 JBWZHvys6JdIo6kDwyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable the PS195 bridge driver as a module for HDMI output on Glymur,
Mahua and Kalambo CRDs.

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

