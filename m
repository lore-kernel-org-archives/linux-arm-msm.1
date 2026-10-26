Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014186;
	b=O7hsprLkvkZQFkNc1ZiL8eMHDum79zUrwO8qdgiD1p59+TK48eYbsxnhy1oitv/B2sCN
	 znWgzFztS1SYrlUyQ7xkglyZV5AinLIMdQRnuSn+tqzz96Q8GF/ECuFNPdJGHirkjMWMn
	 GBr32hF84PM0i95iEX52UCE2PFZh6YplQ9kYrBZT0J6LG9+x7avWVggRmjLDETry45gaK
	 2NYsHcs8Ty3bbSiVbOpN+KP+IU18KEMvIV2qXttcnZunf+ZGHur6uLG8iLnA+xmqRiZBg
	 KkPQZOSU+NN7VZSo3R8cwxr8r/7pNatujU8rH+eWTgzscn0cFTECFIs+dyRGmjD3wsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
	b=gKWdhGJ24/+VjhJIUs4vP+TD7RWe5IlpMO+1w5LCCqRK+C9kOb6hj+j+3dqJkHFxIv5T
	 kkXRD5i5MO6VotIignf27c4MU+943qxJtdhdDJdqdWFDbw58IaMUoy1xZdf1WP3hzaAdP
	 yY1UH+5ggbSmGCWiDafk6NldnUanoVhFbsRL/RTUXOBM4quhjUEzN+0Au7kwdlj7Edn+b
	 SxKgNlvgtH/7zzfkjjCNqzVEGsRQpUmY6mEpMyouYsPbdTYpB+feItRlAA6SZQwN2K4mT
	 veLqZfRcN5VUHj5BBuenHSYmVVfiZKEcB88Jo/QNxb1tFJsxeKapeg4JYN1qjyXT2nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blqXwfgS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL8R2nuA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F35B606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F35B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blqXwfgS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL8R2nuA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9K44126506
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EgS7rlrHOii3FAy2HYTyjW
	wgaqj9VRF1aAlcU4nCDOo=; b=blqXwfgSmGPnFecDf5eHP87wbJvjRAdQpGtJ1a
	thP2nefizXcBBGF+Ai3Pr9+omWsITyfH7UY/Zm/thYcfjODphgBUuRTN/0jtPRV+
	rs0dvOkXqlj3qkUYIYMZhdD+1257xDNKpcl1WSEuRz33zqmvOlbUulfdt03fXnNX
	Vwd/VDUOu7hWiQUUwqjNyDBadqN85oHRuBHP6xzLTF2CYmWyyDSE/VBeNiQO9t11
	RlcJRwQR2tCwsikGfbeZNCWoMDWigQl5NCW0FHCvZk1OuBh+epRkOHxOnzUxGysV
	yLNDSJhm0MNsawJ0reMK0iy6l84MEasDivVcq2K6SGrCvY8g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt5sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:29:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso1943271a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014184; x=1793618984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
        b=OL8R2nuA6WGlRM+lng7TdnKvHwNY6GPt/5UGr6b1KxGU2UPrCkhpp5GInH77I6RSiL
         32dX7sDCCLQWCdOjZuE40tFGSZ16YOqsxkWaSo3+Clf809j7KMRGoOiKmP+PLqqRzWYp
         lS8CUVYaYiha37A27yl3yOZ3PAJdN36VliXX1HlKAUmqLflq3irQ/Lagx1i9/3XQiVJZ
         iSRGyawcB3febcnv0AeOP8vb/+OLwL0+fBLREqZZaPrcN434U3KY7VlMC6zqmEUP6HMO
         IudssRwDQ1qx14zRINRvPwGbCIggDDLi3Rf4WVSSWa7d6h8te6IWvJhHZv7p7Mr4L4ZO
         WDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014184; x=1793618984;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
        b=D0LF5P5k+XovIWZ+TQh39aAoja65dRGgFi1b8AFxFKh3sV0W2iz3t6xxL4S6ZwwCR/
         7FNtKYCvYjg4UbeVzN6b1vI1uMqtVWQMzkuu7lCTdVrh+CpPaGCDAmF/V/giM2b3KOuj
         c1oFI0hi9fzkUaCiMRviT8A+asDjrjLOGTiOi+cBiuZNVEWuxOTh68IJbNyV3jHyV/eT
         e2ffZVbeX2DjVQ40yST+yOoJiGC4hv2vUOZs7Ywc6oxAjGj8lLxMb/S/QFlF6pLejOq/
         HmeQhseQv37csM6peC5WmTBARQy76I/c4+nramC3IbSvHG2m0hMU6vxhBP6v0lNMqObf
         +ysw==
