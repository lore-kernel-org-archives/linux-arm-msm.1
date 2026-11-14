Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678894;
	b=l4VkOKJBWzvvgKKXBUYEmj8pwPYJnbTALG398YvoWc1C3fEctWlFXdDrSciZpuSrKBJ0
	 fP88mfXpY+b1FirEUQwUI5XuWzoigV8vEypdEn3wsJVQNuvADPKpZCcalTd5C4gJUgjTa
	 zoHKrDt3xaJIeyy0GL/+o3GpDDpRyidqKZ16N1yseR/O6IVX4c7mJoAoLCGIyS0+xopRQ
	 GqnGiKL44omr3eNqR4SECPGloWfrgbqaJDofqC6oA+trD+RcSd/gE1zYFR750FXIN4tdN
	 A1JPXjxlGyYLNG0KiGxdjBTswnP6+XXbw7IYmNN8wCjThfhtgUcBqWYuE84J0iQGSmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MTTc3ZHWXywW0LYFxdTO0Y5ALKzAGNfd7iGemICb6xI=;
	b=11oCBenc508Gww4Wp1iX6z7G5I4oeYww5izz5xpdx3NNHuZ1LjZceHGRpKf3D8TpChdp
	 ncL75XHil61hRSMp0ZMleHqzZMmJO+9wOU05sI8K5ucIZWnrmrtXoP1npSliScS+8MLBv
	 x9UmIXYvdT0xlO0L/j0eyAw3uNmtXFv4U/jer+UNgDqcX9Z7Bgyofi6qIMDPtygabbhx3
	 UJUW/XVauEjqDs7F1WkSe2NwOlSbItnxSvLAER0irX57v4Lhlk4QaJeMqbCaJ4jpFQlPw
	 qIrm+36o572RufvHrLJu0VFWmDQervdz0x3rzqWv2o0BS20A/O154698bWTJp67L+Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3IpmdvV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AhaE/y0U";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C4606A883
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68C4606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3IpmdvV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhaE/y0U
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHpps92060580
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MTTc3ZHWXywW0LYFxdTO0Y5ALKzAGNfd7iGemICb6xI=; b=b3IpmdvV2+pii6g+
	apUeujldW1xy4CyTj4FBErROIARKG7Y7+mfV5F4MvO2FSyhv2HGxJ/dsZSVE5oQA
	MubnIlT2uw8GujH3Lh18we3kuHnJn1IlDHS+qpjsqpZqviTzWO3yNEkMA+nMZCVW
	84ykrWK7A+PcPuEFdH1SM8D3hUCOs+tjPupkfJFS9HCspIu0YMWUvjTxHAsbYtnS
	HFoydeUHvlloS8kI93QiwUwtZeUhxvxHjECd3t2pQEe79hj6kCbHZTxT34nSFxjs
	hhAghEz9GQr7oO3m9swEB+hbfwiI6UFLzbHhyO6MN6Fck6dQnMpUnxkYaJdQHI67
	mfrMiw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8sam8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:54:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94607500fb0so366665585a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 09:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794678892; x=1795283692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTTc3ZHWXywW0LYFxdTO0Y5ALKzAGNfd7iGemICb6xI=;
        b=AhaE/y0UtayMcYTR5uVTw37QRIOpe/cZWl2T4eHH3xOcO+Tehm6Ac69Ksme4tPgkdP
         GOo0gEWVgoTxDhaMhazSt1a2M1A+mXjKi4uOlHhaR6xDU9paI9fQmlFKptvuhhtwOH3/
         auz9YkQnxHjq5HoeD2YzQBNFOJXySpTVY3dDND0NdrgE0PWytYzIOoy0E1TjOiZRKH1G
         mxZqrJgUYkHPeL2HUy9rphhtk51xvB6bDvJc6l+wbqxn5LTjRGFHmq+5TL7YFn+H1GIR
         nREelFN/Swfsbnfq1mnDsVSaLGfSTPkrj+lItsqbFwI9aFNyY6DIs2A/N2FxtaolJkku
         0e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678892; x=1795283692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTTc3ZHWXywW0LYFxdTO0Y5ALKzAGNfd7iGemICb6xI=;
        b=hEPyq/iIxwu5P9enlryOzF0siMdie1U8hLjyoAH5Qxy7snulN/sz6uCMGtidpoYEV6
         YfQ0L+8gAbwKKF4eeKOGTHfMBODJe7uMA6ITMs8/adkS1tAF2joZwRRmsiA0rA5+aKe8
         Xp2xoSMP3jAlnuqrHNhdoPxakvq2WpnLx7JCjEv/I/w+OafDz8ijSZtQyaaEGSM82Fgn
         mssjPT7+6TOQ4PJLfXs35jvdShqbyqodVjS8ru+sidzVCZq9/Tu2u87I9Jjxozmn0Rxy
         3t0Sqzgsdm7yEpc1EGeDP6avGHrAQ6Dp/Wpnklf0KwdKqZU4xI3eehzS3rgQvG9p3n96
         CmGQ==
