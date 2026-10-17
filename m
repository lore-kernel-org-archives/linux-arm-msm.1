Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC623F1AD3
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230423; cv=none; b=CH1t/pTiiFIgH9AFMqRjuSKBkj1rUBtPHuPUIRZcoi8+B3ZafMHFk464Hv2FfEqhE1IuO2jZiyQuumlQbvbldE51q8FCpc2Z6gktuk9SaD+kSu/FECZg5WIUe0C/JfIpgT54WMjf17DHzwwEG7JSOyhEf5v+4ZWHrjRWzs7YUOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230423; c=relaxed/simple;
	bh=LRWhJyRn3PkcxIWYRNNivl3BW306tPYAnRD6RQt/jf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpWVpZXRHAy6//PocDlOa9FGXYIsJVI8gGjBlUuXwaG0ocJmJTJjlLRzOrO3umOWJZZtvNTj1mRY0ylQw7ZArpr9YLWOGAFfxUi//F6gCPAaM5MqRI+qj4jFSab1Lu2MtZ4rCsnYFDkSc6fjmBuvVtlf05kFBnUz0Ih4xUw02Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jd9hXNKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqeNfyR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jd9hXNKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqeNfyR2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2g9204317
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=; b=jd9hXNKAnoAHYnvp
	UHBT2ccQ94NXStz29JbncN58ob5j/+V/7QFALT3RyO0krTVQOywkCKQL/IIjZd3U
	Pq/iXiZe2QseoYB2HWiq2ykUlUmkFIaxGUUNYMDRLIt7/jg9NZjZzP5SzVW+gCJd
	KSBZBqfrKbjjgXjyhCpXGx6DIxE7g88JPpLGPfhLCgSgjXg8NaH7IGWmG+kuIzNj
	S8M2221cD9TpCqtJli3RpyFWwTeJzsFgRYEfLHJ5OsDEkFcumxpFgvCqaCPjLtaf
	rNQN4Y5xoBjbpvnLk7T5OBdDBeWuMzMBnqCSALkZf2hwl7SOaMrR65x7qWf/k8aW
	rz9tRg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnry4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:47:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so2510996c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230420; x=1792835220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=;
        b=iqeNfyR2VFYMnjRv7CwQNm6v7ZYM0FTHrgpBra0CcSRk0NbYqYD/N+7qXxdnWD96MJ
         erFr5HzZLdOHzK5vaBAm7zBIj15CEF8Zj8fUSrdHJhuOjNJLqqQJJsHmNWiTDD2kmMGW
         nY9bIToeQgVXQ1Pu6IZ7hcFxNEJKfYBfUkJ/2bPe22KAF2REZdUeZ7DvLOg/+kZfqvZt
         E1QRtkw1ZNQQV1an7gWIYOv4BqJL8KCDYnhGY2CFi8+P5YH3nB4GX3jIFOO7fWOO4vnf
         y/BwWPMm5H+Z5gwIICv7VLPa6DsOOSK9J4Y+Mb6VoOsV0EpCt4AHMykpugJ1GsEPar0W
         xbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230420; x=1792835220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcjbR8An16SR3tP/GJFloko/bvbeikqy8AxazhWq948=;
        b=tN+tMan4owg5fXumFuhvGtPeXs3KKeoZWkTgIg/LG/V0XLwPylBK31qEk0nO7WQysx
         buSXocVG31aTWn/K3Nhg533aaB+RdNzxNMKT/TRNQTgd9WixbQVLx3OkJfht39wI+/rm
         BDACCQvnGAXxiJKcCGCr/NSAI/G69KeO03sEWcQhNSYHVCidVjM9ipex9LAE15C65BNI
         pfhYgn/YFBU4d/y6bDWMo2Q8DXAzEHshoZqyAOZ1cXeAZabYCnrBvGDmAgRRPWDNEKHr
         Oz6s/ffB1FJZSooRxlOeT5jpJ7YUxivOmuo/7TsHCT8+di2I5JkkeC0575oGlN+i6VG1
         LN4g==
X-Forwarded-Encrypted: i=1; AKwUvBw2zR8wTUcSQimhaXzDjQ7/XWA1WUGSEayoS740e8m6rtwJyFdJTwGQ4bBqpOsFwd6RfA6JJV5G/NdhNzGw@vger.kernel.org
X-Gm-Message-State: AFq9FYL1I4EuuRm1hv9YnV3s57/1+MEnpA2h7WtBLfokWtzA7/m/v9zV
	PHUt4obD2BJJoGxB6buGH2IFpvNYTocwjGnR8VHjJM3JrjvWnmy8Zl9T2sXkbJKsR0bRkxcN4Tp
	6djwu3fjhYwFHp2qgTrHy71K1FO/zYtoj1kOLgPlqgqWBh+b0llTN/bWOrKXm0inY1Vy3
