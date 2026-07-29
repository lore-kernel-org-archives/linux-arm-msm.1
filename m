Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C6A4D8DAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336539; cv=none; b=n0NXYodk72DHEbynuVKgcAKZIOPNfl+AfYW1dnVRyfahWUFsw746O8tyP1HgY14qlJnFGKwHSVJQ1L0H0N00fqNhbBzzonUO8hoCp/Ik6XnsHk5g8sn9dCGHEpBfTIktOaa3H35pZukB5pgm79HpPGVE/OTgE3PTQn/zcodqNdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336539; c=relaxed/simple;
	bh=LzRk42hLPF44h8Qhf774xSXDeVD2osjbP32jNzvxnz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SCgpfXYqNJVRoFq3b9dCk9xpP6W0Tyew/Zmxsiw6EcNa7NANQZ7M15CiKWkR1J+FwF13SUHulH2T+y1GjX2w/9Fwd/9jKmdKzmmzrp0mdA93bKSh0/72j+Jban1S1UIu1Jk2Msp3nJ/Srf4Yzi0FKKQYzxc982YKA7zYdWkzS78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJ+TbFjm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqJL9zzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJ+TbFjm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqJL9zzA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TEMjQj2298808
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pWHU+t4rJhXrXpGp2LtA0F
	WHC1o6WO+Pu8Djb/P/jUk=; b=OJ+TbFjmV9ovxMNP0Ec3ypevpf5VOOUVQqxUuu
	vVPo7hfn9NdAeaLKSNTM6Lr3AMM7oZekTkTnlPbTTGgGURWVTlOAFIhJ+eHqTbvl
	X1p9+u1jiIzgb27m84uzVi1ZDO5FA2E3sv+okoozazlBt6MnS6vMfOu08/JlIWrp
	Ps1wKU4tfTvwySN09t40zoy9/LMWFXnX+nW9GSZjqfNc1+QHxoD9m2wOQFIgOxq7
	UTwcqF3OfkpR5K8Gn49yRnsF56wDKOgTx2WEcq8N5csyFsOKFD2ZRDoIa/0EDB8j
	IBoBomHsoxsm88eu8pLoSO2qLEg/X1PjrRAZXC26aJ4RwgNg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgr68us0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:48:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so15604305ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785336532; x=1785941332; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pWHU+t4rJhXrXpGp2LtA0FWHC1o6WO+Pu8Djb/P/jUk=;
        b=iqJL9zzAc2QI4g+4dllYP7o10Ex7R6WO1rpUa6YhnjXyRxf09dgpmxl4PCK8HoA/hd
         3CYK7j60OTCA4+YPVJ+wMBnPTM7/D7FPO/U+Ll5yoXeED4/cqUTv8QwajSxTjNvl4fRo
         95M8ND2Y+yjZ5HpVz27e6WWzvZAV5GLSHIveJD54IEvehMWTn3fkUiNN0D2wsII4iejy
         IaV4C0DTUf200kSD5unkTPDtXTcv6hjs9QJir8XMSJnXEa4fRIWbclnQQlwwAlLTf0jl
         vya/KCCrXWNhf2DBMixsTrBmMiZa5Dkm4A69/+6V75GpSaeyAoCizSoeKst7jka16N8e
         WLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785336532; x=1785941332;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pWHU+t4rJhXrXpGp2LtA0FWHC1o6WO+Pu8Djb/P/jUk=;
        b=AsDdX/VGKKwx6MbRep7enETj8ncxmc+R+AD3oZNCuty4bl2dVU/nAHICss7sdFwnjf
         D/gwvxW4dZ0bGMGhIX/QIRAfk5iaKkRZgXwJsROu/XwChgfauKcCTOR9PYJRrMQk2JYt
         S1u+D/ufLr/atsFvYgPLldzMnx3FuEzt6cE1rQqY9HbeU7bsIzUjiUtFLlDHzOK9b9eb
         D5xg+oQUAY+Q4vvA0bLyv0e1gm07pbRmJeFqUuLYYcUevJsA7xh77LDn2ia7oQsHwNuE
         sXbrQJEL8uXxJ4N1stBZikDCBCl586M/TPyc8e+98nVDfFAjJqjUyMfzcY+88Y0FAE+X
         pRUw==
