Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EAB40F758
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230393; cv=none; b=PiVp7Mpu5XC93pZ6Nah9Niy2e6KslGWPRLLWZ6z71qzEAfhGAAJLYcOVXCvpnHlyYCYH9rugyoHpCCFW95ceOLU1qVtIwR9qBCNTPvAzg0REHsqiyMwO+phZO+kOQytygO2DQPLO9zqWMHRLyR4oWLJ58FKOK9gVO/ES4Ordjww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230393; c=relaxed/simple;
	bh=WU9WvsTJoNSYe0NKFnnpj0KI7+5RPM3wvLR4H8Dso9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QriJRAAmDCWxgzA+l2pCS99ELAxbzGup/05vwrjE3VezM5vda7pHFYMf3pcn74s7ERyzT7AMhC1Tu7qxs5xL4/grfUqqwSt+m7EMeRXVcgPy9I1EQkZusWmO+TlCzSK/TZbtZDo0vChj7lZc8MXoO1KdOChYzVJ3LlEtEM3MzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwjcBDmj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yy8pFlKd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwjcBDmj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy8pFlKd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o3np4002880
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=; b=NwjcBDmjGu29jXns
	Vb58aA/y0sRo+EF0p4Q1d5k98O2PAllHJYIw81HW2xQTB4BejGTAiO2Wj+WM4qrh
	NLNOakxIu4flI/kmcG6LioxxdAENSrT3p8YXPChJKKanse/Xw5V5ICdX1j608Kr9
	ZlmQPbaOkxBoX8xqgr/p1TyVYAhjDfBGYOR8feRBVBFundOdJuBs6mNQSDUTM+oe
	NWGg/5ztjNTxIKE7Ty7FHIiWWYGoiojOBI1Y/lZK0Jt09uF9hM5CKhXWaLo9iqM1
	NiLzsGHcY11FNUf9L+bDAsV9b13Vnv0IzMkB7HKNNP6TnoOWbZPI1AwYCKyEdUMv
	EhY5WQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se0j1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:46:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1829830eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230390; x=1792835190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=;
        b=Yy8pFlKdMJ6ZncLASAiDV92HCFRGTIE7WiMTzPZCi5g054/oFdyQOFgSYT8KOjijsN
         gbmp3Jlsvfe0qcLY5oAVnbbiXajlcObZvC+LEwRttxiPjLEwHV9UtWryep/16yAQ6LFj
         71u1kuFJJiS0Cj17sBU8XKcgN3LIs5nO8zOhHY5uo6Di3VVDjysl9AW/Ec+ukPqaWvyW
         5AwHBtbvoFhp/fQr9HEUAXAr1PyJukMSVHQh5glpZ4WNslNP/gU+C5trJM0f4DxM4idu
         fyyyM5wppfP81hSXHCURmNMLSAYn9Zhc4Dbyr3kwPgLo2EVbFIr7B1FAniUkBRWaM0gr
         tbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230390; x=1792835190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nUB7bCXQCD/IAwaH2Zuux5vH1L+5nSFpfs1GJQ9scg=;
        b=Tv9PEVI8EgC8OFvmGlXf1wJYXWiEfEgkLDY/isv2SlGNqmLSAdyfxpPCV8c7+UV7LB
         KtpNhM9fHeVbeBKyAL/vng1fj8kNm2qahAYW+i/KBhtXgB1x+J1NmaVEUDidmrJU4Jhn
         TFcFs3HQLLZcVbe0jW5v37Rpv4ly+CIrk0EHrDM6WUMf87S2hr+qOPMK7do7sZNnyPKn
         AcJf2ExzquX2jIedTAylFGHZMGW7nexkByGWgHN2qjj7NA1spEq9OJaaoEhABdtAHsOL
         4v5eD/Ou0RhYa2RCANKZkM6I9214x125HB8qg+NTebv5vfqdIwWJZ8uZ3K5jEnAnYPrT
         bPzQ==
