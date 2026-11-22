Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316235;
	b=pNzFeDol9UP6Q0ByP1VlepXvQbUDJChyixLB3jfdp4ab6D7PhpouLqzDAd9uDBhHSKIP
	 yBXQRTer4bOuTSkK26jNCveHdxsLin7Ed2+rf2JneBh+49+zGVNJxWEm9vfdr9/taTycz
	 Nm7fRJErE4vJuOtlk5i8c7Cmlf4d4QSBGnGJ1lIK2mRgIxrCvdyfad1BoaLnphBTVt4g9
	 Jmgz5NK6os043XMSV7d5OrZqGuUgWaNsGMuYRCWUi83P5Y5oAHSMbP0R82VHRG/ENNhQb
	 8OzgqbPascG84/nG97D5SMNqqWl/5nTepIq6bqVFTlgmALBuCkEuwyciwYO6VxWJjTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VGyg41GXSa1t7JD+odVPtveGmi9no069XZQ6JltegDY=;
	b=bV32RkY9ZIKcbZoHrXvb0B6x+iMHmnPry8oCOgndp+39ASYj86pmMn1L7J+JldCHhA1K
	 ayaqBP8ZBPVPbCCwct91TyOEwIaUW0u1/WcWYyOcQF8dAoKO6VB9n5nbQEMAXLiqyd5y8
	 5hSIBkZADbpmKvnMkyBUMY+x6Kv7FEathk1AkSchZgtfgQFAKJW7Wav5tfbhU3jnK3QgB
	 PpGpPvGWshm1R/AsA3Av7270ljTPkc4BVniGDkNBesyeQTjdyEFGTkh86TcZCogysKjEo
	 CkdyMMW7pWwZcOjFzJfzm41qhz2KtCelC56Kgi29OBBAlGLHjeOgxc37oFsqJH8F3Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncXSKlgH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bJaYFQwF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D47606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D47606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncXSKlgH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bJaYFQwF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM09OeJ1498832
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGyg41GXSa1t7JD+odVPtveGmi9no069XZQ6JltegDY=; b=ncXSKlgHzqyhZJhk
	18JDU/XBSpeRDUS2p+9reFiWvy9dbuh03ulsedhwFJuu8GdQeIvT/URl/EvLGz/5
	7fhSme/yApcO4V7oBu2XsCZO79cYiGlHA7pw8wFR04guPn629T827nMcFVHxoNL4
	pJieToq5E6Q6C560AUn2N6bzCSP+52/c7hhufJrenQKkEwPEUN0TGQ6I1AqMhRDt
	xz/yC9r2OMl9U4sfmsEvRpZZVK6ZNKj331n3YOpltaa9wI1WYUYZkzS9j431hPLz
	7/rMjXmFlMbGPCfMpBYMNx303ID+0gpYZih6UieH4P2bnYEKu0XmoQKR5sMhscu+
	SknnGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342gje0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso6018557eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316233; x=1795921033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGyg41GXSa1t7JD+odVPtveGmi9no069XZQ6JltegDY=;
        b=bJaYFQwFAAF3eg0ARp9v6ywTqVdbH2FRSXHcsHD7npaT9Po38Wdn7oiAKRdj07sW6/
         KDCRCYhUMZ6z2wgjBX7iZc7RLxnsdfQo4M24qUOgJ1oku0xcIbw6Vn2Yiv11QZ1vD5Qb
         LM96HEz+3Hr6SuCHLZIVtGcRdBiu4pLR95JxwP/bV8gRWhs/aqABP03YwcAzUbJFqgiC
         BtxsXjbNRLH8oDTLUEkUfCyFO+HjODLbHgpvGFDJUkiKCddxqhUQBu4+ZhXWsRcwMQN6
         Z4s/gmK3p66uWOYYT2QC9sSDnMtYdyXlt+VErYL2MYvmNpdwx9da6EtLPBUicMzNiovk
         HqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316233; x=1795921033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGyg41GXSa1t7JD+odVPtveGmi9no069XZQ6JltegDY=;
        b=02TteYofmnV2o/G2dVSMH8gDS4r6gtvQgKh2ADk4cDVolpNiZRp+IVbdYNyGVXwNJn
         fHoilnnre7vlU/0BLj+Sa3zQsnjdUFqMYrhnZUq1Nwv+KKS9XVg+oCAr5GC0seJ1YkQU
         h5262+mDhhXYGCvBDLxsapqo6UphCHcGn6Kg+M6YPZbtfhP6d0vPmdGZA1XiH8HobhLH
         P0pVu/S+AuTDG2WFOczXfv+GQjZMmiaB460HjV3DASBXUH5PK+YaxnZ7iJYCoCXbHXTN
         YSzyJj6tl+3fxPXe7h1VOW8Ff+C5oFZNEWjae2w9Hu2RTblkk3vB+VkRfv8scgKRTspA
         E9xg==
