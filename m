Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7255D3F5BE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886636; cv=none; b=uOdWbDcdhri3evKPorHXGJhBV24xQ0xxlVW9fl/bq1Ar9nQLlqLZ0f6EyJ8hJjbZc68TNVVMN+m8Trz3bR+v4W17SKJZPiA4SNRTxnLOtuBjDPlRK8e5e+PKQy9WQGkwpPcTnkIVOlXhwlkfa0+AmvXfX7HHGOk47SK3AfJFdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886636; c=relaxed/simple;
	bh=0ADpLYpNVCDZL7nrJXO7P37xOu+fT5ppfN8VnN4oLWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JYqBEHC6sD4l9tev070liT9TQMHR9+rzHOTgOqMBK1ltW+cuB3ui97SgJ/6J+gZWsuh+oXgKjvwmEDFq+p95dxsUryAooNtpxyGlMMLnLizeWnl73Yd0imKkVhADVsF0/utGfa/uMARTpYqpiSEssTHWI74dIUEK/Y0vIoKkkSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0nzuV3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEzCg+XA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0nzuV3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEzCg+XA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6Z2Mj3208820
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=; b=V0nzuV3iCTBiPkJa
	cLYXulDlNNK5UvMrTUrNgFLbOxMvX42XrKZzFX+5QGAvBmpLYS47ysov6HTgQijX
	pPZYT7P3kxEoNPUDqtaxxPkMqXZgQeC6RkQFO25dc++jsPzopKl/7qLYaBJtyePY
	H0Sz5F8/vnaqd9TJ9FnicFvVykCa4ov0Wp5KAucnZhqLmPBq/u54zpdoVtbK8/ni
	PiUKV4eZV00GyrnigNVzArPqWZ8EVusijtMFrw076BxyrwGACWgPmf14zmlNjtXH
	Fj+FDvASKpMN4a1Gq3uypQxXpulO0kHPo4BGBNXTbV5ijLj3jwl2PCz3M1NagljL
	Qic2iQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgwnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2769109a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886634; x=1792491434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=;
        b=TEzCg+XA46Ljw3hw6vlYc9nHmPXg8QclWnPspx1v0aoTXUznNnGf+LhTillhplObC7
         fyJ+/CWpnpGTtmxPR9POBdsfAeAhMydaCLfcLnAt092lgzfwFvo4XPXP5o2+p/qpkG9D
         +540uDRFP2MlqTr+/wS5jSCQAkXYuSzzlwMG0BRz19uPfO8TPqSeoKvIL3TV05Zg8S33
         Usg6iJ5DDQz9hE//rBghDAn5X30uJgrhUyjNu4l6DvrFhX/S8jLOcdJLFyU2I3AvDDAt
         Woe6jWzNHmZn6COjK3MKJiPD5zkzFEO/tGOB05DRRgFHE57gvm5ZvyBxmoE33O0t+HuO
         0odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886634; x=1792491434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=;
        b=x4afRH+HHP0owsPBZr2dVhK14nyk1zdaCboeyRPMCtgsEj8BHlqbn7nfvFRIfHr7Ke
         nu5o38VihHeSyPP2QXTeiAPo7sEctTHk2SzLV5LsGbVX7NIldqHVkod78d4lF2gBxjfT
         9JzZfUiw14A+3SEcCvoHYqIxFheU8vOX0FRxuosuWxvgKVY1dowhazfqPTtV08K5BNpM
         3p9kAfy0fcpnmEUt87znRljZZoIPul3FXi4aZXks1DumT0/92ZH2nI38u5HHAu1v+you
         TO2ybr48fTVs2oV71ydrEKPUfvut0CCdzOHI//IAKmKgBLQkUSaJJyQkKfnxFae+/kLZ
         llvg==
X-Gm-Message-State: AFq9FYLdQaDjpHfbVd1hmau7NRxR4K8S/4ifEREB3U4DfVdLAnQK/VvY
	PG+YCQ/xyla32sVAPIUAwMh5YoWTxsWnLOl9PzNwejbTQhDB0ujt/sCBJx53NMr3YE5P9Em1LY9
	JqwIN+Ip0tPkzEbnXWU5kZK+nTz2JtzUi2Qn4fBnDG0GrxWdo0GWCKpcLhNJFbllAOXuLOP/SRB
	Cl
