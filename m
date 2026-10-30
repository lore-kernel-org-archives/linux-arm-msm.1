Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357724;
	b=kPCQYuMnx/TH3JqGcZxHZxOT67ezZ6YD+mf7rYnz5nd9UlHz6EdXY1yp+vTZyYDSLn0J
	 jRbvE2lSyrMJ5u9NCCZGctOLJoSGMgiMyVNXbf3XdKyKfhbhnQFd2Kxtt9QDD3gXzeI3S
	 mlHYEJRhAZlQHXC/tFRaFFPtIn+F4ahIKSHoFqN8JQGnlvFIfOaYKto/1iWJ8+BPWgkPG
	 7U/77tV8P9wlu9mowKPWxtc1op2n12KPNfNm0LchiPs2+Nz1ScrGByYhmsafuCVjmDxds
	 eMjtR6AKj/ZQd6SYFkf1gnbnmLyd7PoQkVDib6EiJi+sBWCdCV4Vo/g3xMBsf+NYJpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5UNOqAv6CFpckuRjuO223jJQL5dzFe29ZKuFERbyP+k=;
	b=Oobu4wd3s+7AWVsgw1Lw1HDlRBokalL/OIfqf/z4bVIi+L8nLBekZVDtrohPvLxpTVqo
	 r5b6J2AxVm3FXCPh6H/GzaR0Fdn1HM9YiC0ickNkNth/uay+UHeFQf1GZYv7WYzgtrGcE
	 C9a0N8wHjAynlESfBcKJcZ4qV/cqZpOSCP7BA9l1DZydYhk2ZkG39UOvYJmMqdKKJjfd8
	 zd7v73qQ5DYCvsIEZA7zY0RwUk64t4WoSaLLExDdO2OqMnJk/yi9Nqz8IX2iVixSouLka
	 Kj316WYZUrQjgJGYyiDERsDlrz86Mf3ktoqdNKWqgfE9swf/BmCGS0CIwVRRoIOXjWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Epkmx2KK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pp8l0OaL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A297606A32F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A297606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Epkmx2KK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pp8l0OaL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F0RQ2682250
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5UNOqAv6CFpckuRjuO223jJQL5dzFe29ZKu
	FERbyP+k=; b=Epkmx2KK+Px/nUuuIs6qLYT1MYchjvoiDSYzmRm8o7jthcIuq+R
	Uf1jlX74a8xGHuizIleP7oMIPQ6MlKEAbTnNOuR1cpBra/OZgnrWEZ/S2uKlVjAZ
	W5GM9ruphWs6ndjD2rN93D9094otCb5038jom1vxtmm9guLs6zlpoUlGjEK/TWtG
	Tw3D4VN8+Ve0/gtAPX+RQuq/a7LvkQwvjVlu2nGETOhkCa2fQ53tANf+TQJyZg1G
	CD6DpcqDrm9EieuJsEZiKAq4mp+K5A+w5M4dXxqVkp7qJtg7ii3pZR9NxetkMT/z
	3cMnW5oRcORoUlpgteK9rpNyMMPdJ6x9SJA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjjpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 10:55:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so2452406eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 03:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357722; x=1793962522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5UNOqAv6CFpckuRjuO223jJQL5dzFe29ZKuFERbyP+k=;
        b=Pp8l0OaLL9w5bE79gAJKROSACoc5O2EOGbev7ZZ/6CETefTq0Ierp+vOT6lgEzjTdv
         luq2wG+LJaHMBNMznU/IBX1IXk2YW03oCRPvRNZ1qDiK+qi/yGrRntbowgx4eE1e71SS
         pj65D5RwvE4yVVKTxeDwaxKSF7FTwBjwPKMmlZ9TFcbgjCLlwi0nedZSKNOqMljEEuqn
         8PMnXmExYRxNBxHLxZhJUIWqwLZlQ4f5D6MpKTSeaItYrLfp0woqvfZ7FaLYxXo/nkeB
         pfpDK3PeXlYBfzHXOxOfHdPxY4Neqnnu6qj8D78RV1Mjf79m/XRHNjUPycjq3MP58eBG
         L+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357722; x=1793962522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UNOqAv6CFpckuRjuO223jJQL5dzFe29ZKuFERbyP+k=;
        b=QrCLAVlKjqB04Ggaspis/BZFoP/Ua5HWD/A8DEPExapmCTF/6PrTVcRo7JcZ+Rb0qd
         X+Gx6ouLEcpcsqgsbSHxCPuPXjREQGXNQhGAEBtiXHUqFx2dTmcdgJ+hC5izZbJ83Rqk
         lna3/mydGrLIiehGgcsi2exUEiosf/nZ5eCa0N8IFlbY+9kyps1M9eirh6mkK01Rj+6J
         JRb1/EcHF/MRRpkDZdlmOoA9IMaz48Q7XMb8Y6Eib4hZXB70yTVqsImZRPVyp28SKwuq
         q7de6XNfAaN4vHrRdAbEmxbeMVjl0DoGUc0ETFaygOlX6JUcKYEKk9M3WGS5oHmvfBS8
         9OWQ==
