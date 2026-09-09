Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38C4A3D54
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954518; cv=none; b=S18+6Ja9wXP5GcpEtYyk8uci9j5A8hgAI0IS9SXjm/gpVYe3kFMV2q0Gy0+H0+O/5DDmmtO4UFiAWLZHOVOttTuxaukPzvqTZz23ReU9sBi5lLIFeAo0r3U2cn7Rtd5UNxfIojaOJOewtS9QLfABjW0Yt8sbC9iCxCItJnWLZjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954518; c=relaxed/simple;
	bh=QOH9VKcTjY4fR2PU9QKFwEi3IrUNdtI6tTSaKUmMsSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LsioAwIrqKXJLIBOxOaHJ+GVxjblBGWHHPNI0w25naHzRP1HgFj0Dht8Bbm1H71V8vZaalBvWmQVluNEsfCqNI7QLGHFP4w34WMGZGtnBr27g5x34nynUiMUdmzOt3zNvOTdUoBtJO6WiEQWqeOPgsZdXqTa/DthdObvr7kMhpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c28PXU+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zp2mu7zt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c28PXU+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zp2mu7zt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU9qs2959505
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mquv4bvtnPno64YDX0x59O
	34H98rzwKzFq0G//K2ahY=; b=c28PXU+9BHslQ80MzI50lJD6r16ZlkoABtsPeC
	7btrNYS4ihawUS2vMZpNXjg3CYrrICdbyFt5n2dAt2LIoE/3gy+cdFcCPcGrkbEF
	RNV6qMILYQI2Bk9OUD90SS2uXDMzOBo/5oUxikt+0jLv3Kgji+O+u7bxxvTjk6ZI
	vjis3Uotyvfk3lsUtpe4hdFwVhdEsPFpsjB4iR8fgXTAunPNMTCRLOwsx+WHm5Sn
	qxVSLp9C/h6KA/HzhzsBrANuzAHPner+eEfEy40cZSuc7QvbBplLnjI7xIgZt3A3
	utMAYcmXJxKrsuSOSBr4Ej+zFDn7aZTRQPFyK+g/zuU4H/lA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw3wqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:48:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so7309516a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954514; x=1789559314; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mquv4bvtnPno64YDX0x59O34H98rzwKzFq0G//K2ahY=;
        b=Zp2mu7ztCeBQp9X2oP5KsU8kn0n5DXpjtkqcbuXNBzmh6ePrrZ/Lb/JG7xtPHPXjlE
         rrbSauVhr/Huav0vhZ2jSL+SbDMWtr6eoCkM2WLHz+M7T2ms9JBLwzMewnjB1yHkUQEv
         OSJvycC+CKyJYi7ScutujS0aIPac/ukuLl2WeOQdxnfwQv7O5pkMM2Hzbec6t5VfalU+
         q8iGRHmldsWYQA6UVNNAPp9x0JBGj/DKbl0Dl/BaN/XYEXYWgOpgV/on39YryWN191wv
         NQlRd2TIZ2afOHn0WOBteS3BGy7j17rkxjQzCBSNUoxVbP/8SZ2VNddxQHJHV+j0pXNe
         Pzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954514; x=1789559314;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mquv4bvtnPno64YDX0x59O34H98rzwKzFq0G//K2ahY=;
        b=nqWLg1rZwBDaZyRL6FbGy2jAKCjWKKzhuWpj9Vg6y5oFvlE+3CQYkq5PaKlshjmJy8
         afSqnNmt3Zx37Y1JtZM2+D7fBVgddkzqOEQV/Xk5J5CkukJ4V3dNo09H6VOgZfgdLyHn
         LkeyeIz/JrS7Hz+RuLtZNx4YpWZbT8y+wtaAhV0DocVYHjlqMwfUoOzjP0b982lOAsvX
         rSthZh7ur+3w17Mq+jDOT93NnQnc/L92Dhf3abdRXPgjHd1v3B/SXy/bRPBPjngpQpAL
         ShJpX3HhULXRjYS0pH1Nksq+ISs8awu6vaSmItb1XaqM+UX/6SEqLIOjDlP9qmJGEt8Y
         oMxw==
X-Forwarded-Encrypted: i=1; AKwUvBxdJgIIGaM4Na+CQ6bnyx5yfRizezPV/8SFODeGggp/pFisfr7MU/3uz+9+82g4MKZ94B0b3N11rwlriT5A@vger.kernel.org
X-Gm-Message-State: AFuF++nBbLeeVMF5vJKDssbY2RYxVrgdCzaot7/En3RV4QDcdz7rb7Ld
	t+b9lPVtc9B/Ob/so89CTSWk7yE10KGlV7VQHHyhM2pO9E/wRRJ3WdtVfEi/w9Qt3/ajyuAv/Sb
	T1Kb6HRv5T2Q0GUZqI8Za1DPgp9gl/BhIgEPzDieEHsVX+Dx9Kw5YhNotcqRX71X4OXoa
X-Gm-Gg: AYBFou35EaMAmLyY4pZLDdd6AzGW8AGIh9EJ4ZE6y+auVPknxO3MWYzxmzEeMjUKRgt
	ktus7smDlBzbsi+1gI2eZYcOm3eZ+PS4x0xo73ddfjeUS6rMlcyhHByWNmOKrbVPZlPdsZik9EY
	8J638dhaaDXivBM5zZ2bzagPyntIFyN5SOzMQ/4fup18Pa7nZHCvBaMoEPZ8bWodwaZDT8s55FR
	DoX9lFkaGf12wC+WHFfROSPTixjJm9NJTUqaFG7mKu7wtV8n06sUu6WzpcBRfcJ+CCCwCoxDmv+
	IYwbRF380UGs7T5dKjO+FBt6oCeNjgGr996TABrXLrNrICKQGapfO7t4I5E9nupLWw91N4wRofm
	pYiqOGW8Rc8BNqUDoy9CgmnoKqgZ9evbIM8Y=
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr51142942a91.25.1788954514281;
        Wed, 09 Sep 2026 04:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr51142876a91.25.1788954513683;
        Wed, 09 Sep 2026 04:48:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add PCIe support for Qualcomm Nord platform
