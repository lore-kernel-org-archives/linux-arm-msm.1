Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244E13F1ACA
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812628; cv=none; b=Y8BQFyZoFqd2tSqHRHGcnQt7K6SfAKoMTEdads6KaNAPScRv8cQbzkjrsyI6QTs4yOpT6LrMWO+076Rb12yibvs0rXSM1Y+3N6m6Yi3pXWw6Ls4dD4F8yByDutKYidRBprAHVBOKkaKNwg4lWjLPhAlg4jQF31/0kyakroXpIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812628; c=relaxed/simple;
	bh=sCoXPX0Yq3nwo2KsW4jRgJUZwqT/+Xni0RoFlfYySqI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=odchF/E2rP3+IVMU34DiCZDwaLY+BI5mPyI4QdYaLSvanEToF8BCStVYZfBIFpjFRlH/4v7RQE7num9LshHUajAXSB+BoLpsLtdT/aiEXfyoOmaQ1fRJN+ok7TZ0HQDDSYx3gM07Q3hvUb0WC5mAZDrHHNUNaf8HWKTL+SIA5sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKNG4VVL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNos6k+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKNG4VVL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNos6k+P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7rBF1642240
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 20:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e5PAjbyonBBX8bCa9McFT9
	c18q9TrMpdt4SO1ARd2xg=; b=UKNG4VVL9PcmSwbztCVmkPvy8YlAl72UQcaL9F
	8rzc9blmq146RZrd2A/qvnRzMu81FBLzOdh8oTTr76IX58bQa6dG7hgwoman8E6M
	8P5BG7pF/lMgV9FCA29bdfV9gU2i05WVIDrUSA7gjWwdVvmQrRSDnetlg4Nua73U
	v8K71Hk7TcZOkJ3l97bTJnLyjOuAXc8x/iRiPY66bdysQbpJ2M+YAPsq0/zu7PTn
	ld2wJIkP/XTzJ07b12Skvx2M3g7CaQbYlwhdDP5w3BesqnxdnCmUa6SjiLMFddiQ
	LATAZ2f7sptL6v/qRN0ad33O2gctUIEV13zcRDfEgea74hQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaawgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 20:23:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so32453035ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812626; x=1789417426; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e5PAjbyonBBX8bCa9McFT9c18q9TrMpdt4SO1ARd2xg=;
        b=VNos6k+PMPjJc8xvB3mgj/CVUYnruur6F/g+Pw2Uwib0tdmzMHGxHG1WOXOh4VExEq
         TFqT8F1wZPMIKCtXgxEdS/V8PdRAdyQfvlCWauKdZqSR/Ci313/iBzoROjzM55E7M4ig
         oC+BMdv20i+TrPkbIMkgUa+9Su+gYecaH6k4epGcwvmmmmOX+xEE3tzDBD0bM7WTNVVY
         4KeL4fH8vVnDOn0tGS8jCKhQ2rOQMHdeQrr9NqkE6yn6dZ+nk4W8pcyAEEVaTJ6eGGzq
         yuZTxSzv/Kr8/H9aZy1S+zQrE7GJUIa2bFNvVaXyjeQoISHrxBKqneRlq9wCnEr8+4Sh
         3nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812626; x=1789417426;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e5PAjbyonBBX8bCa9McFT9c18q9TrMpdt4SO1ARd2xg=;
        b=avTXHIk9XFw4wpCbcyGDeDkB3NOn5ZjD/u2d+Tg/MoA9i395xbI6GxPiuTarKMbKjt
         cX6nglhNlOoaE53VUVzazb59nllRWYNspQ1I5eEHUTlpZPehi9XnpFLb3nwGzIdHdlg7
         HZzrNoWktFx3v686JBmsDhltH338ccnD+zsjypHC3QP3s5xtaSZHj92zO7S2qI0zXzC1
         yAUK44TEcC3Yx2V6XBoStkFMujljRJxArW/URNKfk0wlWjJV/4f0XruzftzuW735PCcx
         jDrju/qIUlbMZeE+DoJchDC+ayWKT5YaAacumvnEFpk1HrkoqG4NUDXBoKfuabukTPuU
         seCg==
