Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905208;
	b=MJFPH9YZK5PB1mLcN6wT/lh8Mu65zOvu/bM8YfDuv5Eh9qUKxQ7jJ7Syl2XCBt4eK2Sx
	 y6pcMI/b6bwy1DF5sqEEb1nw8/sDmRdvWH8fBwbWBVewygSocMvUCHVKqnlfGhggLUAZ2
	 wVeg3R5yZPOqz49olOt08GBcItFFaFeoBR1XHFeH3GVZuWLSEt/z+8fHZWQ8zQBOWEf2B
	 uGDtICrPMCCXsM7JvJgV1MVXJcluxdU+Uztq7kbHJCxR6/9cOobYL9QHwx6NQkwfZPGot
	 DVl0Ok/cM3QN8FlXZoUAa7j010at2O8hPKzRU1EmEjZU7EzeueSBPpIwAMKoif17xng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
	b=XOGhMotZBnXLOqTf2XeB+Jv5FBeDMG9IDwmY7BD1JSTZDxhQ0E+qgeOC9ahPOwIGEnFx
	 vLd7MUZfnEfyB062HtH5smPhzS01WyZ7TcEsqXrb4yxNh5nTG8uO6feJTeOQ4/l9+60hz
	 kxAm/il7+GEpDbyWGkXxFPemldUmeKifDo+FJyiKlEkm7sMy8rTWF6lCxFdKZqWNuVuIS
	 7CCFCG9fxidZLXDmjUWFnsyacwATgGSoTAN4whAn12Q/0hLkS6jWRnZhBiE4tw+4qnjIr
	 lLUJgFqvPiBT7hKpNDCNbl6xuUYgONRu09BgOJGM6I0unGxTH92E1evtjh9RBIotDqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTeIORmf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="URJIJk/C";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086060A2603
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A086060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTeIORmf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=URJIJk/C
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6ex9d2998599
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=; b=PTeIORmfxb5eviGY
	z3VBVE5lWYUwUurjpxAvW/aDrAqS+NYE06SX37iEiOvSK9zoJCR1Odxwh7LqcHZF
	B3Dttx1axsU1BPhRXcYNJ4xt3j1ChYFhnzoK6V9yGEJDIYCawZ0HRSPBHjdarVvi
	2kAcCRbNxzg1861zDQ5Q42knEwSoxYAvIOsUVIjAxg843OI0r4v65RVLWofrKIFX
	eQcRgGxEASubP4AuQ63v/EH5adsuFvNx44AIRsCaBDME/nUU0WaKj/uxsizDDkHx
	7MHnlrfFpV9DkBeD1Ft/zymg2eZMZpgfOVPa646ZJTcDIP0boEbghbIfDXHNXh2p
	SqiZmw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0g2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd65070d3feso520926a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905205; x=1795510005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
        b=URJIJk/CTmhVRLQ2uJzFw6FrGers+XgrWZX5KCQsvfTxmh9HjUFhTilXIL8k2Mqw8/
         09pQCXmvgJXq9hShC928b5E8fC4/bQzQ1fVC7t8+Bal+u7dKqaj+1Plf6yaqXGbixPYB
         ZoMDdkQWDDNWcajOn9CkuZRmdBwVYeSL4tHIDRc2fNKWORy1P0RzHI3gMXlWUWLclRN4
         pCMhH4S0SJTxePYgelrP1kSNa59BqjD5Pmrv7NOl3o0EQPyzhFkD7jL13oZKzsrOXbdp
         gU1VcOAV1tpA5ys0H/Ny6XjabxzwKedBCCcpZichGFkMA5unS17zjtMjJkTF4Imc9FWe
         Mpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905205; x=1795510005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdIbBZ4ULQRqJJDrxiHRWIiIa4SEEoe3KYPpLWdtKrY=;
        b=OzdY3IKnKEYSLubIaKK1E34iKT4/iIKmPksRg2eDKv1neh7avJQjMryaHOsmcqIKds
         LJjqlqfhy56rDplHt9DcDO9fZz2kISBKMr1ydwOVy8p0cEEpmwM73r+ZNmhjwD1alYo6
         9fQNWdEUpBSHgxYRYe3Sh+Ls+2vRbSruWvH7WqaEEQ6hgvfGYkXj0e6xmlmEYxNMybYx
         WF9Zt5OA5XFMCx5gpphaPJBiUqq0A35c2CUKP8AKIr/PREqpAG2Bt+O/bF27s9nYYX14
         KHPHVDAmbdyXGrxm0KiZ7kGDW83z9RITfgBwykTn6KA/wxLdRL5Acxl2yJQ6+iN8kgSU
         f3Ig==
