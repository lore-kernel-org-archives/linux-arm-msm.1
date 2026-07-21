Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA963672A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640083; cv=none; b=EzDfIdOiLsUyZ5S9sH1QVaDxziC5XnvYtueDnD+zQUSGy8kZNj+HEcAl9H4awufSfPWO2c3zk9qbu3YeltR0ZISbnDsh0WRLuRkwzcKkfTi2kKGWzzz1NtmEsyYJAknAOivMNNA3U3j6IlrpBF0Llj7YFPzkX+df/CGQJezZ1h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640083; c=relaxed/simple;
	bh=sBwnRZ82yznopV4VzndCL9r9yoI1AKE/zwXtiHogyAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7MNcV2ZPZHaTdXR8q5xPY1GgCLysRp9pUjyeOI3wOIiaM0cFZiKxcXKlM4NbX6430FZ5biFGfVEAJUnO/epoWzI41tpxhbBpi0lJrBf/t4u7Kwo4ge1+bX01yIpkK8CMIoacNt5Tnfi95gHW6pt2L8L4HUgFSbRr95rfx+1AMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cr6PR9rd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWlo+lFc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr6PR9rd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWlo+lFc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQrCn2502601
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt0LJ6eALD8ioZ3HxdW86IyRNoctA5vWZjxiC/38dS8=; b=cr6PR9rd+gwEW48H
	bj/6AZd6sgt58duyvFPxltiBV6DypqIQSaq5yYaOGXtm3hOvXMwKbr9cy/z0v2FK
	kwORwmZeI02MsAI2p7wa3kbkUO8APq8P6fiSVnX464VefScNI6Bw51l+HI2UAMhk
	ldbeX3IOckp0Ar2nMeHeYtF+tUHoY+uOApeXYaC5l0ig/OmfaL+465P/e6Unidas
	lcRqUv/33CKtpO2rFmlYwr7aZ7awUXL9uFOvdqF+cMUK9VkS5CccqoXz5i1RN+Cu
	Dh7s72aY1TR67SXJoN748LAHQTRfjDzNZFcluJ6PC1rP7CkprUqFd0teIRNxzY7V
	hI6LBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsrxr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a87ef9713so71075281cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640078; x=1785244878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt0LJ6eALD8ioZ3HxdW86IyRNoctA5vWZjxiC/38dS8=;
        b=NWlo+lFcSvPSi4EYQtxbC4qir5PInAq3/V5Aa47LWGrbLpHVTXiU7OIQHVubumPTOO
         coiNuTcYWa453pgHKbS9UMMfmbOhOlkwXeqQMkMhXo+XMVe68lS5dKjuxWpXuJtBvZfT
         gOTyxQWCnT32F2Q31oEqcJVAlbTsbHinRGLTbYNS8E2c/UDS+nW8nA5SzFb2bDj5Zh9/
         wAdOhw0oF6dp6KRLauKtH2Y7B3Q4ogd+7+lEobtM4anjtGZfByWFsv7j8tNdzgnK0zMi
         TZksdlvcEVhO0zMN16h2x0/9V6ZtIG3tQmoy0fAHshHrXr5gI0v9O9MACTdFx7bINnWZ
         L/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640078; x=1785244878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt0LJ6eALD8ioZ3HxdW86IyRNoctA5vWZjxiC/38dS8=;
        b=adQCtFIVlEdDuOqS9ge+9AO5/vFVeTEp+YJ+iAIe4IbgyRiUIgdMviXbrv7/r/vPS2
         DjIxamYhjXXNwWS2dpupDwpI58WwP3rPXwmtDXXUuPoghtE3/0tWY4hey/1yf9/B71Bt
         vOY0tul7gRhrf+F6zo8MIJe9OZhHPH2qob399OWy7XIjUAbeMJnYVOlrYJKpIrX6esND
         qY2eUiVeLNqV0KE0zparY4KITpegW/jNRxrXEUXgdY84hfwyKIQgJU/i5+WXsa/tUUU/
         uckHsC9fsQxsmEfoe8oaukwB1igtzQEzgaO7KMDerT5VpZGJ+dkPK67NzeNWgRoZ164T
         nDRg==
