Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B5F3B4E94
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910205; cv=none; b=rO0B6fzUF45q9LPzMw/3ifDjQKeYbTZ/8zi8qY+ccUOLDcdUqn603qOhkWl6Q1K+/F+wz5MpE2h6nKwjuk+j8fpt9sSfgSS8lHaHDTimN9ekyt28W+ou6zGB2jHDaRkTxOlUXPSHd5ValkvLtb98I7JqV9OV0THC5YGr8Sat7gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910205; c=relaxed/simple;
	bh=pC9GmVu8vixHFFaIL7xI69c0nSD8i3sS2fz+bphruVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fFa0KmLkCgPch3MUCMp90pByM/B/0Ew2k3QX4DPq5GU/XykwDcaJWX9Elv596lCK+mY6lyO2bIKRg1/cURW+etUDuT2Dggf/I6q14T+YzIyvBNcs9/DITWeHyzCwZa7VmjcNvDzJzb2EGBGH9B03w7pewz0Z7q+zUYmlzBcbDW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUrcCq5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAOB4Kjz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUrcCq5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hAOB4Kjz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66vu02515389
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IL6ISL0hv0f3Z4TUu5iP6+
	5b/NRFnwrL3QiItq2cUnc=; b=cUrcCq5jBLXSAv7EIUshZ+JIzIL0uX5bicKJv2
	oPq1W7XJswXzNFigNOmFvRlkJ6R2zsXfSQcR7VMhoJcgXFnmz5JHhyrphw2OOJ/m
	HQ4s5ZjvWwaG2eBFYTuX0UK49zSGWW1QRBNSEoA9hqAYU32mNqy+suyRfFA9lV2C
	MrSpk9StD/a4BqUCbs0OSD9A+cO1ii7A3TaPB+AU4YIr9v0R24fgfobp1FT49oN7
	hBZ3V3eyxNRNMmlcSp7Babo21Y8+Imd6cUVYH+BLJHeGW0nQ1FKp0aThYnw6cEx1
	DGvj/d8SWVIoR2fJHUk5o4w0OmfVm6tYRORJpmM+HZIOGbLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n0yte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1704828a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910201; x=1788515001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IL6ISL0hv0f3Z4TUu5iP6+5b/NRFnwrL3QiItq2cUnc=;
        b=hAOB4Kjz0w83nvMVe6HWZFmDO7EytlCvz5U/IawfQaFrp0FgSn4uX2+lsJkBWmYrs9
         AT+7lWkKKZkW0VqmlM3Hfs+DxD8d+cpqVmC+w3Sa8FGxj82/u9KUxb+N0gqVmdQNaeLC
         bxr/eSR2btIaSuWdbX/9lOeE2iWpoLWjdh5ytOoI3vTjy/VYBHp7wLBnRsPw10ULNAyM
         Ie0sI0SYQ7nVC+eAmVnT/MRtme8/breWiiMchHaDDEZFQAp6fr79bSMWendqsIN4sVnn
         M6Hz74qOXJOkPjw3RFiL5JNWfga6TAlYli4zMG3l+UVJle562EG06ssAdXo7dAweZ6lb
         iy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910201; x=1788515001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IL6ISL0hv0f3Z4TUu5iP6+5b/NRFnwrL3QiItq2cUnc=;
        b=qMzsn20W2QqTbtWu/oFoTn+CYVaxa94NWW2E0tph5vjXc8ofMW/e5WMOf+XIQAYNEJ
         LpQRM74gr//Gru7pj/3OYMGfqcUvAMqnvWEQlVKJ8RhgF6W0gX4lvbUzDM2XdpKoL6ny
         d1HaiiGMm9d31mWNCWkDbUI+LE4E1+JN7QUS7/0vUo9vt33QFUxDj30BTufMGEM7uomC
         ly2fwDa7vUy1vZyZZzArZvybjU+B998HI6fqFvQIO05BQZyuQLyzWafVu6R2r6pqITyI
         WKBVFHA6iW9SAgB2YR0Ssz68UhcVl1Ix/8hlfKqlu7//1oD7U60wNTMC7f+c0l0tloei
         csiw==
X-Gm-Message-State: AFuF++mdMMybUtCNgCbYnREJ75Glpd6H0g2Yq7wTCFQ+ax+olqCn3wAa
	9hyrqzYptjP2ERykdJJanvtmAx/OUBCXNVfp0gQZQtC77OMv+Crll3e1J4ca6MQoYgC6LPx0P5z
	5bGttH8E1RVend6Q5Ki9NyZVLfy7yBPnFU0WLM2ToEkaDB6FbOQCX4q1kWcZYtkLetUsh