X-Gm-Message-State: APuU4Z8pbJv+36tMpaPpZVwZ9Nj2JO9pqo6r8zhdkfRloCZ/DYs201zq
	de4CKJQJ+SApkCEGTBqrrXPBJ5ePwsCNoNYxonZL0jtSRFnHx1UQr3QiQ01xAWIgRkNJHQqopvo
	NBB4QCa5UPxm5vwF+1/NTz2JAE5Aae56zmVgSo8WCoSz64LBH0jnKlhDQLciKHYa7GclA
X-Gm-Gg: AYBFou3L/w0uosPPNebhWqXXcYR5UVOfnHyniZ6vpqzJtVuhgilVaN/BMumA9R0s5bh
	1D60UCfIsx+sZAz/hwTzaPDOaRG9J0DxsVlvGBFRwDRqLRsLLvijLVNQTsk+1Mew6LLStCLPskB
	Ps+3r+Myna4VhFivveWxwqaf9pG3rQnLIGp1/BNkuK03zb6QgZmN1ZmWNzj3iYdKhRXkhsLODX9
	2EUlbAn5vC+/swg/VKyZuQ3uFk902flG2ejYXSDdMXPQ1/fJb58UClLqfgp539byb1qU+dC1DhL
	QqesDZok8+WeS2ZdXyhqiWspmu7vgSPeDeP4pUDuC9KfMvaAJJlxDepc9tP3NvrQfy1Oat07Wzc
	CKVxKQ/OPD3W5rZb3SUitL6OqxME5d6B1kvcKWpIgiO1o++RCn8Nj1wKSiKXPkRiVtglyxw==
X-Received: by 2002:a05:620a:4722:b0:93e:fc4e:c48b with SMTP id af79cd13be357-9494bc845d3mr1111221885a.61.1794678891706;
        Sat, 14 Nov 2026 09:54:51 -0800 (PST)
X-Received: by 2002:a05:620a:4722:b0:93e:fc4e:c48b with SMTP id af79cd13be357-9494bc845d3mr1111218885a.61.1794678891184;
        Sat, 14 Nov 2026 09:54:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm11060292f8f.9.2026.11.14.09.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:54:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 18:54:36 +0100
