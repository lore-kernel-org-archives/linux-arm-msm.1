Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072250;
	b=4jA1T8qY/We1k0iY27IltdNm6TiKXUNxwdLUsUJkGDmglwnLTUcZ4lRDItdrdIQYORHE
	 UefbHHQ3YZOXkLXQWBHg8Wqsb1+FCAv/i+KkRSgDciAu0mtJGoqCKX9RvD5V4HW7rYMdl
	 1mW3eY2HgbC41A88JDcRK9GkhMr5ud6q/vR6GLLDdlvHHQte2JX0fzHehKN4Bwy2uit9G
	 XCTT66hPylpr/LGrtAFZWnn2/mGBCs2NQL3wwPDakfNBUHBR8ezzlu3GLfDGUqvuaX3t4
	 ons+pLbHf4R4JdCJM163ybhyWtW540O+hSmdIie50ypxLwHijLIXfOQ/IfyT7piADdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Acsw0qyovGUap8db+iIcnylVzRzfPacwYuj8IYgEo9w=;
	b=azHodvGT8HuiSaXw2Y82UclSx1N2WjklBTtAx71VRDYsNyDcUCQ+D8DhAVO2hQg8EAnK
	 v2uBreofqA1cAZz0L5PCBViguFAGoNrZ+Lxrp2+QLPoojm8bE+Rt1r6OPEeW0ozMzNQrr
	 wX0kw9ad4dvEiRupFjlyUB+MRKPJviHvtMft1WlV4AWLIlcKguh2vcoZZ/M5xFj10GukC
	 l/3wHfwjgZrfXUZY6YtY38qoPm7qf98ulecN5j8EmRU5lAohUkbblDt8QxIFLDbl90yXX
	 X2TNb2soYK09NJ4Dqk8wqIiecDxqoGGBqyo/Ehn0Mh6qnjBApPdzywcGbgiY2nIlgQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E9mB/rqu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GfPGlhM4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B91606A33B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B91606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E9mB/rqu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GfPGlhM4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vR8G2671943
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Acsw0qyovGUap8db+iIcny
	lVzRzfPacwYuj8IYgEo9w=; b=E9mB/rquOXn8j8xVJ+TcPynUmboMfJ2ZKgchaS
	LCT26JKww6apw4CQpKusocBppfr8E12OtbyQO2NYkrk5KW0uSaZe2Nt6Pedjj0BK
	W89gjGZ67BPgaNbq18kWbG/DGB3+wrWZLNs4a1Pbt0SmrJHjhrvr9zGpEVoW21hR
	MEi2q+suE48r4/yiWtgvtnxlU1yKfOOsFyRwmIamqp+q1DbOmj/AmCwahdIEjirU
	+tPn42fPGnpdf9BijAp4TLciA274ClA4jJcTy7RdPla9x6MPTp6P4lXDxqVysXJJ
	p1q0Ou5wJgd5LYyy5imzX+80wZlbp8DfupUD3OHWjwpbvnXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p34x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:10:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so1531017a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 23:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072246; x=1795677046; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Acsw0qyovGUap8db+iIcnylVzRzfPacwYuj8IYgEo9w=;
        b=GfPGlhM4H7JryDdYtVqnIVldhq05FRd34sUMKjWEnPoRX7IDqeyjH5EfVVIjEQ4ymd
         hcRJKf3w8mc3WicqK81DvvezFLy4cQCzjMlIPaPLdpaOwiSNlixxKMz4CMNGZA2CEsD7
         Jb0CD2GNRkNH9bqB5zPOsdCrzGFA3KGmxoC5wD2PfAvsYrx9QDshK7ABJox+tPGXDMuM
         OT+QwujLsoCXWmc6YRphhMtw2dRPiKnzzc4d2mU3RldiknTNQOWRtVtY/vGt/fwBn1md
         dFnkogP1JAg0VrjNUseTGg7wmhlTwPAQ4ovJtxKurKljnXPGUZdKF6GQ6/PQHZm5CNk1
         wo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072246; x=1795677046;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Acsw0qyovGUap8db+iIcnylVzRzfPacwYuj8IYgEo9w=;
        b=PD3IUDHR/Dlu4h8xMIIbeETkoq9d5rfISbuCfv/kc9ewGQWGNqyUAXTycTQ9m73Jm/
         KA5MMbomWulNXJnTznj15Qr/3Ix/yL+zRklF+jpb82UOzyMYbPtfaikoyIQ5zC7Eeh86
         bYFW5HfaRAbaDswxoo+wlix1QgC8Dc0e5ByVOn8nIZR1cZZrMlOkjr2VLMVlW5y9raXG
         DwaNWKgbqpNiN7qgtYEhFT0wKZ/1wcTFt0XbTyadqFKlSU2NKyaH2y0mJ75V6esLMaby
         ull8+yGoCZWEtcOVnf4cMM3TZ2vP6+l4k3fJBoi0Je4KR/GbDecGsD55sN7fKlZ0Eksq
         eWtA==
