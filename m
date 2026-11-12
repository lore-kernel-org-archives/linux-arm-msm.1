Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478549;
	b=vCEz97p6vHRV6+jcBgnH4xvabblpRcCUcqD/dIylyyZMxZwVF8bYmCsjyaHVTzoVUNGZ
	 I4u2Hdsl7NlY3KlQygjVkPzW7vAsyH6Q/nrvEIEnwUn4jl3YdUzJphBSfkalvKSAtr+Bz
	 xMde5tFnAKw6FGkq0dh1yoFNE9w8fMKcfT24OLVDqEVhk/8tLC4CTBppzfmLUJVoaV5kR
	 DvmEYH1yLFzjNDnv98DAvFGPmdojaXcwIX4JkWGXdwYoG76j5kScDqlVVPvf7kE2wEnab
	 3NAuwOnaaR2GBB29Zl1780ObkIx4uPsU5dZn41Ea2c0OVHPL8B42igooLMJixjsosiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rcf7KX2/k1jjCd0zZNcv+h8VDra3CCI6aK6Rh3JpzWs=;
	b=UZSwuIs2ewxEUiEVZP1DUxRJC2sSohJByDdXoj9MPtvHiuHmpVn6jqEOtR8+L4S5adL3
	 GDPWDjrqVw2+y2Rvw+bCTodECkWop3oISGgHkEycY39VoKqselRz6QOrRiiRj8GqPwc46
	 kdy7Yh0WMPAOev6zGO/3npFL6cdz3r5xOjZozDWbZn2LzHNMYWJsG7DBp3nlQAP2yP0vb
	 Q5Yrv5TbCVEWuB1xipHlDlr8fKAilW8kGY6YyWyZtma2z1jTIZgHO5x90yYlf9BXij4+q
	 c1+qAiievrkHKoQBOs7+b0LCrMz44UimoCgkbIIR4QJoVxjEDjmOG9fuKKXmXV1s61A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kK6g/sVP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQ7LbsO8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E636606A336
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E636606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kK6g/sVP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQ7LbsO8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC99FAI4149279
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rcf7KX2/k1jjCd0zZNcv+h
	8VDra3CCI6aK6Rh3JpzWs=; b=kK6g/sVPxEq/537kJrMxhljfwMxmf7yPaRAnd7
	aOftMKlG2vo62K702jKPIZEhXhbjvIYtRBeP98/QE5E8kl3yA+FGcvc/NDcbB6Hr
	UlRKxmfUN7jtgUdhJZRCVTp6xPcHwizF/E2s3WHDfXwHDqV4t8RtQjLvTpacdz/o
	W2fp8qPqzOWsSXlrvYhCJyobR8MxjUAOeXXjV8/VY5YQArVaUGewu7RoCjRKtH5/
	YNOgevYEDKVNKLYum2ulTH5f13RpBwIuIFCxTx3u9ajVw324KlU0GEcD5YtGT6pu
	1L3ujOdlwG66RZj4YJHqnVEBJUB8jmNgJCqMEloqVBwCOF0Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62xm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:15:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b60129a46eso5518820b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478546; x=1795083346; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rcf7KX2/k1jjCd0zZNcv+h8VDra3CCI6aK6Rh3JpzWs=;
        b=GQ7LbsO8K81lRhxoZyiMNa4C499FETNbcoEoDJ6lPt0bsojmTUTtd2EqJVGNdtvbFi
         bWYoTX7h9OGeMaI7O8iF7NxOweHh0Obql5+mAFLy9BB+J44hxHiQwAp7pf/q9cdXPccv
         3oO3/k4hnaQgiDD8zliaIfh1cerLO+H0tdt2+nGbaREoWKSLWIZzyUTOAHbdmMcjNDxl
         PsFqVXLgb61dorZbfBUIn/+poLtlgpUz99yEVMlNkewwZAMQ4MSUCM6CJvEZYlOZD7bj
         36Hc7nBlB1PAHeW7MkQN6XgXFpkjQXO2tLMuF9iYF1wrzob3HeIy2+s3ylepF6ccaxKm
         A3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478546; x=1795083346;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rcf7KX2/k1jjCd0zZNcv+h8VDra3CCI6aK6Rh3JpzWs=;
        b=l/NNhFIcmx/7jRDFzFHFl+FDHTwdAMjkuR7y1XD/rO33lGRDck+ro2vx6OZdYY8bSm
         2U7Fn1rExXRGyKFPsRU/Fy9KSs6jcRah+liS0dYskqa8iejzgxbuCUR7Z6h460VDW/FM
         zz0bP7RrMSqXyj7PR63vIpGRWtg73QSvq/Udv8BVC//8q2BceqcKJt+0N/COpcLLsRuX
         PLeR9lTt+cxPL+lJvnUBqhAT+TF6ty13aMp5tich2YgRrat0NER8JHgYq9r9gcBGNqbC
         2TUeBvvGhfnh2RBkRj4RVe9CBj7+fAD+Bl/as7alJZrl/T9d9dPwIzwxYZnEAPclZ02Z
         fqCA==
X-Forwarded-Encrypted: i=1; AL+hErG7rNpgo/oVlEjCbFy8+fXVg6LZkc7sYK7lrmW52NH/Z7km11ehT1xF9VAmMWalfmHIpt7DO63zBeksBLfE@vger.kernel.org
X-Gm-Message-State: APuU4Z+FwsqHCvUlGE+u72r/gigm7YYcWquFXCIpdb9+jQI9jfjSNHi6
	bKnFLZVaLYTjiACsMUaFqv24W9B/UY4xwGbNHntbBFMiHOiDFUoJVKtBG+GlbKPEOwF9DdScNkH
	anNFv/SY5TUOSusxFzYOKmT0UM8ge2heCgemmxeg5tPamGXEYom05iYGYgpZJBaqZelUr
