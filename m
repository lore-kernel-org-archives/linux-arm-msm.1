Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A39453486
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627638; cv=none; b=DCa4c7TdU9to1+E4Fph6+38kBWZPQ5Sach4cvEBl5yW5GLSVZ+eju7C2VHKsSqXzlELcWVFwKPO4ou4/fI7RaCHNZ6QkA4ZVOmf4ImCshEfQhpXxVTK4oX3p1OyUNlw7gaL0s9CUBXwkIK3tYbNUHgKr3271W0BPO5hdvTNRHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627638; c=relaxed/simple;
	bh=5wovXRtxQxVSftIs+VhuWwKggYu9JE/xPNlz/SJVNaQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lz7yL3favF+05R/UIRXlw6opewPePkvEhvffGYJ9vfHMTh5kNPXZrnN3GJtQfRLABRwbbk6e0t+EwFSjDKKPnOyo9eGbQxYsCRQV24oy9vH2rz7IMYVXx1p6lukZM538Y4A6SrjOQVjOcsMAlwEZj4xILuzqZzvXXHr5TSNoZDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPhbr5r3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4f3KVpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPhbr5r3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4f3KVpJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6Ga4I3978349
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WoL/PUprJ09q8xiq7zNvIs
	cbkj2dGq1LaeMtDkyQ6Dk=; b=mPhbr5r3pKAMw+jgY6tPZmK5aHjAJBN6kk6fBc
	rUKX05LsLGTdpwtNiabi6sbk9QH5Yj5HuHRRw3DtuyxL63kfHuzw6M6QagMhOK3j
	ddOVVK3m17eNYdXjoSxgMW9yBDj6KeFuWhh6cnrEwlxb8MJWLFqba8DtPVvYipft
	r70JMgEOKTM6gQiBdpa3gfmDbT+JoDP1vpbSHK5LuqDMeuBjk7+pt4AiQPOvuoR3
	EmHjB0InJV0Ux65L5yeiy0WMsgKYIeutl+ZdAjeAI5/PbTCjCFKoGBFP9+s2INAe
	iDXMZq55XRfytGj6PnyEfRulT0bJNMoE3vMmezg/yZNZ2oGg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv43tsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:53:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6823efcso99089445ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627635; x=1785232435; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WoL/PUprJ09q8xiq7zNvIscbkj2dGq1LaeMtDkyQ6Dk=;
        b=I4f3KVpJU2UljHiXPj9kcX8E022IOcBImY/ozuokzXsYHUFt1hAo5WdSgUwUIeyql9
         VOOTNOtoSbcoiFSEWWJ8zykac9PuFw+6j/Y6lXIledUX0+57jpLl57sL+WGj3JzjL3P+
         hSxpnOhZtQ4tX22KVZXSWZ7OynlEao2PIxnpfyepmPeNr3awuqnHkvpgWOh/USCVF6Fb
         UPStmfJsZIC3ygyRpA/4MaxzgN5LbqZMDdzJQoSE8aHGyoIr0L91vBqcRqQ1M1Nkb8zt
         waSXDI3Jl0MpROnnaF4R2JozO2UEbXfpHRkHLOWCZGPCbLSmHYrtbnjG66pLjqhxn05L
         hnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627635; x=1785232435;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WoL/PUprJ09q8xiq7zNvIscbkj2dGq1LaeMtDkyQ6Dk=;
        b=Gq583gXC9iSVymIivIu1cSeL7fh1YVsEEAA7vBdTtb+bHndZFYEUZkDG7acpDbQC4G
         L09SO4DhFAC5J6oyMwC9rMyX0otdN0s0c54eBLCgzVkq0tUMoIx0fOx+AXPO1pcplWjy
         WMft1W3NEmzMKFCz6KApin3V/K+TPr8IoAmEhD+nms2jRtJ0Ls4LOxZiqhZCbQZ51Ql9
         +w4RGSCsHG9FFFA9R66H6l9k+8rX30Q5vYkH9ATeRs4jRijTLTA1gxmURrYFcUaj+FwZ
         mtOxIlwoN5dO0MP5X/fOqwYONfD1isCClbskKDriVugt+t10JX3xoTqLBV6uDPLjw+p4
         PwGg==
X-Gm-Message-State: AOJu0Yxm9AKN/mBi44ejdVIIK+SkHQ887H5ZNW1Swp7c0gKLg/rTa5zA
	Cqim/ud0pCe5InxyOP14TT0Qgn6sfa+UiiB6738iuihOnniDEGdqV3y5D5VkvtfRtSTID1fSwv4
	MzWAMfegjLQwHncMyp58m1KBj+VJLxHpgTYVGfAD6BDUkkeEmlT33AvElfNo/4JI2fVD2
