Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67FF2F5A36
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161496; cv=none; b=EAZTyf9nEU76QsuAtL8nkkSaGZfcYUpEsIip6kp0Qj0MPq5aZvN1upg/ZALNpr/3401UKupeDQ+RKFsy2fkxBGCQ9KLbGQ14ZqhouQgNjyR1689swockRxCuS2INSPvLrhK0BEb3c+fCYBJARYaWeFw8jBDANWVts7ay7Jo/E44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161496; c=relaxed/simple;
	bh=WX/HUVlkihtjaAfOHkVv2QOvxp7kvnesEbLy9B42qaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MnRybWDR5FoYuTjBIiFOMPtTIXN2xXIz5g5ouGKhYMrEb4ZNf+/X60iHXmmqJGIFwhQEiwZsQXH6WgsXnbdrKF7j3nZW6Nd7wYMeRZjaku922LXmopaDFRR3tM5JdqvBAtS3Bkmff9Oe4nlnOolpD5O6z6/X2aQKGOonD8XY0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lO5gGtW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLrmSuPx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lO5gGtW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLrmSuPx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm9Zu3823625
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n1ZvqmBecKIUfWjejUXdis
	nwel44WshaBYPprFz7jRo=; b=lO5gGtW068TJbVpCNw08m4DoqUtStf0ynRPqLi
	m6Fx9CTD9oqTyfkbUHiY2zaBBxImGhAF8934WrpWwCYMPNI2+eUvdMIfiDmLk6+S
	LTTdPpJzDRqlndXIxiiX+YmLBcJZ38hDS3Azqfc/XMpxnFbHWBoOvbsVAA8o+YWn
	Kyd5wA9e4LOSLHGSY/HvWJ7WA8BQH+zGxBDdLCeClPTxa/Nsyjd0eW+3ZXyHU0yT
	KpAPbjYK+MpgKCw1x0MfQ9xuWQ0fAstRpGwl0+wGXDQoTRYWui23JNzyms2Y7jIr
	CNidpVTj242cE5k5xSovQCkDgv1n5+GiK//pZN/xAToAxFJQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbs2tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca124bf0189so2533518a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161493; x=1785766293; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n1ZvqmBecKIUfWjejUXdisnwel44WshaBYPprFz7jRo=;
        b=NLrmSuPxn73No0m93heah2dSiv7scZOTQLdyvlw6wLKiL6IoMhmySRl7aTvcyQQs0p
         2vXGnp31CB4VrUkgqOWsFAcjeFu2dW16vxujnfXdzw01wziXZfXIgaacQMkfvowqoQ20
         TLkBbXzktHqo8t5cxvvvDbirk00HO8xCFLM3Z1S+sU8NWNZCWX32o7SCTXTs6YO27x5m
         Dhe6O0MItxHqkjbt453rBw9BfoOFYrGMZimxZB/nEPZKC3Zqi8d5okV+ooLwZVVCJbAY
         W0z+aieUJ1N6nvqmIE82gd+KeO8YIVYsvaMiDuEGNBpS1wluIfBwre6LyyAtyzu8E+Tr
         YzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161493; x=1785766293;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1ZvqmBecKIUfWjejUXdisnwel44WshaBYPprFz7jRo=;
        b=stQs3bKDRvP6+v2jbFrrchIGXsrBfk9ekzU33IXUN6kh3uNMsBfIaruFMckv6toCxg
         hxR0qMghSQZdeR+rj676NrmRJ5fsU6cQquxNdg4X61AEUgBO9WdFyyAacEl2c+nS2l4x
         CkqU3f2ttoAbUqo6Lv7kNL7TC8p+g6cKObWSG7ryWp2VvyGyjkwx+h1I9eSMcLbdnTIp
         BP/zfaCV88rMhUNXm16F9Gj9qssWeTCN+m7qWTNDWm3oy8pGOo5KlNePwgopboSJYoiF
         ZP78qpKvV8kHAhVFgqOQaXQb/hyxXGdrBLJeM6ruSQMoQUvxXbnhFH9VhyaHcmRePeiI
         APxg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/npz77DQSB29hgezszNF9H2VbKjsoxKMBKgDOVBBqZJJJ2Rj2ISYJNOal7VCn2avqYM7PTdcA6BzMh9x0@vger.kernel.org
