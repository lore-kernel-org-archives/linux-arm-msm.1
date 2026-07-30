Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A58424886A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387438; cv=none; b=rhKigsWbQbHqMScgJXZ3w2ZC9u8VAWBLl/y6ZCQS2AgOJ1jPLiR4/gAjmV2IvvFLo4TCGpLURmetENa8tAk/v9PXwUyWh/2Z6/oWdanRKGz61afR3jpNInaM5FNcpw2ZUdLZ9ghYAsLfPiJKWBCkcZ3Ha3rWMo668yksibp07UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387438; c=relaxed/simple;
	bh=VZJXh43ij+6wvEZ9BoY5kUezW782iYppxl1ls6FH3Fo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p071K15oUiIVNMWxOD+NxFFtj65ap2RdbDGfSCiKmRvxKq4QdZgb/JpDM/rN47ZZKluh4yQBnZfNY2XArixDnntrGUIB5kGs3tcLl0fQxg6OEqUwhz4MbBYSHIa28rnfRdMN64Uw0RklKx2x4DvROvyx5w5F1GwSjvghIHv6r+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDvBnjZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGbPT8eQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDvBnjZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGbPT8eQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U4atAV4130802
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RRv8WoojXtJXS2tAE77IAi
	WJVFbG8DsJeoMpD+E8Wbc=; b=FDvBnjZJw+jhQEs+aY+dvx6sLKhEXjn02yRgmx
	lLwq4MZW5Njt5TPKEDi8d1K/gEl5A7PHQOXsm1a63ea0yFITq+44lvVn/PylHsx+
	Ljz+Ioj+w5biMAOehI7dc/8Yp0ObSiS7fL1UXFjqbumjzwyGM0GFAd191b+YuHCn
	qWWSZ+nPGcw4mOpB4VRnH+pjTLrwXI97+S3vf9/adfMNJ8BHi3VxVm7dXpiwWx/a
	0fYGFJJ8m/5srMEUwAWWXYHkbTn89oy4ms3gkQIRUOlfresmyG+3ukFHaB9tMLGs
	i3CG3oHsuOwAkq1e8htWyz7/f0tgs1WIDAgY0kHuRqIcE2wA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqyr1029h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:57:16 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4488f192768so1849175fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785387435; x=1785992235; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RRv8WoojXtJXS2tAE77IAiWJVFbG8DsJeoMpD+E8Wbc=;
        b=FGbPT8eQA1qq1G5AYZHld6Q9A2VjW8VaSLEWuv7htSnmgJxknTiZnqDeJLi4n0ua1H
         MvJRe0YlWQZrj9cYAJbjjrTD1DCI7Pf5vUHHsPv9bXo6Up3ik3XpD4kW6j9KFAk4aqcB
         J/7yvnlUKz7XynzZZhp1dCCeeWO84Yq1juS5uU5ucGBatSvl21rO6AaGLpE8N7OTGi5s
         Pf9y2RLYccCmAQ4BKpVhYNYtYHwSjI/3LYmotjkfw4gXBPDYWtSLrheC6nX6qXpp5L9a
         yoji6FX4Y2k5IN1G/OQM23a3NclyG2Snp1usYUIc6KZyXjZvZyz5AtKGoZXq9+NxdG6/
         ckLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387435; x=1785992235;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RRv8WoojXtJXS2tAE77IAiWJVFbG8DsJeoMpD+E8Wbc=;
        b=mTLm65aMZw9kQtZgNY+pYVV+/uPVUKZbowkE61LfAHofHCOXTYQhg9ha69jIapHWay
         MaZQwGZrG3GDiG1O96E3NEvRftERRCDWpbNesD5ZOUrESZLuVsYbGO1CAip+L2vEL4RB
         qg0gdwzrlzSVGVtq6IajzKWdTtyQgn4sD21ECbSVYAcBcAWxuNsyZrIZ2aoZL0o42xGf
         BzBML7fJIXsfKxjkz8VNO08u/Haf3nd10uin1lnMLzjiR1602O90N9vRcwPPgv28VYpA
         Qte1rR/eDI0k0He6xz+z24LWnl2FsEuO95YM0r/q6NEsSvNmNbacufElatj/skn+g9QN
         IJog==
X-Gm-Message-State: AOJu0Yyaj2kpDKkKmPQuLNX8iffcFOfdR/ruWdVxavwpR2ksmMHP3WJt
	ylLVkT6DWliaegNIme8rQI8kHBo+4Y+DjEvH9KP+Ge6WtauKtW8cWqYhrV5SfHvPgEQ5d3GwIXF
	RxC9RXe1j1BKh4e9uGLNp7vEeiNZ99o1tt5WaUnqwagNIBZ9bQYmS99b6EyDB/PpKleBt
