Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23013360EE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640077; cv=none; b=rAFtw+uKl748S65YqCaSZUD2tt57RZ2ZDS3aXOZS9+0los1uxxCPfLg2ZkkLLYmy/NNcdZ5tb3Y/MZZ0MW2Bhuf0TeMdhTJR9SnU7egvIk8hjsclVBbZLEJnI5ynYvwun7+IepjP+nNBmOQHRqrCdVo2gHuQlgdAXFWZgK5FPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640077; c=relaxed/simple;
	bh=3hTRvGqDf8rSeCVyeZpAh08rSXRH25yL/6K24MeAhGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KlmYJe9ZE8NICOFq+xow5OQsrnEiNtqPGboEIAuJ1en3nD3uFdx9eYlyx3BA26xGkVSPbZZJv4pe9LfulpInJc/BaOljHBILKaiwX9+OOSUuH9/QlUmrxv2ApAwyAjxERir2Q59yojgR589iulqx3kVCt5fJiLpSf664N71auDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REP+9LRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUQfARdM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REP+9LRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUQfARdM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQtLB2502688
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+9IMhfgU2+XhfVP6NO09mWvG091m8PU8yYOknpFkUs=; b=REP+9LRHLdNTJVtP
	OgaCPPBtnPA9+HqYd0rTE1XHfhkzu5+DmDTrhKL+tsTtK8+u17pLPIRqaVrrdMez
	WSbWAWHMPi6fcxfS0iU+NfZUnEuKkgp9+x3s+UO1zvyzBsQGI5pZfN6QKjpKtZDM
	glWdU0YPwERSN1a2sHwcGZnjk+8+uSeoeCAegKgI8aMu+cSxZsNH1AaLIMOoFo+5
	JI7tNkvNY5b0kLj/Xn4DjkxSvs2LLZKzJAAu029vfdgIzsaxIGrjJAzkMZH7WQfo
	+sIhXdaM3Ey7DV3VCjjeVI3nFWiHvJSGmjUZ2/EzFWvRrF4LFkr8ZZPDTBCkrWeu
	PWMn9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsrxqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec3314f65fso229858576d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640073; x=1785244873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+9IMhfgU2+XhfVP6NO09mWvG091m8PU8yYOknpFkUs=;
        b=VUQfARdM+uWORmLRXoH2UhqsRC9fKmlJfg7KupP9Uiu6vc5IvM6AlwldByhlVvZ42S
         ODH3CTqIfWS/sLDkD06aY9VGvCbv0BG87gROwyQ5+ocQpsoQvEs1n0e4umLkhkcQjC7v
         2zakX5A7Mu4eXcdTrK5WTMxORdc5/w65+pS55fMtu3X0xlKgA+OsZ25IAy9l7YwlyGsq
         Qyy8fjATXjgVPMMYSS9HWnDT+Lwv8mWhJB2Qz72nqb6h8DD8CbO+moN2kk209Q6W+z7a
         8FQUc7y4gE4luYqRolyPsg7Rsmd1nBnluApcaJAM1vqkzSo7hd8YpB3lGowH+QAJ4wx8
         S15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640073; x=1785244873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+9IMhfgU2+XhfVP6NO09mWvG091m8PU8yYOknpFkUs=;
        b=MNlTWF8Gs0ud7UL24lTeV5nCFE4wQynp0Ye3+pIx9RwSXuVELaMmIokqUdRsC27/+0
         yq+YvupZ/956FWy30dBfPXoh8CxQKLOHDXMDF/bynJ6z76jlb8piohBADeEVTKzrfz+o
         NF35IEw256NHXPsKtrUkDgTRDgISbWoqXJmraGaYaIod+E4IDSeYRKZ6SgNOa6pKvpsy
         fgzxWaym6wltpA73+ysbRSsAlCRc6qOLeiWKvZZ9+GdGx5y0BIMUtdYfEckyNqCCawxS
         x9fZ2b40qnDc6WpjaLBdxdWrwz63bf//vXzNFLfW5bp0NfxMOdQhgc6yOtVsoRcJQ0qe
         Nm0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoLd/i/C/CGQ+T0QToT7za7G3U4VIBlzjJQo87gSt4mtd5kbU3Q8lit91og1aFytT7SGCHrRSrIA2KkRJPg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+apcOqf/J5axS8u2n7MrOIUa9Tl/QGSxbW9YZHwRSua2DCEXz
	WR50rhpuxShflWY9D2T3HizZCWqZUncmnVmlKiufZrnfefYQYnMfo3v0zFusXKnOrAstBWp7EgB
	FLuAqwVqZFVZVMV8SPU9RzpbqRTwZqwoHZ3OMKZ9rINr9bjtIz9nlNkK5j2pHQ2UkBiaEyZEaJB
	I+
