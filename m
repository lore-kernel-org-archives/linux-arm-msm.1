Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB76C8634C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771218; cv=none; b=nnAp1VfA7g25e8DX+wLIrhJ4uPvl24fV9of2e+SlM9u5qf64UlFDfE57MEqHtdNnySssICJdXuUfceeE8Z2tE6X4Cl9y0YeLCEecvNDKAmU8OEbusev687o8efBQU4cDy1wlKvaGBFvyqB6S+zt2g8I8Bb0vA4Mu+0YN9EjgAf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771218; c=relaxed/simple;
	bh=bGlwfuxl7Ko0KTHUMFRKzd7hgfPMUkhhLFboxtPnpwY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VePtabB2lXMuFAZB1DoZetgJk7kDoqn4oWCoZ4ViKxgMMG8jkJ14IVMRKW6eS9u5ijpvbONIbl1tlup/+AIqcbbKbFIdkAlktAqyrLDqctUukF+v/vGp3rjgE7RtGbmGWtoNfUNd/AuA6vj9rIINFCfldlYVNHC2CWnOKU2CzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsHj/hdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZ20psqD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsHj/hdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZ20psqD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WgU62140408
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PAtArUaUjCVwjhnUvEpSOR
	EWwbFp3QpDYdJcjV8SPts=; b=hsHj/hdNFqoliwwuKr2uE7YRIWsym5fb8HDzHt
	PgJ5BT6E7ecdfBn5CwDE0BulSxwB5OFqztmKzT9wnzRsej1kn2NLRnOox8rw+X8g
	tglTR2Y9PdiCzW+XGa9oMpJOQHk1WedpslDwrIoa001bPZAu3ew/1WEcbQiDZ7Dz
	xS0wznE5TWRgQi2D1TmeEbO2S+AG2PCQcAbynF+MyxWfWij4/drEyHU2vo4o0Sy5
	F6DuqmjuzUKZUlFCCWoBGtqkA8YE0VCV/77Zgo709GSCxum48Yk6borHLM2s0OD1
	DdFVmcoXsP2AtqFCjzEu8eZbKWgO2um6PikLN9bkQElKchyw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju22bspg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:46:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso2725805ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771215; x=1785376015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=;
        b=QZ20psqDYMlzH0y+7u38cCOp+GELtviVgQK+d+y0wrXtRTn/4BIfggif8KK/Z4LXDI
         ulA60JlwvjQqBG8TnP0GEiDG8kOI9+nnyPO2ym9eipPw1ni3mMtf52ala7CFABIjHEJF
         2z8F0cIeuKLWk6wbjxno6UgkADKqal7w/SjFnGllq+wya+l6YDYpzVs73AlGRil1f8aT
         YBdh3qGY2DhM+rOFPfhdoYPJPeqSA2JXggIEv0mJqyvZkrNpxb8q40brsYMC55KaRtdK
         PWp+40rpkzIOKR4l5xYs/Zj0x/DBuuABqSvLxuLtSIiHksa1/jln3+dP0Rd/u3T2Hh0G
         pYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771215; x=1785376015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=;
        b=iQ7wWhozo9rFwbg6+BxzRX6a0XOSS9F4u5+bFno4VSHGTnoi5LFX7539gJhSp1q3vh
         kzxiu1mwTAAz32jcF4h+4nog8d9Mz5F7hJWwWfSX3O+AK+ro/inv/C3noD2wu8KNN/oC
         c1UcZW6ukGvbXr12ZTO7IweKGO4ajaYafmFJZ41CYH2knhbI5/4k/fEAoSHmKKO3J52N
         MitAtZpC7F+0nOZFNE+E71NLeEJ2UMLMuNITfrHpc1vxLjLQ80GPU7mA4ybacHGTvg1v
         3CLbmoSUBC0aNpQmetXE7EGpBQ8qK96X8pFIs+eM2CdNR3Wh0kSX9bBUVCS/96Bw8Np3
         DxOA==
X-Forwarded-Encrypted: i=1; AHgh+RpTc0VNB/67o6d0cbNOtZwbPD+8O3zwNOw8guExxU3H5TwD/xb4/CkkJRZgpvUU/Iz7Yjf1mX0cVmm+EF81@vger.kernel.org
X-Gm-Message-State: AOJu0YygA3DgPEPHMmz4dYuPGawEhSDslT3lcDLh2grC3VegTRf2g0JQ
	mj/LKSTEr++l0UBMTE5xo9oOJvorL+Or1sdWJHOlyI9OUTR2aWOH/dHjs94lzF2fEYDvmq3zj8S
	d7khaEm4tnxJk7x7YtVXJNwwnqxG6D091hrdF472CnLeHvi+1LXEEf4jRSK9ISM4fqLbI
