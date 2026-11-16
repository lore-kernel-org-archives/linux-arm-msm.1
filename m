Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828885;
	b=AEn8I+0hQA2O2KO76LUr6c8sspqNN0ubm+H380RtKV6eGyHgwPNLt69lIChwSsDJW+vf
	 jfHXor8hFmAIkNq4wYic6gmH/M3pmZ2Tf/+Wo9x0n4n11k1m6gOoNPhEoz5OlsEeTLVLA
	 7Rw/j9Wu3Nn/d6VZSWIwmSeYNbAwPA5Pp9EATMXK5VeJWwqrPRO7x4PCjsqhiEptuUZb1
	 0cQdziyURLItsRhJvFXApkRH1RlFgRCgYsJHGnHKJtRDgfnpx2g8soW5ph8wHDiHdZ5nT
	 S4L4FuSaDVw8GCjm9C2axZ58toGDBYtByg2KwfSv59igJrFTBtzQfGxE8uhLkJRg89w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p0U+0MgseieCY+eZgbxNlAGFpXCIrXZzDYBXpqCiW0I=;
	b=T8HeJOlOevIM60F3YAoget2RY6Z++QDbEWfxP/pKsWIrCS/Hzoqi09OVOAv2JlSIzgLa
	 oS/y9Dzpw5O7SrY7oMLw5ycvnXqpfaMzBcFvGqIBprVfH2/pjI8Kyvr1sQ/jEP8ANO2CN
	 sXrxnWSs5EoNqQ9CM/XLHUJZXOJkR0kUsL8Mp754/3XKkmjrKeQTn9uvZlrU+MLwfmTnD
	 dm+lhrblH4NpucDADqZUdegALcCgjrXcJD5nN6qNGRNR7ihqer1CivFIGKQ0TUlAtLcxv
	 iC9w19TDXT/7RLjqERKBVxsZchvYYn62wYDrj3uagM5grideya62PAD8xWLmaU9YSmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JD6pU3sV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeQVMsCU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2EF606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JD6pU3sV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeQVMsCU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLYQb1016218
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p0U+0MgseieCY+eZgbxNlA
	GFpXCIrXZzDYBXpqCiW0I=; b=JD6pU3sVv6KXPfTVXYWh2QhBBZR2u7QSDCDHEa
	H9QRMVKQabwfChms+jQ4uE7a6ndYuQG6A5atqfrJY6nUEPmQZOszaPXW7OiqvmtM
	BZ5F1wh8bXDEkDzOXePVtbIZ+aNsxI4N6bym5MFZVS1Drsfvj+rt5nFeHjVNHfug
	gA9+1rHOuy/jA1V+bDncMDiuY8Kndfo9AuvoleKm98H8YG6fvjwIw40hmcG2f9u7
	x73N+4+HVIDBswyH0Bi8mfc8qBnd449Q12DWL1k6nBt93lMpF3pC6BpCUwfCFMYG
	obYGFz9iEw+tBjCmiAd02lD843tvFsUhhqw2fyBRLKyDLoIg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003g894-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:34:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b19aa066afso3327378a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828882; x=1795433682; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p0U+0MgseieCY+eZgbxNlAGFpXCIrXZzDYBXpqCiW0I=;
        b=LeQVMsCU/7CInPV69T6C/PqucRsSUbavnJQtzsISHuLsYLN8DelsxFBiJIt8iXzrLG
         Me7BtmtixQwrrJQQsBWTqeA42O0HhKM/PaWsbiMyUuWLzj+6I1GIoaF4rEy66+Xd3L4R
         eRup1+v4cF4yS8E2n36ExyhX3bIcKmC0o6RpSRYWtKr6kxqYj2k40wYPue2fUx8n9NaK
         h7eEGj3o90Y9cP1AMRwW91SVgGy1nTZGpBbzEsH0+3eBrYs6XefRcR+LXlwsyZ2IA+t/
         3WreKg8TdEgBaARvQq5lIXPbaTUaqHGqoVQCtZnAtfyTZA6wWBINDquvXpUdIWL+K4sX
         0xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828882; x=1795433682;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p0U+0MgseieCY+eZgbxNlAGFpXCIrXZzDYBXpqCiW0I=;
        b=VQoLmmOxOrGpUkl9wcJFHlo+FqJwcPpLEomB5Kfd/mT40zsRPVRhpIzoXqgNXQbZW0
         bb1v92+QUyQ7lb+xI2Fui4FofS5n/KBk5/PgCZsM6cmu2wN5H39Tz8livRmMn0hRsZxE
         WcgZ5/BqZ1TEHsISzVrAu5sqInI6oVgYXUELTgbtOp3Lqj0CqXDi6HmG9w1dB1OmJm+Q
         /IpLKjYe8l26erq6C9fjopCRjBojsqhYrSqu8oYm7HiEyiUseM/KyuKyx6PYpSbs4BAO
         92/SxQYupKNL8dzwx/HWcJKuQ7p51m6vGYASpyPIPNZIV8r5hHOqY8C/bIFh3U78YsKp
         FNdg==
