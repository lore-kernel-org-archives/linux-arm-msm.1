Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD420364022
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890518; cv=none; b=IP/z6jecCWisML1KiICvnX3zMv/PyHyeX2FsJkfS+tVS23G7dItMmFmY0m8MgrrOVokrqPEEkeTjQc60D4oavI52LnWoQOCsL1F5q81WwBLiTjxWYYpe8XLyQgi/fjhJd3kxBvXokKiWxclUihjhAyNoUxbBarGKQiMEcGiKC24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890518; c=relaxed/simple;
	bh=8iSjo6XwHW+3iMcgE3t1IV87hUjtmnhdrqErBb55VUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jMPdKeJhYt1j2aiHlFRqfmlnoDlHZffe2VY3BBaTZxcd0fo3yaXAKKHGqtDxsBv29GrCODw77ZcNqYaW+qmmtMdSUkueba2p00FxY1FJ/n+Hr5xnpORGxO4kM3Cb+zCf9XWKD0K8ecYgfcNdrtvveqOdHGMwhc8eSwA5QsoEiSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B28n/CnD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpONIBlz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B28n/CnD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpONIBlz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADeoi2629861
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sds2CZkxIDlesBTkhv2jGp
	HslDQ6Nba5/qsQhGuCRsw=; b=B28n/CnDh5UxkbHO8/m6uPAkSHs4HBq5f/K3k/
	oZ+LzPAFoXJpPWlpQwzt7LCEQzP17swhFn3bMV2kU2QH7GcBVWV3hPQm5xLiShlx
	OdUqMrnz/IIAfLvyHuWSFlnC72pISOSA5DwrdbdB8HeLtavjkn7REa1WQkZEhIao
	NxxLPt7D760mXdFxzQSX3fsDApHm3er6hhQNb4B52n6BYZW/EMWXSX5Om1/VNCu+
	tlF6OwZitkkQ8OAMq/AUPiKDesO6D7Ui6sFhmlBbvjr/SjFKxPsscv/LvnfJHlGn
	sf3PFvgCSfnB0fqa5KxprUPJwcMD3/L/1Q9csHF/CBE1EIZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em98t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:55:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so6261905ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890515; x=1785495315; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sds2CZkxIDlesBTkhv2jGpHslDQ6Nba5/qsQhGuCRsw=;
        b=jpONIBlzvtaDvSizVDRlUd43IO7icKbTS0iQAwMbsc/qzP1u12QTl0o5YOIMDlNER7
         t1VlXGYCTobO/yiGSq9t/NtiYX0mw2f67eHQIdXozwIVcldbCpMwpNh/amm71xBQGe5l
         Tfl4b8BeqkX/XDNrt6qB5wLMqhg2VsxEBRzb6wzp32YLHaarhGtpgrWIjaEtRQuv4isz
         eX1xr+xw8OqPyZ37oE84zkT6ZHYSTiSLQ5SIFroDBpkqJaPZR130SA9Ic2vcU+egy7fj
         zwGvXPMN39SfVa9o6selL4wmC8bHIkfpUQmu8NpJ4RxniXjIURdK4TB60OTNTDpKy0DK
         F9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890515; x=1785495315;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sds2CZkxIDlesBTkhv2jGpHslDQ6Nba5/qsQhGuCRsw=;
        b=ocuwKrRorEqWFOQRrliJ5LyKIIaeiTXyC6MgFBoKqivH8SNYj7Bi/+VkTMCfhnGNfE
         6pShBFKXL7TO4VNQWcga8GKlaCVUpY25F4Jj88/APsmu3mMy07vbx32g4teMeJgPCpri
         uS4b3vCtIQ+Zx7VblM2xQs9MOqfvT8Zz4F/Bt/HtmyP3AaLJTtBWu63SWJgoGhXyTLW+
         OUyDAs9zy7X7Zb0PCSD0X4uZ/8F/FoFMTAd2HfEGe+r9DZyZ+UhCJ4U1W1TzhXcQ/zPR
         y5EsVl8Ybumt2v1ygjoawAa4I7dfxmSUvAYxeUz7FEWPS798C62udnyEEFGx5U8uv3qg
         I5AA==
