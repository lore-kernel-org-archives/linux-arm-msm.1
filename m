Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742070;
	b=oEgtE/pUT30JfrJ/FPHECDtxtOLU51Lxhs8nmaXrL8vXT0L9ywl72noxrk54kK0FXg5t
	 AHeVi6xAyGIZ2SjU/MUMDxRv7TQ+hV8SR33uzgCB4eXImYjun8pv0di3KyJrysfyPr2K3
	 CCCLDPRiFhTCH5lZhcYJbKvzP8IOO453ZnfayOpkz4TQL2TIs9yKFJrDpFAQXL97p6IuI
	 ZZNbkTPZQeYsDNDt74bDNWUv3qj9pPCIq5LBT3uB/68OoY0K19n9jUykgNR2FM1FQtazA
	 Uda2wDjsK1hzD0H9HaZdqKNDmauBVMt1vaAhh3GoLseLyvFSbr2uxUHNrJvwMo7TkXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
	b=efgcHG0D2akochujegn2vTxjGqGzdtRfGEqsCy2QYiMyRaTeZTSCWId6kIoxrZONbDTG
	 mVAGpUsu1wJAYXiVSVpkvbLgqBZwEeJj6PVoKXxib6mPgBbpQMD6mbnGmJ+OIN26ePq2d
	 JwfXS/nnlBC1rhH8dbylVpPVPJsMkDxBoNcMKazH6l4f2Bjxqb9EmKd2IukyDKCQThY+P
	 q1z8Gayi2rAhLEvaKSNHWidpH6I41dI9dH2LtV7g0E03jpL6ps2R4Ze8hhp/JhaWSOGuu
	 fFoa+vfLTc1SWZo9aTkVa4P7FlX0ObfazQWYlS5rTXPl9grE9FpUQfr6obGjPYroVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WCGvaw9B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6KVELgu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E2606A331
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 21:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 539E2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WCGvaw9B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6KVELgu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKbbB3993568
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 21:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=poSSODbWEox
	TyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=; b=WCGvaw9BNgg+n8BWam4+pgrlVpT
	Q3WPDyP3w+uLyxXN3t0QKyVAFgkVixJ9TYP6BD1FhVOtJqG5J37MkRHB/QQf4ih1
	qZJCJnyGUIkz+OnyNv1Hpy/g4bHKxylkfGCmd3G0UCIoC7dnHf4H5cY1v8LoFinx
	E6ADBCbX9egBYrS1EUAMlk3oxLEianPOt3I8F5awkco5UUEvncXSjujyzyVSXmqq
	/NG+Q3kyOAESg+TcW2Og6lbAt5RV0KlHmO0A3D6QopdkmQSAaU7QusvdCzaR+2Qt
	px9/8hoh+obNyigvI6bYsPjcy4PkfDvDcgYP8QduLAEgVBS5snZAuW5/heQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ngk5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:41:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso55745c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742069; x=1794346869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
        b=T6KVELguYNSYMtaxHGd1aPkuQdpocmnf0MT8p5JDFXoAXTB3UDC4e/HTJWhwM45mbo
         7PhcM6TBQ1oNZbtmip6iCfhYuqv9+VHMS4dYGtHtQYemr/CXKQtIqA1revjqL3TcZXEf
         UJL3F+PQ61MPZRipiE88ZInhV8deT4lsjKsvdF4yqCar0ZvV20F3rT/Px4KXeqlR2K3v
         0XvCBtBHP0u7Sg5j5y5fPK3uH9RqOqmTNMkGU2iOQlyMXz7EVXQFzIfnv8vc0UKMEZxz
         7mpraHzUCWEC+bg+xcxEiUKVhfR7bCakWu9bKgc1XJSj9qMcgGZoUj48UvHjIjXTHy1G
         8Q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742069; x=1794346869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=poSSODbWEoxTyPL5Lk4+LMqs3YK0EF3Oc0Nf3TL++Y8=;
        b=RDiaoxbNu78/+Ay99qV5lPEEYYaO8sv2m5XiTR/WAnFK/jM1Jn51JU1Ny8FvcC26Yv
         Np07wOvWzV3sNTSPcPJPXJVQWfxNdjlwKskMN0VRq+7ZBTq1jPTiCRT4Z5XA7RtCJUpk
         1HCIKzpnQEjffp0fuRWGufeT1RGvWHoVOqYrf+dzdJJiugkln9s7ix58LhEPZbplhFEl
         3DNAE1ym3hVlqfjNUJtuLjBz4YSR1B9FNlbW/dx9KTMsT8EaLUsA7LukjzlbEGOY7YRS
         dgS+dgPhKXBINXNPvaVmoDm94J0x0BMzFdXKByGUNWUDwpygszqA3dXIu8omsnun+F48
         jUFg==
X-Forwarded-Encrypted: i=1; AKwUvBwtBEBMZ8npwR2Y/uE24XmcrNTCAdk88U8zQg1LbWCHfikLmefTRn9rneBxGdP1/LgOG0FHOpTIUeiPZtf9@vger.kernel.org
X-Gm-Message-State: APuU4Z85bywhEPKUkN7dcMeHApFl/MuVyDT30gBFiX57qf0M6hvLuCRJ
	N6vbRVgFgU0sFhBmhwqJBGP5ZqMCOsYIkDTAfj6wis901AB8krffjmf3L5h8Hulg6BFUXOsNmqz
	N8P/rO4YKw1scAu+rIEaIg2CpeS8BYcgVZ8G/1jnWQKoT2GjnpgbO/Ud2SzvyWj5UbSBl