X-Gm-Message-State: AFq9FYI8WH/sv1Vkvt6P77be9GO80O5PmtlntE9DoWV7TyP3s4Mxf/lr
	EAFo0TQFTHCLVj0+jcXeREvdofQnjnalUy1MZP6+dPRECjtKQK183M8CU4iX2bAEJrsxZI2hHzD
	RbBNQKse41eDzNHIEJWkVzafhI6I+3odpm1ZsE9CyybQsEK1tvfo4deXtLZVNQ5oZTI7R
X-Gm-Gg: AYBFou3xsloNICn7KEdt+E6dld2Wbs4UbvuiybYXP7Le1CUkLZs+eESdC/Vm6G4QgvE
	CGwANJkuqiz9/o7ecin4HDprgPEMCEXl3pP/vbt/iQru/VUEgTFRwQOs9zYrSCEARxAcYJHVsb8
	K204y6OGXa4uNH0NfgDbCslYkUpPgQkHjAqXvIuAD943XRWrSd4Wo8fIKtfTxh6bxROBfwYzMgm
	D0MsENalIQPnydh7U7M0s8PjgrQ2yAENtIDvk6N1ZBKhztOkhFa8x/XEgs81H6PDyaAVbEhvLIy
	8NvcAW93n0iP9T48uyR3Ukj5j+2yA6ldDDsrq2olqUhKagVQafnQklsfxUjSlyQ0EbdrI6Wb+Ar
	Fn/WCtSX4DiTCOhZr2v3o/nEKtZL2u2l1zPWr/jCJVgAspX+FjJh6VSgAg3gJ8fMZixH6dRN6Bx
	WZrTE=
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id a92af1059eb24-1ac5c555078mr2865690c88.35.1793357721644;
        Fri, 30 Oct 2026 03:55:21 -0700 (PDT)
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id a92af1059eb24-1ac5c555078mr2865661c88.35.1793357721067;
        Fri, 30 Oct 2026 03:55:21 -0700 (PDT)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm6017266c88.19.2026.10.30.03.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:55:20 -0700 (PDT)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH v2] phy: qcom: qmp-combo: update offsets table for x1e80100
Date: Fri, 30 Oct 2026 16:24:24 +0530
Message-ID: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: IKdhDZL0XqaLKUTlfMyo-ErE2IKx9yGg
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4779a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=WK3x7LZNRzmlshLj7x4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX8sTlqzjO/a86
 YxZTS/UwbeAmFX/n1qxG2i+PulgeH6TjivMfs2nyr4TmTl3HO7pAAJYE/54JMw1VdfGMmKhnv0t
 twhGcTzQo4zDr62kDB4SnFjoI1qO8+cvp/pmcfiDv1IyNzFs4fQ4Bw5B1tSlVpOvQ/hxRj4D6QH
 7sa/GLrDy1SKw4L2L0cQvu9NtQMv8GkEeRe17zzuSl7sxBT749CRMcamYHLBLqMhDsUOY+ldDtU
 34O5YCg2y0L94ONsh7pCFTY1sSiRxZIQU5meZ8/UsMwzWUj0cTlYWVkpSXiD+uqrKSA8bobk/ag
 CN7gg3NwJShxR7v2j+AE/Cfql8KBIcfm8eGKyXuPpG9LdFZ9TYn4i6bjn7DirhJQuLNMC33SPQM
 KitcDvVS+cdGfqDWQFbKFYTl5liaQQ1AQsFtYw3C534nBWwy91+9ZyILbEyjC+YCt9YufU3F28w
 Ua+YMqel1qCrWnuW/CA==
X-Proofpoint-ORIG-GUID: IKdhDZL0XqaLKUTlfMyo-ErE2IKx9yGg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX8ZzzWTKcS/eu
 uV1PX+2cGHf9CVV0msXIuMvUexImL3fynwOPWFdtNGaYtGHR9mE55aeC9LciHwkPbDACV5V/UiR
 Yu1Ly/p+tq/MX4qb4KPnZg1vemiJ6Ck=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
it uses qmp_combo_offsets_v5 currently, which does not define the
usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
autonomous mode falls back to pcs_misc for clamp control.

Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
through the correct PCS_AON register space.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
Changes in v2:
 - Updated the mail address in SOB tag.

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..aa9dc9716574 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2762,6 +2762,21 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v10 = {
 	.dp_dp_phy	= 0x3c00,
 };
 
+static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v6 = {
+	.com		= 0x0000,
+	.txa		= 0x0400,
+	.rxa		= 0x0600,
+	.txb		= 0x0a00,
+	.rxb		= 0x0c00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1200,
+	.usb3_pcs	= 0x1400,
+	.usb3_pcs_aon	= 0x0100,
+	.usb3_pcs_usb	= 0x1700,
+	.dp_serdes	= 0x2000,
+	.dp_dp_phy	= 0x2200,
+};
+
 static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
 	.com		= 0x0000,
 	.usb3_pcs_aon	= 0x0100,
@@ -3003,7 +3018,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v5,
+	.offsets		= &qmp_combo_usb43dp_offsets_v6,
 
 	.serdes_tbl		= x1e80100_usb43dp_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_serdes_tbl),
-- 
2.43.0

