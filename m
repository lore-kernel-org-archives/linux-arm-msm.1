Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898249;
	b=2H7pqBfzgbC4SDTzXnbnUyxZa5q0gl/lve+703XNreh4Oo8yHyOGQK0NuHkI0NrUo5yK
	 d1RFwQPOPKiJLEDHfyoinftlaXsu13uiiZEpy9bpGhuLbmKh0bDgkqRhpFUw1pPbu9HxC
	 NsL5KiVM1DpcHnfLJXyUcEmGrAzDyQkLczTOpXV1RzEoL3z3no6viS0qJfTeWY8rDFkmK
	 38tAI/mXBKt0WljUDEyxV2iybK0NsaOp+LbCjA519nQTjA62oAkHH0omvTHc/mVpPGsKX
	 id7ITe8H3cxYL9+mlYvgF8KDVMFCWBWWpYN+IB3p7da32qR424DSuTZ8Nxox45xprHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
	b=UTV4MgEEvHrmAKYFAkpfTf2XJiAfrx6StS+p7HeKHRXS0t7JPOj9Q0rPaC1ip3GMTJwc
	 ZHcwbwzWxU9ObxNj16J+Q7b2Qs5wRkhy0HACp2dZ/kU+BshnQkGfJ3hLe5cXFDYzwHisp
	 Sxk/Xfbus3cqihrpopQld8FwSqaucgrQgvY6BP2N8QPeyORw3ZsMH8czCX2OMMq4lMcnK
	 NJhoc+GUG498EYhlDPBgQuMXe5cYat+SaQ5/GofFgEtCx8kjAd0bU34zMCYJykuzT0+A8
	 QoXjvm6lP5cDFBygd9jsvl+IORZLWM9v+6M1zKxdpiaAKywJf+n8aBg0kNIFP0p9Wmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMfuPY9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UaPTnjy8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEB6606A32E
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEB6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMfuPY9b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UaPTnjy8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16YMI2569989
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=KMfuPY9buqvS37J+
	W4zpIW4o6235zZ9+7zfRs7ZNI9Vw5JIAhwtfiMAUJUX9e9GRjvtJIO3td6XK57H1
	sYJYeulbgMP8vUt+8Pwubjyhy7R9YIqlz8tseXBPqZz0QFk8gMi1ZcoZOc/h7XED
	h9+ywnb18Achc6oPO/nMWugLSLWQYONYcsifckTXc4U423X0lVBWIOcwH2oVOHLn
	7IV1hD7vFQ4KiMPrKZM9WnJ0WF8wvjg0UzWiTM1o5onxa9I9bBNc+CaooHQmNmc8
	uKeV4cZCuejyw9LMVns42aOzQKTZ9I8Jja0BGvvQiEgNVR3VGX++5zRrwbOtk39p
	nw8iqA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehj7j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408336eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898247; x=1793503047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=UaPTnjy8NQ+mYPmWmyxgofE4IZb5gHPCi2zwvtZPA+wbR5XGc4UTRSGgrdVSeGfwK1
         yWv7nxgNQlNmbWSuFLpk4+Wha8uHMPTCTyXBy8ZFnhC+56I6FdJQxb6u2xL7MIZ3wxth
         DNE2R96DGc7xUKkfl1AdtLaYdr22i1mInExIIhFjnAc8T2bs+CwVbjLf2QmObBS+Fny6
         w0y7CuQb9MB5btRkQJa4UHE/2XRuTZjbub3ii/f9oxmfxFL1IkABBSXhPvCbhZA9VCZd
         87Zv9JBf2qIdNm/feucG13pmzIeUh4s5s50Kk2HaNq6zYI9tTvguvESEaIjcvK1iERgR
         m/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898247; x=1793503047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=LtflySujQEeKQ61BkU/1huxRzjJvu+9Ucxn6f7hlyIn2UNIzwL5t5bGp/s/AvABSke
         stdZEgLxD29c3iTwGauuce/YT+Wds4sxUlNHU6m1zaC/c1r6M4Vk7PwvfITIDO90Ang1
         6c8w+TBJWnzrP6/q0NEmUDJiP8F55SNvKpcxHo1vsBCkx8nmjWcjTJmN4b0CKtUVnOko
         9SgLf/Kp3vmrN/MGj861mlx/BJezpKjsVo70sA6kl6AQ7GkPgPsbPX08UwBnWkSuxlnq
         1CWXulCF9FlBKXxw83gWGJEgt9Htr6MDTKAyuLy69y4yJpmQ3EgqC5O03p6XSBzEQihr
         KZ6w==
