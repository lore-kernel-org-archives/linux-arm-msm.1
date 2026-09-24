Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ED1480DD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251650; cv=none; b=qRVeSRxVXMYbG6FkcwBuQjkptOxoD4Tuo/Gr8/czO/NcfWp0ntJPFBUaqS/wNoD2vSATrEisfr8fCIJzBGycSd6yT+hKDdVMDGBGerUl67iHwwdhMAmUkw24sQxo4EZ42HCnRbxAux9lw/KEu1A9xcY23YMGqsDKbWPwoAeq/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251650; c=relaxed/simple;
	bh=oN1TEWUlkxXbOjoSBCVEilHRn5/gUdwPPWOMmwDlcl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sePmeTh51aMOPrbwmvpsNbQaiAEeMGf3v801pYAqjzpdsLnPdTXiiw3neN6j4P1rnIgl6e0r1Qusf3V+1WeO7J5LHxe3Zr893CCpIqJDfcK9Lf4OlMlQQ2UoGcUbzXlkqyNz7DLSiZLOjk56OmEQ4Jnmkb9KypU/Pb1cEgD/S14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q95vRvOC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj/AHjar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q95vRvOC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj/AHjar"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4euk2594252
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfOwQAIiaWlN1G+RcHnEmmVPXDYSSGIGeQG3AtWObVU=; b=Q95vRvOC4xxtHncx
	9+ikRBz3NOY4SFwrQrgLm6iMKv7peQz4e49n8IbbKtw+hB8jGh8IvQXqf/cpvUcr
	jaxtsEPmGudFJ9GFGb3ChhSXBGL/+/Bdo2N5n/yGLErLeWApk8K6Gib0S5j7VsmN
	6I8ZM6hASBSMIBQuJH1jiVpGixb5G+/NHWTYOt8mixj/bTKJR3avbSxC1LwBlbnK
	W5n//ToU5V8fvgJ+vNW6GuRfe2uyQs1mDji8aQHC6wn69iWViDi6kjkKS0e++bbR
	TAYMrmdeixp2DQaFVl4d4GAqwQmfTLcaOa6W8PfwMxeumWedsO63UxX47IB/Ao9p
	hYqBWA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjge70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785827e6073so553817137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251645; x=1790856445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfOwQAIiaWlN1G+RcHnEmmVPXDYSSGIGeQG3AtWObVU=;
        b=Qj/AHjar0anwV7qr1PggtFG1dTN6obX7lEzMgfvlTief2ifdHnCizwUcfrUHG8i/mt
         PHK9tRxPQpCUBAJojyzMh3ci6SQ8U8wpZqxMBluZGxqXIfurmCo2I90zkn/66BjBFabb
         4KSE32PfNkjX7xGsJfJa3bOtQvqyIc7z1hQJXRaU69MfDdvU9N84HqQbZWxt4VzEuQhd
         mrEF2CuykLy0lGveC7ggNOmGHaX6Rn24xQtKZkSdEGhAaKMOoKzsg2SLNaQT6Zf3jCqd
         a3B63a1YevUHRAjJmjF1y0Tbzn2W7JZobiqCvkhGvbzhJwSArnbv6VXEFLjHpnn1F9LQ
         t8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251645; x=1790856445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfOwQAIiaWlN1G+RcHnEmmVPXDYSSGIGeQG3AtWObVU=;
        b=y8dNWKVTxEUvhAS3uposbPq+X8uTfPouydU+xR9VMMjx7+cZbWifQRs/lMyAtNR+PT
         UuONegZsRG2plZlIYx13rBhziQALDap01Mi0/6z2B25CVwOukItdcZzBpfHZaLAgrGvA
         jaalvqQbZmY4LjXkH87g7Qn9yAgrdBXO2cxh8gBm+hdiS9TxZb0XMRXwbssaOYnDMV0/
         OXis22MG5R6pHEqOBsY/HE9sRmSkEAzd8F8wZzhI1ZEqNQLuzDhFnHshXzX+9wCC8Y71
         Y1IiuaAmS4pZ34GzfHMPSPCe4DS1hj4Tdgo3YBo2A18R9D5S83Cebe8UzmwtfJsOOsn7
         t9NQ==
X-Gm-Message-State: AFuF++lnRnL+CWf6CDQEQ6D7tXxTD0LqKD0CaWCxlCRQNrVy1d059oFU
	pHfklY7Al2d+mmEFj49r6v6UNV98n4R8FuYJjZqsiGn9yLzeZlhCKRZdJpsWsP3r11LdEVDrk0k
	dCoDQlpahu8DevK40l2E/tVfkYv4m72uT79IeCYKjMTQm/wTlHRqTCgmHQeD2SfHVjJFd
X-Gm-Gg: AYBFou2MDceRkW/O26KOb2kWqlm07t5aqHz82L4TrzAxtKVlbQTfeR2aVcrsatImWHF
	7OFIt0uLBdAQxwEIaRxOtAedGV2PICzxx7AnmXYVWKxRPeO3jB8NDFQzPg8KBACxTyZ6Tq6OPKT
	1dkHEDwbK4Fyi03LT2FupMUOMDU4S2N1ylVVfzlwmbRPFA9yKWVn2rS8RWbOlc8nvDVOq4gKoVe
	mGolYWmKtH90fQ94FbhBZp3kI3bvXmfgT2RYDtdkVZxAARC11Fld2UKS0GYCbX0oHezsrBDtPhs
	eMnhmDe0okFCbHeeIYvHV9Wjy2iWNFCt+/d0F5Je1CSHh7FZ/CIEYrEYVHiJEdK0P/utqfU/jEz
	/zW2hOYtm
