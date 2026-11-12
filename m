Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484842;
	b=NMsrivRv7zI11NFHZEf6+NfjD8sMa6epQJ5tIXR+ZHxEQk+d83lyVwQ9cTTpm29Yp40e
	 F0eSi1DsdaUN3bgqcUXgF9f1qWsfj8dUF43TuHgtCvVMS52Wkp0VQT3um18GVGjcjpqBd
	 9x4zdraUD2S32oAjDyJzck0V+MKafrOBTDDD3N7/6DxaG46d8qzPd94vFM5JBmKenhU2i
	 QIZIHAq2pQJzM8o4/B++AfewGK9wg9MoyAyo9hqsNrbxA5tPGsTRgWkzDVPOVvWPsQa+V
	 9DK7AJpoDCqw3KgWBEyq3xFEObo4wL0sa6SquvzV1ia6Za7TtmDniaCE0frA2XBGh5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
	b=gE39v6fN1WfXD8LzYLXIgha8lesF3JbPG/Nai67B/FZs6ZAcCldSZVWI7fssFzjCQQRU
	 fn4NvGllovJ9hp5kltV4EzPNPdroEAC40g1VqvbyitjXgMXFzo1NKQpnTMn8qmMCByHkf
	 RKPG+ybXisVel/aqOc65pqsuOpOTkP949XdYw/NuTCE8MmRsuPb4SDSCCHv/N55TETiKv
	 8MTpdD7t55uZWuHxibfhc9ZSRnUQk4WSc+QYj9N3F/vghyLCxP/V/6e76rgHJkXAkgpW4
	 1To4nUNCg5wven4DrgnW7T5zDs28X65HYxUXz3lfvvTWRVGm90aGgz8ebNczdnMAkTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw2NHAls;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJqZu9r6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E60606A89F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E60606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw2NHAls;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJqZu9r6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfP4r1954171
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ir4bcmZQPxD
	iDN8eVbAoOquK5iknnaDWcLFSx2kItTg=; b=kw2NHAlstCoLUs53DnzXQVPvSnh
	CdQPJRduh1AC3WIKI7S+VPD06JgicADKxe37p2dzKejFIDME1RbSfsnN7ACfs4Va
	dz+wQ9DVzxOsFLpNL4JN4tHCTLIURkep/2Gztiz97PFYn6QCfHLk0xWYHOiRjyfA
	Z3bbV9KZ8IjZKojHlPdlYBJOStYn2mc1GUmTPQw/VBsB+DNWdq+xaJv/WEOibQoh
	MAjkUN3RSLIe4oFQDEYwsEs1yKX9qIoi/Z+teAKStE+RARphjqT66/2xSqF6bCPw
	Fr4ZzK7ddnyWBPlowcrEAerv63CYMFJ/3We3GtvgkRcjnCyUhVaL463uk7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx308hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:00:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so953634985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484840; x=1795089640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
        b=TJqZu9r62yzm4lBq0iPmGILz01RypeCvNnYbaLBeqLFK/52ltiv1hWN887MzY1Ba7p
         oOdYgXTjb35X+4JP7p6Bx5Z3CDc/QMsSA5iqXm6GZnKrPWwYAABks10nqLyoNAcwgO06
         KThkyj39JvPIds8giY/d51NvCphTg2z3NI2qyFCn2S+f747UaXPlb02Ar2QWeEBXUBNQ
         vqXndRgMaLIcCjgQMKY+Fts9Tv2+vu0+g0fYckL5ojHV+IZ67kyHKyjrHd5aqj+0Cvar
         p57RVq0cdGaYkrU5p0B5w2AVIabTIMJEKVwQlwMTKJzz4vzLmH5umYwYnm5vyzEN/lnz
         UGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484840; x=1795089640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
        b=2lM9fr7orjoAYRMwShRdiXeQNgeGPi/b4w3WZ83AGKufCxFb/wmJNxe7dS+mGKlh7F
         in0QTvo2UzAG6Ky/wBgbZYqEYLy9J2diqWtDfHB3nzjRNBlQKJ8nAXCziWbxQOndx2vy
         vmbSnkO7SWNRHpWjJu6bnBIfXyrgALBD+RzGCNtOqfAk9bhXwtjx50Q3Qw5Kq1a+nYLn
         ydqXxCKXpDfHHqVnMpj+pOemYvSHsWjm9+hCuwQT+GDFFAYPiDpU6R1CSpcue43Uc/l2
         XbW0OsgGJeeybfvSPo8CglGDsSdXGODYX7ogsd2qPX61gReEocEPK9xBKdDemPdE7D7X
         /gdg==
X-Forwarded-Encrypted: i=1; AL+hErEjZEv2K5ioLg0Vs+7eo8aDPPcAc5tHpfI/k4xMGbiv6i9O6e8MrK0jk2p3DoJvmvmtUoOYO/v9Rpgpgqfm@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Su4x5pSPjBVvisKEu985udYn3MAW540OJPrVa99cw3cmf7W1
	RYYrvFLR+Ieso3Qs4vOgcAeI+NgRKnYj8NaTu6iAj9ptEmkRecYYgNt7PWuSKKJ9+Bn/hPdqiJK
	qAm6n1STU25ka2d13dXJx5fHjQHq0Be/3OZqgyApguQiVwZcDZixj3Ix6VN7k90Hv1+US
