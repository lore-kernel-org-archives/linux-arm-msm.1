Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9504D485CFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327984; cv=none; b=PnjlaSLDmKs/qdVQrArCEBkRGyFzrqT7qqKCuQTkewLhdPRiQDd02otH5sbcJ63x4gRwIU4RwHIrPZfHvsRa1Vj5SCtBI+BsdpZvEEOgjf0XCXecyhvBanB8XZMM6jAxSYXUvhvkwu6a4n40KXUEYDjVjaSuXELDQf2nE4dV8Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327984; c=relaxed/simple;
	bh=zO9uTpb6Ev2xcSawV3dEe3RMmoFzGJAef0EP25h48FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjpV8Nxlk1aqEPXfPw5FC79lTfyEHyd+llS0RCxUziJSLfsxM+LVgdKZxG8FpRe2MqBCUCLb1GgHR/V4d370Qt1o470zA6cZNigqb22SJrItep73jFYXZL3vKalK0ZOma8krRg/PZXkID0RO3JmATU9Pzr8j76aHbb1FrbcC1ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRLg0cDa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZN20wot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRLg0cDa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZN20wot"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBjgXc2136667
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79OHluak6OoP5tn0WdGIsnRF2uVcYcikbXYHtdIql50=; b=WRLg0cDalr6wqt4H
	OSfJJ5cOOnQBA5xgJ/FdjIvHROdT1ZDUwG41DXGK9uWZi1aZz4A9XzgCd1ecrdKV
	SSbWfSBh8nW0iS3TjL1P7JhRKpR+WcDpPXgTHYD25fMyGdlR1662JUczi7/eADY8
	0GcoFZ/eEk9hwzPFclN4PShCMYWOhy06LS5QxKQrPlsDTbGwOrTGkqfhFwY6s7Wd
	GuLRDxYOHHSv9smsshJ1V26hp9DcvpbSoATToHEu3UpE4sqtMBmiUVMEWHMvgTV0
	ooPUHrbeMinrm96waJmrl+Vy/o3VkBWdubXtC5e81kXV4v+QxRF09HBcN7xo7sK5
	LYkQ8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgx804y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:26:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so11595101cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327981; x=1785932781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79OHluak6OoP5tn0WdGIsnRF2uVcYcikbXYHtdIql50=;
        b=hZN20wotCjaxLwsuS8/KbS24Un9PeDL1JnOYFtlOQE7HDXek1srvEPxz8lg2MDWkAS
         olpP1T8l1Psy1HHnKq7JYyw05WTfXn/PzAeTi6QVRmqbnjIGws8x7SpCTNOFnsq3eAjn
         zg2YGhq04SJmoLw9Z8YFcwbYQPOMqh6Io8hFE6yVC3YxlYfXeaetlE8Wdz1WIDdZ44I+
         B3g3cVnGeiEO2G6GDsoQzy0HdHre5Fg2tHi3KvC2po/k5NNl7UXT7gqPdYlLYdeu88IH
         u6gUktXMCEPWRRTxfxCXN4vuq/m8Tp6OYB88eJBymjNF73pC/+eSN6WdzZdXH4fdqzAE
         5njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327981; x=1785932781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79OHluak6OoP5tn0WdGIsnRF2uVcYcikbXYHtdIql50=;
        b=BycZJFa72gFbG31cXsZXJ7N6BZ2TkghiwmWuudX9MMKVdTtZnr8/Nsgy5NOugASFq+
         OgDA81EjBNcPTtDkOlPsZXfWuI1147zysh+VHgfFqZ+CGWNLAmELBU0q3qpelCpq1RgT
         Y7dhP1vIhlly0UBoO5wPqBHjeONp41jfHq62NLkM+Cg8bMVq/ng6mv3pfUojORFO6cZc
         Djh9l8hRxPi3rQXdUH4ENKBA/TTTlssy4+kx5HS+viSgdqjDI4hhYsRJjJhm3G4LKZ8h
         7x/8nA4LrhcZimmduoNg/88EIVaa831GuHDSfMaywdMtX9bmH9EZS98p/Nvp88SMCDfw
         9XvA==
X-Forwarded-Encrypted: i=1; AHgh+RrTOkkDn/lDW9UDzI2Kzbn2/4UwDPxyDHR0XPzAvz4SejB/d0rz5q34Y1zMaIzOl4sGBepVCRMSRZ/yrVEF@vger.kernel.org
X-Gm-Message-State: AOJu0YxsOOjXspze5XseeYtrLGStxQQwrlrzaodYXh6UbQMYiO0u5Jc4
	26rSGZpPfHP9goVp8Ve8Lw0c1vl7f2Pc04o/wx84xacKqjthuJsQc0vVf4L9reUCQDNO3EoO9qW
	rccPQLfnSBzi0odioPpSDX76cFcqodhDMMECfVWB4KrK6EnrJ3sFAeFb5hYvC/TRKXUZu
