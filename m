Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612740;
	b=vOU88ZrKelvFUbYaflOctc+fSuMsRKPqwCEZYGOingVLprIoLZhR8h50hSE5DC2oVPIw
	 N28UEFpnzOHj4ExS5IasFIdjoFz3ZrIaYbez+BYbZKDKYB+5fH8PD0OQ1dEokmBGlwOdf
	 d/Rx8iJEZIKyvjFvyWofPevcfjFPvSW6wFs0F0IMnESW2iu2W11pr8WMV23rDBV2LdSuj
	 CaQlvFBLV4RqdHIUjjVjC5Dmtr4379txmrXKGKYqqpW/7Tj78Da3ZfVTG+zlQpEajsa5i
	 1XBfS95Y9ktfPGWsiRdqcVHtA3PkqPmBjKe1gfM+nwhwJHUOYLdafvJZJs82XWE7yZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
	b=OOEzgCGlrZW87NNu5WSFy3qkvrwR3WOG1AxNdlcpS4lCTpZYC/IEFkby8lCiWYCPepjz
	 yDo8VVenWdxpEvoJuxwN48EDZIzg4sf7gy9j5FoQTWII0CoIvkYHgzq5qUM42/WkQan92
	 3TVZH6VmgIAjdd9MAnU0TgOcPCoXkIXqqSwgHEgSExGZmgSXSv8fK2/+1quDje6QFgRRJ
	 vLNkoDlL6X6qNt573cmD+KqSqlxK4Ebw0tbFyb6QjoEvOwzVaWtIiYMCFwlRy+dFJYnTb
	 1Zi33huQkT99X5cZZ741Usq07ug559HL7/CibLR+VXjCiUeGqZhyPgPPkboSIw0+yGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFMdSavS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bi4OCm6P;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B4D606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B4D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iFMdSavS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bi4OCm6P
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNgM555513
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4
	vVjC8WUg=; b=iFMdSavSoklC8ZWJzQs3vecWrTqmuWKu3WWcfvYnOuo9Ehf2OcR
	gSyIZ7aNh9JrBsYngVKO6Cr2ZFU5uoUW64X1TpHqbbVbOU4IBHckTNIrCBjj9xAq
	QoK3K4Q6jUyNHuWvDT1/3A4XhHy+LeSeya3MlsTzxpu9dWT32UNHZ/B2yEVQ1Gdy
	iOhOpmYdki1tf1tQJbcKdXJEqSlSsk33AZtNu0gjjkxPCyByT+dVA9ahbyCvGitS
	U/zwzC8C6CqtGhK04GVXYuDTv/evPkqQdZLNGFOwPFzAde0KKgcX+MxASapRpnA1
	u7+6fjbsBELWfBw0xojIfeE4pVBT2sSzKEQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnryad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99081ea787eso3444674241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612738; x=1796217538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
        b=Bi4OCm6PpuK8XYxEvgMgwQCadfVN+EY+7QpLd3ORtXcMmxbAg0/cRSVUjK1nT4IzjF
         9EsyhTvOK2piA3K0+OhVy66hv/0aaRi+3l0YYOdeeORwEuiEFZJyKkyQY5qmmLq9eEDt
         /sFduekv0N9mHXe+flPAtRslfEOu2f722++xqlZ2m4JQtq87vL8iYuCp/bGtCMaZMvKg
         STbxKCuO2g/EtHJmzCNhsk5+QARTK+iqSMfJ2lDse3FiY8eiLOgN05UNXd0tpkA3xhTn
         hzg/crGAfimg9oTveF/8qKgV43HzELshgNLMDAJWWMVncv1UPX10wmdXoComwLM4myIF
         OOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612739; x=1796217539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0ooHOIdzseAgTBm3ZwB4VCQg1gdMWvjZh4vVjC8WUg=;
        b=xclxSaSB/3Onnk2xbKxJT3NSuuJfTrsG/Cs6f121dnmCv8kHlM6otcKFAZoAKKJRbv
         xl/g8dSJy9btcV3tW6xl3S50ZS+ltLq8ox+gQ3B+2qHRnHQi5V4bLpYuVb45Bd7I8wPG
         4e4ktrDxUM8r7Sy3h6xZIIA7vhsOvASODCppjmw8rtPeq7KfxGz7olDosGuVdqB5x4U6
         UA3T4DziL+qR+fOHUow/jPmrAlxxktQ9bBbP2Ay7cSDVHDDu2DR5x3lmsKeLrOL0DOVN
         A7krZvhGJrQF9lodLrg5vxTzfs6dbl5lrLQBa5LWnGb3N9/qVswUjegsTWx402TArHF3
         5smg==
X-Forwarded-Encrypted: i=1; AL+hErGHMeoeS2GpxzghA2nBR7ZRD09J31u9532GSAFAmeDDrboyP/RAi+zB1+Y1KZ4jKEFiT7Am04efWgJ+BVcC@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vpoz99XPZoqOwHiwrG33f9qOlkGmSvv2cS5WWxNiK5TN4tQyJ
	6cog0co1mR8oe5n1wCvjQpWsIb2bVERjYx3ejEpdMSz2fwpNU35bp3jgztEm2TAe9EaKhv+n1MY
	u/t61BGe3IsqTfWdGz3wgXRuxrZE68hERQ8gZL2owStDmwCqUoYLlyhBGrUemLvbmWtOh