X-Forwarded-Encrypted: i=1; AL+hErE3iWNQFTPlLYFktKb918yN0KGrH1GGV5M2Eur2WdmBxCb+adBJa2bHz3Zc1+eVoL/h1gLUyJC83N77K3VE@vger.kernel.org
X-Gm-Message-State: APuU4Z8FTNUqPjuhsk9W/Wd0DcJIivv2RGCaGZ+Ax4iJxRjM9Z+Dcy1q
	UHhwgIzNKtBETTfh5XjYKckHRlFc1QgS7CGy+1jnk4k232ENBIGTus8zsCWvxRFZDtCMNyVhGrS
	LJ8rfi0ATewel3Oz4TBJWu04jUj9Z+LguuQLg6EhbyiIn1gKtJjywgF8JiiDxFZsLJfNd
X-Gm-Gg: AZFdTZd3BbAerW9MqNsiZzKq5mB835vuVIqx8YFzLsyQaXb900SCigtKX0IaQd1y4Yp
	APjkUMDMjoKEC2WMHH213uD4FEKCQpHIS7J82Epnu/yw+jPXKOrD4m6U9InMLa+eDc9WP65GPZO
	DqxbZq2F5gX4TmUXqux07l8DPrrUTeljFumxJBMv3JQcDunspaL+f0Vom0EatufWG7dgHSnqDFm
	9M7WM6TcSZh8G9O7ap4Ei2sHkxGv16B81Pz0+4hLvChsYN0IGlXLNWC0S5uAbPUzJ2NXESmZ08M
	SVY+P6mxDHAqhdTdhrQL8oO+QGMReihjp5YMYc9hLH6aCRfwrD20jc5bl9rX76QT6Kw2JxGY0KV
	tM7FpOXe4yimOGbqQt5r8XnOUj9/BuDndMrC89hZ1ekSZTBGL9KkNjl/TCW5aPk9gZcX3+ZcCCu
	mZN0e1OhQC
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr1260105eec.31.1795316233120;
        Sat, 21 Nov 2026 18:57:13 -0800 (PST)
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr1260075eec.31.1795316232657;
        Sat, 21 Nov 2026 18:57:12 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:12 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:19 +0530
Subject: [PATCH 06/11] phy: qcom: qmp-pcie: Add Nord endpoint mode init
 sequences
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
Message-Id: <20261122-nord_ep-v1-6-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=9903;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=D7TXCxmpb6NIDfIhxXQnfeqUHRFnN8C9uI8hGoAr3tY=;
 b=0uzh63EI9tJpLhhEjdIreo/U3ukDfybfwBlOQxDVotaRJ3Id56BzQYN9VsYN/CZr9Wunlx/sK
 7DPI0clJyJlCJJRmV9Dys57jx/U1BBR1uDIZOAqomwA1P/LFnxrxujs
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b025a09 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BvlutTLlwcMiLWs3sTYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: aOAkDX8FcjnaYsjGZ-mtEoSp84ejufof
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX9iFsGlXh9elH
 aH/0iXqKlHLuHfV/RkBGf7AZYDz6YbCzasR8NApZJH113nSUf3m3y3V07zoW1475+EN4B4lsNyq
 P+6/atUJe8k0KJ/afD4R/BySdWX0TqU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX+mkzD7kLLrkn
 YmdWUkLyI3glMi9Mu55bF/ZfoogIBRJrwqyO5qncvl9306qPmMeIzGu8dTff4RWJO3U0OFK0Dbq
 PFyyUFvOv6GCOz8V7cfvtBndUJoz0nSYpAt1UqXIyGgvVJc7aHRacGO3vUG9tgl57iBtP5LdQP3
 t7Z9Pd2toszc8beDfzCNri8oFgb9hp7G7cd4jhqnly07KUYlX0lgE+vx1h+ss0NHEHOMe0/Wq62
 nDxBKeeTRaLJ9sRVmGuy7S35xt9Y+vcPCvBV3Px6vNaHPfnJMadw+TKpBQV3HFwzl/run5S65Ti
 UcvxTsCnE0BnxHzvTnLDQKfZ7SHxK6wg+xeVq2CifZUCin4OlvqUHJBUhJn18tBj+kZCleBP5Sf
 EatHJImLzAW+EOnF0vXt56A3U8O7gnOUnVDPGMJRi9MoaZgd9F1cBESP2sCUSegANv8EecbSyHR
 jkD8VHvHD1iXMGLYpCQ==