X-Forwarded-Encrypted: i=1; AKwUvBy18JixtgkilzN+T7hWKBZKgWeGTpt1gXJZKGAILk5Z8dbQJsGzAqlG40NfU0kVVSNfYhtei3TEGwqC01Lv@vger.kernel.org
X-Gm-Message-State: AFq9FYJNxwQOXVXopvKn3ua0KjsrrwYXoHUK3chXLST6YaFv4pOpSXqm
	0Qq00dvmBJtlcPsovJGvi14LvqNQvHDMfRGuEdtNOuhF57HpzsSMM+fPfnKD39QhmkFs1Q3pWxs
	dW7e19WhyEaJTyEXQLqPX6LFICyR+Ajo4x7TBVq5shtM2c1eVWQ7xTrNgCGrwfRIXd3Yz
X-Gm-Gg: AYBFou3u3vUz+Vdb55Zy8Cak26O2rbN/7Nr+7tY/Cnmv+TIDXHBgQMWj9kl9G5AXCj6
	s54mm89qwy/nGl9BtulVcZPbIVkY5QOFxDOhoNiIOJ46zWOeKmaTBR2B2p2okXPly9hLRNF+PWD
	Ysc9l6FZBFlrX7arANvTeRgqL+R1QcpRUn7UoegcpnJQF1UPQcQQ57VgqrY6xhnLhzmBbT90fvH
	BGVapaWhF/2NrvtShfOCJMG/EzhJThURmzxA8uHomfjLUGgwITLl2nLGEwCFtroNmRZx4VABxj0
	WwWo3YaJykbTyl8AhrisuF7zUnOZb54meJKzziqWMRtgE9nxbK+dsg3AclGaRgEoWd5RpkKiIoj
	ggOpFVfRN8GYjhbsYm8uO+EE=
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3576430a91.1.1793014184348;
        Mon, 26 Oct 2026 04:29:44 -0700 (PDT)
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3576406a91.1.1793014183889;
        Mon, 26 Oct 2026 04:29:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:29:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 00/12] clk: qcom: Add PDM GP_MN fractional clock divider
 driver and DT support
Date: Mon, 26 Oct 2026 16:59:26 +0530
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJY532oC/x3MQQqAIBBA0avErBNKQ7CrRIiNUw2ViUIE0d2Tl
 m/x/wOZElOGvnog0cWZz1Ag6wpwdWEhwb4YZCN127RKTJ2I/rC4b3aJ9gjeXlIYo5TRM2p0CCW
 NiWa+/+0wvu8HpzBdEGYAAAA=
X-Change-ID: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX+DDMo4ni2/ur
 id8Mcijl/h7YbE8Xqtce5MGQsw+Wdrc+ZjzCZRTQOIDnuCLp+RM2CMXPN1aITQfpO1ruaHWMD4F
 qF0btnATX4NWbGmVttf+CvYi3N5xwk8=
X-Proofpoint-GUID: bzNyYjr1PIT5QwECNNizP4xWOCJV0p6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX6eR2nwq5c78Y
 qDJf+mWy5BCB4rq+CilMOFZh0iV/fHAw1IcW01H5LFwDH881btZIqYklu32wzLOpgLf4tcf5Q+q
 AawY5PpTue0Umqnjwc+9bTunE0GtZDjHPXQRephv2x7DJnecQ7v7WZR+bZIOhPr94A40+Zk23rk
 blU5Ky5A3939ko2xTW4juxkCC9XPF+zeZDrpu6DYtbFs+iF3pxekxffDsYMWkpHJMexILjacEQd
 NV5t6VDXHte2VhGQE8CN8a/9Kx85H3NpVPEcSXL9fti+yERwCxXQGgQj2OLKHdoVZgnp6CJJt6A
 SRCmSJ5b723NDgEznt4vqkWupDM6utVSlAUrk5gFnM8lH9DYl6wYw/EyROcrjb/ZiwAqq6qmpI0
 RZjujsxYbsnz9eXVKrHPQR0uyOdD1OQODXoeD/TC1QVk5tuS+WIQ3m2xaFrycwpRG6wOlV0CqmC
 xg700bvIn6G+VMZ+l3w==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf39a9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6Szwu85aThXN4zbkuBwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: bzNyYjr1PIT5QwECNNizP4xWOCJV0p6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

