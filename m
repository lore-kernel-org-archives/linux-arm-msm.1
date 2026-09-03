Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A33B1EEE
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461717; cv=none; b=qptBwesMP70twfqDgh8xD/IVVakGVViV7XWAzVD0AsBVLBMhvepX4R/aigGL84iVTl8qQ/Zvu7DPqZl0uyovCNHlYcyiQd9iABWw1msU0ljmNBNNWaF0nzdJnowGEA3cOIRUwPSlKIx4teMqJNG4sdtIOYM1J9OEDMw4yjvrbK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461717; c=relaxed/simple;
	bh=6Sz2cqNRtW1LNezPdy1yYmWDiunh7gud6qBkVKoWCGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrGy5NYHvRRJh43Pie73OmCQD/094e/B5DDbmvU9ISqE73db6Jkjpb8jcwznYAHIoWUpYSLJv6/Tz9XXLPv7U6IY79JnQcSPmLdzaxqbT7F6gqciAxwhkGrYPxaFbWvhTAXj5otuj5Wafc8oW4U3x3Ic+N5goxldnRs7m7+NLDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADFubAnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgvX972b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADFubAnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgvX972b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3nW0820916
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 18:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=; b=ADFubAnka63XDCbD
	aqDT+9JpXBDtCltgiFy6CDI2ukQgiTLWpoMa/bial6A+VkAtZI5K4/2ONSDjqfME
	e5dyGBqysDMrx1dA2+d92LztUUNy9I6DtKsRLVVRXYMo1F8ljZCLNAahjZ3Wnwr9
	Cj87k9RIRIVwMjKzNqhbWlvO+AHEnSxRIkDse/Z/+P0bVJ8xQGLT4w677r/DUmls
	xaBJt/9B/0yQBpMl9x22IiMXuRM0RTlPw2Dit8p6trc2/onrUtQ9tBLHqpXyvfkE
	pEmeIxLiRuRVF1sgTV5tXAuVP1pQyDjRj1VXS6b3vjyn12eq7SvdHqA/49Qbh6Tf
	GAzKfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82ka372-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 18:55:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so213990a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461707; x=1789066507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=;
        b=XgvX972bJ1tRXKKEa0ykfdYCD1rCLfefX9mygNjidOwY8wkNHFLuV4YwNt3cvisYBv
         aLDA3W5RZVAeQLA5Y3WpKn/Nzffhzpa8Wm2qrwP7EJbuP6myNXqHpVxyIpWvrH4HZQQa
         1MCan0IbjFJGQvHUC+ymf4zpofPMqhLglUH4M2KLe8K1cI8WdWXqvvYiqc90V/Wl0vcE
         tSuG2UOiY2IniFFzfc5Fht+QCFYa9DeElGkh4XbZtlSGLUwAxGu5S02QaTqWk3/+euiZ
         M6tbw6tJ0FvpDqtXp1SxyCf1zIsQ7pxTdegd0lFcyQwY4sdOUAo9ovkTktY063FO5cYt
         f/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461707; x=1789066507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=;
        b=hm/iGrb6U4Duj1OY/iqpNStWy7HZJ+v3B+bRsnjFRN+tYUDAirfCTKmb9FeGBtKEjw
         PI2iBro6F5GEhSTy2HwefoMBDtlFSZkBWI6KtFqSJ7M7xy4dgDgmqDfO1GCjrgg6HqJ7
         QFRfqlGmy2bgtvzoW+/EadEbCe0IRkxxFYi56d6XuJAwGz8e58dTNSuE9Eoz8gbtsEGX
         H+MvgfqNWlvyB/w6sMovOtoKPqgXu8SGxF1ZwzQasSKMIwr9In1igoMrBnC1wTk+/xn0
         rZwotHVTZ22+Warfgx5hmB+8pmYP9ONTBF0SKkJ8xS6XYdlO1q1jAUzC/zuMDWObCBDF
         6Sbw==
X-Forwarded-Encrypted: i=1; AKwUvByrCHKqNjS/xFzsZ6QPxNAdkAe6mWij9+mZOGu26+tzcw21p20UREKFYczR9j0VXzmViwg+b4y7aMoQFqpZ@vger.kernel.org
X-Gm-Message-State: AFuF++lW6Qm3NS7xZaSl7L07U1HFDzMMb7yvcgxAcL9cb5Wwq5xECrz0
	p1aFMOFj41KLusR2MUXUcauRJ3pr8PVcHau/YuSuJihlsXNBai8ZinNV0YEJxMCPRpNVU3kGWzo
	3Ex3nTEl8pqMaSmykt5M5sJ6AnIr1j7DBxu/+MDDEe6tJ6XBiDvvEcSVYK5Xu+x3e+YyI
