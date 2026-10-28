Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200859;
	b=BrPXfBFWzGHmt4ReFIzMJYmLux8IOY3XBuErLUS8hhkuSkQOxeiQpBQHoe2e+QP6cyx3
	 aeVTlFWKYDrZaDnNO8kjVt3zbUecKONgvqZcj4VhYy1EmOQ2PFGVGvbfp6i1adrErw2Y2
	 zfJ4uZZweQloG1Kvvg4ukMHxbrqGUQtucmWH4ifVSKe9iJcgZiS3CGHKd8yJw5AiDaCsC
	 d9Spz0UIO2hdOg/ZtQazmgMwTxsagdem5bciZN0E8IIVOVrqLw9H+EQ02PHQKYR7d6Ej4
	 zuy8Fan9E9RGLAZcpgo4sexooMdFVix3eLSbG2Nr4XTZUoagXj2nByWJux5Nz61keSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
	b=i2w9Y18+wPLyJYxuOVbiL/tR54ShkgXaod5btd+1/K0dWJ0rP0qDD6bKmHL9do72NXWy
	 6TmuOH1zR3QuY1eXOdUP8hNPwYxY3T863V2G1gAX/rAzSbjCPnfSN5BY+1sow7a8JOpuW
	 kj2S5xduVLfGl2RSwChpygjw3+vLJo+N3jr81QSk6NOXPeB2aJ1dAOowhVkvozxexaBuq
	 7QVggfUb10a7/hy8LY8PTQkYe1PmSENnzJlmqnxX2EqNf0hXSC+BYURbLXB2btXXOV8w7
	 Rm/FOXrvq/80YLyFEyMMGtp/TkflfYdEMbeQiq1SqrPlRjkyODX/CMPWATQH+ErN8NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=frZqjEp4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRogjkj7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D0606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D2D0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=frZqjEp4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRogjkj7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFADLV2001642
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=frZqjEp4NEENUooy
	1g+pjXLqfB2QN3+cDH8jhNNM/JBBpwf9HILIwtLEOrbJxLT0DLqQDTAhMeh3tc9X
	CdPPeMRqsDDGzNXip6jfyxO/g7EcjpVO5VxbKjz+63VRh2llthuBoTuwdHQbOq6A
	DlJbKBdBXZXM68xAmB7vEgJ1A12Kg5FUWIgLek1vVzmh7wdBw2C/6VDI6oWesDpX
	KdqLsyKoKe3E8ZNvJx9GF0jLZUNJ3RwlBUcIGB55p/XsX12orokR5lpzuty3vsmt
	OAJvt+ST/tkZuYjxvbHV6bylXAt0SVYY1K2B3mIpQhh9fvBQwLVUrMBweAZ4+3x6
	T0SLkQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sm2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:20:58 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-679aa1bb496so1886334d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200858; x=1793805658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=VRogjkj73FXj0OPZ76Y4/uzlBmbp5nZ7ODiz+fFQ/ucYjCktvru2327C4AljXxR6Io
         n7yEaX/ej0vvThL+OL4lBp5QLosuQmCWpR4ha+TOffGGgv1jbiFkVCIbN/xhRqsP+lX2
         YOh3sbwxu9TKpRWrqxkDVv8LrwkvS1QYWmHBX3epZOjQNfM5etoARskIhhUTHaWfpooo
         Sdi7by1UiZx27I4pmvEp16JCE2zOGXBuDc1nEAfFAQ7RfPNKEk/8dqXV+LqmTKV85umr
         UZFgHCzPMhX8PQr3MCHXf+49c6+YYXqp/R03lwdNtBTXR+/x6zwTspP48FitLNb0ip0D
         Wqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200858; x=1793805658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=itbQc1chLWkxVAmO9v5SFevQa9YossD6w5NJjClTqU8HfYDCKE42Lt9q1dp9NUu5nU
         JGjQZqqDfL0IxrGbX0pKERaSq2ICJ+aG6mOfRPA3bK79XPBvvQhNI/3Al7B5RarfhaWs
         flxHLq6YmwRoDJXlpHYuVZXB6eXllwxmdfAo4GliR1ZJIZATMrEJEjFl34ZHVofejBrw
         x2UUulgV+o54cRkRSbOxw8RhMOYGezuxjdHsnY9BcTYvw/WVJ1Qvdf1JgVioISD7Q7g4
         Yo7XBhyEXPRURgqInr6j2/AER/Xv2/AN443xxtBmNE8vDg9U47BqkeupiWaqdjVLKTkv
         LWww==
