Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59139734A
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018157; cv=none; b=dzTP3I2w0tR02Zxg8gE//DC4TJ+vTE3WmIJLRjjYJKOMdQTa8salbBXHn+zRCFHElRbOgH/AHBBLckd86KjuiGiYjQ9g7PBqoU4NPh+zUEgRX0JRkzpnlfSNrhcPxmhEjdFq1MQe86RN4tEHkMasYViY/Vrl1Qw05go3Uysy4Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018157; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFz4uC4fRUAasgQBdhk3QGbpHYBlkP4IlU3EzNOmoTOesmEeFG7EvyFpLykygmMwW4DkOVUv4BtIA5A9/RqDilMkvjZv9Pj2p6DTKBgNewlXz+M/RmR94q3cWsOttLtGQMVGBiQYcnMqFtxxH0tUH3EvvR+Z2tOkQ6o/EgnzpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5WKjWIK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHXeE3sr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5WKjWIK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHXeE3sr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933jjE72451524
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 09:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=B5WKjWIKfxcdjGu6
	tTcw/DayoxDJFpFG42l9y13TdTxdx4XkM2HRv3xZ4ldsDjc6OEXLOsXU9i+tQTxJ
	XsQoQE/M+b6KAqgzEyMb3zOdGzf3MaFxnEJmKM57I2vhdlLAHc4++zDmc/+GniqL
	0Wwb/D1YO36vajvthYxY3o38TU9zwEHgos+Tw0xQFACRli/GRmZFMCXlMS3SRpvW
	aY+/Ct9baDu0uEHfyE/zHf4MqBLpLHi4NmI9jqwO+eXNxB9l3JxA2zBfWunU2vm1
	+QosFTMDRciZohUqDkBWMvNPcu9S+nEfwBZH0VbibEugcR9KZ3g4A/JnHQRGzDzo
	RZv2QA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t36gg76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 09:02:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510a481ae9so264265eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018153; x=1791622953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=XHXeE3srdnYMyG3wVKj62ufSr80hKen765WSPzRpuihMKQokXplBkP4X3bp+cOMXrf
         a3O0uZPWDvGassoCdNgQThw8jvc5CsGCPWmat7Vmr3fkmYycRpOZl3ioAzN+SW0OmpZj
         jk0df+verZGFlvavPRb/zLWlkqYHpwSXPi/h6GxAk1dZzSaAH2d+M7M1e99a5r2+p1+X
         C0nLwBDZeGDTz1EjZNj/02MjQxYW7VFgCBsrC9OWNcXD9ZDUnYeImKRywKCNCjT5VbtT
         MbW+Q6oaZnvzjWVtA9qvROeH4OysQD7ou0mqjGQhvKTJmZLCtze0yI2KjxzMyKwxcPY0
         hSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018153; x=1791622953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=ySmtMSLyD8U1g/9ngjEluoXP62unidpSx1nTO0kLDV5MSeAvf2lrz8qbLitkooEADA
         gDHvBbswoeEN7eAPGnvLn/vY6kjwsG5p9CmxGabvE/8P04Tk78QDbChS00oOrIstScUW
         E+73tsVqz2/Z4OLvBJDIsDLHWCzMlCCgLJOZBP93ive8GIpu6gIPOhTZMjHBjy2kN9Vd
         yKUjMa15ay0UQgjsGwWXbeLjelIsMpAeu43cxF/mmsmbXW8AskSr6XQg5+57Kg8vT8/R
         z4p9q7dXk1d45dQVfsKgnzdruckQHzzrKTOlq/t8PmmVB+UkptcoWTOaNBo7RTnw1Ux+
         b+rA==
X-Forwarded-Encrypted: i=1; AKwUvByA1+6HrlURPS4VLcvpjINQc64oq5xwrAF6IabnnGmhmscMbIO45KoYbx6OfjuSNhl3tWlNMMkOUqmbFvxl@vger.kernel.org
X-Gm-Message-State: AFq9FYLiA6Mp8JGYfNbCcP6veuWH2PitAnyxYB8XT+MxQHp6t53bDy/V
	11U5tSfCn6czAebt/XNV1tutw0ys5fixCdbwkDPlT0rO5vQNxiXe7TDpRlTtrAff9BMYpXhtANb
	w+mpL4f0FwXSxCC8zlhbHYPxKrlqYk21P/ceBFx86paUxjCUqO17Bb1dRwopYIxOpjDy1RYVSh0
	dZPEs=
X-Gm-Gg: AYBFou0056rpZIieKEHKR8PhznJNVjSAKP07tcVhNKKaGG3kAWeO1IapOtFRFtzPX4C
	HZCvxOrPIB3rzLEZxK4hYa3CESnhLtbS1AVVJJkPypGG0S4g5Fq3fzYjJfL058Er5T0jDAwO7GS
	FfdilL7eDz8odY0avGETmn9LbxTG8F2j9nzQQf8rXJXIzTQERoWYxcFwfd8nfG0gKiAMDtB928W
	rfCyxksblB2oYEJRwT6IYfBDy72Rwd9GO/6eyuROMEccERwPQ+TZ8ih/HhHLuLPhSZauFk4a7J9
	T+ZOLUo3cJ/NNEsLtdq17DIPHYJdr0s2znGUX98BTSarwnqlly95u8slQeQSrHE92PxOgvYSiB5
	xvSBQFOxhehvOPdPywKqoJOriDiLNee66sjuVDEiXw0Ps3wkKbDv2cDq7tW1OdsmApCjbNG3TQa
	nqr6Cek285Ag==
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr5407432eec.16.1791018153045;
        Sat, 03 Oct 2026 02:02:33 -0700 (PDT)
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr5407401eec.16.1791018152432;
        Sat, 03 Oct 2026 02:02:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:15 -0700
Subject: [PATCH v18 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-4-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX3wcYAgBnRG1p
 VcfkQlxVlYwp4WIE+cxbva0Pj9o6f4U5dRIGoTnCW8BNO9zbwCfZrKZVDCVsa4TcErFjud61sjW
 YRj9wh2RH+Fi8AVhDsbYuIktl3HltdM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX/5GOaoyoqWP5
 RgFNmokAq3vV3DgZJIJFp1p00pv4ix1lxt8eyOT9BwZkMHCSqKBrQ/qhfYTPYoeJG/MTj/7gb5y
 cU1evjoAt9/uez6qX4wbD/5Q3ITobLMtbm3vL7q8aYgo0B8uMHHLwt3xOhKKSWO2hi2W7bzKxxu
 OP6U8BOUDsdqpX7Hit95b0IxC2O5KEYHnUY1ecIUgm6c+O0txFB/9eHOPACVv0CNq2Ab50moxH6
 tByHjPDcohoB99uUdaZPXSiK0F70O7uhdIYE1WRvQVqf8F/NukHp+ZKsYlRFu1VQ+an81a4lZRf
 mKCA7VKeI1Aiz8vAStrLdjt+HqxqPNOKbI+R9RZVfxQ+fbRRvJtVnpsM3lDQdtOC0531svY235p
 BsXYeTGixEO1zG/Uq8HylD/5wtS+iE5cHRargvh+ay5w+57DKK7UnT4zQMmYUmaj+Aoy55uXJ9c
 mztKTMxeqXnUS1o3USg==
X-Proofpoint-ORIG-GUID: Abfz0Cym9HN1thdazEWY0IvhG_d6_sXW
X-Authority-Analysis: v=2.4 cv=UpH2pOwB c=1 sm=1 tr=0 ts=6ac0c4aa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Abfz0Cym9HN1thdazEWY0IvhG_d6_sXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030035

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

