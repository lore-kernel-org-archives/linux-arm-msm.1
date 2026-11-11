Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419123;
	b=GMSj2OBNLfm1GjeoGp2uQWmatuPyQViO3qXzObWx4gIlVl4PnAfcpiubAMj3v/hBNiEU
	 iDFdUqCw7TN8FvWu6NUFlDxBnv1nUj1HKoZVe/TYls70GAd2amsQGO+GZFOxlux509JEx
	 vEWaj6yECsMqbI5tiVtsTPkwaNESsaIQi52ABcsAy+9+z0tUdzq6DwsLzNu+ycskPh5fD
	 UWaID01X950qdQ0gUeSCn9DLMp04uILOUhbvRvMTtGBVruguSYhTiju9e2Oc1hFcA+V1e
	 VGeUw1Blokrf6vSrtXUyIjFuAyqyJfNi3Am3qtjJKsehvevIP7bwGLHM3q0qdx5vZnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XEOLUODIyOXWFNay8M/E3b1bVzpi6+JwlNSpxHy2Yv8=;
	b=Wjd9Ep3U7hwSP82v73LypbF5jLYhPUE3v8C1bN68SOUwQi1F06EvZgOo7LUCTaphOWrO
	 FgbV1AkfCwed+Tp6JN0ztmOblIjRnQN+mdc1Z9ZpSgNMpm6iHuJ4KsgzGoQqRuB2yt7GJ
	 RCdzLZcBVvKA5zreDs7Q//BiEmsFPu3BvtlibFYY5fTzq5zKj99uMX7U4ujf+pdnWh/Gq
	 rVLsFdEnPinrqBbcfZOz3OFrR2ttH6d1RKYRmfMr+uRm6p41U6/WubpFBUDh9+ewSRHeW
	 B93iaOlGgHhK3psj5fA3J5d/HSgMyJ3z5NShLuH4jjFk++s0LmcfmOPCFCcPoz7mN9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq4HKIEG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDaFrTcK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC0606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EC0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq4HKIEG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDaFrTcK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0PQf1565804
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEOLUODIyOXWFNay8M/E3b1bVzpi6+JwlNSpxHy2Yv8=; b=Iq4HKIEGTLKBTq31
	+ro3Dgiif/n2EdDc7nciPUjtRtjWa+XBXm9RQzhccFQEDQrW4KIAenq/yUXDPMEs
	Y3z8Xx4S5b1/Mw9QweZKAsUjVvy2tZgpsh3OdXnuE9Mkeyc9uXFVOdHSVBndPul+
	sUd+KQL/8dW0DRnOALV/PUMKHqdp8FOuJtjj8DZJPv/CKI3zMYJZ5JlIGUgvDV8A
	roT8i5T6zLhg+aCKXJHpvj06UbWZGlSgmVu+DanHME/9B0QB7ilt62eG58LXctGH
	rbzHiOB2ETTONeP7bWZNSiNxZQeZ1cl/XHLrnhSjFh/xVVXBgJUQjJ3/3w7/Kf8B
	y/XkZw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m176e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:45:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso2530229241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419121; x=1795023921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEOLUODIyOXWFNay8M/E3b1bVzpi6+JwlNSpxHy2Yv8=;
        b=NDaFrTcKuw8jgG8eW43bqc8eayRwZIOcF4oiHGZIDKRubgWLYDzvAQDMOhwqlToz7l
         d9++PNhlrMzl1OeH9Thnhik5nWvuY0VQi10cY2SPzPapG3LrMQq2hWl1F7eJGgmOIa/c
         Jgi0j9+Vt+IZL6PV1SEULCeHPbOxE7DGy8INfPReTgW8M2qwr5K+zoq3n+7wvRy4vuIF
         ZjtvRdEQbKsQR34IO4FpQrPvTysT0F26GFxekt3d9UOhPG1wMxI8UPuElUQ8sBpWow1p
         wJsNL/yIl0uh0k0JheE6YtI2UCMpcB1hIBDGe3KsdK3ySez0MQ7D33i0r0BG1nhSA2GP
         eU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419121; x=1795023921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEOLUODIyOXWFNay8M/E3b1bVzpi6+JwlNSpxHy2Yv8=;
        b=giZoUcYESeDCsPU+IjkkdC3Zdzw4z+rbJ4sw7fYkiQdm+Ue3elrkt2iti3o4R++gHN
         cFkMrGUiic0WV9H4l68hyT3FSc/8eXMiAgO9ObT5AcDzLzmYrxlolExfPYSLA4qYbgkm
         tL2KpCuEZkBs+YkpKd0xvlxc6BCRv1kAqUu4ewoqyW/B8l35Jc3mxSvLbspGbYsv1exm
         qD7ixNGLDHhmT66niUhcAvn7mkL0wazNzD6u+sSEBTbyw6hyVTtZp3JR6o2IALXXy4wG
         g+OTPNkuvEfjH25ILt8LYlw4RK9IFltpOC1HMeZDGVuKSTyr4M1yEfIaHO4U+PUNjBBl
         63sw==