X-Forwarded-Encrypted: i=1; AKwUvBykV0yC4bB4w+FJB7rJJjpWwdUR6RZiLsBszRrm0ZkEwyeeQvFo4f8u28OQuZorVRp4OufjA/S6GgVMu0ci@vger.kernel.org
X-Gm-Message-State: AFq9FYIRcn2XBJd4xyWxj6DWsynOZLV5NXyYnLSLZ9kXmBaHQ6/C1q3M
	DfrPixfJ/E8r0bXwYwcDkeKwzz+WKjgYANEJZSwU8m7HPHcKeJOxIfCTf38mGTVizMyM4DPdfmu
	eKw/VWBvpj6tgLxYa9twd98h+M8BM66Qoj5bTxxgN0yFRQtQf9bjVjUF7ffntn6cjMiJX
X-Gm-Gg: AYBFou0VoQzaV0MEP1R0/wosw6768+yQWAAeL5Y/nSFgFgHm1mcoWuYk8vlu7ROLpQP
	YJcmP6NKTitIlcUcHp2qxQIGtf1VEmPLoDyTIvjbcTCjBlAoVObh0vQW51h+Nb3qT7ZmZ+jl1uF
	svHApaRnCe/62pY3D0c+XVtxws2TZHs0KItKg7Qb3cNdooSJz+5di6uRg9L3cEZCnLruuRkEnmb
	5r0iETdLT2MTZuKJMYAe+WaOyYHFVXM89B4x39u5BFIuV3VX6LYmDgwH9iuZlk0leCdcnQcBcSq
	R9r4vz/TLjuf+IiVhmnaboFRxqwvSknUJ2+ypbDFSEryesAhgblC45FwRDs8UvOnXhbvf1/gbY1
	UCZdqEVkgXZvtZJLa6zlqo/b1hv88hgNe0d7V8+FsCYnkZSWZvKIBe2I/D6HtTacNyCZvvXuYnX
	2Qc0aZgDmpXdcq/OxwPto1JKP+ZZwpiZGbL+m9rnROFMuZMrza/MiQUEFcR7dw
X-Received: by 2002:a05:690e:454d:10b0:679:b87d:6f7b with SMTP id 956f58d0204a3-67a7bc6349fmr1631300d50.42.1793200857485;
        Wed, 28 Oct 2026 08:20:57 -0700 (PDT)
X-Received: by 2002:a05:690e:454d:10b0:679:b87d:6f7b with SMTP id 956f58d0204a3-67a7bc6349fmr1631268d50.42.1793200856951;
        Wed, 28 Oct 2026 08:20:56 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:56 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:36 -0700
Subject: [PATCH v23 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae212da cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: bBCKGuG_fyg4hbS4HeLwEPzyR8pfnLSv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXzCQFhTQxaPSv
 CmvU4CWOogUXrFIClrwKeUMIvLxqYp6MEhoWEwATxvC2CAzq/uglLyDJ1vjcnrHs1Q/9/IQ1ns3
 g+qPr8N8Ffv3dajhSL4tHgSn8erVf68=
X-Proofpoint-ORIG-GUID: bBCKGuG_fyg4hbS4HeLwEPzyR8pfnLSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX3j5zHKPZhEL+
 2D2Lw9a8Df3hbBtcbJATWCf+Rf8FxIh0ihbGIJAuub/ryclggMpOZ8heGzysbhmjUmchjJJQbeM
 7ZAerk/mijRzgw/R4PqNUwmQuyk88kTRbWYffed/hgYaieUW8tPUKTvdGw9jzvNN1TvqP50+CKi
 4ILEX4ekBx42XjiziRT0M7Z1DgIiCEPxZv6+VnvToJSyxwDL0AO406KxWfeJQN+H+xHHu9w8Z6Z
 UlNURKN5mKdjNmL0M5H4Q/m/+n5tyvMP9ZbMhJZwaUv1VImOHJiVw9DDg4Q9Fxa/6UTZE5jofRP
 2np+0u0FBHj9LWed42PyS3DSTreZL+JMfqumscYcGKEC786z35sXTtymivmqucAR0sqDlD9gnJL
 m+M/U6SBM7wSrxOeRiKlvn7c+iFvXyO8JjdqhU5HBmI7qhE51V9qGPmV0n4mmgCeTgZ9EXzRCo3
 42JNqS9AvPZsrnYiqng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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