X-Forwarded-Encrypted: i=1; AL+hErH3Gmv1S/tBM3Cu2aDq7im1kx7vLznjiE0R982Ce9+y9j3xVVKCTd928OKsUU8zMX/9zU0MXEtqBhvmo3ZE@vger.kernel.org
X-Gm-Message-State: APuU4Z8zruNH0C4nX8PgJ10dQ13vPzsOVhbzH24+iCJKoGWo17wzIH7F
	HHSWvYNUDf2nTZ6vVfO1Hlk7PvV15x002j6hl9DBYOPcw+cGgOnokArKJg9fOGjQT/7eFN2Elcq
	tmA81HTLlR8v6jvZeKtynU0mQ77NWyFf8zkIKpzVRsYzcGG1Osk4wDkq350nzJWjThA2i
X-Gm-Gg: AZFdTZcjNeVpYE0uRqYF1fo08m6OD0/H56RkERknofaNuTV2XYLL1d7TUgQ8e3nfZ9P
	6RCcFGVPX1axsRuUld2oeBOH/9OAGF5YHShrb90HL6xSHm/ABtlmXh1mUsOB7lQKMdGUFfn02mT
	yPIE05jYYwoIW3LEwHmk/tU0V/K+R+nA9CetRW450OteSBWFoxGlgq9k3EocqksQRHq/zWkM4hU
	gRV0ww8LujSp202Rxw/1pDgiApnUNjAksNz2ZObzPdXnjFMoKlR1xLbrJ8XthQ50Pvg51SbzAjX
	3qgXvAFLlcMspcbuJsN6Rec9+AietJWsyeoKss5gVDGAAnsA0ItOZEky0yPoGeGxJf+wE712aN5
	JGmbh/00rhXNOMXMEtisrAmw8VJ9uiDByb4R3aj0/MBNkXQz7zxr4a9Dh+kNTP2ftT13lt3KesJ
	k4ckcGcVJwYQ==
X-Received: by 2002:a17:90b:1a86:b0:3b3:b858:cc92 with SMTP id 98e67ed59e1d1-3b3d07cd6f0mr5089125a91.63.1795072246189;
        Wed, 18 Nov 2026 23:10:46 -0800 (PST)
X-Received: by 2002:a17:90b:1a86:b0:3b3:b858:cc92 with SMTP id 98e67ed59e1d1-3b3d07cd6f0mr5089104a91.63.1795072245709;
        Wed, 18 Nov 2026 23:10:45 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm746348a91.7.2026.11.18.23.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:10:45 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board support
Date: Thu, 19 Nov 2026 12:40:11 +0530
Message-Id: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANSg/moC/42PwW7CMAyGXwXlPKMmqSjdifeYdnBSl2ZqE4hpB
 Kr67ktAE0LagYul3/79+fcimKIjFp+bRURKjl3wWeiPjbAD+iOB67IWqlI7WUkNI03oGbqINkD
 vPI7wMDKY6PxxPoE0jWl2/d4o0iKDTpF6d70f+fp+aJ7ND9lLIReHQaa8jt4OpfVyo8yKZ3B8C
 fF2T5pkYf2Fat8JlSRU0Fk01Na9rJr6EJi35xlHG6Zpm4so2ZJ6kuV77yaVyRppbztp21arf8j
 ruv4COouqSWsBAAA=
