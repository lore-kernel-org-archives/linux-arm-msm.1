Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017F3FFABF
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791952728; cv=none; b=hK870WKpgkk/C/Owvd86m1C9XlJPGGUyHMODiR10plYNqq3KbrtLxqtIMTCFcWq7wYWleANtACwCm8IT+nIoMAEj09OTNwua9r3NjMrJuuT8Vz+CDJM4o+Z1TPuHjYp7+IYlY3ifJZ642tE3fPc78e8eWj7eWnH6fbVH+4CCEXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791952728; c=relaxed/simple;
	bh=6TSsqvMj9lDcUSrMsfgqAH+EDW5aP3WVFlch5mtFZ+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKb2zH103kV/Jw2AOHzZp9mqYVzx66FkHXidFKOWBnxUr0eUhuTms7G2WbQGsz+cvc8Uurv/4Wd8TRxqu5FQx8PMQ22WgRS+S8gQ2R/BcMmex1GViHRbqlTUlDEGk1u00NmpHeZ5NFbF8Ut3nJDUGDJZAZRw+8nuP1RvCCKKDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJJZ/i53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xar+O909; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJJZ/i53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xar+O909"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1ODl13017984
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=; b=hJJZ/i53cIo5+/22
	BeWvvPuIpu8u4RwyXQofeDB0F87/Rx2gzuIJagCy2D2aaVenUmW9UrBfGvsitGt/
	+JeE6hSuLH3zAI8l3oP0z0wv8bnxNfvfnwUKVfAAwBHplIdjlYyc/E4lfcD1I5CW
	s6PUwGEEB2tUCWpXRi9suuS6NeICUMIGqCVSzlfrIpHP/x6PpeipfIlBpCA+TIZJ
	qnHTrC7yW9ede6IvH3mnoq8vWLDsVAok+rUgW+k4JfmxcermRZHt47URcglylPVm
	NA4TP9VSqQFWaHiWYiYM5RQnC9wcduUd+vMdr4OwRWVqnSr8ui4IYpZXICKBQCOx
	C6Dr0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b2dwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:38:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338cfe567eso77530211cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 21:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791952726; x=1792557526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=;
        b=Xar+O9095Pakn4R7AfujnlLQGhvkSVZ2I8ruhOakBRyklDXpLI9lL0NplVCZEouXT2
         i3ZBncFDI/1z1F2HfFuxONbi8lT0588lFytXICu1+ZaXMn+8bPeQJZxdOiZZaySrURiL
         qMWqvFpq4ndNOWvRsfXmtm58fcDzy8QunFgAu4Udt8fWlyjsM6+yYlXbCjLgUfdmhGmK
         6zzM+6PQTci48/xi/P0jEzVChLb7CPA5j0F1Y5ISh3h5NcReCWoXrFjluxKcYc1CuUPV
         k+xkkJQmMIz2wxyPFz0wwA/pJDqb18PcJAhgj8iu858f/xhajr0YzyCCpQa77RgR0yLG
         oQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791952726; x=1792557526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=;
        b=K8z9UnFBrVFqn0L+GB0KbmF/6Jm+wFEqjK5sM5pl8/uskpQ0PlgSSlCGrZ2/irDkjs
         BEVFtoVkPEdIpHYcsLSK3ExOYupaYGZtEg33hb1znIMD+PfjTH5KnQxGFtaMTY7MPQpb
         N+lslDMFQVyqeRV5S1dbOWam0gHo+cx0IUhvujmtc0BvaECDOlb2cQIXkJk7VHuqyg7f
         DpaGZau7haAyGAQ2GiXyKYsWfchw+CiqgLXinD4JeX+sP8Eb3QMu7obD9Y0A3NoehUDF
         hUFIk0eIhnrz1tOuiFPGO27w5VR40lQxfVXq3WkRVYO98wZVdOGpbw85jMLWl8EgSeb3
         KXZw==
X-Gm-Message-State: AFq9FYIqp9j++6uBTTSdTZsMxaimnFM68EX/BMpFMRo6bWCQpR88+GFU
	R+rQwRw8SdUNknMzZrKOh5PN88YoKlYebb9KRSYjAHGXP/QVT29G1kSByC7cdocl6ToePT3jOGj
	hcjueB2fOBpkL4T8l9wvLk2SCJqdDadK6ujR6eGGvHd3yoiDmGZRaxo5xycn9uKI4TTAy
X-Gm-Gg: AYBFou0R/7ytrJxk7oqTtlnnOsHh421amsxX0GGDzPC+Nn+x/X63tKt5ptlILjbmjbc
	8coh/gFTngnfzwEe77Hdb7EMiywJBDLxStg2PY+oYzxPCUyM3mj9hFhgjUflyX0JlY1+Ev9pQGW
	tnI9YjySK3CYO0jHBDqGGUNBnrEwIbynKd2Nf9WzgtQ63syoI5uG5+qnXwlPdffzokRWB8VVu2M
	8SIHF/6tSjJnQJtfgceIg/n/bswXDpBA3jHSrVOfOnifcbGaULbMIKZ1Aj+YTwdc3aQP94ItNvV
	E4YJANJeIeBct6XLuq9FGt7EHwtAp54PAllGYWbmx4LmUONy2Fmx7NxW/THobaKT8xYpazNiLaI
	iLrPCWgF++JEgKvHaac/gFcVwLhVl0UjCUOWhgsEQQnLeTy8EN6d6qW8PCEo+2w==