X-Gm-Gg: AYBFou1kcSdRgMj5ssjUEHjjRYqqxjNaQqqG/Ah9M/nAKiWcK69aTnrHWhDomZk+064
	uxL2fgJU+WgGeG/UMc5XMXVj9JQojfIClk1dKCY43VW90PlH3SRuQC5L2cKc4Ytr7KT1m6RG1UK
	uQQSSYt1ded3R5bkRbJ/xSk3UYETZAjIRge4huPrx9xriZZyFREKHkHIKj4qk+bSFv8aEOchGbB
	pMLtVsRe+BeTGVLTSJ4UpgCWDPCiM60Zh08qDphmtVgfKqW41QesZgdTzz5AFGTcgkVUtmnnfw+
	vYMgQTBJxBpOD/sYdDESJvrJgmESyOhPDteW/0at0T/w7u8e20O71SGvpGsEotHAAjUN2RJ2q+N
	kf92GIm4ZAu6FwOgCDD4Fh4cmEakkI7w3XcSKP7DdMIJV+oQ=
X-Received: by 2002:a17:90b:28ce:b0:3a0:809b:1972 with SMTP id 98e67ed59e1d1-3ab3a745e5bmr9610723a91.26.1791886633882;
        Tue, 13 Oct 2026 03:17:13 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:3a0:809b:1972 with SMTP id 98e67ed59e1d1-3ab3a745e5bmr9610688a91.26.1791886633045;
        Tue, 13 Oct 2026 03:17:13 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:12 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 03:16:46 -0700
Subject: [PATCH v3 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1908;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=0ADpLYpNVCDZL7nrJXO7P37xOu+fT5ppfN8VnN4oLWc=;
 b=BykP0ddZeN6ZlZ/7OdUSfD1JB8/NhxkH8PR7HzfTJWa5XKzn5bSJ1ef+5KWk8mAqALIhTWzJH
 kNDQmhPpYGRDWvH1w41Cqil9qfNYYGdcCM0aG0UlT7djZkcHqQiDEUR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: nNcOP7Ya2TuvWYlYlR2FVw2jY5VocLxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXyHjfFQ0eIfaJ
 IeCW3jXxC6Chpjqajy/L+BKWkKVc139dcd562XVLGFs5gDURzSnXaVs+Sjyzf/Wu5gWBcGqxeLi
 74eDpE+1v0Seazh7SIqUKhTEzS4qjHBBOfnvAAfzmwq+3G6UrftwSnk9MPigDJ4RV6bkSbDeEn8
 PLdMko8YURarJEYzlPEYHK63xcMx5QkEBkqkh6xPxBuKE4FkbVo/8s5QKGhGsNmqqR3iHky+8sk
 yoAi8raq93ohETgq5sS0DofFpQjz8MH9+/EsGjoSaWCbRt0CWCAmi1lFAN2A30zykun8bvdqncp
 lBcLtGwJPbdc5+ZvA2ziTE3X5fUEWkTI1PNEVQWQnpiuwOe6vOCtLqPP/ocf82/x9T/DPVA0eFH
 9YujCdmtPCgLUVCIgHYgkOhccv176n8Vb3uZogOUozbtjTyd0pUuN/7ftGphTqmtejp0a3hxTV7
 Aryw3KtTEONso+MUPwQ==
X-Proofpoint-ORIG-GUID: nNcOP7Ya2TuvWYlYlR2FVw2jY5VocLxy
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace052a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=m2jQVEIWa0EwQwJFt7gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX+reRNjt+hNIb
 RvLwTJxauDLwK7U7UxIY0pstnfBIoPxhBJhX5t/27negjaIhm7HqmCbQWUcYlRKVLjXHV+snDzQ
 stv3jiMFKNcsCN9KUVWtxmLbZO0JeM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
two power supplies independent from the PHY's core and qref rails. Add
support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
glymur_qmp_phy_vreg_l list.

Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 9cfabf474fd6..e226b65ec7c6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4106,6 +4106,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const glymur_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -5555,8 +5559,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_50_regs_layout,
 
@@ -5571,8 +5575,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_regs_layout,
 

-- 
2.34.1

