Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183329;
	b=Q+hIllq1jshx9UkHX5E03fLPUz+iZ5m0hmSI3eVtXOijLwMIX//54t/BK/8HPW+wML78
	 SBSO+Q6n+6wyvyAOBmMEd3aI2WHOiVpcxAZWL7G2AFXAMQcIUiPJJTxwwLuNcTj+3Mepx
	 BXofXi90hFVpoDM3W7dxAiQxy8htEVoolhU6h5zJqdfjULVe5QcEjnqmYxFafsH5tve0c
	 pMuJNpbUGY2lmgOPw/fmHEajNSwE7RfAQcidOFCbJN+oY4BZMvj4W9GoxDopbzOklIwey
	 JMmOSBHljDRp5YmZfdstIHzgyuKW6D6mxranf5MGL4A9oxgFfWkQGvP0aBQhLb6ItHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
	b=mZ/h+h7slX8+u5sFeW67Hw3toL1SSn0dm8EHwXHOwMa5LJhUofuLDiI/LnGkO02mh9Lw
	 F2DGtDigWKfuvjXOxOq+W45rb4Tg5Wbrs3YshPwBtPswmj0AD0EfPXXmpi0sGOlvrZaM6
	 NXZTFlznfmk3gvY/2vrwnMTYIxK4LqwMHgzvmtPl7ZVFvr7hpILeFJIcBXs/rDVi3vpBH
	 O5G+Tondt39nyYI0YAWfvPjMNS6pHzU+TYJMb8oWGAR76dXOe5oUFs2323XGTiNeZ1kQz
	 5FWsHSbUpovvOfgMKpZL1od0okvC6v791s//osbAU1e+2dXSskvnyKr0vpcP6RMWBfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/cpiHbL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U27JTjtD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FF3606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FF3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/cpiHbL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U27JTjtD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ke4nm1358298
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 00:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AMRtfRF8O7Ygkgb1lDj8Qn
	egAF0OCQBJ0ibubsM5/r8=; b=G/cpiHbLnZn1edSJkYWdyNV/pQqCb5lrOonGTF
	WEsEt7oqvq5U4X+Hqichy7thG2UIckh97EeDrKnazcNPFLXh8UWoAWFi3s6g5le7
	x4g7SF6ItuJ9KZR1rc4veIB3D/0bgCmXdRpmxQuk8KXdijM4YTp/uVlELVbdLOXr
	7XpcOXYeRh2Pa73TQSSJqpEohSkdaEOumijvT/1v2ont+GQ/HzIUwuYhjTKocwQR
	CrrQ6u/2CY7rNXg7N+gLhnuEZxoB9/1Y0P8BwzYBKOpd12KW1hMT8rlQG5g6ZB9r
	IwyvH+eGgOhsBBd7MkgknrIDfColApjoksOIDK7V5dRxCOnA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6kyap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:15:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36fa5673fccso1875242eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794183326; x=1794788126; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
        b=U27JTjtDUBxJpWD0BK77xruSJWvh2zpDMzZClacRiLUn5eU0VXXW3VsYWK6iI/7abi
         twq2WoLBHKtdPSF6FbVKEBKe8c5OdFYr4KICYr4azo1U+8UX62FpE4Rpt6GpP3adqlZq
         gvFw45XjDShHXR4yyKdrOqJg+GpmJKouWDMQ7GVM65wQuRH4yTTM+kEkh471g+VYkV7r
         Bpd2M8Rqn8dmsWY69wy+CtWTOZ+aPfukFnV2VjL6/aWReqAN9ZnmGc0NpTRxOLh8rnXn
         WvYpqffPJd9dozdDZoSjYTOvvLiVPxPG4CFEhr9pJxD75wVk1GJm8PA0xpjvLp3bTbbG
         2bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183326; x=1794788126;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AMRtfRF8O7Ygkgb1lDj8QnegAF0OCQBJ0ibubsM5/r8=;
        b=D0gGnOX7RDHoSlk/RUj5V7X9idVyVqp/At9PrbGJND27rYR+x6liyCTtJvs8lXUn8O
         AjwMPUKLhtyYlrL4sptmW90vk1KFaZc38xGMntffq1aPxhIDH5Nzc3ZW7cyFBld5130L
         mFUEIRdfBW0I+VdYihL2R0K381byIhlUIjO1rG+aLV906ldzxk4nczu5lieYzCMZiedP
         aNxfNziQudnMAx/GVd4jhlbLg3g7z8mAVbnZl0vv/9kr+KkyL7riyuDvMyg0WAJqr1+M
         Sr7by5KvxA4lckjChJ9qWGmYhy9Ru6W9DaONHUL2kfQJYflM+kEVcGoy/MSnsh0j3ERb
         lWVA==
X-Gm-Message-State: APuU4Z/4sXgGa2OG8hb5GawS5zqbHW5+xHdqDxR1YMkLlrWV2/hkmRq4
	Kr3vv21nC47xk7Y7DHFr7sEg3Fm9enq1soU2+Z1D3NMSuUCIy/eIxFoICFvDqXL3f1rJvsKSbZb
	xFjqfRVb/wzS69PWAO4qE/HbuQ2ISOtOK714E5A/oQBZ9O8EUGmtvdU7/4vf2TX5O9xGk
