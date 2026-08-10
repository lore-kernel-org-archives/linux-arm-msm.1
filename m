Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02039A04D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362168; cv=none; b=pJWhRsgqnANjULgYpoFJ4Av0PPmFwmTyjy2OeJVeeMsWtybcRHVlkSju8eJaLakJetuuF5u4cqkQY7YDi/+7kMxozw80Rt2BYVUQ8uqumBbGUPr7CdCJBye7f/cYBVHrJENS6eUjB76bcL9Rc4rzuKEDPhk0OZ+jtVuw0pOElHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362168; c=relaxed/simple;
	bh=8VCa/M6bToa5oXul7MDBmdE4OGdMc4fpn0kv4jaC4Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbIcK+p7ItaJNbNgCMwmVxF6zePPgz2Z3Tx9qpPHz2eb0hIOB01Pz/7mSj08tO54HixUSHef7a4vJOFB4IOXBomhmGUZm6TqdbvUF+wbQjf1hCLrfl9Af5t8Z+cP6potJOKK16gf90+6CLd9VRgGdJ6xBPZdGkEuvaHZtjzsSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8FMrRzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaxfnkVF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8FMrRzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaxfnkVF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SPo41486575
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4goTIxvjr7lxKcA6CVlsNTAeb5Bz53+/zp2NBXk9oA=; b=T8FMrRzvM+mE36zU
	ocBQDHh51UrvREXxLXFNZY82oFbEyVntS7BtCzM5/7SOugcytv51JVe8KA0hNf6W
	ptR4vqw4qPT59IHPCdEgHLJXzOJaoAZrn/6n8kVhtQUY2R3KdABRLsOqflrLLPxJ
	Jp0u4VZG46NT/K1eBXEPwc3/WcGvXU2c7vFDTqHWyryP+ML9Y3iqnBVdagHq1cJV
	Eho0OO+cgUg3fCK3j7xESuNL5ZmsPpp1V+ViLx/TREStdftpeRzyMzNT0Zi9I35c
	klJVyj8ogFWS91GTYYcKn1xgppIJDvlKIqVyCJfTtiWhGuhaFSxOjgmU89zTlDMJ
	sMp8mA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xtbtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:42:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so18696071cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362164; x=1786966964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4goTIxvjr7lxKcA6CVlsNTAeb5Bz53+/zp2NBXk9oA=;
        b=GaxfnkVFKbKGHzvls123ynzYkvoPx8ZzqQE/LpZuBwSX4P1/IxATHspIYS2MbUBTPi
         KnvsNPhmnnHBSMxySzvcbGST925dWLbN4hH5MqMR6PfZg0LjdY6W+TocHev4UHoCfkor
         r71ska4bko9MC1xLxO+z5nr83lPJDsvEgwCsFZwEGxk01W7AVvv8Wldb3j6sHzMYnGjJ
         tUGqv9VoYyDdwJ+1lgmn1pkf17kydGh+Q5x+F7tGmsIEG7W+EA7OvamR6nx3OpPbsl0i
         wG72z38x8Gk7ABmY7fFPBPaufYFBUWgN+ttsshAXevNJC+lmJGSpCO2D+6ObMf8sT3fA
         DpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362164; x=1786966964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4goTIxvjr7lxKcA6CVlsNTAeb5Bz53+/zp2NBXk9oA=;
        b=eOWmElF5I6rncO6sfpteicFgzR/SfjgXWdfBUxPfBwAsC4VS7Or68wLoAKNwvtZNe/
         VV2CcQqoAtcS4vJXi2L0MnGSKSYjwllggFyXamCkhbEBgGzLwU/6dQSgor2YM6vL9mci
         LIvshg5eQvy6uwpJM4fc9vWH0zeK74mcTt/rvjKT2tzrTU/wd7PzjMsLvNNeU8t69a9+
         FpsSxeh0EUAhDNHU4cXLePfQei86xcd7PYRO9HMXsdeyf4yRegVKfkuVMUIw+TZA+IjD
         zxmUX44RhNHx5B+m7+yP4ZOHVgT0+ivFtWAUhKQ4SsDB6CuD954qP++fSjKN3Qz5OVS9
         5eGw==
X-Gm-Message-State: AOJu0Yw4wY9lfzTjQUj8TFiY6PM1aBU4nbyej+Y8Sxuyz7SAmyyi93GD
	aQke0cWuOtQrhRezb98BYNg9cRYeeoNwUG9/GSKkbPyfjQw6CgCCH9vMdcKTD1qU5TTFR802OrW
	Y4Ai0FUp14MBk84RVBIk2g4bSxFHqddgAHYYvDzOD9XxpiiC9YiiW85GGTl4bFTDGliZR