X-Gm-Message-State: APuU4Z8CwzvpnTDHYu+9fkwrnZyAbl57jqEv7I6dKYPN5Y92nRF07Ybb
	OABBd+7hlQ9xZvwk+eqfOkxPeTQF/IqXB1oE5NgbSCTINnDEwKqNDQYPF+hIawFpNP12/a97dXf
	rOW0jty+1YGsvDDJenw5kac0StsZL/Hw/GgiyFn29EKntcRSpZmytnqC6fjMnnBXphVsw
X-Gm-Gg: AYBFou1pmeclNFvaiWFiLqgx8pyblx5ddgXcDB0O5/sIKcgMdO13u4N3n/G8p7QLNkA
	VL294D3zpllCr6ivwODeU0PIvCMR6UXXLjg1y52ITYZmls9wz/nqUrWakpN10rYdgS6ztvFYeMR
	lcpF74YqdC3A4vadGe9fzsTKRdc+x0xQEyKPerQ7Mf3vdRpcnK7DMtjwe0+gIkNSHU5laiuCOzP
	KOsdif1PFZ70wvFJ3HffXZOLXbZ3PTLxtge7FIijt60D7VuGSJSF1EMaUDVGVi2W5j1aeV0h6N8
	tYh66lJ59Y4+JrRzfFHCbstVjhwQ6JFHEQLTvzxrfZwv/VKz75Qc/NeotdGGFQtachsp14b9UBA
	iQaGcW6ZewQyXFdpPjDac0X6jgdDnJ0Bj/WOnv+nMBtEHxj/VBiFGObmApzjKkfEJyFaTpw==
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr1449249137.29.1794419120647;
        Wed, 11 Nov 2026 09:45:20 -0800 (PST)
