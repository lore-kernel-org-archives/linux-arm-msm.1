Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BC43F23BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661655; cv=none; b=mBQ4q6U83fQrA84uGnjTcV4a4zdQNOGHYqG0T895AxoGWKCZAfVS3gOw3TaCuyKoRg8wBZip3bGlfNWPdrK16pvJmudqdaT0BapjeKKjKMEngM5jTW5InovBmtLf/UcuCsKP7F1sC2bsHzEvYn1Zf7Uv9pdDwPZMMwZRAW3/aK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661655; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XO8Xza2UK1WPYRWci1QdMfKsTMPrxwUWSZGjIiM8dBxCSi7G8bv82P5nccgUhQTtRKoY0hr5KISj1L14fg4a0WUfGBubWlge43pF7e8e8NDnSZG27OFAOWZPTTp3PytgDrCIYViEJJ5dUcmGZt5MFLpq2BrlcBYYUaQ4PQpcY+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uxk0dx/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJ/y8ARq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uxk0dx/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJ/y8ARq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T475ol3390851
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=Uxk0dx/3RKpivDjQ
	LfQ/jjnmplCoxQ8ikD8gZD/URWqCmvOuRVJOTMEwn2XsP6EY5v+YPl/vCDwYVy26
	bNtfTzYPwgeVa06CyX6+WvAkPWd6pbD/kGvwT8h4MPUt5uA+/nNRq1atzVnmRW7e
	3O+DkKYkcX7wnMuJAvFYsAyk2OXUkUz1yG5oaz6exLJVPQIv/Ax613xEQ+Ntg792
	iJNX3/TNZSDDokzNFfOKzK7jKsHs62IcmLBargHePrDccAfVAeee0lHGRRWtrCAv
	tVGNMYJnZBosugoNk4gwnvJaz+2j6F3Yt95aPAqNbv1+Eih+VaFSJWvALDEOO08X
	kRv/ww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkh6ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:00:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3f521346so4165758a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 23:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661649; x=1791266449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=XJ/y8ARqAWdWg19brfd2DXnMteLsXKmeHk5xhCBhLVOo1UapwYj+cEtPfPWZX9Kpad
         1V0yoz/CJKKoqwSrLtMUNi5DAOytKM3dAyRLZAgGEsu5lmPCGmzoni8wKOFzggJAXQOe
         jsoCopFEaX+bkf5WZ4bP7gEPqFGulrSf+2Z4gXVzkgfbrbYcleOtd7bW/wLwHsZqxK5y
         iizI0Dy/85EsyZ8xre7/Mr2olBXuMUhEDq63OAxRrW5ToDK6C2N+DljFt1dUTJSlT06B
         B2XUWHXOY8/3DEYsoE7aCcPhn0BNd1eOXuVlwnAjXyHD/lte3UAS6QxCuPbLjMVEZ566
         Fm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661649; x=1791266449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=xmEqATRA0aAoeyKZMicT5j7pymiMXki4Mphqzx10UhXbwdYFc6UmFY3TxInxUtVjhG
         PlGfkj68OviFb6b3dMsbkoaF0QvKkoZGTdFtikI3Pj1/EjcMY28Xl2mMiu6UNqn52n+M
         6WuruFtc2AeI7FG8g85Vln7Jjd7g9XSap8FwoGlEH9wBAJhIOCNN2INydyBBU5ChXqsp
         OEwbJgTE0FgvfZTsne51p2DrDctkQ15l6lu3TtGU2XXLRskU5c8VwmfYlG1crT1A/9VD
         jN5IdC0cIrqUxbPZaOUClT3mM6YIIdgApA1cdLixlwBayLtbL6v8tUB5QfNXUeDV9P/P
         KryA==
