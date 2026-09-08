Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D01545D82
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876091; cv=none; b=LdJTWqi/WOiYuweNBeR5z6WVcILxLCchEN4Fxd9KVHxqpeR1z3RWwjZhWvECrQXwbRQGoz6muGwwLRvavfygBFUGjWCFrOjOMLHQNpORjq8bGr7vrp189Gl8xfbH37hQJWbpwSqgJxzkF6EgSE9lQOIMdbIC8S7ucKiP5qNEakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876091; c=relaxed/simple;
	bh=t3l/DgW4/G5AtaUOpSAHHl86YPniiPlOjnFnvI5yvcc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YhMG2wJQBdXio9Rc0yP3xL9+UY5WMgizDvtYi+2zRDIjmoqIptB8DxJR7QlWm3Q7XH174kKn8D3lEL0xeyvBfSnXb3wl2iDYlwPqN7mbreaHYQGDapHW2llho2FbIo4/Qlw1SNhcZdPdwhg/YJ5I5VtugQ7XoAwQL5nKQouReH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jakpfQm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfEBkKUR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jakpfQm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfEBkKUR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkmBL3363854
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x8vtwhrNnZjX/q5gHND4bV
	myOFe89HrZHW07ov1HHOM=; b=jakpfQm8gvUBMTyWnHUo6FqWAIjOjgZzTWsQac
	VRHy76fZgzJX+6D/Nvu0dMdch6gXNu4fR66WKTjeCdEPf9eddBN0wTmFj3Fn/i0T
	EYANAeC2mgWEr7LCV+qjTF+Sw1E6dpi68k5iakDElCwxMSFgHh/1ulwSZa5OM5Ln
	mrVgb7R0I7H3VvswBBlXc4rdjyFkrffC+vnuH9sU9hlcjyVcn/DIDAnmSjpbirYS
	7Dh1LEmQMSBbAsuZ2zkZI64bNXHOFQN3J9waBifXeJn9EoO64/jy2W1dPiQmQdaI
	r0ZxttschbwIupY4CNA2fu3UaCucF3dULGWMcOaJdrpgopaQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7hw15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:01:18 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4fa572ba2so3239843a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876078; x=1789480878; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x8vtwhrNnZjX/q5gHND4bVmyOFe89HrZHW07ov1HHOM=;
        b=AfEBkKURMiaoIiCKpiyr7wGNEBsdO923y0mI8oXbnqbKadd4fZdvV4m1bJ7VF1Gps7
         gNz7Z/Dmd/FjJSNkHHEJe0DGRU9y2e6b3YfJHtC7dDTi0vmPIBpJc8FFmepNls0zmmZa
         sj7QZMqW0KZJbvLEmwwYypqkQVjNBnCsh+9j7hBeozqLghlhR9CxSJT7HOQRvYG+n2VU
         XV1TkCWCwCxJqk1N4f4UGFfEFNxaSH584jkNQrTrOLDcr5vXKLD+vhiyU/jwd3o46m2y
         EpiTKW78VFtiG8F+dtt+yzLzOZBsUVDQ9yjgjUxL16VsIJ2mi46Fdl84rQGWLBoClidG
         c0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876078; x=1789480878;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x8vtwhrNnZjX/q5gHND4bVmyOFe89HrZHW07ov1HHOM=;
        b=kDbfPQPd1wE7RALrTR5QuGBqGMzXNxneOKXQbP4DC1zlGrgBD6pDwYtQKIrS2fZ0Wq
         9lT7pmvoo5DMalRxYurwq+MrKH8xZRNYzO9t/pHGxbExQfiNMg675j0m+OOdkWzlS1YN
         R6hhoIwkXTiDLma77kcvjwsljqnJy/H7saeO/S+u4hWc7cY7B6gKeIf4l/9tSb0xHKVz
         Rhp9Vj/3tKwxWYzeAIbtl9CbvhPDfCENKxvGlyk8yKBYbRbMa9H2Jc6I4GgxnJ7n8e27
         qR4AD70lusaLhSdcSMdP0YDKRBItHHnAH9MCSFlN2ZNMs29urXUpjgQk2c60k8iI7sgI
         GzcQ==
X-Gm-Message-State: AFuF++kYje1flB22IfRLeXMqTsGsThg7brCnBV5omElrBYwPHsDeIO/b
	+hK6A81bTcY422pnNCsgcRt8FjOOFmP7u3yCb2rN4kf+Dr0IPx0TEc4RhwAqk75ACs12X7DZSqV
	z/u4m0rbLa+I1sfYaEIa9NpwSClea7n73CCb11jr+9hpDsn6BKSlbeAIY6mskRWxfbIMK