X-Forwarded-Encrypted: i=1; AL+hErGRq2PqOd8d1NfdVaZTGEeZGRC302r+qaTbb+uUrJAT0oCUxih1omyDokee7o5CxDjmemhUPiufYFQpDV4v@vger.kernel.org
X-Gm-Message-State: APuU4Z/+xEtzC+aoacUCcOtSIc7afxYbQWEpamRS3UfoebAt9YN2tHkk
	SHO7kczNB4XY8J77C9GQ7zYjrnD7zbqyjWxoI553d4LF2C/VbFOMjXL9zekR0yDRkaR+941/Hy5
	OUzNv3WZPvbjwt60KKKYNH8KN69/j3uH3d3qiGs9ccTdHPXdn1VFKPvx+Fl0SZVQopeyd
X-Gm-Gg: AZFdTZfUOi0M5NhxWOHptKfxCYu3zhG3YwGVd59Wb3sddhtYkJVQZjFlD6j15TrulRk
	mALJkum1IkXOdoQCC9yfskieO9MJSUM87AI91oFfjcY3K9J9KK/x2oEzhwnv/kVJJ/9isD1S2Y7
	MD2BgZvg+nytfabmpoSTAFeX3WN8m+jyMjjeaJ4XovmGrQxAfb+dmVv9pbEVUQFbMF6jGAYbO5/
	qXLciy0sCdgHEbtn4kmZjlm3nxi59fooYyi9ZQ5vCYXNTWxrMi99G4Ras/r1nIWIrkx5li7/HOg
	cS4vmk2TbfsgkA5e15FIO7ZVPPfG3+kvr9tcr3Yw5okFjAHClzjSOpo/uLVRqKjIXPvqmwwD5Yw
	sQImqKTOJ76Hn94K6kxlL4qDIqUY+pZv5lxBV9+ahjULzDAxfuGnsxJSAeumVc/zZqwWd5dgsB2
	Fi
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6683752a91.39.1794828882508;
        Mon, 16 Nov 2026 03:34:42 -0800 (PST)
X-Received: by 2002:a17:90b:5112:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b1b0d481c5mr6683708a91.39.1794828881886;
        Mon, 16 Nov 2026 03:34:41 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:34:41 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add Parade PS195 bridge support to enable HDMI on
 Glymur/Mahua/Kalambo CRDs
Date: Mon, 16 Nov 2026 17:04:03 +0530
Message-Id: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACvq+moC/22NwQ6CMBBEf4Xs2RJaEdST/2E4tHSxayzVLhAN4
 d8tePUyyUtm3szAGAkZztkMESdiCn0Ctcugdbq/oSCbGFShKimlEl67UQtnPYkjYn0wZWfVSUM
 aPCN29N5k1+bHPJo7tsNqWBuOeAjxs71Ncu39FU9SFMKU1d7WRlpb4yUw569RP9rgfZ4CmmVZv
 gRT7M69AAAA
