Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953529;
	b=QsRjfRdUFMsXcQgEeZC7LfVYiaIFqnRKZcSobUGVA2mgF//sRxrn5asckRNZ0wyKDyR7
	 hFC0RV84l+QlOt/QlmtLdkkl+XhQWYBcvzN4vg5ba2XZp9hvrr74PQsNzeWzKBvqxxYf2
	 R8N1uuh1pDrB81u9gaLd6EUkL6Skf/dD8Q8mgtLQm1ZtXByVZcZ6hZfYB90KgDiOHSwLd
	 xN8mcOP6SPcGYg7vkLwMgBCH8I1DVxLgV5yurVQAtz2ZhKnjfSmtBT5zaN3jT/tQBBnA/
	 KN/3F+ifSMiQ3bEYO2ux9jwDV4TrUJdHB4Mk8eN43oL+xMuqL6+LmYWWeaixLn+gT4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VG/P81aljIsvc9+P+5wwl0NYjMNELgd1rv4+wu05NJE=;
	b=38jF+6yinuXfsHkQsCeknLHj/1QjgIuPzWogpdIJJtQzQeym/SnV6Wwl1f6peHf71C7Q
	 8WpCqviYsqsZMtGndFVCluA3kM0QolbabfpfkIwJeXUqnxBMHO9Y+uzrOxuQynzOxx5Af
	 4C72bIy7JwAmAyMSWTrLPI1CDvADpr4bkr7IRF0SyTkhWgtXipXeumHEqth3CDWsKsUzS
	 rGHEeCIlxuR2n4gwQbcEalQV28Jyf+nuyrNqP1WFGhCq8GJ69+uvsxM+FgK6MtffYIJxg
	 840hADU06+Itz1A6PtSktF3oQkqNgxatoHj7NtoHDzOTvp5p8aaZA1Va9ZgfOz5Tv0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K6ETmfjw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVmbl3Kv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF7606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EF7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K6ETmfjw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVmbl3Kv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9bb2333816
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VG/P81aljIsvc9+P+5wwl0NYjMNELgd1rv4
	+wu05NJE=; b=K6ETmfjwuse54NTVciSqpwsNMi2WisElu36r2gO3Kmvlx7TQ3wH
	rALt4dZaWKhC4yGlQuB245QjogJMyYQaGGStl6gAuHCRyLaNRxCJrLN+sne7xBgA
	hE4f6Qadvm5iduvoNaYP+WOTWtP7P3NgkSSvHTAh4UfTZ/6wS0Uhk0UWnwpjsUbv
	JELgMMc+udyfipLrVGZ0pY6VfQhFx13o6CNUdACC/rttBh/Z/fBhHuAg32WHUFN0
	lBlU1ERhcJrqAcw2JxfKIxUa4L0pPSRJ0bipT4GwTIwtyP2Zk+3PmZd5lFvznncF
	bnoyMAfd3Mq4GwryxxZEEHM/LdxFAJ4lHfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p99x03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:25:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91e89171fabso6112906d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953527; x=1794558327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VG/P81aljIsvc9+P+5wwl0NYjMNELgd1rv4+wu05NJE=;
        b=cVmbl3KvD2CzKkKdNGrLV+KbGD9OdfWKtaF8I6ZbOnsG38h8O1LCqGZDwO8MwNdAE2
         k6Mv95zZXhPKLsTrCdfAd79yfkypmsnCVNj6m15uOSuXeZLWcQWaccNYq2ApLEIIAbTa
         1OhzpYHl5xuURmpEvwoDbsK4P8xO06ZbG0fKik5623utQHT62wtJs3BVa7aB75J0RzR7
         2EFB8YzPkw9wUDQSEzgFX9plgHdGC2PB2QkO37VBHqgulpY4IrNA1iPt/+mBObabbR9s
         hCMOmsBshlGXMu2QBs1ZrYfh6ub7LVDqMFmYQYlCzVBTEDRMEC317HT8dC061Lc2ohjf
         9FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953527; x=1794558327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VG/P81aljIsvc9+P+5wwl0NYjMNELgd1rv4+wu05NJE=;
        b=1u5hJQwbDmkIy3m9ydxZs40XDEqQln9FcMy/ObSebUuyaDMem1o+fxJDBp6BS9pTAi
         iSqrlwfTRgDI/Y7P9eO+8MMpbUcJcQmBoGoGjo8+K7XTpFMgHAnoPoEFxIEeteEPFlyw
         6eBxxb5bJF3uEDnxsKyS7EVW7xHV/Meq7tg1lwYSzo2cetx5Y5kreE0oO9QA1LUYW8rr
         AuGCPlSXRf7VwKESj1lkWG56E8LGYj1TZUS5niuY6pC32QWhc9K6NdMFt/0AapJEAZiq
         cx4IcY/eDnF7PuIZRcM99x+NPD3+h6uRDcLCS+U1+NuJlDmBK1PVwrYvmeu0VgbrkQFg
         feUg==