X-Received: by 2002:ac8:6909:0:b0:533:9826:a9ac with SMTP id d75a77b69052e-5359faaf08amr233599121cf.20.1791952725653;
        Tue, 13 Oct 2026 21:38:45 -0700 (PDT)
X-Received: by 2002:ac8:6909:0:b0:533:9826:a9ac with SMTP id d75a77b69052e-5359faaf08amr233598891cf.20.1791952725198;
        Tue, 13 Oct 2026 21:38:45 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b755c35sm116809651cf.15.2026.10.13.21.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:38:44 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:38:17 +0800
Subject: [PATCH v3 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-msm_gdsc2-v3-2-f1ed69014416@oss.qualcomm.com>
References: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
In-Reply-To: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791952700; l=2645;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6TSsqvMj9lDcUSrMsfgqAH+EDW5aP3WVFlch5mtFZ+A=;
 b=bM4X17ClG4AjBu26M2WaD2Ua4l2Ls36bd3kp2AEcnK/AcrUpMlMJ+kVuWGxgGbVkAJynm69vL
 VWTnLXCK2rkAmFycMAPQMqWoXuixSI19UHQrweVR9lojL6k008/hQp4
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf0756 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hNyr2f_ZztDnRCZExOcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kNIg_mGcjOKvmncFolmgt4FrV_9UmJI2
X-Proofpoint-ORIG-GUID: kNIg_mGcjOKvmncFolmgt4FrV_9UmJI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX10avZ/xcCbUe
 LXI6snCa69WunERn+oJCpSlUa3JmKUpQdB3W1jGdTYyWXNu53ZdWt9Nqz4F5CATzr30whkh8tQV
 q4hBMHRA8mgUeisqbD+QNH0kFwLd0MjE4hiZjbUJJku6ssguZdodCfPNXnr9hLDsO7Q8bVV3Is7
 8u2WUIlu5x2UNtmePh7rSGh6ZkhlTtL91YvdpgcRhDq1VffA18441TgmM63BvJrmLGCXLEUFDBJ
 hyCYPst+jDXuEGeprl6X5c8RzAXmIxbmb1tVa1jn4pI+Cpkl+Y6A1PgbD6OuFH3+kbK8OD9mrAJ
 /DrHetqrAlRIYltKYbTDdf+tMqRPV6YlgtIUgF2lD/g5IaDZBqfPBON9V4dhMYZ9yfN1e4vPbGF
 6XHHHFYz5AzmHj8SehBBbejs828rITWJj+gSU008inb70A87SBU35VcCeCu7mMH/8YBBobzi/5x
 DdN7cITvecOj4M75tcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxOCBTYWx0ZWRfX3D6lBBiLlKyy
 SWepzGy/ZHOCW3qgXjwPZT5X6KZIMIEuawr4hkFED73jVSljH0JKS40LHIAMPh7OF9pmD3JkNQr
 jbPR+ZJoVrAmh4cgUdimLoGh6XutOnw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140018

Kaanapali's DPU is supplied by both CORE and INT2 GDSCs. The
power-domain core only auto-attaches a single domain; with multiple
domains the device is left unattached, so both domains must be attached
explicitly.

The DPU OPP table also needs to continue controlling the MMCX
performance state. Mark CORE as the required OPP domain so its vote is
propagated through the genpd hierarchy to MMCX. INT2 has no OPP of its
own and is attached as a regular runtime-PM supplier.

Platforms with a single power domain remain unaffected and continue to
use the existing automatic attachment.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..502e50ea5aca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -12,6 +12,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 #include <linux/of_irq.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 
 #include <drm/drm_crtc.h>
@@ -1376,6 +1377,33 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static int dpu_kms_attach_power_domains(struct device *dev)
+{
+	static const char * const core_names[] = { "core" };
+	static const char * const int2_names[] = { "int2" };
+	const struct dev_pm_domain_attach_data core_pd = {
+		.pd_names = core_names,
+		.num_pd_names = ARRAY_SIZE(core_names),
+		.pd_flags = PD_FLAG_REQUIRED_OPP,
+	};
+	const struct dev_pm_domain_attach_data int2_pd = {
+		.pd_names = int2_names,
+		.num_pd_names = ARRAY_SIZE(int2_names),
+	};
+	struct dev_pm_domain_list *core_list, *int2_list;
+	int ret;
+
+	if (of_count_phandle_with_args(dev->of_node, "power-domains",
+				       "#power-domain-cells") <= 1)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &core_pd, &core_list);
+	if (ret < 0)
+		return ret;
+
+	return devm_pm_domain_attach_list(dev, &int2_pd, &int2_list);
+}
+
 static int dpu_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1392,6 +1420,10 @@ static int dpu_dev_probe(struct platform_device *pdev)
 
 	dpu_kms->pdev = pdev;
 
+	ret = dpu_kms_attach_power_domains(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to attach power domains\n");
+
 	ret = devm_pm_opp_set_clkname(dev, "core");
 	if (ret)
 		return ret;

-- 
2.43.0

