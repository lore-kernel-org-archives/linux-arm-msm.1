Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660443FD32
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769584; cv=none; b=hlge2Zm09adfdqRx9P2/H638EgHTLv3+4EaH+sl7cZm19CO26bqzd0OLTkcfqLwfa3w6SZJQ7kPLx2k/wi635XOYmH8IAsiDW2GpK+/FDa6TeqTTCZ/IOkFb7ROzw654qoz3i/j4YB3p3vGL8PmwAE1VY5pn84qPRk8RizcFjtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769584; c=relaxed/simple;
	bh=WRsRiucV2U720V3z0WbxA1CeS1n7DYpjh9vQrUnbRJc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NyHYOI20h/Tg7lNiHcJNx5G2t1al9wx4qIihy2zOrZ4vHw+wt5oKsxLgpwkK9r1BV0LsLCzAo3MuPiSRQuT9S/gGwP76ASsh4ds2ivgSMI+6lwmfbLXZhWSRwya6ofTDoG9nMmpirbAzwkTzs5PqXeMilUXBC3nvjNDxJJCSZ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am1B1pGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPcaf5o3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am1B1pGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPcaf5o3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777vgT3686826
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 08:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ibxb+Q3FfqwugpDb3vLbkt
	1RoFpIRGq+fnKvNs5nEBE=; b=am1B1pGKdXwVUKUXROqOLPUUjKk/HOjxYG/WVs
	goVRRTEmsffg/L/+IaLpV8rnCcnIUvkZPLpP70hUHxuEHD3bc/GlPOsV91rT5+Jq
	OQ8MzhKmRW6o9iiawFRyES7xk1ycE7Uii2i8uknSgOXg7k6IUg0eWgtL+eNC4DV3
	1uP71l3K/UkDmBkwy2oriErFKYFb5PkTOJgkrgiqK2za0qf1JwL88CwA7n/zwwTL
	AUyKl2E/0lK4dk7udEnMPQlhz8RyJ+vV/a6n1+blETauPtOfBftlqVKqfFLDcSWy
	3Epp/6i6w55cwrPBmnKYE7THSZHoCXCtPvR9NFAm5DreeaZg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga3762yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 08:26:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3887066a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788769581; x=1789374381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ibxb+Q3FfqwugpDb3vLbkt1RoFpIRGq+fnKvNs5nEBE=;
        b=MPcaf5o3JY7cz5H4rzIyQm5Qzcr1iC2VW+95OhaP6Cpuj7v+wVlxO++tzFK4H2/0uy
         jHB57M72OHFUYwzSSB5R/RRgF0/wSFRX7OJrYLPlCUl7nwsrc9g3AFcBLbjhulsLssCM
         Aw0GyP6LJgk0i4geqtTZpqJYJKab098SexKtJXgJHZkOGxlJnHBlDOsJj4+hpOOnRTHt
         8f2KyNFBDw1B6wDeKRfsluEwR8Ppswa+Nixji6fX26Ba4ao1uu5/ZqFiiQ6eAg3XFNCx
         ZgJPDZlRMm1p77REOsNxb0c6HbljLqP8Ph2N3MxTFUfvIPzgQclLT+cthcmbs7QV1BUg
         t8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769581; x=1789374381;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ibxb+Q3FfqwugpDb3vLbkt1RoFpIRGq+fnKvNs5nEBE=;
        b=Dm8SnU0xPxoZvkN7ZR+pbVWDLhtj2flUIFxjggA4aSgwQ1cg4awQNNXGpIlOFXqG3j
         bCZZ7j6RNcvLMxU1QZxTVKESfJtWUufFLbW1DxMXIUymtWb1F9ZT+HeB2OEm+xKN6H/t
         tRBPLHFzVyjxtcMtkU3KVG4f7N78OmPK+6CbRHl590PB0aC/7sGQTAJAC/X5u57tNPu6
         w7QcoDRU9nJ7Ru/Xj2QxjnXJpYbYOyW/ywortUG2NhszLtGs+Tbs1Pr6iWGhdxQ2lpfZ
         iNFsMkLsxoU9WiE4ZnTZw5QZ+rm1CA0C2Wk1cf60b8EPswvWueL762EmzHgmu3G4pIyq
         /igA==
X-Forwarded-Encrypted: i=1; AKwUvBzxAHCx+6FHK6NTKF4XZuLgSQddTbxBi53K8J745gq6fri5HSvlPPFEimY6de//Eg4P7XhotRJPfpFCblGF@vger.kernel.org
X-Gm-Message-State: AFuF++nFZDUXTvzsBOuVo4LiDe8CZ53PG0g1hGHLPS8Py1KA8CzRwG7S
	2ChbqC+Iyx7cnRsK1l3Qzv+VVPNTLJvMRy0zC4sO9Ab9Yy+dpfO7q1FXm3vV3/cSe4kCdwNqiqb
	Eyel+qADeCOmvSr+SdIkje2zBPlOF6jiLpoEsztD+72Rbmz2F6W+YCCZs0CHJhNunOFpa