X-Forwarded-Encrypted: i=1; AKwUvBz7Yuwx+zdcnjtIYPbp3GN8x89OEnCkRQiRX674j/sFSiIkMKgsOkix+2OkqrLzQIBmqndF27IS7j9oPXJf@vger.kernel.org
X-Gm-Message-State: AFuF++mjoQcL+n5573VWLbiyFNA0ofEBRKcjBmw6aD5Wnz2MD8B8b1NV
	iImbSgdsMi8vRu9SJmtGPhs3RHxC/bljYnKCkUvHYmk3mdDvnh6RO10x8aJUQZetH6qv2XAwTsR
	v6cK6jbg3H/0VwFsmRRRB7/FzepUpuraq+xg8mZUNvL9eJQFWT4hJywFTJjkkHVcjopTP
X-Gm-Gg: AYBFou39BApsNZkpZqPPbeJZpjzH75NZleqVm0A4yglQSajaBkX8+KLSY3l65nX4XiP
	8dr3cNkryikjA4yV8A8W/Kd4kQBUeUAqgVQrYxHYbDzPzuSkU2eB8HQSumkcAFe8Zyh2eDKoITG
	n172QSx1pCA2W5+Acdkgqzwy9/OZEpEfj08VUHRNPRIIDsoTZ8ek2c1RwZQF6golwfp/8N8lGVc
	ZZi2WVpwrHpzo88Ox2TdvJd6uV//YM5e43WpG+ycW2JjtpbIEOilb5DjK16NVPBivK7+KSG9dWL
	JqPuXW72NutvKBJQJM4q3EuLnF4kGNeI+nmAByRnmZPtl/ME4lVU74l2PGsiDoJ9NWf/fSAyvVn
	8IUY4abPAOW6G7X+c863c3aw9Nme5ow==
X-Received: by 2002:a17:903:2acc:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2db5f8cca7emr98859685ad.19.1788812625365;
        Mon, 07 Sep 2026 13:23:45 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2db5f8cca7emr98859205ad.19.1788812624902;
        Mon, 07 Sep 2026 13:23:44 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:23:44 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH net-next v2 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Date: Tue, 08 Sep 2026 01:53:12 +0530
Message-Id: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADAdn2oC/2WNzQrCMBCEX6Xs2ZTtT1rryfeQIrGuJmgTzcZSK
 Xl3Y/HmZWCYmW8WYPKGGHbZAp4mw8bZZMpNBoNW9krCnJOHEssGO6wEa3Pz6khBk7cUhKL2RCR
 pizVBWj08Xcy8Eg/wLViaA/Qp0YaD8+/1airW/Eet/6hTIVAoiW0ju67BSu4dc/58qfvgxjFPA
 n2M8QPUp3oPvwAAAA==
X-Change-ID: 20260903-shikra_ethernet-ae7bee5e804e
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=4796;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=sCoXPX0Yq3nwo2KsW4jRgJUZwqT/+Xni0RoFlfYySqI=;
 b=QME481dA0bhoLDbSXBYvkMkG9PXW95sYcvKCvp0H/2aDSQm5oUiL0uE7DBoI9GRnvPX8bWmbQ
 AEBWe4ah61QBm6PRK35q5+XDrpbYYT+TVgR/wD3NFmzdc3094MQn8L8
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: gdp_EEI5FTjkyTPxMyoptfgP6NvdmrE5
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9f1d52 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=ci5OYPSUn-HddWIvASoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: gdp_EEI5FTjkyTPxMyoptfgP6NvdmrE5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX8g658YqLnswQ
 P+uwmmwXO9XWRfFTFC2qShkK1dCsDRoAwuiTsFNKH3o+5ctGpHKi6fsFTFn4c+yHO78DBNCqqU/
 PzETei+WSO0dmzxHcdFONxrdcFRTInI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX5L3hcpcia3KH
 cZRj99n13C06rSovr/NzMaCSIoRagAPTR23wT5HO/S2WRPwImWOcXB21reQMjYbLNJOal+i1TdD
 lRtGEJqMuD2DbptNkBZBuoWPkRAS3nQRnW31dZ6uDOP5OcrQFfCv6Su6cPk/jSUSNxxj49tWS2V
 JoDQ1BCPReAMBnlyzCtfbkAgq+idUCrgUXQ0AaDbF1JC32+MsfcmPR0T/DjZV7xoJsjId1MhUR3
 iycA2xJYlnKXyTGWw+CYF3X+qxomkobhc7C8VCKiJ5hhSpNsQxS1dydko9FUEpMk/ZsX4KL3Spu
 Zx6y+9WVNgQTVyvga7CChWmMQPYaJchiOw4Gqxd/1fNkSb8nPeEUtBgnbJbdmxW7AdLMs3sBKh0
 DQw5LspwT2D5svUWqQlpu4rKgKYFgGz/UzNVVguGH43GfHOAzEuFJOkFp07Tpzrnt5fY1M+eIPI
 rgW9jP+ZTm+lozbcgJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070224