X-Change-ID: 20261112-mahua-hdmi-8ee75b4fd29a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=3388;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=CEPQAfrfoOVFKYiKvfmvgizAwumAv2PlKkCejyLCjNo=;
 b=hRbs9o7wPDhSjnLNtvA8ciYcRV/oTQJ5GNv/Dp0qV2W+e2dBnKRX5ILctpkifimanUrxvlgK7
 fd0Cr5MqwiqDh5isEcGgP9jOMNL3mcNewIPNYORuLQgcszfQa0fx7zw
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: fBaUSszvVHgQdETgeRfoQctdduZGpsfJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX8zTwu0XAk+NV
 4+9+frbQC4M9b/PpkLUJQhXWYkl8/VapW+hP8LkiCMIUOQE19GLSBp2+PfR0QwiawPRGSEF36ce
 6LYn+aAxEIRvEBGyKu3kg+BrlcRlLZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX/tUrRWQBXZ6F
 uuB/AqWwhRyY6DFyuiJqDnRsyqWmQSzRQ/B2ReAaDz6oVeQBaDzsNFsMRyCVdwm9mmFrXje1WJ7
 LXiwRvXzbbRO71YR0tEVZYMbZq9PpzA1fhZokxkgGcMMdVr5B0A3pnwkBOpq8R7CeKGR87X1Xh8
 bn1tsfOvCL+RTfeMPRGzR/WKPOOvQd5Em/mZ3M5/y9eEuVgUlIn8JdCrtEap/QffwzvrDGMWovF
 ViceE+LQ5VCz4psbRjVcXTPWSgUasc3RMRETA65nfx5K6jKTMf8MaT99D8L9pJxpgooHJ0YBlgS
 LQ0qIPz1+YTvGAXCVuATW4vW/x3CgmNvZQB/RsTxaE/5EYbgUSPM6fU4NaoY3Nb6rJEZ+A9dBih
 +kj08i1CvtRfFW031DQGoiSw7fb6hrf6ekyYDwEXK1VHeP9FTwtXwnKwIRtS8W41JN5qj072n+c
 2dTPKQugPPI6Vy8RZpA==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afaea53 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=Vl28STUz-e5Og-itK1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: fBaUSszvVHgQdETgeRfoQctdduZGpsfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160045

This series adds initial Linux support for the Parade PS195 DP-to-HDMI
bridge and uses it to enable HDMI on the Qualcomm Glymur CRD family
(Glymur CoB/SiP, Mahua, and Kalambo).

The PS195 operates autonomously using firmware loaded from external
SPI flash — it handles link training, EDID access, and hotplug detection
without host register intervention at runtime, so no existing bridge
driver fits its power-sequencing and reset model.

It introduces:

- a DT binding for PS195 (supplies, optional reset GPIO, and port graph),
- a DRM bridge driver that implements PS195 power sequencing and PM handling, and
- arm64 integration (defconfig + shared glymur-crd.dtsi wiring) so all three
  variants can route DP over USB2 QMP combo PHY to HDMI through PS195.

Deps:
PHY PLL change: https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
Glymur commonize change for regulator: https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/

---
Changes in v2:
- Converted the driver from a platform driver to an I2C driver
- Replaced the platform hdmi-bridge root node with a proper I2C child node under &i2c13
- Chane the order of power on and reset action in the driver (Krzysztof)
- Link to v1: https://patch.msgid.link/20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com

To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

---
Mahadevan P (4):
      dt-bindings: display: bridge: Add Parade PS195
      drm/bridge: Add a driver for the Parade PS195
      arm64: defconfig: Enable the Parade PS195 bridge
      arm64: dts: qcom: glymur-crd: Enable HDMI output via PS195

 .../bindings/display/bridge/parade,ps195.yaml      | 111 +++++++++++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 147 +++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   6 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |  10 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/parade-ps195.c              | 204 +++++++++++++++++++++
 8 files changed, 487 insertions(+)
---
base-commit: 944e974742c54a1d8236fe16897644c35ffd6433
change-id: 20261112-mahua-hdmi-8ee75b4fd29a

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