X-Forwarded-Encrypted: i=1; AKwUvByF/d/06UqLxI6ztTIsd2LKO6t1fwauMaOCkvrVA1kG8RWxzosEN+BVeCCf2hrH3d4CAfShdyvBpw6ixcKD@vger.kernel.org
X-Gm-Message-State: APuU4Z8CUXkWsfZcCEFt9YZiM1+vD06nptAyP9TGjniqRmapf4Qnm7Ye
	tYLGt2h5N4HwNl34yyUdxHgr7uIvEtjZ4DBV9qZIw/li3tm4yNUtQgmN6uA7Uoa3qFc7QXmRiK6
	odTk8Q4uzsWtxPcDDbOUOrh9CKGWSPTcNKHmAtnyhncq3alkXzZ3nqBbciwWeDg4yCL9Y
X-Gm-Gg: AYBFou32+o/twnYXlU89a6wDlJEzDi3XvFFSwUWjqtcaMsWc5/wrlPkRKbx439yE970
	OHcS5hwKoLXwtl4V4XsyJVv1WK/pZ6FC05Y1hLLJZ2Vr9eKgPHbRmInO9BGh9eRZNHgm9Csnlwa
	1lAM2eLRyWO2fCCvO2atEx+pjuSdqmx+p4rONbNp+V1NyAevqn4fVWxGvFq/fJzZ27tRJPPDlmY
	Lq6kzLbBKSVLVdnnZmVe75ULI83p2MSUyRKS5SNl1uBor9FPa9krQ/DCf24lJNtAXfD7KXKnqS0
	YvfYkwWovLsat2rOMGTyhOfK9Ycjicy/f+3JILXqHYAzKoiEnTGoR7JFisVjUhTy6FrvWEpgvHe
	7VeTFynPGELuQubBup70XdjlEBwaEj7x/45uMsARWI4aQviVbCnOgeTkYB5E+GyW38y1PuAhZ0g
	==
X-Received: by 2002:a05:620a:4015:b0:944:192:85ef with SMTP id af79cd13be357-945f34ef796mr273535085a.22.1793953526774;
        Fri, 06 Nov 2026 00:25:26 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:944:192:85ef with SMTP id af79cd13be357-945f34ef796mr273529285a.22.1793953525720;
        Fri, 06 Nov 2026 00:25:25 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:23 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 0/8] Add Qualcomm JPEG V4L2 encoder for SM8250 and SC7280
