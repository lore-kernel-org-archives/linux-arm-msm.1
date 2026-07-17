Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0333C0A1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273532; cv=none; b=rZ7mcDcs15HNK+YEgFf78rUHh/OGQ0lvYkYBGKA4ReRwpiuBbMMeey37wc6F8yr+sZ4sauKNnjR4i7EIv94P50qBGgWj1PoTcz/lLOAhoI6T/xMdkJy6UDJ6GI6JHTHa/o9p9hI5ptPUzTUx+2yFDqkfNSDv8QMOvpGg8ES0meY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273532; c=relaxed/simple;
	bh=/blHfR12euFXpMvDmiOiktkEDJghmhI4AR6U2S3gjoA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ebxtO7o9y6APEsR9IBzAM8SdyGTuqiTRhcy3AfkRu1lCP7y9KxZMeqsWyqTkfdCL+6bRVRAzjDYLrqahhue6CfHQQD3Ore6klqfoeljfZ3Umj8K5tZ2dSx5wpQUfTGqNsKozA+sNJVSH1mNHyAhRCD3E6GHUTbImtLW6WFEhZxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnTGWMS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajRtKUsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnTGWMS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajRtKUsV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ci5W1078396
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hJ2+RsjIu1eHK3Gfe9Whoy
	COoyu0fRnru2GWuIngT/k=; b=bnTGWMS5RWeZ/AFSSYaHklNPHV99mFQNQoOI4z
	jV/mcWRp5hOUlz8KOOHdXIfQBAriVOtYJHnLlfkAB+LrGID79YFm1sL/Hv8yql0d
	plZEKzOcZvO16b7KcCExc46d4o5yBIvOnbSuPQRbDL5wUCS8R8thYTTtex/zdvf2
	11KcDOL/K4zgPq9CyS451XPIu5x/yCk1j3wnLCP93uXFM+fbUhvHAyNneFiu9frw
	HtnXj1YtiEk3URujtb8bldj4pwJY/iqSwGl/0kk3kOubaB+BFCJ/wpQzRImMq6JG
	RY9zYHMwj23OLM8IyC2LEHDFUNhpso5JACWt4Ky2fk1T2Nhw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1byhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:31:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so143918435ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273517; x=1784878317; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hJ2+RsjIu1eHK3Gfe9WhoyCOoyu0fRnru2GWuIngT/k=;
        b=ajRtKUsVsuORnUxTmVoeOYkvRY1GLV8nyiaT7NkUR+2paFIMENn1Z/JRP5uFyMDopi
         O7bYa/pEPneM/VlGR2JLyLGBkYPvnrGnu1w8DjXx9bw5djKv5aKdJcofxqz/9E8VpFgv
         BfaSJxsSIENnhBvn5Ej5Z17cIZDZ58bQ57mhqWw/KT2dAyHIxJ0kQQRyCgwpHLwIMK93
         jiUZhWYuFQrmd/X8OoFlwX9e0CrnHnHtBO4evCCf+kNqN3/9xg7HBGh3WWQaGVXYlVKl
         1y9gLKGHRibfOymyqFwZXRxCYPxCF17Ik/SmdsTlCQEE3+Kx3F2/orDtbcuJOsHvVGpX
         FFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273517; x=1784878317;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hJ2+RsjIu1eHK3Gfe9WhoyCOoyu0fRnru2GWuIngT/k=;
        b=flwSVOkrQPqbzVzNQE3l/srKclVy6ch3adzhe7ncd8gOcv0mfM/TAIuj+Jkwr87xpm
         J2SawRA3Mzpvs2nmKXhwKciEChy9FSazMdl2NK5OcvLSdT13M5zSaa4tSZ9wPW1HlpLw
         8BSw1qj/HuqHkdcovYkVd/jyvDWjhbPnWWi7zhXEVQ8VnqxOOf1tA4PGj2b69+k1wwXF
         iyCIXLX9ATZPXzTqrC12OnmEZluNyQj/VIu95SyR7e4ir/ObYsY9z2ObC4QIRssmBMLi
         18rDBlv+D5p5PH1H611+RsQ3+WoBRspc1D5KZd9gQxsyPabiQ202gqIi76fV2McgGrFQ
         ehsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrv5/UQNFSf77o6QsafODe5Z0GJAxBi7LTAxiY/Qs8AadtfqNzKPAEqeRCBLQKagrlwakbVk6nKMyA/OCWg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwp3f0sX6x1Mf6E39V8l0CytlzZ4xyz8nXXCvltD5gezWgY4ve
	mKdIIXY5bHN3kVLBHuxR+Adcgr8w0x3oBmbPxyjnl4spEQgaSSCm/kGdufcPmfQkZ5/2akgserS
	1j5JicTvjJFxPiD0gi2hiFIng3FYrnH08M+4wvv3rPxGd0+V+zHDC6WHYQSdGaOIzzfN2
X-Gm-Gg: AfdE7cnq7TrX8hbfBMxLvuEL0rG3x44JFeotGULvnP6RyFr4D2/5u1HhW4XVtsNkypR
	Ri4i/MbcY6V5p9bNEiP2A7vDD2IJYG6B+wksy+P3oCfx6+ZIjTBrvKp1GFez526K5zFmNUt91s+
	1/kFCEd3dB19kRaO4HjaGxOwNeUJmuKgWSUISTQupycqpbIj0Qo5dcoyHtFjjbMm9af43m6P5Xl
	wtP0U4u0AKvZtovWZ0PZEPG1oXoMmE95tB4paYakJJfCuQL2DcCYwSMz5vmDQMbx6Hc0up1/Jga
	1noLnd7UkCHH5Qf36KtJyjjGAd2X8pI5PaP+8S10OD5AyisDW7gXZUc3HrS0agyjV1CU8Vp1/+U
	BgC7dA09qynXPQJdmPCNAUFBp
