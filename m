Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353243;
	b=3OgQQj/Zzgd9Lib36HKgN9+pM3jFNX2CGLMgxxlivevpE6sDEk0ZY94yRI+IEsORwD41
	 sm7m+9gYD6jkI3o3euO6nQRBRxhDBWMQRLgEGsqNxNyUD1mzTEwDV07B6xm6YzbGhSwoY
	 oEUpEw7+c2nkdjt8CGxjlFvIY+Swe8uTnlcIhuAKjp0hSkUH9FMJQVEpMiDTFDWdZNNHp
	 nSIZ/oLr9GEw5wK/IFd85PKog1o5x7kiPSdTkUdGgVADuXQz7jhyqJA2IVf+D5WWbVGEX
	 qtCB/C7i1D9fiBMixFX0uIari9i/AXxi9BVm+I7yKnHcbtT+6D008BuFEK7+KU2RXmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
	b=QIQXTPhQS/lThsAVKfKuK4SF9yBJjHR5iKtTSMGKTS6eEFh1w75mKwlHEvZ3zkSHixCA
	 LmPMl2Pfg0Xh4mxyzMklKQU6Ui4LmszNHtxGOH+/WVLbRpuB4kdmHVYa3ZpbgptHixfDD
	 3XvXMryT3Zz/PHj97es5O8kQwcfAX/R80XpHvTyD5EYV9deRRsOTzQvC7QhvCAjmpS2mI
	 NsjR91cqAxEFbhuPDv+EZ3DxN+ClEmQ9fxlUtlLmVSdDCEI6iJjPfsHm1HYc1q3G8mrT/
	 OlTIWU91GIEpwsMVHzchiW8y66XMxVH+oOxP6scBCM/fsYRMQIarYkPgAleVncrhkKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m/07jegu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D/Y+51DO";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5460A2606
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC5460A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m/07jegu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D/Y+51DO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F1TF3737858
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=; b=m/07jeguMeUQJOhu
	wjJcd5PtT0pzOD0sTs4QZ7RAzgNPdFaUxQZHR3Lec8VLWVYcuZJYF//oD+YEisBF
	miGuoCCcUv2kVP+K5SF5iUu0CSGMGLqCShK1HwYXEKxP9WqBSbX33g7HP7LMKv2R
	UprtO1YpuFrIYX8D15EBuPjA3dYeC2Wcd+cN1O8ryBJ4X+WnZ5P6W5uZiyk565Bg
	VVtI+pySXNyDP9g8fSlVyaP2qKGgdH5SipYmLlRXK76ytssVoZISV2bjjXam3I4z
	LVXiDatkFLsOrhSyaZK1C5znsSKJdI1bfiIrAfW58pBGJw5a2B4akFfrLmdsm7z/
	rCkuww==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75278a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1029134c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353241; x=1793958041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
        b=D/Y+51DOfJbq/Lao0kArTWj45Ys94GTHeoMZCnGMY2WXDgXNhvWaR1zR/hfWBxf6rd
         76w30vYO4+rg4W6oT/j1lMwPPdtZsuwNTnddWgE4xPBlvI2fN1Te1PLs/nWx/8ecyIIz
         fcqN/ekdGuPNVKLm7/VUddV2Np7Fq4F4x9vMPFRhLsYuAid5nu4RJPnXkQ9eaXAmAn8Q
         Ek/fo0ClJYij7+Xq5MVsAc6tOi/LERMVpcsPc0rlzAdCmw052aetQMoay8bxFZfFRImr
         rQR5i4LJ4ZCZNeK4t0oq9hfXYod111N2LrI8Lq2Tg2oDErasWYMBHfCVjOB7fTpoh7C1
         /RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353241; x=1793958041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
        b=GK6ytmV2UWOTuEp9BV1I/xHJrV8OwE34KfAw/MzI3S9glO+U0IwOeu+4n/vMop433H
         Gvr8JCQZ6y34IYvyJbrWbrx5l0XLX+/jh4pTtEnc1ztimzbn1PwuQ+mbpia4RkJFMSmo
         ZawqjeDGRcfqmjbjFXM9gLCkMHhPVPumnC+u2XZAMV80bSndC/xK6vZvpNE5U6tUNQp5
         MTxC3vDusfUS6pIUkuPB/2n4YEUyV/Jrmv+JXYSyC/1Wspa5n31NAmhzLhJ0dhz2GwAp
         sXm6COS25fI8f+I8UE6kQm7cD7Iv6+zeyRUQyv9uAX8JmZ2BGA7Iec3Z2m5MOJkVe4nx
         Metw==