Date: Fri,  6 Nov 2026 10:25:14 +0200
Message-Id: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: gI3Qu5fqWDCHn8X5YXGt77JjvMvorrwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXyjUIzD3y6JND
 FfySCGP/FbsnvmCQ5TBMnjA2p+ZcS+VIW1RPNoUknX7NnO9T5/zJ01Fm3iWwfYpvejlguXua+F6
 jQU3uNMWWipol6jueyagESNcumBWMaQ9J6cUBQvzGYMdA0kel6g1Jxx70fqOp6LMx9wyhdivpgG
 HZSm4rhOwutdo946tE6jWK6QiJruc89mcVoZoXbzRHl/wtcKvl4TdRCOCu5P3zhfa+5N3H1Surf
 WCzoNcUiA7uE0A5NJ7dv36Q3XRH2+o759jYqZO+9mCmv8vtXNMMb31A6VGyXETXpSvFi99L5V7K
 9PI7PT5kXIvXr+/yeD8iKO5BaCponE3ZoofspsSIMooDaZVOwtXObWN1IaFp1PJy/87S4ApRJEE
 0yLad4QlGnwsF9cM5Xag2eHkJ+2sGVzdjfH5xItG2ZADViQe7hLwIsQKI00PreYBcFv6sAqGn7s
 0NfdMX+wh6UjVENey7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX/qi6YGduSlYt
 uD53DogcJpbvFzrJJBBevzvJtEiIkurOhrelywjhcYFGpjyaZWJmUzSKhFC3W9iLa8FVActEf4A
 ywtyjckTqePy8/XH7XAw3FwuXNDxCCs=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed8ef8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=70q_-rFcRKED9NXvpuIA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gI3Qu5fqWDCHn8X5YXGt77JjvMvorrwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

The goal is to upstream a standards-based JPEG encode path using the
V4L2 M2M framework, with DT-described hardware resources and SoC DTS
integration.

The JPEG encoder is a standalone hardware IP within the camera
subsystem. It is modelled as a peer node of CAMSS directly under the
SoC bus, with all resources self-described in its own device tree node
(power-domains, clocks, interconnects, iommus). This follows the
consensus reached in the v4 review thread (Bryan O'Donoghue, Konrad
Dybcio, Gjorgji Rosikopulos).

Supported compatibles:
- qcom,sm8250-jpeg-enc
- qcom,sc7280-jpeg-enc

Driver scope and design choices:
- uses the standard V4L2 mem2mem and vb2 framework
- the JPEG header is written by a common v4l2-jpeg helper
- all resources come from DT (clocks, interconnects, iommu,
  power-domains)
- power is managed with power-domains (SM8250: TITAN_TOP_GDSC, MX,
  MMCX; SC7280: TITAN_TOP_GDSC, CX) and the OPP framework
- the driver selects the core clock for each job from the image size;
  the OPP table votes the SoC rails and the DDR bandwidth

Note on the camera NoC AXI clock (camnoc_axi): several camera blocks
share this clock. For now there is no upstream driver that aggregates
their votes, so the driver does this: while the encoder is powered, it
sets a minimum rate on the camera NoC AXI clock source with
clk_set_rate_range(). The minimum is 300 MHz on SM8250 and 150 MHz on
SC7280, the lowest levels. Another user of the clock cannot set a lower
rate. The series does not depend on the camcc icc-clk series.

Functional validation:
- tested with v4l2-ctl and GStreamer (v4l2jpegenc) on RB5 (SM8250)
  and RB3 Gen2 (QCS6490)
- v4l2-compliance passes
- throughput and DDR traffic measured for each OPP on both boards; the
  OPP bandwidth values and the reference throughput come from these
  measurements

Known limitations:
- no scaling
- width and height must be multiples of 16
- the camera NoC AXI clock has a fixed minimum rate; its bandwidth is
  not aggregated with the other camera blocks (see the note above)

