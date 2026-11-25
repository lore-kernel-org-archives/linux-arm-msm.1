Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590773;
	b=RCvb7rDETV6WzN1y3tY/l1zcUUSiL2Emf1QwQ9hl2/PFPZJwsJZot7HS4jucCCWY7d0n
	 31M0TSDx8kDlkm0TNuCXfKugeZbph1m305QDUbvhjpdBVlpCyBvbRNtPOR6AaxZPpH7dp
	 EDns8lgAVCZ3hJ0RcnIUnNEYp263JpR9IrOfhrv6ATjf2khovS2Df4zP4aS4fzK+A/IAO
	 HYoObd/b+Sbiga17xnuOuWCl0yQR/f6GKdIv/Mnj5aMde1uBq0lwX8ucStW7VFIgyTZUw
	 TOZaBO2sec0ghUsGA/N1cB5jXH3IL3qXZw9oGc9z9/XDYZ7FiBbCe1Enz5zC7PJbQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z5C2/oBmzCiyvGxYovb18Y03UU1iBorGa9Wy+Y0wXaw=;
	b=h0n52gSc+JGiuH5p/5TVtvDpySbDdgtiYW4WiCXoXD2U+n7DrYM8UDc15EBqIZfpzb6d
	 Z0727qtHDkqtT4uy+gnSM6i3qAguVmnJir5VckKyNr83qAC3IGNbT2c/oIwfhDG9u4Bi1
	 0fJzP3Uj2cuV5UDfJUk3iLnXjTIb4pTstCRYWy3VBo7IN7OXtbpnmyT5vyX73d+eVaCSe
	 DHx6RsvG5vLMVoyqn8qJCR4ZQ44vVmdBtqqtu6y+KUfeHaTytnJP0bN1s8t5l2mUWZZzV
	 3yW8T2RuX589+ID53ZodP4ROzxMepH0VUBOOa6WkDUKGeESzccwBA4UbtFVTw4LYGbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lqhabfYt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N0UxjlMh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA878606A69A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA878606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lqhabfYt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N0UxjlMh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69tXo1006337
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z5C2/oBmzCiyvGxYovb18Y
	03UU1iBorGa9Wy+Y0wXaw=; b=lqhabfYtzs6gC4V6Ikhe6Fa2y1X2aISFHB1bqK
	es7vA1hq4DamK03GxYPf42F25Ey0YaCpWHfEuhNqFPUKWGBkH32RRPQZzgImr6z6
	4RDRi1quyszkl2Jiyy1qrusqcSQdTBE4EsrMcX1N7xN6/Q2BTTtDz0pyYedF63xi
	R8wvqmvtPV5ldfaOfb86JgfhpCzGZxQ7NX0DpirAgRWHvYNMFPt7GsvQtI5aAgDY
	jZ5fVN12GKZsoZlxXTMdU1k3mpYN/+P2vhDkPhR9Y6xTXPr15ky8RCjeYGVSqb3Y
	av2cgxlDy9oUnbQDdYcwqPH+MZYBTMJFjchnHDzSmt3Cs+SQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28u3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:12:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69b8c6dd5so5107347b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 23:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590769; x=1796195569; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z5C2/oBmzCiyvGxYovb18Y03UU1iBorGa9Wy+Y0wXaw=;
        b=N0UxjlMh6Bcz2q9hbuf7KmIpZ1Ii487fNFFzycHHdfhQRbtSYfm/+O3UnIE1VQlslo
         8EaudKewUFeMb6oymqLE8zEKMsYKHmER9tDCi4W4xkgTw6bMZ3g74J78DbfzA36Elyv7
         4ha+/vNsUNyXDiTqW8X3hpf6ne7W1aSG/2+e5IjhAL1/00cJY+wXHqFKzPnpr0cUE2PQ
         As2iOMJoMA6bRI6qDWuMp86NdTI2rC60ScUMRMVo04Q/mxPHnZ3GKCgrJ6c4g8hbZeyZ
         tK7WZOFkQcFkixu3M7OnPOuLzZcPOLQM/onadOYETth4UygqzzRApBgEKRW6yPi0EH1H
         n5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590769; x=1796195569;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z5C2/oBmzCiyvGxYovb18Y03UU1iBorGa9Wy+Y0wXaw=;
        b=g2XxdF9eEyLfcS8ya1e2HKVBi4W5o5hqnsDANfX8p6TjxdTeVk8TwjSe4CBIfJgg1d
         aS8/3k/mdqOhZoZw9CdUsLNfT04Ir7xJgG2/bHyHHKsZRjEO6faimoEB0fndAH0Tz9Jm
         Nw3spuOyyn6PYKxOA+rKZeo6ICdCoNmkcw9pfTzMKWtpRJAGuvcrO4RbMyB8zbSjYr5j
         xC9cWwHlsr/7qdJf+SV+4+NhnRc5Isp8BPrhH6G3LUDD0mwCAUl09IxqLNWJ3w26leg8
         8ROjb5BaKhuZEWYWiwAb06LGQTr/BOQ905prJdDrlRkK2R4jgcqVvRNtlF5YKUXbPhKu
         emuA==
