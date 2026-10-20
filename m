Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513839;
	b=Gf40SL3hi8j/xbqPDRDrW1fAw1RWKs5HL2agVglISkGrF8xpuEMu892mvm8iNrTzbmqN
	 lSEPA+xC2dShal9Sl7i+SsneplkTnoyTJl8uSp8uYnm+MWBcTcJZeNOgUY/YJ3CgZPTqI
	 ZIqqaqSUuCT0OS8k6VmgaHpgKctqj6T2MlcHFmb6fDQdU76P0PwvxoO8dQKgGqO+oq4Vy
	 vmErAhCqPfaWFl6ptH46XtGpbEcpGG/QuXTvwP1aB5lZZpCEfHgh5X6Ysaq5xfus0J9hn
	 1q91pRufNRxMjidk/+mQkQU+aL6Ha1YMyUjPNLuNxUMdFZKGxEfTSNqKsAMZKuvPxOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
	b=Eh0z4yCSUITeGcuagCuW+LF6fW6IIneeZUH7KTIo3HG2mzMSY47qDV0FGnAuWAoMWfTt
	 42qNF1uBOBU1LxSt3n9uUpbE52GMd+N1v4q/cOhp8jNqeX4lmvg7I5xmJX6q8tbCeZYV4
	 vpzi2v6p+632dijxWA0nlogLRex47nBv980/tU9rJLlqTEf/229GQCSNLFQSI3mJ7sfpv
	 K5+11dxUUfckJOu/1WjkMh1U9bVEekMV8XjQR3wOd2Ns1DFGmQkcYrX5/2MKOFxeKEn/s
	 JadPeIKxMXPVl++Vsb4t1d42jlwiLO9YQY8YgeP5Mj3DrcipVlgqMR8oC/UrKCfQa+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6TsvtST;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Loz3/OwX";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD512606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD512606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6TsvtST;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Loz3/OwX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDACjk1429965
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UOP0waMM+sHxlrwH6GNmYM
	DDdAIctadssvGweIo5pH8=; b=U6TsvtSTx4MkOtTdgMtB1yHOMtDA9I/gW726oX
	nvOujiXw6sZexFMejeuw5CGHWTAO36R1h1UyUkIzljBeALbnfyosRGB+DToBEVbt
	42z2SXKTEOwr9rCzhwJrjtm2hNgDn7oR1mGTi29Z+mJYBMHzDqQHYSLVsp4WZ9Wm
	5I32eMybyjlaAhz/po7EUv3xmAEtopn0cu604RVDujr8ICzw/zaljV2tY5vqN1uX
	vN5skCMJ1b5L0bM4koftls97cYhwHrSrJ2aJKfu/AwMP4pe0xM2ApC4iE1b+13Ys
	qzgoA+WVQiEmiaYJw6pBpR41ajV6DWxCbSCl3kIc3ieuOslw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qbcvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:30:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso5453873c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792513836; x=1793118636; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
        b=Loz3/OwXsUUt1u3DhW5IgPZyB9AGL5KW/9KSwWplg0ixd/C0RzA2NiygxCSNUO2b8n
         wbrbilsqRM8l1+S3Z0Wp4d52EEN10SDyMuoW0ysZxacEgfUgMcadfKdjjajfDo9yMj5S
         HTYkbP0HxGrXM4O1/Bf2ilyAlqXgLuqW2glQsRaHBwQ5yWD451ArZcJm9czZgEycly/G
         rY/q97zIvbpf99HqcD1D874Qny6KNIpW6sxrN0FcNkuaBdYBYdjwd7eIAx96Lq9pvYJY
         ObcSOPuXrAUCyjM8wpX4hsRO2n7VowA0wsjze5SBxXgy0zxAVIviKfuPILE7znftYKC8
         E6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513836; x=1793118636;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
        b=lg38E8dzN0r9O645XQQP/BaJBDr2bATIM67mu50Ir8aNQe9dDiAXsOyA4u+GZOEtor
         TuvEyGSiGxcCSdS6XZFPGwZV19ecjClY9zkeNF4hXvwQCHhU5Cms4KSKa41q/kHH5KST
         AT5b+XC2seDzyXyDOU/q6pRZ6nzVgTxbyk8yNEVTsGa24bbkNQ8PK3hJbS92Pg6oukzl
         NbGVhlLFdn6DiWWQnhRCRSZmIkelflofdKvknBezLhWhNIzAqLk+k2iICnIVcVHiWtax
         MXdHPGltgStFzfx4BM4qPOCqJ7lvwVv88O6IYYuat4tB+FxbcQKQ/ygdRxkEzDSRD4W6
         cL7w==