X-Gm-Gg: AZFdTZe+BGttXNkFdQ5fcke9Oji3nilYXNTt8X2LYSJuvfozSVzcFMre2E+GZ0tzbfz
	pZ/Rxv+fsJmo6hPgk29NIdTv/ROWGXLk800UmKFtQU4YU/61FTL3a83FFBltVbcFuzr0qfdUjHC
	OyId7Kiq1dI+IXL01bsbGib3aN2DKnRFOZqFg9KESr//Rn12HzETBa8/Z5QEBbNIn2sodi+LSFr
	Zpho/BJT6oD6kG5hxDD0hh4skgx9LIL/pVEBNtSuSfh5gqC76cuBnNR2KGjMAV8ziSK7GWcnOdL
	VJ7DFHqbj5sI9lHKQMswOkWn92ugdz6mhouEbHE53LbH0aBFdl/PkGL7VGjzV8LyKHXwVDcD7f/
	5ulKH9usfbzzCT5jJ1iyJMQ0pmS2O6PHfnXiYh75wy+XVzNdn7YwcT1o0KC0VZA1w
X-Received: by 2002:a05:6122:4fa0:b0:5ee:48a1:7a4b with SMTP id 71dfb90a1353d-5ee8afe028cmr9900481e0c.23.1795612720389;
        Wed, 25 Nov 2026 05:18:40 -0800 (PST)
X-Received: by 2002:a05:6122:4fa0:b0:5ee:48a1:7a4b with SMTP id 71dfb90a1353d-5ee8afe028cmr9898738e0c.23.1795612696151;
        Wed, 25 Nov 2026 05:18:16 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:14 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 0/4] clk: qcom: Add LPASS clock controllers for Glymur
Date: Wed, 25 Nov 2026 13:17:53 +0000
Message-ID: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX8subIYVDFbRy
 HUCThY35pBCUza1W6H0cFSzCFtqd/4orrkaa9vFwQF6EN195DIqIbCGPi4/Xo75FM8hK7BJaK9b
 beuKOvgCl84WnAPHeeBK8brfP88J4XOEsLFDzdRbyXIoEHFZwh61wOfV7qbhDVv3d4aijjDsVq4
 RPF21v4dzJeNzG1amGPvsDUlVj59aI8tZ8xFFxTHqASDi8Y6p/g1MOV62ux3ZbG5FhEEhA0OfSf
 YPAEQr9VRFnt5jcneCiQmP8BTM/SYkxIXx/8SlvoDf9jggogcF0FPjQ4AXeihBDCCAVJcqkr2VK
 HO3kBy2d3EHeDQ2l5gRxIzXUp1Awjf2Yr3/cuWFcUoZ0T2tppdmhTD0QwejWi1mG5cHbO6VKNkR
 bgroKnXRkMdlwyS0Fn6H1GkXkTY+H35tr2b6rvz1fOel5Yzyo0QfOcAtgCP82uxy1Af+o5pG4AK
 nGZvWhecw5xE4pfyB6w==
X-Proofpoint-ORIG-GUID: OH2rod_sp6KbmbnDiH4wpWCLDmXd99Yp
X-Proofpoint-GUID: OH2rod_sp6KbmbnDiH4wpWCLDmXd99Yp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfXyRIK76azOTKL
 kWtCvY4x/i5vLPPUJjdgVEWwr8OzmueCgl2aSkiVExKnsR652KRlZB5fMvJbijimOkZzFKv3gRn
 4xP2z2CTm3UDbuaUxY6lZNcQtf3YWfI=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e043 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tj6v_WFbzlxhzRuvkX0A:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

This series adds the two LPASS clock controllers found on Glymur:
LPASS AUDIOCC (SoundWire RX and WSA1..4 resets) and LPASSCC (the TX
SoundWire reset). Q6DSP owns most LPASS clocks via Q6PRM, so only
resets are exposed here -- enough for the LPASS audio macros and the
SoundWire compute-mode controller to leave reset.

The programming model is a near-exact match for the existing SC8280XP
controllers, so patches 1 and 2 extend qcom,sc8280xp-lpasscc.yaml with
the two Glymur compatibles instead of creating a new YAML file (per
Krzysztof's v1 review).

Changes in v4:
- 1/4, 2/4: add "qcom:" to the subject (Rob).
- 1/4: pick up Reviewed-by from Rob.
- 2/4: pick up Acked-by from Rob.

Changes in v3:
- 1/4, 2/4: extend the existing qcom,sc8280xp-lpasscc.yaml with the
            Glymur compatibles rather than adding a new YAML file;
            drop qcom,glymur-lpasscc.yaml; update title / description
            / See-also (Krzysztof, v1).
- 3/4: bump max_register to 0x3020 to cover the WSA3 / WSA4 reset
       offsets at 0x300c / 0x301c (Konrad, sashiko-bot).
- 3/4, 4/4: pick up Reviewed-by from Taniya and Konrad.

Changes in v2:
- 3/4: drop <linux/mod_devicetable.h> and <linux/of.h>, switch probe
       to device_get_match_data(), lower-case reset offsets (Taniya).
- 3/4, 4/4: pick up Reviewed-by from Abel.

v3: https://lore.kernel.org/all/20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com
v2: https://lore.kernel.org/all/20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (4):
  dt-bindings: clock: qcom: Add LPASS AUDIOCC reset controller for
    Glymur
  dt-bindings: clock: qcom: Add LPASSCC reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml |  7 +-
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 89 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h


base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
-- 
2.53.0