X-Received: by 2002:a17:902:ef01:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cf349aa87emr17541585ad.34.1784273516597;
        Fri, 17 Jul 2026 00:31:56 -0700 (PDT)
X-Received: by 2002:a17:902:ef01:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2cf349aa87emr17541225ad.34.1784273516079;
        Fri, 17 Jul 2026 00:31:56 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:31:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v8 00/10] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Fri, 17 Jul 2026 13:01:44 +0530
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDaWWoC/33N0QqDIBQG4FcJr2dYmeau9h5jhOlpCZmbbrIte
 vdZN7uJweHA/8P5zowCeAMBHbMZeYgmGDel0BwypAY5XQEbnTIqSckIIwJ3FMNoPrK1tlWqjQw
 zqlRVayqZaFC6u3nozWszz5eUBxMezr+3F5Gt7T8tDcEF1z0RUAtK1MmFkN+fclTO2jwttKKR/
 yBeVHsQTxDVougU9DWBbgdaluUL3JTTAAIBAAA=
X-Change-ID: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59da6d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y_ikFBnX2WV78VM4M2oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXx0omdSjd1ANS
 fNFR64QTqjcBQYKkxlzwXt9eZkt3D+Fqq7I4xsCt5RXEk+cNo11gM9QGudeqAhCsNdWJ66fwoQA
 HyNn4RNO3Uh9XP8iKZ4Y0I4gYhVEVuWxoQidffE/j8Lu9OMimFgit816iYVdZmq/Qc0XuV4tq+i
 p3i/ig1LGh8vCQCnUmdSqv0TcgCb2KSqmaGyBIGYqti6Xt05nT3RIzlvG1fIt5nbyJNwavOgR9+
 /9AOo6UDR01y9zqMD7ORY10Sgr18xBJWcYYgVe/jG6d5VJUrvRoj6CK31A6kBjlahCnHquZkDE1
 Osybsu5FPqJI9sLgkkl/6Qzeg1re4YtX+Z+Q+Asi3wPQlMu7J8sc9RnWCUeXUvlBRUOe6aYFVMy
 ge7OTcGzYxyAKK78ursn6vVuysVNzMFu4RzvpEyNqv+rXvSgkbc17o7eUdw6kgWG6Lvbw655HRi
 5yY4HS8Vvsr6zhH7ZHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX+13dpPsZKiTW
 h48HxOBBU3hIKbOeLcGX/281quG+GboKFyBl46FB7q/e1kUQZjP75CxqwuVfoDKYMwXq98Y+GvW
 QTA38qNcVB9j43P1gchWfmOcBl2Y3ko=
X-Proofpoint-GUID: DSpniH0KRJ8URdzFhSuQsdVVupsjQwQC
X-Proofpoint-ORIG-GUID: DSpniH0KRJ8URdzFhSuQsdVVupsjQwQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170073

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
and MXC rails dependency. Add explicit power-domain voting for Milos
which are required. Hence extended the Milos camcc & videocc
documentation bindings for Eliza.

The patches have been tested on Qualcomm Eliza MTP board.

Changes in v8:
    - Remove unnecessary '#include <linux/mod_devicetable.h>' from the
      videocc, gpucc, camcc and cambistmclkcc Eliza drivers.
    - Added the RB-by from patchset v6.
    - Link to v7: https://lore.kernel.org/r/20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com

Changes in v7:
   - Add missing 'power-domains' and 'required-opps' properties to the
     Milos camcc and videocc dt-bindings, and the corresponding device
     tree nodes, since the Eliza bindings extend the Milos ones. [Konrad]
   - Update the camcc, videocc driver to 'use_rpm' flag for Eliza.
   - Add the RB-by tags from patchset v6.
   - Link to v6: https://lore.kernel.org/r/20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com

Changes in v6:
  - Update device tree to latest linux-next.
  - Update commit text for no ABI breakage for VideoCC and CAMCC
    binding [Krzysztof]
  - Added the RB-by from patchset v5.
  - Link to v5: https://lore.kernel.org/r/20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com

Changes in v5:
- Taken care of comments from v3, v4.
- Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
  as required property in bindings.
- Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
  bindings.
- Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
- Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com

Changes in v4:
- Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
- Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com

Changes in v3:
- Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
- Dropped the defconfig patch and included the drivers as m from Kconfig itself.
- Update the header inclusion in the milos.dtsi.
- Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

Changes in v2:
 - rebased the patches on the latest linux-next.
 - Add new bindings for Video and Camcc.
 - Remove commented code in GPUCC (limiter code).
 - Add device nodes for the corresponding clock controllers.
 - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
 - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (10):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
      arm64: dts: qcom: milos: Add power-domains for camcc and videocc
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: dts: qcom: eliza: Add support for MM clock controllers

 .../bindings/clock/qcom,milos-camcc.yaml           |   31 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                |   76 +
 arch/arm64/boot/dts/qcom/milos.dtsi                |   10 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  606 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 15 files changed, 4727 insertions(+), 4 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-b4-eliza_mm_cc_v6-64cc35d4a698

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