X-Forwarded-Encrypted: i=1; AHgh+RqqgFYEDBRMwAahT58lziqI91jDhRaIcJofSpZUjRlYla6YbwjCD0APcFm1OHokIgdeYFqtzE0TVog0gvMu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8dcTC1wydhTeYT2DEcFUeyrzkzVh5UpRdvUsx9u568QrkxZu8
	twWPNrFGn8Cz00lhQrTnPaVsIQOnzgPrtdt0q9LU0Yi/+ODsS58obVNQMdnLX8992BsBVhe8zDm
	RciJmQUrmIjM0L552u0Webr5gdqhHZovjX26a6HOSQS/T9a5DUPAkAAH09ZZd9CtpvZU+
X-Gm-Gg: AR+sD13h2NNmeXATYYbsq+HWxmyny2+d2pfZYWckdKI0QeIsZDjuuc8T2fIXnZstXX+
	F4vMdWRpTizysml4wtewYebvsg9uoa1S9fqGw48HuoIqAb82+KdTtQAFnpAOmGovDdwqjJHjxnE
	Ji9hLuHpdmue/GhSACzrkE0NQDP0E6w7actLBWi7sNgg0PnU17EjF8u0hehxXfZ6kBX2z7VuD9N
	ezi+0DwO593SzA9Pot7bBU34XHh8YNdryVa5tJf1W45h9xrv3AcNEIwNYTfnbLQEu3u7vOBJ9tv
	RXXLyy+XJ9XdJL8bMLj2tfklRaTDk1RJTkw3bnSbVGKmZI+6+d5DRE2K2n7JzCU9tfHZDrgSzx7
	sgk0TvnImlFzSH6BF++nWHZ/M
X-Received: by 2002:a17:903:41ce:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2cfa7435a14mr75830095ad.15.1784890515108;
        Fri, 24 Jul 2026 03:55:15 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2cfa7435a14mr75829745ad.15.1784890514652;
        Fri, 24 Jul 2026 03:55:14 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm49314775ad.55.2026.07.24.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:55:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/6] clk: qcom: Add Nord multimedia clock controller
 support
Date: Fri, 24 Jul 2026 16:25:04 +0530
Message-Id: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhEY2oC/23M4QrCIBDA8VcZfs6hN3Vbn3qPiGHTNSG1tKQYe
 /fcIGIQHAf/g/tNKOpgdET7YkJBJxONdzmqXYH6UbqLxkblRkBAEAEEOx9U7KztEsXtuVaKDS0
 ooVD+uAU9mNeqHU+5RxMfPrxXPNHl+nWqjZOH4EaQvmG8ahvCDj7G8v6U195bW+aFFi7Bj6iBb
 gnIBK01l4xxySn8IeZ5/gAOJDow8AAAAA==
X-Change-ID: 20260620-nords_mm_v1-9b7dd4f92d6d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfXyg5OAoNFXOFJ
 w3mLMe5M/YfSgWf9cNX01mBIgNOu6Qqhfmhj1LhYuFWKvqRDkIuyqER7HraefU1tOnsuWydhr0x
 b55SY+g6RQmtfHL9C/RrCXpLyvTwkv8=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a634493 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vI_4KLquzuGg7hnt8WQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: uwO7l2foZpaOZzZzbxxRH7UNSgOG5LU8
X-Proofpoint-GUID: uwO7l2foZpaOZzZzbxxRH7UNSgOG5LU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX41xy5AclGxne
 QOKBSJGe4y91LOnlTPer3MWdpcBe1z9t+/hsflyalyC854gReBAJTH3cr/3VZRVAVL6Ua8w/nPf
 rDFY9kKl2aHo2bxR1ygOdb8Vrwa+6rdHDIb1yTnhGRl4y36U5yw1hSpxD/mEQWLx2yGfCyFxH6S
 l42NOINmSekSqLP/d8ZWlor7iQBXAxEaNrcuR0q2gzAuxylfWWV2VxhAEatz7owOVQtGybId/jZ
 /choHVQHEm2nGvB7ZPupo0MFtdNl5srUc66yr+JjhcHGZMGUKOfqQwGNmlex4T/EQqKs4nvYVLF
 PrLby1AXBp/L8ZvapUrX+IeTajf3HvkOb1BuJuT5K5A0/YgTiwR7gC2BR1PMH4xEodmjdJd7uNF
 HGG2eR5enEljgBf/d+BY/HkkAh4Hkol7Igkd9qyLmEjmDrJNU+Yd7UiTxtMC+0PvW3+75Flh0vN
 1PewtfPc3jV/YA+VKJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240099