X-Gm-Gg: AYBFou22ZZjY+stFDX3gHhuBOV1xiSEct/3FqnpuyAS0X1aF4eKbc9YDnZ/rbGsCKXu
	Ge9dly3NQ9a8Q5VkCxctp6KxqlBaTZjuKu494KGvtw/2FwOu3UDICnsscQ1bk7DzYTacPWm8HYM
	sV0n2S6dx3+OwW5+TT3/dccus6uVWc8NYpE25+k3aAWW7q2MvZXUwRK2Y+4lstrK/Dvll83o1YU
	dzEt+VK2vb0AAOpC4NMgfrv/70hOOhJVu3y9iV34m2F6n2xrAZj9n+SZWorSxJlPTA2wK4W29wx
	2CL2zD3cN/e+VWFRo2XVuwc49wsvtnWweD9dDy7kMvm9iBbJgMQwInRmgkYNl7Rw4h8/D25cDz8
	gcsQ5HPxwkGDqmD2yYW9gTJTEIzMckkG4Vv0U3I62l40BmVDbRO69dRtB4XFiR/qXsEQnjh6NuN
	+r
X-Received: by 2002:a05:6a00:278c:b0:890:a995:1f4f with SMTP id d2e1a72fcca58-8bc1c7837dfmr4652735b3a.20.1794478546397;
        Thu, 12 Nov 2026 02:15:46 -0800 (PST)
X-Received: by 2002:a05:6a00:278c:b0:890:a995:1f4f with SMTP id d2e1a72fcca58-8bc1c7837dfmr4652711b3a.20.1794478545943;
        Thu, 12 Nov 2026 02:15:45 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:15:44 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH 0/4] Add Parade PS195 bridge support to enable HDMI on
 Glymur/Mahua/Kalambo CRDs
Date: Thu, 12 Nov 2026 15:45:33 +0530
Message-Id: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMWR9WoC/yXMSwqAIBRA0a3EGyek9N9KNLB85gv6oBlBuPesh
 mdw7w0OLaGDNrnB4kmOtjWCpwmMRq4TMlLRIDJRcs4FW6Txkhm1EKsRq2LItRKNhBjsFjVd36z
 rfzs/zDge7wFCeADXmfYNbgAAAA==
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=2072;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=v5XDZt9qzklAugLYWJ0KPcKjOVcV/r7Hu8yNX/ldZrY=;
 b=HVxI65GVY+yVZsqR4s5Z83O7AuyvDoKkcrQS5X7IYKBbRuMlH3g2sJZ34tvUgmlqNKH1zAwuz
 rAcO6fnb5SgB5wdTayeYX3dqiUYW7upAQ4EY11TiOa6lk9T/hj0/nK9
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: GsVF3X6f6CedvyYgmLeYv5CAP3yZD1wy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX8opogZyGL+po
 SCNFEz7zi/0OyLE7hca4H/mLrDCyRMomiLdItBJb5yfKYnvge3hL3nPfDy+7lBpoi4NXCPxMewR
 u0WEi2bcKzhphfc47Dx7ibsoLm8OFwbgZ1twOztZX3A68VnLogboNgjw/6lyI2sSEBxiRIr/7JG
 SpCYbm9eae5nXfkkET3WsRUHP2IaqiI9VoW34ySQr0k62FTRYVdKxCRbdPoD7NujCCcKEj4xGMa
 +xJv4FDllk8DIMdh5jUqIs75KAgLXzPPSwW+av8aiQaZ4oqRTZ9ffkS/belOa97Y3WMQU7UJZQV
 sm2o95bZ3TrpYutLKaY4veC3X9FBtXdvOthTy/fuDm/kX8qNrNSFkoxoVDekZQd2VYp09nWCT5p
 J1N5bhOEya7d57ggnxWYXHVTBbVwXyHSw38v0oCGCG+Ng9mHBAqzZ/a9Qppz19cWS3HzEuLmwyL
 2LT4txwcpaMAy02RB1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX6KHhnvjdRNn9
 j+3Z7FqL/dJgtJsPCrCWhy7NuIZ5CCJwene38DlW8W7g9azGLFOrUcoCUDrDH9Js5rFc4fHCcKH
 3f3vwBnIXEmUbWjYn0jr9U1eNvfci3o=
X-Proofpoint-GUID: GsVF3X6f6CedvyYgmLeYv5CAP3yZD1wy
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af591d3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KmDV3LX3zDEL7CZQN7UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

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

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Mahadevan P (4):
      dt-bindings: display: bridge: Add Parade PS195
      drm/bridge: Add a driver for the Parade PS195
      arm64: defconfig: Enable the Parade PS195 bridge
      arm64: dts: qcom: glymur-crd: Enable HDMI output via PS195

 .../bindings/display/bridge/parade,ps195.yaml      |  98 ++++++++++
 MAINTAINERS                                        |   7 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 142 +++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   6 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |  10 ++
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/parade-ps195.c              | 197 +++++++++++++++++++++
 8 files changed, 462 insertions(+)
---
base-commit: 944e974742c54a1d8236fe16897644c35ffd6433
change-id: 20261112-mahua-hdmi-8ee75b4fd29a

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