X-Forwarded-Encrypted: i=1; AL+hErFxRg085101HSXWZvHGQJ7bvyKGCFcTUOe68qrxC8S8fWdMyG7nGpXlQBV4ZuLq/TLITiibhem8knCPsD1t@vger.kernel.org
X-Gm-Message-State: APuU4Z8fptb1rRpmVGArkYreQuh5G75pfhFQO0DjYt7PzRp/viEiYz6B
	PfIIF/w0u9YTRsKLb+KfJmhGdvG1e7Z+2maTgTJRKBkHncxErw/pbl12+jXeE2kVUwOKQFaAzX3
	6MhjPV9xx5O3dvzpOJhiIqRhXJBZTq6IviGSkaK1qtjTM51VcjsyVpXeaEdIOQGxzIOfj
X-Gm-Gg: AYBFou0IfZzszYRc1lqLV9qG8F1UZEoohoifMlb5krDzWV1I5D2Hn4+WwUavrfUeAj6
	GmLEdifjwhXbmkijerLyTS6XfrL+WQ4i325IWr3tIdehlt/jQ+WtDORNJd9zPMG8UJZA8Ll4nfq
	FUSmdS21kvj3EVBJkE1cOgr1+uVBwqdwE+QSVeWFNbh4WNJVPB3FrbWmWdbovXV4bBCCg4//fBn
	UamUf6Dnia+g9uXdo+AE3iwd1rtN5sKXeN9QdIVv18wVzSQ2Ni38ozkakoQda/x2lV0gMLC9lyS
	Sp7fFu8F7rXr47pwvh7lx+HWQd4HUrnVDxaOmmes0azyjDuqlBOchNdNo83H8j8swfV80o5ASlZ
	tGP2GiNf4pDP7TkRYQ1xh6ON63vH3IsqY7z4r+5HXPj6wFCEh+IdcCJuos/S6ybBH0RoaodCIff
	T7WQ==
X-Received: by 2002:a05:6a20:9146:b0:3fa:2f3c:b00c with SMTP id adf61e73a8af0-3fd2e2ba1d9mr1539553637.24.1794905205191;
        Tue, 17 Nov 2026 00:46:45 -0800 (PST)
X-Received: by 2002:a05:6a20:9146:b0:3fa:2f3c:b00c with SMTP id adf61e73a8af0-3fd2e2ba1d9mr1539524637.24.1794905204643;
        Tue, 17 Nov 2026 00:46:44 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:44 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:26 +0530
Subject: [PATCH net-next v4 06/10] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
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
Message-Id: <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=1511;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=RpifxHIohWwcF3nhiLIn3gCgfBa+VybjsdQk7Cx2Trk=;
 b=LRDHro7v7JC89pC7fis0z3esT5dgan4Jacy+s0RcqgazDgOabVUBiBt+r1r07PWd7aQcMyYNo
 yu5IWG77AJ9AOFi6+o5QTuBYwU8+Jpd5ORfpMUbcU48Qf7jWKisFg7B
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXwBZm9U65WFWD
 QQdzdSQKBCyqoPTY3ETG+hEw8EQXEce0UcFkhFOtXu/gPTczmzU6JSSiYhdj60Xa2QI7ABgpTF0
 XXytKdy2tAVDoFhfhos4Mu86As6Khro=
X-Proofpoint-GUID: 7HbzrFSe_UCSOuVGsIcP83bs5Cv7FjGt
X-Proofpoint-ORIG-GUID: 7HbzrFSe_UCSOuVGsIcP83bs5Cv7FjGt
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc1475 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=pwD1iIOGdNV7nma60yEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+f4CwrbYHoKi
 bvY7k87ELvAMR2YT0Vo0NfAi2EFgnuvTsezT+G2b8BmoDsXgqyDs3hgTVWKBFRYcfg1ULlECdDq
 9s6+exkLVHoEXVM+IBhcnOjCn06wSwVVo5eYiTAIZFgvtLQ+yhS9hZknlaRmxadLQOI+mso022O
 6/GhDHu91gg5gJJaNR+E30Oh9Z29Vqm0VPi1ANFmplP6V0khXNFE76m2RkQn8D0gyN1YjtVVHAj
 O9mTmc9pf7olnufDNP+U19EUA5IOHkM0Nonl4PwBmFI45mJ3aLUYUCUZ4ptncWT1nu0EoIQ/fnJ
 ABdu/pfB7cCE9HjhR7+touujQu0PZQnLVZg5YhGBFJlvUTQU/P7Y0SIGnyEKjtfYq7vIyDqQCLZ
 Xw/ffnRYbTMcfGeWyaCsZ0xqAwO7DITuazsM9MUEr7Q3gI+1rFLKE+vbpBInpXgNh8ms2LhyZcu
 FR7vDh1URsTAKmGphEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034

On probe the RGMII link clock is initialised at SPEED_1000, which
translates to a 250 MHz source clock even when no PHY link is present,
drawing unnecessary power.

Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
a link is established.

The DLL locking is not affected by the current clock rate. This has
been confirmed with actual hardware testing as well as the fact that
the existing code performs the DLL lock first before changing the clock
rate when the link speed changes.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: add some details in the commit message to address concerns raised
by Sashiko.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 99ea7e0cfb00..192788e00dfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -828,7 +828,7 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	if (ret)
 		return ret;
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_10);
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 

-- 
2.34.1

