Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215096;
	b=yqzPQztcMbVDdUVMyq0Y2PqbRG7qb1fLnAjOO8V0bXhU3SgKnW9i9AoOP1aiURwAJ+X1
	 hby7vDN/iHhk6nC8SytC2cVoACc2ivvphMJ/dvNAiQ6/K5GcElT88lnisGCw/cVL4FSnU
	 Nly3i0/6Z4nh+Tf9eOVnDb+Y26J79k0kAVLX63Rv8wCCJmTOD+uIS8Oh+2b7DTifd3vcO
	 6SHjLMTFxRc7W2cdjaeKebwZA54mFIsq2gatkM8k+URMlCS7we4gIeXAmiGdoVZxQuJ/f
	 rdXLOVrTeqrVrxzgATWKS5Tm7t6BB0b8KSQ0huAKG6CuO997jG918SYmr1SG2FBA30A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S2OdxKrYsg8o0XxGHeaf2oT/9qajxW5QJ437FyTV3l0=;
	b=w10a98p12zKU7kG6pmRmWHo+e86JrYOC73VoGNdV85SMNcEkdCTq9GbMBDu6hxIRp10S
	 a7xzi+XZRBg5cm137s/Tdn/SI7OcuKB3YapVW672hH6rY+5gr0I9DCQZfqIt9FXEzkNz5
	 loaooPG631vuRrqecV4kiW7LPCQXbtFbvK9nlPnaeCF45w3Xx9nbqo7tAeYieKZSYMnWd
	 b6wBtKyLDRaIEPW2lEx4Tu++2Cr4Isu3jj9IzAsl1XtTkwEpv3EX3EtsV06dKe/iSgye7
	 cSE5Fk6sI6NHnRVW4NRX3b4C3IbutZO8yqqfk3/jLoMrcP9ce5H+/rjc7WQYs8cjYVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFz8muvN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RX7kZ0wx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C439606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C439606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cFz8muvN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RX7kZ0wx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AM323634726
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S2OdxKrYsg8o0XxGHeaf2oT/9qajxW5QJ43
	7FyTV3l0=; b=cFz8muvNA/B6DpyEuDlwZ47J20kBLH8Bm/XPdfvUHVtZeYSGa4O
	To5Qx6grDITIuiG3uwQHx8LCroio2gqSCYf9lIiGYxZAwag2qxCq+n20PZW+Ef+F
	Q3mxwp/NZdFuXAX8MaDqX8lamME/eMBZcI70Z4VUfv2+rEEOK0CbSa+d59++k2KA
	rSLQnPsst1K0bbJRm0+l1uvxgq41g3qTSz3uzF2BUK5487IUJ2mGyzpFplnE+cax
	ESbDMIBRS5LFrsj12Yv74WZTBnOsrgxROsEUnw7IL5TlbrauUhdhaiELSk9z1k8i
	DpDMUtUrJtlQRzfyf4v9sjPMcp+z9sY41Lw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2gx4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:04:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1452818c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794215094; x=1794819894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2OdxKrYsg8o0XxGHeaf2oT/9qajxW5QJ437FyTV3l0=;
        b=RX7kZ0wxmAijlUhIAkx0bnmNSlbDCbeczP6fTvcg0lWmAgVizhQPwpJQeVC8PbAJyb
         l3Ah6eLu6afg3u2k9y++ZuIa0gud8DhgfamClIiegHvPMZB/zg3hyUMH0g0wQHtyy35u
         TKUJ1IhsdMXQz+ivv6rtW/inKk1kOylzGebjYFXCUXQnnzdlPuElZgZhJd2O1Qo6AMw4
         pNI6So7IN6hBFwZogEyG7QYjFDnEWol1Hbn2JZrjFdzhVz/LjNq+70r+lGaKnhQLoHgH
         0vyMOpbdPriU7elw/U+0uA1jbTJ7vUZ60aDWDwbCBhD9FAp/2p10J9J1xmTucVvQmLyf
         htNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215094; x=1794819894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2OdxKrYsg8o0XxGHeaf2oT/9qajxW5QJ437FyTV3l0=;
        b=TRzg2IXmfJl4z9Ybqqw+/wrO+MuuN5OUcTR+rKQWQRbUgKUpZihTMiT15mi5qs4WiX
         eQfMzMumC2/0KeoYenSURKyj8JVxm98hW0PsCFncPJ4ZBR2oXcFlHKC06N2bhh9XGtqi
         vDDJQ+rpIr/MpcEdiEO92oZzpGLPRGoN0vZinB6dt6ObVytRpKMa7oDN8zywcBORKyvo
         UYMK4K9j66cPLpzS0Lf+Kkv/Nmd/dcJ57U/bG/83sDrs/vvxM4LrPcXiPU5IAYd2Eymx
         wz2MSiIb0KU6BJ6CY7E8qgNxwQP3JxRJqYnrOIhwHwcJeScyOK4mHlY5kx8YMU8EL0EW
         91bw==
