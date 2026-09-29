Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7541B8F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661663; cv=none; b=qofpNgJ0YUBq6XWWdkmopI+/IljPxw6XKalgJ730ff15Zb32znARAQj+/Q+c5yRRe19ZKyQ/g9Q/Y7lJ5A1ubnXwO+I9RTY/wjRA86VfrH27OEpahTUcXp356eHaAQqE1brLsnL3XIc0YnoPoX9S+NB/i6AlHf9Rj6gNXddP368=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661663; c=relaxed/simple;
	bh=4xIt0EllDoY+Tgz+y2nkXsy2RSUlxdhW2Xjil7UXbk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgpfp1qjfU2aS/dO/renXwpRp2epwRCtayBkZmCruRixyRcFZnBeURUv4xu6INXbyixTfi7+RpwYMnwc9BfEcUrpDvUR31xDGNzr5VVwdLlL9STBjOQKUq1e+dblpvN966pu6em+FDYyCNGAsxLwqojHCUFSyHa/+pecHCEQ8wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzMWu4im; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+RFq8Rp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzMWu4im";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+RFq8Rp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Kkt3241632
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9XpRhDCIBk7nECEJ0+8fGl6mP/GgAplTBJ4Fr8IU+8=; b=bzMWu4imBpeWms9C
	zFhWH60l/9IwkGY8ZDYh1zdbN1U4zbnVT05pY1Rjbju/i+ngG2JrRYj1HXBSBPPB
	qXB6wAfr8SDNyGxsqE10u6QVNHThjVh/a8Sk2hGEsTWUtLunvGLOFbJT3aPXE4wm
	b+4WlZcQPyMcQijQ+HDSgHzPQ64heHzD/FLdmA+qesO4uKC0yVy4ZdxDtEtv1BXs
	Pmjkl5PoZ1ctr0R8b+C5M2oGANiQbDTcYm7lze61Ixv+ziw/NGfAQtf1EVALlIPE
	vI5HB4G7PBAc1yIbeZpWEl4+DN/EgcZl4YpXBgOqEbJXNIDoFu6oDvEYCRLkfZVk
	AiQnjw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144sbmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:00:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so5436643a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661656; x=1791266456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9XpRhDCIBk7nECEJ0+8fGl6mP/GgAplTBJ4Fr8IU+8=;
        b=I+RFq8RpUsNS1ixHhZsPoz925Rl5mKf8Fh1pX45lOCDFUHh1q05Zg3rOhq4Fu9YdW1
         RTGup1AT9glW4ieSRi9gOYwSEh6SAtHTOEQR7OJ9Vj+ntBWePAK9NqhmhK7/LLQUeI1N
         nCQXN7GMqzwFceY/4G8Csmh60LRHXxuyAL6KUdoQEH3u9q4FrxBw25zX/dobs3eSRuNp
         QkXiPKOoPJXpCdS/vtKCKk9xb5B/Vjs7gGB3qF/fW0ESqPmypOZ1Bzqnf7yawzVtJxr9
         qQlXMt2vnGuMrpmTNjcXwtAQGUki+oLRbykmMePKTC2oYFdivqIO9k4H71djxkADNzdk
         nIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661656; x=1791266456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9XpRhDCIBk7nECEJ0+8fGl6mP/GgAplTBJ4Fr8IU+8=;
        b=iUteJjqUGcJaz8S268q9jIT7xyHEyd0+Q0TfjQMYU+UlaK+SZa7N4au4m0bIE8CwCk
         gxZMpvTAEXIEu4lizBEO34sDqb47CZVPHdTImsZXw0u+l9U7b1CWmhemrcUHm72tVeWN
         ZEdL1oQYNQR4wJJj0PcI3XZLpe8nH2rVXSFuLG1a/DlAydRXBm/h6RE1DemiPWMeVfQC
         7eHp3E9yCX3qSEhnnEOvlMKJvdeUOHAmgbiKp7bLB37+kr2Gzht4zKuJbclrZr39e5Sk
         /MIKISVJYy8ac8CCYt2c/XIO11pTVlSiBtG2tEgdL1rac59CFR96ifB1pHJnmc4+ZHti
         T1pg==