Changes since v6:

  Series:
  - Added SC7280 (Kodiak) support and RB3 Gen2.
  - Split the driver patch into media/jpeg.h constants, a common
    v4l2-jpeg header writer and the driver. (Dmitry)
  - The SoC nodes are disabled by default and enabled per board (new
    qrb5165-rb5 and qcs6490-rb3gen2 patches).
  - No dependency on the camcc icc-clk series any more.

  Binding (dt-bindings: media: qcom: Add JPEG encoder binding):
  - Added qcom,sc7280-jpeg-enc (titan_top and cx power domains).
  - New clock names: core, bus, config, camnoc_axi. (Dmitry)
  - Added the camnoc_axi_src clock.
  - SM8250 power domains: titan_top, mx, mmcx. (Dmitry)

  media/jpeg.h (media: jpeg: Add JPEG baseline and JFIF APP0 constants):
  - New patch with the standard JPEG/JFIF values. (Dmitry)

  v4l2-jpeg (media: v4l2-jpeg: Add a baseline JPEG header writer):
  - New patch with a common header writer; the qcom JFIF header code is
    removed from the driver. (Dmitry)

  Driver (media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder):
  - Added SC7280 support.
  - Power domains are attached with devm_pm_domain_attach_list(); the
    OPP table votes the SoC rails with required-opps. (Dmitry)
  - Fixed the clock/OPP order in runtime PM. (Dmitry)
  - Minimum camera NoC AXI rate with clk_set_rate_range().
  - The core clock is selected from a measured reference throughput.
  - GENMASK()/BIT() with FIELD_GET()/FIELD_PREP(). (Dmitry)
  - JFIF tables from the common V4L2 JPEG helpers. (Dmitry)
  - qcom_jenc_v420_* names; removed the qcom_jpeg_hw_ops table.
    (Dmitry)
  - Removed the custom performance controls. G/S_PARM is not used
    either; the driver selects the clock and bandwidth itself.
    (Dmitry, Gjorgji)

  DTS (arm64: dts: qcom: sm8250, kodiak):
  - required-opps on every OPP for the power domains. (Dmitry)
  - Interconnect on the mmss_noc camnoc SF path to EBI; added the
    camnoc_axi_src clock.
  - OPP bandwidth values from measured DDR traffic.
  - New kodiak node for SC7280.

Changes since v5:

  Binding (dt-bindings: media: qcom,sm8250-jpeg-enc):
  - Removed GCC_CAMERA_HF_AXI_CLK (hf_axi) clock and hf-mnoc interconnect
    path. The JPEG encoder uses only the SF CAMNOC port; the HF port is for
    real-time capture pipelines. (Loic Poulain)
  - Added RPMHPD_MMCX and RPMHPD_MX to power-domains. (bod)
  - Added power-domain-names property with entries "titan_top", "mmcx", "mx".
  - Added power-domain-names to the required list.

  DTS (arm64: dts: qcom: sm8250):
  - Removed GCC_CAMERA_HF_AXI_CLK (hf_axi) clock and hf-mnoc interconnect
    path from jpeg-encoder node. (Loic Poulain)
  - Added RPMHPD_MMCX and RPMHPD_MX to power-domains. (bod)
  - Added power-domain-names = "titan_top", "mmcx", "mx".

Changes since v4:

  Architecture:
  - Dropped patch 1/5 (devm_of_platform_populate in camss.c) entirely.
    JPEG is now a peer node of CAMSS, not a child node. (bod)
  - Dropped patch 2/5 (camss binding unevaluatedProperties). (krzk, bod)
  - Moved jpeg-encoder DTS node from camss@ to soc@ level. (bod)

  Binding (dt-bindings: media: qcom,sm8250-jpeg-enc):
  - Renamed binding file from qcom,jpeg-encoder.yaml to
    qcom,sm8250-jpeg-enc.yaml to match compatible string convention.
  - Renamed compatible from qcom,sm8250-jenc to qcom,sm8250-jpeg-enc
    for readability. (Bjorn Andersson)
  - Added power-domains property and required entry. (bod)
  - Added iommus description with SID value 0x2040 for SM8250. (bod)
  - Dropped soc{} wrapper from example; node is directly under soc. (Dmitry)
  - Added Gjorgji Rosikopulos as co-maintainer.
  - Patch order corrected: binding before driver before DTS. (krzk)

  Driver (media: qcom: jpeg):
  - Removed <linux/mod_devicetable.h> include. (Uwe Kleine-Koenig)
  - Removed dev_dbg calls from OPP clock selection path. (Dmitry)
  - Removed camss_dev field and pm_runtime_resume_and_get(camss_dev);
    PM is now managed independently via power-domains. (Dmitry)
  - Removed incorrect device_link_add() to parent; not needed in peer
    node model.
  - Moved file-local defines out of qcom_jenc_defs.h to their respective
    .c files. (Dmitry)
  - Fixed dev_pm_opp_put() placement: called before rc check. (Dmitry)
  - Replaced _DEFINE_DEV_PM_OPS() with SYSTEM_SLEEP_PM_OPS() +
    RUNTIME_PM_OPS() macros, consistent with other media drivers. (Frank Li)
  - Fixed Kconfig source order to alphabetical. (krzk)
  - Updated compatible string in driver match table to qcom,sm8250-jpeg-enc.

  DTS (arm64: dts: qcom: sm8250):
  - Added status = "disabled" to jpeg-encoder node.
  - Used 0x0 instead of bare 0 for zero cells in reg property. (Dmitry)
  - Dropped opp-peak-kBps and opp-avg-kBps from OPP table; no upstream
    aggregation mechanism available yet.