X-Gm-Gg: AYBFou0JJ65jnXSLoojoIBYSs/cpdMeWPcdkFOqiSeqYR2q+eOYx75B0CvdWqpvxmGh
	gUHCtn1kG64ovnDsmg/0MOWKEoVK6alJVMlRC0rg/MErN5PkgoNR+PC7kaGl0qLpCLFTSux5UTQ
	FJZbW4k9DOwbv/C+55AZSU4YJp6QsxKu4zop78y4s3I6Xs5dsA710pp6yei/B2SqPV0dBhAcmA8
	qcba7ac7J7nPPJmiNQCrobAD/9UmOmAXCM/o1Q7ObvfG9wlLeVDMZ7+8tByqRDTsf5fL2A9ivkV
	GXUZpECVW91NPRcfBsMXwPimJckI+fiPabY4yKZGAWWwLRus6bevXlloowpkkPduZF21rnM4dvP
	Df8RLjnO/KFaGFrXp29uqT7yRD4HVca2uP12fZqupbNoFqDPdcokYdfihotyocRehiA==
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr3802722c88.23.1794183326031;
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr3802676c88.23.1794183325325;
        Sun, 08 Nov 2026 16:15:25 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9105109c88.18.2026.11.08.16.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:15:24 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add HP OmniBook Ultra 14-kg0xxx
Date: Sun, 08 Nov 2026 16:15:23 -0800
Message-Id: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJsQ8WoC/12NywqDMBBFf0Vm3cgk9UG68j+KC43TOm01NlFpE
 f+9UXeF4cKBe88s4MkxebhECzia2bPtA5xPEZi26u8kuAkMClUmUaWiHYTteq6tfYpZCZ0jJUq
 jSZIUwmhwdOPPLryWB/upfpAZN8vWaNmP1n33j7PaeodcovyXh0Mha63zLG+oqbCw3sfvqXoZ2
 3VxCCjXdf0BN8ukf8UAAAA=
X-Change-ID: 20261025-hp-omnibook-v2-970e4290c445
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX6HBbEtkOJNAp
 pqDhN6dUUL0fTuLFPDfHU9pTDlsgQNCijHxoxtgli+wfYnuy3qO6gBg8pWMUdfs9bF9Nd0A7xBE
 sVuIUmfLXtEe5TiPyx44figgcpWrn60HJdW3Xzsj7mkfxOXl/lo2WtogdwrEmQtHGaMVDVTZHse
 xwAGh8UpZvsjIQN+Q5F9vUzuTDsoBzmEV93ZP3fDxWQwLiJhlC1GGKt4sHLuJua1fXAzFKHgEv3
 4pAc4/A2QHO6vZczDULhfJoeeXmswt3bXVLNZJVKGqtUDmUgMtHOKeBppJxP5pqkQ9QtFBveNxX
 FTRGP60G9wChypmj8UsGIvpqtKtfHeIpGWjEP3NjyEzUB2sOfW8wwhi2TXg4KOC6pxmlFvzg6CB
 heGuoNcwF6p1Ok1q+FNRmLXgz3fAVEGRZ+EYrcKXwJnI+J2C6bYpn03oF+5uMIGu+4W1bY/D2i7
 hRe5O4Q6i2nvIIQhIvg==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af1109f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IlVBBCHpe6Su3lOAXoAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX3nX38K9tJOfR
 uh1NvYbtU7AHukT4u1OL5C0vKTrgEz/oUekLzNQ5cdt0SfOoE1yBcnr/g+lwGhiQSm9FchQukr2
 M1QIElrAHhHqkjOe88qol8vfV4BUNGg=
X-Proofpoint-ORIG-GUID: 0CT0TxUKdmDiwv-33fX2BP3MAu1j7qqx
X-Proofpoint-GUID: 0CT0TxUKdmDiwv-33fX2BP3MAu1j7qqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090000

This series adds device tree support for the HP OmniBook Ultra 14"
Next Gen AI PC (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2
Elite (Glymur) laptop.

Working on this laptop with this series applied:
  - Internal eDP panel (2880 x 1800)
  - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
  - NVMe SSD on PCIe (pcie3b)
  - Wi-Fi and Bluetooth
  - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - Audio playback and capture
  - Real-time clock
  - ADSP and CDSP
  - 5MP USB RGB Camera + IR Camera

The device tree builds and boots on its own. USB-C DisplayPort output,
including over retimer/HDMI dongles, additionally needs the qmp-combo
DisplayPort PHY update series for glymur (not part of this series):

  https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/

This device tree was prepared with the help of an LLM (Claude).

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
Changes in v3:
  - Rebased onto next-20261105.
  - Dropped the firmware/scm patch (3/3); Bjorn committed from v2.
  - Removed the reserved-memory/linux,cma node. (Konrad)
  - Dropped the "Assisted-by" trailer; LLM use is noted in this cover
    letter instead. (Abel)
  - Included the pmh0101, pmh0110 and pmh0104 PMIC dtsi.
  - Added "serial0 = &uart21".
  - Marked vreg_l18b_e0_1p2 regulator-always-on; it is the reference
    voltage for the pcie3b wake and reset signals.
  - Added the NVMe endpoint supply.
  - Carried the Reviewed-by tags from Konrad and Abel across the above DTS
    changes; please re-check if any no longer apply.
  - Link to v2: https://lore.kernel.org/all/20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com/

Changes in v2:
  - Rebased onto next-20261030.
  - Addressed comments from reviewers on v1
  - gave sound card its own model name
  - dropped redundant items already enabled in glymur.dtsi
  - annotated gpio-reserved-ranges
  - Link to v1: https://lore.kernel.org/all/20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jason Pettit (2):
      dt-bindings: arm: qcom: add HP OmniBook Ultra 14-kg0xxx
      arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts   | 1013 ++++++++++++++++++++
 3 files changed, 1015 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261025-hp-omnibook-v2-970e4290c445

Best regards,
--  
Jason Pettit <jason.pettit@oss.qualcomm.com>

