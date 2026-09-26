Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7D3955D0
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447874; cv=none; b=kW6gZA9hW+9lVTidFCgVvd5HMSY1b0pVvmzq/XUyCbJZUsUaqKQkpgUYfUQ6h0O1LDfxBXF8izXyc/eVWGR1DM3gHj2vgL+ybV/tX4ce7EVYf8BVJXvLYOiOfO42jpI9SeSvn/0rW2IiH2TBgfZ6a6Jibmj3jVXd7g8xl2Eao8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447874; c=relaxed/simple;
	bh=cqkNAH9d2Grkwf/7YUhP+4O0O3CojYIEuW2nlSB94H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FB3u7jR3slw7oubONqCwGj737xEcwuGAxGInUqhu3K/R5t1+AnrDesA5Wdc3hXlTpf0BZiK31B1N4TaDgNTTDeNZQOilg/G4MY5hHAiezRuE2tSmywmk8kvyq6izuP2ikk1G4GhBDEmV1+DQ7VSEyIZoqdFLVO/x2GI0Rle8BUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeR7zoUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KD0TCr7N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeR7zoUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KD0TCr7N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QH0C5B880421
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l2VuXWYOKFZf7/6rPPC4Bq
	Hn8CmS8LQvADsXnTIar8Q=; b=eeR7zoUzivUm7iNXwBE/XeGYJybkIyPATwDZuZ
	IaEjJz1kK67BdgzkjuPjCZ6PydhGRpt5TwDMu65hWt6BGQTX7zRWkulTgphR6d9q
	QRAgDAE8soGCmYjzvnXSQ7F8GnKx4AO8qydKCSe175Oqo8+TnjzcKKMBT7bnbE+k
	i8SB0BPxVvCcakwIa0j92oR0IBcK3Rmv2DfjG/yjuPX3Wl9FmgaJQCFPiBd4fz6i
	vOGYIbi6Fksq7/OV8C1s/q6PVVxmiZI31JDuhBUSfUzrYlQntMP6J0wGjEaDn8cE
	osttk2E4ef53EMaGiCjlaEcfuTRN0kxg8gS6IAOfTITcytPg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw9hr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 18:37:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so4172939eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447867; x=1791052667; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2VuXWYOKFZf7/6rPPC4BqHn8CmS8LQvADsXnTIar8Q=;
        b=KD0TCr7NYayBo2tiZLbvAsUyIICYt3uXcO4VBjiPGuzr+5vg7rKDdNhjXtkwWJv3hp
         uByjMvNM+JMHngSdVLzFwUyBJXff2tf2/tTZ40Uyvmzej5QNqitC37oeoEeLwrB/GqYl
         /sCcGlMrk99vkmRNuuUyubAOz6B2CY+Owza3GgyWjARdpkb4AlptUeJ+KVNaoJF4zW7C
         0dipffinfjTE+mSO6iploKa7CCRnwhGs7R3XOLHUfN8F61idOK1Z+ofWQ3tcfGa8yqqM
         pOwBEbZqKiOlbWjiqoVD9cmCo5GbxAAEISgE80ACNPYEa4HgB721GmS1lppEZydZIOxP
         oW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447867; x=1791052667;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l2VuXWYOKFZf7/6rPPC4BqHn8CmS8LQvADsXnTIar8Q=;
        b=ULp8RgvmK5EvgUtcH5DSwMBg1fHBEf0I8qUZs5DmiLJCByRCgyyXH47M2MHoixVZcn
         2PQ6LOqfIg4HN42BLNQu0SVD7eGTtYhtHLtz43ENI+trKS0iZYsQBRtB/NezC3pfYc9+
         KikEcpy+wXPVitshXo+X+kIst0RX3/Tg+WL7Zu+B6bTD8dea03Kbeqvp3CBUaTDJyfDV
         E+tCOLCzXutESUL7Bo7xBv12dlrIBa1XIOKO8MeDPy9HAdwiTdfl77r7gQmbJseMWJKf
         dlRz4oVoU0onOxTf/pmzrT3+jASwSEUIAZPveT1Ml2hD8V1tDvVWHdnB3fryj76adTHC
         ilHw==
X-Forwarded-Encrypted: i=1; AKwUvBy4Li2tWqMbbH2An3hy2Aef03XtWGg/4P+xFWPzkOIuuqcKpZHoOxaEPOWwjhUc47ST1tfHaJAdhYYN+SF0@vger.kernel.org
X-Gm-Message-State: AFq9FYIx4yKnKEDNWEeNhOKjL29jsmvSZX4x3xf3FHppE66NLLVs7E8L
	JRdhngppZd0uVWAjj8718E5CR2BD9tAq1Lbbs7+/KL74SjA87YdoTD6n7Q8ZmsNL5jw/sJbwheS
	h9mAW9pcfxgGAdqhoreQDukrjWjDfkVvpzq6clWeE0QYbQiMeYSbLzSYAErg/YvUXOmLi
