Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F11492E40
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991262; cv=none; b=DHRO6KsnemPIBM05VZf5mXJAMMEGjKHPt3iAjza3NrJ0sL8/ZOlKe5ZkezTS9wBuIR7ob8ZohAs7mhJT2yqMSWAhEIG7u7NO+fzoMS1mvpHZvwyetukTZRzccQ8k3hSSV9EgijIl9HnGynyjO+dLLnpkNxagR0nu/XJ/C9sNU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991262; c=relaxed/simple;
	bh=XshSWTHvTP9OXUZSO9at19zLRnoCBRzGftqEz+uvK9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uO7CyQTcRXydtQv5LR29Ax4VXF3xHFT80wwLw6Ucqodp0S6gGVnWOXMg+Pj0lND8LhRqus1P7AOMGDMx7fZVd9/+JqpMP7IpQMqSGA2ITq7faj2C+m+L8PcK27nX7VaQXvAS3Doz9XXIxRwvGDp06UMJ1FVtSKQ0h1p/6XAmMzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxUvcbL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITIDbb0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxUvcbL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITIDbb0C"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4sv71130250
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+24Upnppi3EWfz3PXQPHnimvy4U3gni2+ICANG0KKY=; b=dxUvcbL9JI0ML1W/
	OyqKTg7mokenEkaXm7g9AjJofaBJ0aRQJObP+2lF9FTWAsG1uDyiL5SqBz1YkaI2
	iASSwtdHOn4/WqYErCwHyNBef8GWnqhDISlWG22KcQHA0Ov9ZI0hm+wIiTxnvJPx
	MqicSuN6FI8zMXgYC77sDsdMrGjSOiQeBSjKW2QGHZYG2wGanXf8DkEwMDMD2A6t
	K8VwxwFyIioEA0+4+2No5EdPSUj/79/QEllRL6YTyL0a0bioQ5jUH0M5KVJTTaIS
	z8Q/nqWnalBgUOXk8cEVxmlzCM83CZjSxOTwixzWoVrPY6hPQ6w/EXO4XUhw0F/o
	Bj2Mkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg59m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:47:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f925ba4eso411324485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991257; x=1790596057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+24Upnppi3EWfz3PXQPHnimvy4U3gni2+ICANG0KKY=;
        b=ITIDbb0CmkOQVkxTo5WcTFwEmJ4StA2UIERRs2p/E18YqeRCrj5+pk9qyi2R9kl3R7
         GEVfCA08sXtN49jk22FbXRPHeH7EmfCxXMN0kmhMG4sznPEgSuyhEESTR8ENIjdZ/X/7
         U83fKLk4/2Tb6o6Ve8a8KmncWbn9rKx2+E/gbKSrdBS/T+5KqwBBLp+4TccFilEp0Q79
         wFU0oTYT+QsCspa5fMiiclJCoQKKdfxLJgcoMnCttb15LQgf5g4yFRBRRfxbvrtF2FLz
         joHZNV8byK36VfxX+Tw2Ev2CvPUIw9rPBktFgj6PLNbuJw3rxkCLwQhZez5kvh5xDYu5
         Busg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991257; x=1790596057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+24Upnppi3EWfz3PXQPHnimvy4U3gni2+ICANG0KKY=;
        b=WMVbUO9AwuCUGrQJELemtPpgpbpTAWDXZKcpU2S6dsHFRcwLF1SScFmy/DIajps0nB
         qUF5dd12fV2oq+ZTJLtWH2iFnynt0Vwffk6dZDZFWkPHZUf068usVEivVjvPGe+Y3v6e
         J+EQ5yp47dzKfz9iKw6pEPVa5Kxh6Zu1Zv21d2oVOd+TKzFItauY7jg+nAyeTKyqlaiX
         NU2L5+hzVB72ILDbbawv181lW1+BTi29HI7rH8AM8sUPP1lI8lmhUV68S9pdut/MfArR
         SvJZ1WirH7Wn0jL3XJx+neYb2+c9x1+/fUx9rSBbeFQasQWZXOBl4HDB0HZWHVBEdJlj
         F7IA==