X-Received: by 2002:a67:e713:0:b0:7d2:d9f8:21cf with SMTP id ada2fe7eead31-7d5061e6d25mr1449229137.29.1794419120074;
        Wed, 11 Nov 2026 09:45:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm4846525e9.0.2026.11.11.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:45:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 18:45:00 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
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
Message-Id: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5050;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P4VVgVXWltSSj7aZCWsKHMz6d5FfrRARZf5CW9AC908=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9KmluyyDPrdXA09BqwooVEM09xhRcORFlWDiN
 3+4aN13qeqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavSppQAKCRDBN2bmhouD
 13h0D/9g/KlHv0ldGfuSMu/+ECd2SkWmVhZAMeZfVM4hBVW6e7Iwy0tBAgQ+FdFAeQlv4071Jvv
 2iqe52zPWcrUqQIetrSkmpIDA2HUUyzQe5dFU1vpMg0y9qs5HSJdo9inyv+3flAJhBGGNge/yOf
 itGlewsYMoEB9hr5Pp9aXVb6Twe82u8DQMmtPXBbH+lXfH8ab0ckKLjEdqxVQZk4Jymq/MjZ0L2
 8yWYJhMjeKoGDR4duEJg5pmELVm73zpRB7S3Lo0Nz7qUm7PwS1jpk2tTUEhOY6KnwlTFMNbchs/
 gDGzD4jeQCXvGdpfGV3phA+ml1BqRXzILN6O6rNlCiwOOFhh39FxqqwNfLEI+UOwNbO1vGjY7jS
 wfk2awkbxPxMFXrRPyhohgrgyUCgDlFQ0KGQROwWLL42k6bcEmYnIKCIatcj+Yp8SYwkBzE5Wjo
 nZMJ7/Ny2YUs0Kym1Yk45kPvYFnTipAtJsOVv3shJDvNL0IaH5wk2TMjuMSxu/jR4YO69wnocFb
 CWcqX+FfzI0wNl0POdC5K0QpJdsGNjAohgHKxfywBXsgVu1D2Xqzm8ylkxlNAR2+b2kzDet1lfW
 0dSBmkAn5zRa2uXqLT+lowIrbV53Zr3Vu+SJUy/BxPDQ0LKMT8iEeCYRAIbHtstsh2qY4LcyWGg
 w8SnJdsba8/edug==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 3pSjj1X0Qwx6AIvjV2W2VJ7Bu-jMNNEG
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af4a9b1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=b5eSGgufP5Rg0J_mn4MA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 3pSjj1X0Qwx6AIvjV2W2VJ7Bu-jMNNEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX/KGQ5wCvxmgG
 NasKTwHPktjlBOVLPKzWx2CfsjeDdMrGYwIxSltWz+cQwSqimAK0DdtxY1LKNl9f163sCiM/npv
 +VEGnovI87dVPc3KKbQrN9ly8AJU7SD0q3+TuWFsY5uKbxklrwYM5QZIhEE5KO6UzbdZNLwGzEp
 lXN35MRvVENQNgntDZpUr/SyVzKjyyz3EtVpm5Rv8FR0mBqj5DWrjwRm1l5ctQYeQ5HQPIfuSOo
 neqyKeiqL4ML5WE6miKbE0SQS4K1GSqng77NoevQ8bkeKLav4aFMT30/40cZrvkI1KIw5F/hWn8
 iVHUBY3qpD23rv5d0+IeD3MaUGOY0ncru1L5jODe5bqDb0HCQxw0yWbubyMBpbY/rUh33zlrYQN
 MMZrDiKbIpnihCCUCIl3j/T7NtBRygVH2DTphLcRT+XlU5gXWkiVOeTTuCNJJVqx2SBDb2e9DDV
 5umOJjFg+tcwM3rT8rA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MCBTYWx0ZWRfX6UgpPS26SqkL
 T0Ns/OBuVJH/Kb9YEslGLuF0Ujj3LbYqSsFon+rurWGHF+dc4qjTLwC3B9UrKy6DloDHaE1/dvS
 3Yr1cyrxr6I+Awz17XmwCOkjh7A0I3M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110070

MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts               | 4 ++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts  | 4 ++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
 7 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index ba6ccf0db16a..6c94489f5f70 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -262,6 +262,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&adv7533_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
index ce75046ffdac..370ad8b01a1a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -218,6 +218,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&adv7533_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm8916_codec {
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 906d31f1ea21..d3adbc7406b7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -87,6 +87,8 @@ &clk_pwm {
 };
 
 &mdss_dsi0 {
+	status = "okay";
+
 	panel@0 {
 		reg = <0>;
 
@@ -109,6 +111,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &touchkey {
 	vcc-supply = <&reg_touch_key>;
 	vdd-supply = <&reg_key_led>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
index 5b34529b816c..fe333ed489b5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts
@@ -133,6 +133,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,ltl101at01", "samsung,s6d7aa0";
 		reg = <0>;
@@ -154,6 +156,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-gt510";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
index 3d6d9dd3b8a8..85d1cae19a66 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
@@ -98,6 +98,8 @@ &mdss_dsi0 {
 	pinctrl-1 = <&mdss_sleep>;
 	pinctrl-names = "default", "sleep";
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,lsl080al03", "samsung,s6d7aa0";
 		reg = <0>;
@@ -119,6 +121,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &sound {
 	model = "samsung-a2015";
 	pinctrl-0 = <&cdc_pdm_default &sec_mi2s_default &secondary_mic_default>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 71b5c98458ff..65de798201eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -337,6 +337,8 @@ &mdss_dsi0 {
 	pinctrl-0 = <&mdss_default>;
 	pinctrl-1 = <&mdss_sleep>;
 
+	status = "okay";
+
 	panel@0 {
 		compatible = "samsung,s6e88a0-ams427ap24";
 		reg = <0>;
@@ -359,6 +361,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5a00000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index e39743e22043..7d351cd15f90 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1634,6 +1634,8 @@ mdss_dsi0: dsi@1a98000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1668,6 +1670,8 @@ mdss_dsi0_phy: phy@1a98300 {
 				clocks = <&gcc GCC_MDSS_AHB_CLK>,
 					 <&xo_board>;
 				clock-names = "iface", "ref";
+
+				status = "disabled";
 			};
 		};
 

-- 
2.53.0

