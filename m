Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9882404BC8
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230247; cv=none; b=oHjWD9G5WbCh/zm1COmVjNFcLX33P6ZL2tQf5Eq1fk77lYtSkokItKFxssUa7h2kyv9FLYhA/SuiwODapOfzCIsaAAFdA0jRp7Yf0tWRrbVqN45y5dS71xBUk527cN+YCuGhgjWoWYE+LyBB6ERnZAhsMlRlyLHg/S0xMr/Zq18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230247; c=relaxed/simple;
	bh=7ILArANYD5gi/Ol8mfS5svPlqqomUyThtypHtKuxdS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMvz06lpGuck4duV91NwrwLrXhtFCMFw9jaahQur85cD3h0moU/DGBh25YmCOB11Uh2YccWZKaSrNiOEZvY7RWWM8w2/zrbSs0ZR3Bu0S4wa0MliJt25N+k/8wOrcmz9SGRQXZdg+SqTeTQxK6kyYqQFESxr1Rqf/fFY+oQjQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqxEbuE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P26wnSl2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqxEbuE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P26wnSl2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eGLr1531866
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=; b=YqxEbuE9KzaAGMk5
	oxX3v9z/OMB4yhLcrRaiBoQrUIQ5kUYcReGc5tcXemKQ29rZ6UFEfK8KZLpq3CH6
	k0TWYYJPyI+klV4CX0P28tyumwxlFed/76w0MKzV3LejtrxUpWGy+B8O3XVrV+lP
	qhMgdKSMJdZ2oSdZTArX3HVXuuF+V8u7VyTqdYapbIWAnpNMqyIbyfxY03yBtKlc
	o1zODpAKFmq7DCxnuA5Zm8gAVUtWl5AICd6pF5D2JoYzrvLFsWORjSrEyewZcLFD
	NkABBeRHHkTr/pz7ufdm2IMHQExow6NqUJMYfwYAsjRg2QtQhy8Q+H8vl6Ze0JVf
	21uydg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgrxhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:44 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438492fb40so2680181c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 23:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230243; x=1790835043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=;
        b=P26wnSl20cf1MT9Bqd02swQefhO4Ht3IfyeP+YGioYhpnbW0g/VUZaPbcPZVUExyUP
         61bz9mdJmfV22IUky5g1L88mpCI9aOlGvjjmG+bAwx7gW/GAlogxfIAcsXc+uvVOl3US
         X5ZZcS8aFGaYh3v1jWaYpO0O4lIXRn6lwF4cnojT4T34hfZfyvxy1GpqYrNSYPhqlpvj
         WgyoQ1A6yyY/L5tYxaFqAasOOsT2QHQn1ts2JrGx7xaL/YpQOpHviGbWBymwVRI4AG2G
         GzXzSkEai7zMn8gCqxLuIEc+sqhnF1O/X/G0CAsI8G7ZwrcVVIj7x+Lo78fa3xMsaCZ9
         vZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230243; x=1790835043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT+YF61f5o/fn7STVpLg6IhJeyrRCRNijTHEH9W41Es=;
        b=wzkXnmTZomae9XfrYAKHleoLxHIwHhGDHyjXCGSssr4ksHCAW4mFekhxNtpFvKeeRv
         RwTEdGCG1yfsGxmOOhzzfphPzl3bt273QVVln46Aj21TW0qYFiCuEpNS3hDlMeQ+7lia
         nBIVcBRxGzroevZMcIhHXyUY45teq5UWpw10el0BrLGC94v9peTEgJFD9Og1de+w1paZ
         T6Ye4lsMco7FdxqzWu2QkYAvsQpIrzbjNOvruAWMgnpIQDz1e2lYiqzz+XVEtL2LtYzH
         xZ/YXnlK9qSPVx7G5voot3UXLKk03mBYAg3TisMSgsXdXK/uuPOx6E+EgHO8eos9KnbK
         KhkQ==
