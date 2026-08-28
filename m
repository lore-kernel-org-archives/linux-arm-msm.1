Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3264394797
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896844; cv=none; b=kWrxSwLNksWhKqPpr8OrtCVmRdpuDGYJY0p3hJFC1dQ5IWtgzQOWWvQlzaNnoOW17ElOQxhy8zsf1F7KxsVv3vPLxXhp97QQX9hgBnTKEZa4byq8MqUnpBnSStXemBKid5aquhG2laIIx+wLnporGu+/4sSB14Wx+upobWANNuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896844; c=relaxed/simple;
	bh=Dzci3M4wYffoM945MQtL/Q2PsE8tGedgc89VN0a1iUA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PsR6je9dNEMeor3HhOkKRSEM91YmpNp+dTeqgYftxAd/1VNpNKF7kZ9VspZkHx/FEkq5yGfJ1WTgSwRcub7DjjCoyDVVMQICjRgNeuJCyUg/3fULZ+GPA4kIuRH0AmYbgDzbGSVYqDK/kRwMZIigiknEk/TlBvdWNlcYJCa6pS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjIsgWu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTKLkcDs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjIsgWu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTKLkcDs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3Jw7L1811876
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HdQL8NnegaHyER5q8AZfRB
	ORVk1Puf3HLAKuK3i+JGw=; b=JjIsgWu3TzxTf30RLpbWvg07TDSUAPHUUHAu11
	Ft+qU4uVTKIuczCPjSh6cAw/QMRiVMWLMFL5kI2qZX6avq954Fng9SqOIejSowOE
	6mTKRc3X4dVVhk9WY9fv3SBVvnbMUKEi/ycGQab/MGEBhpzfiiiadAoONb8zNaGt
	ZClsr3eRcMXi1XBrOy9jYHUr/NG2qLH3xyGF8bR/2XiEsYpcU4/avFe12tVQS/Gh
	hB/5ex1gh00XTbw08HIbQIzWDf7lqvIBPobKqD8ZWUcWEe5cD03Jox5ndXLXF3s/
	VQTK8DTAMxdSL8DOgNQxSbIL2IiJBuHZMb6Joa3YkHMd8jvw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee3ck9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:00:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so707243a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787896839; x=1788501639; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HdQL8NnegaHyER5q8AZfRBORVk1Puf3HLAKuK3i+JGw=;
        b=PTKLkcDse+X8AHK7quitENxaVtjAuk35YSQR+Zq2S5RQ9GvhZd3WJo3pR5Mi0cIcI0
         I5W4WVHjb30X9pMbDobH46EGmdqbokbv/ayZLkfR/Um7575a/HUeM0i9jtp8a7egEpRc
         lMxQg1YLj3366FpHZP55jKeosmxpAPtx7V9BNkWrz6q/9/i6qsLSsbTMjzE98yxc6Q3h
         S/YV/rsi7fI8YBsdNkThqZ96+NgnqrdvA4dwIfp4cmduFJRX/sPEwjo0MhWbK7qQdMsx
         r97ZJ06MphbCATjksoONeXPYK0U8/sDQ9Np1Vp/e/myUzzT1amNy+LzNJ/PghuUunq4b
         y/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896839; x=1788501639;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HdQL8NnegaHyER5q8AZfRBORVk1Puf3HLAKuK3i+JGw=;
        b=ouTUcHx+HJVISytF8q51VzdTR/MO3IK82W3rGMCKzVst8EeBpiGuom+OiWDE1P4j5q
         1GwztO7gPrtzwg0FccGeVq1n9BRxuz1sWKx1o5mxV+sE8mm+n/B0fauVHcrZB3neSEFE
         Bg3zvjGWJSqhQO7T6ZO98CULB9a30pXb1RzTNiGQjq/6KqEYBpyInZDKvoNhjiyg7Zxy
         vmYjroivTcSVM1QSiRAnij5w9MP3psa215il8H3vtaOIQkcIrFqSICg7ZS3o8kOXMFMP
         75uv5nbag3CXCbydmNLKJatwuMcoNLPhOQ1v0PyhN/J4dmbXr7+lOC788Gk1T2dEzqgd
         spaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0LfX3aH0GSEwKUp7yuXO4Wy4YMh4PC4Oty4stYS6larVukS1e1HycoXzghYvDcFdW0OCkf+uUbwephfJG@vger.kernel.org
