Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100726;
	b=G08q1jDiqjOi3lKXOtAkO+OjpriVZ5+eLorAhovCJM0vAx7gtA2lRmL3ES8/xhpK8Wt5
	 SHm3o56niTB66h7Lme3zhaRrmOUWMdtZ07Z12nzLvrF8YKrkk1CPXkcnOkRLtmMVccW2L
	 VvF5IvaqixJz0ztOcV55Rtn9LgA6qFkvTtgrtReQvksbeidL6smXv4RBqdL9cI+dpQj1U
	 qy+bCVWHJK6xtu24EyoHSbd8LvROPXKE5wtOEvkUspGURexNg5+cCGr0c6Iba5VMZwop4
	 r/FN+O+Y3tIsdKHNMsSUcACkkfHjIZOSrP46ZLE7VSRbjdGkBrlXoFLm5pBImCFjLhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PwAgCMcgHnZ/bogI6CXw2isLPSLCqdg40Q4o+na34B8=;
	b=Qm7lBmqhSL1WHqRlGCd1xsWWon8wytSojOBHln5/u8GxdFPtUswun+gFD60eE7nZgR/c
	 t+edvWVYiJyVXv6kM5QaIKvCv4fV6Mhai/4UQ9eaQLlNCVeSkU9ZSwRqvarXpxRU1+y4S
	 BkB84IYlyc9f/rCVSkXd5oZvo1OyPS+/2O7+oNb7CrxI+wk5kgtdIvyaUOjhqeUqQYbfu
	 vgshLRvFcHIcA/465jQOQs/WLW5xthTT2FtJyBQQydCmiBqMJ077jVTjMTptd4l5VzAgH
	 ylXH5+C7ggB1g+gMeEfS+fnG+heDv+tmBusO+7xJD8nNUoRR4vWtqhXLHp/PweQqeVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoTMbJfX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PF78dhdo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBF4606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBF4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoTMbJfX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PF78dhdo
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxqP2458146
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PwAgCMcgHnZ/bogI6CXw2i
	sLPSLCqdg40Q4o+na34B8=; b=LoTMbJfXZjrpd7mVhKr3QW/qTk66GJX1CG9xSM
	Bony8VnhGl8rru8bIZXYw2juN8AyH76Eut6aQLxVRsJ/nps0FMdCgLyooY0MexGA
	J+fNBObaQBUpsfPakET/WbnbxCDA/FaGxkDQds+A0ANVNPKWzSO5mzxkxbUv+rsk
	kv+LX48JEco75Pw5aqmVbbvoKrFmP8QtrZh2vQeZnvTukZXdnPJ94e4vR/N2s/bA
	BpDvfrnbh+vOShqMLaGYNlFZLVrfYSFI82yAjw5grHBXkL0Z6cnxj8MW7tC/WgNB
	2SBBm/AvTj34bVrEfkLAoIDLdCMUqtbXU9Q0tiPo480ekPEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta1nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ccacc75a997so1697684a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100722; x=1793705522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PwAgCMcgHnZ/bogI6CXw2isLPSLCqdg40Q4o+na34B8=;
        b=PF78dhdoHGmlaICc5CHVRdQyGAG9jJBT29ET1KcG5xyJh828M8qyjp/5Q8PKLTBSfL
         TI7a1YgCoh/tNedkyy2yP2zqKe77ExlgBlcbqFXpFwVNmHEf+wS2Bvlj0vDFnFF9JwuN
         w/1DZWVByuCqtXMA8Y2wXXig4RnGZ4lBAdBfswkX9wq+zqVvX44ja5/EJpQR5bRVpDu8
         mfULcUYx3svTTVTgcpPSpfsR7NcEmDY/00Zp2f7lbOIA4/px7AWer1IGc7wOBBsFwm3e
         XU39hsD/GSXpkBMN97XlR23PtWAJRLL+YyP/BNNRKx1TOCtyIvOhXOVySia4AxeIJUpr
         wPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100722; x=1793705522;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PwAgCMcgHnZ/bogI6CXw2isLPSLCqdg40Q4o+na34B8=;
        b=cGtarhKV1tnQuUsz+EoAe7sPZNAqXITshB4XdbS08etBq2JjgzfZaxJDRvnaZgkm68
         PCoherLtE+6GXj6uyTvEE37oE7W2rI8HMhKFWwBpYpU9jjHBzCDyIH8I3N1BAPDtaDAG
         hYJLhU1uMb0scd1qvdJBdyjgXa20ZYpfdZwZNtXm8nrDfEQkCJydX9XQGfRn4wmTrBcV
         b6oomn6Idcr/o/bfgZIVjBBSQd6gkTvSRO0k1N409iCGcZMT/xhe1VZ+XvwI6wZP0mQL
         6a+L2GUyJA4bEJE1LIMT0006Cyc2JzascBZDMcum4OZ0Qu9r297vDVQ9lx4uHY09x6Ho
         daHg==