X-Received: by 2002:a05:6102:6d5:b0:7a7:195a:1b23 with SMTP id ada2fe7eead31-7af1f0ffd2emr976958137.29.1790251644956;
        Thu, 24 Sep 2026 05:07:24 -0700 (PDT)
X-Received: by 2002:a05:6102:6d5:b0:7a7:195a:1b23 with SMTP id ada2fe7eead31-7af1f0ffd2emr976945137.29.1790251644339;
        Thu, 24 Sep 2026 05:07:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:17 +0300
Subject: [PATCH v2 05/48] clk: qcom: dispcc-sc7280: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-5-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oN1TEWUlkxXbOjoSBCVEilHRn5/gUdwPPWOMmwDlcl0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJGhL+xS/pRxBYZZHc0SVqIwdlQYuym6C6D5
 YAo3yyLyqyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSRgAKCRAbX0TJAJUV
 Vv7ZD/wOpN64SgwPm/cFM5R19DAMIfTAUSCLjQULHdtjH/pdCVAtutpFxRd5AbXIbnk0TMCxRtE
 Wm78a5Je1SJY+2mn5+REMpeK/si66vSHYtDBrN3xtFmiPmFU6BehEAspFVQtyhBAmrc2Stw60d1
 agn5SNiBM3vAgQ49YovQJ7eBcdaf5SLZPkda9iU0vnefKlVhnvHJ4GivZnTFGHjTCEj/XyvncCd
 BSq4YPnaqKGemA+681gXMsm6TvLOL0aRFSH/WZgzpsVg2tpz+JLNxCiIqCDbLIBUIIORCDZgS1n
 vpDMmcysn8eDCqTJBrCHF+B17NPV91LvmFtl6CILXE8RrV8YPKHA+ay9wdaAYlF66e/yoi6mgxf
 feqjPB6R4RBerllW7Pae7Q/s71Hv/VzXWB/vHs556mdzk8kSRxMxMafftCWMVQqyMRe21H8kNwt
 +o3m/3rrSMlmySJ36C60Gg/um8w44tg3xB3vpvj1l+WSZV1frp6BQ5RbmMQ7CLPWGzKIrTodXmC
 yMdJjNDBwmjYRCFsKUfy38sBjoxGi4PYVIzquIITBWK3i55F/4hCBdxax4/XM8RgJzFjENJ9mt3
 +5+gObi9uoNDLZMt6hTA2IqVA9XfeHolDPG5MPR78h+1awEPyWa7whhdbps9c4TRjsTE0vt8eV7
 +Y6jRQrwX9iHEtw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: dU3I4el3Zwf8AT0qNRNkvme9ojLkB6us
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXzAp9Xp0POKjp
 c2ByIAmx3kSh5DcWaL7tfVQGXoJCHwICW9Aq3FgCzg4wioLMdaM6/Gj1aomcAOBCQUb2GFDCpAq
 mGuvRh7YlMTKM/l8WRdifXuyhBCqxbANvBRuJZpIb9aKCFdbHqmoVYzAqrIAbS6tQsBiPmzXmpC
 BBXxuU9UoY6HacXNtwd5qbdcele96pDnhGtN5Azgz0QUPd58ThBGhgztSyC6p1xuoyfahWsFwwY
 ZyixSHbu73nK2qTT6mdqt4y7aB/EkqBY032JEim6BbFzkb0S1eRMeGHUWN3l37+qtcJrbF9avea
 rN3TcCeh0/FcwyWj67XFIbGVx8NyZ++mvBO1NdYTVo5TBarWKBeQZ2iXYYlylNRqJMRsPBLiOUW
 Vt8W6Oz+qmvBw5VG1Dj4h/cg2umCXjLPpGFb870itYVW/ZF5G1k48lkGJU+zCMJoybFPnDRHhRH
 s/df7WzD5jYZIdh+MIQ==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab5127d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_TElPO2WjJGltpybzhUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: dU3I4el3Zwf8AT0qNRNkvme9ojLkB6us
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXz5H79EnZnBmH
 Qrse3g7EeefH1oH1br/JQAyU4M378sn2VcjseylgfOEKbt745Ra316rcKydp89CgW5Vloja7L6d
 3ZS6RQXNvp7vMA776wNMGToiPxLd9qI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sc7280.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index d11265debaf9..24a65cbb1ecf 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -860,7 +860,17 @@ static const struct regmap_config disp_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sc7280_critical_cbcrs[] = {
+	0x5008, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sc7280_driver_data = {
+	.clk_cbcrs = disp_cc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sc7280_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sc7280_desc = {
+	.driver_data = &disp_cc_sc7280_driver_data,
 	.config = &disp_cc_sc7280_regmap_config,
 	.clks = disp_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sc7280_clocks),
@@ -886,9 +896,6 @@ static int disp_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x5008); /* DISP_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sc7280_desc, regmap);
 }
 

-- 
2.54.0

