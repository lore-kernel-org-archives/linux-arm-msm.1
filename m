Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4439933A6E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971594; cv=none; b=n5Yq6HXFMI84WwaY0EnLh7lVTXOfflWdj8YUuhYWbeKUCNcrpGdaeeWEYlCo8wvvSKZGcXWNyIEG3GzOwCbBo0tajUMZNa7Byd2R2KpJgNMJ+OIKEvwgbkNTpC3Dkg1Q823NJnb283Lngtk80IuEsODW2szeUzZ8iqVB1nrbcYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971594; c=relaxed/simple;
	bh=h+3CTS49i76JumwlBIZVMtL9PMPg7KtHdhYrFkHh5AY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EV3Z3O10bRzb1jNZ96CD+zZbfnks8lm/pr7OEZ55erPfWxjINXhPYpY3Bl6BimCeNjjiDGM/j22pO3ZoyLMhVQ4BVxGw/wb9DNx4842Qp9WmkIPfqWpGJeaL+1wG0j8Yqz7rJu5G8+/zRhT0qjptjKd1GOAH6G5NjT1WeCrz4bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9EMbh5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAxm/d21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9EMbh5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAxm/d21"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z1pj1162181
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NN1XadWkF+YNKHvEuDcku8
	r3g5rqc1+Br6lTnG7Wf54=; b=D9EMbh5ra53il8jziSPp6KEkMrWAFW1YO0JB1y
	VSmhQO/7NJ776kwcTsvGzlsPjV/zeBJh8cNO+Tj1vAu02GDy5QSjwjkIHDsRQ0lP
	Otg0pTilqrTbsWwBtrGXUwjJjxQBf0ahdmc+QAStVtot+SyDWcd1F1fFEMsZNo9F
	yjfybkdbzn3m6ANIy5nXVGAe4aUZtT+Yha9IIpp7NOezH1PVpSPlIFIi4mvCAPEM
	lGi9+4a56wo9yeVqQKNoAfZBg5fJqP4z50NTEE1g+dzDAw5yULDUHGSg0exmTMhc
	XEBPctynFZMyP4kqQ/7EazmgkXIC7RFVdls7kgicqjyclszg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wrw3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:19:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc72777faa2so1740404a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 23:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971587; x=1790576387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NN1XadWkF+YNKHvEuDcku8r3g5rqc1+Br6lTnG7Wf54=;
        b=GAxm/d21QaIws0X3DeWrCjPTnr7jzQtbJLmtUEMyJXnvFDPsBmAI9UCzhOzTN39tSh
         s/Su3h7rufSBTIHmi3s0gx+kc5bSwbIaR/9xjh84d6mL54wBpIoxlYGDPXP27yFXx1mN
         LFc51I+zr27BUHvro0COS9LNtLgoxsuKRAyy4ssaK1C9L3zx/kfqft8Zyl8SzJUM/hRx
         oPxHP4VBtFqFcqiPFHI0MeDWFg1Lds4XDFNB22I93tBAW53R78iOLZ/ewiu3rQEr9vh3
         CfcBhVoaPWqk49FjmeIqTrO7mdb2E9PzlA8e+DNzV7BsFZ3q/0FuHtGXMb13Zrkt9Bn/
         Qcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971587; x=1790576387;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NN1XadWkF+YNKHvEuDcku8r3g5rqc1+Br6lTnG7Wf54=;
        b=nXcQRUL7HesN42AMR2hYKM9rJ7mJDe5pm6Iv2T3ui3/zDVgOtgu8iRreQbZAwmXx5R
         ieM17EiLIopFWTQqtPBEhbQilfH00CUhPd2QxH5l27Qzrf65qC9IxE7rpY1F2QBDuCDD
         XkVEK8Kc0uvzep+nl48gGdsjUWVexyaWlCcIO6FOs3FZ5y/eRr+fsXmb/gc5wO7qC3We
         edBYFPUyP71YdJ4f/HjAZX9HzOywxO3rOur84R7KqIupJJpJxNjjdxchqAIxg4x/9NbO
         AuT/e33Ti4THqrcG9xtTlmAVheU1n3wZfTTEgCCLCdTsi/RROJcPMQMa/uLSEdd5jng9
         vXPQ==
X-Gm-Message-State: AFuF++nKwXcfHrJl5FtFg8qf6L3EEmUFNjGC3tXA/rLA9vbR+PKu7tI2
	MeuWI0JO34UZHTaa+DuncVtwvCc/O8Mphrldkj4zDUILasA4VGQeaUKAAk/oToJ7bjinnVjhoH3
	ZsXg9Z0drPigwvgHO+52wkuNf3kVOtJ8sz89xdDSUbTNT1DZIhJdFz0bdSqRiRKwAPdYi
