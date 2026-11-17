Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905175;
	b=vNWZfOTFYG1eivbbr4Epz5KND3h3zyXMcvot9f/9R5tocvEqaaT1TZKP4JfGNLRx3fRl
	 IgrfHTToqRfflIHkPmR8Wu2KeSLqrIdkY9TxHYZKc6Gq0PFkrv9SUwfUvg/LbtqrArGPe
	 edXh3LX2xLW/cNTHpBVr9MuElvQBradC3ChQnyXcCIpWY5dl+PwvcAAy4yd3ddi6DFF7l
	 /L+6rSHzFDwmLAu9WkUriPoFTFr9+KXXwqbvN2S5aUDmxzb+VMo08n1D5jupzyPrjHGgt
	 lGnK/9a22kUT44tv8dLjiXcBhHcvLedPNzEYQ120oBtQR/8YWfGSYPI1tufPVZNjRiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
	b=YKw5BgjxKCqk5BLQ/ldaNLW3ePsfTdL/jxECU3Gd/MJNjKhDCJgu6qCQjPM4FfTgWXOn
	 BgjbVx/DfRQYRKw8IHN9GzCLofrykFsHVHqP37kBB0w2MAqBYsv77XvyP4m2gGQLUF8fV
	 Si2MGkbBmSvx5iwpPo+xL8bKbnJw81nftZsBnSWwy7D5Lzy4vyFdQ8JMk9ptu9eKRL6wN
	 qhk75bgWkyxWXiUkSgAI7oI1qE1IurvSphgakEQOw7tFeMkUTeuJnnbZ67d5GhuLB6mJr
	 zrSUbHQQ0PENKN9F1ho4x4TYUj7MaQBlJssK67QU3H0TLCjxGJZM3ZeKNCb04MvFdGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M18rxBSS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bEDqaQ2+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D77606A8A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D77606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M18rxBSS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bEDqaQ2+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55gLA3350061
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=; b=M18rxBSSsEMhIqJr
	PXBfchimancq+y9b5XcD7PidRhr3x16OH5bDcp/ELGm9t6bM80gRzc2BdxEcQI6n
	pB+jLk7DbkclTK2SbrvG3/BYEq6w6H3lvbSlfCV8JvixxJ9h6ZZCIPAjgcZpycX1
	265BAY30empgxsZiZnud3g8EEBQVkSPVHs3xs/XYOyuaK4hp71FscYseeD52IfFu
	o6+mxmm/UDL8P0YkMuU0Hyu8Cks2shSchWkwhRGIs+krgO6fPieRm/swGK6sVBHM
	cDfSNj4ZmMa9vaewQmHwNerPHqP3Nt7m8z8pC4vp0ePkQ3FXnzkSPhfldn4lph0f
	G3Iisw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr0sdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso3419654a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905172; x=1795509972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
        b=bEDqaQ2+egBfOZSCTWJ5VDI0LEWSRK6iATS329it18s1T1nlzAR210nKyykCZfvp19
         qe+0UXljH7/u3U4rTb9ypCPELw3s8OOqkRqrum3NFxAJ4KWHdFwJNCUog/7zT/9fhONl
         2v/5QkEp1ipxiArFqiOOIaQ1+afOuseogsHL8FJguVOyxfURPwQBibzrEa/p8uxl+Vk1
         tQISKyFYJM7lzUwtlj8XF/JzJighd3h9YAiBACFe78u+du6XT5L6e6pK0XtH/kkT2Tne
         bMlihTOa6Wk0ZTnb5vWygMLfQCRk95yoe1SUY+CfPO747aLrmo8nUnywqjEkl3hOY4fT
         T6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905172; x=1795509972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAObOgv4fSLIH/J9Ziw1VGMImzcun+B3vJBISd4JBTY=;
        b=VQtQLKd3tWn81jm+wISQRmgQhai/SoXknIwps4Uahqh/hyKSDbQcu5C0M2T8SWKZvN
         J/31dvg8Xy91ZIrMX6DRrL8bXiiKLOXta4X8aNPdRCiMv5jAxSLeSTyCbLyQQMKM0mg7
         gUHJVphMtvrmLKsCmfxIybKO6qn23pItscnlu1udVTz0DwQkwx6zcP6GBvMPS5nI2WnS
         eyQnv/VkxsucS8n+2NmaH7oL3+ACuej0psMO9+MuAL3UGknYgXywxnIM5DruHuU6S2mL
         20pJdqsyrf7Fzg08W9cb0YvGBm5y1Xmeug7ZK+Kz+a1P2LM2S7hrOsvnepP2NGm6Z/XB
         JdSA==
X-Forwarded-Encrypted: i=1; AL+hErHpR+0q1Ezn39RR+h4TsP5jQ0ug7wN+X1PcJStvdVh5pYdnepa6ArFDMktQjji+EKYFuuaMWnZgjMfz/3c5@vger.kernel.org
X-Gm-Message-State: APuU4Z833oBwQum+5fC5ew8cTvDG3idbI/lsYgBAizX9Tw0Odnt/AsdT
	AThphg2AA7DtXt927KYwa6PmG4QgIjAwjNm98ImYOBHZZo4Xj8Vt0gKl8eVOL8PRk0d/E5Qb8jt
	6VjCV16/bbGoQ6i01t+BwbJsDE+5iqTDQ6qqf8IqTKYy8OmhQIjNkjcCVlA+IBZ37MHDd