X-Gm-Message-State: AOJu0YwdpeCN30PFgJ0PbwEyt34OrBhlCeuggr6Z0jmf4fxUpawE5h5t
	tN7IKTCtVuHBZZAAhsDmztcProQFcO8X1UZ/Stk803/cpkXCspuo1A/qG0A0ijJhlQv26pBnHvp
	1ejdyoWnkp4nYeiBj7Zh9tfUHQs4SmZk8VLM0KylA/TAPjNKGFE3DjyBlkEjzDZIEr/4UTEQ8bQ
	pw
X-Gm-Gg: AR+sD12eReAwGdITmVESoJUuxWvzDGadyXQfueUSAUPrU52ahTkua3nUGJsZ/QNOA4S
	VMPjcKV0Ik+OmMHBrzcF9wDvv6ooshWwGn1c5GOPfZCcKl7kF0gHcRANq2TehsdCYZk6oZRc+bG
	BAfgT/OK+OyGwoD82pY5YuNKS6uEeiS5w403FQ+ojMaL0TfApopkb2rtXjEX4fnoHXZCs9z8Spy
	dLLsevSyhjc+wr2ng8ylwmvKifXnv9Xhr1z88E4rqIExdT2TFXi8rIqaKrKqcisxwH1hGf+cVRb
	ao5gswwbPxkP4zguPwlMEoJ5fjjWMChzxiHZH50jhCF3FonZPKFvYJlwu9+IPSxkpmlo1bx+bBP
	sBR0SeHoSIvcF/yb1HmexGq4G9lulsV4=
X-Received: by 2002:a05:6a20:9188:b0:3c3:6e84:ace8 with SMTP id adf61e73a8af0-3c67260e031mr10448014637.23.1785161493090;
        Mon, 27 Jul 2026 07:11:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:9188:b0:3c3:6e84:ace8 with SMTP id adf61e73a8af0-3c67260e031mr10447982637.23.1785161492631;
        Mon, 27 Jul 2026 07:11:32 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53438677eec.13.2026.07.27.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:11:32 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/6] Add support for Qualcomm TSCSS hardware
Date: Mon, 27 Jul 2026 19:40:56 +0530
Message-Id: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBmZ2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNT3ZLi5OJiXRMTwxQLE5Nkw9RUcyWg2oKi1LTMCrA50bG1tQDCDfz
 9VwAAAA==
X-Change-ID: 20260705-tscss-441d844c1ee7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: o5fssmVVvQpNzzQKApglAI70_SUMzU8X
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a676715 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CuubQGV2Owguao5XfqgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX28nJgYwk3z0B
 SpYLYXjTIfL35BNnq2Fs21s97l6uI7JoHCmRXeXXnjDh2oDJQfiDFN75LZR+J/P6iYuw+t+Q7gi
 BDOmMFzYv0U+VqhHftYg9o36grys87E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfXxIZ0TxVrqBvI
 tpj2SyXWYuvgfzyhpLPav1rFQvnyAJv3FjYQSLQ3r3QBFx5n6IfnsXpPFjwbAMxFWuo0f3JaDv9
 T8s2oi/dltCI3gxrenq4ncV2BvqW8gXOu6Zby17nNgGSnZ9/HkD9lzNx9xMl/WRBVnif0Cu+/Ig
 XD6f5um4Y2vfNs10/xwBz6GDE3MKjfRDWPGmBx1DGYcK7a2DNq8Mfu7lNMSLLMMelkUuGrUaiZE
 RuJfqGlO0fsY77tmEdmAxVtIQQE7l2O1JMIjaoe5gXwoRv5BgOd4i/tucNrDf5xsloU64dWKH0Z
 sovgg9fEIy3tdK1XPvzuShwHZUjqh/lZE3qZf8lCzkbWtybPJle+yE6uXSxUBxZovgTJS1evSkG
 yzLerno1tiYtwRYhISqsOtDv5tcGK2vHHlPWLf8EHVbT3lpwi53VeuKmpSszVOVsCuj1XrX5165
 3EBzRhNIlv3I0qVAUGA==
