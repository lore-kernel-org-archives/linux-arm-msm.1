Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EB04AD4C2
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648096; cv=none; b=Mvg3IhXYVWmnW3IAhbsvKJ3u96oiGntnfGOKb3PXmZn8zkr40rI89/oTvUkRi3GGWTRV9pUCla1cLA2/qWnQzbmAiRS/c7iTn1B8v0FbJCgUFmFkNHVvaxLGhYBTx3wN9Y8+HYGmJ8DIsx46AJeuXRE4vDOppdhXeYgFS50nZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648096; c=relaxed/simple;
	bh=h+Yod//C9ABJOdlz4tQ8Uc4TcCrQxjnKtmbnCOGtn9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVS1JO4hl4C/dYU39l5Hq9J8ZZonNNWtvZN5Un3rPe3pNXDO5/il6yj10wP21qfduir2cPu6t16GB4WoqCbMEBmmkkpXcGAMGV5jzmu80JJhgQQ+EI8lX62dfnKxGbL4E69zlDvXu66cKCV4hcN7QfHVMom0rDoc2Alcryz31Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yi1FEODG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aP3JZsjL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yi1FEODG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aP3JZsjL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPx0k1490812
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SekhU1fTzGWLciPRzIPQ71NN08ceDfmWISX0mOomb+A=; b=Yi1FEODGMThpkakJ
	t64JEvYvk7RujjidIyh8y1gB+esQEISMv592LGmZ2KPE6nGxjgTbQ8Ev2G+SraIB
	er3vuZgxgccPr4mLl5K6eWbOhzLWg50NSLE+pFnpAx7ehjk0ZZYNOiXraqqYdi6v
	9oopT+3ox9Gjwwz7PWhpqbNuPhSiAZB01o+Jx6qVYCGZ2jglAyFdXV1r4p/aefm8
	lq0+DSrKGukGbKtG5uS94qHVkLHCyGVQ2TALAhFsPpqibDv2aDtoNMZuWy5cgufr
	eu/kC5dyJpZ5/Y54wBuKHoPEVPD7J8nzT89/giumZDmRm7Z16jJxLuRHUTNvykup
	ORwIlA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxhefk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1523550eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648092; x=1792252892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SekhU1fTzGWLciPRzIPQ71NN08ceDfmWISX0mOomb+A=;
        b=aP3JZsjLPdPZ4kj3cdwEf8gh3lrEmPpGrUMwBuv9NXrw8n94CzLwZxm0BLF2/8n9ys
         k3kqoDgen+cFweDE/Td2lTrrQTY813hm2WPtfzopDL6wmTggxH1Rg+TBNx20ZA48ocjD
         d1efd+frJA0tlntYu51Nzgh2AzqQpZJqKlXNCLsHSUvuvuWe3AR3HM6Z3+PYH0aSkjpE
         0Lt4m7Qa59BquSWz+q53IvDCoLOpLU7GVIE54r/KbxDbPrnM0aW+TuHu72kas/1Ciab2
         59nyjgFXnJYx4Sx31aPPp0J0PtKql709wJss5iLWGKCmS+OdAboyvxQ6Y/WkGSHYrUuj
         oMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648092; x=1792252892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SekhU1fTzGWLciPRzIPQ71NN08ceDfmWISX0mOomb+A=;
        b=1SAMun/mtVmoFXG3EQ4x/KUmo2lQRwA9dpwnM5B9OoQQvc+BeovMrumt5wo5RN410D
         ZbXdylhITjuX6SEMLFG1U66iFnl4WM+NzgqziWbpOn/DlVrc77cFS8Y5VR/qx8O8/X2v
         Zui7nnGQLiKxkGJeI5qru1NCIYkcRJ4GbDy56FlqgYaydvaAjAN+6JLikEuR7jfg3oQq
         eeSEkLkbMcD0ACl3HdmfUg5l1iU2dUHhAjorXIkNNV4VA9gkluf6BDezUv+PeHick9Tw
         ATNkZV5ZtUSavAAkUVrUgh27FinHP//B2BUhzyVL0VEiiEGJxl9V4j9x4utZKWySXNds
         8kzA==
