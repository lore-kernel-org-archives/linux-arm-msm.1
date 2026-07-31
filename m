Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D13E008A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488086; cv=none; b=hTAD7CBrYUgg8BmIHlJZmsUacCinOU7i7FQRq16PIeQIhDYe/ZREDDDMz32l4aO675B0wk2SYHIPbJntIOU0VwiEC4Y2mf9mg9gYm5nb3GcrKl9F/qdXZ+bRb/NzmPB1HXGM+a1oSCQSCRKpO1rAECe3qQdAJn3dyZCE8I5lPgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488086; c=relaxed/simple;
	bh=OZdD1ENp/Pvi/iFDguhGhQl/TfJcv/72CnXp+PHgYIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dVbTYRClqOwhABHKwLfkKRBq+6IsSVxqQggX+0Zuv4WYupwb7OkaHIBsjx/xkWan8sPPA6mgzMUvJrBngxvpBNPJbdPuEG3rXxB0uvF+paeQWBCFyTiKCOPbg9+anN6/+l7Tg+OFvGRZQFtQvQRnt+7ifoweBQhNHxdiR/a54wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgSWpJ9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXa3UInB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgSWpJ9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXa3UInB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8cL00481698
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqS1G3B+9SOZ15glFniS7ntN2KoHD2hpe3SeHaPoXwc=; b=KgSWpJ9pYNt5nA3E
	0h0ty0uUChPhHs9w8wUWBRSxIQUe5S+be1ZV79QMozw7LFZfGhktgymAL0yu5TmW
	AodFvTO7A+CYaAyLmHiJcFNGypWTv7ob2tY26Lc2qWBQCtXw9gabrJUhB1DZzWCW
	OM1F/CobXjQ96/gWsUE16d80NG8SEuHL7BVGvktYdy8RS9NuySw54lSXn6TaT6ht
	QkweAIi69SUJ+s1JZRA2W905BxRC4s2YFeaQyFlqDyU5zrCBntwy92DBc+9JqKE5
	c9RQ1c/0VCGEOM0du8GHA8NAH8X54TdhmYAH/lrVq16bFCDvyD1XDU7UX+wjVVLd
	dRtBkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc8g23c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:54:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so8351171cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785488083; x=1786092883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqS1G3B+9SOZ15glFniS7ntN2KoHD2hpe3SeHaPoXwc=;
        b=hXa3UInB6ZcO5WgvnQscmwqDSGIUi1caP3qq013GUe9nvit5zNf+ERosRHyECwW8q2
         FcWhbHJUp9nyWvZTcPjKUv9X3ChzDVukyLV/UutNKXe0djP1ZfrfMFmd4tgKF3As0W7h
         e9VBR6RLxxq13j0JdnUzUCxRUrvVRX3jyGTZfWdAZGUBmLiV3aoyUUSZI6Ss8ZbwyJPf
         TNA7DlUOtLSeFj4mpm8YVZtqeNgd2j4qAiFGcT8vH0d/VMhyxzZcTXhtqKJcdl3rbEhV
         wxV2mI9Fj9BQcIkrh49Q7fWcNaj6K7OEHEWOYZ8WjZ4GvmA55w6eXwz2BZHnRlVGmsFj
         yB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488083; x=1786092883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqS1G3B+9SOZ15glFniS7ntN2KoHD2hpe3SeHaPoXwc=;
        b=NzFmiFvG4pkTgriP3p3vP2BexoJ6Y/XlgzF9p+JO8KaDUGUuygS1f4w9AG+8oFcK8u
         +aLH3RcpNGTkzpQEOOloN5W4/9RaTpIZ782Hde2kFkzBl9FkHavGhMWNumw4q08c21EA
         rz7LRhx444nX79GwU+lXW9aH3457bbdZIfWM4SHHR+s/J+2rwrz+pg0GOX9YEI68fw0z
         lQJcywmxDHV0yHDkBkJIDE0aeMZsdXjenBNf6Q1xwawCgGAjwKyHEKYjYzw6IGrHbVcT
         7dFuAPju6Dc69fQRW3wp8Ygtz//Zsb2P1K7O+Po7ctkgcCbxOIBn51X9T4xePHjxXuKA
         rEbg==
X-Forwarded-Encrypted: i=1; AHgh+RpIuUDZGQqMhhIrvZxtqyd4c4fxObXsshSOXurpAXCwr7vFSnzGNNeO/5d1rinXQCotXQFwp69z2UFke0VK@vger.kernel.org
X-Gm-Message-State: AOJu0YzVtpsVReqZ+WoMvfUmYR8WmBZMe6CZnTRpTGgbF0Oq6gHTYuIi
	9wym2YVh7VX1WRpEUEosaE5EJamBMBKvy7g2QJw7cPzCm0rza4DiwH05QMOElLtTSlRriuVzNCW
	idmO4fqLW1di6GCdNQXd8HFu2kifiYxhyIdrjv6H0L5oxgkxzUJvZ6UfLkHGfTCr9KkNmO2+MFs
	R9
X-Gm-Gg: AR+sD11z0tYVnfMyDyukkSw91y9e/Kl2ZG/350WRG5mqmpV6CUi9Jkp643wZv9f6hsi
	qRai1XX4/A6SI19+6EgTtbbapYg4OibgVN1hrEdUg9XtQS5j18ynjUpdAYYSBQIj3zUqXMPyNLQ
	GQis+hYaR+Gb3SWJByVF0+Qk50dD6ZXVqpxIutGpDpCrwz1eb2dYMmXkmP1ZpY9YXradeoFohYw
	5CDOe1qdt9rQMMSSzCDwIj+3NNdYVBouKVXi/lTve6lY1YZlwvrbZTGc2Hb3GvPARGSZbhmz3qP
	HktPvA7rm947VEjbW44UcNHF/BidIcMsV21tQOyGnjaPdDqXzdq9SuAg3LeqgjCh9gxi6tcniTg
	XvreB2qwvwY9G810LUU3JK44KrSlSst6Xjkue6fg1FXQQMCn3JbOQiurrGCiND3lcRpthnKKoIj
	JhU693u/+ffurcwOdhfpLF1aTPC8gRjd3OOsMmnpFf5Q6BiRkHs3Ni
