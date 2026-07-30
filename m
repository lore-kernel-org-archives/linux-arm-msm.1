Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55773C1F46
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403459; cv=none; b=Xg3mZCHocD1bxKphoRqNRxiZFcKO4p3674haqT+GF+NWzxdZc2cCYNPA6h8qDFwHRiZUHVv/wwVNQPLyrulS1nNuK/gsfhBWdkcXxk5IzZLIUYiD4UCE5JFSNKkySVlel1BzDfAMMARmqUN7gaWLPH4hIAuaVQ9+PSgJuKgAluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403459; c=relaxed/simple;
	bh=ztEvlEb9G/TB+4iwPjoKhmlIHszOjQdeUA7eFEH/jSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fL/bhPnVoGJT3I7453+j67x7vQ/TvrKpg91SXRdVQQ/bjAFL8o5MCoOCpSwkwUPuGVIRNnNjxtFRqArN3UbUmDqLCdg1ryjvf7dwRyv4+JYkaGq7y6FV0EthiN/kfKu1nRAVxERHPvo3P8s3V5dcUllF1UVeyI6DMIEymavFLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8O9AqgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fl3lPTRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8O9AqgJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fl3lPTRa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9AIu1378562
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	77U3gF4A74uPK5S2XDNbWHd8ABosYr/FjQEurPdZBV4=; b=k8O9AqgJ0AfcNyu6
	XgrAqiBcH6Y8vDn69fUNphjChE1hGRseItrWhDegH2FiCS9MG+XzO5oNVA9zgfJv
	uYc8VsI59xcUlLL+WJw0QtprfzOz25KXIwvG/m292rwPbVTz6d1vQ6CIrxbXr0oi
	FLGe9X5oZ8A391ZzfQfDYeSMzhnfF24UvZ33H7JfLBPatO+Gk3vNMXIsPiAkLJsR
	UnnLu94/UKDEiiUEKPB4BnEle1TgzDfXSQZEj/Wq2HDaWyNAOW20aGbAJs8+ylyj
	KCw9/NJ4WYkTauE4/lBVOQ4BjGqESMN5Mz1aJuW4Mu5yH7xtY8RGMo4gvICVLGRi
	1Q35Pg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3rdg21f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so32315911cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403454; x=1786008254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77U3gF4A74uPK5S2XDNbWHd8ABosYr/FjQEurPdZBV4=;
        b=Fl3lPTRaaOuDHojeIsQGlyhDVjfvtVY7wRqEQxa2mt9NI7Z3REgppuP1LxSzdtihBq
         G7kiajsC06CNaZYjUVOXoX15CQ4Rbf1TfWbopgFRhLO4+y1aDGrfBLu3sim1llsM1hbQ
         lIdZswmS/zJKRko1Pj05yEcJbAnAm5K/6b92b5Pp7mTjKV0pKpHC+Lct7JUT3AXlWICr
         ttgR6Zo2ubSsC9V4E2r7+y0EC7lXKW+XhGBuP7zGGd6eHASfLHQon5t1o6NMnNQPIqoo
         vvhydLOhK2zokbtMzXMmG5AGTCUvdRXEQBGUJ8Qk3efjyhWg6kJLNtvWNclJiuhsKlxm
         3uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403454; x=1786008254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77U3gF4A74uPK5S2XDNbWHd8ABosYr/FjQEurPdZBV4=;
        b=tFKpnuJKcHvD2Qx0UuiXz/odu28dT6TZU1z5ITjmSowQjMDm83dPE3vWtJKi44fF3x
         bpHRc74StS6XfuUt15/aqoPqgYYkDyMfYM+UdmQ71pt+EV3/JysZfJUbaMUPceQMC2+b
         geOoa8AErjm3mJO43Cy7+TbKGx4ktcy4Lbfde3c1PkmFwC9+9ubOttVtaWYmIashQz92
         IClbo/07QkZjJgbdjghFSuAMXj371iAR8Dgp+fIhw7gyelaF29VBSd3cJtcCkI8+3W09
         95PIHaM/Yi+XmSX8j40MB7k+A6PYUdwXCDQHhDZiV/K1+7RYfbCLfw1Fmdeorb7zoJXN
         PpJA==