X-Gm-Message-State: AOJu0YyVGm5EzkVo9fFXqc3qDjggmaIxS/NS7MXT+gRZQccb/AeaYAsr
	awghumxwudFktqT1NRxQJFVR81h/2CTzUNGSUzUoQLMCJxqpmd/AxM60EpXJJhgsXfCJ4bfVcr1
	GumBY6B1l7d/D0MJjWelmaxbEio5jfSsAhOOgFzaj9p/Tf91mcx58JBt6JvhjAlT5Wvm9
X-Gm-Gg: AR+sD10o+roFyePFwT2gTi6CppBOc/OlUoo4oVMvunRgXvWMbi6jPLyQrI/PBC9ZijC
	2rOxuF390Jx7JJd2LpKo7B4//Ec/nMYUuVgmFv3QH7zU2mNYoGDTxK/K/5+6j9Cw26v4+J/dD1g
	RpKY+MS6YBs6iIR2v6dGjG1OoPO/fYsA7R1y6eAkwqFoHNRku7bKPnqp1VgDp2BLWK8FcEtkeJ2
	o468Pt2/iVjrTIPudZ83aSc6e6K29SKH1ETxjPc0bPuKaPhYOwH23g3PMvQEwVgvdfemdoVdGS1
	OHjONTy7xvrVeV19gImL+QNM7MtZrpix2EF0Fi1vXPeOK9cWTGUDE27pm3qSJCkZBUY6p9RjbNj
	2sQmub4KkQZKOya9ICBJNxSd7a19jKnoiauA=
X-Received: by 2002:a17:903:2446:b0:2ca:de3:15d7 with SMTP id d9443c01a7336-2d026742789mr26659125ad.16.1785336532199;
        Wed, 29 Jul 2026 07:48:52 -0700 (PDT)
X-Received: by 2002:a17:903:2446:b0:2ca:de3:15d7 with SMTP id d9443c01a7336-2d026742789mr26658695ad.16.1785336531690;
        Wed, 29 Jul 2026 07:48:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm19515456eec.22.2026.07.29.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:48:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v5 0/3] arm64: dts: qcom: eliza-evk: Enable PCIe0 and PCIe1
 with M.2 and TC9563 switch
Date: Wed, 29 Jul 2026 20:18:35 +0530
Message-Id: <20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQSamoC/3WR22rcQBBEf0XoOWN6rtIsIfg/TDBz6c5OYnl3N
 VoR2+y/uyWFIJP4RdCi61RN9VtbcSxY20Pz1o44l1pOzzzYL02bjuH5B4qSeW4VKAdOeYFP5TU
 84vxLONLgehelk9Ty/nlEKr9X1sP3ba7X+BPTtAD+bIx4ubLJtK215zClI1scGo8SMkXUDryRK
 YcEGiAEkk5L4ztrvVXkN6e/KsKUEGQH2soYCCBF7MlFDSrLjGSy9zFS+qjyXcouReMt5Sw9CzJ
 27G0sklZogtM9Jr+qBqw1rDUcmq9bCxpEnqq4pNOw1SGG6SyWSkLO4jyUVMUshRRkGAfUpb6P9
 6da7y7X8MSq4Y4/3xZ6DBXF8qdMhyYn69EQBp/7dmnwWOp0Gl/W48xyLWxNwM/d3YGtQHROGWM
 g5s7lf6xW2Kz2gH4PUAxgb6+MSxiD/ASgdwAl9wDNAK+iBNA9Sf1ZArMHfEhgGJD5lh2h5RT4H
 8DtdnsHW3gW6q4CAAA=