X-Gm-Gg: AR+sD10Fkw/OGx7dfPSEuB/8YN+rANSog/xV/GugeuBek8EdL1AmCHNxuqR8kov+1Ux
	rbPtcCncK2eEiIHO1dquYnxKMFlylxRB9kBSH0O+erRTUYdfeNcDVVS+fFocF49HL3RpujV+M0L
	J+7ign9r9YLG+8/FpQ8URQ9qpkDp3dFFX49LTS+UiWGNXedJ2dRurKtrcJwN+XW4b28mxES/2wT
	G4JQPoxbPjnqvgw6TO4+SNrG2/aKRhoZwHK9haroiB86SORlNWqEsmbCxl2WGqIQDYcMVjYIuIY
	14QBrJZvUTomt9C2Thc/78BwslqXJ6Ezk/AwPy3t9qEqnkEgVqPDIU4pMnoY5PHlKLTjJyJFVVN
	UnyvLHUieh7MSUvnmVGQjdBnwOCzwLikmDEINgl/Ul5OlePVbauKY+ovkShVWUa49rnywGgpMt6
	maH8S2t+dY91OhCQ==
X-Received: by 2002:a05:622a:148e:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52d20a16164mr204708301cf.25.1786362163671;
        Mon, 10 Aug 2026 04:42:43 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52d20a16164mr204707831cf.25.1786362163181;
        Mon, 10 Aug 2026 04:42:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:34 +0300
Subject: [PATCH 04/10] phy: qcom-ipq806x-usb: add MSM8974 HS PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-4-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4381;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8VCa/M6bToa5oXul7MDBmdE4OGdMc4fpn0kv4jaC4Gc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkpueCctf6JwJtW8ImL1sBgGQuVM/7Ybi4Jl
 ytUr3UuYleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KQAKCRCLPIo+Aiko
 1dphB/9khXiN1pT2dTSjIvpfWAZb3MrYWvwWpnjtPxh3gpg4n5TNvmf/vSeFzMymFyrSDKLPkO8
 1q6G7KNr13DNlAD2hdbVIB0uMQl+5d0BFs91bIPanVWH13Y1raJuCw03tNR3qxZ1rCsLPtkF36h
 NuTUlxHwx4XHMwHrHWG6EUhO+bfVXgkk42985Yk5Cra1f6VcjQ/wScVB2BAJ3GhuMA3c7/GeMl4
 34hmhACPrj0aC4rbGlX7qlMmR8M0pGaTReCMfiDsu2UX6utsEUNyM21ZrELStiNjxXQcYkSg35X
 xnoEcFboLnr9j0YRaNNEm79sFS+LBlxm46+Z/nobhn03gvw1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXwuJOpvyFlJ9O
 tes7KRVFaP6K9rNcMh4WUKs3IXLZlWoTqyuj7XzdRYF4IV0D84+Q4UMTCRC4soIkhwkb8TO5QbN
 oxaek1T6Irc9cFO7iYXnPMM/5Mj63R4=
X-Proofpoint-ORIG-GUID: IbJQIPMCdpuLEy5kk1preoW02769YIBA
X-Proofpoint-GUID: IbJQIPMCdpuLEy5kk1preoW02769YIBA
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79b934 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2C7WxXwbF0DeFyG-elwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX1wOJZD+KwgkM
 8/8e0wn367rHd9Hg4vh4yyqRDueYGU4R0DAdQrvOgKvlNkXo/B5vcLJKizpK5DMsJbIUvvguwDL
 +m6CT5u7w35nkK74zAf6nSQnsk3W5cTG+56eRZ/0T/C2xZOCQDmIgEPjfj1Vc1m2BlW+kh4VctA
 VOXhdzDR6SuX8am3/eWqnLoyswLi5botZLVQjmXBHTyOrkKZo1hZu6iGz6bvW+eCgPzW6rQumJg
 ChxAZHdGVe5JmbPIcmGw1owyNG6l1+FZQsd4m4MN1wZ6uvWlV/h5euB95lmdSKyMt0nHgEVWNsR
 nigDctmXshBMAjDk/74Zc8Gg/Uxw7Zv651tCXka7SnEyadxqKwyxVfTXA+lrTK1kQZ1vqK6SYYK
 13c7/RG8pS/iD8cgOv9jPimE6sS3qxJrBg9wvuJcctDDd4V/atQMjTCLfr2eXfC//gfaCl4y5Mk
 7o6x1TO78Wi3gFOt5yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The MSM8974 DWC3 wrapper embeds the same generation of QSCRATCH
controlled Synopsys 28nm HS PHY as IPQ806x, but the driver only knows
the IPQ806x variants, so on MSM8974 the controller runs on whatever
PHY state the bootloader left behind.

Add the qcom,msm8974-usb-phy-hs compatible with its own init
sequence: unlike the IPQ806x one, it must not overwrite the whole
PHY_CTRL register, as the power-on values of the reference frequency
selection straps have to be preserved. Only enable the UTMI clock and
the DP/DM MPM clamps, signal VBUS valid towards the link, and disable
retention.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 35 +++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index f22c0000479f..21b59d4ca8d2 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -17,6 +17,7 @@
 #define HSUSB_PHY_CTRL_REG		(0x10)
 
 /* PHY_CTRL_REG */