Subject: [PATCH v4 1/4] arm64: dts: qcom: msm8916: Disable disconnected DSI
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
Message-Id: <20261114-display-msm-of-graph-v4-1-b8de044c6c1b@oss.qualcomm.com>
References: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
In-Reply-To: <20261114-display-msm-of-graph-v4-0-b8de044c6c1b@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5343;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=djTBa4Cy0m7HkGgyxoN4PACYXv7Ysx2A5Lx7uxzmuOc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq+KBhnHmajMKESfjFjlwcPvlKWpWhcvN7VQSD6
 sfFGusw6bKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavigYQAKCRDBN2bmhouD
 1yWND/9dxmVU3BXtm18guhYgE06GmvSifi3OECnyHgRMgRjvVuX3uIrxCbThZIDJyWSh72947Dd
 +ypdgo9nNf87rS+i5eBF8gfjHJc7rLEOz2Sc/1D5vyeAtR2NmD1+I23NDy51lUlgZa2NF40tHPM
 3W4VjOsiM0zAmfRkNy8hZQsKtqHEs6w5I8jMEdRMzzpagCrzYBVEj2kYq7h8i99yDDKZS0MRNEf
 Deyt41jLzanaZ9GQZ8H5AtiVrFkgIE+h72mR2xeHqwgAwu+puk76Xs25MVBveUopor6NEs/Aw7O
 phynhRNZUj4i5TmbXvyZedAiMgE9+qDjWojVT2QCfvK86rsNpVNwkQ1raNe+4sKuYJ4XyCX9Iiy
 nPCWKS9hMa8WiuMGqigRBC/MflmWsQu7ftKo4pEJ4s7org4N0vBg6Fa6X9UMz24Ufa7xwB5y8C9
 4YKmpNLzB0xwnV0vIc834Rddi3Tp5BkRJyX1ABk65EedTnbqEY5BGWvapxZ6dPU49LgjjkeF0Jn
 NBB3L/wkN9BGIHXaHN1WF17JNkuipmQA3Z5Y7sw5+9kOa8L9BcOyQARWWesjQbTbvH9sOY+nyEy
 nhJG7UT06Zt3+BFvn20P4BipFDZ/4yebIze/EJX8z93bRzx3KPtKNfDk3v/IPTdx3etmPmCVyo7
 XECGAN5NqVCITTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af8a06c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=31hGAD3R46fbwAJXn2oA:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX59dgBdZCSm4C
 6wqw5h+elVs1BmKll/c4bJ3AgbDIMCA6kSy67sccyIISSom0DDNKClOxOrCtrpzgV2PiiIAsxFp
 NL/P1HLwSy5iHYNGQJbhRmy9OvMcZQ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MSBTYWx0ZWRfX1Y6eHLcIdEmc
 vtGQx4aLgHgPPKh/ggIaLApnDOjvhGElR7D1Ta7qxpZaE4g2BKwLi1iS0VDk5bLmcFIy5tKhrUZ
 mc4RCHQWT9Cu1s7l5N5dPDYyVJoo6F0WPzp2az0AQjinzh/+eAwVI1/9/wfbhIcauMRZ/bqtMoE
 0KLcAK8zcEWLhn3/lv3CRADRQUkPErrfiq+1WnwKqjJJVz+dkEhWG8Z8HsqRDazlrO5pYAhV5+J
 kvFjzE7ndUQqGxfTLYS7WGoPIFOmMOeUW2VWbjg2jmJc+PeD9ms+I1Sc0BOVZQ1qyCTKoRSDWLY
 LgCbbm+8RPSTlVe1Jh3kknfAhlCftiZwfiSXzWc9Nu1E/SsCV6/J7L7ucWMntXkRHBuknr4BqAr
 Ae49Ngks+gOrDG7iNkWo4KknNjdXuQZbU523/P1ytCrFE2CvbME8OoxFpi67JbVEbXSwlvVWnus
 Zs2djTxc4TyJo2V+zvg==
X-Proofpoint-ORIG-GUID: K0iGZuNhD7pVWhuyLjSBUER1D9lgn6x1
X-Proofpoint-GUID: K0iGZuNhD7pVWhuyLjSBUER1D9lgn6x1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140071

MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
description in DTS), thus should be disabled in DTS.  Linux MSM DRM
drivers will also fail the probe.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts               | 8 ++++++++
 arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts  | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
 7 files changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index ba6ccf0db16a..1e990c8853e3 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -257,11 +257,19 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	status = "okay";
+};
+
 &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&adv7533_in>;
 };
 
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &mpss {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
index ce75046ffdac..78602e9b0ffd 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
@@ -213,11 +213,19 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	status = "okay";
+};
+
 &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
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

