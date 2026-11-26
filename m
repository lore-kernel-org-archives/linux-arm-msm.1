Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693072;
	b=dDwnE8ZEeFMwWn3pXSRYqjDaWIuQMkFBOcl+er1wKXQ45DzLKOFKo2Tw39L/KvnNJXcw
	 K7/UbvcJa9XfqiKD2h39G0ZbjEeykTSjy0Cqslopk4UMpqEkfRTPFFKSFMDGzon0yUWSj
	 1WEwLpGvlbR3/cAs7UH0bOIryG7tt3tlSDGHL+LoYKOddp33vje+6YmzhB2EZ3+ZoePp3
	 DqZExQmnpPu5VarDd4pTY8H1C5hI29Z6DoIyXVfrYszW7C6uqQrU+TbN7loovD/Q7bLWF
	 /7GIBjUKUbbRa7hy6UJ7hOlk1Oyxe9m7DvECk/ymeJBY/FD3jiiw1FoltobfS1xYVAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
	b=J/N5r3nPY5rAeS8OYFmxylJwlMai0WhBLj6hllTEwCI/nD6lhZTXfy55vEHRMXQ1TFA9
	 UIKJ52nrKWhjmHLYBx2eK7yuFJqgtsne6sohE0GK4l5eYJdRvF0zt1wMyPQnTrQicIfEz
	 MmOr0ZgoM7y9isEmxn/u7vgi0/7XOa/obU7ePglACm8McjdM15rr1pA5wWGJM/iOHCuKE
	 CmQTkJ1lKRvtrMvtCWrTEKb6Ak7vXKr3Emyl0Hj3s2GRRhXmRP54jRuEMU/I8F3zz4IAM
	 IZ9pjfLLxkbi+fQ7TwfU/yYs9vtk48KA5fWktASPkmTMMIYCEWvaqY3U8SMYsc1jGuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8QTuoA5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="O2/JFNEw";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B00606A6A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B00606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8QTuoA5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2/JFNEw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVRFO1497063
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=; b=a8QTuoA5MxMafr31
	y10EVr80Awe2A5XZKK6fE++LI++uaPlgWon1SCHc0su84Gy8pshXliyFUvIlsxAe
	lYw+lcNIELJqIeoTUg+2H5e9Y/34g6josD/8uyML77ZIKbL7Dz04xAKOLNEG1sdl
	gEhFPLqnSju2NBl6nvJIdMX7r4hg4E1Os5BLA8cH835xNx6xVILyDZI+Cl3D+1Li
	9VMEtprBow/ocAu75IeHSDNj6L/OhSUwTZv02/WurtyI6L4zkD2H2oeCeUoR87vZ
	Jz+8Tp9xMCTFF2JQeLrNfuPrjSHlqUkj1JIz0jJMy08v/X7r8RSdkDj9AhNlC2EW
	x/z5vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2vuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:37:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so1664129085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693070; x=1796297870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
        b=O2/JFNEw2ALn/fNrgxRkX7lYTfkTBZQqtPsqMLqJ0JD21RQb7/XeOJ8HTjlREaZtka
         zb8RTGB8Y+VYjDs9zpd7OuPz3PmS1L+hPo7zTiC0AxTKiYKsv4ERx65s1y0bKtkKVFMM
         6s7ObeFMO70d2Z/nm8mbIc754J7ZJKIsGhAkqVAEIaXg7rvNJKdc2KrLsoefINHNEGtx
         PEvg1HLuZe5sHbe5i838yV3I0ZSAVAhb/XJL8GUhIYD3ppzP4Vx0+HKx2wam/iBXjQav
         rHylcYMs7nMYww16B/PrYIg2OityMFLqoXUNrCjMbfeRFw2f4XjRb3gyxumWmSY3tFAH
         GwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693070; x=1796297870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXUX/rKay9aTcWedyo9tPvxovvHfrtxyVGjD23msiVw=;
        b=FnQ+Tsb4Vp1lsNmVjMiu2uoKCXKMZ1b306P3juXC40BumQMJHnVabtpuRszOIlGPGx
         GJQ4Md5fRGdt7hj67+iH79hCNwjJ+Hf7saFXtK1t9M6lqZXu/i3zdC3+gR5vCLRUNL9M
         l/WQ8X0GLdvs1zx9p7SfTEuNlTL0Uin29aR0aq8gU0dDUBCVej/pX0LMkYVEP7QEDx6j
         I2AD6ei2fWP9DR21ZxCGvEgMvEjQDOVpCeJJ8M0hLmLfVNVqgsZUrxMKxP3e5fWYPwsr
         zFo3xlQ9G12SdTmOTbuaT4jl9wJkMJbEvSEMm/l40/tbnaR3ihmj5yo9HPNLHSAGLXr6
         XEBA==