X-Gm-Gg: AfdE7cmgr9s9sCVbBxBgbJmXDOLh3kmzIqpT01buIy0aHjbD0F2nX510igFaYEDaVA8
	BuBhgV0Zzh/CwsshHh64tvROUzfNm/z4Vyj0grfqDMAUDlSCWwuEBhSLXWHL95eR7SxMD1q/tiU
	GmcFLhz+AqckOBjEUHBaRBWrtclukCxHzyavaktECjHX416HX4MZ0+mKr0chd1ECIdA3ikEADVm
	2ScODXNz1Ru5ew6NQkayZ81+AgqmWeqpGo2D+OC/RWJ0XIOG+u+QQF/FZJlfreBwOt8aQc/nseB
	tQX2y7ggTGjo7ioNEgT+SgY78ue4Hard29/HGcI6SEspAcFD4XZ+r7dZbvlxTvB+xnKtXIuyy2a
	oO19+ZJvnuQ6BWMIj1WHaBr0lIZ72hMbzxhtuwplP8IsBdQym1y8l6gfgyNRR0Xl4wWLOI02mql
	/LTO3Cn2sRotSByk8UkL3KGf7DFKS70WxIj/tWDaPXpwhL18AHUo8=
X-Received: by 2002:a05:622a:4ccf:b0:516:e0eb:d7d with SMTP id d75a77b69052e-5213c2028b8mr182200691cf.27.1784640073046;
        Tue, 21 Jul 2026 06:21:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccf:b0:516:e0eb:d7d with SMTP id d75a77b69052e-5213c2028b8mr182200281cf.27.1784640072594;
        Tue, 21 Jul 2026 06:21:12 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm598326066b.34.2026.07.21.06.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:21:11 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:21:08 +0200
Subject: [PATCH v2 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-camss-version-v2-1-b2440d99085a@oss.qualcomm.com>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
In-Reply-To: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Z4JKyH1zb1bMi5DTXIR40qyGK4R2IOln
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX2Q53zI+SG1nk
 /RFWjUw99ckcmluDengkMx4yGmP0M0CCicEGQ9WuqxvgWeE8QWRUgAMepRWVGEWSKlCD0hGiLd2
 X48yQK9asJVEAiMi6y1pdM+i4x/rBoo=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f724a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BAJ2-saCjKdBVCgQpPYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Z4JKyH1zb1bMi5DTXIR40qyGK4R2IOln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX/WIcSpLULjoB
 Ul+LBroCqdu04yGf3GoXsQIAxYTDlZ1aSQEtLUMRskbCe4JYXLUTaeJqj+IXnvpNsYMhXYwAA1x
 N1+AHsp1Te0DDGb9e2K2+CIKelmTWfACvGvFPBY9i1AGdwSg8fdZmFlMiDfFIeLW0223KGrBQAF
 7Pd7xGJVeIrOz9twGIc27EHdqyVEzBO2YXBAyAi0rLVFchJW9KEtk+nbCbTMaOF+/K3h2Su/mUY
 xNcUz26I9B1cIYQwUoB6iJetEvN9RegfdqSrUljGHKAUUqNKlx5WzS1p04x8fKxM67+3Ql22QGn
 4US1hj5uSvwS1AkrMVTyXDt4Xhlf02GjrNMQlLVdEooHkxXLt7Dbdl1NLNjfrE9mwGSK3RNaDBD
 Plto78EwUf0ermXw5BHZVKjoI998UlWvMP7LWNYErfkwV1cdDUoG1tR0bA47R3ndNBr6xDjwFCQ
 g6qu6Nyoc5kcPRMLUpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210141

Add optional PM clock support to the CAMSS driver using the PM clock
framework. This allows CAMSS clocks to be registered once and
automatically managed during runtime suspend and resume.

This is especially useful for global CAMSS clocks that are shared across
multiple CAMSS subblocks.

This avoids the need for each subblock to reference and manage the
shared clocks individually. A typical example is the set of clocks in
the top_group, which may be used by CSID, PHY, CCI, and other CAMSS
blocks.

Introduce a small PM clock descriptor table in the CAMSS resources
structure to describe clocks and their optional rates. Initialize
these clocks at probe time and delegate clock ownership to the PM
core.

Hook PM clock handling into the runtime PM callbacks to ensure clocks
are properly suspended and resumed alongside power domains and ICC
paths.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..01a9d4f780fbe130554601481bed50eac5978bed 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -18,6 +18,7 @@
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_clock.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -5346,6 +5347,37 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+/*
+ * camss_init_pm_clks - register shared CAMSS clocks with the PM clock framework
+ *
+ * Clocks listed in res->pm_clks are shared across all CAMSS sub-devices (e.g.
+ * top_ahb, axi). They are managed automatically by the PM framework.
+ */
+static int camss_init_pm_clks(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	unsigned int i;
+	int ret;
+
+	if (!camss->res->pm_clks[0])
+		return 0;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i]; i++) {
+		ret = pm_clk_add(dev, camss->res->pm_clks[i]);
+		if (ret) {
+			dev_err(dev, "failed to add pm_clk %s: %d\n",
+				camss->res->pm_clks[i], ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -5434,6 +5466,10 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = camss_init_pm_clks(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -5775,7 +5811,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -5785,6 +5821,10 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b2a47dbb234856b627d8911a1851..fe5fe25d5f18d8a3ce35b48077a975f1453c341f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,6 +107,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const char *pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;

-- 
2.34.1