X-Gm-Message-State: APuU4Z+KH9/V7Tzzevan7NeEvgivv78YPrTXQsRA5cT9Ka12T3aWsmnX
	CLAFCfffAk7k79QyXfdvk56Yf2G622UNZi3TDA95Ts1BfszTemaJ/ZBcXNkk9KJwjjBNJzC58+o
	JHUbZot+FxLDek8T/LEr3ceQuGelK8LhIrKXv8TYd6RHf/UIgwTQ9mf3LbmkIWAFbX5lQ
X-Gm-Gg: AZFdTZdt9dHyUiWLW6DE4Uw5B6s/QUOM1AMkUk9T1zbruPdwAm6gapUcv9s8nzkAtil
	Je5slYb5EHTJ81z04cVS4h0GtVinzrVdDivY9OJq75E5ORJRO7Pg3DZMfNqLkntnVz1Z+ouFORh
	aQ+vevHukPdgvsrbmS+mVcW9utFUGSx0x/CrZStsK4m5Eze/85oCuXvah/fPnrz+E2eQztdWrl2
	FZgqu165JfVLQOwUlBRDMfUXF2g8eu3YIdxgCL+8NXAN15V02I9/wEgjfDnMCjy6aSi0i9UZ/MD
	jt5oGkUus3qcuTbnVEZgUvdx02BcYZpzgPTHOUyJwdrqdCQwRD7R0MUxnhUZBZ4Uqxuz1cRVPuT
	kcwmBUoZCOGr3vclLrw32W0bvx+YpnRIa/YOM+4yGmxrrjIO9KcyXZ4kEYRWz/pcB0X5079c=
X-Received: by 2002:a05:6a21:1b81:b0:3eb:aa33:e586 with SMTP id adf61e73a8af0-4014bc550f5mr16722342637.32.1795590768558;
        Tue, 24 Nov 2026 23:12:48 -0800 (PST)
X-Received: by 2002:a05:6a21:1b81:b0:3eb:aa33:e586 with SMTP id adf61e73a8af0-4014bc550f5mr16722325637.32.1795590768086;
        Tue, 24 Nov 2026 23:12:48 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:12:47 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add support for Talos Lyra EVK board
Date: Wed, 25 Nov 2026 12:42:40 +0530
Message-Id: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGiKBmsC/22Pzw6CMAzGX8XsbA0MmODJ9zAetlFkCkxXWDSEd
 3dTDx5ImiZf//y+dmaEziCxw2ZmDr0hY4cg8u2G6VYOFwRTB814wkWaJHsYZWcJupeTgP4GngN
 yLMpSZnkjahb27g4b8/wwT+evpkldUY8RFCeUJATl5KDbWBrwOcLXgIvYbw2N1r0+R3keOT//l
 K/4h0ig1rrKUoFKFdXREu0ek+y07ftdSCye4bM/EF97xGcBJIqyqQu5R12tgZZleQOKvRGNNAE
 AAA==
X-Change-ID: 20261007-talos-lyra-evk-v2-e2e588a34f6d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: HT1X5Xy_wTnpLQVAvPg7vA6Qmu4CbUV0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX8LhprjA3ScnG
 DCAeLyxmiJBPGVCTPO1n1dYjpbr6hn6PP/EywcikVmYtVE4XJkG13ROMYFitXqIUJcD2E5cJuVQ
 5ui/m0/Iy6YRbcuxBYu4ciiwW1tw4sc=