X-Gm-Message-State: AFuF++kg8ExUBh4xTL1CwBhQopLbX6wjWr2xcARbeKbTJdMbkBxGEh7T
	hIajzNdzN6rgMSGpqG/NFJ6UlIzPDLaMXZCqrHeNVJC4QISQPEaWmLvUXzxOxVNSvcyPnnbsCln
	RXmW86toII1UdfZbg2VbbwBwHiF/39ooxYu71AeEIxUvxDjc6086o0h76SwCNUO4ZMjnE
X-Gm-Gg: AYBFou3JswqYl3sbyaxnYp85Uqi+OYnfI3Jds+g/1ZtutXo71opowXOpM6aaeiq/tDO
	r97d2kfJjGFDJokm1DROwNl0J70Ghqh48V4zFDh0WD1GigALVwrtJ61MBYtK0Jofh4dMMkh2Ofo
	1x7aX4WhJdpEqaKA6tOZSmP2SSj50NYSwgeA0II/cXzRq/RMQsGJGMIbjrbdPR+KQ2GDERbQUm0
	4W4WfOWmVVeQ4c8uSqAvHVYGcSrTvtqVNM/W5F7YKXkadCWWkLq8/GFwJ320vV6kD4mr62jTpxM
	KzjxiltbY/yDRYApSVZKLgl9kkv1R1NLUFIdLSt59A6V3MGCd9+csiOvz1ITrsvXQopEeijMCMT
	f/EpAi4yYTV6uim/BRvg8OkYxAgQ=
X-Received: by 2002:a05:620a:440a:b0:939:5cd3:75ce with SMTP id af79cd13be357-93c15d6bdb4mr19672785a.8.1789991256933;
        Mon, 21 Sep 2026 04:47:36 -0700 (PDT)
X-Received: by 2002:a05:620a:440a:b0:939:5cd3:75ce with SMTP id af79cd13be357-93c15d6bdb4mr19667485a.8.1789991256390;
        Mon, 21 Sep 2026 04:47:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm227980625e9.7.2026.09.21.04.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:47:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:47:07 +0200
Subject: [PATCH v3 3/3] phy: qcom: qmp-combo: Add USB3+DP PHY support for
 Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-usb-phy-v3-3-68aa02b12b96@oss.qualcomm.com>
References: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
In-Reply-To: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5285;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XshSWTHvTP9OXUZSO9at19zLRnoCBRzGftqEz+uvK9M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsRlNb9giajyrI0VXWmmuCh3xMZ4Li6v/s9d6T
 pKgPzaZpReJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEZTQAKCRAFnS7L/zaE
 w8TvEACsjPB3qLP1A+6BiMJ0Kx0ai1ygIBtv46mBcDnVnethDUm7MKDw6DpkjODEvI5Mvjpvhth
 djonGl45WiMoqUTPrhoDEXkQOvPyqNgmn0/KtqeNPu6U+z90QX/oEV+cG3gtkZc2yfMpt8/qgud
 Ew/eNCYR+64b4J0L2qyZ6htpYLaiU161OI3NJT/dd70kV5eVloEpA01izxIf+93eV2ggUvhIm44
 eMG+YspvFbEdrQJTNFM6CuLjyxBgfYaU/qbBb9QMwX0bvk2dKKHVZ9j8Ae4TII61iLRHAfffAQs
 9YHPHnSQC+IumezTyG1+rD41Qd4G2+Bc9z3OV3za391pMcTBD7i2Wr67MJGa35UXXrjkWOkYJzm
 yAcFjzCOHSNPVe0tQeClaXc4OI4nxtOMDAqU0Apzt35v9x+BzAkciidJ2dbRX+vhFrNeWSbvMnw
 ykQc751/apO0VED3sz5nuOIoTdGYCGX0JBMxXKvLOWobKTPA8ROYXuRZwp0q+9IG9BHYwvxrB5E
 9TiRw6lXmocSxhoXQqdfuXZFYRhzfaqmxgS2YpzG0jsmx2KGWAClavMvzeHQpFgd7yqALYAPV6K
 FaZKyXenQjwpUytOdMdRtry6QK1oX94jpBPalis/7X2Kk8jgiph+7CEa+OW4qzrq3HIVQw2aocm
 QDAaMe2ylGvHtkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX4XlEd0B0fprH
 zHT8HBCnX467wRQaiqKc2l6Er+Y6c0g8mSvSnWd6HhYUL/xyDQvLW5ZPaxwSeDdModLZR53E3BN
 BexpTlKJZHR7DaOgbnvAGfpnlyl8rfs=