X-Gm-Gg: AYBFou0K3H+/02WPMxHgyetWKX0uNJA6YxpOlRjK33ao1xZvoYLYEwxywlw5eu5Fu/A
	CP6GDyhqL5hp0wwvUlz3HoFUli6WB806uSm/dtxfMA1+8V4Ws+XUHyuIm7jMlvaN54rH8aWdar5
	8KEy5Iw8QiO5vg8foMxLIqux1KThiEHh/0U07RyvRAIBNaLFDQs2FaZwbGsA88sItY7lvS/E3QO
	sBHelyyXvUJV1BqXdDc0PpEl/ZNY0rHo7IN9QB1g4SxADCgwyfYYN6clmP7XUub2tcqxw5dP6AA
	RnbzN+ZRmuQj4+VoAi5SpJtEDohMAyvJyUE+NDZgcgIE6bT0WPlEr3d6SBnPMrg7poOtGDrQcl1
	fZHNrIQ1188icqWpmbm+DKYQ=
X-Received: by 2002:a05:693c:2a06:b0:33c:2457:bdb2 with SMTP id 5a478bee46e88-3426fcc985bmr3196754eec.6.1790447867216;
        Sat, 26 Sep 2026 11:37:47 -0700 (PDT)
X-Received: by 2002:a05:693c:2a06:b0:33c:2457:bdb2 with SMTP id 5a478bee46e88-3426fcc985bmr3196703eec.6.1790447866077;
        Sat, 26 Sep 2026 11:37:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm18705762eec.15.2026.09.26.11.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:37:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 00:07:10 +0530
Subject: [PATCH] clk: qcom: camcc-nord: Correct camera clock source tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANUQuGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMz3bTMivjkxNzkZF3zNANjAwvjZIOkZFMloPqColSgJNis6NjaWgC
 GV38OWwAAAA==
X-Change-ID: 20260926-fix_camcc-7f03083c0bc5
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: uPjUrgG5jt9pXW6IbLwKBokQT3EcZa8_
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab810fc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=najPtik4V_E5PoWvo3cA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: uPjUrgG5jt9pXW6IbLwKBokQT3EcZa8_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfX3RUczzYYuOWH
 au3lDTlaDME6uJp9/pV/I6mkzRrseMR+jnFpSc4IfrXYlwGntFNey3rcRbimE4IRx85EjYUawgE
 QO6gpwVHmfC00g0lzdlRP2S9/k92VMWDqAhpG2dpzp21KNPE5sZjDiW+J1pdke46foj1oETMPr9
 lC1bPwMQXaDKLrrZKOC3kJW+5lssRpW59wCcfoRGO5gKJNKJRegdrTbPZLTZ0Pb6Sn1EknrYSFR
 pK7GMkuifSBDIjBniOodqbljSqrK4hdO6efn+BYxNXWahpGHLV3j6U9COhcuzfN2g+y680uGqfo
 3bOiAhMI62o4FkjiCmfQSCGoHPonCEqrrSR6+oqnH+RoVPnZxqIrKqg9TaxrIEy94Ncf0Vjsnd/
 kdfgfd1CITWh5Duio5DlbQK4i5GHoCmnq4Uv94ssdKvtRlUDC0Y/xcJY7+SP8YghMq9BkUOSUAH
 LmR8Ycgjjy0dTgSeULQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3NCBTYWx0ZWRfXza2K3OAulWyk
 20iGH0qmky7O9MGBLcDdmQTRkGcJYSBt/lJA7tO/cAaA6siXKH/FniVxK3P4ta2pyxV2boSw/ri
 gA0FJWJMFEN1em7Uzjmk0hdRKmcMykE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260074

Select the PLL0 odd output for the 200 MHz and 400 MHz CAMNOC RT
AXI rates.  Use PLL0 main output dividers for the 300 MHz and 400 MHz
CPHY RX rates.

CSID and IFE Lite use the CPHY RX rates, so share that table rather
than duplicating it.  Remove the unsupported 300 MHz CSI PHY timer
rate.

Fixes: 7647815dfc8f ("clk: qcom: camcc: Add support for camera clock controller for Nord")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-nord.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/camcc-nord.c b/drivers/clk/qcom/camcc-nord.c
index 9e3c40cb3ad5f06196bab87593afb7d1c7da411d..1c1314340b92f03af442b82a6402e442f1550a2c 100644
--- a/drivers/clk/qcom/camcc-nord.c
+++ b/drivers/clk/qcom/camcc-nord.c
@@ -515,8 +515,8 @@ static const struct clk_parent_data cam_cc_parent_data_9[] = {
 };
 
 static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
-	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
-	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
 	{ }
 };
 
@@ -622,8 +622,8 @@ static struct clk_rcg2 cam_cc_cci_4_clk_src = {
 };
 
 static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
-	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
-	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
 	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
 	{ }
 };
@@ -645,7 +645,6 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 };
 
 static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
-	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
 	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
 	{ }
 };
@@ -730,19 +729,12 @@ static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_cam_cc_csid_clk_src[] = {
-	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
-	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
-	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 cam_cc_csid_clk_src = {
 	.cmd_rcgr = 0x13214,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = cam_cc_parent_map_1,
-	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_csid_clk_src",
@@ -889,7 +881,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = cam_cc_parent_map_1,
-	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_ife_lite_clk_src",
@@ -905,7 +897,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = cam_cc_parent_map_1,
-	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
 	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(const struct clk_init_data) {
 		.name = "cam_cc_ife_lite_csid_clk_src",

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-fix_camcc-7f03083c0bc5

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