X-Gm-Gg: AR+sD11ahayJVrHLYdRQqhM/Vqf2xvFyOwkB64NVzcLrjCjmugBXqgIHm3Xpqyz76q3
	ri1XkH4jP+AuxDa9sTkzq1yB471FTrhHjmhvLtTT74lSSRLYO3DuZH1mM7rY6mKj/WG/fmDkwa/
	/Y9ZBE2VE1QWWh2KItmeEb6Z2kUE7q4eLyuoGD+ukRtDDXZWE/gzSasoGKmlDS34hvFOWOyzuwo
	2IrrK1j2C2aP2U7Ub8ACp4/nx8hMjHcgTWmNG75/9nRNKXotjyR2JPaWwCcfQHfaWu20IMKafwV
	djwrkDvwt4W5Dgt6ObfgFwkYGRXsSBYjp6SjSbrIHR1NBTdk7x6EM6UAUPGHgGFfvwEKGp2B895
	5DxXH2q99NPGrJpKyTa1DIKoY/YKqPeyWq3VA7At/RBMPacPoDJxIu10W1xcW7pm/rfQ1DA==
X-Received: by 2002:a17:902:e748:b0:2cc:ffa6:462a with SMTP id d9443c01a7336-2cf3481bb85mr183523295ad.10.1784627635234;
        Tue, 21 Jul 2026 02:53:55 -0700 (PDT)
X-Received: by 2002:a17:902:e748:b0:2cc:ffa6:462a with SMTP id d9443c01a7336-2cf3481bb85mr183523025ad.10.1784627634682;
        Tue, 21 Jul 2026 02:53:54 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da139sm71950055ad.40.2026.07.21.02.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:53:54 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add DT Support for USB on Shikra
Date: Tue, 21 Jul 2026 15:23:44 +0530
Message-Id: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKhBX2oC/yXMTQrCMBBA4auEWTsQ02DUq0gX+RnNKMSSaYtQc
 ndjXX6L9zYQqkwCV7VBpZWF36XDHhTE7MuDkFM3GG1O2h0vuEhAyfyqHtOMq8Vkgj4P1hlPBD2
 bKt35sy9v49+yhCfF+feB1r6sZ6xJdAAAAA==
X-Change-ID: 20260719-usb-shikra-dt-v4-d2b083472aee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627631; l=2253;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=5wovXRtxQxVSftIs+VhuWwKggYu9JE/xPNlz/SJVNaQ=;
 b=MmULYcQmR0qH4A3xpASgSbtrIBu9/qhpDtF0X6FmXxx7auh0S8/wXPQ/F4W0bRXx0wjLAD4xK
 NkQ7ogNrvqhDsTePQrs8sHfIJV5SE3REMZ3e8vjWl0/OeWlkUxhhGOj
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: T_rxbUCTnBLmSzpchKP5EXV7FTBDdmyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfXzwwz5ixn1Dtm
 xBO2HTSNRzUKPZuIMG9Q7zUkVCI4IvsDtXwOkzjs1sIEKKnkNVks0ZMl6Q6HLPmp1KrlBCN/UF7
 o/+EUVjsGlx8pUDptgejAiLJDby0O0tYzzkdTjMuFqSj8WwsFeWLdbde3y5/ba4quZdYG7keeuD
 X1sDkmzv2rYzxMtxWT0ezZuHfn/fmbEybPeaa20nMT3ixpU1/FoALCF91Na2BUgIGEftSlk7DHi
 4GM/XhoUT/C+nx8WZbGGrb9rKDPfaEANwPW+SSerM4UeqUw3CO1v7Q9xfYg380q+aHTOlaagbvu
 NFKQIUtdWHdhZ0EmMF3RWMWP98GZLe0RqpHLyjpyP5zTiGJ1gkX1ZGi1l42w2iTWsAC5jp7xm8t
 xUmOnWlH4xnEMbqCXxzi9EBEuMfErZr2B5sRh18tSHXbb1iKAOFOvMsqKhYIb6zmRMsdrCQDlwP
 gNOCmZoCvyF+eB3BLyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX9N5079Mgh2aX
 yUKBSxXwclHsWCztj6tdHj5RNSlbIQEs1q+RV85lufL3MrtBAU0SeUzWcEgE+aJmz333u5jx0aM
 2nirDMyYHnCURcMyYFV22cgxU5zh9E0=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5f41b4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_AVwzdTWJwZJkuAtZNAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: T_rxbUCTnBLmSzpchKP5EXV7FTBDdmyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210104

Shikra has two USB controllers. Adding both USB controllers support
in device mode in this series.

Changes in v4:
- Enable both controllers in CQS/CQM platform
- Fixed iface clock in usb_2 node
- Skipped adding RB tags obtained from Konrad since on CQM/CQS, second
  controller also is enabled in v4. Also specified dr_mode as peripheral
  for first controller.

Link to v3:
https://lore.kernel.org/all/20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com/

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
  they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Binding dependencies:
- USB controller: https://lore.kernel.org/all/20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com/ - (RB'd)
- QUSB2 Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)
- QMP Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com/ - (RB'd)

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: Enable USB controllers on Shikra CQS platform
      arm64: dts: qcom: Enable USB controllers on Shikra CQM platform
      arm64: dts: qcom: Enable USB controllers on Shikra IQS platform

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 221 ++++++++++++++++++++++++++++
 4 files changed, 326 insertions(+)
---
base-commit: 7b3363bc5e08c0a7f64b5a822a9b6e2fbcfcc401
change-id: 20260719-usb-shikra-dt-v4-d2b083472aee

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