X-Proofpoint-GUID: aOAkDX8FcjnaYsjGZ-mtEoSp84ejufof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

Provide the endpoint-mode PLL, TXRXZ and PCS init table deltas for the
Nord Gen5x16 PCIe multi-PHY and wire them up as tbls_ep so they are
applied on top of the shared root-complex tables when the controller is
operated in endpoint mode.

Add the QSERDES v6_40 COM register offsets (INTEGLOOP_GAIN0/1 for all
three modes and CLK_FWD_CONFIG_2) used by these sequences.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 97 ++++++++++++++++++++++
 .../qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h |  7 ++
 2 files changed, 104 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
index 21cf6adf7d60..dcd8a3f794cb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -653,6 +653,102 @@ static const struct qmp_phy_cfg_tbls nord_qmp_pcie_tbls = {
 	.port_split_post_cfg_num	= ARRAY_SIZE(nord_qmp_pcie_port_split_post_cfg_tbl),
 };
 
+static const struct qmp_phy_init_tbl nord_qmp_pcie_pll_ep_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_CLK_FWD_CONFIG_2, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_CP_CTRL_MODE2, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_PLL_RCTRL_MODE2, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_PLL_CCTRL_MODE2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_LOCK_CMP1_MODE2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_LOCK_CMP2_MODE2, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_DEC_START_MODE2, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN0_MODE2, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN1_MODE2, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_BIN_VCOCAL_CMP_CODE1_MODE2, 0x87),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_BIN_VCOCAL_CMP_CODE2_MODE2, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_CP_CTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_PLL_RCTRL_MODE1, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_PLL_CCTRL_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_LOCK_CMP1_MODE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_LOCK_CMP2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_DEC_START_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN0_MODE1, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN1_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xc4),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_CP_CTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_PLL_RCTRL_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_PLL_CCTRL_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_LOCK_CMP1_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_LOCK_CMP2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_DEC_START_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN0_MODE0, 0xfb),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN1_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_BG_TIMER, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_SYS_CLK_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_SYSCLK_EN_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_PSM_CAL_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_COM_CMN_IETRIM, 0x1b),
+};
+
+static const struct qmp_phy_init_tbl nord_qmp_pcie_txrxz_ep_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE2_B1, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE2_B3, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE2_B4, 0x2c),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE2_B7, 0x1d),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE3_B0, 0xde),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE3_B1, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE3_B2, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE3_B4, 0x2c),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE3_B5, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE3_B7, 0x23),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE4_B0, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE4_B1, 0x68),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE4_B2, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE4_B3, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE4_B4, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE4_B7, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE_0_1_B1, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_MODE_RATE_0_1_B4, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_LANE_MODE_4, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_TOP_LDO_CODE_CTRL3, 0x83),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_CDR_CP_CUR_PLL_RATE3, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_CDR_CP_CUR_PLL_RATE4, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_CDR_IQTUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_KP_CAL_LOWER_FREQ_DIFF_BND_RATE3, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_KP_CAL_LOWER_FREQ_DIFF_BND_RATE4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RX_IVCM_CAL_CTRL4, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_CDR_LOOP_RCODE_FAST_RATE_0_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_CDR_LOOP_RCODE_FAST_RATE4, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_CDR_VCO_CTUNE_MEAS_CNT1_RATE2, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_CDR_VCO_CTUNE_MEAS_CNT1_RATE3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_VGA_CAL_MAN_VAL_RATE4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_KVCO_IDEAL_FREQ_DIFF1_RATE3, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_KVCO_INIT_RATE_2_3, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_KVCO_INIT_RATE_4, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_RESTRIM_VREF_SEL, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_PCIE_V6_40_TXRXZ_VTHRESH_CAL_MAN_VAL_RATE4, 0x45),
+};
+
+static const struct qmp_phy_init_tbl nord_qmp_pcie_pcs_ep_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_40_PCS_COM_POWER_STATE_CONFIG2, 0x34),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_40_PCS_COM_PCS_TX_RX_CONFIG5, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_40_PCS_COM_PCS_TX_RX_CONFIG10, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_40_PCS_COM_ALIGN_DETECT_CONFIG7, 0x30),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_40_PCS_COM_EQ_CONFIG2, 0xdc),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_40_PCS_COM_G345_EQ_CONFIG1, 0x07),
+};
+
+static const struct qmp_phy_cfg_tbls nord_qmp_pcie_ep_tbls = {
+	.pll_common	= nord_qmp_pcie_pll_ep_tbl,
+	.pll_common_num	= ARRAY_SIZE(nord_qmp_pcie_pll_ep_tbl),
+	.txrxz		= nord_qmp_pcie_txrxz_ep_tbl,
+	.txrxz_num	= ARRAY_SIZE(nord_qmp_pcie_txrxz_ep_tbl),
+	.pcs		= nord_qmp_pcie_pcs_ep_tbl,
+	.pcs_num	= ARRAY_SIZE(nord_qmp_pcie_pcs_ep_tbl),
+};
+
 static const struct qmp_phy_init_tbl * const nord_qmp_pcie_pll_a[] = {
 	nord_qmp_pcie_pll_a_ovl_tbl,
 };