X-Gm-Message-State: AFuF++nbFe6lmSPcMhDu/L6nMMKc2EwcIpx+/TGgjCvZQP/ic5nOggjH
	24ZJX+8lo8eY2fHeOsb2L07gnMXLAFI1x1ELh8AgP1x0u2TgwfPtegrt2Fx6X3eKYUyH+9/QSVQ
	7UE8rk1MLPMiKRXdvACSawxbjgiwc4JPG0dNyN6nVef10P9ZAhWG2n3psEiyyFUwbL6jo
X-Gm-Gg: AYBFou21eOjlhtjWQhaEWtY3hb+5gUYChV6u62EDe57hvfwj6iIlbrvTdWT2MIHoevf
	xLz0o5s/WRNlyEv7qchJCiHBos7TqdTLYaZd7shANoyvsVGPhflTBs5ctENaaZuJwpvcZMGRqZk
	ftTk2hymf6fc451KFEwtWJK0gJH0jaPhmA/7Y4mhFjjDPQBAUdW4Dp0OAMg+EDiYqqyQ0qh5PfF
	Tlu8QXt4bSwrU/KWK4cl33eNtT8yrJ0bNbgbK3uqf8706eWixkMRxo2wYyMKcUK0ryrkq0f475B
	6yixp9P4B5DF1rhiUfqWb+/t5Gj6Z6kwEOwzshrVhgqDqfD+F8IjVFqgvQMZpKIV/d6d7fbcLu4
	THd5lneQ+Kxt6T1Qx0tC7qV9RsIX2LxEH51qzM7CIY8fC8FdbIEBNaEg4U3QEqnaew/UYqhPZS6
	wTVn3TTxQO+h+vhfos/QwzAtkyzYSu
X-Received: by 2002:a05:7022:7e05:b0:13f:ad08:44aa with SMTP id a92af1059eb24-1450404d6a9mr1131420c88.13.1790230243235;
        Wed, 23 Sep 2026 23:10:43 -0700 (PDT)
X-Received: by 2002:a05:7022:7e05:b0:13f:ad08:44aa with SMTP id a92af1059eb24-1450404d6a9mr1131393c88.13.1790230242671;
        Wed, 23 Sep 2026 23:10:42 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:42 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:40:06 +0530
Subject: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Add IPQ9650 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-phy-v3-5-088e7be0cfaa@oss.qualcomm.com>
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4bee4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Q9t0gmS3rCGuRMBXcNQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: iGH5CzHX1KXFSvPspCRAOAQQ7szWBN-m
X-Proofpoint-GUID: iGH5CzHX1KXFSvPspCRAOAQQ7szWBN-m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX3/9Kw/Nxe2QV
 kVcYSLA1e4pUYxvj4hPoMYVtL2e3sXiNv5rWHnmsf8MciXWP3kzDAyHrVAUU4jjqlHcqpfU9R7y
 GQ+8aeQ6p3pAWsXojecUrApHzI6r0A8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX1DqOjoKLvOY5
 odi7g/HkdCMFbyWxptZyuvD/Ngrtwsghag3WjLU1jEsj5kakQOmmZhrknddyn1OilGmkmtuanpU
 9AAXxWRG41MBx2qrkjJK2+Jzk0C6LSPBeSP67Zt5euob2/2d5bJ+R2KeY+/Hd9nU4AbW9vgB16u
 gjsvcd9RBS0RQY37jOCGcq/17ao3yzw36wHWIIlHwIWUID02JLY9OvpdtIuAiPVdvCEXEyy4D1g
 /pqkbO4pJRcE4Z2JfZGcT44rofiV1zd+exyjAvwkaUKm6U7IxE1blHkxy8hJAa4iIx4eC0DKF2u
 U8p4iPhnqt4XqCBqZbuYR6SOT1pe1oW4Uv53iwB0yiqN0wH6uQHLpEDdhuBt8XvP/snejHmMCwl
 UjgEWHLQfMJpHKdZuf/A6tEziq56cfUbUWK99rwjAve4mGAePUfv5iK1z2Xv8VSQ31NJIv8oBWX
 Q/WHKHuG+t2Jg+EImwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240026

Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
on this SoC require a dedicated init sequence and override parameters
before they can be enabled.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index b6bbf2b570c7..8957f208bc51 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -29,12 +29,15 @@
 
 #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
 #define POR					BIT(1)
