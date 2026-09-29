Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C835208A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684767; cv=none; b=BAIKKRSTTMkELRMRxIEVmSJ6+Dyunek8D1wu8nKlsYKjPOh5i1+kBWZ7j3pvStPZIfP/1fNEmqPz4uj2ioT24RQXkNfvG9YyDVbem8pODeI7+L8iarFB+CAAnbi9yEXubfMEHZDuWTrPF4JZCB/kdGjqAZsOaRxfsvTeYTUbyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684767; c=relaxed/simple;
	bh=2oEzqOyUVvQjr4+COAsEjYVSey8fSer0kgX5bksfq8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXxDO8EIKBc6FFYqt40rsdMF74fGyCbysgs9mnyrIoNA4mhWnnNM+/6cv+bfSLB0mdCv98+GXWVvi+z4uRRmpkluMbbTtUjUFgdDzrWltVy0k84ok4P3GnZVRFHm8qj+CItRKuB9JKptWfxEmVojKKH0oD7TusNxp5+D2WhoCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuSPUBSS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDhOFSHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuSPUBSS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDhOFSHb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCE60b931791
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4j+F45Cn1BxjIQtPZDySZ1PJnC6gLuIZoJb7CNz342M=; b=SuSPUBSSdzsl86G6
	lJwciqtcWSTaobuctTBQyR9sssTYHjApRsz63q4qWab1Y/9Y9tgueT988PVBLziI
	74XFk29fadVcl3S9nsK1b6zIS4w79Wuzlhsz5Rhp3SSHrAdJO90h2KN/zoVLoeib
	v/VYqpt2JAAEo0YVbOmkr7BmzYt5D4TfkBfev9Hzdm9SOZEHKiIO4n+XJNVrLWob
	KK8bGnvLC36NeNiZmrNHGE749s+1hsTDGYo5YsCc5zxXqWGtkxKh8+HbvEYpZwp7
	/1ALLn1RLBqbDUegoUov0tslsyr301RzkCcwJ21VlIOQwW0lo4A/7LpLjh8TbjFP
	ri998A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxhx21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:26:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179524bf03so429416d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790684763; x=1791289563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4j+F45Cn1BxjIQtPZDySZ1PJnC6gLuIZoJb7CNz342M=;
        b=BDhOFSHbKBpvS4b1Ev/fSnbx7mOYMy0Mc4NlWM1WN8++HDAFAWP3nOcgY8d0P7PiMJ
         AJxyAPlvkVDWzuMNm6Hh2aT8y0oCnXpd4UHUt+ap3vwOV80Eo28d3Mp682Tk+z3ndPes
         QleQP7cvDDUEC1nxWlnGSHmGbxA31JsnV6s0U4p3KM+D0vzksBspYb/k3FhS5apVTuXB
         GIybNRhqai88IuZlwcRcHpAlHFcUwcBOxcFZ3aqMvmKNAoYcwim7o3q1G7CKhWWhtZhY
         Uq5znKWVFoQ5wN1El54dNENLxqAuJwBVHK5L/wXEKXVF3I+MC9CG/ybAvQg7QD0UynUx
         HULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684763; x=1791289563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4j+F45Cn1BxjIQtPZDySZ1PJnC6gLuIZoJb7CNz342M=;
        b=vzfq+ltGUFxsAYRnm0sqB9GY3cPNgjCtLlew+WWX8ecyzM7T5CNm8CrnmtghbPKD89
         GJJcLBQZyqxkFcBblYhVVVdr4or3898BsA+ADXIHULDrg/bj/cbx+t5SdbjEUsrs6JNo
         5qPNUKdJA4w4X2Ra354mUBSYBrcZ72nHMamqch+OMI/9L+73dlMPOJx2beQpu72Fb7MR
         tkUF6RCOLqndX8vhO3EFfG2ZIHJ8e9AmTZRsL9Q8cdRnnvj8rcbETaEw5tZkwWL8I/TO
         7qgxykKKc56sZp8sWnR0fOdC8nIqtWtSDEY4XL+7rnz/UkfQuq8JHV1fbGo3j5M71/fR
         qWiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFpt1bYxubfG4zWG8Nj/oAr+eBeHhLORJpG1mkMhMT5ds5N8yLNQOAqqnvdSrvrs+DmY5d7BsnreUd9BvH@vger.kernel.org