X-Received: by 2002:a05:622a:1107:b0:51b:fc67:c738 with SMTP id d75a77b69052e-52b4af2baf8mr12319271cf.29.1785488082984;
        Fri, 31 Jul 2026 01:54:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1107:b0:51b:fc67:c738 with SMTP id d75a77b69052e-52b4af2baf8mr12318871cf.29.1785488082533;
        Fri, 31 Jul 2026 01:54:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9f0bsm61899366b.43.2026.07.31.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:54:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:54:37 +0200
Subject: [PATCH v4 4/4] media: qcom: camss: Report hardware version via
 media controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-camss-version-v4-4-be8b716a8c4d@oss.qualcomm.com>
References: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
In-Reply-To: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: eZ8UEwAmKXx-AdasgXScItrEfrntjYRz
X-Proofpoint-ORIG-GUID: eZ8UEwAmKXx-AdasgXScItrEfrntjYRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX0V6JdzEHlHLz
 Rds12A5n0ao1zwY2og527bA0LszFci7FDfA+RIS/RInoedn3+NiccP1uRZ8mbllrA2ygaorLM/A
 T7/g04yFgvewOPH/aJXV8Uhv5NMjaLnTMvkC6qSp0QrrRfuIeBJaIeLBGrbv7DEDtiqBEdhE9O/
 d1Gd5q+cPQbQEYYS9NKK/zKXn4Gc6RlODA+msNwQut++saqZlx4HwuZiWdoC3LYo+PGCQeUpZht
 5b6eWkLZdSafSogUUETshTnmo3tcpZgXjMk3CvcduZYbpNsr/Va12Jv7pAnpJehqJn/Z93Yx1/R
 +nahsq8bPAneb2KD9oe9XLLmil8/OMTbKfyFqTm0vZD/1+eHIT+jpnOWKnMzSuK0ovUnZYVl3+e
 U8a/bVr2oE9xcY5bjTQc0jQrtfl2/V5nkFUCEKaTua8Vteke001VH71m6zBm9ObH8WIDJDjCyYa
 LRx6dp6G/13Iu2CsjCg==
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a6c62d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_VBxEyf9HguAcaXgWQEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2NCBTYWx0ZWRfX/xNfLr5KWsvv
 NE97yHOmHc1M3Z5N8MCdiLMuOIXKsLJb+hwW3cAN12CwOVsv7u9FSPomTS1ynbcOe/wsGpHsJWD
 so9aXb/R9iF8QdKr28clqwKSUjwysvY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310064

Populate media_dev.hw_revision with the top-level CAMSS hardware version
so that user space can query the exact hardware variant through the media
controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
identify the platform variant and adapt behaviour accordingly, for example
allowing libcamera to apply quirks or enable features that cannot be
discovered through standard V4L2 or media-controller APIs.

The version register is exposed by some platforms through the top-level
"top" reg region (offset 0). When present, map it and read the version
once at probe. This is a no-op on platforms not mapping the region (yet).

Reported media info on Agatti/CM2290 (Spectra 520):
Media Driver Info:
        Driver name      : qcom-camss
        Model            : Qualcomm Camera Subsystem
        Bus info         : platform:5c11000.camss
        Hardware revision: 0x00050200 (328192)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f688d11990a71aa6d745db1fdcebefe5a5119ca3..6807239a19677709481bcba0246e66ea5ebc4a83 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -33,6 +33,9 @@
 #define CAMSS_CLOCK_MARGIN_NUMERATOR 105
 #define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
 
+/* Top-level CAMSS version register */
+#define CAMSS_HW_VERSION		0x0
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
@@ -4677,6 +4680,29 @@ void camss_pm_domain_off(struct camss *camss, int id)
 	}
 }
 
+static int camss_read_version(struct camss *camss)
+{
+	u32 hw_version;
+	int ret;
+
+	if (!camss->top_base)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(camss->dev);
+	if (ret < 0)
+		return ret;
+
+	hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
+
+	pm_runtime_put_sync(camss->dev);
+
+	dev_dbg(camss->dev, "CAMSS HW Version = 0x%08x\n", hw_version);
+
+	camss->media_dev.hw_revision = hw_version;
+
+	return 0;
+}
+
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
 	int ret = -EINVAL;
@@ -4866,6 +4892,16 @@ static int camss_init_subdevices(struct camss *camss)
 		camss->csid_wrapper_base = base;
 	}
 
+	/* Optional top register for hardware version info */
+	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "top")) {
+		void __iomem *base;
+
+		base = devm_platform_ioremap_resource_byname(pdev, "top");
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+		camss->top_base = base;
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++) {
 		ret = msm_csid_subdev_init(camss, &camss->csid[i],
 					   &res->csid_res[i], i);
@@ -5459,6 +5495,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_v4l2_device_unregister;
 
+	ret = camss_read_version(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index fe5fe25d5f18d8a3ce35b48077a975f1453c341f..cce79e56f58c8bdc0097f4a1702df22c4248f2fa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -133,6 +133,7 @@ struct camss {
 	struct ispif_device *ispif;
 	struct vfe_device *vfe;
 	void __iomem *csid_wrapper_base;
+	void __iomem *top_base;
 	atomic_t ref_count;
 	int genpd_num;
 	struct device *genpd;

-- 
2.34.1

