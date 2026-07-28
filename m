Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E143304E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240047; cv=none; b=F+vq0hPjXyIPmQ75hz1BwxlYxZI3RMcMFwIfQaAzbvJ2jOCpaaAuNH4thlTqOUvcLHtKPAqO02E8XCABEt+t47pL7KEqWsT3qDACcYDfqRlBMhyD10hsn/S1k3yXlfji9dvCTGv/6dpAg0YjnoXY8MkQlEx8XodkSbJeG8LIEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240047; c=relaxed/simple;
	bh=sW9mBhhxr+1qQDybpadrsCgU0ygnINjIH8i1kMNl+hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbdKEP7ms+Evj4VL3ghq7lvIkMI0e1+ZNgpuxoo6hHI7WNxG5oKR6j7xtD7BDBeYki1CTuBt/rSYsd990Q9Hfw7rG1Oywha1hHtR24cUDAh2V9k1HihfJg3OhqmcaWujz3MB2gdKkhLubDpnnrY6ErPGiORszi0OYWDZ3a3OAkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUCFAX+X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0ML6Gr+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUCFAX+X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0ML6Gr+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBI0vJ2606287
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4op/fzpu59fln/5Cb5FkpKBJCsrVF9h8vTAyVAnO6E8=; b=OUCFAX+X+q+kDvBb
	i9XJi1osWm9evY6yI+BlY0SQkQAO73nJNp9Qk5Sd5YUdIvT8p9zXk89elByGr9Iq
	XR/vlm/u+cMbd0nASWUfACog9CZ9rwUMZXqeq9ebT7cncUyjv9zo9vnSYXDoaVV7
	y3fG7icmvgRut5COf+I2kgLdDLg3XL1myXJYPjhZ6cUonXEMDLyD4PKl1jva7+oT
	Ljh45MZU2kuP0SSBSgiB3GCCOLMX6a9YGQofJAWzXPm+s02KPaWkiobUwAxT71tB
	W6flrlOV0TZ8vYg7ZZyzvp8wZS81zY+Excc72LwYhc1KHdonXk3tqpol2f7hsij5
	tjXrIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19hufn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so76055945ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240044; x=1785844844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4op/fzpu59fln/5Cb5FkpKBJCsrVF9h8vTAyVAnO6E8=;
        b=g0ML6Gr+OLnBVcvZsB4BoF7aKjdR2eIDPGeRpt/EiwP5KUs3+64z3NCW10NNG3Alun
         Z77OptW4sa8K+lS+Wm9oDv7k0H3IYqR/sG06+tdIlNsE7uRnl4KqtGcmt8IFFj0YVgMc
         ixeqvA3wk+hdL/TZ8znm8oGLqZE5c5I5TMkEFHxbYzubimWicP5J6OiGFr+XqEYd77Of
         dXL/HrEZOK0HzRDkmgOrb3yWPm+N4tCcQjciwJuULiF40fHiajPoLZJwCoGiFWr2DCpu
         Kt2ksRxIgqrvIZqrtny6Y66SXL0t+Zr6FfWC+vptqdRARMDdmH+XqpCXvnHnbh5KtY6z
         5KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240044; x=1785844844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4op/fzpu59fln/5Cb5FkpKBJCsrVF9h8vTAyVAnO6E8=;
        b=DnVtn/7EbUAM2K3ir6RcoGesTXQX1SuXBHu8JxO9vPU88ac9llNshvRutd/f/EFfIY
         /wrolk2gHIrnKCV93m1IOqRg+PbYI8RsMqQighvF4Jeh16ZGzU+aHFaP2yGbGVFgXPwG
         /VBZxLEV6+mIkh+WgKw/Sxcr3x83Od7Zf2eLuj5lMtnZV9JNjKZn0lsiqskuFZvHfsjb
         hL9zit1tMbFbasw06K7iDhnabK9YqXOMEa/KXIKqP7GLU6rcY52bLZzFx/Wfs0B1djfQ
         1Ik/Q+TWwOGn34+tn5PgAjnaCyWPCIe2yv1hXRO8BOpVeNVs1pI6m9GPCPWzqwfEJ+G9
         2N6w==