X-Gm-Gg: AYBFou0Eq7+QpLLfKj3MoK5b5srFhHadpDl+cFV7c6TGseD1SBuV0+ZFTdhy5snzN7c
	vhilXCZcLtXWpEqM1h1Mj5blz2TLEPIh3J7xBUF8AaKMO3V5hLKza0Bgyp5QFRV9xC2w26YSV8L
	0rl8tXQ9OJLa5bMtneDFgaQ2DdaNECGnGm21Qg4pDjw8HoZEU3hHlaLfB7ZEAXHgbnrm5kGjNWe
	bPQX09gDmtJU9231Sxw8J3UGFQ81xYiC+V48S/yWnIxLYKAWbqJNpsNUaI8qFmRrSCt+D4yDZR9
	aMc7VOopFdZFSeRJ/UDK3dq6SlbpNQu/8BVrkvviVrNG/xOwdTfQH5hPrDLlRXPvV6Sd/RnUd66
	GiZSDVBpeyiVyAuDVq7KF8cVT5Gg=
X-Received: by 2002:a05:6820:1c82:b0:6b1:6c44:d3b1 with SMTP id 006d021491bc7-6b6fa8dca94mr15309528eaf.2.1788876077740;
        Tue, 08 Sep 2026 07:01:17 -0700 (PDT)
X-Received: by 2002:a05:6820:1c82:b0:6b1:6c44:d3b1 with SMTP id 006d021491bc7-6b6fa8dca94mr15309272eaf.2.1788876075616;
        Tue, 08 Sep 2026 07:01:15 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:15 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v4 0/9] phy: qualcomm: qmp-combo: update DP PHY PLL
 programming on Glymur
Date: Tue, 08 Sep 2026 19:30:53 +0530
Message-Id: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABUVoGoC/2WOQQqDMBBFryJZdyRGTbSr3qO40DhqihqbqFTEu
 zdaSksLw8CHP2/eSiwahZacvZUYnJVVunchOnlENnlfI6jSZcIo4zRhEdTt0k0GhmaBOYSCCxk
 JysqqYMTdDAYr9Th41+yV7VTcUI47ZG9URncwNgbzD1ew4JsrdV/BHEAAQiYpTeOYyRgv2lr/P
 uWt1F3nu7XTGmVHbZZDfw73r2/T5MfUDYUERSjRKfOQ//Oybdue6sTIsREBAAA=
X-Change-ID: 20260824-glymur-phy-v3-b67c4702dfb2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=4385;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=t3l/DgW4/G5AtaUOpSAHHl86YPniiPlOjnFnvI5yvcc=;
 b=AKG+qcl/AgM2knFNW7t7LKcyJ+jb18/yaCmY3lSWeIW8Juw/aBKGrjqLpGq/7a5mBlUr/QcaQ
 nIueWXkCp6yCMiL89LI8OOFqUq+VLPotN9/athzaNfJmFlWV0KgtQpN
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa0152f cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=t9hbx3YKugSYWUFxl6sA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX43hM/cZsReGZ
 hN6/IVgd73L/EX6l3Ik8Upq5GH0Ncx7ZAXwpTmOyppp/LV5vgHSpYuTqKRC3lyeUiYiBGQctnK6
 KI7kOsU9X9y9xLnp0uaarx39hwA/A5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX8/UpayJhNldH
 rLA2iVneKQOxNoS8FSgu5+AGVu0F7vae/K0Xcg9sDhl7TKTc2f4RCbiqlMh7TqVlG+CwJNfor3G
 rn0ljjeRXGOfysMsligV8snumR5dvRrPc7ENB2TgUI5sgAN5fqMs1dqJRsZyMHOZNFi0KAhW2Ng
 TJJ8UFDKu3DshPh7F2B5ki+CQ29kxRlqcR6RUU6VZXjVSbfMnL37Bk+ao7/mW7ZLai72vmFMHmX
 gjsLXXh6AGAdzuT08VeVA12lGKFQQCYFsf6CARtaT83G18eqHcHwrFc0/qBkDWgHa+JcI4mvK/1
 xMk91RKJjOUmAB/gNZymo835B9vqV5F2CNM0rC1vDXO9zVlYsiZ7WRHbKLpo/r83WDA0U/Dr7yF
 +wgNKf/734z+lbgP0nNTiv8Fxa0Amh/2O+csg88EmymaJxUatDwEuURfSI4dUN6JijpM42gx8Qf
 ITcPPfBJ19U6BXqHd9A==
