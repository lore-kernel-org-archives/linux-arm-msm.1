Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13EF2AD2E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730235; cv=none; b=UijC37QX/cWEg1/EipLcu3LOSN2t+gMF9xwiTvGfhyvy1DFiNx0sm2RMhIFpQ0JSRGfOYPMxlzMqn40JBypfb7zWFqSstAAmKumQLM+wGo0veQXvrMpZo54tNhAbMPLRHtTeO3hTLjh/7HTPX4mZEVnnliSiOs+33yLlNGuhXjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730235; c=relaxed/simple;
	bh=q/ENcvdzUpHV08hhHvAtNr0/U4wmYWcJOTf4EpwRHK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fcpbI1G3Tph6qUaEydNyWqKmtZm2ciajLK0/ag5sy+3AHvbJPxt97sMOb3sCc/pf1AlyiiFSTSs6T2qE7sCcETOMh/bACDgtpGUEPd8yo1FiQjUnWQHx3vsU3mzvGf0lZwJAwDaChy4Vh6f88pknopnYrZHpC/MUiWjNKHDhJJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MEbQO2pc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOmmBwO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MEbQO2pc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOmmBwO9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWb8r1027241
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mVft64wS6z9WDtKxRsil1uc4zsVEveZZNCz
	QLUd+KqQ=; b=MEbQO2pcjJh/XFqK7yR1Dbz0UL9WGK3aumiS/DJZn1+nXOM6ClH
	o0Hhfr7/I5qhDeZMnSTvku/yX51h2+AnYUU5GzPmh5PGl+PSp+NEpbP4fHdlnXzD
	d/MdIx4qOYMFqtcmzqZbpAeZB1jynz7mM2n9eC7rCA8D9DVdRokkPfv7+mqJTehN
	mfwwA5rFam8scivamPKdW+7O+Q+mGbXGKAwTU8eHShUdaWu6EJXCXrDtCJm2PxBz
	v+nEXH2AQzsfFHrnZIa9PrhSiNYBIJlKsNAecK0p2QPoIH1y7CR5etGzcPWquuDM
	wamns31mSSMFtbQcNaBbdu+KXjgnonovAiQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt799f5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:23:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca860baea9fso22198335a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784730231; x=1785335031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVft64wS6z9WDtKxRsil1uc4zsVEveZZNCzQLUd+KqQ=;
        b=AOmmBwO9U1khtHUiZ6FudlN7YnOo3miY7amtnthKSiFsUgHQOyGE8JX1IPzux2H9aO
         k51RE4iJaiyQdWeNVYHgGuNjDNgtKAiXDW5xz3WfI1ITuxwMTQRXjYgXjnX4iOQrZgab
         WmiFfyohWxwnCBtP/hI5LslW9XFNSm8ZIv8E8tyPQ2lmdNeUCecBuy8TO+JxRWLl2MvZ
         iX5yB7ZAg5MCsJK3dF99m2Rk78J0rq2X2bgCcp0fAZwlrrm4AjzSkcVbdJOdIvmLCZIY
         AGGN6sFMAJFu0i3XKF2RUZgKbPwMh9Z7dXcAU3+SOGKjVzzqORNcLRKAQN6u3omOS6CT
         qZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730231; x=1785335031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVft64wS6z9WDtKxRsil1uc4zsVEveZZNCzQLUd+KqQ=;
        b=j8pdYBdh8zjAK7FnTK/lVpSserzqd09b8gguFuMsPVJm2p+eJBS1kcxVVT/z4ZoLBR
         S9BemQFpnT2R4PLfG+KEaaWhZ9iytZ91OSh5R8Z9PLRb2xXBHGIOR2wkFKVq93xxk5o1
         3V2uqbudXWm7padLzTO5t6UWCweuUwEeTpla5xpZcsl3XdZOq0FxjtmzIbeKIJozQATA
         ahX2x2xCQ2+s28h5ZqQFcsYNjTgMvA9Vuk9aL/7+pdoOMOHWXQ7KhAaivdD31hExEbl2
         RAmwbq9FwFEA4AhCnYR6YL1wqBbyX5nl5YKUaZtfBwK55aPXNfL+OuJfsBYI75/RZWBW
         9Ktw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0v4e6/8k49VGUd4oltCHDDoSwPlLFjh7NCTcD2vbOx+TAGb2UUEY9ruszOpxzCwveueigHlh5kDSryFK3@vger.kernel.org
X-Gm-Message-State: AOJu0YztL05UiESS/kKCGm5m9DnvijJ+RegE7khhsLS4FO6hAatalVSf
	QzAjYfwUvyiAuyBpHNETkI1HljtOBRkQmh9BS6PrHD8UDmBxyYFL/tDRXa+ZZVNbZR7TruJo8DD
	0Ds5HZbBV+eHo5cH3ichfZE9O3zGSgKirpVjnoLVWDJmsKaiknkZJqNqA6Y4hbDM9xpX4
X-Gm-Gg: AR+sD13j3nxz9rUmwoz7bgcRoDdZWkX3gaaBrMT2FffsE62sGskD6Wk8T4YTE8K2+08
	R7W0wVmEBJY0xi7a0BPa3zxFiZw4MjW3vZNVq3GzL9XplXiI84R/o+y7dsJ884NtQSleYKRcLo/
	dTl5vqgv9mspF2sgIJgf1xb45G1qfRHwx2YATDtSReNReuoeEyquyYkW+QnaBdQ9e295rvf3PN9
	hteaDZGxCBkmWpKFqCbDUvF0ieL4BBLJf4NgV9h6GCZbd33kM+xKKycSA4lNxm61IumgJI+WMya
	BjlhRigORfLRqb4iUIbzL+eCWXzwWBiByoU84GzbD8FWrCq7RjbA4rAhZpLqotYzbf7ii+VHBQY
	ZVQ2miI18igiTBQPJDCVfCFLFukw=