X-Gm-Gg: AR+sD11G7hOELlyvDrddnI5lnorPyoOVphPD7iHRhmSWZEE5O6HK8a4v3SSGCqp6jzc
	OuuLpzkGNyby5rQ5ggZMeyF9VjD9onlQrgdUbIYIOaKRVPH77OzXoZVgnoCmuteYYfVnO5AKdgS
	Xi/HAyS6HORYrRt2BqBV8MRBRI2G/u0s5Sl2Df3CADuUFDLLXp/2pjcujb1p77VMBKrclY2uK79
	+kboRfIw7R8FP1KcO6nuF7L9FxBRNelDLfpVlyMdmn157VWlG/SfKDF7Ih4dUj+YZulJ87qiD+H
	RyswGBml0Onn8VkP4JDLzi9t77iQ4YBztZPhfzGcb9+spQfis+/4320oJt7FxcvBhhYr5UxzXf6
	ak8+M42e21/cBcB64/Y0eZAT6QOQ=
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-396d0d7b94bmr12044387a91.4.1787910201119;
        Fri, 28 Aug 2026 02:43:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-396d0d7b94bmr12044310a91.4.1787910200671;
        Fri, 28 Aug 2026 02:43:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm4166331eec.22.2026.08.28.02.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:43:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 0/4] phy: qualcomm: qmp-combo: update DP PHY PLL
 programming on Glymur
Date: Fri, 28 Aug 2026 15:13:12 +0530
Message-Id: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBYkWoC/03MTQ6CMBCG4auYrh1Syk/BlfcwLmCYQg2l2AKRE
 O5u0YVuJnmT+Z6NeXKaPLucNuZo0V7bIURyPjHsqqEl0E1oJrjIeSFSaPvVzA7GboUlgTqXmEo
 uGlULFjajI6VfH+92/7af6wfhdCDHh3LWwNQ5qn6uFPG/i3ZQsMQQg8Si5GWWCczoar2PnnPVo
 zUmCoft+xsSx6AJvwAAAA==
X-Change-ID: 20260824-glymur-phy-v3-b67c4702dfb2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787910197; l=2616;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=pC9GmVu8vixHFFaIL7xI69c0nSD8i3sS2fz+bphruVE=;
 b=KZVFZMHF9vWVCtJj0lcUzHQBLkiyFjSaOAlxQdnRO4Jcuzt44NdDH2YNNC45hYvPgYOtrkXYe
 18rQymH2mbRDugeEUUWsRrbhWQtsQT22uPRk0G5M88/1MoQr7MSlu43
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a91583a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y8YhYyvsSxd9IuhXD04A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: JjrWcSTmYuqN-zm8rmv8PxPNEAZdVKS4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX6E4BnOV+Psgr
 DAHvDbttJKsnffJQdQsyUP+3RQrMV/zqiZRlJ7lEWGy6npePmEftrtGdhUH1N/xE2D2ClKhighg
 rB0eGxhJGtXHBAbcRLYUDAHeen/Ears=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX+HKzvhnFOyVC
 WaadMkXvO6oq1oxHk/ZaEg92xRQZIkh7FRWyuvesGvRC1+3qJme6rFSd2+8KFR0hDUbRKiAf9tT
 Z/wOdtwZK9eONM1u0EtxaX2dDIxm1c6dMxoom3ulrquoCTeAvhAIPPtk+ZWJmxtJGwS8Bhb4k6A
 iO5U+RIglfkdhRE0qAwFb0tzmL5VGMIFacYwpkKoOGhJT0RV1M1UxJy14kCm/vZb2P36iuQBKCy
 nG4NX7dACDFkObZTKqNVs1sWaMxebInxO1gXMdayj+MxaC1dwD2HLW5n0QrGE+A8W/aFDA7nZ9T
 yHmHPCOXJq/+oWvrylGVDtKXyXMuyH0vGbvX/tQzhQ/6TlH35raCHnEaOSIyMEAjOfNW0ykY6ei
 qVMFJXGroC2V1kvp3uuhJJG8wHY1DHCHRgVsHS+w5AR6gf1xEJfD4KswQu/wN0PlK60A0Ncotz0
 2VPjxPNa8rG5VGPy0bA==
X-Proofpoint-GUID: JjrWcSTmYuqN-zm8rmv8PxPNEAZdVKS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280082

The existing DP PHY PLL and AUX configuration for the Glymur platform
does not fully follow the Hardware Programming Guide requirements for
DP over Type-C, which results in DP link bring-up failures.

Update the DP PHY programming sequence and PLL-related register
settings to align with the latest HPG recommendations. With this
change, DP link training completes successfully on Glymur-based
platforms.

Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
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

---
Ritesh Kumar (4):
      phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
      phy: qualcomm: qmp-combo: Update DP PHY common init tables
      phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
      phy: qualcomm: qmp-combo: Rework DP PHY runtime configuration

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 256 ++++++++++++++++++------------
 1 file changed, 156 insertions(+), 100 deletions(-)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260824-glymur-phy-v3-b67c4702dfb2

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