X-Gm-Gg: AYBFou1yhj7OcZYiRmj7hxVtxnKi67QfJm9tN4cpq+snaugC7BIWz7GijXtDQyiHB6Z
	hBsy8B7/Z0Dz3bPofPpv09venJ9/ZCn54tyq+//O8fNGms2SdL1DOzvXvanlxZUZU/cGpYcSgOl
	6ctXr0tRsFFNvPFxoort6wYIoXAizDqfAie1VGtnegfOml/epTHPULeebVwxCw8T9soySOxtd7S
	Xj/wYS9l0oPDOCXEXxyFV6HEWs8qNRm/nSUk0lsO1kOgvkok06I3BYsJsnNg/VKOgqDzRqT1BNY
	pjdM3FcJ4MpghXKdv9M/pVkhd2oPWWprHP8c1+PmuiwK0jE2Ni05XKN0B7JArYH6uumc63AUBwU
	XUI6HJA9dGjBdhp2rZqXY8SJksRazTELtai9vR4V4/IS34uSUKp7SEN877d1R4g==
X-Received: by 2002:a05:620a:458d:b0:93f:22ae:f8ff with SMTP id af79cd13be357-947b00388f9mr873952685a.46.1794484839922;
        Thu, 12 Nov 2026 04:00:39 -0800 (PST)
X-Received: by 2002:a05:620a:458d:b0:93f:22ae:f8ff with SMTP id af79cd13be357-947b00388f9mr873944285a.46.1794484839405;
        Thu, 12 Nov 2026 04:00:39 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm16682052f8f.10.2026.11.12.04.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:00:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Fix missing wake-gpios in PCI
Date: Thu, 12 Nov 2026 13:00:32 +0100
Message-ID: <20261112120030.99510-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XRwVuxCDW7jPoUec1ZcnX+Mrz7qzgQAPPCrZ/RAYEVE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9apfXDbhXQQ/RyD6WxLabDOBsbrKY5kRok9kc
 JzSJmExpaWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavWqXwAKCRDBN2bmhouD
 1zxnD/9A9wsqYLVW+NlmF1ZtFAkdexSReqXpkF7A5xHItGhA5l4DOtiKGggZf0AeH8AsNGIEMkX
 kf+AlVFcYV3jprmWQJ2B8shVfFfsfhEBRimLh9RKrVQDHkPR0/EQbTTp32gzo658KavirxRAYLM
 AoUUCtsghaLsLpLWP1HQtunFWEEKSJCFVbOdKHOUsXGijuL82AQTmV0l7K6lj3snzSmZWEC0jlY
 L3gfuYUAUmco270vTtPhXpr6+hA6Dsl5CXpvGiRCFlORizB2WBguUpx67NR155WnnpmYoJMp34X
 ZTfCxghnZQFS6GKxUHSB380FvGTVR5hQ+pyfLrLlbSE7rLErfJw2t7MsMAFUx4sz8e40JBa9FsK
 taBFA74Tk9NKM3AxI5WzhBdo01lWDlu08m5gzf0OVHrDL71oeM9UISkE+pPgPR+AUR2nFwj9KUs
 k5DURpDlfCY+LvxxFgLEVSjdwZAcKSyB6AMbMTLeJryO+GOKVIiujp2RqxucNrA4/zFxfwvPKPa
 0vHNGoprO4pe2oIzS+6GswxsZXIdfERXFHXIpoCuZ2IRhJCKN5pInMfPsCO4sRhv9rFmmz9fLoO
 MdcIGkwY/EVfoHeMm/qwNpUTOLJBbaKZxQPQJ/DHARc0ZH9KC1jswsKD7CX1t9EYkELcpcmPWLe j/trJ480wGM/+sw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5aa69 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OK2SU7EW0iCpRKP1AM4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX2OtBuDU38T/h
 Ox75kgg7gwryMRZVV0LoXBgz0Gqa5HQi5C6uR4nfbDz3ceyfxR7mjI3frHForQilFcW+OAoku3a
 5tdOp+5GMJUPFO4YHXgUHac0E5XvLias727zgOCXQcLyU8q3wkRstZiMrujcsMroGn3VnH5EHon
 +fvQLlXqV/thu/5L12Q2fo2diOxxptpts1m/uAtaEf6vZSjn1CYkmrlsVIahAXDLD6SvZ/JI8CC
 usS9TqiraUBpQuW4JKXyCqLGvqYSd4EPZEdGNRSQ/WVsd6qyrDOHRDg5Z6o7EKLquYThzlK4XAS
 CsBcsnKp9Q+9RkDOYo5bMpOE4ah3XXrIVctw6zTfwjMca7juke0j29dQle2Jn9UXfiD8sJ3/WzL
 Y7yMs2V5ZGa8E9cXClbLd0ho4gT4EYQoje72bT8nXYqEq+c94Yf33w3njPrDiMDRsdLhvT4mVFF
 6DvCHhccUVsyaINz3+w==
X-Proofpoint-ORIG-GUID: mkdSv26XPNNvexCUMd8matlYklOx6oM1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXzzhj3lhBqM5n
 NNDcGvhQ0o3Tdrd8AFsNzaTchFR83gkpHLaKydbWm3s3U1EACR6MniVONlsKOpbapYnpqsoyPNa
 dZ1x2MkGR2UvzwsCrflsRXZ0YpQ6mtE=
X-Proofpoint-GUID: mkdSv26XPNNvexCUMd8matlYklOx6oM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047

Qualcomm PCI bindings do not allow an "enable-gpio" property.  Linux
drivers do not use it, either.  The pin matches slot wake-gpios, though.

Fixes: a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use wake-gpios instead
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..328e8be1638f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2019,8 +2019,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
@@ -2033,6 +2031,7 @@ pcie@0 {
 
 				phys = <&pcie1_phy>;
 				reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+				wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