X-Received: by 2002:a05:6a21:3983:b0:3bf:6c08:2848 with SMTP id adf61e73a8af0-3c3ad974118mr25380536637.55.1784730231365;
        Wed, 22 Jul 2026 07:23:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:3983:b0:3bf:6c08:2848 with SMTP id adf61e73a8af0-3c3ad974118mr25380495637.55.1784730230915;
        Wed, 22 Jul 2026 07:23:50 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm11231211eec.10.2026.07.22.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:23:50 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V4 0/4] arm64: dts: qcom: Add SD card support for Glymur
Date: Wed, 22 Jul 2026 19:53:38 +0530
Message-Id: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60d278 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RkBJ44vHt5mxqPYn9l4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: mB7x4kPhm5lB5nBocWrkzlY4D1KUVIYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfXzIzw2SKEks5G
 BhGo/oRZEEtrQLOwcwT6h2qCTAoQtULzrZC0P+EBcnDbjpTnKSBjwwpWTAkS7Sb/1OvvrWORGDg
 DbFfcf2uWELBOIzBlcDXruw3VYq8DM9NV0Qi6560INMS39PdyOGMYkzDElPcs9V2s0MaqFkvfzu
 6B3oPOhOXXp78S85utd2ZYZ6c6l3elWCPkEXF85IPn3KbuP5vlNlSUlNyGPV30fIDKt8QflLj7Q
 19gKwF7yu8NZ2G1aZ6TTMLCUfwL8sQmaAmsgyW143Nab636LlaB5QJFe5d5aQ7oYGujKK7kEcyz
 PPt0ogzTyRs9F8MafuNYgZ5sBFcYwYmVrZQDaWsvSlHSHnu9EBDsQKeHKxdro0QLTTxrBM17Y4h
 e4ZRKskL/o1CrQouFIA9xVwiNM/Nv0wMf9HOSpu9/UvxwuKy/VzmMRiWoiGcGkmP7E2++5o81dO
 f2nEzn3A7W0Lq1VBaDg==
X-Proofpoint-GUID: mB7x4kPhm5lB5nBocWrkzlY4D1KUVIYC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfXwRdxeC1qk/I0
 /IL2kdC4wP3IxL5P9zeRtPBFuheaCiyV6yLlooP6TneAXm0PDiwYS61ZiPX0+KjmKlq4Ur8bOhF
 hfHr6MbWdGznajPg77VptNnfC1wx5xA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220141

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Respected Maintainers,

This is v4 of the series to add SD card support for Glymur.

This series adds SD card support for the Qualcomm Glymur SoC and the
Glymur CRD (Customer Reference Design) platform. The changes include
updating voltage regulators to meet SD card requirements, documenting
the new compatible string in device tree bindings, and enabling the SDHC
controller at both the SoC and board levels.

Changes in v4:
- Propagate Reviewed-by tags (Konrad, Dmitry)
- Update the commit message for dt-bindings change (Krzysztof)
- Move the common nodes for SD card enablement to glymur-crd.dtsi to be 
  leveraged by Mahua CRD platform. No functional changes made.
- Link to v3: https://lore.kernel.org/all/20260706141346.4180348-1-mchunara@oss.qualcomm.com

Changes in v3:
- Collect Reviewed-by tags (Konrad, Dmitry)
- Update the commit message for dt-bindings change to reflect the
  purpose for the update (Krzysztof)
- Link to v2: https://lore.kernel.org/all/20260702094056.3755467-1-mchunara@oss.qualcomm.com

Changes in v2:
- Rectified the iommu sid mask notation to hexadecimal format
- Updated the power-domain corner for 202 MHz frequency as per the clocks plan
- Added the BCR reset capability for hardware reset as required during the init
  sequence
- Reorganized the DT nodes as per the DT coding standards
- Link to v1: https://lore.kernel.org/all/20260610111508.3941207-1-mchunara@oss.qualcomm.com

Summary of changes:

Patch 1: Updates the voltage ranges for vreg_l2b_e0 and vreg_l9b_e0 on
the Glymur CRD. Specifically, it reduces the minimum voltage for the
VDDIO supply (l2b) to 1.8V to support high-speed SD card modes and
increases the VDD supply (l9b) for stability.

Patch 2: Documents the Glymur-specific SDHCI compatible string
(qcom,glymur-sdhci) in the sdhci-msm bindings, using qcom,sdhci-msm-v5
as the fallback.

Patch 3: Adds the SDHCI (sdhc_2) node and required pinctrl
configurations to the base Glymur SoC device tree.

Patch 4: Enables the SD card slot on the Glymur CRD by configuring the
regulators and GPIO-based card detection.

Testing: Verified on Glymur CRD hardware.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Kamal Wadhwa (1):
  arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage
    for SD-card

Monish Chunara (3):
  dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
  arm64: dts: qcom: Add SD Card support for Glymur SoC
  arm64: dts: qcom: Enable SD card for Glymur CRD

 .../bindings/mmc/qcom,sdhci-msm.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 33 ++++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 91 +++++++++++++++++++
 3 files changed, 120 insertions(+), 5 deletions(-)

-- 
2.34.1

