Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691BB36F915
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853606; cv=none; b=nqcBbiUn+1Py9nWk59hWQviYVZmvgM73TEQDjftfszUJryvrdgdJNzsHVZHPw3Fi6n91pxpEF56dDeReR1wK21etcorSllwJMEl/R5GoudfSXgSwVt5ORXKE6e6Gg9KF7KGNReneXC7Xly2Fqur+Z4hsPxtq4Zwri5Fr5QmVXbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853606; c=relaxed/simple;
	bh=uYtf63EywauTBDLjs8uD8MJtcy5tP9+vyAB+Hmv6QH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfO0zDtRgGiMzyRBVvnb0Dm6QKJYP8tP6v4CLB9hlIoP1ABcg7zw37W4WUamsSWRhRdxiIPlm/GGH7fQ2uLsIflBndsgRz40KlU0NQx0axnhVIc7uI2yM9LwSVR3hbJchSMq7yKAXC6yIl3M4JovQvthtKw01StD3qdkbl8VmaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+Y80KM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9nEls7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+Y80KM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O9nEls7A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXics3613337
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 18:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYbKd+3GajDDr0jOEfWiaOSW2NcTlBpxJd3GfO91+J4=; b=I+Y80KM51q9Yk2+a
	j4H/8pee737PHnA3HwQtTl5QnWER3ePY9GPJX8rYztgUV4jZuiM1lGNdmJVKnETf
	SyXWlrQFiQETA7yFO8fsTd3V7kA+KBlc6wNhE1O27MWafeUT0WV/RB6AtPhJ8po/
	8q3I9byjRspDJKIwxpqYn0lgGppFENeSo0P3fMOH2AbYWXIhXcXomPuCgem01Uqd
	IvUcx02zBKzCLsJkkjh4fNNISTR23DxSvAVL1YGy+DzJUcRYQQnN7KcxHPXE0nC3
	bIo85WSQ6Ui9xKj8TEb2b02hiwIVsnwrD+Ppx0yJuSrnVupxG2yKGIsghD2/YEDH
	0HG4/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t4001-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 18:00:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so139902a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853600; x=1788458400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYbKd+3GajDDr0jOEfWiaOSW2NcTlBpxJd3GfO91+J4=;
        b=O9nEls7AGMfzmJqYa8CfKB/XkBQaGlkqhT7s3xHxiUs6qtBolpq5V1gUboTvPF3wfa
         GxOPF+iAVigDYebzIwmyAjNgf5qm3opcAFciSABtUu8d0HBmzvaA5qBWi4oV4bVMnE88
         Hk4tdEGu9jbIvEb+awm5K/cAOBprHeMViGmseG0ws1vqw5ypWOwF8TiEVE9wRaNMcVfI
         1+Jannx7ynzEcebPxZmGj/t71bCBj5iEyMRJlHfNdufE6WhrMRHauhRIjvOb4L5x6c0p
         s9HIaCNL/9GWxIjfafjwnXYEiufujZmG2mXF87Ze8y3xhk3O8BshzGOR5egAraH01NL2
         SMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853600; x=1788458400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYbKd+3GajDDr0jOEfWiaOSW2NcTlBpxJd3GfO91+J4=;
        b=DaEtOLwL5IMZG0TTyKeL40KqGzjquB8N9ZaVCAxYJix2UGBJwCn0diE0Jw9QxoSOLV
         PmvUge8J5lanTPuRDRrB/q/qLhlCpTbdhvEMNUKp+ary1U7Z41LR+v2amCsY/hDrqnVX
         ZtWb44AdWxMx40CnLZrldS1vICuTlr8ugC3XU/KykPioh0YnMshnPVnyScW4l+ILgqxs
         NcXj/LxJqcUUUcCQMkyBmvbqIXrw7dhnxqKLSJIYTL9O2JcNFs8RpqvtfTjHd0aRNJOI
         zv6U9bYLS2Ni0/Ru/ejUrnBRRWPjfVQA35cN3lA2rZ7b1lQpEOzhofNhIrzQwBt4mVI6
         mHKg==
X-Forwarded-Encrypted: i=1; AHgh+RpJXVidfRLyP3AxfLLZxZfYSzCGjwjAf5K2fLbGtuz+lnzJkNuVanP3j9KGMt8gjAd3NNCIIe6/ceS2YMQh@vger.kernel.org
X-Gm-Message-State: AFuF++lSujVYOqziZLgSJin+ncUaQmGqC3fmYhRev3pb7WCKH6ykett9
	Wup2rUdNsinHKnLvGDBAKMEUrR9K8bP1NxRH0qcKytVXFjbKWZJ9FOibOt7WiPnSK+LarL5P7NS
	N/Y0rgBmEuZssEnDK0o9MV3B9NDu8wCumL7r1ne//p3Hu5r1N6f6XzYzO690D+y3BJSiu