X-Gm-Gg: AYBFou1YLxZEIxu7VpPl08bo17Bat4iQlz2WtYpVbGjfIiz7Q3ux/xMRl8EgwkrQRJF
	Xw5WJrCIKJ1U5nc0+PLHgcAUpFhAxc3ntddkEYsyRsJ3fCZZyGuoO4y0AXpWAWC0lAVh8OROb6i
	Qk9NGkr+zgpOZjQdTnZ33ESFwsM3ilEIdzMAQuA+4o5e7gvKTseJxkRFPOzALVSCteGmGW+FQ+E
	/YTYcVg2EZG43yxjfHUbenOUkUufpOgVxzC81bWO8TMqxXc9C8V1f63t4dNB+3NZUUGvPLITPFR
	iFkoNRBxMB1eADUujnG2Bh746iTpwwKxLoBfLYShYv8lAubzev83Ie5WdogzuRJ1RdVtDwcZOGU
	1ujMaX6tY2ezNGPKIm2H26rqJf5rHdA==
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr3772620c88.26.1792230418553;
        Sat, 17 Oct 2026 02:46:58 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr3772587c88.26.1792230417954;
        Sat, 17 Oct 2026 02:46:57 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:57 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:20 +0530
Subject: [PATCH net-next v3 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-9-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=2359;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=LRWhJyRn3PkcxIWYRNNivl3BW306tPYAnRD6RQt/jf8=;
 b=8irhRRycJY4lMPeMj+cjkHGT1y1OlkmuNDgvS66f2oU8rsvggEAa5HJEeCWPbUqMEr3ZUG3Vi
 bxh4S3ShekxCm6dM/rJVicTZxfQe9mMakJ0qVXvyZC4RUafE1IliZuw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad34414 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zfyZ_crbsqx4_ZaO5ygA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: CX6-mHmVC1Yfq0ZVYqn-Rmw1rnnTo2lT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX7uEcJ6CyPuUx
 LnsU00U6Xs5eRBK4lDC1zBcf+MNlBOOaml13EjA40m63x8iBu8MvwRdyRjyjVNDsAlHbb8YciBg
 wkT0vueNS338nCF/1Q1wwyGQPbgoLKY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX+2jR8VBTulNg
 zanr/JxqlTXr/6FXn+DLdw5XArXa/S/Iw711BIg2PR83pid2ao8sfC3Cq43z+1vIk2Jr6Y1fP3R
 gIgwGYhH8vSUnakd5fm/e0/UwWVQa8hUdWUyVO6Xa4i7jFBT4OzTRNpUCoSNcYu2K4eYgKkRLnh
 dfyfa0nnfH4IB3n+Wwc0PquaHjLQhzhd7KziBIbElEc+iPtp1SL5PGsQGXPmZnOulH2ocFmzHdU
 HDMlzSMAMUFs8X+J2kEyHWoOEp6ecMEPGID9ds7IOMrjFc0dAnGl6jqxDjHgh1r6T0FKjpfEKaT
 u2XFdpVH5kvCkWS5G+ZjD/XNlw+2YQ4EiD9irp8J30N3MydufMZFvDWHT5wT2gSdcNyMMTn5VwN
 TBLJdUcXokIAz6AkLNKl3cU+i1XCvIT1OqbN9BiFCa0MmWclC3UftjQIbqySl9Iwt9tIn5J2UnB
 zK/wb3Eg+VTRlK6f6Iw==
X-Proofpoint-ORIG-GUID: CX6-mHmVC1Yfq0ZVYqn-Rmw1rnnTo2lT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth),
and the 36-bit DMA address width.

The NOC clock rates are set using an OPP table. As part of the NOC
clock voting logic, the qcom-ethqos glue driver takes a second enable
reference on the "stmmaceth" clock, which is already enabled by the
stmmac core. Since, all three clocks must run at 120 MHzs, managing
"stmmaceth" through the same clk_bulk path keeps the rate-setting and
enable/disable together.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9c602755532e141f4b822721686b1481b29b7d4c..a4e083a8517d095e5571b1340f9dd4b5e0c6e81f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -307,6 +307,22 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 };
 
+static const char * const shikra_noc_clk_names[] = {
+	"stmmaceth",
+	"axi-noc",
+	"pcie-tile-axi-noc",
+	NULL,
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_names = shikra_noc_clk_names,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clk_names) - 1,
+	.rgmii_config_loopback_en = false,
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -947,6 +963,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1