X-Gm-Message-State: AFq9FYKWDxYBrhxoO5XnNwb6Bb3T6i1jBg7LlBch3ldrjz1IS69o9ssT
	Hq9LpucgErsXvqIMpxjrI3ESRZIiMXDHKxONmPVSJnmDjUnt/a9wy5hlht7ONR2b3sR81Mbm23f
	2XepIzHe7W0h0D/bOsY8Og+F57CWX+H/1p1Y63msHAeGXa3jkBwbIQ6OcjxOqcfTUMerJ
X-Gm-Gg: AYBFou1vtTrxNbwMwvHsWQ8aa5wZiIxRFWSOxDRT3KPW0plDHB7Ucv459wbeNAoIoHW
	/gNE/spwVSglDwDfz7NhYLWfoRHoIE9HdsTDbTl2LJlZF2WCb09dBMrIse0zqhlxPzSi+Csm/hd
	LPI0AVgxS8r3jAVis5hhzkAaI3+jHXSRsF1u2XAFlMQCyvlkTRs0ovw1STjMhPNYFkFvdsuIzE3
	KPoCFMMKO3F/twi/E0fkwLd9RVK9iVUgSuot5qHHC9w3blBAATEwWKuBkeVxBr/Ks2c7EHMuddc
	R9hA50YEWODijLuMzk53SG8RoUBmOgsPFyS6yLPB96p154B8jZhLuIpPrYiosUMcAtJC5iJS/Dm
	5HnnvsTiWaI4Yf8RQHJf0XyH7KY6UbWf0oVNJQfyXYBhQ3B6UG/RQbP4CRzexGhJ/7xat8rqWsy
	9GtA6X
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr2459705c88.27.1793353241188;
        Fri, 30 Oct 2026 02:40:41 -0700 (PDT)
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr2459671c88.27.1793353240473;
        Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:10:09 +0530
Subject: [PATCH v2 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
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
Message-Id: <20261030-lyra-display-upstream-post-v2-5-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=683;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ibeQtMqFX8c7zgjBUXuxtpUpCw4tiu7UXa9CVvzuzQ8=;
 b=xZy1v3yJxpgEEnp/0GEy3IHTrAvHzXOiPECRrvHRncpdH0z6F+MunUlikP1iD2jLtS9DagvwY
 RSOxQJSEq43C/5Lz/ujnztCihDlXO3zxZKaItM1K/qYup5YQQr+y0sX
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: hveeW80EP3t99ypVyuVy_txuW4gk98sU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXyQm3Ud2eOoh+
 TfbyKDjLa4acZE+6fN1blrskj2wbY8JmJlLW5a6yb4UWEC6KuCaKOE8it3XExcZuhHk9oLRVOMm
 bvoRYHoO73D6xLMZbCdOaT4NdMoynVTUlfPn+s2QPnw4tRXvQuXwfwjoYOISo7ZVHOy1Skn9tnX
 3ziCXt2rGFvYXusFqRaLCywsLSX//MeZiiPTTmJJQN1vn44q1QAVQjz9ynl6Tp+dr8yVXOzwCKj
 rMonCNkA+Ek0NYkx/VnXwGve//QdU5XN4E2UetdUP+TQio8zlTAgeFaFYFXefwZFkCOrRttxzLQ
 0/TVTsoqAYQFz+UsssYdbulzYmHr29VlFvYFNtGn4MuvgbBiB8e9MpAgDDI78uO+Pf0jiJ/WyrP
 ZLTz7h30RV679ytQaq6b4O3j6E1DKDP/L9E3oB2NbUEFZqRmtvlOgvoOdWj5kFCeMSyc4V6mngY
 tJceQRo1j92741unUCA==
X-Proofpoint-ORIG-GUID: hveeW80EP3t99ypVyuVy_txuW4gk98sU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX0A/OFeWC84sQ
 RsywuPW636bm2JwDvkgOQBcQU9XCn2d5DKwNCwHrKM5zpB7cqW8E7g2VfQsg57i/kv8LA3L2Dn2
 dnPKmsUzZ5IfglmVwD5/imCzevRA2Pw=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae46619 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Qualcomm Talos Lyra EVK LVDS panel overlay
backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