X-Change-ID: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072239; l=3088;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=CArQ8mp16A0sNgF7DdUS8Knm8k5ocqWb1J9WJ8aO0ns=;
 b=CJhVARD1CdrjbjCGIDCc0orj/rqP3rV5B85MDU6ajYo5Y0vX2wdXz+ooz+BIJ3yVr2i2W+D++
 2Iq/EPclbXvB9VqqRiHeHi0nuXIoZCRt0WmPdvRk/QQESFaja79yXkk
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-ORIG-GUID: DRvc2F5hyauqlbJps2XoOo4aAZG65uMG
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afea0f7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=aa3sxGzdGyLt4iHDoZcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX33N1t2duT0W4
 s3h4WJZj+8jUc/1PxLVjcQ75z+xkfqrmWUh/oHGyXndeGK97UnS2F0915kSJYMehbBWT6buxisI
 GWwl0MhVX/ECSKesM4ldI5PRmR+xVCOjMgSxNBzIpEmBowMqg27RsX0yFWkQbWh4gZo+iy6pVc4
 +WcpCxKKfl8dFhj8sEClkSxTnO2OTAqKLNRIJDfnKi2biSRRLrxPBxRsXCtxN4Etflcra4hIihf
 +b4mADgnOIY3OO1RH4Up5cJf5X4CfPzGXlfjMK6sXPIt5rLU513GToULy/TbtU0k2IYoJIscRDh
 I7xJlWsIOLDuG+LdVEaXGBhCkUylDCBc5IX/RMJIUxX8oOl6XgZ5Cu20lfyH37FC5v4HdA5uQcE
 u03Hq5GX+LtXPUipyukoosNjl7VbKmqX7/9mxVg/wn+VIyiw7xeDiNbGe3PYtizANksi9BzRXhq
 pTr06Q8gSh5WHdQzzcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX2Vs6ot0DtADN
 8EH0v42zTXHOOYZpyLRXLu1GJLMAEZ9/sSJJBTEj0+F8uMaQFU6SAFQFVV4jk1voiDlV4t45Lud
 5013gjnMdO1BjGQVK2e7kSe10Dter5k=
X-Proofpoint-GUID: DRvc2F5hyauqlbJps2XoOo4aAZG65uMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028

Add device tree support for the LeMans Draco EVK, an evaluation kit
based on the SA8775P/QCS9100 SoC targeting automotive and industrial
use cases. The platform consists of a System on Module (SoM) paired
with the Draco carrier board.

The LeMans Draco SoM integrates the SA8775P/QCS9100 SoC, three
PMM8654AU PMICs, UFS storage, USB 0/1/2, GPU (Adreno 663), and
essential connectivity. A dedicated SoM .dtsi allows carrier board
device trees to reuse common SoM peripherals without duplication.

The Draco carrier board provides board-specific peripherals:
- Four DisplayPort outputs (DP0-DP3) via MDSS0 and MDSS1
- I2C GPIO expanders (TCA6416 x4, PCA9534 x2) and EEPROM-based MAC
  address storage on i2c18
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4
- PCIe0 to NTN3 switch and PCIe1 to x4 slot or M.2 M-key (dip switch)
- M.2 E-key slot with 3.3V supply and PCIe/UART for Wi-Fi/BT module

Link: https://lore.kernel.org/r/20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
Changes in v3:
  - Add PCIe0 (connects to NTN3 switch) and PCIe1 (routable to x4 slot
    or M.2 M-key depending on dip switch) with pinctrl states and IOMMU
    mappings. [Sushrut Shree Trivedi]
  - Add M.2 E-key connectivity slot with always-on 3.3V supply and
    PCIe/UART graph connections for Wi-Fi/BT via pwrseq-pcie-m2.
    [Wei Deng]
  - Move MDSS DP PHY supply assignments to lemans-draco-som.dtsi.

Changes in v2:
  - Sort DT node order: move tlmm block after i2c18 node. [Dmitry Baryshkov]
  - Drop unused sub-node labels ethernet0_mdc, ethernet0_mdio,
    ethernet1_mdc and ethernet1_mdio. [Konrad Dybcio]
  - Improve dt-bindings commit message to explain the two-compatible
    SoM/carrier hierarchy. [Krzysztof Kozlowski]

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org

---
Gopikishan Thawre (3):
      dt-bindings: arm: qcom: Add LeMans Draco EVK board
      arm64: dts: qcom: lemans: Add LeMans Draco EVK SoM platform
      arm64: dts: qcom: lemans: Add LeMans Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 +
 arch/arm64/boot/dts/qcom/Makefile               |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts   | 778 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi  | 421 +++++++++++++
 4 files changed, 1211 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261013-lemans-draco-final-changes-bringup-1b7b76f8b2e3

Best regards,
--  
Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>

