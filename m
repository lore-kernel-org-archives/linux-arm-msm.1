Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762583CAA3F
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 20:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615066; cv=none; b=HNDjHMD8g7m8MdJR8RRdaiucEMQKU9MmTDq1XSRaEU9NvCcvv8eGV/uVEayAWh+xgx4Sk1wwYjwcFORPgU+k7rdq+Z9zZBgdnMYLXHD3+KfQ+TpJF2Ldm5h1HV9ARv0+VuKx21trzDlXvhxG3L9q54w6/Cd3WTXJBubhUCFhW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615066; c=relaxed/simple;
	bh=74m7wkLHW21LfcOgB4KjSGixQGbfkbQUoRTyNxWozRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5CC6brkU3x/LpwB84MYwNcjq8nxFeBKAl7a5g9QZJ2pZTTrIjvqL/AQseriv7Qbyvdd8qm50dzbxW5Zh7NgRV4glxN+gr36R+KyfQTr9/E/RfvETBIcIcJLuZA2lb4QicPdy8uq2/kHHDljeTSI9CeYVkKLCHndV+j1sHmjkUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guKxe5yN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isRiFVYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guKxe5yN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isRiFVYj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0FlN3910531
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 20:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqxf4qZpAOcD3l4fL9Yp8vqCfTxgDyeKBJZ2NbWHMZQ=; b=guKxe5yNSg78h21Z
	Apf1xGIPjiUUGDF370BCQNezt6yr79OW/JoqwfJQ2YZx9BzX49Vb+Inho0VsyDbu
	ia4e08J9KAfPFI26aeyXT4u7cGHF1HPwsNcfGu+28aMjqIA+NEF+T3FV6gQ0FDY+
	Fv8v7fHHV4OKcDp2kl/Vt8+0wysORA4/h+BNrHC3mI5pltVyl0CSXtFkh38nHaUF
	WezV7kAC51/GW6bxH0BlJY/WBV/ruaMF+oeLkCO2qtom8y4xu6UXxZny4lln3JGY
	R4jq0sdl278gXjGtopdJdiDYkYM2QqEpDXE1X6NcbRP7+opz7hQBAyf0QySmtOj0
	tcr1Rg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9119jth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 20:11:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso21114411cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 13:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785615064; x=1786219864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqxf4qZpAOcD3l4fL9Yp8vqCfTxgDyeKBJZ2NbWHMZQ=;
        b=isRiFVYjYiNDrPV65txnSxnR1NPtq4f/N+sNahs2YWglZJGGftdfd1jaYHxX2EhWOP
         xz3xWF7+W/9yZu9qDOm03Y4q6n8CFMLQNKO9fanZ5tKUNS9w+2EanKLktSYAi9XlGrfx
         sfG0BC6+eb97/TOX8aqvfmnPiLscKZQVJ19GAhY7osSN/cXBKKFgU+YbH5v/uKsU6D5c
         qQxymSMdzXs6DrqnkiU2eVuweGwoFwRKM1iSuTxlmExb44P7EMMOvkuM7sKunh3u20fl
         8DcVMTRqTxYKzfmdrnhUxfIiVLdcTnA97nS+0JmsQ30rbcQsUi9NPMd+yuQpfh9xwyXa
         N6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785615064; x=1786219864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqxf4qZpAOcD3l4fL9Yp8vqCfTxgDyeKBJZ2NbWHMZQ=;
        b=Tndv6ZCcPeAAF3D1RkDtz1CLn4MsRRVQwT1FgXXjNlhJA5a4lPDRF/0Yh4HrtJnXGG
         5HNgVdAPDIWckOHIMfrEWs77/+8Ix/KIqYFGJBUOfcScjrj+w0tKDeXPwxEl9wNeJdQY
         YKFQoeeSVCAbKAC5L0hk+RpW9zgjW96KLLxpjusIg3vYvamWnbNKI7OJD772Tt1x5enD
         Cr8sLpsrdV9NYmqRTlA7hrtuZWIZHdJULFmubPYIasnDK6qPWnM8PXLlKdk89+JsmPzq
         j6sGyHg1ZKT+rlcURKZwy44y5p6GpHTEymWK8JL1Gibypxlrfm13mPiEEiY6NuvfksYH
         RyEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rql6N1irjzviIpiVTvyWYZrp+W0hf/S3cuo+IC4vfhTMz4AP7mzp0achignl6TWBmoSjFTTyYfnI8okmJe0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp0j/YxgzvjgPPVUc6DDgb2EnGUBIXMNAG6qPxT37agNpPZUAd
	g9aUo7YSvC2Pdf3M8KIDiddFgW8BbGRXApp3RZCky2OTvSE9JniK+u77eqM7+cf4xEhrabgs1Ry
	UOMaL0HlN3BS++0ihB4Hmr+s/0C8+C/iPfEEABaBSy6c2GomlXotigM7HolfUWhLoFhkE
