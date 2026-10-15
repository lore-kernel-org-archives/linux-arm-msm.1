Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D323522F0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069127; cv=none; b=N+uzOl4DnvMJoGNrvQIab5+9jBQ0b6TCoYg76WLzYbZ923Dg93n4k5hIYFXHoJovgpwzi/tUmOxxJhV9xlM0VqnogRupgUV4XP4q8YDtDZmPvWMf8roSMc49Rw+KZinjl4w84evOtsTX5el4Y3YCODDC4YASn3T2fgMsp9ND/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069127; c=relaxed/simple;
	bh=+/7B6+KUNNec4YWmQ4JNwvQrLYiUUliG5f8LtCctDC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=orHAQC93MwSXz1LTQWSEg+pqtfYgc+XJI9LUx8wU9s0HtWiGlKwueAwOLKZlK/khTO0Um1gCA0JqQKHO9pwPKxRa4Q8PghER1D67tN7gXwtG/kuJmNk7I3PP1lLc9mEs5RRovU775ONxjDvLWAEEJCrMEDlk7LP/PEEEJhOeMaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUnzuwGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPGE9mKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUnzuwGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPGE9mKc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kEee2999155
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhXW32ULll9zpgefHefrkMytXocm7R9Jk8nCG3El2sM=; b=mUnzuwGTHpxO7hSq
	kbG5hR56HTwd+13wpdZ2jQ5U3y+WmZUIWJzJ3m8LiLr/utLFLT3U4z0G77M2UOMr
	xh1rRh1ltjxiICl4veSnwDM1A7UbG/tDvBNsbB/ebNlLmhvNuKab6v8aJSh934ez
	bwkaazSoJA5/CpBpwVfeV7O0Lce7WffvAJKdaQwrL5TLQ3BWMXmFeZo/yRVpdzRO
	EKUpzvR6R82PbjoisnB44apDFWbcpz2NodBj8FXVCbc4wWiGbDOsDci+U7u0Wx8H
	u3suT5AokRakVNdOw990LCtwH5hFQa+I6X1FgB3E4M2XyM7RVWLP6rwhdGfsDp4r
	m7BPFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm10qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:58:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso47030435ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069125; x=1792673925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhXW32ULll9zpgefHefrkMytXocm7R9Jk8nCG3El2sM=;
        b=QPGE9mKceVf91sUFoSRlwtuLq54JLe1TDoK+bJVg4a8w555I5yC8WAVeJ+q6Rz5Q4Y
         P686upbLtv44GpB8GelrWl5GPIxuWKf+rwkUGZ5GKnL+6U56SRuBoPlP07IQoSuLvvUA
         Zpk0gFuXoJGjQMrqTctctwBp9ws2CbDAPe/WCOTuw219bCyBMlKIVBFrRH5HUrhbzbMN
         jU2pzvPfY42BFuQangMa4uyLSqegl8oQZQcSsXpwB3x3DdcYiS58gHyGFTb4UDDNZ5ao
         L53A1XyzYxhvMhoiCDa4m+gsGTNHgEK774Vfm5XXMxLq1A2YOmo5tdWGp2JizpYetqGP
         +sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069125; x=1792673925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhXW32ULll9zpgefHefrkMytXocm7R9Jk8nCG3El2sM=;
        b=P0QvbosQL9keqXAYxmG5f7fOrULO2MPSfB4xUNoM1tBFPkhRFif6nNDblrn4zywxnD
         h++gdZZo4stpKCqfeoX9r9kdortJbl0xY5WMrgLiPKFfb+Ru20foLC3SOlGiSqQOgWJD
         JxOq/wcpEsssYOzOMZWW/QyBkThPH/ryp8ZttqX9UqaiTAIRRqx6Mf/mz9qE2G69eK6k
         opyM8FVp1b5jeH5Quy9q2E5NIYeJk7omjiqQQHfoMhYGFP6N5z5GOEYYKE41I9btKhEe
         iskExQ1vTfEC1Inla18weMkDu3Uc6Df3q2aS80voAs0YRdYxNvP0/5mWQwp8p2VhkQsu
         ZSBw==
X-Forwarded-Encrypted: i=1; AKwUvBwi0SlQZwnrc0ZR7cvol9j+XwH9gxRvkhl1lFcetVNxwO6LRy9Cs5M7yZW/Il24AW9ILKylPkVnnBx2qlhj@vger.kernel.org
X-Gm-Message-State: AFq9FYKA08OggFVEOBSuk5Z76NbHFxaupXpTs8tls9ftvgdigTMIG6nQ
	Cyqhd0KyAr0UrfQG1AQmgGMO5TtuhMcWR6qSgwLIcCQmj+dzBExhoDShzt9F8s6Ce11eSFGBpYP
	U4mFtz/xKLWFEz/QzHl+HuaG6pj8464C3vEKbKOl9Bco4qwJ9c5v8j/xvndzRJsZfH6On
X-Gm-Gg: AYBFou0DOXx03uWM3Ffo5ikM+vFI50eg8CRBNvaAKArlwl7/T+o6HwjFQEwZBAXmv37
	IdAOCGyScAuTzCYXRVSiGt30blJttTUsm+a0sFEfWovOmnn/iJGERml89ghgzVUXpZ9M+JN25Iv
	+SQTZcfc3ReL20TkUyYl+IkVB12KH0jEhITVHpXleZ6Kijdi7j8tcWHN/94VgRx0XPZ6PVMT9/Q
	3Kpx89DK1Y2fgCbzHVEAcnIQTHo9VV0paIxtgaB6sUYttMhF3gOryyT6n3WM/Cu+0FcBuVwh64J
	dnNUFsCvzGOMkYCrrekScBirPEUvPDlBzo7TgveJOfah7rys9yi1VGGSZ64jGef4O4yzVatNOJm
	4pyByi5QSio0g86KCXhMt9XM4IuftD5xsMw==
