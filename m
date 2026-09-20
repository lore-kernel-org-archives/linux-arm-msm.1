Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CF628F5
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895471; cv=none; b=HNNIPB8Wuy12ER1akPD7gPLV3TtMDQ+zr4q3VUerFah1zHrH7RcciAmB4wmdsWz9z7iK3Kwg6N7v0OzxhjSGQi5QaV0gVlW7wonrwx+btMjA+SKmXSJ//HwxOEelldpuOiFpQHc75NZzB3v32zcIVza3eec73kEM/AMIlUwbbH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895471; c=relaxed/simple;
	bh=jUKKHsJ+wNOoevjg3zWqhCwj9JSq6CVvfcbmi0VNi8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qf3pbu34DKjDTM8nKgTSy1FCdq1xmQ+S3oL7F6OKoj7oXUbrC7S5wwECGO8+AB/gMpPYmRAed5otrCX5SohoHWacrscM+oz0ikNR2yR2q8oKut/y+h4lEL9Xf+c8/UhIAWtzeKB6GPz+5k7ilNPN+aXIY4XgnNkhQFUr0cJI+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ik0XnO4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e56fBy48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ik0XnO4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e56fBy48"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VSDY1175323
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJ
	gFYfKln0=; b=ik0XnO4wi06iMVcqe9ScEp79zOAgZDavDyIHPsfYUbGpSMXLwdm
	b6c7eIz3hEK8/4PmWnTtuQBXo0c+q/Vswbwe/9C87s4u4nbDWCPQLvtDFicusPJB
	8gBgWrhY2giWSOJWxqI3g8TJJZ9OP6eWVfZJCfeSkIaRR67m1gVT74dt2+dzk2Vu
	MqgasRb0zOUvMvjiMcsuIjnNHO9gjwpGvhvkTphoP7vfiiVoIKhkebjTrj5PtU59
	JPZVbLv6nuxmZXuevTzgjVLfR+PYjBAgRXV/88ek+njXZFy9OePEDgDvW5Q0Ua94
	O45JrRbHOESVMzQBjZYfqe9n6HRXoLc1ksA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9tgmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:11:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so30473525ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895468; x=1790500268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJgFYfKln0=;
        b=e56fBy48VqRHwC5EG+ftZrpNkyZt9Twg2SqBYFHEsaa9+/t21JbVR3gPJq0Kd3lpFt
         N2usdZ3+6CPJ3eefVOFhaq/EdtuHUJkmj4ohpwwsEE486ACCBCl8hvhUoCrLJKkXNPKC
         s7vCs4oqqNQy7cyerxJPVP6AuTmjJFP/iCnOs9RUtgBzK8fbS6v1vnUSv+oNCr1yLUce
         PPBU04mKtj1w4drKc8i4CepQz0CQ11By62+gWz150W3u29XF3paiyzlK8a9gMCCOGFC1
         UgbQ5uyyjeiCcZaZwONSP/4T8EvGP8utgga7mRTdcA8sXDmq+wInX6KFKl1imP9rxNVV
         dKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895468; x=1790500268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJgFYfKln0=;
        b=kPPDxwdfM2mAllolTKKfNY1e6DfKF6jT3fJitSCEMKHYbhC3bO4XmFly0T2v3p1XCi
         +HhiTV116JojZ4XLmkxdjzVPt/16PyoMTXEetOc4Kof4wzDVnKTQhiWnHCnXX5C33tVB
         +dvR29n26HQEmnNGaBCsb4U913wsTEiTa/GfA+nEBXQjyNMHru9bI38/xAcF6+1f+jM1
         2WaU5EVOWmAOKa7RToCqr0LLPRfE8fdljgSzDg9AUxd1cv9aJpcc41hy5eluPKghzKzW
         ld6V+hQTw+L06gpSmV9d9bCRV75T71gMp5IeUqUH4o5SAxVs39/eTSG+DeN0kF3CLyGl
         x+/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEdfTJzLTAUy86K/1eo3UUEzLm2S9aj2dONrmb49hsyimW56cOpLAE1U73YnIlJCPuC+63OI8qxEjI9bth@vger.kernel.org
X-Gm-Message-State: AFuF++kxY16iLTgl5PFeCFKFg8EjQrTfhIO1NATdbclwd2q3Uc+sjZa8
	bzAWKOT6NKoc7xsS6ekZaxNW5B0eIGGTsIoko2rKPy1TRX/BQ+U9yzbOfaeQt5Zq4fC9M4zO012
	uS9ZGFt4LsURDFl5658ZvhIzbO+feff26TfpTUatY54Zu+J5eezwCDVuBu5MqGiHqZzl4