X-Gm-Gg: AR+sD102bz/LAkciLMOm1Tpy2xNJYuzm+4ZeCJFMneVIBD/llQqniXktMtRFXBUYeRH
	A420gHKuyvcAToSlAf6uVBnTCxd/+Pv1KEaeJ3bvbm2ffo4b7NX4Zl/wJrZHYg05Lvs+S6iithE
	9DoRQFjYJKFrKuHaOkIoQLQ1o2SpR+T8oe7/vxevlcltYmK1Rw2sKU110ENn6bQROLI+kbXeHkT
	/Mm1liS/mnGnX7nO0/b89YEWfsL0JNsc7KF6Mc3pMwSV28mAM9pkjDr1jc8VeQBavQb6sL3pubJ
	MsIOQsdLzu8JqE74Kj6AOZuHJM7i3g0VQCnWGQSMlm4v4p/5laI9YjQGd7EZWviynOMgB47YklH
	6a8Rxve+PL+N4tQZB/XGFF5sKZwGRQ99xJNiu7vY/caOhHnXs6AiNCghBjhUmi1zKgK9ENnQpMR
	/c5y8hi1NiBdZOgSoctGdbsor8Cym+ecQmoDnSd5mRKQsAfgm2ytqX
X-Received: by 2002:ac8:5902:0:b0:527:f19c:734d with SMTP id d75a77b69052e-529d70b450emr56667141cf.7.1785327980615;
        Wed, 29 Jul 2026 05:26:20 -0700 (PDT)
X-Received: by 2002:ac8:5902:0:b0:527:f19c:734d with SMTP id d75a77b69052e-529d70b450emr56666301cf.7.1785327979376;
        Wed, 29 Jul 2026 05:26:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c5cf0bsm756343a12.23.2026.07.29.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:26:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:25:59 +0200
Subject: [PATCH v3 5/5] i2c: qcom-cci: Enforce the required CCI clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-cci-clk-fix-v3-5-f3c731d1596e@oss.qualcomm.com>
References: <20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com>
In-Reply-To: <20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX3F7/Vrk9IL23
 06CuLw2r91DMjavF4Ktr3/38aqJdrL6j+QlMh0Q4z4or2UGhWQXRCQzJHCbbxmWYfXPmjX4l8Mm
 Xfa6BKx9xD5yKbHID1Y3eQ0L38OfmR4=
X-Authority-Analysis: v=2.4 cv=MZdcfZ/f c=1 sm=1 tr=0 ts=6a69f16d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7y9KWNt3fco1ghxTkywA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ZntJajPSBRgPpusaGf5OrogjS0DMijFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX0E6OJw/XEI3b
 T6Edl4cdUkFUaxch2aPJMwB77dIY5HwiVXqmsyVn4GP79q728A4CpU7XFwtPd4gcov1APPOMYnO
 Z74+WsuLyoRdeLflrI1JhEXq51rIQmJ3Y7nN3XuQNRv2mCLpEQN6zk7NvlRiwGb2GB+g8xMW0ce
 O0MUHkgYxECVNw8WeBKoscEib6MlZfm2VS/Vwn9FvNbHs5IwgQGlT9jL49W2U+VoZHetvi35WYR
 NPpxUBTDkOG7RaIPA2wEpYAKh8DZngRZovANVK+Z7OroFsALeUt3papdAg1wrMWGAHQf+g29n8H
 kYoZHaCx92FVWRdkutX9ibUuJD3Jk2nZrkyMQO0H+wDHhF3mbZqY3LCdb+qK0F0n+EVGJRklsvc
 2FmcUTFxA0kulbyNQa8thsGaB9orxKIBrj1Zo/ZSk0FSHphkbKiPcZ4cl5kUU1ke1vBpuTtCwcO
 5qJR8I2fljIUfYOXacQ==
X-Proofpoint-GUID: ZntJajPSBRgPpusaGf5OrogjS0DMijFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290102

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
 drivers/i2c/busses/i2c-qcom-cci.c | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 8e4641de049e56da5afbddbab122946bcdd4f60d..fbe3fef1b49fb3d0f1b77ed9677f2d5e0eef4df5 100644
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
@@ -694,6 +756,19 @@ static int cci_probe(struct platform_device *pdev)
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