X-Gm-Gg: AYBFou1iF6H0N3Ur3Rv46yC0qBED2qG2HzjAUR/9dgYPv++gkAVeA4+qK54snipa27h
	Qa45Hi6vdu57T0c4ANac9TkyCtE2CQRQa9Nblxpxr7BOsc5KiRRlU/SA5B9tgWsiD8EXTV6u0KG
	2vycNtjU36RdkNE9U+56kTimaIRTE3C1TPLfRTHPDw3lj6jZzmVPnN4Kuc55xQNjNob2eOXc4jh
	A5CBv/XRgZQoEuG7+CoUIKYTFBZgG63WQHrzFNwzuz3CLu2eFi4nMHduxXZJ6N+SaXaBlLZdL8R
	A+1Gf4MzsGailJ+dqQuHd7u1vSkWOPD3w4CLYXPhTAXJ0Rw13erHHzU7pEdEn1Il0Cm0dM8XUEL
	Z1lMEZvtsyuQTCF+U+rHDTFdC
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31098445637.4.1788769580622;
        Mon, 07 Sep 2026 01:26:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr31098420637.4.1788769580163;
        Mon, 07 Sep 2026 01:26:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm3423284eec.14.2026.09.07.01.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:26:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
Date: Mon, 07 Sep 2026 13:56:12 +0530
Message-Id: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACR1nmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3bz8opTi+JSCogpdEyA/xTwxOdnCxFAJqKGgKDUtswJsWHRsbS0
 A1/qXEVwAAAA=
X-Change-ID: 20260903-nords_dprx-4903d7acc841
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: Sx1XhaW74VwB_uGCwScAoL0B8I804gN_
X-Proofpoint-ORIG-GUID: Sx1XhaW74VwB_uGCwScAoL0B8I804gN_
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e752d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lgvwsS_33UyABBN7wXAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX4+A+262C2UjG
 ENJVPDRnzuMQ2RnmjnkJTzPNVxuzKbRpB3QTlmDPVBgDvvGHRhhbI6cpnoOaJPC9bFhtsgesJFJ
 Pd05iz/KkG7+GLm27I+nLE+C+VbpyAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MCBTYWx0ZWRfX0NzPjDnfUDGW
 EwfT0i7orTEm7WHtusGdzL2aJWMtk9vqLMP4Kp3MUR2txAldqJBd5XB6lY5QdJXsaDNc91E2tg9
 sAXqsHX20aHYHqDF35JMqBPpZgnL4k1qSO1lfVqU5J7QqDbvP8tDMzIwlBz4Yac3fafNhMSnnH2
 Z/tNg/hQ20MTJV+fO6SMsXlBv48S03Xa5HUV0QBwfePYElovAZk4Rv3s1bSEpQuJTXq+0ibTsgq
 cYhVoqjWas288G7FlUiXEnUpcYJRruoGep8w1uoPcZuKzAw7oCIAocTtzXYu+klnslaP9k+eFbR
 t710xZ2Ct3J834UwaXvRmQLqek+p3kFJjSNYfqPrvFoJBmdUsoj11xxdOQ/hvVOjpfZxBNZl22E
 xEtSrza24vZlG2CR+vORb0sY8jcEOWRupdPmQcnXOVqeoG1aWeeYcBqcjQtYam2qwq60s9oDqRe
 piGfFApP96oU741x1KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070090

Add support for the DisplayPort Receiver (DPRX) clock controllers found
on Qualcomm Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with their core PLLs.

The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
been widened to 28 bits to carry the fractional word at a finer
resolution. The existing alpha-PLL core derives the ALPHA_VAL width
solely from the register-map layout and can only express 16 or 40 bits,
so the first patch adds an optional per-PLL alpha_width override that,
when set, feeds the recalc_rate/round_rate scaling and the Zonda
set_rate L-adjust MSB check. This is a prerequisite for the DPRX PLLs to
lock to and report the correct rate.

The series is organised as follows:

  - Patch 1 - alpha-PLL 28-bit ALPHA_VAL width.
  - Patch 2 - documents the Nord DPRX clock controller device tree
    bindings.
  - Patch 3 - adds the two DPRX clock controller drivers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
      dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
      clk: qcom: dprxcc: Add Nord DPRX clock controller support

 .../bindings/clock/qcom,nord-dprxcc.yaml           |  68 ++++
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   7 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/dprxcc0-nord.c                    | 436 +++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c                    | 436 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-dprxcc.h       |  27 ++
 8 files changed, 986 insertions(+), 3 deletions(-)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260903-nords_dprx-4903d7acc841

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