X-Gm-Gg: AYBFou3wdFPlUCqPPVBCRRizRkA/I3m1Kw4XVdaQkYyDKyn4Hi2ltE4OggWv0L6XfZh
	uGoqghO/HSyKPXcdOdfJPDZVvUb16/p48zDYc8wclvuKq4gCc2Odi0LM/iRwBlYmmxE9r+/JRJD
	dxv00J+gdMLT36oudNIBEjuOcxQPwGpCv96NBn2EObKFmxlBndr2Ha54WIc1IRQPoMM+tx4Vpll
	8Od+dGIMdEWHxoOhnaU3ihvdmXGhb3q2pfTMM/3Ky4AfYtxDcgcTZmDJVryPnHiYHXn57lRRrxw
	6zSn+KIQDYqJbzz7NLFeloO4fAOkq+TviaIlIUswoT63hBNfGsYv9N5DqMTybA7x1DKblmclwa2
	93Eb4Kb69U7BXzbSk+Z/+4eMsMOo8BS/w3wqWXe2PiBcCbiphn64JlMf5YtIeBQVRf0tRzwRydy
	JBwykjbi0j8HgtBZfm0gsySMLxCNg=
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr22118944c88.0.1793742069118;
        Tue, 03 Nov 2026 13:41:09 -0800 (PST)
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr22118916c88.0.1793742068608;
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] phy: qcom-mipi-csi2: Make timer and OPP clock names configurable
Date: Tue,  3 Nov 2026 13:41:02 -0800
Message-Id: <20261103214105.3605181-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX/847219/IbhP
 1NJMiFw7bCShfj0URVnzx+L5SlqZ55coVWjyHX+QjJEVSOorXRkTYzOMMqDFq4OydZ3xj60V1M0
 o4VGZYcM018+JbFmwg+W68fSaeIIJ8iOo0Nc0fn4RyBwYUjsOS2t6SBUPDQ7ASFLBDQTjba34QQ
 N//awOt42WTbDz3Xv4TlYCVRLRYfE7jB2eH2qbW+EnSSiC36nLxSgfo5j82APAIpjdmsv1/Liuw
 d8A8dMDky2Zg62KDVujgRiljTos8z1J3jP7Skk3/k6+3HwtXGOaBInnQD8ZaaN0itbtuv2SzF+k
 xpb7yraM0CMQYhDHKLoKnw60ZSG004PXOrygh1wYWmKaNqcFdw8hkrl4uLHbe9+qAEUGX3zLdFL
 ZLU8UKwtedPo3nKd5/wOTZT2CB1452/7fFL8L2lV8KCeFPoOFWq7uLjwwLq4eAEvWqwVORvM5/y
 mB6iIZ7wM9ypK+6V2CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfXwb8kw8mdjCcK
 LTlIA/aR2KESmkwaWo+BxatZo/dx7dTr9+qTMf/hM7Uhr+mrbpnMoDOGa42m9kYaZHfPLRHR4u8
 Wbd6uwW2C0UraAb6TdlVc+jJsxJlfVA=
X-Proofpoint-GUID: oh7PGPyoSgJOYCmKs-HpM8Up1QaStLit
X-Proofpoint-ORIG-GUID: oh7PGPyoSgJOYCmKs-HpM8Up1QaStLit
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea54f5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YDrJLkQi9lszU93BSgcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

The timer-clock lookup in phy_qcom_mipi_csi2_probe() and the OPP
clkname passed to devm_pm_opp_set_clkname() were both hardcoded
string literals sized to x1e80100 ("timer"/"core"). Add
timer_clk_name/opp_clk_name to struct mipi_csi2phy_soc_cfg so each
SoC can declare its own clock-name strings instead.

x1e80100's soc_cfg now declares "timer"/"core" explicitly; no
behaviour change.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 2 ++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 4 ++--
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8f1939e81e13 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -380,6 +380,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
 	.clk_names = (const char **)x1e_clks,
 	.num_clk = ARRAY_SIZE(x1e_clks),
+	.timer_clk_name = "timer",
+	.opp_clk_name = "core",
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 269232499fca..3de25728ed28 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -397,7 +397,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		if (!csi2phy->clks[i].id)
 			return dev_err_probe(dev, -EINVAL, "Missing clock-names\n");
 
-		if (!strcmp(csi2phy->clks[i].id, "timer")) {
+		if (!strcmp(csi2phy->clks[i].id, csi2phy->soc_cfg->timer_clk_name)) {
 			csi2phy->timer_clk = csi2phy->clks[i].clk;
 			break;
 		}
@@ -405,7 +405,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
+	ret = devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk_name);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
 
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..359b58660db8 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -68,6 +68,9 @@ struct mipi_csi2phy_soc_cfg {
 	const char ** const clk_names;
 	const unsigned int num_clk;
 
+	const char * const timer_clk_name;
+	const char * const opp_clk_name;
+
 	const struct mipi_csi2_genpd *genpds;
 	const unsigned int num_genpds;
 };
-- 
2.34.1