Date: Wed, 09 Sep 2026 17:18:15 +0530
Message-Id: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH9HoWoC/22OSw6CMBRFt0I6tqQt0I8j92EcUNpKjVJtgWgIe
 7cFBiQ6eclN7jn3TSBob3UAx2wCXo82WNfFUBwy0LR1d9XQqpgBQYQijhHsnFewpJgjYbCqag1
 i9em1se9Fc76sOQzypps+sanR2tA7/1l2Rpx6m5KUq3LEEEFBhSwYk4gVxcmFkL+G+t64xyOPJ
 2k2ptoxrEHEEMkZrepfJn0zkv0e31gSWcylqYTCQlHzh53n+QsrnqtZIQEAAA==
X-Change-ID: 20260810-nord-461809f1d5ae
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=4014;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QOH9VKcTjY4fR2PU9QKFwEi3IrUNdtI6tTSaKUmMsSE=;
 b=auKGTwrVv5IN7itNtVlGJ1e8h5srMRxNRaR4A0lEnaQrxsFjIB3M/XkPmP3CFE1mOItWGseV9
 LouQTPgNx61AkZAiSmXHVZ/ulkKoCvm/xdTjk0yknOiZrgOO3xhEO+K
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: XEwJ2Md_o_5QHoZnEj_Sh700wlnD0JUu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX2MyTohZf0NCE
 0fSFOM4keOqel622o147OCwXur2oMNUVG602Bsx9xyZI3k0NTe/1UnCQUYo3Vd1JpfnTvVuOza4
 /irWF4LD1UJXSYVgCfEeM7c+ZRgI/Dg=
X-Proofpoint-GUID: XEwJ2Md_o_5QHoZnEj_Sh700wlnD0JUu
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa14793 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=1XWaLZrsAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=_HC7VgZuvUK4spJUPywA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX9+oKyOX97krq
 BROrEAC8O1N8KtsnExIYOJuq6CQ7fuR3yBqm5YuJgZtEIz15jHifmgXMuexjBzTYE7F9m03kk1j
 jh4qqieZQZlgznVrEiOcCDJ3/nXqJoFyGOp6UKNNOE42iG8mprBjiTmz8dfnKHbViVkQpveg/Kr
 ll6MEwuJvqej5wUBLwvPNT2S8Sj+24h88FQX1GteggRTmvl8X31ad7FvRAlbVwqPLdC7dk3L5Hv
 RzRtPCL+zAhu0o27L2FeyUXYz5dr5JioQZf8cjSyiCNqWgTSSlcDCU3snstQdP0WHs99oFwciaE
 SX+oXXRw47qiRfHdd2niNZUloytMCHzonqYCkLaHXswlZ0Jc6MriTjzJRrs3Vp2Vj4bm6iKUSsO
 xj5CWVJr9DODDLXFEGjHNVyWLk4165u4KWN3AS9wm+gjaL3JzMlFTCtCX2eF0YDJDKOZMneJtvF
 tHmL8DBw4YnMVFxJKGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.

Nord has a single Gen5-capable QMP PCIe PHY block split into four
independently-clocked and independently-resettable ports (A/B/C/D).
Firmware selects the active lane topology at boot via a TCSR
configuration register, and the same PHY block can appear as a single
x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
is similar in spirit to the Glymur multi-PHY support already posted,
except Nord's PHY registers are programmed by Linux rather than by
firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
tables along with the power-up/power-down/soft-reset sequencing needed
to bring each port up.

The series also documents and wires up the qcom,nord-pcie compatible
(reusing the existing SA8775P PCIe controller binding), and adds a
CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
convergence issue in the PCIe power domain.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: shengchao.guo@oss.qualcomm.com

---
Changes in v3:
- change the name to quadfurcated phy (Konrad).
- remove min items and change clocks order (Krzysztof).
- Factor out the common config and create overlays & try to use common
  symbols for glymur and nord (Konrad).
- create  qphy_setbit and qphy_clrbit (Qiang Yu).
- and in qmp_pcie_exit() apply settings only when nocsr is present (Qiang Yu).
- Link to v2: https://patch.msgid.link/20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com

Changes in v2:
- Fix dtbinding errors (Krzysztof)
- Link to v1: https://patch.msgid.link/20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com

---
Krishna Chaitanya Chundru (5):
      dt-bindings: phy: qcom: add Nord QMP PCIe PHY binding
      dt-bindings: pci: qcom: add Nord PCIe controller compatible
      PCI: qcom: Add CGC disable workaround for Nord PCIe
      phy: qcom: qmp: Move qphy_setbits/clrbits/checkbits to common header
      phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe multi-PHY support

 .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml |   1 +
 .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 272 ++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  16 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-common.h         |  32 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c   |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 938 +++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  32 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_40.h |  56 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_40.h      |  14 +
 .../qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h |  94 +++
 .../phy-qcom-qmp-qserdes-txrxz-pcie-v6_40.h        | 194 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           |  24 -
 15 files changed, 1543 insertions(+), 226 deletions(-)
---
base-commit: 1550287484d29e68055ae4acf52d9324835ef9c1
change-id: 20260810-nord-461809f1d5ae

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