X-Gm-Message-State: AFq9FYLtUkHx2u3qu9jD7cy+OtyWfhnHMkiV8hxv81rb2ZdLMbsXxkWw
	ksz3HldF2WhNyExhzXVubytppmYgE9heAAxxpyOaaR/UMODOIJ40s7/0vFWFu+DXY8u6p+f8snk
	XgaXOPh1rIrdZ4kHeHNqTLiJo47eMjxA8SH9T4A4qLnMs6u32XOFgWKQuc8xOSCrwgLDc
X-Gm-Gg: AYBFou3XozMke5udhJvH9nXTcO3bPgkMMGfpzBi/poQE+0d/xxoLrPf3+TqTWwMP2Vi
	ubTpFGeiaiYm8l/qt1vW0nsrhAvsdUj/kBDJ/159ByG+bdrPno1dagorPf3gCa3bnshfU9dpgFp
	VZWZvL9bNouZDinVS+gbv3FC1VvKNVxsJx5R6NgUhd15Rht2aOkNnGx89afpvwW8P5b0CWTQbV8
	R0N0eXrBihT39cwzyaWvh/IW1Ns24w4UQULZs45vCFgRW6iqAFiiqupMFHDUXyvINK6f5Fnqt5w
	pMqnypDrqYzynC/kt+5UB/9Lw/BC2jjIZZJZvDWWR3EnPKaC2I+9KsxlyjEsOEu0XUxI7T8mIDS
	8X6yyGDvHpbY737SPU6eGGanWI/kL5EiIC42yflxHTeDOlyDQTLLhxSvne5Gsu2XZ6fzaRaFq4w
	m0hh3hAA8Ba4wnGmf/eKckPT/kb+GtwRcsN8Us7HyujhzFrm3TRLk=
X-Received: by 2002:a0c:e093:0:b0:915:eacb:cb94 with SMTP id 6a1803df08f44-915eacbcfa8mr100824406d6.6.1790684762746;
        Tue, 29 Sep 2026 05:26:02 -0700 (PDT)
X-Received: by 2002:a0c:e093:0:b0:915:eacb:cb94 with SMTP id 6a1803df08f44-915eacbcfa8mr100823696d6.6.1790684761954;
        Tue, 29 Sep 2026 05:26:01 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d302482sm9103956d6.12.2026.09.29.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:26:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:25:49 +0200
Subject: [PATCH v6 5/5] i2c: qcom-cci: Enforce the required CCI clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cci-clk-fix-v6-5-62a268cccb0f@oss.qualcomm.com>
References: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
In-Reply-To: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX5kZvuwwAaBuU
 658jQ5a6SCzUM4relhRh1ZEWKRuO+uWt4q983kZI0THRla+tqYr/Flw3VLD5PC08fWHgJyVzqqA
 sYU5jUWXdqjwUxAzFmJh3LswbYuC0FM=
X-Proofpoint-GUID: V0jpMFqHKwVUUraSz7T8HoyqlwGHStjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX24wAYUYHiXKF
 55+euBQu0tQshd9dUCatoNLSEYfVXLN9eMxsvnBTu3aSdm2zHZ+GyI5DdOccNhU+J5YYSTrxcoV
 zgieHxxsaIbx8a1F31IW9+xiaq9sY/hWL3qhA3d3ZDiZy0XKRl31G1IahAPS5wzjONQ/3sy+V5K
 25ImAvwPN3yAWJbU4mkf3g6VRQVE4ZTpRAdecl0o57a+CRWamABZNJ0sKLhmenNuKuebd4WClSa
 3hRY8GmyBFS7UGuSpBzXuIKlEzRvosopuedgfKli0v6poYGm1n62lZ7Gt3y/r7cPu9wK6LJTBtA
 07GCNQVmh/Bq+gTdYQJ/3eoTrjBrRvacZ/VUBVrHBRTr7TzaEFbL/N/qL2bBashYcCTUWhykIic
 8kHjnEj7rW/OLaL4onWWzpyFhNs3uUArtOnxRFuKazbaPHVmO8VawD/Zb7VOul036siUmLAoquR
 kSiZ7Qu3NFMX2H42rqA==
X-Proofpoint-ORIG-GUID: V0jpMFqHKwVUUraSz7T8HoyqlwGHStjk
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbae5b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=raeIKTHvMkgTF1qzT8sA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

The CCI hw_params timing values are only valid at the specific clock
rate they were calibrated for. A previous change made the driver select
the timing set matching the currently running clock rate, but the rate
itself was still left to the DT (assigned-clock-rates) or the bootloader,
which is fragile: if no rate is enforced the timings may not match and
violate the I2C specification.