X-Forwarded-Encrypted: i=1; AKwUvBwabpVuzNtg+b711Xw6mCwpp89moN/SXwFPCWgfRNcnGaCX7vGmIyg7FMOnoeLIOWEXsR8/mRLbGOX2+ReL@vger.kernel.org
X-Gm-Message-State: AFq9FYIDY3C3rVAqKXN0RIpiJBEtJETABMvYQ8rph+vJt0F5dZR6GIZV
	5VAsg8a+cUaEFUlCxjoRTqR4MszbDLwlYhaKAzmER9CsHN2Jr/PtkW9kUENR+X+PDR1iB912EtQ
	wDFUdaf5qET1d7XJfidT9TZBlurHepuMt/vyboJkqN5zIZm9eQQbDUd0EcfU1qnXTjFsM
X-Gm-Gg: AYBFou1lF6/QrBlkM5aOt1omrifpf3XzJuZTkO0ow56NclpZd6Z2ClrhjadT8btkT1U
	y6TbP/GY/PsP2SaCGYKHMH3Gbj98TIm1Gtnk6R2JAp5W8b+CEOQ4Umlp1Qd/h5Ecf3o3tMjX6HR
	pDZ2c77/KWSycEZRFoRRsrnnShGi9V5+yWv7nnW3m0mfujpqbqZeT0r9KLrVguR+loofg3Picwm
	cQRyxnT5y8xpVGscyPDd1afgPFg3eD9GDKrop+gSxIeK9SamLpBjw+QKhtNbT4RTKLXE9ZZ3tmP
	dpwjCKUHYCRxfgc1PgUUQ1zuc5U86zn3mm7mwhT2zjXOAiFyZXdLHZA/dwVK4oRem0nRP/gkZlP
	nHk03psz8++VqBXebldc0aqz0pOeJwHByyhOWS/x2aa29fa3BYs+gR2JROoQcUkjagRmdxT6n0e
	8SfG9Cimc6cnxMz9Ia1bZl
X-Received: by 2002:a17:90b:4c81:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3a46e84ea15mr3549966a91.5.1790661648841;
        Mon, 28 Sep 2026 23:00:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4c81:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3a46e84ea15mr3549938a91.5.1790661648271;
        Mon, 28 Sep 2026 23:00:48 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:30 -0700
Subject: [PATCH v17 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-4-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXwgqmWHa5l4Hs
 qyRU4OVf6CXaDy2FilOno8bRUu1T+hKBMHsPrjRXIhBvAnpvNakz29MD16h3AfLAamACpoWrRry
 AlBw/80HMcSjiEqy5resU200HZVPX5odynKANEh/0hZpE08SXch/cCkEwxnSIufIa/wzao9MeIk
 pMz6/dblcyDdzIzQssz8Eeq/BOkFkpcnzj2VUw8vOGYkl2AnxQ5e5DRiHFFr0UJqEkmPpHuUS1D
 UbwFNnmEsQNB1/WFaEYLYJUY7xl8LN8ZKJ1r79IHVaBDksPGrZXCxi3oYVh2hxaPAasopcSLES1
 uCk+1DBimT0WJxKihW2zkeiJLgyJXK5nDKtzae69ewApWcupE78OLwYVDQfiGqOysWle7LlKrOy
 hqugRv/ZkxDScn0nlSNskdwj8jwBsZe5ypjtatnjwHfXpuc8DZzv5rdCXAaLJkQipl0RVHkv1ef
 g9FWgFM3z+PBU9Uc0OQ==
X-Proofpoint-GUID: 85_Z_FCj2TYyhjACDHZVJRt9G0YwYYwD
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb5412 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 85_Z_FCj2TYyhjACDHZVJRt9G0YwYYwD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXx0O/HaNmHV/k
 jjSnXXMIME2wC79Z8Pd7mLcxSi+sOC8Ml98qQPGJ7rdmy2uLCz1PkWIFOKBGgoX3OAnMhkG3uf8
 X1kspoK4ukY3tnAyWJp6DfsWZ7+HmHY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290023

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