X-Gm-Gg: AYBFou2MOqhuchPgu2ZEzkBJvNU/5JZT8QyUFW8sTQSaisGllisAXi6OLajRm9i7rYu
	7xprK/gBQDSWq1P1Qtk5nhXAWlhgWXrkKqHEn/GcUcdS3a+v+9Vb8GxmN+Q2xKtf4qXISHXevAu
	gTmo3YFpPU63us7jI7p0sprQEn420e2X5fHZsFUIrZbVpI0wgb8XosQtOTk28/u0f3a4L+CewJh
	VF7lAfwXRwiBTPyn+IqD57GPQ7/iLoVMQ11kC2fxrsOg2y8XNuO5O5bU1v2AlZgrhrWwU8ilsFN
	vTZvIDstGpBOW7hazAu3IXe1UtoMY8RGSUKwuXrUYXL2Vo+oblgLiGLPm7rNDIKLpXeNrUrMJpf
	iBVGGcGwaikFp0PJ2HdYTfwU3l2XxqhB5UHdm3jndm2NiBZEuGSbHgG+S761EeDLn1C8AEIb648
	4BELrFV68YYNkdvNDViLqzrfBN93Vv1kpgkg==
X-Received: by 2002:a17:90b:5287:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39e54ce361emr15662566a91.10.1789971586742;
        Sun, 20 Sep 2026 23:19:46 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39e54ce361emr15662554a91.10.1789971586205;
        Sun, 20 Sep 2026 23:19:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:19:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 00/11] Add a few minor enhancements to the Qualcomm IPQ GCC
 drivers.
Date: Mon, 21 Sep 2026 11:49:33 +0530
Message-Id: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXMsGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNT3cyCwvjknOx4iGyxbpqhUZqBmZGhpaGlsRJQV0FRalpmBdjE6Fg
 Iv7g0KSs1uQRkjFJtLQDbSSRmcwAAAA==
X-Change-ID: 20260825-ipq_clk_changes-f12f06219193
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXxSV4AHv0ZVsl
 tkSaX8cidEL/hXk4C2ErzIHl+JxcSqP1+OrKqc/Ll5jqa3IDrDyQkkdgCALIO8VRaTmzfLIBAgB
 IR/hfxJYwOKo6Wz0ZM1m9HGcOJV4r8f4uYEtMLBF+tfBUM6NnT+AVA5IzZ7uWT+NMcbABsS5Meo
 4xaAFv57LfxfRJcEDxQjJn1ohM8tsEco0dYp2zPclzGqfMGkWcNcHbseGVkXH+fwqQpSpB1BfdI
 hj5gDFkX4gOGNJCmeTr5AAbkTp7wX8BPZzxvEszdOndNkxwBxEffzYCMy0shkRoawKbM7NynirZ
 tbtdK+q5Ob7oFRKmM6meDJKgRqY/8whp5Kh/hZsfiALEPRNq42JlyW/yZ8AcCQyej9K42n2z2mR
 xJhyYe1qGKqezEgDt7FEER9EF2MaZ1mfMGd1bvqYAw91mYBx41GzJ58evR+ulSFU9T3evHlmGYl
 Ix7Cm61PsHsgjHPmqwA==
X-Proofpoint-ORIG-GUID: jdsiSL7snOWWGVq0DSVd6sEkqtcxCrQ2
X-Proofpoint-GUID: jdsiSL7snOWWGVq0DSVd6sEkqtcxCrQ2
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0cc88 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bMZdg2PHOV3iVps5Te4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX0SpOMUqeKqqs
 hfO0KENHDidBSec9PmhJ8l4/sNKxcIP83BKRRyQ2hrT3HFuuSAfIFOVr2pLTd6mrIe8XzG8yw75
 O5TjjpTNZeyRQ2Vd6hnR2Fhw0tDDGHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

This series adds USB, NSS, and clock-related updates for several
Qualcomm IPQ SoCs, including:

  - Configure the USB UTMI reference clock to 24 MHz on IPQ5018,
    IPQ5210, and IPQ5332 to fix USB enumeration issues.
  - Wire the USB3 PHY PIPE clocks to GCC on IPQ5424 and IPQ9574.
  - Add NSS MEMNOC clocks and corresponding clock and ICC IDs for
    IPQ5424.
  - Connect the IPQ5424 PPE clock to GCC and document the required
    clock input ordering.
  - Add UNIPHY XPCS reset definitions required for NSS support on
    IPQ5210.
  - Fix IPA-related typos in the IPQ5424 APSS clock driver.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (11):
      clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq5210: add 24MHz rate for USB UTMI clock
      arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE clock to GCC
      dt-bindings: clock: qcom: ipq5332-gcc: Describe clock inputs per compatible
      arm64: dts: qcom: ipq5424: Wire up USB3 PHY PIPE clock to GCC
      dt-bindings: qcom,ipq5424: add NSS MEMNOC clock and ICC IDs
      clk: qcom: gcc-ipq5424: add the MEMNOC clocks needed for the NSS block
      arm64: dts: qcom: ipq5424: Wire up PPE clock to GCC
      clk: qcom: gcc-ipq5210: add UNIPHY XPCS reset entries
      clk: qcom: apss-ipq5424: fix 'ipa' typos

 .../bindings/clock/qcom,ipq5332-gcc.yaml           | 26 +++---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  3 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  2 +-
 drivers/clk/qcom/apss-ipq5424.c                    | 10 +--
 drivers/clk/qcom/gcc-ipq5018.c                     |  1 +
 drivers/clk/qcom/gcc-ipq5210.c                     |  4 +
 drivers/clk/qcom/gcc-ipq5332.c                     |  1 +
 drivers/clk/qcom/gcc-ipq5424.c                     | 93 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |  4 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |  4 +
 10 files changed, 131 insertions(+), 17 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260825-ipq_clk_changes-f12f06219193

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