X-Gm-Gg: AR+sD11n+2/8LY3+bJhHLL1GvXRcFzpwslbOnun+J6RZiod3Ab6AAjEasPWTkaoiU4Q
	Xv+knf6c+mHk8eBpBzs/KhSznpTnS7yOHYtWccXYFvAI0kZ39/Ixz1WkaK0NMlPyOZuo2QS2VE6
	54/LOLybdmRkxFQQj2k4ZshLGpFHAdCS2tNZvFWUnq4cKcKrqfxPar27vSy8xRp88rgY5CsH/p6
	BxKCx07KTxP6nA3Bm2whHPsWYpE/iOwQduI9VuWbkKU05Cn7Li26u/Lbqmj5xuBD8eBFJqtyndi
	JJXAZur94jN4GrGZeE4gS8lH0WIvHXWNPD5UlU2InyYx4Nti2DuL4pV4FAspGR8aLQnWvBwtxMj
	JNVjBWRuwJXi55FHBoEZ9KA3P2nbNN2EPzSk=
X-Received: by 2002:a17:902:d2c6:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d035bee57dmr11587635ad.2.1785386949323;
        Wed, 29 Jul 2026 21:49:09 -0700 (PDT)
X-Received: by 2002:a17:902:d2c6:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d035bee57dmr11587335ad.2.1785386948856;
        Wed, 29 Jul 2026 21:49:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm17740241eec.14.2026.07.29.21.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:49:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v6 0/3] arm64: dts: qcom: eliza-evk: Enable PCIe0 and PCIe1
 with M.2 and TC9563 switch
Date: Thu, 30 Jul 2026 10:18:52 +0530
Message-Id: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXXamoC/3WS3W7bMAyFX8Xw9VRQ/1YwDHuPYRgkkWq81U1iO
 cbWIu9e2h4GF11uBFDg+Q51qNe20thTbQ/NazvS3Nf+9MyF+9S0+RifH0n0yHWrQDlwKgh66l/
 iD5p/CVc0uM4l6WRpuf88Uul/r6xv37e6XtNPytMC+Nsx0uXKJtPW1p7jlI9scWgCScCSSDsIR
 maMGTRAjEU6LU3w1garStic/qkK5UwgPWgrUywAOVFXXNKgUCIVgyGkVPJ7VfAZXU4m2IIoAwu
 QPHsbS0UrMtHpjnJYVQPVGtcYDs3nLQUNAqcqLvk0bHGIYTqLJZKIKM5Dn6uYpZCiGMZB8bnr0
 tdTrQ+Xa3xi1fDAx5eFnmIlsdz006HBbAOZQjFg1y4JHvs6ncY/63JmuQa2TsDP3e2BrUB4p4w
 xkNA7/GC1wma1B3R7gGIAewdlXKYU5R2A3gGU3AM0A4JKEkB3Rep7E5g94N0EhgHIu/SFLE9Bd
 wB2D9j/xdkywEgfINqoDP4PcLvd3gB4kVcf7wIAAA==
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785386943; l=3461;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=VZJXh43ij+6wvEZ9BoY5kUezW782iYppxl1ls6FH3Fo=;
 b=0lKAQgskhw1e8uBRucCRgynMWN1r3x/DurUgL8ZVXIPg7Cfv6WmKrOPaSkrQPiTyqoPHrIkvn
 BbWKKVESGH9CWHqwJ+ZL7nC6gWQXbHozOzjrNILGySwC0kUF/ujtJSs
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Hb0kiCE8 c=1 sm=1 tr=0 ts=6a6ad9ac cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=0uohWpJSiqPYzphn-GwA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: hWwyd0KUiPW3rWSdbrvKpKy_LYnxeLfs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAzMCBTYWx0ZWRfX836Ru/+rHnhe
 /Kpyjx1sritAKWQIZMtmDJf9l7zTEOUuV8+V6VeT4FBSSPivTB4qizqytNzse5l0Ts2pU4tCj0L
 HKDcgw7degoBLf10FPaNJi8lgawEMgLDLrRjHVzqpIQDhCyIXQKnmdFPkAy7sblpXA6mPsw6Dm9
 GLbaSzhC/RFbQRXJ0ufr52QVLDQNpzTl9epvLcflEIIZbSZJnVCj+8tzCnIcm9RL6xjbGLO8FXE
 5DD3Th1a5MsWwk/QkFZCJX3TDyO/imkMWyyaR2AyWpFiPxmidAGRcRbtItQ2ulWYkt3PA9/ukdZ
 tXqlScAD9VStkj6c33nDMUYrmIuvv7LWZe+Uyih1YszYkQg/lmu8EOU36IggMEKgCE092pyON+h
 r/7JRIUGbV3u5SU66ZkEH/7rXE8E9FHE9XyC4MCbxGQvL7bvXVRslVy5nxwkjk2NNSqxXFQk6OG
 nva/bwbnq7LHWgI7Ldw==
X-Proofpoint-GUID: hWwyd0KUiPW3rWSdbrvKpKy_LYnxeLfs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAzMCBTYWx0ZWRfXw8+403mWD9Jc
 uuXCpr8x09Ge6VRHMl0+c2vNq8S2BkTj++kG4QBas2NDVjMfitk9RERgphw5AM0eXJzRR81U0WI
 XUeY18T7pOJHtSQxAhi7MSMNqSwxQwo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300030

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
Changes in v6:
- change 0 to 0x0 & remove num-lanes property (Mani)
- Link to v5: https://patch.msgid.link/20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com

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
 arch/arm64/boot/dts/qcom/eliza.dtsi     | 413 +++++++++++++++++++++++++++++++-
 2 files changed, 640 insertions(+), 2 deletions(-)
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