X-Proofpoint-GUID: Cozz2QsmgEvyVACnlDpTstHGh9O-Ciyr
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab11959 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mRaulJff6YCFnxtsk_cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfXyWl151gQ2Njt
 flyOJOesSYJGEFpiuAdeggx/iEGUEY1PmbYMqxx5OnAqHY6KRulVr/fCwX9wDCKymsLMQrkHZaM
 yrotXD2foGs2dw4kLND3JH1QDaQ6nfUs0p2+raPbHiBXVRqW7nHpBsbeRqDlyJOBRSxca/YfKdn
 oNIF+I11X2100ZEM/J/Ph8r9nW4w6lz0rVyIYVwF6BSiMXnROjPLrQBgFL2Aab5hILbCAHcHQx0
 1DZjOeBf+rDjmMgfTYGeyWFjkv5MSePGPZdHadUDa1byoGSC488D5GwPVJTRWuN+cxRXPt3jSA6
 cFc1uWu6KHRPCm88sFRTSrwC1vc0nu9d1m63gxY3Rh7spjrJbeTU3OXQa1QZNXu+XHnPgiHX4Mr
 +jDy/a+vhX9qOkEm31BsCzwWQ0MBVeTiD2CR0No0lda0GDQ/8yupgJNAoLBHgdlEDwwfIgFa1rL
 ORlbc0IHZTzpvLmgDkQ==
X-Proofpoint-ORIG-GUID: Cozz2QsmgEvyVACnlDpTstHGh9O-Ciyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210170

Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
are identical to sm8550, but the sub-blocks are not laid out the same way:
Nord adds a dedicated USB3_PCS_AON region at offset 0x1e00 and leaves
everything else where sm8550 has it. None of the existing offsets tables
describe that, so add a v6 table which is the v3 layout plus usb3_pcs_aon.

Populating usb3_pcs_aon changes where the driver drives the I/O clamp when
entering and leaving autonomous mode: it now uses the real AON region
rather than falling back to PCS_MISC, which is what platforms with no AON
region do.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 80 +++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a4f130fc33e3..c4e88b0384cb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2356,6 +2356,20 @@ static const struct qmp_phy_init_tbl hawi_usb3_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V10_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
 };
 
+static const struct qmp_phy_init_tbl nord_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_4, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_5, 0x5f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RCV_DETECT_LVL_2, 0x14),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x21, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_TX_PI_QEC_CTRL, 0x05, 2),
+};
+
 /* list of regulators */
 static struct regulator_bulk_data qmp_phy_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 21800, },
@@ -2720,6 +2734,23 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v6 = {
+	.com		= 0x0000,
+	.txa		= 0x1200,
+	.rxa		= 0x1400,
+	.txb		= 0x1600,
+	.rxb		= 0x1800,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1a00,
+	.usb3_pcs	= 0x1c00,
+	.usb3_pcs_aon	= 0x1e00,
+	.usb3_pcs_usb	= 0x1f00,
+	.dp_serdes	= 0x2000,
+	.dp_txa		= 0x2200,
+	.dp_txb		= 0x2600,
+	.dp_dp_phy	= 0x2a00,
+};
+
 static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.com		= 0x0000,
 	.txa		= 0x1400,
@@ -3424,6 +3455,51 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
 };
 
+static const struct qmp_phy_cfg nord_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v6,
+
+	.serdes_tbl		= sm8550_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),
+	.tx_tbl			= nord_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(nord_usb3_tx_tbl),
+	.rx_tbl			= sm8550_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8550_usb3_rx_tbl),
+	.pcs_tbl		= sm8550_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8550_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
+
+	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2	= &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v4_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+
+	.regs			= qmp_v6_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5621,6 +5697,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,hawi-qmp-usb3-dp-phy",
 		.data = &hawi_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,nord-qmp-usb3-dp-phy",
+		.data = &nord_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sar2130p-qmp-usb3-dp-phy",
 		.data = &sar2130p_usb3dpphy_cfg,

-- 
2.47.3