X-Gm-Message-State: AFuF++n0tJp3fxoHm7nNjxwHnwwyjgO4WCZ/m/UG3STLr4w9fwvs0vUl
	fZK0u14rTBAQrFz9c2OgmUnc/hFaQC/7/Q3dhz1msU//3oXfrl6rSCOxyppgG3156//pak03clg
	zCdKmCXkahclFesdDJHBWtjVNBpjCbB27wkWCChXwvec5OpXox4A/fK3tSeFhghtFRCAC
X-Gm-Gg: AR+sD1003ySowFGy5CnwFhHKHHvMycZZxVQnXilnW+A4kBMpgsjKgN2dF/C3UTrtEM1
	bmNWkSb845z3IasKPdkFpOakKcIWw6bVOpgaLYiO+OhwJ43Gs60SmgaxV+GNaOut2sXQr3F7K0V
	m9EfWn6Qw7qJSsaxbqdV3Qjw4CMC/c8cgCiItlUasH31a502nungnNHSR2Q6VxC8GczB/I28xF3
	KeZRSzt+bYTj7VZ7bSYe8FUuIyem7R0kmv0JSNwMFVvCuEuKC/rs213CMNRdWWSnOm0+JUxWh6p
	Q/eNWc+C1gdQpOX2ocNa3OnJe15SNnEtIYubnT4CpfqjjbdyUYYDUlkKsSe5Elq3ttukPLKvsBA
	1K04nfYv+Pwx+Qwjfy1ZOT9/7+w1EZpK+eOfZJF6ApTqXwjI=
X-Received: by 2002:a05:6a20:d043:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3d265e3f83fmr9808162637.4.1787896839367;
        Thu, 27 Aug 2026 23:00:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:d043:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3d265e3f83fmr9807990637.4.1787896838810;
        Thu, 27 Aug 2026 23:00:38 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm1759033eec.16.2026.08.27.23.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:00:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v4 0/4] clk: qcom: Migrate x1e80100 TCSR to clk_ref helper
Date: Thu, 27 Aug 2026 23:00:32 -0700
Message-Id: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAkkWoC/yWMUQqDQAwFryL57kLYWpFepZQlxqgRqu3GFkG8u
 2n7Oe8xs4FJVjG4Fhtk+ajpPDmUpwJ4oKmXoK0zRIwV1vESBnrMlBa2nF5ZuuRjFRAZibq64TO
 Dq09/dP1lb/c/27sZhZdvC/b9AF/yYIV4AAAA
X-Change-ID: 20260825-hamoa_tcsr_qref_0826-00c0aaf8bc3c
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787896837; l=4316;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Dzci3M4wYffoM945MQtL/Q2PsE8tGedgc89VN0a1iUA=;
 b=IykzhaweUorA4KEtC3dkbgy9QRsSGjVPuH0Tr8oVb2u2BFgcZkBx1KmrNQ1pmR7sXggMpvYX0
 p7ocBDFCO7mBEcYiUH4lIUuBVJiClWHQiu58YD33dY4JJYJqT+DYiqQ
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX2RrCPHAUx3Lx
 mhZJHmdVHpQrsWjAroHkkgwucqHfVGObPSHxPI6rbhrpqF4TRi9Kw7VqEKqAUmBzm5Pdb1w+kEN
 uHNfTtXekzziMx2BbWOqBC1qiEtacFC7uor8W3l3Vg0eu3l84SzawxAZXO2XRDSatqZo97JafVN
 SE031NS7zlAjXZkUACqPdCkn/yk2mcgYcNFl7JljYJk+Fx+ssPM5li4Q+b6zc4uifGxO21Mxf0S
 tZGH5OIAqIYDFFwB8yHRlO0t00KUIOMciuvkCFVCD4bffb1UisTP0tTt9+LHoqth5XQpDWYbbje
 39b4kcnUixvl0XbmENqUu8ICDpzBVsVl2D6mpb9duvyH8A9lX2hkz9hAOqDCksEgXgfGXsL8NeZ
 yV73YMQ+dgUy6hmfRJ7R5508Gg+2gulkYlsK9Hhm/XPCAIDPRHDPIl1v3jLm26HopkpvtDoVIPV
 WUGiJIx4R52NsM/wKvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA0OSBTYWx0ZWRfX0bYmYiFax/6W
 QCLrRWK1lN9plpxv1hYpn56fS/Q3pFBWrLu0xeBY/7u4gwGraHvZKhCyaLodcIg0ydmiBogxwgl
 mPdmqW3Cnd2vYhmENfNCdBuULOnIcCc=