X-Gm-Gg: AR+sD12qPQfdiPgBhmd6/pTFX8mOmLsNHdBRCD/Fl+A8aEKEPGF5oj2GJvepmusnjvm
	bFfx3MrS4Ue9IDe2V3QCiaJB44J39G1C1KrLxhAF5YOsQ+KW0BUFzMIvDOz7XYPiNp6SOVM2654
	UypCXqRrG4zXe9mol4JidizD2xMEkUevTmj6SYlbyDRFQ0h94G92/XV7r9lxmGkHjFJuWR7Nq/5
	nKP53BDJEHgh2d7eixgV7v6ZvCc9dqLwNXAL0R/BTiMHMr48tqSXPkbaE2I46uyTJLLBTX+mURj
	7Z3etmqgVS3Op4XC31ro23gGG972NuO8OyiWZLoJUQ2MPvifFIkfmLIv/EYTTZGB5PPmkxz/wl+
	0lgnVH8ngNHLREPZIw8uE3AQn7vT96cm6E6QUNTEwE1nxvs6kZvn7p2iJZ71UGZjj+hmfQLoJam
	Hptdc5h0ByTbQV9WDJdftekDuFZnuiBNxtVG9n1wyvvzMM1hzKdV2e
X-Received: by 2002:a05:622a:98c:b0:528:15e:d1d5 with SMTP id d75a77b69052e-52b566f6f59mr98941441cf.2.1785615063610;
        Sat, 01 Aug 2026 13:11:03 -0700 (PDT)
X-Received: by 2002:a05:622a:98c:b0:528:15e:d1d5 with SMTP id d75a77b69052e-52b566f6f59mr98940731cf.2.1785615063147;
        Sat, 01 Aug 2026 13:11:03 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537755sm358499066b.54.2026.08.01.13.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:11:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 22:10:47 +0200
Subject: [PATCH v4 5/5] i2c: qcom-cci: Enforce the required CCI clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-cci-clk-fix-v4-5-e1d80da54e01@oss.qualcomm.com>
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
In-Reply-To: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MiBTYWx0ZWRfX0BADZZkYjI/P
 5cn72eFZwjahjsTS7YquS79MnJ+LQbC+aeq3INlRBt2sWNu+hBYHMkCN0Hzu5a5LyxbV3TmJHpH
 Yp4UOqfpiV+5bRZpBEHvzTo1P9lGtFc=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e52d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vhKaAwP2Rx2hMH-_sOQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Byz5A8q9sjfJ7RpdWcs9zdtqjc1md0fv
X-Proofpoint-ORIG-GUID: Byz5A8q9sjfJ7RpdWcs9zdtqjc1md0fv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MiBTYWx0ZWRfXxcbebMeaa6I3
 sR0yCOslkELjZXT63qcKXaGITnizrCoHN99gQRjk8u+98Acq9zZ16AQql7TiCxW2ZWhBL68gYo0
 lHC6RaU4Y4OeAHsv3rzxInWJgCia64eoFwiWLoRw/VrTmXsDJNs/9/ZiGnK8lNw3/bWPfpDygXR
 CohGIjmzDHZoLVAb5bFMitkCjFc9tVZkwF1Jpa4yd3t2PcA8jG2uUXvmz8oKEKphPhgPkfLCeD6
 AsVkIqAMnrcJrljyEVahto6BX4uhg7eT+aVF3tC8cz7u/YxFDyyzIH09ZD9Lka2FWz3yfO6XizG
 Ibq4pZ9qByZNsBdPDUmKcEbfr6z5eKgwdbEkSzp/8Qf2FaMJJhzjN3PPpry5G7Rit3mHxFMq1sy
 uTdVfraXNIfa2nNq8NhSlLtLdI4/r612R6EftCWeGzyV22k0Xk8blR56rm/vO+zMPofS052nuff
 sO4lUyatGVui/oltEgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010162

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

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/Kconfig        |  1 +
 drivers/i2c/busses/i2c-qcom-cci.c | 75 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

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
index 21695c744502f7fb5d333f1272f3771e4d9d5508..0a4418401737809a628fec37c46b2beb1446b31f 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_opp.h>
 
 #define CCI_HW_VERSION				0x0
 #define CCI_RESET_CMD				0x004
@@ -575,10 +576,67 @@ static void cci_disable_clocks(struct cci *cci)
 	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
 }
 
+/*
+ * The single CCI clock is shared by all masters, which may run in different
+ * modes. Pick the lowest rate that has a valid timing set for every active
+ * master's mode.
+ */
+static unsigned long cci_get_required_rate(struct cci *cci)
+{
+	int ri, i;
+
+	for (ri = 0; ri < NUM_CCI_CLK_RATES; ri++) {
+		bool supported = true;
+
+		for (i = 0; i < cci->data->num_masters; i++) {
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
+		if (supported)
+			return cci_clk_rates[ri];
+	}
+
+	return 0;
+}
+
+static int cci_set_core_rate(struct cci *cci, unsigned long rate)
+{
+	struct device *dev = cci->dev;
+	int ret;
+
+	ret = dev_pm_opp_set_rate(dev, rate);
+	if (ret) {
+		dev_warn(dev, "CCI clock could not be set to %lu Hz\n", rate);
+		return ret;
+	}
+
+	if (!rate)
+		return 0;
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
 
+	cci_set_core_rate(cci, 0);
 	cci_disable_clocks(cci);
 	return 0;
 }
@@ -588,6 +646,10 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	struct cci *cci = dev_get_drvdata(dev);
 	int ret;
 
+	ret = cci_set_core_rate(cci, cci_get_required_rate(cci));
+	if (ret)
+		return ret;
+
 	ret = cci_enable_clocks(cci);
 	if (ret)
 		return ret;
@@ -678,6 +740,19 @@ static int cci_probe(struct platform_device *pdev)
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
+	ret = cci_set_core_rate(cci, cci_get_required_rate(cci));
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set CCI clock rate\n");
+
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;

-- 
2.34.1

