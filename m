Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07623AC0FA
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514472; cv=none; b=fgxbRXpL1aUR4kbXgr1hRchs7Lz+Qg3lTAEkC1KRocWy0bHmCl8Len254GTfi2WTXPqd5c+JmPfd2tnbxGCZsFoV7TgbB/TuKiun/zUtPIuc5hXWLY4i1evsp7lXLecWKKFj5lROTiean+GUm3Zl6OerW6woxSWNJTKdTSjhqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514472; c=relaxed/simple;
	bh=dW8dtvdOWXTOsuhmDT7Lvte4ZZrHvQEXiUGRjank/6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BEtQHPtaH3ZjgsRT2MSLf7tG6KWRmMlSeB304ekkiJ1p9erITLVQCQxIte2tTHkolSpikvpq6Oj05xhS0t2ha90Mq96lql/DiMmr9nSxcMGMNUd1PJmWjzKQEfrlb6g/hfxPi12oSG+lrDVUawA7oA7HaU4+GgQQcaubNF9tkiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZ4Sl6wH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbUJnko4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZ4Sl6wH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QbUJnko4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG6eZg408120
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VYRnb6gkMbejefOjn7h7dj
	gSzVLsj90Wl1eJ9TYl7FU=; b=RZ4Sl6wHvqWeygvOR/fqRzMfgliUL+/NpVpjy5
	eaeePkkyKGhNFywu4abyYwaAhyJ0hxxZ2GYrpJDPw0I2YekU3H0qJGgIefyThi5P
	TcGzhMTE2N24nNQjWwdqxZvwsNgYZ+c8h3XxW6GBFyk0KyQKWC60VgsNPu1T9r5j
	gQ/d486HgkrEcr4NgDz4ySA91ZD+y4REvTy3eLv5JVG+QzJfNbn/HfCuxQpumaEQ
	YRRryGa8ZzCnnJgqj9U18CjnxjqiWmUPWPytsy2oD7ZTq7kjE4gizl0ykkPG+aUh
	w+uK9skGWCkx3Q90llZKOw0TB2h6MvLRoeXwgL1L2pUmpgCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744a4c56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:47:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2423625a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514467; x=1788119267; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VYRnb6gkMbejefOjn7h7djgSzVLsj90Wl1eJ9TYl7FU=;
        b=QbUJnko4/zcIv3OYplDZvCxpTed4Kra63DguTa48Hqo+c2jG+JCUkL6u3GUe8wWVHH
         jsFf/oN58/pw0X4J5k9qu3OApKqdPr8B2nld4WWqXGSUufNyhLrEvIgg93/1vRu7l4c9
         dcbRMG7/9r9uHA0XwewBi3l5U1gvv6kO/9KaH3UDoAwnRfdKsTv2LO9bIr8vzjwhS1vy
         UxqHdnfBA8pWFfW90Poh8xozAomElT9sOcn9aoWFTdV8qwJMZAvIBAwyi7LQ8UmNy/FZ
         4o1e4vgnaNafppIlAOf9GzvdVKG/Wyv03T0lonzN96sOdY8Qux3Vc71caCWTkxVE9PGg
         yapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514467; x=1788119267;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VYRnb6gkMbejefOjn7h7djgSzVLsj90Wl1eJ9TYl7FU=;
        b=c/iS02Q1ANsbg6ylMZESAkhsLyCxzlJZETxn1HuM2EXK9LPdOsz7aAxiT7YdQRh3E5
         vwRhX3T6envp/aNtb75ZT0Z0ZuK489sRfDDfVa1n+jRHMZVWuLpT89DDvmoFnJhmlT1i
         XQGLUk2YlIjoP/BjqLD/PnqVyvZFV3uoUIXoc92Vuyb0qZvAA4Q+Otn/QmKTpBGsn8Du
         iIdi4rMtnvGCV4o+ixnvyFxF7oszwSL8LAiDYQjJVZtDP6FtqxqeYATpR7eB+gwgYtGP
         yJaNUMLCFtQGIf76HvCgUdgdM1Vik/PEXclc5fSc0Oidwo87AKi3BeHOHMbdNqV+F6g7
         jImw==
X-Gm-Message-State: AFuF++mArbEu3ITvKunUHRqju0iRYg5g6shE4Dn+4f4PB93obpfFmwKZ
	sI9T3pT4COlbe5oTkmzy0RZj8JWG6fY8/rMA7knVY6vJCJHqHpo/C2h1KfuDAOm4T4rziP/QOpj
	6bQcDm2KVnvNYOlNq9GRzt0+iiSsduELXzyLQQ7yTMTm3JzjGLh8xtEXQvl0Ie95HOWrVtOc8KZ
	QM