X-Forwarded-Encrypted: i=1; AHgh+Rp56SDfCUWmRIUMzHcui5YhOg2+xEbHrwdUh/dWezp0sHJW4ek+4PwUTvCuOyAN3MCavKZVGhzeUMCtIPet@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4LYeYN5LkrO1y6hynfv9Xvhnj4d9bc/FlZl6Kfsf/+34RoWX
	4bk5wk0pckm0u7hmKCFW0ZuOYHzi/2sDYzw/5+c9gQRQkIB+oBw/Z1XWkcmvQy/RvCRVj5RPtsI
	dqBLZ7TB/NV2DqSXYgFpgRu0tKtCcEYNgSsoJ238Y33v4U67dOWnqJeATYa9gR+4jxeMh
X-Gm-Gg: AR+sD114CX67qgjxFaXiS3W/eLmmwEZnI4ep6Mrs2inzYD89uqSuUKq53wj91O+REz2
	+yC2cCcO5ibRTd1b5dEb1iQnNDeZKcUGING7qzHN7Xred/IJA96P5SCBPWN/Kcf5kou+hQ2USot
	vSPFdqGNZ50ZyTXNH9KhF8h18/0IcTtTHmjtJ5TYGhslIT15Hhav7fD846uHHGXTbTUKRc8yhKU
	J5tLTjpZYNPukDnjXFIwiaJhrAEzEUC4oED1NS4Kk1hVHUMfjo8jK8oi8nkhfVej/UkhDG6RzIo
	24lWbYjYORwVUnY8r5+NrVHHVluxVLCV2U/n/vjW78+eyaY9ieaH+3OzoJT4GN4mYETtmCqraCK
	Sul+oO6PWdfDDmpUcBopqCH7BWQ==
X-Received: by 2002:a17:902:f785:b0:2cf:a2d2:84c0 with SMTP id d9443c01a7336-2d015a09143mr23174955ad.0.1785240044065;
        Tue, 28 Jul 2026 05:00:44 -0700 (PDT)
X-Received: by 2002:a17:902:f785:b0:2cf:a2d2:84c0 with SMTP id d9443c01a7336-2d015a09143mr23174395ad.0.1785240043559;
        Tue, 28 Jul 2026 05:00:43 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbe01sm51764895ad.48.2026.07.28.05.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:00:43 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:30:17 +0530
Subject: [PATCH v3 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-shikra-work-v3-2-e08c322596ac@oss.qualcomm.com>
References: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
In-Reply-To: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a6899ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JLjO1t5ekhtB3RsVtqAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX6i5p28jb+pNn
 AhnYOaoUUompfthvLEcR4wQUIlpLQiUJKtZalMK/+nOua5pyd5emHMtWDJvQredRYxSapPTyarV
 1QKvaKIZeenucUO1WmI/N1ws45bGQnHYQWOiq15cNGankNAcWMB9A7ax1/q5/z4exsXrL107r3k
 BQ8THjuEQp+oobXT9UH1/d3IHWn9UQN/49elmN0s91Y4Al0qVSz4c6wXMZoswl1fn1Y2FuFIq1x
 k2vr8vtRtpWNGkksQzI27ICl+il9P93rchxqPpi5ifoZJhb07BF9A0kNjqoDqihVlkFHaC+No64
 pzkjGCSAV+hor1jDXBQoXuMRUWAvUt90svlDkkVxDbkeIaK58l8YNDL3EYo+PZDhH57oFGooXEv
 OpWW3tF+Mx5FYy2cTYQHX4QsR2Q/jBHoKV/BgXTnP6tbschPJLVsPxjmvE99IVBvDcIJNJWXn1H
 GNvkE9K36EFYKgouRsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX5Q81M34v0DcP
 6JhzxshXsPlGI6F5l7L/R4/PfmmGFwTZP8819CGY91B3ZdmPu5C6mo8ZwobLvyruV3Z8xG86lzj
 gToikkECVDmO2y8lTF4qu0XriFfEr2I=
X-Proofpoint-GUID: Y7jHlvKEoaRrjR9Kdnfy-9ZyGx1ceQiN
X-Proofpoint-ORIG-GUID: Y7jHlvKEoaRrjR9Kdnfy-9ZyGx1ceQiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280105

Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
This driver supports the LT9611UXD chip used on the Shikra IQS EVK
board to provide HDMI output via the MDSS DSI interface.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e1d8e65782d0..8a6922199545 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -965,6 +965,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1