X-Proofpoint-GUID: o5fssmVVvQpNzzQKApglAI70_SUMzU8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270135

This series introduces support for the Qualcomm Timestamp Counter Subsystem
(TSCSS) hardware, a time synchronization subsystem present on Qualcomm
Lemans, Monaco and QDU1000 SoCs.

TSCSS is composed of two main hardware blocks:
 - Timestamp Counter (TSC): a free-running hardware counter that provides
   continuous timekeeping for the SoC, and is functional with a GCC TSC AHB
   config clock and a global counter clock. The TSC counter resolution and
   supported functionalities vary across SoC variants.

 - Event Timestamp Unit (ETU): an optional block that captures TSC counter
   timestamps against external hardware events. Each ETU slice binds a
   slice identifier to an external event selector, and the ETU additionally
   requires its own clock, pinctrl along with either a per-slice interrupt
   (QDU1000) or a single summary interrupt across all ETU slices (Lemans
   and Monaco).

 +------------------------------------------------+  +------------------+
 | Global clock controller - TSC AHB/CNTR/ETU CLK |  |  EVENT_IN[0:15]  |
 +------------------------------------------------+  +------------------+
                          |                                  |
                          v                                  v
 +----------------------------------------------------------------------+
 |               Timestamp Counter Subsystem (TSCSS)                    |
 |                                                                      |
 |                   +----------------------------------------------+   |
 |  +------------+   |         Event Timestamp Unit (ETU)           |   |
 |  | Timestamp  |   |           0x01C90000-0x01C9FFFF              |   |
 |  |  Counter   |   | +------------------------------------------+ |   |
 |  |   (TSC)    |   | |               ETU Slices                 | |   |
 |  |            |   | | [Slice 0]  [Slice 1]   [...]  [Slice 15] | |   |
 |  | 0x1C80000  |   | | 0x1C90000  0x1C91000          0x1C9F000  | |   |
 |  +------------+   | |                                          | |   |
 |                   | +-----------+------------------------------+ |   |
 |                   +-------------|--------------------+-----------+   |
 |                                 |                    |               |
 +---------------------------------|--------------------|---------------+
                                   |                    |
                                   v                    v
                         +----------------------------------------+
                         |    per-slice IRQ  (OR)  summary IRQ    |
                         |      (QDU1000)            (Lemans)     |
                         +----------------------------------------+
                                             |
                                             v
                              +-----------------------------+
                              |   Interrupt Controller      |
                              +-----------------------------+

The address offsets shown in the diagram above are specific to Qualcomm
Lemans SoC.

This series currently covers only the TSC block driver functionality; ETU
driver support will follow in a later series.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (6):
      dt-bindings: ptp: Document the TSCSS on Qualcomm Lemans and Monaco SoCs
      dt-bindings: ptp: Document TSCSS hardware on Qualcomm QDU1000 SoC
      ptp: qcom: Add PTP driver for the Qualcomm TSC hardware
      arm64: defconfig: Enable Qualcomm TSC driver
      arm64: dts: qcom: lemans: Add support for TSCSS node
      arm64: dts: qcom: qdu1000: Add support for TSCSS node

 .../devicetree/bindings/ptp/qcom,lemans-tscss.yaml | 198 ++++++++++
 .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 187 ++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  11 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |  11 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/ptp/Kconfig                                |  10 +
 drivers/ptp/Makefile                               |   1 +
 drivers/ptp/ptp_qcom_tsc.c                         | 413 +++++++++++++++++++++
 8 files changed, 832 insertions(+)
---
base-commit: c5e32e86ca02b003f86e095d379b38148999293d
change-id: 20260705-tscss-441d844c1ee7

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