X-Gm-Message-State: APuU4Z9cJ68BvJvHkTZZ9wT8C1L0eDRS3agOaiNFttf3CvTLaRozz4h6
	qPba4ckffK7dRSbZfOvKuWntRlrl63YdDLfxfXNqQvfslGxTylyaSF28U/LHBoBAKKE3ZZzBUdS
	m5xR1TFOEpQ8McqHwNmnazQToA9Imuzs/dZ0xbpBGlkv9nAmVOTgNNVL0PbEpKuxB8moB
X-Gm-Gg: AZFdTZcR8gFqMuYUPYt4SV/c4u5vXW+swygpsbhYcjylLGo44Ez4Zyz6SX6rbS6ocko
	ImsXy4coGsASfDohO8A4RSanZrxAj4IK+NzZifGLejEoa7ZmQ3KW2/S2tsH5uLvSHwXoD79C68k
	edr8DsNQ81S8obWEmmnS/jUCAPJMU6Z+BXnNqQ2LmTMeZWRTEdfEAgLYQ5B3kqD9EwjKgDbHRpE
	s/U0TimtskSFglOFIDojO4FeLvJ0qWqJPbN6ommpdTHJd9Sc2FwwltPAu7Vd2yfU9XG/y+YZ/2O
	IlPgAoyoMe5B3u1xJVHENud7AYdMYGY8ejOYgEN4+aglHiL/hOWc8MltMVLqjKRkQfxo+gE0l4j
	TtCciRuzmmE7+iPIHJbAaX5WD7fUfE5bLAIRzxFWQHZy6aFKLXyssQsD/rsm8ctczyQ0ZjzqI1v
	2A/6qUO35IKPdS
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr3750479885a.63.1795693070309;
        Thu, 26 Nov 2026 03:37:50 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr3750476885a.63.1795693069857;
        Thu, 26 Nov 2026 03:37:49 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm748210666b.73.2026.11.26.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:37:49 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:36:49 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: agatti-el2: map the WLAN firmware's
 SMMU stream
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
Message-Id: <20261126-agatti-el2-v1-3-4e25fd64f198@oss.qualcomm.com>
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX8kXANlQY3vCZ
 8wqAmTlOIsv8T+qG+Vyk41fObvNliFrwKRT9j3J7i2WWeJr8mfK/y1J66v6cKDniHs9lYxl4pe2
 QMFsas3Jqzr6nneu1g/d0qz6T0jtf/ZsW0HgAML8icYROpkCeKBwzS23JxEM15elsWvpxX8UW9Q
 laHmjAQ4ilr94kXis3blIGvj6UpSlB5qf/14cX6Q/ez8eWZWIpZouClNkD4c8iG10VFgv0okbm1
 ZmbGoi5WiZ5F/bV4xLUcMl6ZZ1ND2YIuI0hYZYLnhfLnUhbU5wD9t1hjUjck8pyPxEtPpR3rKeL
 vUVwjDjoqSRtNnx3OptGWGp2TsRIFzDitwD8HcGcnr56dFrV/T8Dse3aZBzjhy7b8H3zD45+mOz
 uTl58z0B39ILWjXjXo1PTXGDbvqGmai2rTNy0AcARhMYkI91T3sHQP2wEjuSjEkxpaj0qomOZ66
 sEA37L8Tb6rmq3JMs6g==
X-Proofpoint-GUID: DWlB7fRSHtyYoSbrEt9YVUCcMNwNVz9L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfXx74FrSvLngKt
 q3eOycPZHpsSy6z0gQ4zghU8Y9zRFDIAYnPs7+zJm7Zokn/VJ28uJbE29jmGdGx1TFmndffsMH4
 JybsJWU47hq1+5B2/Y5iUakbPtFk+cs=
X-Proofpoint-ORIG-GUID: DWlB7fRSHtyYoSbrEt9YVUCcMNwNVz9L
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b081a0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SnnUt0fLhKprvfd8ow4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

The WCN3990 WLAN firmware runs on the modem and reaches the wlan-msa
carveout through SMMU stream 0x1a2. Without a hypervisor nothing maps
that stream: the SMMU blocks it and the firmware asserts 12 s after
boot.

ath10k_snoc maps the carveout itself when the wifi node has a
"wifi-firmware" child, so add one with that stream to the EL2 overlay,
as kodiak-el2.dtso does.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti-el2.dtso | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti-el2.dtso b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
index 60142be50417..aa8e85278bdc 100644
--- a/arch/arm64/boot/dts/qcom/agatti-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/agatti-el2.dtso
@@ -17,3 +17,9 @@ &gpu_zap_shader {
 &remoteproc_adsp {
 	iommus = <&apps_smmu 0x1c0 0x0>;
 };
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1a2 0x1>;
+	};
+};

-- 
2.53.0