Changes since v3:

  CAMSS binding (dt-bindings: media: qcom,sm8250-camss):
  - Added as new patch 2/5; allows #address-cells, #size-cells, ranges,
    and child nodes using unevaluatedProperties: false.

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Dropped soc and camss wrapper nodes from example. (Dmitry)
  - Removed opp-level from all OPP table entries. (Dmitry)

  CAMSS (media: qcom: camss):
  - Replaced patch 1/4 with Bryan O'Donoghue's original upstream commit.

  Driver (media: qcom: jpeg):
  - Cleaned up driver patch commit. (bod)

  DTS (arm64: dts: qcom: sm8250):
  - Restored camss interconnect-names to original values.

Changes since v2:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - IOMMU stream IDs documented in binding description. (bod)
  - Dropped "Properties documented:" section from commit message. (krzk)
  - Dropped clocks minItems constraint. (krzk)
  - Renamed clock-names to match hardware signal names. (krzk)
  - Renamed interconnect-names to reflect path topology. (krzk, Dmitry)

  DTS (arm64: dts: qcom: sm8250):
  - Removed cell-index; use lowercase hex. (Dmitry)
  - Moved jpeg-encoder node into the camss block as a child node. (bod)

  Driver (media: qcom: jpeg):
  - Sort obj-y entries alphabetically in qcom/Makefile. (krzk)
  - Use devm_mutex_init() instead of mutex_init(). (Frank Li)

Changes since v1:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Removed qcm6490 and sm8550 compatible strings; SM8250 only.
  - Fixed clock-names block in the binding example.
  - Dropped reg-names: with a single reg entry it is unnecessary.
  - Removed description literal block scalar (|).
  - Dropped _clk suffix from clock-names.
  - Added iommus description in the properties section.

  Driver (media: qcom: jpeg):
  - Migrated to devm_clk_bulk_get_all().
  - Migrated to the OPP framework for clock rate management.
  - Switched to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros.
  - platform_set_drvdata() moved to immediately after allocation.
  - .pm uses pm_ptr().

Atanas Filipov (8):
  dt-bindings: media: qcom: Add JPEG encoder binding
  media: jpeg: Add JPEG baseline and JFIF APP0 constants
  media: v4l2-jpeg: Add a baseline JPEG header writer
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
  arm64: dts: qcom: kodiak: Add JPEG encoder node
  arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder

 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  |  193 +++
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |   69 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |    4 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |    4 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   74 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   15 +
 drivers/media/platform/qcom/jpeg/Makefile     |    7 +
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  375 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  122 ++
 .../media/platform/qcom/jpeg/qcom_jenc_v420.c | 1527 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v420.h |   43 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  215 +++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1176 +++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   13 +
 drivers/media/v4l2-core/v4l2-jpeg.c           |  165 ++
 include/media/jpeg.h                          |   79 +
 include/media/v4l2-jpeg.h                     |   31 +
 19 files changed, 4114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
 create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
 create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1