X-Gm-Message-State: AFq9FYK03XenZ0afnOPAhLQuWZOmBZJf6b0Uq3v7BfBVxRBNiIxBly8U
	WDVMFNPAhB1NYryG6omyRGPpHtbEYiiG+HVaFsLKXbR649+m/PcIFa9eg5YC16GV6iaXCscd7Jt
	4RD/L7tvtkNJ+tuu3YHlylNr4vFQiUStUupGH+SnV96suxjNqOOEwaS7PVqCMvJDn48Tj
X-Gm-Gg: AYBFou0rZHus4ztSQxtuuwKcDVLKmXzHLQwRv6sJTnaGu3t1RCjQxENlUJSqqLyAdYb
	V8vJ8np0GrMt4uhatTzM80lYRXxfTsG+6Na2+zfWeoCTLBcAqYlgDtCnbtsbzQuWvg2rmrvP08w
	9o2eHhJOHrsDFjzh6xUcoDpj46TmlYeAOLzbJnY1aMTUE+l2EYzRsxv4zjh7q6em9RmUc6QA8Oq
	F70QraDyFHIrJxaOOjvdeByBmy0ne36369Tt/eC4uf1yz/AMN3eOb46wECjnxvexVPBq0pO7ic1
	n0DXyZIVSuPOY5HpnUJJvGgPyAKGCPIrE4+ZIlBzMPwiYcIWrfBAk7IKTymIK+zbtB7bKewmmTp
	Q1qK7YU8o6bMLrZPhBVla7B8hbgmJ/NpiO7LKVJRjgU89Y1Xy61lStlKwNEMg50j3bIT5efGdc6
	XpPbsBS4uhaFRQvXrqg6ksVsl8BkMugAIri5I=
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr14599665c88.19.1792513836127;
        Tue, 20 Oct 2026 09:30:36 -0700 (PDT)
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr14599624c88.19.1792513835419;
        Tue, 20 Oct 2026 09:30:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm33473794c88.14.2026.10.20.09.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:30:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add LLCC configuration for Qualcomm's IPQ9650
Date: Tue, 20 Oct 2026 22:00:25 +0530
Message-Id: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACGX12oC/3WNzQ6CMBCEX8Xs2ZJ2tfx48j0MMVCqrAEKXSAaw
 rtb8Oxlki+Z+WYBtp4sw+WwgLczMbkuAB4PYOqie1pBVWBAibGSMhPUD1ms5b1pjBGZPFWJTmJ
 M0xLCpPf2Qe9dd8t/zFP5smbcHFujJh6d/+x/s9p6f9SzElLoBO1ZlirViFfHHA1T0RjXtlEIy
 Nd1/QLo6oBOwQAAAA==
X-Change-ID: 20261009-ipq9650_llcc-903d7576288b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: k5ocFcTgeWvFA8g6oawhQSc7zmGgV-Cd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX5YiBb3DwpZ+B
 dF3fneY5ozEEQ9jLblnnC29d5hAIjQ0SdD8tEfu/7VGOe959HNYEIdsroptjb9Y/JCS/OOOAdu9
 ZUVcH7MPJH4walzMODjxWllpDNb+sJsXg6pdmgc7GuzTckY5CaZjpSHjs1STAdYOGX9+yIyeFV3
 Oo7nffMDDrP8EOsZcurka+pXDQ10rgt9Vh64DP3Ofg4F0gOspY2rwjH2WlJEaeRgsqmSh5cPt35
 qMJIf7I7txirdZ2YzbsUWf2jvC1DInakqVU0+HXWztKasfAW4Mb6F3iCUu9UICnZ6u5Ql6dXVax
 rl9Ns/jYRMvt93b3TkZwz6bJIPK7a9I2wbvia2V/XKzS4ZXorZ1Bsy0H6pNtkkp94cuSdu8a9yc
 eRQ/8VL9hkUG88Gn/EmfGLe5X9u3R2/s/4P+gBN5a6MYn4iiL77u5xYcsLWQwov8UISrWT5IiSk
 nxT8SaP/g5Ih/4s7/lA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX3L3prA9xMh3x
 FMqI3JKGjZpEvM+UhsBa7x+M3/af6s6IdPX69jnq9HqW53zNK6+8hNaCW1pY5fUbMPfcfqmGA/i
 rcA8DIfGVUPKWIQAJ4tv+ejPQYiKrTo=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad7972d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_9f8UQ2UEQgcCYNCZg4A:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: k5ocFcTgeWvFA8g6oawhQSc7zmGgV-Cd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200065

Add the system cache table for IPQ9650 and the IP version is v7.1 but
similar to IPQ5424, there is no broadcast region.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Use lower case hex
- Collected the tags
- Link to v1: https://patch.msgid.link/20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
      soc: qcom: llcc: Add LLCC configuration for IPQ9650

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 +
 drivers/soc/qcom/llcc-qcom.c                       | 76 ++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 |  1 +
 3 files changed, 79 insertions(+)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261009-ipq9650_llcc-903d7576288b

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