X-Gm-Gg: AYBFou2mGDfCeq9AmnhcxK/a7gwjiNOTWcRjtPyo5TvjHXXAxOizgIj70+/RXAGwHVM
	oOPv2n5rVWeO3oWWvwkKkCUPlDTagarMf4dN+AwT+qdgnS2V8bEZLHKVYJlcQblAATVBo6RDmyP
	BIRBF84IzEoNXxyAYlWo46oekeg7rGl/VRHL+KPyI9pMJd/oXb2zqjscniMkVKd5HrdbBVEVu2F
	sB9gIO8x/ILs+mnSFO7r6/ArSDHXBFyXABDlU1t7D2HqZkgQ4BDFOO4yTcfdgu4wwpkkDAvA5zg
	dhUAWI8R1eVhEfymU9m2QUUi/6eu+d6YsAAJwy0pwVYP81hcDJ6GL9p8sRV/k839f5J9JCmV8Np
	04Ng9FKVj1/9AnbUAxs7QHSNxiAL3bA==
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr881575a91.6.1788461706669;
        Thu, 03 Sep 2026 11:55:06 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr881474a91.6.1788461706059;
        Thu, 03 Sep 2026 11:55:06 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:55:05 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:51 +0530
Subject: [PATCH net-next 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-9-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=2446;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=6Sz2cqNRtW1LNezPdy1yYmWDiunh7gud6qBkVKoWCGw=;
 b=eafzCTaX5oGSJgmMpw+62BELOmcZDQ+A8rVZfjvC7Ql/q2fwMZyJnskZrX4L7XK4y/BoPFoX5
 J7ufBnL3yKMCY/FMtq9NyBMLv+s59whooCZWyBOXtIPKdRElcMhpUII
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: IZMj8yH9OxJdWF2lNjdiZpL492DpOUVS
X-Proofpoint-ORIG-GUID: IZMj8yH9OxJdWF2lNjdiZpL492DpOUVS
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99c28b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BjTvb0yH8tSpeHeYq6YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXyH7lNXruGQIg
 pVc+W2LVwroahDX8PuTgcuBARYFZa7epm/UmrK3ftUYRAr0ZaHKyfbcwsigl3T/5hYaQhD1x+qs
 fnB+/PjfItslVEOSOMIY0SWmv8HPasErwns37bcMZTPhS/JvqxGGE8KbROEWoe2hMdyvxFfjRwV
 NRfROiSm4PhS+lYvEz/AlZ7z05Feh3uACAjy+WF5UmHWSj14uj5AU0j8t1MYs076uoVzdVaNMku
 KJ108gh20gtRpSXBc9keeN2+710F5T4S8xggovr6IDR8ddwynIL+tlcmxjjW6q76VxLeeSvikte
 60OlB34uQgdo1Vd94CgZWzRz43lgxC4qhQ+FbV2YyO2KLsDx9SusmI2sR9H/norqNlpm/AqX3Mk
 s/6PZweOyj8+Tx/O24Hi9WyQT1DQtvjIfcayWqkroWGxxnwWYZaFUfLSAPY5nRTVrid1rX9MgMm
 Y3MosIFUx9f7rYDTfiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX1HSFy+kBKsT1
 l+mCK5CLp6VW7DHyFr4wrlU60IgzKy3ZDewRGxWS01+RjoQtBHOWFg6Ia5+YEU0aJgWiwvI3Z25
 AQ9Q/ddJJqKRHZQADgnIt8eu8aD9A68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030165

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
all at 120 MHz, and the 36-bit DMA address width.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a31541506a4c930c76374d7d8b7eceb6f51f37a7..f96680456472d1fa7b72bd404c1ddc20e505f05c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
+	{ "axi-noc", 120000000 },
+	{ "pcie-tile-axi-noc", 120000000 },
+	{ "stmmaceth", 120000000 },
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_cfg = shikra_noc_clks,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clks),
+	.rgmii_config_loopback_en = false,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -957,6 +987,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1