+#define HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N	BIT(26)
 #define HSUSB_CTRL_DMSEHV_CLAMP		BIT(24)
 #define HSUSB_CTRL_USB2_SUSPEND		BIT(23)
 #define HSUSB_CTRL_UTMI_CLK_EN		BIT(21)
@@ -27,9 +28,13 @@
 #define HSUSB_CTRL_ID_HV_CLAMP		BIT(9)
 #define HSUSB_CTRL_OTGSESSVLD_CLAMP	BIT(8)
 #define HSUSB_CTRL_CLAMP_EN		BIT(7)
+#define HSUSB_CTRL_CLAMP_MPM_DPSE_DMSE	BIT(26)
 #define HSUSB_CTRL_RETENABLEN		BIT(1)
 #define HSUSB_CTRL_POR			BIT(0)
 
+/* PHY parameter override register (eye diagram tuning) */
+#define HSUSB_PARAMETER_OVERRIDE_X_REG	(0x14)
+
 /* QSCRATCH_GENERAL_CFG */
 #define HSUSB_GCFG_XHCI_REV		BIT(2)
 
@@ -115,6 +120,8 @@
 #define LATCH_SLEEP				40
 #define LATCH_TIMEOUT				100
 
+struct phy_drvdata;
+
 struct usb_phy {
 	void __iomem		*base;
 	struct device		*dev;
@@ -123,11 +130,14 @@ struct usb_phy {
 	u32			rx_eq;
 	u32			tx_deamp_3_5db;
 	u32			mpll;
+	const struct phy_drvdata *drvdata;
 };
 
 struct phy_drvdata {
 	struct phy_ops	ops;
 	u32		clk_rate;
+	u32		hs_tune_val;
+	u32		fsel;
 };
 
 /**
@@ -273,7 +283,8 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
 		HSUSB_CTRL_RETENABLEN  | HSUSB_CTRL_COMMONONN |
 		HSUSB_CTRL_OTGSESSVLD_CLAMP | HSUSB_CTRL_ID_HV_CLAMP |
 		HSUSB_CTRL_UTMI_OTG_VBUS_VALID | HSUSB_CTRL_UTMI_CLK_EN |
-		HSUSB_CTRL_CLAMP_EN | 0x70;
+		HSUSB_CTRL_CLAMP_EN | HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N |
+		phy_dwc3->drvdata->fsel;
 
 	/* use core clock if external reference is not present */
 	if (!phy_dwc3->xo_clk)
@@ -282,9 +293,14 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
 	writel(val, phy_dwc3->base + HSUSB_PHY_CTRL_REG);
 	usleep_range(2000, 2200);
 
-	/* Disable (bypass) VBUS and ID filters */
+	/* Set XHCI_REV bit (2) to 1 - XHCI version 1.0 */
 	writel(HSUSB_GCFG_XHCI_REV, phy_dwc3->base + QSCRATCH_GENERAL_CFG);
 
+	if (phy_dwc3->drvdata->hs_tune_val)
+		usb_phy_write_readback(phy_dwc3, HSUSB_PARAMETER_OVERRIDE_X_REG,
+				       0x03ffffff,
+				       phy_dwc3->drvdata->hs_tune_val);
+
 	return 0;
 }
 
@@ -458,6 +474,18 @@ static const struct phy_drvdata qcom_ipq806x_usb_hs_drvdata = {
 		.owner		= THIS_MODULE,
 	},
 	.clk_rate = 60000000,
+	.fsel = 0x70,
+};
+
+static const struct phy_drvdata qcom_msm8974_usb_hs_drvdata = {
+	.ops = {
+		.init		= qcom_ipq806x_usb_hs_phy_init,
+		.exit		= qcom_ipq806x_usb_hs_phy_exit,
+		.owner		= THIS_MODULE,
+	},
+	.clk_rate = 60000000,
+	.hs_tune_val = 0x00d191a4,
+	.fsel = 0x30,
 };
 
 static const struct phy_drvdata qcom_ipq806x_usb_ss_drvdata = {
@@ -474,6 +502,8 @@ static const struct of_device_id qcom_ipq806x_usb_phy_table[] = {
 	  .data = &qcom_ipq806x_usb_hs_drvdata },
 	{ .compatible = "qcom,ipq806x-usb-phy-ss",
 	  .data = &qcom_ipq806x_usb_ss_drvdata },
+	{ .compatible = "qcom,msm8974-usb-phy-hs",
+	  .data = &qcom_msm8974_usb_hs_drvdata },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ipq806x_usb_phy_table);
@@ -492,6 +522,7 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data = of_device_get_match_data(&pdev->dev);
+	phy_dwc3->drvdata = data;
 
 	phy_dwc3->dev = &pdev->dev;
 

-- 
2.47.3