X-Forwarded-Encrypted: i=1; AKwUvByNI5oFLhaRVcen/Bc+HG/+rEwzz2pUm31qvgDxyX686Ou81/A7lshVL3MbdbJ1yor8/tbk8WxrS1LylCwB@vger.kernel.org
X-Gm-Message-State: AFq9FYLR20nXQ9N33IXrrLZlpRUU90qaGWIl5Th/EuLtYl355hW//J5o
	GiLx5xsPyWv3JGMeHEkdyUVI4yjxCrhSaqEgoeBCdosp0K7Qm79Z1Wc9VjY+yDsbkBBqRT96JWd
	SlZROVyZvTRncM+s6UaqqHVrGKNUU5OWkavERuK7mmzsqEWah5QVrXHu/bUVOEAAxdy+n
X-Gm-Gg: AYBFou0nKqTqETYQz2KOWJnLtkG+hgjj1acM5n2sKV25eIyXPvpcA2EoKct3P8cijN1
	H9nnzhGKsglzR0EEXUna3upiLGu6HuGXmBXN1s7/lW0zZVrw+U4HtffiUxUNZ/3CP46rBUxpYzz
	G3L1HtiqTsx/NFykQRHW1TNCo1RLxlvJlB4Tlf4keR+gXpBcnjxgbqSVlFGUU118Z0FXzHftNfL
	9QOwEfW4M9KtUZCOr5dkYayMbKj6lKjcADSNg5LEc4INgiafbFGSxPtBj8Z8rOkFLrkkEx+tQiB
	oR9OOlfvOXEJyrdbBzVBW92KKHBX3ARhi6FevOi7hkrKrgv6P9kZFl5OBq329MODK0k1KQK5xLs
	K43It3JNSVQWvGvQ79Rpm5/bT3273DA==
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr3026139c88.26.1792230390399;
        Sat, 17 Oct 2026 02:46:30 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr3026109c88.26.1792230389755;
        Sat, 17 Oct 2026 02:46:29 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:28 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:17 +0530
Subject: [PATCH net-next v3 6/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-6-26a8beb44b8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=1349;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=WU9WvsTJoNSYe0NKFnnpj0KI7+5RPM3wvLR4H8Dso9Q=;
 b=YkxYX4jCWv6bOW32Nmox3gO9gIrqjA0yxsz9GwGhNyIX+rBQotwK3iFIRxIbW+9u4xDe//N18
 hzfFOWy71AHA5eLdSoKSX6HxfpBZcZmxVAbJ2IR3PAbAsdNfCoiC3Zz
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: dIlYAB3dMrXB9rtnyWZAm6IA9CJEmv9E
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad343f7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=oGeBSM6iGANWI8Y-5VEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: dIlYAB3dMrXB9rtnyWZAm6IA9CJEmv9E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX5yaqvuSKjsDY
 JZIBX5dhbV76rey+0R+cpSt05nlNQTkIbWTyPfZglSjisTrEVxNHd81CDtpxjgz++9SaanlEtJu
 8N3lZHSpm19jPywmtGKke3pJOO+i14A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX24CDllnUUOrK
 f/g6wU7mG+JlHcTKiulNp7XHew/GP9XLOtuRdgmlqVJCd3kMhL2VrySiBVduGZjqePBHvDr5j1f
 rXJKKMnBOLPZEJGv1s1HAt3ltBmBG1HmjYnxAUCv79Sy8OOEd6faKJoLg9ZlAKyzql5t3T4Nj7E
 iTfCN2NE5S8Iip8VJwUxaK1F90k6SV8ysme1heM8LXnFn0jxdiDp0oOmhoBOJjvfXXa0WDdA74X
 nNJWEPMuJ7DhedBgiWiozLsQCieSPCShs+mkPhEYdeLn95b1UTUO8NFbSH3mJpwVpSGywvmCt1g
 wuQxkJ/Y9VIMLU2xIf7JBZB+rfCNS9iRHheC5d2VFdE5MSZwU/oA3Xo81kFvY5mXgq5ROXzwxnu
 rNk0eqnhcyZgR+SD6X3RUO5ypDhBNdQUMOCyfo+ez6D4gqyzEiwz290iMOeWAbnUvZRjDkMeXlH
 KzJr8rVada4MiEYC5qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
a link is established.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v3: changed fix_mac_speed to set_clk_tx_rate in the commit message since
that's the function actually changing the RGMII link clock rate.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a92bf4a6a2dbd987893bd4a3890df770bb7a7e56..2471871562ed9915398614d5c88d1c6673829db8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+			       SPEED_10);
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.34.1

