Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951904EC647
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646768; cv=none; b=Fr0qGR2cSAwNvQP0WgFr53Y6T9nMsbGA0QFWWn70JH/GFDJdTTlWopTD2X2MRfYoVkl871fSmqi/b3MHutmNJ+E+H5X0p7RbD0DCVt3XdynZ1QBj9MSUGvs8I2CU7w9jPPt1hixFtu8WRbSkn6Ny/wmhEliD0ESIW0JHubNa8K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646768; c=relaxed/simple;
	bh=1Ic/ajQCpJA33O6z7Flj6meuJ1EDpwKmwsUa8nUX9CQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PJ+mLqwXAQyr3igQiJZfidScYGOjgM8J7RJhBxmj9ejGyRBal7dgZt9rszMtH699V9AFbgw+55nVZu5TTvVLvlxn/AR26+2BJd1mJeg9ASdgtyfiiP/7g8qGarEO3UzMJ2KSYsgMIwHGoB66rf/ejZouuLXj+oBYb+fBx4FNo5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pH5gG31d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VET0ycEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pH5gG31d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VET0ycEN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zv6K1390229
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fxCdJOR5Pgh524oOvQjl8c
	yBG0pHwcfz9ZpkSzCUxeU=; b=pH5gG31dAfC4nFz3qPHIVfEWnT3WhCdfozZLsg
	dTmXDIK+FOi78Y2BC5Ee1MND0b9bnCLXAyMRkpuLBCki1EaJ7CEKPjlh5x5Ib0ZO
	oc3up9EMkeXvKVs+DiIeyLFvKOw8jd79qkzSx1UAhibDfELpFwVSs5kmfJagDu6N
	RjEa7T9MjN60Yl6sr+kJKDFnlkdEgNbe6/0ptiPR93803YGF/BxvtZbU/46lmlt3
	BpELSwN7tHSCeaQNvArZhCCdbBwZznQmlyktEveRghE4PswWFkkwXzWZKMpbKHHH
	BffkvPUM+reOSP6/0OqLaIZMC962QVL8nF3VmhYIq0p/STsg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d495j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:05:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso1389170a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646757; x=1790251557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxCdJOR5Pgh524oOvQjl8cyBG0pHwcfz9ZpkSzCUxeU=;
        b=VET0ycENGVb7OYNJfR7fBmjcQDhlV1cSyjissC3sCmNQ6RmOpoE0Jbnf3k7KqMk0pN
         9MJTpU6DWcau2XzpoWRvAwKu12woTBWKnMIPvxW9Hzt1Otqb/nGvBuGHCSSdrdemei5c
         aWkAKW4YeH/Kvr/Pke18hC7PS8DOIUqvmODM0U1uyMNGTTIn1uaNLgvGoIxjqzYPRBKK
         xGrV42Bi90t/SwPejgWGF+RqrN5pgVpVoFWByANKKnWFY54JgGnzw+Z4bhFJX3aT96/y
         Xwqnvf2rdI7izp13a6IossqQDr0RpV1KcBstDITVjDzF+L7YPxadCfwv/pCWgZkcC8Oj
         +NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646757; x=1790251557;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fxCdJOR5Pgh524oOvQjl8cyBG0pHwcfz9ZpkSzCUxeU=;
        b=ZUklA/3b9CjE/fpymSXLU0uO5T3KPeuHqOJKSa4K9bjlGlkxwSi+f3KQ4RLhBaTBzX
         /sH5KjRDyUsfNg7JOud4P/2Ht2gwB24bTET7TfV0qtZYhtbli94E5t4ztO4/+/rrSPU5
         aviiD1t1GD6hx5jX3HzxwQqcx9Ps5LnRQoRX2spajXQM0kcs3/la30FJaYYRuTvjczvu
         3+wR8k62To8pSjMPcFV2u9k2jPTdbfKyXm6Naczl5HjYlZ/A+5H4mQgwbYonq8N/UHYy
         tBmNKH0g7vKWY/A5Da0r9gBEoeACh09SBJo+jk1jWpfxBAx1rBMgREkQS28asDM7Hxoj
         VuBA==