X-Proofpoint-ORIG-GUID: bKSlg6KehDmmaF1dFbuqTRl97VXPyorM
X-Proofpoint-GUID: bKSlg6KehDmmaF1dFbuqTRl97VXPyorM
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a912408 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=IpJZQVW2AAAA:8
 a=1-vlQt8Pr-clZXT10UoA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280049

The QREF block on X1E80100 supplies reference clocks to PCIe/USB/UFS
PHYs and requires dedicated LDO supplies to operate. The digital
control interface for QREF (clkref_en registers) resides in TCSR on
X1E80100. This series migrates the x1e80100 TCSR driver to the common
clkref_en helper introduced for Glymur/Mahua, and wires up the
required regulator supplies.

Patch 1 splits qcom,x1e80100-tcsr out of the shared qcom,sm8550-tcsr.yaml
into its own binding file and documents the QREF/refgen supply
properties, mirroring the qcom,glymur-tcsr.yaml split.

Patch 2 converts tcsrcc-x1e80100.c from local clk_branch definitions to
descriptor-based registration via qcom_clk_ref_probe(), reusing the
common regulator handling and enable/disable sequencing.

Patch 3 removes reset-cells from tcsr dts node.

Patch 4 wires up the QREF/refgen LDO supplies on the boards Qualcomm
maintains directly: the CRD, QCP, Snapdragon Devkit, and the hamoa and
purwa IoT SoMs (purwa shares hamoa's QREF topology, so it reuses the
same qcom,x1e80100-tcsr compatible and supply set rather than needing a
dedicated one).

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v4:
- Drop #reset-cells from the binding entirely.
- Add new patch: Drop the stale #reset-cells property from the TCSR node in hamoa.dtsi.
- Link to v3: https://lore.kernel.org/all/20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com/

Changes in v3:
- Patch 1: `#clock-cells` and `#reset-cells` in `required` list.
- Link to v2: https://lore.kernel.org/all/20260805-hamoa_tcsr_qref_0805-v2-0-4f1cfb1fcab2@oss.qualcomm.com/

Changes in v2:
- Patch 1: Explain in the commit message about the ABI break.
- Link to v1: https://lore.kernel.org/all/20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Qiang Yu (4):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
      arm64: dts: qcom: hamoa: Drop unused #reset-cells from TCSR node
      arm64: dts: qcom: hamoa/purwa: Add QREF regulator supplies

 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 114 +++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  21 ++
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  |  21 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   1 -
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi |  21 ++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  21 ++
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |  21 ++
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  21 ++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  21 ++
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  21 ++
 .../dts/qcom/x1e80100-honor-magicbook-art-14.dts   |  21 ++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  21 ++
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |  21 ++
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  21 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  21 ++
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  21 ++
 .../boot/dts/qcom/x1p42100-microsoft-sp12in.dts    |  21 ++
 drivers/clk/qcom/tcsrcc-x1e80100.c                 | 335 +++++++--------------
 23 files changed, 626 insertions(+), 224 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260825-hamoa_tcsr_qref_0826-00c0aaf8bc3c

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