+#define ATERESET				BIT(0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
 #define SIDDQ					BIT(2)
 #define RETENABLEN				BIT(3)
 #define FSEL_MASK				GENMASK(6, 4)
 #define FSEL_DEFAULT				(0x3 << 4)
+#define FSEL_24MHZ				(0x2 << 4)
+#define VATESTENB_MASK				GENMASK(1, 0)
 
 #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
 #define VBUSVLDEXTSEL0				BIT(4)
@@ -57,6 +60,13 @@
 #define USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X3		(0x78)
 #define PARAM_OVRD_MASK				0xFF
 
+#define USB2_PHY_USB_PHY_HS_PHY_TEST0		0x80
+#define TESTDATAIN_MASK				GENMASK(7, 0)
+
+#define USB2_PHY_USB_PHY_HS_PHY_TEST1		0x84
+#define TESTDATAOUTSEL				BIT(4)
+#define TESTCLK					BIT(6)
+
 #define USB2_PHY_USB_PHY_CFG0			(0x94)
 #define UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
 #define UTMI_PHY_CMN_CTRL_OVERRIDE_EN		BIT(1)
@@ -78,6 +88,9 @@
 
 #define LS_FS_OUTPUT_IMPEDANCE_MASK		GENMASK(3, 0)
 
+#define USB2_PHY_USB_PHY_FSEL_SEL		0xb8
+#define FSEL_SEL				BIT(0)
+
 static const char * const qcom_snps_hsphy_vreg_names[] = {
 	"vdda-pll", "vdda33", "vdda18",
 };
@@ -330,6 +343,17 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
 	{ 1310, 0 },
 };
 
+static const struct override_param_map ipq9650_snps_6nm_phy[] = {
+	{
+		"qcom,pre-emphasis-amplitude-bp",
+		preemphasis_amplitude_sc7280,
+		ARRAY_SIZE(preemphasis_amplitude_sc7280),
+		USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1,
+		PREEMPHASIS_AMPLITUDE_MASK,
+	},
+	{},
+};
+
 static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{
 		"qcom,hs-disconnect-bp",
@@ -418,6 +442,32 @@ static const struct phy_reg_config hs_5nm_phy_post_tuning[] = {
 	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
 };
 
+static const struct phy_reg_config hs_6nm_phy_pre_tuning[] = {
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
+	{ USB2_PHY_USB_PHY_FSEL_SEL, FSEL_SEL, FSEL_SEL },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
+	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
+};
+
+static const struct phy_reg_config hs_6nm_phy_post_tuning[] = {
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, ATERESET, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTDATAOUTSEL, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST1, TESTCLK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, VATESTENB_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_TEST0, TESTDATAIN_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
+};
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
@@ -507,6 +557,14 @@ static const struct phy_config_data hs_5nm_phy = {
 	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
 };
 
+static const struct phy_config_data hs_6nm_phy = {
+	.pre_tuning = hs_6nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_6nm_phy_pre_tuning),
+	.override = ipq9650_snps_6nm_phy,
+	.post_tuning = hs_6nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_6nm_phy_post_tuning),
+};
+
 static const struct phy_config_data hs_7nm_phy = {
 	.pre_tuning = hs_5nm_phy_pre_tuning,
 	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
@@ -524,6 +582,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
 		.compatible	= "qcom,usb-snps-hs-5nm-phy",
 		.data		= &hs_5nm_phy,
 	},
+	{
+		.compatible	= "qcom,ipq9650-usb-hs-phy",
+		.data		= &hs_6nm_phy,
+	},
 	{
 		.compatible	= "qcom,usb-snps-hs-7nm-phy",
 		.data		= &hs_7nm_phy,

-- 
2.34.1