X-Change-ID: 20260629-eliza_evk-6f30686b161f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785336526; l=3295;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LzRk42hLPF44h8Qhf774xSXDeVD2osjbP32jNzvxnz0=;
 b=PP5SvVYwhPc7HriIlnoF3NxT21s7ujlCY7niC82a8Qsbv9lybLvdRBF8ts34y2Zum9P7JiNhG
 UcCRq+GzRobB6BdMWeJHqYXrjvMbYTX2bQ+nF8ksZPxCDCKzWI0OqN3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfX9oscQ6AjekMF
 rhn0nYXRSfBxDFyLztGpZi6f62tBeTZL31KfLUMPEdFS6qbmNoasxXvSb31g4Yjwr/69LQDrNyT
 zALcBAQrx7SwlMxUa9+ib02RH+zrCcZsBhBj+ikT2ajUDAjoWF1Rr5ugdnRb4b6xcP9eiBU9GP0
 tMUSCgR6nL6G2279EO1aYwj7jy3XYcQP0g2Yk5tLawRzwnOkDA928cj6iXlY+wId0afpOevQnuB
 ukuVFuf8B2RL4V65C1bvhkoX8JDA90oMfDYhu3lyeVuPxSUa8UucHV0RHlcXw8cVlVobI4f9U+r
 dYhmZYrQpt+JRPu7JIRouwX2ed9BvWHOlw6xWjZsOv1JPmffz4CinlGpttWKUBRz9GtAOulxvxO
 4Y+nkBetMdwapi1aTC8LyDaWi6CIraXnMffLtguQdGKGfw3JEgClJS35M3Wd/I/PBUCRE9hgZDg
 C9Bz/zUqjRsIxo/vuMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyMCBTYWx0ZWRfXwvhm/Sd27l52
 V7+luldGz3V61joH9wqGfxvX8rqmZDdvxfd4rd9iw4jxiSZVi/aSMcnbY5zEIk+LfaF3xIPbsmx
 i1S17TymExJr2dApTn1NyfGPzkbOMfs=
X-Authority-Analysis: v=2.4 cv=Cv2PtH4D c=1 sm=1 tr=0 ts=6a6a12d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=h7GK-HNMy1QVH8K1SrQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 37F91aOZPIb6Elo0BoZiGUOzN5GGWsZq
X-Proofpoint-GUID: 37F91aOZPIb6Elo0BoZiGUOzN5GGWsZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290120

This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).

The Eliza EVK exposes two PCIe ports:

- PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
  via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
  (connected over PCIe) and a Bluetooth device (connected over UART5),
  modelled with the pcie-m2-e-connector binding.

- PCIe1 (8GT/s x2) connects to a Toshiba TC9563 PCIe switch, whose
  management interface sits on I2C4 (address 0x77). The TC9563 RESX# and
  PERST# lines are OR-ed internally; reset is driven via a TLMM GPIO on
  the RESX# pin. The iommu-map covers all downstream switch ports
  (SID range 0x1400-0x1408).

The M.2 WLAN module carries a Qualcomm QCC2072 Bluetooth chip. A device-ID
entry is added to the M.2 power sequencer so the serdev node for the BT
UART interface is created on PCI enumeration.

This seris Depends-on:
  https://lore.kernel.org/all/20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com/
  https://lore.kernel.org/all/20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v5:
- change from pci to pcie for subnode names (konrad)
- Link to v4: https://patch.msgid.link/20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com

Changes in v4:
- Added new line and used pcie port names as pcieN_portM (Konrad).
- Link to v3: https://patch.msgid.link/20260721-eliza_evk-v3-0-92b10038f13d@oss.qualcomm.com

Changes in v3:
- Clubbed pcie nodes to this series (Bjorn A)
  (https://lore.kernel.org/all/20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com/)
- Added comment for PERST (Mani).
- Extended ranges property for pcie1 (Konrad).
- Link to v2: https://patch.msgid.link/20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com

Changes in v2:
- Drop patch 3, as this is already applied
- Rebase on top of https://lore.kernel.org/all/20260708055017.A90C91F000E9@smtp.kernel.org/
  and remove pincntrl as pincntrl is added in the eliza.dtsi patch and also remove
  pinctrl for resx as this is covered in pcie1_default_state as perst gpio.
- Link to v1: https://patch.msgid.link/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      arm64: dts: qcom: eliza: Add PCIe PHY and controller nodes
      arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
      arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch

 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 229 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     | 415 +++++++++++++++++++++++++++++++-
 2 files changed, 642 insertions(+), 2 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-eliza_evk-6f30686b161f
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