X-Gm-Gg: AZFdTZduPAWlh6L3iJ43gY89wDyddDegR1Q7O4CCnk6Ee/8lNsQlH5ZcihDOjEXLNB+
	WCReA4TPb78p/6DB1qLyANsWEDbzbrA7wMAvSgEGCvAx7laQIjOlhb6h6gwLhCCw/HfZKE6gQZU
	F7sNEU+TlzFH63EdsghEdeyZ5v6xgvMz2gJBJcNVOapVtOXX0E50ftnTOIZerncqtGdQd7EHpCI
	hHCnEKzm88BDrCvpeG/H8CRPfS/9RiTa66Yt2xo/auK5iGOn2zz3N4d4t4nEn+CrqOdH7kOGUvX
	Kbbsr7dq3vcxWmYxZc8lVihgfTLkMw7+4hBR3gnQiQX8t6yIjUy5G1KlB+lYuijaWQX4m0dqq5L
	BJIe2v4tU13of0TX6lspZ5ir2qfZVPqhd7Nm6GvCrlmbY3nlWq14g7Im2+8iyDUg6k5XOyUeEX9
	ghkQ==
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr12688277a91.14.1794905171042;
        Tue, 17 Nov 2026 00:46:11 -0800 (PST)
X-Received: by 2002:a17:90b:3b4c:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b1b0a1ff62mr12688235a91.14.1794905170522;
        Tue, 17 Nov 2026 00:46:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:10 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:22 +0530
Subject: [PATCH net-next v4 02/10] net: phy: dp83867: add regulator supply
 management
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
Message-Id: <20261117-shikra_ethernet-v4-2-c41902e5f2fa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2626;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=YMQ5tDefjahp4F278sVpJOmFjvs9217PzQ14SbOl828=;
 b=9DYxR2LtiyVkshLd2XOkW8YZL+bGdidE43jGBndpxcLF7Y2Yr0ul8pgYXZ21EzTlUrEcetxJD
 sfHhXFgqkVMDGoUQqCaDh5KFdnJser9ZSG4dFXK3H3x6st2IkhTedBJ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc1454 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: hdiY81WYrPFJiRDvCO0xCqXSurnrh5pJ
X-Proofpoint-ORIG-GUID: hdiY81WYrPFJiRDvCO0xCqXSurnrh5pJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX/RagYhpKEzj1
 At0elLy+SHidUJ0H/dBkZGtuo3347xoshCwNzMeRI80KUh9FMFM/WLtJp0eLH3uggU9JamFvrB+
 cA+lcUNvFLLeNxII5Wobu5FehP9jGbAg3EAy10mTwhLiUdxwobblM3B+s6u5rDGwgbvzgKGS8aI
 BP6Z7E4OvfDn/aTdniV2Z0q8XTQnc3qM2l7mGpO/OZn1vg6VY6yP9kT9i+I+jcXkc7pOLBD+Yzw
 p1GW9OndRPpsRIJxBLldFwX/uzyDYZqyn60BbgT+jElLUnXODBzgyKyvXfyUs/MOQcgbyYc5TPU
 FJANzp5yT+o8264L3V05AebO6Rv6SH+hSlayJyfQtkKCwf9fB6JIPrkpISUmg3OLi61xW9k/4d5
 fPTOiOWelvzixu+o7jVSH/6ot36d/vZK1K1FH1biiyeEWSVnPpYucEPadcAJeSjQP6G0T9Y9fue
 MhNXOu8EizTaX+JcpZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX1gnK7BHP5D0s
 oOFUqplMT2EvTpzyXgnmirfKxDGKoTMuLLYcuTdyLdsGDwFFs2Sk3xjawqL8TcZInizfVqeoRpU
 GJLlPQiZADOUvRT50rmFCNl+fJ4UypA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning. This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Acked-by: Andrew Davis <afd@ti.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: Sashiko suggested adding a check to skip dp83867_power_on if
CONFIG_REGULATOR was not enabled, to avoid unintentional delay due to
its code stub.
I have kept the Acked- and Reviewed-by tags since it's a small if check
requested by the AI review. I can drop them if required, please let me
know.
---
 drivers/net/phy/dp83867.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index b4b4931c6f8c..ed8b3089e8e0 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -16,6 +16,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -730,11 +731,45 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	bool supplies_enabled = false;
+	int i, ret;
+
+	if (!IS_ENABLED(CONFIG_REGULATOR))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (ret == -ENODEV)
+			continue;
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+		supplies_enabled = true;
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (supplies_enabled)
+		fsleep(200000);
+
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
 	int ret;
 
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
+
 	dp83867 = devm_kzalloc_obj(&phydev->mdio.dev, *dp83867);
 	if (!dp83867)
 		return -ENOMEM;

-- 
2.34.1