X-Gm-Gg: AYBFou3fdBb4FZ2IC67AV31vKFXeSbXxVVmCNqIw1ZtVLbcqH3n1eEWe1GsYhidtuKZ
	avH2kQ8zs0EMa0xeEQXpuftWvSWRMJTUY03CPZ/N10AIqdGq4aBFKYixQ5Dr2Mk311b2mT0nNFc
	rac8rlSwF2q6/bRI7P/SsHgx1zs9pKiW1TDeXH2LAl0hSo/czHyqqfVGt/1yPNmpRvfxv2LIsXb
	SBufCP6T9aUv7ASnBo8g7agbNcEbv6BuMW+C2JMimITFAI86dg2NwklyeGkvtPxw5QF//nOzY/c
	KvorDWI/uIFLs8Hc2+hcmk0gAcRI8wQrC6YHqiXXbzyJWug/FpuKGReWT+yGuK1yZ54m9gjRK5k
	CcEPJ3hXNC11AdDQ4MHOV5nrcGa0forU41iN9ZvS88j8Wo86ZD/965FHOCqo=
X-Received: by 2002:a17:903:3885:b0:2d8:d4ce:7e3d with SMTP id d9443c01a7336-2ddb1b8987cmr124497335ad.18.1789895468336;
        Sun, 20 Sep 2026 02:11:08 -0700 (PDT)
X-Received: by 2002:a17:903:3885:b0:2d8:d4ce:7e3d with SMTP id d9443c01a7336-2ddb1b8987cmr124497185ad.18.1789895467901;
        Sun, 20 Sep 2026 02:11:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: nord: Add camss support
Date: Sun, 20 Sep 2026 17:10:50 +0800
Message-ID: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cc05gEXaJBvZhb--cvTIDlGUegk2CXCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX6I8DOwMyKJR/
 JcJNH8y1HkiCEwmoyuUWAdNmO72NEJ/0J0xWgPnBXVMRVl5akm147vsWW8Vfi71bmnP+67gaOys
 lsynNzN5fWWqMUbRxdDlJUzkxXY1sM4Kj0A18lgfCqRdbTp+biZxEoC70neo5kwwD/nY+l4YLQy
 CoiD1WWz56MQzrWKlRqD9etxy92fOWO8I8vub2kAwGiIM8e9ygaRsbh1FxXm6gNptC8IMQTTnWW
 mOu0JcAIPt0fT8v3bGgkJkiaNT4IxFQ+FibD3XfllYsz8fXD6sAAzSlLBexTeQDRmI9RKm5EngT
 iYM16TR51whpN6MKpi+sUSTp0nNdu5lkWPuwUfuSK9RrI3Sp06szvaD9OOutrAAdUZsU1zIDk2u
 LUHiCXfBJTsdzljxwfBFkIWvXH5jyUTOfFwNxt+6qwOphX7pP5F6kSKnKp0xoDxnTEEnwEEdeJb
 gAXGyUf8k4z3SXfCGXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfXxXMeq2coKobq
 pDdOG8uwJM9cawqZ7YD5e0xzOLwQs5FNc0VMWhXXVSgLqOauhqekeCT8niUD3+cfItQjCh6TBu9
 q+BoqBtiRmI7PQkp1l0e5eIF2cfuHG0=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aafa32d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z18lgUtyltjxkIEc-I8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cc05gEXaJBvZhb--cvTIDlGUegk2CXCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

Add the camera subsystem (CAMSS) node for the Nord SoC and enable it on
the Nord RRD and Nord Ride Embedded boards.

Dependencies:
- Nord CAMSS: https://lore.kernel.org/all/20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com/
- Clock DTS: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/
- Ride Embedded DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (1):
  arm64: dts: qcom: nord-ride-embedded: Enable camss support

Wenmeng Liu (2):
  arm64: dts: qcom: nord: Add camss node
  arm64: dts: qcom: nord-rrd: Enable camss support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  64 +++++++++
 .../boot/dts/qcom/nord-ride-embedded.dts      |   4 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |   4 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 121 ++++++++++++++++++
 4 files changed, 193 insertions(+)

-- 
2.43.0