This series adds clock controller support for the multimedia subsystems
on the Qualcomm Nord SoC platform, along with two fixes for always-on
clocks that were incorrectly exposed as controllable branches.

The Nord platform is a multi-cluster SoC that includes dedicated clock
controllers for the display and graphics subsystems. This series adds:

  - DT bindings and driver support for the two display clock controller
    instances (DISPCC_0 and DISPCC_1).
  - DT bindings and driver support for the two GPU clock controller
    instances (GPUCC and GPU2CC).
  - A fix for the GCC-Nord driver to mark PCIe link AHB and XO clocks
    as critical CBCRs instead of gatable clk_branch instances.
  - A fix for the NEGCC-Nord driver to mark the GPU2 CFG clock as a
    critical CBCR instead of a controllable clk_branch.

The two fix patches carry Fixes: tags pointing to the original Nord GCC
commit and are candidates for stable backport.

Changes in v3:
 - Documented the qcom,nord-gpu2cc.h dt-bindings header reference in
   qcom,sm8450-gpucc.yaml (was missing from the "description" list).
 - Fixed the critical CBCR comments in dispcc0-nord.c to correctly read
   MDSS_DISP_CC_RSCC_AHB_CLK and MDSS_DISP_CC_RSCC_VSYNC_CLK instead of
   the non-RSCC names.
 - Picked up Reviewed-by tags from Alexandre Mergnat, Krzysztof Kozlowski,
   and Shawn Guo.
 - Link to v2: https://lore.kernel.org/r/20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com

Changes in v2:
 - Split the GPU2CC-specific clock and reset IDs (MND1X_1_GFX3D_CLK,
   FF_BCR, GMU_BCR) out of the shared qcom,nord-gpucc.h dt-bindings
   header into a new qcom,nord-gpu2cc.h header, since GPUCC and GPU2CC
   are separate DT nodes with independent ID namespaces.
 - Updated qcom,nord-dispcc.h comments to reflect that the header now
   covers both the DISPCC_0 and DISPCC_1 instances.
 - Dropped unnecessary <linux/mod_devicetable.h> and <linux/of.h>
   includes from dispcc0-nord.c, dispcc1-nord.c, gpucc-nord.c, and
   gpu2cc-nord.c.
 - Link to v1: https://lore.kernel.org/r/20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (6):
      clk: qcom: gcc-nord: mark PCIe link clocks as critical
      clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
      dt-bindings: clock: qcom: Document Nord display clock controller
      clk: qcom: Add Nord display clock controller support
      dt-bindings: clock: qcom: Document Nord GPU clock controllers
      clk: qcom: gpucc: Add Nord graphics clock controller support

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    4 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    3 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/dispcc0-nord.c                    | 2004 ++++++++++++++++++++
 drivers/clk/qcom/dispcc1-nord.c                    | 2004 ++++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |   37 +-
 drivers/clk/qcom/gpu2cc-nord.c                     |  545 ++++++
 drivers/clk/qcom/gpucc-nord.c                      |  593 ++++++
 drivers/clk/qcom/negcc-nord.c                      |   22 +-
 include/dt-bindings/clock/qcom,nord-dispcc.h       |  115 ++
 include/dt-bindings/clock/qcom,nord-gpu2cc.h       |   47 +
 include/dt-bindings/clock/qcom,nord-gpucc.h        |   48 +
 13 files changed, 5400 insertions(+), 46 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260620-nords_mm_v1-9b7dd4f92d6d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