X-Proofpoint-ORIG-GUID: jgKSTfOzjEkQNSTh_x-MNS90Yb243ul0
X-Proofpoint-GUID: jgKSTfOzjEkQNSTh_x-MNS90Yb243ul0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080151

The existing DP PHY PLL and AUX configuration for the Glymur platform
does not fully follow the Hardware Programming Guide requirements for
DP over Type-C, which results in DP link bring-up failures.

Update the DP PHY programming sequence and PLL-related register
settings to align with the latest HPG recommendations. With this
change, DP link training completes successfully on Glymur-based
platforms.

Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
settings for Glymur platforms")
Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and
settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Changes in v2:
- Use the DP-specific v8 COM status register definitions
(DP_QSERDES_V8_COM_C_READY_STATUS and DP_QSERDES_V8_COM_CMN_STATUS)
instead of adding new N3 USB/DP variants.(Konrad)
- Drop the qmp_v8_combo_configure_dp_mode() implementation and
reuse the common qmp_combo_configure_dp_mode() helper, restoring
orientation-specific DP_PHY_MODE programming (0x4c/0x5c) and addressing
review comments regarding DP_PHY_MODE handling.
- Include phy-qcom-qmp-dp-qserdes-com-v8.h for the DP COM register
definitions.
- Update patch author to Ritesh Kumar.(Konrad)
- Link to v1:
  https://lore.kernel.org/all/20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com/

Changes in v3:
- Split the monolithic patch into a logical 4-patch series (Dmitry):
  - Patch 1: Add DP COM v8 header and fix register layout
  - Patch 2: Update DP PHY common init tables
  - Patch 3: Update link rate specific DP PHY tables
  - Patch 4: Rework DP PHY runtime configuration
- Improved commit messages with detailed explanations for each change
- Better separation of concerns: header additions, table updates, and
runtime logic changes are now in separate patches for easier review  
- Link to v2:
  https://lore.kernel.org/all/20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com/

Changes in v4:
- Split patch 4 ("Rework DP PHY runtime configuration") into 4 separate
  patches to address review feedback (Mani)
- Add named constants QSERDES_DP_PHY_CFG1_V456 (0x0f) and
  QSERDES_DP_PHY_CFG1_V8 (0x2f) for the DP_PHY_CFG_1 magic values;
  use them via a new dp_phy_cfg1 field in qmp_phy_cfg (Mani)
- Set QSERDES_DP_PHY_CFG_1 to 0x2f on Glymur instead of 0x0f (Konrad)
- Update qmp_combo_configure_dp_mode() to ignore TypeC reverse state
  on Glymur via a new dp_mode_ignore_reverse flag in qmp_phy_cfg
(Konrad)
- Fix ignored return value of cfg->configure_dp_phy() in
  qmp_combo_dp_power_on() (Konrad)
- Make AUXLESS_SETUP_CYC, AUXLESS_SILENCE_CYC and LFPS_PERIOD writes
  in qmp_v8_configure_dp_clocks() rate-dependent (Konrad)
- Remove duplicated LFPS_PERIOD write in qmp_v8_configure_dp_clocks()
  (Konrad)
- Make LN0/LN1_DRV_LVL writes swing/pre-emphasis level dependent via
  new qmp_dp_v8_ln_drv_lvl_hbr_rbr and qmp_dp_v8_ln_drv_lvl_hbr3_hbr2
  tables
- Make 2-lane drvr0_en/drvr1_en values in qmp_v8_configure_dp_phy()
  depend on the reverse state (Konrad)
- Patches 1-3 are unchanged from v3
- Link to v3:
  https://patch.msgid.link/20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com

---
Nabige Aala (1):
      phy: qualcomm: qmp-combo: Fix error propagation in qmp_combo_dp_power_on()

Ritesh Kumar (8):
      phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
      phy: qualcomm: qmp-combo: Update DP PHY common init tables
      phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
      phy: qualcomm: qmp-combo: Add hardware-specific DP PHY config fields
      phy: qualcomm: qmp-combo: Add v8 PCS-level drive level tables for Glymur
      phy: qualcomm: qmp-combo: Extract common DP PHY init sequence
      phy: qualcomm: qmp-combo: Update qmp_v8_configure_dp_clocks() for Glymur
      phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY init and configure sequences

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 356 +++++++++++++++++++++---------
 1 file changed, 250 insertions(+), 106 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260824-glymur-phy-v3-b67c4702dfb2

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