X-Gm-Message-State: AFuF++l6gsDgVQguIJsVYmZxztMdQCrnWAD0XYEd5DKSVRwdkSAD14Tv
	qiHeibI6q0yyihFR8ErhOwLtvdikln2/ZBxB6k+QC0WE0ICTV2+BiarGVub9InS8iRpqdTbOehW
	XS+Ze9HoYCTqI7TCkDJdFCOfhwiEkkPhYvrfeTq2HM/LCf+vsrRiy/T3Z7EKkMtlVFWD7
X-Gm-Gg: AYBFou0WYbGfF86YfS9yPT9ZehV2t17sdsDzktPrz55QNHzSo0g/jYiXLAjipEU46nt
	8AzTtsOETjWNBEHst/mxdo64HEEFqReuqtBK9MxVlfIPvWdzdbE4qxTqtF/xjqtnjaHcf+Oc6HO
	5nx4sOmBFwLrd8TaQJpBdec11/H6+nuOQUNnQANMwdSdA277JHUkEomAcPyB+gCDkQKAgjllN8A
	A+OPM3PMhilobvVkiyusgGWWn5lxhV1YDnvUQW4kMthE9XmnIewlkf6ReyWo4f+LVlcZAj6sFHz
	UIAA6pdiUcIgaeYpOtUKLIsVGo+UbhcXGJ2KoVFg3x8vLLDUhQ72u6vwySYAzF6rSM6Px8Ng+Kx
	cOswYEfhzxP4lXZG42x2SK1Dxc3DtWA==
X-Received: by 2002:a17:90b:1b08:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39e1e4cf1cbmr14346659a91.23.1789646756712;
        Thu, 17 Sep 2026 05:05:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1b08:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39e1e4cf1cbmr14346591a91.23.1789646756196;
        Thu, 17 Sep 2026 05:05:56 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:05:55 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add CAMSS support for Qualcomm Glymur
Date: Thu, 17 Sep 2026 17:35:40 +0530
Message-Id: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTXq2oC/32Q3YrDIBBGXyV4vRY1MWooS99jKYs/k0RIYqtta
 Cl59zXJ1bJlb4Rv4HyemRdKED0k1BQvFGH2yYcph/KjQLbXUwfYu5wRI6wmnCncDc/xHr+tHlP
 CTOhWUENd6UqUkUuE1j+2uq/zniNc77n1tg+R0QmwDePob02hdGWdVVw6J1Rra1saRgynmhIHB
 vJAE9WCXatHSElvOk1x3GwUFfhBc1vyDF/6J56pxATXnHLDGeetVqfBTzqGQ4jdJ1qFep9uIT6
 3dWe2GW1dktS/N5tZrspfM7BgK6jpKaR0uN71sMof8rNK7Sx7x1bSGlnTSir3D6uIeMMK3golW
 T6NLP+y52VZfgAPECj3uAEAAA==