X-Forwarded-Encrypted: i=1; AL+hErG1rhYB+hNwwZNSips5xnN8zQ/Aeni0lkTZ/wZFsJJVKsJA33EnzJdDkZSxzgV3+5QNu2Yogs6xcoypzAZ4@vger.kernel.org
X-Gm-Message-State: APuU4Z/lr5JHeAchqxSj57JEc0LEfevA2d87wWbO5zbqmA0Kso9RrDQg
	D5sLx9U7pLlSgXqra2A6XdFFPvKNWcrYtJrED7+Ihohe3G6KHYKN4wQR31NU1yyaof9ok3sYxPA
	Lf0bZathD2/Md3lrKUQpeeLVLNUUM3nMY5eRuYt6baRnxj5IPAQPQXfomF5qNd0SjgmDN
X-Gm-Gg: AYBFou26HvdiyJMIumy1+mxEkc0rBvxtbAXRlVt80GLB1slPtuqDeMEY2Eo9nI9AVH4
	9ChfoJImnyDm9uVrZ7Dob469+Kw6CxNBMHnO7lbC3i0XQJvhLNjSejt5gdLWhZNw5ecZPREofxL
	76OVXb1fc/xpdPMpktl6iZCyC41SJ0D23ztwzzo7XgoJJkrJwXNO7ioOE5H8BoHKu8NR1mG/t0g
	0LZp3ebD7nrN4wvUbG14RNhGg/2BmKsBmikFJEwVc31Ly2rrFhOKD3ASuYUwLfXa26+JOZRlycT
	0lXzclP5XoBswYGx5t6BeVRyt4uHdjccNOVtPnSsn5P3a55MxlZOoZ+SuKZLDg7Hg+UYnybo6/5
	vh3W7zuGuasxkMI57G/pe0xVTTBzZfBpsEtJHccXK8AzcIrHaauVpKjaq44jzc2ED4CpQd5YfT0
	0gAMIGlAaFh7A7DFdl7NBGweBgymWiHkfwyKrZ
X-Received: by 2002:a05:701b:455a:20b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b39ff1912fmr5413132c88.37.1794215094089;
        Mon, 09 Nov 2026 01:04:54 -0800 (PST)
X-Received: by 2002:a05:701b:455a:20b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b39ff1912fmr5413089c88.37.1794215093364;
        Mon, 09 Nov 2026 01:04:53 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm14459279c88.4.2026.11.09.01.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:04:53 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org, mani@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abelvesa@kernel.org,
        yongxing.mou@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: edp: Fix missing lane drive level programming on Glymur
Date: Mon,  9 Nov 2026 01:04:49 -0800
Message-Id: <20261109090449.410840-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af18cb7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=k0f5IhIVsTSicQYmG90A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX3i+JEk+qsVQy
 xfHcoHtEETxQsWwKVoNmiMlbTDtoODnD5lNvkSf14o8QC0byQjwuNi6/agjffrhyDTgP1zdaN7i
 UZl91bu7ONomFci9etURffw7ocAAbn2qvvAn7s4jQ4cGA1chPq10XMg7lQWniym7yfvwX+lkn/0
 fpm8DC8FOeTgnUEH8xkN2qScuo+SLrbBF6pT4Dx6wlIw0tjEHTQ8/x/p46RxTAZ1YTXAfw8ZWn4
 GbsPgzZtzT0Te/duxIN5PMNhz4m+xd3zxsV50nIe2Mjh8RNj0htGvYLn0WhAl/0obxSh2XC6R0s
 sYTKL6Z75eIIJmHxejsfomAts6ufoernOUkwv4KCLMQJJaTT4BMpCQW0U99Jz1aQSrurUmqWmJ+
 clvvbVTqPGFvPssxHYexzwNvycILoyeMVqgUL65kNuhiFwu+HTLR3IbF28IBFDkVIlTsNRjjR51
 81cytDk6b10wndVr6UQ==