X-Forwarded-Encrypted: i=1; AKwUvByYPUjoO5O5I2AQ9nQYaNc7tjSq41sde8fQZgSsWSPQ/bDo2vMHMIQUHLwMO/A/0+LUT+EDDsC3Uougd2Wn@vger.kernel.org
X-Gm-Message-State: AFq9FYLDqGRn1URbxjdiFHYKOeIvq39NglfKtq/ZA4IplohQ6zM68S2P
	my5nyQ0JN93xoxh8ICs3l+j2nOlc9bqKkifKCwZFwRRcC7Gpc8tOamlylEeaOMomU99ZTFA2jnq
	iLeJ/lykXsNbz3ZH/2vr/abVUfxnZO9hEOTltqY/ET0uyEWWWNpKOUy3imjoi0hD9Nfd/
X-Gm-Gg: AYBFou3IIdqltcoXVdPcmt25C1jiL8VED5myTrSoglZTpQN0BNLlWgheXldMCi8+f0r
	TNmZnDoIMXHW7YH3SnNMZLobYXzwqfzwOHOCA+6beb/lYRI+I1J4DOBI1jNvamMYTILEpgcxiRk
	WoWl+e1Y6D7z3GKUshBmUnszZ79rhF5YYDF5nwRJEMfRF73h70RFh2fuW0JaermtSBDHR2CVJ3l
	DElVVtmVD5wjIrpzcfpTWzhG+hEbNHzvs27qh1URXpjKcvfW/xEOlh5KvsyLGwQJ8uhJcYOMqA0
	zP62WvnrAT2FztMEVx+0T6dEodrtwkAp3cXd+g2rWsJYnOu7IqtHNbcor3e7TUOXZKJO+IxpLBl
	N/MAARupEmJqN4oNF8iLKNTeIMi6cSOTBKx5saFjHqcu5aApKnN0n5lOtgFZhvienqTOvmB0cA3
	gO7piOvqMMGA==
X-Received: by 2002:a05:701b:2059:20b0:149:c766:3629 with SMTP id a92af1059eb24-16a5f206f32mr6681281c88.23.1791648092012;
        Sat, 10 Oct 2026 09:01:32 -0700 (PDT)
X-Received: by 2002:a05:701b:2059:20b0:149:c766:3629 with SMTP id a92af1059eb24-16a5f206f32mr6681221c88.23.1791648091261;
        Sat, 10 Oct 2026 09:01:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:30 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:14 -0700
Subject: [PATCH v20 09/13] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-9-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -Er2z44WKp2IrP3FWlUPffmR0Z-sFggX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX+x/vXJ8Ei4OF
 R/g1WIySvcpnuqNr3DpeIflYuZEFsPeoQzPSJDdJibcTtO6TrMAyBJo9UC4RTV5Hg+KYrao0Yfp
 3t4W7kVnOCoj3AawNEB14BL9V7TG+xQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX5Z6jVJuNA/jO
 WWKGX5PWm5a3TY3Xs93zHk0afMO4TLb4jPuhxxfCKroiEU829uGwGzaVYWeMi9ySjpCDRvFJ6gm
 JtxPncQ45d+Pt6pK5jNW9LcSXSBXSqJ/VQy1/fzuf609DMcEZPKCJWRcXPj5Z2rz50hMJLHemSg
 wD9J5MgqStvhzAncVt1cbcpWaYIYEzlB0ELaZxobc7r7IQDdR8o4Vt5TFuE1LzLZlYRhdWEfgHs
 uGl5l77sBfIQKluZYsH0f9okfTJikowjg9OJapGo30P3sENM1Tz+lrfx5rAaIwjXnD8aSJ7Rz1O
 QkVdTmGt6ZJuFrS4QqrxR2sL9cGpHIgz/SISWTmxhtt1N+Izpaq+jJs4HHC8So/lIG2wWSxZNN4
 sPFBOY2qD69Mjn3tEB84R3nP83TiSvMB7oXN9fn7D432KquCtj3g4QeUGotzR8TE+/GtEEg0iOt
 52IKfFNXijxEVxI0C2A==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6aca615d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1CCqUJFLb0VynuEnu9gA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: -Er2z44WKp2IrP3FWlUPffmR0Z-sFggX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 46e443e05195..851b3cd712f5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,6 +142,7 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -148,8 +151,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..cabbb2638cf3 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5cd9641fea94..4e9447e11f04 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5863,11 +5863,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

