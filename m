Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804037F331
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256280; cv=none; b=dRffO5a3e0UAC9/oKDPgdN3xOB11e035P2U12ftqMqN6HWD8wcIvIN6mFMe75ScUvDJA0Ail40Lddrx78QS041y1r47s+p8wiFYWXczEs6HtkvaZPQL4kPOYhHWZ9DWZAKT+nJ0CF7quQNvDZJ5qeLC5IXeLvPPFhW5iwqCXONY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256280; c=relaxed/simple;
	bh=v8rzPC5p/ZzHT2U8EE2mR0Bf0z1+u2GqLUlHUAGOYC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxHNzb/06oZNOgixA2JUl9a3zbPJFW9INBA8XrBXiN/43ojNkEZnYc0l3chJ6B72V8pvx/xKBddCGszWALWlr1yx7/6LLV9HuGPNQRII6m4erys5PdZX8XpKOOgPNl1LfybGeNdlmxfBa9js74kUQvCW7UAotxdmFkxkMEZYyyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCqPygv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGDMKshQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCqPygv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGDMKshQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179LHi1709594
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 09:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WhRQE7fxgjYQGNy87/Z7kAzX41sDH/R/55t
	8bfb9X3g=; b=pCqPygv9b+63REW66URXSnPffvsI10zxgjYUO7gLL9kjUrq3pMp
	lrC4UHiPhZEwUUEIEc4JO7yi39ZJ61gjDZSBMJdBbuRWO1pUrWSP/qZPwtDvlKbu
	BCmp3ZCcFddKMmBqXB48fA4MfYM3dz7DyDNl0ZRbWAAdZo0Isodna6y9CxOqy99I
	UDFXq8XMTlqv65J6IY9tjkXS/uwxQ48nR/IxToLqhh0B1wN3Z6XG4sg+CfL5Qo4g
	FBLYwSTpjhmVEeXmUnIZTFNHSGmyuj5xmp1kMAZJ1TvT/3FSPfYZ8urwYsjDcRNt
	sH2gXemAj3JYyFJZtJPOwaPCuzKStr/K2OQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsmp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:51:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so969628a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256277; x=1788861077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhRQE7fxgjYQGNy87/Z7kAzX41sDH/R/55t8bfb9X3g=;
        b=eGDMKshQB3exPlLDqpX1z1qYhkQBhjk/DW3fcRB/s/vblKMkpQwViM6Q0FJEW/i6BJ
         S7kZW8bQBVukE2Ln5Gi9dO0n5UZz77JQzusF4P0kRB5/fZ7xwPJwGV7yYtN6Vd9xWz5b
         fY7w8VIKTOdW8F+S9Vy+h0fMbBmJsuTQU5oKL3oQpWxla/KVvq5PI7ViTdCfYuRuN8rQ
         8yIcjPspbi086YnrZYtSB5Ml6nCCZWaue82dJjrP0xXue1wffwBCMDF4U/OpkLHWiOms
         UElmLwijXCtPap46uAO/Zmq+kfmfPhjElWDElCghcbEdegQVO2VX6T+ak3UtS4qUEtl9
         iRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256277; x=1788861077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhRQE7fxgjYQGNy87/Z7kAzX41sDH/R/55t8bfb9X3g=;
        b=MQ96jekT3qZG4/DgXrfjmSO501WRWLE2zwzRDBtAmWesEUR/NA0k3fSiB21LuFQjMg
         TvgOVLfo/QWAF087PVEPHBWh2wEn+3qk/mwjoxG1d3aJBvlZP3BkrbeQpOLug60b7TDG
         jeivCq0bnbN+IbX1ufPmxOCYH0gaayo1kDMG3GJF+EgK2hxZ/7iwQxVs3xIoeQVRQOc8
         OSBCw2cEXWFLCC23cYK93sokA9H3xOv1Ix7r2P1h1NrnXbchptVLF8rgdhLn9Lu02s+K
         D+SBVyjdBnDgECP3hpUK4hJ2o0SrGrl+NeBxdfmBwRNj/v/+yF2BVemZUiXkgTKhlqA+
         D2Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rp1MKTzTAHKYFBKsNF0DfXlD1DadJVY0uhZGqfMXwNPzrhCMQvNPX3DrLx1pcdO2QN7H0490V5WS11IhmuX@vger.kernel.org