X-Forwarded-Encrypted: i=1; AHgh+Rpv9V/ta8v+6EP3rTmHcSPFLCUGZW5SN71kjoBnCe0350bPjvPkqXtI7GoIpvtY9IkCliSaJoGT23awT/P4@vger.kernel.org
X-Gm-Message-State: AOJu0YxgEvbC1DI27tqtMWntEI2zXLbkRFu0yYsuWHMzemP+BLlCFBRR
	mKHXa1Si8w5Z5guemnixXUKvqYEDaZEX87lXj3HiPuD/d3/HvVjNlHGcfVAh3kLfBRc0k/TfuQw
	KMzBPePL5rFtjBXJQkU9xwPhGqFNDnfrTvU83IOKf0cnzZrYdvtqqcnbvqhmoNXAykhRe
X-Gm-Gg: AfdE7cn3JT5wGN3iWqhEH9vnVP1dMenuGEZxWAPYCp2/Xj2Nn7iV5hxW7kYPeMmKGka
	AAUExmCu8pTCpZT2GlRJ5KmBohmI7sFmwa1XqDxg+vQDS5YJme/3758+5bOctNHbhFLL2O9GS2c
	NiS383WfspLUz3MY7esq98dMl8ahbXRCV5nmnv17l347U8r1F/Th/mYIqJI2Khy1KK3NlLxRnN/
	HSThi+e3xw6c1Sj80QfkqdjStAVg9etKkQu7fg742eOUihDsObqMj7eaAcYS4BvdNpESL1om7Ka
	jQ4j6l0fWprPfmt03N8pPTTzFmojO2XVrmCajzZJYh3wBr8Zf7WYUM5e2hKlOGOeVNRJ6IcsbZp
	q1TXypRbo5DrdYZfCcqCR3JC45N6vDatMVjTmM4JT9hfAq6vR8efMfbI3yS2kfdcRPlfy5Snhlj
	1JJqsD4wwtLibyyqBX3nEC8cBeOCzeei8vE+If15aYiZ8dBJhiqSQ=
X-Received: by 2002:a05:622a:5909:b0:516:35fe:5524 with SMTP id d75a77b69052e-51fbeeb3240mr219126711cf.5.1784640078393;
        Tue, 21 Jul 2026 06:21:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5909:b0:516:35fe:5524 with SMTP id d75a77b69052e-51fbeeb3240mr219126241cf.5.1784640077729;
        Tue, 21 Jul 2026 06:21:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm598326066b.34.2026.07.21.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:21:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:21:11 +0200
Subject: [PATCH v2 4/4] media: qcom: camss: Report hardware version via
 media controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-camss-version-v2-4-b2440d99085a@oss.qualcomm.com>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
In-Reply-To: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 9kgd_RD43DLaQ-0VsgQaCL35Gj1PkZ1j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX9wzR4C7njBGr
 bgSOGbJvIO4V2vWun1JWzJnAEO5P82PAOLibL24YyiCtDMAsh9fK3cgAf5oqBZAdXx50X6Xb+ep
 Se1yELYRXFbanEQxPu0mRTLXov+VIm0=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f724f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_VBxEyf9HguAcaXgWQEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 9kgd_RD43DLaQ-0VsgQaCL35Gj1PkZ1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX9N7jv7GPWLw5
 +AiQwCvb9RQvRardK+jkY4gytIatWHrK2U7bzUzT7FuXWw31rWEcdd4HAkQcwSBWRPf6uOiyvKr
 KPuILENHrvIYr7VP9EXu+j+kLsvOtBl4lO9TmS+lbF3bDTghMxb5o9h5Pv25q3O6l6V233vZW9I
 gr2aJyw/D1/LCtY1RkXUiDEUsDBqi0SZKGOheqscyIj9UEEUv7zNjlphX1iANu5PmUoIcpOFcdI
 A7pJzgfBWcxglJc/l7F0Ki6cB3pAKC6TmgxQ8w+XHMm0JR+3/gWK0eoJa1qeCtRY5sM7u4FIQcx
 9IUHHMqVLNZMDUw2TtHAZImvcMeldejIpJE52d9Cj+uqForjF522s7dRk6S+obMAYPYJpfTmrh4
 y7vjrJBCqtbTzMAXZyEll9dBv0Xz8OtUqiQFSQuivlNaSzJXvuu+hrCgnaaZGKkaqGFoPNVH6F2
 ny932/TPN5ENGkJyhRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210141

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
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 40 +++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1f691b8940a9b3d8a9c03cb3159ed711d0d18e77..caf11ea21a60b5e10644d3daebbde7371d549ff5 100644
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
+	if (!camss->top_base || !camss->res->pm_clks[0])
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
@@ -5456,6 +5492,10 @@ static int camss_probe(struct platform_device *pdev)
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