X-Forwarded-Encrypted: i=1; AKwUvBzw7ilcc55bdF+PwgsQqS6iSHB0+8YlNRFxqFNQq71sSxRAk0QD8YJUXGrCRiENjdHojE02ORGbPtMnfXZO@vger.kernel.org
X-Gm-Message-State: AFq9FYIJK2/pcX2Gv8sdtnmmItBhYdqi2xIYFX1W4NmQt3+Y2PUL0FWB
	e71QAnIX7uu0l1+NpTsmRw+bQPuG6p/gMSMFoJLg0joJe8hyZ+s/QmyLRHjWfwEQjvAtD1o6b7r
	psEbNOvtkKIT/AZ55nZFSwYpI+D1hVCvezZvZzWKlWyVAHLg8w4BZ0PQth9GCiXR4IjZR
X-Gm-Gg: AYBFou2s0NqVO9r22PyflFiJuCLEsgpbUaA8IFp4rYjL0ozkOhqUocwLd8WHaUjkSC7
	nvAXNpMAg8p8s1ehGdrY80AicHRGHBWM7XhSRsjTp2w45uFcEqtlvjB1mRqkL5C1FRmalhwF8vO
	SF/nErrmi+MBz6E7JCEYoQVyIejphtGSVqyECMr7Dlvn0zDDQSIXLq9ZYXlPP35MjcbUyK3yTCV
	K4mwSqb5OQyl0LFfe8SFwIbB/kK/otYc/AcU7qKN2VTxDFs5Xc4KC30YvAT7JU5/ZV9jNXlbVAq
	42negY/R5M0H4EzwXWTAaMHDM9/3VKNRp2gj/WD2qOh7/P+isRNO3ENgh7AxfeZI3dR21FZfDvC
	wACjEAyn+/Hv1ndeS9UsBjgnHC4ogE1xQx/z7zQgZScvgVLNbxFWFOS8ZVaEnrxHlCnf0LwdAn9
	q4KH6a0tgv8g==
X-Received: by 2002:a05:693c:88d2:10b0:369:f0de:259f with SMTP id 5a478bee46e88-369f0de264emr2953196eec.35.1792898247436;
        Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
X-Received: by 2002:a05:693c:88d2:10b0:369:f0de:259f with SMTP id 5a478bee46e88-369f0de264emr2953170eec.35.1792898246942;
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:21 -0700
Subject: [PATCH v22 02/14] phy: qcom-mipi-csi2: Parametrise the common
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
Message-Id: <20261024-kaanapali-camss-v22-2-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX0WSbtBHVQwjQ
 wdmLLGrTemCdeacGno9G4CHaHE3zLNR7AvtGRB0nYluQHqjXw7UXXoO2L5YQXhlf4uFKm4BnWvI
 FrYtO49uxSFfWvoW9jAq89iLwuoFEnk=
X-Proofpoint-ORIG-GUID: 7GLl0LIAFvQqYorNqd-5z8ZrMMqvqVJD
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6add74c8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX5hN1LzVnMugy
 lYaEEqUhU387VvkWeuq+qVq84ifdv9e/R3HX0Te2KyaSY50M8jCdU70/bIzamE4knzwuhjD1scD
 /5MpRhTn9KeBKIiEyy1OouelMcexXo5OwP92RgkHwl/U5xeH+6sTkvAEXiw6R7lCE/KkEAwZnA0
 OGJF8Q+TdBsQ9ewiu12itu1e1LietxbQ1KbXblkXnxinjROojeK11+furOjC0LhMoS9hYdlGxQm
 8QTTZUVKwjAm7hjGu8G1IM+gSNcZVgXuqtip4bljumJiKTlUt1/BfTClZIZ6qLYMqtT+XQXjmtc
 +LrFxm5twJrryOafERhb4KnQYT7oqM1qSoNlqYLRRHSzlP23TUzdqBr6giA855k+AE+mLVvlxKq
 Ba7YtpW3i/yBk2kDIczdI71FyLDVZ593LDhQEDvlGgp1kLVPsX4Y++Xgsarqq9BTIIlK7ixtcIr
 ASAyAMjGC14e2hjutCg==
X-Proofpoint-GUID: 7GLl0LIAFvQqYorNqd-5z8ZrMMqvqVJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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