The Peripheral Web PDM block on several Qualcomm SoCs contains a GP_MN
fractional divider that generates a clock output from the PDM XO4 clock.
The output can be routed to a dedicated GPIO pin for use as an external
reference clock.

This series adds the binding, a runtime PM-aware GP_MN divider driver,
and the GCC, pinctrl, and DT support needed on QCS615, QCS8300, SA8775P,
and SC7280. GP_MN controller nodes are disabled by default so boards must
explicitly opt in before the output pin is muxed.

Changes in v2:
- Add SoC-specific compatible strings with a qcom,sc7280-gp-mnd
  fallback, map the 0x1000-byte register region, and document the PDM
  source rates. [#Konrad Dybcio]
- Use runtime PM and pm_clk for AHB register-access clock management,
  rely on the pinctrl core's default-state selection, and generate the
  output-clock name. [#Dmitry Baryshkov]
- Enforce valid GP_MN duty-cycle constraints and report high-phase duty
  cycles through the common clock framework.
- Add and register configurable PDM XO4 divider clocks and their public
  IDs for all supported SoCs, allowing the source rate to be configured.
- Split the pinctrl changes by SoC, retain Reviewed-by tags, and combine
  each SoC's pin state and controller node into one DTS patch.
  [#Konrad Dybcio]
- Correct the SC7280 output to gpio60 and disable every GP_MN controller
  node by default. Add QCS615 support as well. [#Luca Weiss]
- Link[v1]: https://lore.kernel.org/lkml/20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com/

The series is organized as follows:

  1. DT binding for the PDM GP_MN divider
  2. GCC PDM XO4 divider clock IDs
  3. PDM GP_MN divider driver
  4. GCC PDM XO4 divider clocks
  5-8. GP_MN pin mux support for QCS8300, SA8775P, SC7280, and QCS615
  9-12. GP_MN DT support for QCS8300, SA8775P, SC7280, and QCS615

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (12):
      dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider
      dt-bindings: clock: qcom: Add PDM XO4 divider clock IDs
      clk: qcom: Add a driver for PDM GP_MN fractional clock divider
      clk: qcom: gcc: Add configurable PDM XO4 div clocks across targets
      pinctrl: qcom: qcs8300: Add gp_mn mux function
      pinctrl: qcom: sa8775p: Add gp_mn mux function
      pinctrl: qcom: sc7280: Add gp_mn mux function
      pinctrl: qcom: qcs615: Add gp_mn mux function
      arm64: dts: qcom: qcs8300: Add GP M/N clock controller
      arm64: dts: qcom: sa8775p: Add GP M/N clock controller
      arm64: dts: qcom: sc7280: Add GP M/N clock controller
      arm64: dts: qcom: qcs615: Add GP M/N clock controller

 .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml |  98 ++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                |  21 ++
 drivers/clk/qcom/Kconfig                           |  15 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-gp-mnd.c                      | 333 +++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs615.c                      |  20 ++
 drivers/clk/qcom/gcc-qcs8300.c                     |  20 ++
 drivers/clk/qcom/gcc-sa8775p.c                     |  20 ++
 drivers/clk/qcom/gcc-sc7280.c                      |  20 ++
 drivers/pinctrl/qcom/pinctrl-qcs615.c              |   8 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |   9 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |   8 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |   8 +-
 include/dt-bindings/clock/qcom,gcc-sc7280.h        |   1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |   2 +
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |   1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h       |   1 +
 20 files changed, 645 insertions(+), 4 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