X-Gm-Gg: AR+sD135Vv39MSo/6QVT90Rjdli+f1/PxgcB7Mh+apllju3qWqVxP1bc+/bbAVJ6pvI
	cq8fVGCMGBv3iAHzSdnKM5U66TPZR7ro+aVGD5UkHTU3hhYl5EYITwDXonJd1yOfhpqHZQI3VBT
	vN6CXz0pKKF+mXqh3rXA8p7uvmrlcvkRvHwryBezz6HPQBN6h9l7iQIXl4aUzKD3w8h9NVj1AMs
	buxjDHB5Hdy4MgoF/QF8uTnC1gc2g/MhjBltwUs7aBdAouSGKNc3a9tb958nxfMKX5osypkt3jj
	p3bj5V1DWXjIDY1AyMovr4tYTR2yRYIuRNLVF9kcKdJ8w6nWEadiV5l3e9iWr41/CCZvKH1lUTx
	Q+XmpkJ2mXsjyI9rMdO7VnbnZISPepxQapA==
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr1795759a91.0.1787853600050;
        Thu, 27 Aug 2026 11:00:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr1795630a91.0.1787853599347;
        Thu, 27 Aug 2026 10:59:59 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:59 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:21 +0530
Subject: [PATCH v2 4/9] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=1510;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=uYtf63EywauTBDLjs8uD8MJtcy5tP9+vyAB+Hmv6QH8=;
 b=yuYXtqOch5+JdddKssp+xdvmeKhNyCOF/ql/3aH+DBJ9+vZFPKVWOtB1ybZnNXz8rc2iiV8As
 /p7XPI4/WDQAeVMiG8xWSUmsqYQmJgFqpH9oY3Y4fem4xv9ACoLmXqJ
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a907b20 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dehDsB7WAhqrwfXEkZwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: cxM4cnxxKOcWT6gv71s8fKC8EEtUS8cQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX2rNereqr2vlR
 keitIH9Fh9ZNmPbimKwyDRbOpKhPdmxztPWxtkg+Elgnu18oQB7LZIQgyQJ/KJ7SKH4VXB9A/hJ
 kalW849DF4X4EU4TDF7z+cB4KKk7U/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXwhYPlAriJw46
 lnkbRbmCT96CcVl9yTsyScBYm4G3HkOy5D4yDL2pRSc7HfahlxEkM6x9dEqNTIeZ5vS2TTSPZNa
 c9u+gUTDeYLZk1k9FIFfGFdL8cO5bSVUcmmNHtuKhoovOJc2TR+DhGOZp1w2Iw+owoLuEJDMvoz
 WSHTvG1mwN5vwSNyoFY52G1PEZQDqtnBmQkRMu1XEUjtA+yOonUTryXtvvSOFb0Yr32YhAspgg1
 7eC2Y0x6GUFhnNzoYzgX+wCtQAUF2mNJAuvH0MPqe1spTgU6xqBxYdEJ0KeBzyNX1sDOzvT1mDc
 kiFqzXYROzH7Xoyrq88Q41QRDXAYOa/BkM62qInJrX7183ELQ52TWMu81vHLnYFM8XdWwukOLYX
 ac4j8WMR1Q+q4/Rzde1GRhcBJxK8Gb4ZeUpWEzEg1nw/oojytnaVf1Hd0ogj7vpN6X2mFInIyhb
 cAJaHLWX8gMeSDGVbhw==
X-Proofpoint-GUID: cxM4cnxxKOcWT6gv71s8fKC8EEtUS8cQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Remove the dev_pm_opp_set_rate(se->dev, 0) call from
geni_se_resources_deactivate().

OPP resource management should be controlled by the consumer driver.
Additionally, clocks are already disabled by geni_se_clks_off(), making
the OPP rate reset unnecessary during resource deactivation.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 04f58a6f26ff..d4f0544d73c4 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1039,8 +1039,8 @@ EXPORT_SYMBOL_GPL(geni_icc_disable);
  * geni_se_resources_deactivate() - Deactivate GENI SE device resources
  * @se: Pointer to the geni_se structure
  *
- * Deactivates device resources for power saving: OPP rate to 0, pin control
- * to sleep state, turns off clocks, and disables interconnect. Skips ACPI devices.
+ * Deactivates device resources for power saving: pin control to sleep
+ * state, turns off clocks, and disables interconnect. Skips ACPI devices.
  *
  * Return: 0 on success, negative error code on failure
  */
@@ -1051,9 +1051,6 @@ int geni_se_resources_deactivate(struct geni_se *se)
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	if (se->has_opp)
-		dev_pm_opp_set_rate(se->dev, 0);
-
 	ret = pinctrl_pm_select_sleep_state(se->dev);
 	if (ret)
 		return ret;

-- 
2.34.1