This series incorporates feedback from the RFC and adds the dt-bindings
and driver changes required to enable Gigabit Ethernet support on the
Qualcomm Shikra SoC. DTS changes will be sent out separately.

The series has grown from the RFC and can be broadly divided into three
areas: PHY power supply management, proper support for RGMII ID mode in
the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
required for NOC access.

1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
power supply. Patches 1 and 2 add supply management to the DP83867
driver so the PHY driver holds the regulator vote at probe. These
changes are largely inspired by similar work done for the QCA8081 PHY:
https://lore.kernel.org/netdev/20260605010022.968612-3-elder@riscstar.com/

2. The generic RGMII fixes from the RFC remain. As suggested, an
additional patch now emits a warning (patch 6) when the legacy "rgmii"
or "rgmii-txid" modes are detected. A new change (patch 7) now
initialises the RGMII link clock at SPEED_10 on probe instead of
SPEED_1000, dropping the unnecessary 250 MHz source before link up.

3. NOC clock voting (patch 8) now uses dev_pm_opp_set_rate() so the
required VDD_CX performance state can be propagated through the clock
controller. The Shikra binding (patch 3) is updated accordingly: an
if/else block constrains Shikra to exactly six clocks and requires
operating-points-v2.

Testing:
The following boards have been tested with this new (proper) handling
for RGMII ID:
  - Shikra CQ/IQ variants (with the TI DP83867 PHY)
  - QCS615 Ride (with the Micrel KSZ9031 PHY)
  - Talos EVK (again with the Micrel KSZ9031 PHY)
  - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
    regulator for the PHY power supply)

Changes in v2:
  - Collected Maxime's Reviewed-by tags.
  - Updated Patch 9's commit message to explain the double enable vote
    on the "stmmaceth" clock. Open to discussion on how best to handle
    this.
  - Wrapped regulator vote for dp83867 inside an #ifdef CONFIG_OF check
    to avoid adding an unnecessary 200 ms delay on systems where
    devm_regulator_get_enable_optional() would return 0. The change now
    mirrors the QCA8081 patch -- Sashiko.
  - Fixed ethqos_set_clk_tx_rate() to double the rate for all PHY modes
    other than RGMII-ID -- Sashiko.
  - Moved warning about the use of non RGMII-ID mode to probe instead
    of fix_mac_speed to avoid spamming during each link up event --
    Sashiko.
  - Fixed error unwind drops OPP before stopping link_clk -- Sashiko.
  - Fixed OPP vote set in probe not cleaned up on error -- Sashiko.
  - Link to v1: https://lore.kernel.org/netdev/20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com/#t

Changes since RFC:
  - Two new patches add supply management for the DP83867, replacing
    the gpio-hog approach for PHY power -- Konrad, Andrew.
  - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
    operating-points-v2 for Shikra -- Konrad.
  - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
    Andrew, Maxime.
  - Updated binding document for qcom,ethqos and snps,dwmac.
  - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
    "pcie-tile-axi-noc" as the only additional clock-names.
  - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
    probe.
  - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (9):
      dt-bindings: net: ti,dp83867: add supply properties
      net: phy: dp83867: add regulator supply management
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
      net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  50 ++++-
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 .../devicetree/bindings/net/ti,dp83867.yaml        |  14 ++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 218 +++++++++++++++++++--
 drivers/net/phy/dp83867.c                          |  33 ++++
 5 files changed, 300 insertions(+), 17 deletions(-)
---
base-commit: 7042c8c193e5d634198b7c766bb3a01c8e3ee0e2
change-id: 20260903-shikra_ethernet-ae7bee5e804e

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