X-Proofpoint-GUID: -F-E3DicDSfZdTZ5KnOBk8GtcFYT4YmL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX5ExDWeW4HxbP
 6jM0p6UppO8mLogHP2FRw40YWm7J5SiWYVX0yhUZu5RX3Ed5kx/DiPnrULHnRG66UqZQUTd5NEb
 rAtY1ShXgUd1ZNJaHn5ktB9RPLEAvIs=
X-Proofpoint-ORIG-GUID: -F-E3DicDSfZdTZ5KnOBk8GtcFYT4YmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

Besides the per-TX TX_DRV_LVL, the Glymur eDP PHY has LN0_DRV_LVL and
LN1_DRV_LVL registers in its PCS block. The driver never programs them,
so they stay at their reset value of 0.

This goes unnoticed at HBR and below, but at HBR2 link training
completes and the sink then reports a high symbol error count on three
of the four lanes, leaving the panel blank.

Initialize both registers as documented in the programming guide and
update them together with TX_DRV_LVL whenever the voltage swing changes.

Tested on the Microsoft Surface Laptop 8th Edition 13.8" with 4-lane
HBR2.

Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
This depends on the Glymur eDP PHY programming sequence series:
https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com/
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index c5d1fa0ae6cb..ca17fd3b3c57 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -48,6 +48,8 @@
 #define DP_PHY_LFPS_CYC                         0x00d8
 #define DP_PHY_AUXLESS_SETUP_CYC                0x00dc
 #define DP_PHY_AUXLESS_SILENCE_CYC              0x00e0
+#define DP_PHY_LN0_DRV_LVL                      0x00e4
+#define DP_PHY_LN1_DRV_LVL                      0x00e8
 #define DP_PHY_LDO_CFG                          0x00f0
 
 #define DP_PHY_STATUS                           0x00e0
@@ -112,6 +114,7 @@ struct phy_ver_ops {
 
 struct qcom_edp_phy_cfg {
 	bool is_edp;
+	bool has_ln_drv_lvl;
 	const u8 *aux_cfg;
 	const u8 *vco_div_cfg;
 	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
@@ -464,6 +467,11 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	writel(swing, edp->tx1 + TXn_TX_DRV_LVL);
 	writel(emph, edp->tx1 + TXn_TX_EMP_POST1_LVL);
 
+	if (edp->cfg->has_ln_drv_lvl) {
+		writel(swing, edp->edp + DP_PHY_LN0_DRV_LVL);
+		writel(swing, edp->edp + DP_PHY_LN1_DRV_LVL);
+	}
+
 	return 0;
 }
 
@@ -620,6 +628,8 @@ static int qcom_edp_configure_pcs_v8(const struct qcom_edp *edp)
 
 	writel(edp->is_edp ? 0x03 : 0x00, edp->edp + DP_PHY_LDO_CFG);
 	writel(0x0f, edp->edp + DP_PHY_CFG_1);
+	writel(0x12, edp->edp + DP_PHY_LN0_DRV_LVL);
+	writel(0x12, edp->edp + DP_PHY_LN1_DRV_LVL);
 	writel(0x00, edp->edp + DP_PHY_AUXLESS_CFG1);
 	writel(auxless_setup_cyc, edp->edp + DP_PHY_AUXLESS_SETUP_CYC);
 	writel(auxless_silence_cyc, edp->edp + DP_PHY_AUXLESS_SILENCE_CYC);
@@ -1377,6 +1387,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 };
 
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
+	.has_ln_drv_lvl = true,
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
 	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
-- 
2.34.1