X-Forwarded-Encrypted: i=1; AKwUvBy8cMBodHwjes/nBfh5B4m/tmBGk2Q1VRfleNfMK5Cy6oA0OD6n5L/8INksG6ypygvZ6gjHpmTXDgEQqHMc@vger.kernel.org
X-Gm-Message-State: AFq9FYLbcBRwximjTDggHHKsy7SNDrXyuUV2Ypj6RlNcP9xUs2Y9clmi
	sy+Gfo3Mdm2rsNB/E2pWklNYgHjhTk7IY3xXgV3PB7LMPDK9FnzW2r5S7OxAjFIcFp5Tfc1zrLt
	nMA27faWCN+D+3KsZPRbznK4mFobxBY2/l3yrHLYfdtyu7YOc2W8TW6FagVBTWDyHDbFn
X-Gm-Gg: AYBFou2mOfvUGerO+ZKXxbk3ziaQXrIXgz/i6JCiFYCCTJZKW//nXw/rX5Lnf4ZLFDx
	Atvqa7vBMAFx4ralkxFrCGHuRPUcqtKkJdENyOtWX/pkeCVCd40wZWXl++bB45VCoEO+EE1TLdJ
	yPET7J2qui4fl+f+4SrvoKvIpnQfjuJcFwxgZQFKetbCOYHporL3ftH+48AvIh3PW4E8pKfkOun
	GpUUb9I7/9FGKaYuEVVc0ylkY79yHIjG6YzJUJjc0cvHjoW0lIrtAMYK368W02sdQRxLlNI8ymt
	TeeuQoqzKtAPRlhDz6lH+hum6qoP8etRS90S/OntL3ZCkQw6mn8YWMOCcAWJUhQKpktZtPGd6Ks
	HcxfRrwGPlB/aCOCOw+B+GeJbzEbzd4EvJRsurpC6eE9Jr6sKswfI2PMm/LuJ87C4naQbrC/NME
	P3Ol6/a9qNZQ==
X-Received: by 2002:a17:90a:d444:b0:3a4:a383:f9cb with SMTP id 98e67ed59e1d1-3a4a383fddcmr666331a91.22.1790661655845;
        Mon, 28 Sep 2026 23:00:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:3a4:a383:f9cb with SMTP id 98e67ed59e1d1-3a4a383fddcmr666295a91.22.1790661655350;
        Mon, 28 Sep 2026 23:00:55 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:54 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:34 -0700
Subject: [PATCH v17 08/11] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-8-dcf3fd37f76c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX0zNb6JT6TCEz
 VfDEfMZnt1TnakY0A8a1b7mI/N/3nz0vNCzysmajPUpbkSS0uD7IDzhqg7qO7sot0WxjHk6OXeW
 mqy2eypmUGtJd5j60CGAcaYUZxrf0B/ef9KcDqvsYfisjf8BVoqU64CQXvP1rAKgC2SWZhn7abn
 cSrOB8IXAF530jJm1Nvs+oaZs4OeA6pTNDQTFAxHvEzNOeodxD8kuwOeQHaak/f6NEQ3koLomDQ
 U5e6U9uHZkY7tE7OcbZF9S0kFt4LvvQ+CMtoizWmqqDfyuutVrAPZywSyr61JWMOVAL2S35Sz16
 5yoh6ynTpGSI3hmoasNzekf6XWMK3WWsZoVcTYcF2l+VsuWWOtZ91J50i1C2gM0sWi4EoX0cpYD
 6foA2yG3Lkhy/QtzidF/tmOD9p7+SLWlvDUojafAWmPQ4kFmPsq5Nmvgk1FiAUd90YtFIyUHydk
 I4UbgHGpESugs6UHTLA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb5418 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zvpRHedlNIWp6186mRgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lso6ZUc04nb4oQnrFcnX4Q0-CMc2HWBW
X-Proofpoint-GUID: lso6ZUc04nb4oQnrFcnX4Q0-CMc2HWBW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXzxAZuHWdOW5b
 5VHA0j/fRVlFJ5xYmm1fq808YSq0jYZhiQpMMKh4xPHMIuGy242i94k82Vh1mA6EESiR08Zl2GT
 4w0LFMOYk2tCPYbar+Ppae0Klbkz7FE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290023

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID gen4 RX via the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 15 ++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 27 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
index 4ff2f41f70f7..bc52e4a1135c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,12 +142,21 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	int val;
 
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
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
index d29de5f93c18..770a9e5d5ba5 100644
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
@@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version >= TPG_HW_VER_2_4_0) {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	} else {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	/*
+	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
+	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
+	 */
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2f835cf2e32e..a14947a7ac89 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5793,11 +5793,13 @@ static const struct camss_resources kaanapali_resources = {
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