X-Gm-Message-State: AFq9FYIDOjmxZG4f9JmBpxMO7k83lHmx8O+hiFsHFMMqPiH3wDqgNMLV
	fFjIAAg83IQZqvWHakPAZDpJNcpUgNB+ehgbai7CUN5NZ2yYo3PVmfzUwp4CAP0w+2XwheAHSV1
	80AAcOsqdNmFfLKzcc8NFPPs3ihZNtAF8II0r2u7QMJZgNCduChWceuUMxfTx7rqQocgF
X-Gm-Gg: AYBFou3nqvlRAkTgiCphJVy+FtPdiH6MaHi9uJe/Na5qH/cXdQMo4kPE5DdKNTbnXD5
	22HxpL6s8EH1fvyibacU9O18ynu3GY5rSA+TWVqOpyixYtVmMKEouTAtqwAM9HorEx5CPnxz8gJ
	3cyGj+4YQ4yBkUCDcZgYJdIo6izY7VBPXBJ4NnYfNk8BCibBvlo3cdu+i85Fx9KDGQA3RYaVN3i
	dELZ28rX62VnwGMCTUPwffYAyadu9XeDhj5KbLhdk3WIfq3yb/WHjqZh09z6zYF/4KbX+MftGWq
	udS8PL3yYBhttiOOqr5HAU1UnwOa3Cdn0uXJ48SYynqMiZVUTXu1mVVTzd6uIQRCqWazJ1XfuVv
	D/A9aYLDpP+1mmWultqx1
X-Received: by 2002:a05:6a20:3ca3:b0:3e2:c75:2349 with SMTP id adf61e73a8af0-3e7af7e9a5bmr7938458637.8.1793100722413;
        Tue, 27 Oct 2026 04:32:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca3:b0:3e2:c75:2349 with SMTP id adf61e73a8af0-3e7af7e9a5bmr7938416637.8.1793100721910;
        Tue, 27 Oct 2026 04:32:01 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm2143836b3a.51.2026.10.27.04.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:01 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for Talos Lyra EVK board
Date: Tue, 27 Oct 2026 17:01:54 +0530
Message-Id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKqL4GoC/22O0Q6CMAxFf4Xs2RIYguCT/2F42EaRKTBdgUAI/
 +6GPJo0Te5te25XRmg1ErsGK7M4adKmdyI5BUw1on8g6MppxiOexVF0gUG0hqBdrACcXjBxQI5
 pnovkXGcVc3dvi7Wed+a9/Gka5RPV4EF+QwpCkFb0qvFWj/MAR0Dh542mwdhlf2rinnPkx/xPv
 qsIKqWKJM5QyrS4GaLwM4pWma4LXWPltm1fS//yBusAAAA=
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
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX+lVcLB05gFA+
 Iltkboxde7aIJM5W6fUfawJX25r17g16+qzQbh+imGTpvbyBjnr1l6aNbtn+9UGCsUur/KA2IUu
 7x6mMchxut1Cc2hKJLP1Z6Vi0FyAKqs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzkZF2odWlTV9
 2V6AHm0FDEMGcBzYP1B+Ybf8Ti0aAw7rwctdbTmx8KoureQbO1KptqBApyVhjmICPc3y04/trwj
 elh2FkTCHhKTY0M71Yc04MtqiOc8ymLOCqkEDofGwDr/+tPms2pT/GGOMK4tpU5phnJ54vdtT35
 MAs5Lm/1Z0JxNUBtk4uNA07sDcicxuNLZGpNLwnQDT8f1j5fuFLctODLNnw5J/IbNXON5xv2oK5
 h1FOOGPu5lNZd3wAp9YnnVGRw2/qBqa9Uv12DAXRr2GSSh3ETQkkuBX+i1C3Lgcn2H5gsEZ2bHy
 qi0ekGyHUTzhtJfl+j6RXEtOjv7zVmeL+OFptShim5/0GGkIeiaOAmu6uTiOgAv+Xyf+2ASzcjU
 QJri6ehrxMicoDzMvXZ5lwqZ6MPOVuZGafNAeRPGrkeVv4HLgMFY/QiwynBIUFpRQGRVufY3ca7
 4fviK+GmCq0fCWkHZuw==
X-Proofpoint-ORIG-GUID: LGFOkd1clkwdJVcewsFxkWBqYMoAKK8w
X-Proofpoint-GUID: LGFOkd1clkwdJVcewsFxkWBqYMoAKK8w
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08bb3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=XRYUP8yNB-fVxFRa9e4A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

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
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 281 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 115 ++++++++++
 4 files changed, 402 insertions(+)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261007-talos-lyra-evk-v2-e2e588a34f6d

Best regards,
--  
Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>