X-Change-ID: 20260529-glymur_camss-27af71b1d3d3
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=3114;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=1Ic/ajQCpJA33O6z7Flj6meuJ1EDpwKmwsUa8nUX9CQ=;
 b=85vFhiq14hMDnXr7VPReoIxyoZVQofTTZfe6kw8Fc8+WvmcoSZ9/xvWKMxc8R8oiNIiQopzh4
 K4jymdyRwuLBfJMTYB+sXxrSyvFDGCXqgXmr3kOZwIOPtd/7+jK6rJn
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: Y0V71uSg9hR8VHkIZIDTjjb1W_Ie23Am
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX8VZzanpgZDsj
 o10SCn4tYXfGiEKPQekSMMxgsWYMXaeBLd3DCshMcesBzwVfdhXBbnGb9tabt20AkICviykucrd
 qASUMVjK1b0lVJT/kA/O75s7V933IKk=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabd7a5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0ARVRLQPdUDne_cnrioA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Y0V71uSg9hR8VHkIZIDTjjb1W_Ie23Am
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX8VAI/pMKlKdD
 PO5sBL1GIuBiy98fql4JKIvkEjuIDURHbn0tell0/EHOknHDaJPm14/YWEtFt+1FpNwJviyXuj6
 RrySgqu4I9iHzFAFiDqtjScylTxVqaFcUGtzD+5Y4ICbWDLH7d1GdHDrTYGUKKZuCVIQM+CYwCx
 q+hp1zbh1wT48Do82+4W3fuWilM0tzUOJhXGDTNx1Z7f5G2vSzxMpYNAP4G26ybzTqxhamoiZni
 lneHsKsKCPTsK07nF39qV/O3M314zg3ctH/NjfnI2NrvYwWJkGIXRv9Y16o2S97ErUBSQLy291D
 8By9lK2HVuEZffvuBQZzfwSPZOpCeVhXL4QDWPcBIqJt9lGZ7LfYdBfvjPegGVAQU4eK1R/myEg
 jRHtOmZpbE00JlI/JQHyq2QDO3KB+RCErkbcJdhY1bJM3F3JTB5FZr+LBVctH43xqua0AqR3K2K
 c/tpQJv5fILjydSk+Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169

This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Glymur SoC.

Glymur's camera hardware topology:
- 3x CSIPHY (CSI Physical Layer)
- 3x CSID + 2x CSID Lite (CSI Decoder)
- 3x TPG (Test Pattern Generator)
- 2x VFE + 2x VFE Lite (Video Front End)

The CSIPHY block is the same hardware version as x1e80100 (3ph-1-0),
differing only in instance count (3 vs 4). TPG, CSID, VFE, CSID wrapper,
and ICC resources are fully shared with x1e80100.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,glymur-camss.yaml dt_binding_check W=1

Patch 1 depends on the following dt-bindings series:
[1] https://lore.kernel.org/all/20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org

---
Changes in v3:
- Dropped PMIC changes; will be submitted as a separate series
- Dropped Hamoa from commit log - Bryan
- Collected Bryan Reviewed-By
- Link to v2: https://lore.kernel.org/r/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com

Changes in v2:
- Glymur is now defined exclusively with the new PHY API architecture.
  CSIPHYs are standalone qcom,glymur-csi2-phy nodes falling back to
  qcom,x1e80100-csi2-phy. The CSIPHY supplies and register regions are
  removed from the CAMSS binding; they live in the PHY nodes.
- CAMSS_GLYMUR enum is dropped. Glymur wires directly to
  x1e80100_resources in the OF match table. The CSIPHY instance
  difference (3 vs 4) is expressed entirely in DT - Bryan
- The incomplete compatible + resource enumeration from v1 are collapsed
  into a single self-contained patch. The pointless VFE enum patch is
  dropped - Krzysztof, Bryan
- Add dt-bindings, MFD and regulator support for PM8010 I2C PMIC with
  qcom,pm8010-i2c compatible; qcom,pm8008 is not equivalent - Konrad
- Drop dt-bindings: i2c: qcom-cci: Document Glymur compatible; already picked
  by Andi Shyti into her i2c tree (now in linux-next as 7c9474bd4a8d)
- Link to v1: https://lore.kernel.org/all/20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Nihal Kumar Gupta (3):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible
      dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS
      media: qcom: camss: Add Glymur compatible

 .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   6 +-
 drivers/media/platform/qcom/camss/camss.c          |   1 +
 3 files changed, 306 insertions(+), 1 deletion(-)
---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260529-glymur_camss-27af71b1d3d3
prerequisite-message-id: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
prerequisite-patch-id: ab0db8f40ef87320e67543686702109ac045784f
prerequisite-patch-id: d6b3dab26f8a95822465a176f691280a5610c22e

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

