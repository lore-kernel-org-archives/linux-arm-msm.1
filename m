Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B9429004
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320856; cv=none; b=mHxZ5RplSGO+whApOCDB74xoOuHdRIJVWZF5Z3HofbluVPCykblNLwhASUoFBVgZiVxnT8xyiWKjv0mtX8aVRKfZ8QQNK82bAkwCKSGTYzlWq5Rs0oNz2BHd14A35LjRY2+19AlmuM0rM9lnn0xwySdghCAnHcRlf6iDCUJYNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320856; c=relaxed/simple;
	bh=zG6hfogN1QbgPMv3UdSFqanqcDvbviqWkuzyXTsFFek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WvxAFU2IL85CJR5G+qbqgg4N51PKuKOrBiZjFulySVOZIMsuHKIFTbmDr9IcO8sSxsNQQNX6gXU2CVjVc6ZTIkjRV1kcEMw/jWiUrGNxlo7OYXp0vrd6LRN+6+mGMluzGOrDoO/tbBNZcGbJoYLewNGtfkTw1FG8mJ2JxdjcoYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JezCoWW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6GJGU53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JezCoWW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6GJGU53"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f6EK1181512
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TsvQ5qZzRdvqfu8ZM+ifDB
	ppNvF7vGfqrD6pbLxq4SQ=; b=JezCoWW9q/kLpz6O29Xb4zJV5qdY71GOniK0ZQ
	lcVCp64hiDoVsVux+vJHsHk+qelRI6x99QOVCzYarrTsOZq/lYUEcok7QBDY5Tn7
	axlCuOeqg3k+T+IjLC3PWtjbmINyPz8y6DoJhrMWMSvaZSS+xuViT6oGjQ0WLxWW
	XFerhwnYjIplN6O+ZTQlLzyICkMJ0pOSDjtNMjWcl3zoAzoP+lpJMgd95LOBJPCR
	ih5xwTrXoPlMVkwkt/CiNPaAtDy7nwVWPbhCvoHWSLvlAlZ4hnpAc5EFU5Th8orX
	zRDvqs3LMtTNXxPMVwlszEiLA1KO4wnZtb5CeJFQhqtGHYIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmcs6dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:27:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388277fd89aso141476a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785320852; x=1785925652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TsvQ5qZzRdvqfu8ZM+ifDBppNvF7vGfqrD6pbLxq4SQ=;
        b=a6GJGU53QlBbV8XEeR0f2PIfuKeWKrVTtM8c0KGiUcekbjEJJ13i28RB3HeJlOUDOF
         rxhdSaXbrTQAr/euj0NmJTv2H6Ap1YhkDbXD3n4op2n4UaFr7FPr6Oz6HZndDAorEakT
         CtX2QBP/KpYO8PhNhZ4sCHNhSNz6Vterx+5XmBQlD5Ffbdwdx2CzjErhQbVXwH7wTmFQ
         jG2SxPPPfZztUsFBg+fOURzHyYciGOKgHAMrte1oJVNDtSL1Akr/ZeC+pMPqMuJvqZxk
         t9NbEHwVTmX5Qt6rIHOrW2q4BUa0Or8ELF3VcvLqL/MJW7khtcjGF4j7IUX12x/fkOJM
         lnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320852; x=1785925652;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TsvQ5qZzRdvqfu8ZM+ifDBppNvF7vGfqrD6pbLxq4SQ=;
        b=pvkODAutUD9HL4hAUYnwJ+sOnZcrR1Rt+qXDdE9XJgXImtH3o8AU0yXc03CHs23W77
         xt55VrobNbWaVED1++B+xxCTuk643IlPpe9DuyLVt97fUwiMDZaHrHTr+dIQe3kArr7Y
         Y+8V4igj2hMWz3cYEIEL9PCV1SswVlQ1UKkyOpM2NAXX7r+RmBnpfnXQuDlJ665bPoaX
         vmeP5+l3i8bDGbk7BSA1sdeDY906lsVG2bEYk5Syrwrsdw/KSX2AFDuyL9uG3xICxjxT
         4UeLEoGMmtU5MeL4yVP0BQylCKInxDebZDR0x8PiqPMO6I5L67dXuauJLziiDDGAfivt
         GmlA==
X-Gm-Message-State: AOJu0YysvXOOuMAeMITf4smtMy+x0gkCCHPbqgvffA3sfXFjv3nbpUXW
	okzADNjHsXPWJEfAX24yFjfg2xyEOdaqtRHPKpxwHJkbn3BKNu0HhflkiM0N/r8yV2OQqweRCSF
	AyXV5DvL20/VI5lVagWK+InETitilwd/GXeZETaSZ/EmhOP6uBrVpNlffaie7HBuiTV9U
X-Gm-Gg: AR+sD11tMCQAGFYazXKY3Q/gm71vRCFPYevspuZPeX+wJTEuhLYIzpZ9mvL/3bcfaVm
	gdrMMUluDUN8kJBeDMnXlD51VRVIL95oAMy4uXsVdZc2nffhIyzl3iAFGvErcxWZ9wq/0OFUmD2
	ccQDZ3woKm0Yo5MDtr6FaRQuavACQNUyGG9rf4ph7BtY237u+MWhWDLdUQmIxENU1Xp/oFPahZm
	1lUfpkOVDfEcdz11Mbg1HUDgBvcJNOzdyOZi6q09tH4T2wIqsCA9SOtupf6k3FhLEW67cDM9gMd
	6cKcd7uccgwAY793xbsZcN2FINYPPm1h9NWb/mC96GSxKTPZQRkAFOgtCVmjBfWH3BHF2TdWi6l
	ZepuNlV+r9gMEYRAxP0Zshd0cp7xZrXnf3kY7gAN5Qe7lzSi0f2E=