X-Proofpoint-GUID: HT1X5Xy_wTnpLQVAvPg7vA6Qmu4CbUV0
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b068a71 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=XRYUP8yNB-fVxFRa9e4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX1KY0ew443W8O
 6+AJsIr0Z6LUI7fx9C9qh+95IBFmcv3ozFxfyLuYLLw14WxPnGiHOh6e00atAnOkqK8K8gH0wiE
 4fliCpAfNFEmtzqHkQyOnNbTYfOpG24+v9VXilv61w3ZFW2fzGt3w/VE4sDXa1yQ767xHpFzs2m
 iv7GmVVipF5PmEA3ZMg4SoPbXfLoV6Ap50PFh7tfESYcf0oyPfUTZbqciKmu7PvB5wzi//6iXT/
 YPUplhkB2FQnLv2ydLw2rpsM7FdlI30YstOjsyC3Lpj7L7HY70D4Xieo+1V7DAHsyDYwIgT2lOb
 YCaPOWRasYyqU+5vqB4zWr1i1zLQ/ga0IQ5oVs2d3/5SgjH7+Gk6XNzlnnuIEqY7OjsnlndIev7
 /Ekzhv5Awt1heBlS/i3QhgQoAnPrsebPhyV2yBRZBxOVR6I5kB+tdZ6LFs9F3Rn40RO6yv0uas6
 uIweP4LMBgkrbnYFDFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

This series continues work originally posted by Avaneesh Kumar Dwivedi [1].

This series adds initial device tree support for the Talos Lyra EVK,
a QCS615-based System on Module (SoM) paired with a carrier board.

The Talos Lyra SoM is a compact compute module integrating the QCS615 SoC,
PMICs, memory, and essential connectivity. It is designed to be paired with
multiple carrier boards to support different use cases.

Talos Lyra is a distinct SoM revision of the existing Talos EVK SoM. The
key differences are:
  - Adds Apache (Lite-on-Module) WLAN on SoC Card.
  - Removes SPI-attached CAN transceiver module.
  - SDC2 on the existing Talos SoM supported SDIO-based WLAN; it is now
    used for the SD card connector only.

Note: The following are not included in this series and will be posted
as follow-ups:
  - WLAN node
  - USB Type-C OTG role switching via CYPD6129 controller (OTG support,
    VBUS supply management). USB controllers are set to peripheral/host
    for initial bring-up only.

[1] Link: https://lore.kernel.org/r/20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com

Changes in v4:
- Fix sdhc_2 vqmmc-supply: use vreg_l2a (1.8V-2.96V) for UHS-I SD card
  voltage switching; vreg_s4a is fixed 1.8V and cannot switch
- Update vreg_l2a voltage range to 1.8V-2.96V to match UHS-I requirements
- Add QSPI SPI-NOR flash node to SoM DTSI
- Add EEPROM (atmel,24c256) with nvmem-layout on i2c5 to SoM DTSI
- Link to v3: https://patch.msgid.link/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com

Changes in v3:
- Remove inapplicable Tested-by from dt-bindings patch
- Fix DP HPD: use native pinctrl in mdss_dp0 instead of hpd-gpios in dp0-connector
- Fix model string: capitalize "Lyra"
- Squash EL2 overlay Makefile changes into board DTS patch
- Move USB PHY supply nodes to SoM DTSI (supplies are SoM PMIC-routed)
- Sort &node overrides alphabetically in board DTS (&tlmm before &usb_*)
- Reword dt-bindings commit message: clarify board/SoM relationship and explain absence of SoM-specific compatible
- Link to v2: https://patch.msgid.link/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com

Changes in v2:
  - Drop qcom,talos-lyra-evk-som compatible from the binding; group
    qcom,talos-lyra-evk under the existing talos-evk block instead
  - Remove unused regulators vreg_s3a (smps3), vreg_s5a (smps5) and
    vreg_s6a (smps6) from the SoM device tree
  - Update board compatible string to remove qcom,talos-lyra-evk-som
  - Add "talos:" subsystem prefix to patches 2 and 3 subjects
  - Set initial-mode to HPM for all LDOs (ldo3, ldo11, ldo13, ldo15, ldo16)
  - Add EL2 overlay for talos-lyra-evk as a separate patch (patch 4)

Changes in v1:
  - dt-bindings for the Talos Lyra EVK board.
  - Talos Lyra SoM DTSI with PMIC, regulators, storage (UFS/SD),
    QUPv3 instances, ADSP/CDSP remoteprocs, and GPU definitions.
  - Talos Lyra EVK board DTS enabling DisplayPort, GPIO expanders,
    SPI-attached TPM (ST33), and USB on the carrier board.

Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
Avaneesh Kumar Dwivedi (3):
      dt-bindings: arm: qcom: Add Talos Lyra EVK board
      arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform
      arm64: dts: qcom: talos: Add Talos Lyra EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
 arch/arm64/boot/dts/qcom/Makefile                |   5 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 311 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 111 ++++++++
 4 files changed, 428 insertions(+)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261007-talos-lyra-evk-v2-e2e588a34f6d

Best regards,
--  
Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>