X-Gm-Message-State: AFuF++nUq3xa77UOrQtNaa126enrTP+QYV6uAo0sZtygmzb8OboY1NI7
	frHvumjklhOJo4SFMsuNpw+qymIJyG+jIbPqisiZxMq8dKT8bJbzbI7+fbAPUWH6owg2BQpJY5q
	gxsvOt254BePbE/O8mFhVGYmg3Ue4xM7RdW1pdEbYVBqy8hD8haCnb1G3Wv77zwM5v86r
X-Gm-Gg: AR+sD12oASHy7bmDQH1B0oyprM+e1SuPI/tyqCBIC3hJcyU6Zje3Oh8uJFULsNRV/uH
	Xgaqa2V+41vkdJymgEblxACNxafbzCDGXGPNzfqPNIoYWRc5jZo1thvF/QkaSmuNL8i9YXsJLSo
	qI3r+9NkCU8/9AUp79Pb07mqSAfWqpjLAkGAio5FLA6DyGrtyv2LU/n/EdG0fYwD2xhvvOBfxje
	rpb0mcp/REVsq6Wo6BBaXljGyvhWtT1sUTtIdWRlAapoeTX2YT1CjfK2uwV8slShUjY57KVYpHB
	/z78o2/8KoeKr7veZv9BHRqPR58jDSGPDFU89Sb0vFvVKPQNikxahEbfsTSK6uxdjl4wce3fWHf
	S0GgB0uChz78cDWtXMRWsCAiGCKz0o5uTalZm4A7RzdHkwWOaoU8nvRA52xpE
X-Received: by 2002:a05:6a20:7483:b0:3d7:dfbf:7435 with SMTP id adf61e73a8af0-3d7dfbf750emr8395233637.25.1788256276652;
        Tue, 01 Sep 2026 02:51:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:7483:b0:3d7:dfbf:7435 with SMTP id adf61e73a8af0-3d7dfbf750emr8395180637.25.1788256276245;
        Tue, 01 Sep 2026 02:51:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] phy: qcom: Add USB PHY support for Nord SoC
Date: Tue,  1 Sep 2026 17:50:51 +0800
Message-ID: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kG8kqJsJT0HSdRccmxiwkYUA4g3RcT2y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXw6ui9z4XGl5r
 2KYmCJ8P/K6QQOzkd3MWAa86bWdVyzEK3pCNK2muDF+pMLt/K35ScXI9FrIQF96KlavqGx+leJ/
 i2qsU/lyLAhEphAae9hTAK7aPRuHRdY=
X-Proofpoint-ORIG-GUID: kG8kqJsJT0HSdRccmxiwkYUA4g3RcT2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXykEMU1UhAw98
 tmobMJZS6Eb+ciAAe4ZCDArJQnw01nyOq2OCb1pBhJDFz0hFpJmc8UuLaUPJI2B/V+kdHNTl8eF
 Mop06kgTrxQE8Jjxf0opIDhJxG+PoPQq3TKAcCYdO1pcGrRVoZNpWqJvaQe5bqOZbg3TaJ1WGUt
 e6kf75GQ/o/33kmcGqsgNz9R0AMXALuNFhPiy44v7bAICQ6AP5RGfaH/FgqJfz31bfBm/aOwtjf
 1KG7J8qjYYgav8i1UWfPWO6UFg+KkWJHMuJK9il7aytG5B3T2y4oL3rzf6FY6fFAZb8ZNtSwGUP
 6PhWW/X8hN/mHJqqQx2QsncAuE/Vhs+OtU7cZs9gAKWKbNi3Lxi8GOI5rYSghWzUQNWKWSsAmz+
 79ouaqtNsHOZmIy9M5WnyNs0/7ceta0ksXuqOXqGLnhI70R1AkRrdmeIbLSen5013Cmv7qxI7m9
 0fuM+Hra5qRNAFsdOnQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96a015 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=3z_Grn4b4YC_H-RRj4gA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010086

The series documents Nord in qcom,snps-eusb2-phy and
qcom,sc8280xp-qmp-usb43dp-phy bindings, updates qmp-combo PHY driver for
Nord SoC support.

Bartosz Golaszewski (4):
  dt-bindings: phy: qcom,snps-eusb2-phy: Make resets optional
  dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP
    PHY
  phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  2 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 66 +++++++++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)

-- 
2.43.0