@@ -839,6 +935,7 @@ static const char * const nord_pciephy_port_d_pipeclk_l[] = { "pipe_d" };
 static const struct qmp_phy_cfg nord_qmp_pcie_port_##_port##_cfg = {		\
 	.offsets		= &nord_pcie_offsets_v6_40,			\
 	.tbls			= nord_qmp_pcie_tbls,				\
+	.tbls_ep		= &nord_qmp_pcie_ep_tbls,			\
 	.pll_tbls		= nord_qmp_pcie_pll_##_port,			\
 	.pll_nums		= nord_qmp_pcie_pll_##_port##_nums,		\
 	.port_split		= _port_split,					\
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h
index 0eeab0693e9b..3cc030625f25 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h
@@ -8,6 +8,8 @@
 
 #define QSERDES_PCIE_V6_40_COM_SSC_STEP_SIZE1_MODE1		0x000
 #define QSERDES_PCIE_V6_40_COM_SSC_STEP_SIZE2_MODE1		0x004
+#define QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN0_MODE1		0x040
+#define QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN1_MODE1		0x044
 #define QSERDES_PCIE_V6_40_COM_CLK_EP_DIV_MODE1			0x00c
 #define QSERDES_PCIE_V6_40_COM_CP_CTRL_MODE1			0x010
 #define QSERDES_PCIE_V6_40_COM_PLL_RCTRL_MODE1			0x014
@@ -26,6 +28,8 @@
 #define QSERDES_PCIE_V6_40_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x05c
 #define QSERDES_PCIE_V6_40_COM_SSC_STEP_SIZE1_MODE0		0x060
 #define QSERDES_PCIE_V6_40_COM_SSC_STEP_SIZE2_MODE0		0x064
+#define QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN0_MODE0		0x0a0
+#define QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN1_MODE0		0x0a4
 #define QSERDES_PCIE_V6_40_COM_CLK_EP_DIV_MODE0			0x06c
 #define QSERDES_PCIE_V6_40_COM_CP_CTRL_MODE0			0x070
 #define QSERDES_PCIE_V6_40_COM_PLL_RCTRL_MODE0			0x074
@@ -68,6 +72,8 @@
 #define QSERDES_PCIE_V6_40_COM_CMN_CONFIG_2			0x22c
 #define QSERDES_PCIE_V6_40_COM_SSC_STEP_SIZE1_MODE2		0x1cc
 #define QSERDES_PCIE_V6_40_COM_SSC_STEP_SIZE2_MODE2		0x1d0
+#define QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN0_MODE2		0x208
+#define QSERDES_PCIE_V6_40_COM_INTEGLOOP_GAIN1_MODE2		0x20c
 #define QSERDES_PCIE_V6_40_COM_CP_CTRL_MODE2			0x1dc
 #define QSERDES_PCIE_V6_40_COM_PLL_RCTRL_MODE2			0x1e0
 #define QSERDES_PCIE_V6_40_COM_PLL_CCTRL_MODE2			0x1e4
@@ -83,6 +89,7 @@
 #define QSERDES_PCIE_V6_40_COM_DCC_CAL_3			0x2e0
 #define QSERDES_PCIE_V6_40_COM_PSM_CAL_EN			0x2f0
 #define QSERDES_PCIE_V6_40_COM_CLK_FWD_CONFIG_1			0x2f4
+#define QSERDES_PCIE_V6_40_COM_CLK_FWD_CONFIG_2			0x2f8
 #define QSERDES_PCIE_V6_40_COM_IP_CTRL_AND_DP_SEL		0x2fc
 #define QSERDES_PCIE_V6_40_COM_PLL_SPARE_FOR_ECO		0x2b8
 #define QSERDES_PCIE_V6_40_COM_PLL_IVCO_MODE1			0x0f8

-- 
2.34.1