X-Gm-Gg: AR+sD13VvG3Qm2i4dPGUA6WJWN3eSt1E6qkSAjegSLrpqfuRx6pfmvEEHEla96/a7DY
	AFqQYks53BhQ5hjgMun8S4qkODm2xcnbz8H3oEVYeB0MInaRNSIDrkqqWaVysvjjJSKFD4ds6gl
	BeFFNV5FPr70Snyf1p9CjfeS/xHndEC+LkzpyxXyE3P3B+2Mn45RuL0iKvzcT37sKlz4HJ4IvUJ
	W0yPBXDf3HrLbzUOCquwJdle7rtv8uU/9OSvCyBd+DzgHriqwNPJQ5zs+hbdtWraFA5w0W+s08C
	Mv6SRrYZf/o3mLcAqAkYnl+WF5CJVMXEaGXqmXRXhUR0CM/oQvCQFJKSKMfBTI0G2jjFvHnJVXk
	C32tncnurVFmeTG3JkG7mkVLm2Mi3mBxntBIT2g==
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-395c4c98f17mr20935461a91.4.1787514466634;
        Sun, 23 Aug 2026 12:47:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd2:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-395c4c98f17mr20935406a91.4.1787514466083;
        Sun, 23 Aug 2026 12:47:46 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:47:45 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH v12 0/6] Enable ICE clock scaling
Date: Mon, 24 Aug 2026 01:17:37 +0530
Message-Id: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFlOi2oC/31Py27DIBD8FYtziQCDjX3Kf1RRBMsmQbWNA7bVK
 sq/dxNfeuplpRnNzuPBCuaIhfXVg2XcYolpIiDVR8Xg5qYr8hiIYEqoRljZcZycH4gF5DAk+OI
 F3BCnKzdNCxK6oJVDRu9zxkv8fnt/ngjfYllS/nlHbVK+6N21Ef+4kpILLgE9WF+r1vhjKuVwX
 90AaRwPdNjpucdlvK+0YNkzmXeF3EgUl76y2DXWhBq0hNqEIH3dhksrgjVa1q3z4NXFO2B/h/f
 VXlB1r2ZnHEc4l3WeU164VxqsBm+E0f3WUYnnL4Z1nBFOAQAA
X-Change-ID: 20260819-enable-ice-clock-scaling-567c1c9d42ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX8r+K9aHraGWg
 FtdlLKoTmVoDBKC0AfRpAfnafieScMmdOwG8Po5vWL5GubjCuH2YgPVcFU0g2kK+QpItcCIYWBd
 aqaG9R1HI41xj0eawKx/CSLdJpBwzKg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfXzgm05PEFoX7i
 2+dx9drYd2iFiVw6HSMIIAJa85hWKT75cJuYeAGWMhkPpRRKAfKRGQjGEkZYuNng2Zw7szMmFNy
 vu3yXlwVSISfj9DLJ/M5j9PupuXa8ZOXSS+nbbjqNPko9uARGCvTF3WwejvP+OCGO9cCxFB9D58
 OBtPFYnPnI19UFWfs8XoBaee1nJKkYj4UwJo5lun0otE537/KVfkBrcydps9mcpA5Kpg3OHiOe3
 44OkAWrSX8EVlzS1pyTErhDTGrwCa2p5ZT1l6Jhq1GZ7FjWcQexRbowVO7QmPSKONPAchw9y8A8
 +gjbiNoPaC3XqzbWO26ONjh6aWLmzD5eUlK2Y+QqYrM3rdMwbE6Ay4e1O4NIleNbZYNvhfdq3jR
 3Eo4gHYJ8QMbh0pIjactSzakiJMSSy+EYX277hAYRTLzKrA1vZxZDgD7eenlmxtSwTR7pj29VbY
 U2FFvQY4/e0W1+zuTbw==
X-Authority-Analysis: v=2.4 cv=JPILdcKb c=1 sm=1 tr=0 ts=6a8b4e63 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Exo_CllCKnlFIUbYcS8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: O-lIoBdg0ypBNwiLbAmIJ5D7QF3DgvH6
X-Proofpoint-ORIG-GUID: O-lIoBdg0ypBNwiLbAmIJ5D7QF3DgvH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608230181

Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
using the OPP framework. During ICE device probe, the driver now attempts to
parse an optional OPP table from the ICE-specific device tree node for 
DVFS-aware operations. API qcom_ice_scale_clk is exposed by ICE driver
and is invoked by UFS host controller driver in response to clock scaling
requests, ensuring coordination between ICE and host controller.

For MMC controllers that do not support clock scaling, the ICE clock frequency
is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
consistent operation.

Dynamic clock scaling based on OPP tables enables better power-performance
trade-offs. By adjusting ICE clock frequencies according to workload and power
constraints, the system can achieve higher throughput when needed and 
reduce power consumption during idle or low-load conditions.

The OPP table remains optional, absence of the table will not cause
probe failure. However, in the absence of an OPP table, ICE clocks will
remain at their default rates, which may limit performance under
high-load scenarios or prevent performance optimizations during idle periods.

Testing:
* dtbs_check
* Validated on Rb3Gen2, qcs8300-ride-sx and LeMans-evk

Merge Order and Dependencies
============================

Patch 2 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.
Patch 3 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.

Due to dependency, all patches should go through Qcom SoC tree.

This patchset supersedes earlier ICE clock scaling series (v1–v11) with updated dependencies.
Hence, this patchset also *Depends-On* the following patchseries:

[1] Enable sdhc inline crypto engine for kodiak and monaco
    https://lore.kernel.org/all/20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com/

Similar to patchset v11, patchset v12 is rebased on top of latest changes picked onto linux-next.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Changes in v12:
- Rename ice_mmc_opp_table to sdhc_ice_opp_table.
- Fix typo and remove redundent comments.
- Remove caching of the core clock frequency as suggested.
- Move sdhci_msm_ice_scale_clk() before sdhci_msm_ice_init().
- Link to v11: https://lore.kernel.org/r/20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com

Changes in v11:
- Include 20260530-add-opp-table-for-lemans-ice-ufs-v2-1-2b46d3ac37d5@oss.qualcomm.com as suggested.
- Link to v10: https://lore.kernel.org/r/20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com

Changes in v10:
- Rebase on top of latest changes for ICE driver conflicting with previous patchseries.
- Link to v9: https://lore.kernel.org/r/20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com

Changes in v9:
- Kodiak ICE eMMC OPP-table entry corresponding to 300MHz is updated with SVS_L1.
- Add 75MHz for Monaco ICE eMMC OPP-table.
- Fix error handling and initialization of has_opp variable.
- Pass ULONG_MAX as target freq instead of INT_MAX from sdhci_ice_init as it better adjusts the data-type of
  the function qcom_ice_scale_clk.
- Link to v8: https://lore.kernel.org/r/20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com

Changes in v8:
- Instead of scaling to TURBO in ICE probe, sdhci_msm_ice_init calls qcom_ice_scale_clk for setting freq to max.
- Fix error handling in qcom_ice_scale_clk.
- Fix error handling in ufs_qcom_clk_scale_notify for the call to qcom_ice_scale_clk.
- Move the registering of OPP-table to qcom_ice_probe and remove passing legacy_bindings argument to qcom_ice_create.
- Add OPP-table for kodiak and monaco ICE eMMC and UFS device nodes.
- Link to v7: https://lore.kernel.org/r/20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com

Changes in v7:
- Replace the custom rounding flags with 'bool round_ceil' as suggested.
- Update the dev_info log-line.
- Dropped dt-bindings patch (already applied by in previous patchseries).
- Add merge order and dependencies as suggested.
- Link to v6: https://lore.kernel.org/r/20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com

Changes in v6:
- Remove scale_up parameter from qcom_ice_scale_clk API.
- Remove having max_freq and min_freq as the checks for overclocking and underclocking is no-longer needed.
- UFS driver passes rounding flags depending on scale_up value.
- Ensure UFS driver does not fail devfreq requests if ICE OPP is not supported.
- Link to v5: https://lore.kernel.org/all/20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com/

Changes in v5:
- Update operating-points-v2 property in dtbindings as suggested.
- Fix comment styles.
- Add argument in qcom_ice_create to distinguish between legacy bindings and newer bindings.
- Ensure to drop votes in suspend and enable the last vote in resume.
- Link to v4: https://lore.kernel.org/r/20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com

Changes in v4:
- Enable multiple frequency scaling based OPP-entries as suggested in v3 patchset.
- Include bindings change: https://lore.kernel.org/all/20260123-add-operating-points-v2-property-for-qcom-ice-bindings-v1-1-2155f7aacc28@oss.qualcomm.com/.
- Link to v3: https://lore.kernel.org/r/20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com

Changes in v3:
- Avoid clock scaling in case of legacy bindings as suggested.
- Use of_device_is_compatible to distinguish between legacy and non-legacy bindings.
- Link to v2: https://lore.kernel.org/r/20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com

Changes in v2:
- Use OPP-table instead of freq-table-hz for clock scaling.
- Enable clock scaling for legacy targets as well, by fetching frequencies from storage opp-table.
- Introduce has_opp variable in qcom_ice structure to keep track, if ICE instance has dedicated OPP-table registered.
- Combined the changes for patch-series <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com> as suggested.
- Link to v1: https://lore.kernel.org/r/20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com

---
Abhinaba Rakshit (6):
      soc: qcom: ice: Add OPP-based clock scaling support for ICE
      ufs: host: Add ICE clock scaling during UFS clock changes
      mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE init
      arm64: dts: qcom: kodiak: Add OPP-table for ICE UFS and ICE SDHC nodes
      arm64: dts: qcom: monaco: Add OPP-table for ICE UFS and ICE SDHC nodes
      arm64: dts: qcom: lemans: Add OPP-table for ICE UFS device node

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++
 drivers/mmc/host/sdhci-msm.c         | 22 +++++++++++
 drivers/soc/qcom/ice.c               | 75 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c          | 21 ++++++++++
 include/soc/qcom/ice.h               |  2 +
 7 files changed, 225 insertions(+)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260819-enable-ice-clock-scaling-567c1c9d42ae
prerequisite-change-id: 20260629-ice_emmc_support-b24c84cb5054:v9
prerequisite-patch-id: a229be72d68ce7d70db2352817e078f8d2a6c754
prerequisite-patch-id: f9a5d5c31d614334d5959d64011a38862e31569b

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