X-Received: by 2002:a17:90b:1b0b:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38f7c963fcamr5396375a91.2.1785320851600;
        Wed, 29 Jul 2026 03:27:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0b:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38f7c963fcamr5396354a91.2.1785320851214;
        Wed, 29 Jul 2026 03:27:31 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0ed10csm1121477a91.4.2026.07.29.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:27:30 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: hamoa-iot-evk: Enable M.2 Key E
 connector
Date: Wed, 29 Jul 2026 15:57:24 +0530
Message-Id: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzVaWoC/3WNwQ6CMBBEf4Xs2SVlgaKe/A/DoZYiTSzFLjYa0
 n+3cjeZTPImmZkN2ARrGM7FBsFEy9bPGepDAXpS892gHTIDCZKioxon5bxCRzisjJGQhOx011D
 VyhPk1hLMaN/74rXPPFleffjsB5F+6f+tLIFHorZRuhLVeLt45vL5Ug/tnSuzQZ9S+gK0ZCNct
 QAAAA==
X-Change-ID: 20260723-hamoa-m2-dts-v2-2067c7421569
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX7yNCeXcDC4PH
 na7RmAQYBLBqCwgG33VpSGpDOQtVXjboqcBlKSeXPT5oqmFCCYsCAVH6XuJ+Ad/xSPP3OCilgAm
 Y3Hqp4R5INmedRN4bw88vtwn+B4PLIIlDBKVxdKKCZIJj/JAn5b68Ycd01qaD8IunXTduhoKD9l
 dI/QOBeZiuxDMk8MxDToG7vLjJP5vHeHPi+vm9ddziO6O0WZ/e5s3tEz0rD7vV77/xiCA1pPOJx
 F9rsKb/glg+g3ktW0LNci0J7Ckeu372A25RNPK6qM16h8R4xkAB/yZcR97Wkaj79ba6/jANG31r
 Z4znd7gunTCO/91BpdoGu7Gm+JApKXTVSIZSPoaVww8vxgiQbEd83H3k231A8RXY9J8UJ8kqvWX
 QrNWHCcB/DQpOgpFVQl6zjB+Q9So7iVMy8rOkRKm2t0t3mkgYWgXIKMd7wyJid+c8aXjJb+cuuZ
 zPTQYaZ0feCJLa/1M4g==
X-Authority-Analysis: v=2.4 cv=HP3z0Itv c=1 sm=1 tr=0 ts=6a69d594 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=HBrWxFKzBfSoTCUu9e0A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1jDw06THq76YrJLFJGwPzu7aBWlWV1Kh
X-Proofpoint-ORIG-GUID: 1jDw06THq76YrJLFJGwPzu7aBWlWV1Kh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX4nrbK9fNKpsy
 L+cu5jXLaM+hT2Bs00HRqMPeTWUWiWJNz0PJ0zpn+0alidi7SXdyFIzUOPPUy1u8d6eFBwZwfjf
 dZExRbVddBUTIJ27UdaPZYdLd5siIgI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290086

Describe the PCIe M.2 Key E connector on the Hamoa IoT EVK. This is
the DTS half of [1]. The pcie-m2 sub-ID patch is sent independently
as [PATCH v2]; the W_DISABLE2# else-branch patch is dropped in favor
of Chen-Yu Tsai's series [2].

Depends on: [2]

Changes in v3:
- patch 1/3: add uart14_ep, usb_2_m2_ep and pcie4_port0_ep stub endpoints
  in hamoa.dtsi, so board DTS can reference them by label directly; remove
  superfluous comment (Konrad).
- patch 3/3: use &uart14_ep, &usb_2_m2_ep and &pcie4_port0_ep label
  references instead of re-defining port hierarchy in board DTS (Konrad).
- Link to v2: https://lore.kernel.org/r/20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com

Changes in v2:
- Split PATCH 1/3 of [1] into two commits (Dmitry).
- Add usb_2 HS port@0 (new patch 1/3) to pair with M.2 USB port@1.
- In patch 3/3: rename pcie4port0_ep -> pcie4_port0_ep (Konrad); add
  port@2 for the USB BT variant; remove unused vreg_wcn_0p95 /
  vreg_wcn_1p9 (sashiko). Konrad's v1 Reviewed-by is not carried:
  the new port@2 endpoint and vreg cleanup were not part of the v1
  review scope.
- Drop PATCH 3/3 of [1]; use [2] instead (Mani).

Link: [1] https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com/
Link: [2] https://lore.kernel.org/all/20260721065413.2306137-1-wenst@chromium.org/

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
Wei Deng (3):
      arm64: dts: qcom: hamoa: Number usb_2 HS port and add M.2 endpoint stubs
      arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 170 ++++++++++-------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |  29 ++++-
 2 files changed, 87 insertions(+), 112 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-hamoa-m2-dts-v2-2067c7421569

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