Actively drive the CCI clock to the rate required by the configured
modes. The single CCI clock is shared by all masters, which may run in
different modes, so cci_get_required_rate() picks the lowest rate that
has a valid timing set for every active master's mode. This avoids
clocking the bus faster than necessary while still satisfying every
master (e.g. a Fast+ master forces 37.5 MHz).

Apply the rate through the OPP framework so that boards describing an
opp table also get the required power-domain/regulator votes for that rate.
Boards without an OPP table simply fall back to plain clk_set_rate()
behavior, so existing DTs keep working.

Drop the now-redundant hw_params[].thigh check in cci_get_hw_params(),
cci_get_required_rate() already rejects rates lacking a valid timing
set for an active master's mode.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/Kconfig        |  1 +
 drivers/i2c/busses/i2c-qcom-cci.c | 76 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d7b89508311ffc6cbe1ccd302a6e84dfa83bf6fe..14eb7e802bc86a06b7ec0688580886880026cb0e 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1050,6 +1050,7 @@ config I2C_PXA_SLAVE
 config I2C_QCOM_CCI
 	tristate "Qualcomm Camera Control Interface"
 	depends on ARCH_QCOM || COMPILE_TEST
+	select PM_OPP
 	help
 	  If you say yes to this option, support will be included for the
 	  built-in camera control interface on the Qualcomm SoCs.
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 21695c744502f7fb5d333f1272f3771e4d9d5508..526a699eee147996b2756b47c0e6982678990be0 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_opp.h>
 
 #define CCI_HW_VERSION				0x0
 #define CCI_RESET_CMD				0x004
@@ -318,7 +319,7 @@ static const struct hw_params *cci_get_hw_params(struct cci *cci, int mode)
 	unsigned long rate = clk_get_rate(cci->cci_clk);
 	int ri = cci_clk_rate_idx(rate);
 
-	if (ri >= 0 && mode <= cci->data->max_mode && cci_hw_params[ri][mode].thigh)
+	if (ri >= 0 && mode <= cci->data->max_mode)
 		return &cci_hw_params[ri][mode];
 
 	return NULL;
@@ -575,6 +576,66 @@ static void cci_disable_clocks(struct cci *cci)
 	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
 }
 
+/*
+ * The single CCI clock is shared by all masters, which may run in different
+ * modes. Pick the lowest rate that has a valid timing set for every active
+ * master's mode.
+ */
+static int cci_get_required_rate(struct cci *cci, unsigned long *rate)
+{
+	for (int ri = 0; ri < NUM_CCI_CLK_RATES; ri++) {
+		bool supported = true;
+
+		for (int i = 0; i < cci->data->num_masters; i++) {
+			int mode = cci->master[i].mode;
+
+			if (!cci->master[i].cci)
+				continue;
+
+			if (mode > cci->data->max_mode ||
+			    !cci_hw_params[ri][mode].thigh) {
+				supported = false;
+				break;
+			}
+		}
+
+		if (supported) {
+			*rate = cci_clk_rates[ri];
+			return 0;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int cci_set_core_rate(struct cci *cci)
+{
+	struct device *dev = cci->dev;
+	unsigned long rate;
+	int ret;
+
+	ret = cci_get_required_rate(cci, &rate);
+	if (ret) {
+		dev_err(dev, "no CCI clock rate satisfies all masters\n");
+		return ret;
+	}
+
+	ret = dev_pm_opp_set_rate(dev, rate);
+	if (ret) {
+		dev_err(dev, "CCI clock could not be set to %lu Hz\n", rate);
+		return ret;
+	}
+
+	/*
+	 * Sanity: The hw_params timings are only valid at the exact
+	 * expected rate, verify what landed on the hardware.
+	 */
+	if (clk_get_rate(cci->cci_clk) != rate)
+		dev_warn(dev, "CCI clock is not at expected %lu Hz\n", rate);
+
+	return 0;
+}
+
 static int __maybe_unused cci_suspend_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
@@ -678,6 +739,19 @@ static int cci_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
 				     "failed to get CCI clock\n");
 
+	ret = devm_pm_opp_set_clkname(dev, "cci");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set CCI OPP clk\n");
+
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to add OPP table\n");
+
+	ret = cci_set_core_rate(cci);
+	if (ret)
+		return ret;
+
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;

-- 
2.34.1