X-Gm-Gg: AR+sD11rLjsrwtsuEZCGgai/3T0BFe0N6FuDcTOwwb83SG2J7+mgt2Q4NT8MiJnF3IT
	E4OHdJi95iG+MhQ5p1utBvI+1J9+gg6B1HMZ7Grxo+g3ZfLAE0DBU0Jc2HKMRvBOT9A9bA2uh/w
	a2dR2QjJbKMKBngKIWKnlL0nNM8msM0DzpJDCJuVxcDHLD4FgC87cc9nqxYq7e9xTCwcpJ/9LaE
	1jE7VFMKqYQJR5UStpUVNiWGpyPK9ybjTdeXPAPyt6aPUPyrmKOM9iMCdM84TLH58nUcQbWCV1s
	XHXmZnAdfyJ1eLZZB+MSg7RWMgZ5HpsIvjEooy14Ov/wyzhAFZXUwGhR6rdKTurnlUmSChI0e2t
	kKK/2W191j4miRmdaorifXD+2eW8t4NV281EYDTzAEXf5Tvqfs9vXShhGBWGYzBo=
X-Received: by 2002:a17:903:384f:b0:2cf:9c35:82d9 with SMTP id d9443c01a7336-2cfa6b7cf03mr13371475ad.10.1784771215025;
        Wed, 22 Jul 2026 18:46:55 -0700 (PDT)
X-Received: by 2002:a17:903:384f:b0:2cf:9c35:82d9 with SMTP id d9443c01a7336-2cfa6b7cf03mr13371095ad.10.1784771214591;
        Wed, 22 Jul 2026 18:46:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:54 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Thu, 23 Jul 2026 09:46:29 +0800
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZyYWoC/x3NwQqDMAyA4VeRnA3UqpvsVWSHalIbhHYkYwzEd
 7d4/C7/f4CxChu8mgOUf2JSckXXNrCmkDdGoWrwzj/c03sMRLgWZZMtfTEXYsNYFC3JrgHHuEx
 hWEbXUwc18lGO8r8H8/s8L/4DGhhwAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=2649;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bGlwfuxl7Ko0KTHUMFRKzd7hgfPMUkhhLFboxtPnpwY=;
 b=lNXsfr6unas8t0WGnGVH6FFRT2E2JrcFsxQ1zu/r4zI8lMZL1jtYqEJZtZ8Cic8zE9L822GMR
 thmFZsMNnodDNh2eN+6j1gPSQbHLC79KlUPQuzhK3MHc9uXMXVY2pvc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a61728f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=gXtLJ4WPg2CJrXxS_-4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: HsIKOo4rlmQdcjBZvkRF-ePJYqbMtWj3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX8TJwUd4O7d4r
 V5E3MLy9VRbwOqjWyAkLIatomnM2zHOgsBbm0UVm8MCZYtcY0rTsJbY8/egsqB1+KIfbEutpW4+
 5/GesCJ6J7vJEsA/lJhAVJBv8ctm6Mk=
X-Proofpoint-ORIG-GUID: HsIKOo4rlmQdcjBZvkRF-ePJYqbMtWj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX1sZFr+lh8vDv
 b0Q55WzeifJ0Miq0Umie1ltHI4dwBdj3hmISEMHk7DjZFHESZWjaM1mPNcuH56FXERNG1vHeMNk
 T8st6UseHDIbRbgJ/LoCOMxPyVbDjxloXptuLU5kM7RAJgPy+Gal/s7GErNy9bLRPSZuD6ZcY6P
 OOFS1KeKxHsYs3gGtFH+eaR78lI3o2aqU1N4L+KBlZ49vq63na0yZvRtFJzu84jVJSHXec/Qiwe
 ik5bPLMbJLV4Dl055I4P3qKBrKyc7srqtWk9d+1JNWYmKvmxgiFhBZeIn99B9DYpBA41D8GQ3bg
 m0gSOjtpHP4kVBgEbkPN8xFt4By7ctbfrCr7cG1N0PkW5KOsewDTTMV1y4np90/mfTYpNE1WTUy
 vpqlT/Fr2KXKjJtFDFtcWhZ0f5ApdoKadytoMRzaqMasdmmNLz5tH+IlM1LfKuX1iBkh+/HHS6+
 fMkK25Y143pNx1i5u5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

---
Changes in V4:
- fix the wrong subject for the dt-binding patch
- Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/

Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