X-Received: by 2002:a17:903:1af0:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2e964b9a8a2mr17283665ad.19.1792069124657;
        Thu, 15 Oct 2026 05:58:44 -0700 (PDT)
X-Received: by 2002:a17:903:1af0:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2e964b9a8a2mr17283245ad.19.1792069124039;
        Thu, 15 Oct 2026 05:58:44 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:43 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:21 +0530
Subject: [PATCH v3 1/8] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-1-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=3334;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=+/7B6+KUNNec4YWmQ4JNwvQrLYiUUliG5f8LtCctDC8=;
 b=fFiCNnShKg/JXYqcb5rRMrHGBdzcQNaF+nbOiZty5cBjDCrCjmBi4o9iRX9bQn6GzC0VxXrLH
 mgj0y4acWl+CdV09lM3ZfUH/UfH0tg05NyT1/BVoK7hGzhqNi1Cz+hy
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: AFTDdAx1vM6sWoBTR8i6z6BF5nbr6Pws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfXzcpXSBML0txH
 MbZYeFkg9Puwa9idoDUIxjv/p7MBVo5Npoim3TwShjIXqpJ5Lj23YeHIA9iPdFjRj/swtFeck+m
 YVvPpKN55H72RHse9IpRaVx7HjAsjHsE5vkeSKp/fAUNOuOWwh39NSk4/REfOg+xC6rmm4dTFd6
 QmDOvTLCE76pv8XIrDBvlq67YdBSohOp4BPdsxgOyFbm1FCoDopgKU+v1lFFLCdmlWIWyEQA/LL
 FLrSiSPrC7KIk093jbNEWvr+cZuP/nVJLYemqd45qdUkPjeipn+lnfuYp2MhhEjQjwP2Mw/feqG
 2zGZPap06uSsR3bv9FYDydJe9DG/SxWHAc6A6VO7Daf9ZorAK6FerIym2hDZa1EQC8fT+LI3nNv
 hHXtbl50/8MGCWTC8FOkqHx4Lmf3vu/tI10uHZOO5v1XSLxw2uCso+wTFgl8yjyT/PRdxjVqwW6
 pCOzl1pYWATwPJTxAWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX1Xb/1BhTz7TY
 6bTbqqy+vAVpIFACpH1yD/SPCcL46ZmP4hufB5za+49YH4OpvsyAdVpc4RxDhwXEed70rgcJfDr
 XUV3sb1JAGruJpWj4o3r9IRDJj9fI/k=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0ce05 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CVJBOM8IPza3kUTEG1YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: AFTDdAx1vM6sWoBTR8i6z6BF5nbr6Pws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150051

Currently, on the SA8255P platform, protocol drivers attached via
geni_se_domain_attach() treat each OPP on the perf domain as directly
corresponding to a protocol value such as a baudrate or requested
frequency, and simply request that OPP via
geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
computing a source clock and divider combination for a protocol
requested frequency, unlike the Linux clock managed path which derives
this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
applies the matched source clock frequency with dev_pm_opp_set_rate().

Change this by treating the OPP table exposed on the perf domain
device as representing the actual SE HW supported source clock
frequencies, the same role clk_perf_tbl plays for the Linux clock
managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
iterating over this OPP table in geni_se_domain_attach(), so that
protocol drivers on the firmware managed (SA8255P) path can also use
geni_se_clk_freq_match() to pick the closest supported source clock
frequency and calculate the required divider, and apply it with
dev_pm_opp_set_rate() the same way as it is done for the Linux clock
managed path, instead of relying on a direct frequency/baudrate-to-
perf-level mapping.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 074087c592cc..95eeb9438a29 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1159,7 +1159,8 @@ EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
  *
  * This function attaches the power domains ("power" and "perf") required
  * in the SCMI auto-VM environment to the GENI Serial Engine device. It
- * initializes se->pd_list with the attached domains.
+ * initializes se->pd_list with the attached domains, and populates
+ * se->clk_perf_tbl from the OPP table of the "perf" domain device.
  *
  * Return: 0 on success, or a negative error code on failure.
  */
@@ -1170,7 +1171,12 @@ int geni_se_domain_attach(struct geni_se *se)
 		.pd_names = (const char*[]) { "power", "perf" },
 		.num_pd_names = 2,
 	};
+	struct device *perf_dev;
+	struct dev_pm_opp *opp;
+	unsigned int level;
+	int num_opps;
 	int ret;
+	int i;
 
 	ret = devm_pm_domain_attach_list(se->dev,
 					 &pd_data, &se->pd_list);
@@ -1179,6 +1185,32 @@ int geni_se_domain_attach(struct geni_se *se)
 	else if (ret < 0)
 		return ret;
 
+	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	num_opps = dev_pm_opp_get_opp_count(perf_dev);
+	if (num_opps < 0)
+		return num_opps;
+	if (num_opps == 0)
+		return -ENODEV;
+
+	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
+					sizeof(*se->clk_perf_tbl),
+					GFP_KERNEL);
+	if (!se->clk_perf_tbl)
+		return -ENOMEM;
+
+	level = 0;
+	for (i = 0; i < num_opps; i++) {
+		opp = dev_pm_opp_find_level_ceil(perf_dev, &level);
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
+
+		se->clk_perf_tbl[i] = level;
+		dev_pm_opp_put(opp);
+		level++;
+	}
+	se->num_clk_levels = num_opps;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(geni_se_domain_attach);

-- 
2.34.1