X-Forwarded-Encrypted: i=1; AHgh+Rqn7Io6WySoTmZvMfhLj0mYMTL9TS9YmCpzzK6BlJwpnDxbSRhqqiRPgD5bhFKDxtrgSnk0I5OK41Ym50HX@vger.kernel.org
X-Gm-Message-State: AOJu0YyyPYJNc0KQtblLYQHP86rWDMenpXo00hUpv3jFFytT4vPfYERx
	FuKvHey4UI0e4pSXu15wUKLltY0SZTekuKQSHgeBWpgFZi2V7t+LXI03qRB2oxQPcjVy5UPxxxs
	aN8gRwX8+xVEiudpyQ5NQfgsPpVidShymfDGVAgPWz3kVHIsiGdmzmNYiWo1A9DFm3jHN
X-Gm-Gg: AR+sD10nwy+OzX7QmAE2dOff7gndVGG4vrRt1SusMrQhcEy2OH+YXPWLoz3CX35iZlf
	IbHDthmFTyTBGF060QM1vM8PEZEIs/hfOUyVeCAuwVorsCn0ZMeNLWwDBCFYxdZIDo/IR8GbpGl
	CpvsFdISQoyzxSl78FqZntognC1J667h42ynmZSQVETmStgB3QBIRWdPt7d3sFt6/MZZgqT4VRK
	co87kqUcjq7YvS7JrTmSXiLmE414fIEF+eLbWFcUzbjemRF/lVAk/qs+mDXRTdspnREksm2Ms6m
	w8byZKB1y+97mCM+aug8oNlSWVhbb7hXM14PIyzjEiOudCmMXR9T8Sa2ulm1FqYI1wWFcckUkpN
	02dN7V3Cgqc4WGGx0i3a1/AfcF1Ktz1x6Pfllh3c2i2fEME6yQoQit4S1zRN72+7rJDh/cYo/Gg
	Mta4ruNSf+K6szzBRJJ7uedx/j9/+If+rl5u6IqJ+KJU1QH1NQWcQJ
X-Received: by 2002:a05:622a:8d:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-52b386ef782mr17775011cf.58.1785403454183;
        Thu, 30 Jul 2026 02:24:14 -0700 (PDT)
X-Received: by 2002:a05:622a:8d:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-52b386ef782mr17774771cf.58.1785403453684;
        Thu, 30 Jul 2026 02:24:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831basm411483a12.15.2026.07.30.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:24:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:24:09 +0200
Subject: [PATCH v3 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
In-Reply-To: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: SsTbaxMQeEEkPoQCCCkBbW1p0JfNQ1uT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfXwk9bTfznOq8D
 PzXG764WiyFGw5+GoLWm53gymcnG5jcNviNFysf2ucvclfxIYd/ejpvxEUVUee0pVuFZ9aIrdXp
 KVcup9+OlKGO6V8jWIhJyXo9s48IWGM=
X-Authority-Analysis: v=2.4 cv=UNjt2ify c=1 sm=1 tr=0 ts=6a6b183e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=KmNvnciZBadtvzOit0AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: SsTbaxMQeEEkPoQCCCkBbW1p0JfNQ1uT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX4OseUcQL2OHf
 CXy6GQ7raexKTPrIPTuPSDwcuXWwv2QtO8ZTlnaDFySp7ZLtGgLBlABJ6RGS0DxCPH/fxC9IWDd
 MtVZtsD/GC6GTm2Z4LufO+5sykW1jkXgte3+UGZlCTJpxCTWwL4ArX0jlhPoVtRovjjsClD5w04
 p5TOSkWj6b2umlQh/ASyk7Db8/QAxDguDtuyFZwsW8X+cTxE2RkVlhTTW8gLclGJfWTNeorEIh6
 QIuW3Kzw7gDEaJoVKGYK362IFO2IsJV159PoHmOCqiuvR/5z+/mrlKT/Fi0ZDct6htlCLnBHxfL
 DLCHzemjb3IjOMr/a/6EmtCfPmV5/+pSGgupqsTzJgqnOo/yIKwTrC2QG+opTplgIsxlkCuBd9+
 rpvoLDi8Giy4ecDiLirOoX019Gu+M1OcnGqv/VV+hdK0UhtPYAx71JUQQdqhWjMC2bFLWE3hw4D
 xAmNWwnL89Lzr1WWs6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 46 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..36534f5b496cf30f02464cf2268f0cba5896501f 100644
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
@@ -5775,7 +5811,11 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
+#if IS_ENABLED(CONFIG_PM_CLK)
+	return pm_clk_suspend(dev);
+#else
 	return 0;
+#endif
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -5785,6 +5825,12 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+#if IS_ENABLED(CONFIG_PM_CLK)
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+#endif
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

