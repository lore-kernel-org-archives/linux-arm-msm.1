Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743229;
	b=vnZatFmaqmEzS+iHJg6D2V05PBw0Mzign/eEp5CMUIcwOazx7fEPqsGRjcAnKk/4Sr2U
	 TvrRxEbPoyWgh+dtPzeQ23jiX4cxujmVs9gKhanH8u6R5/WCklBqRFTwfK6O/PMvTgnuB
	 06PKfPa4+pnqcqbLR2rabq66zVAhFdppDHdyuvAj/m63ETp21yTx3wRD3lKlsRJq7MU8j
	 XFAvNubsiXbS6y5mybqLM5juGkaD6CRkRWO9WxNAPF2zTP52T4HO+B4y6AxtzoFHNRmvq
	 0lGLzgzGcvMMq2XeKV2Ds8wbXqdUnm/yvU/m47f2GMcdWttmLDLZEZ9gEdoxxfenQnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=;
	b=IYINQwO9Fs1a6CXLT4ZvmV10YzPAn4Qb8FL5f4GF5kbG4tBibr77e+S6pjnlhYO6CcBl
	 TEdKPE8xWDpgMaqVS5pCq1OErET50bwp/vjJq+wwLQ6q1sKXbpNiSX8cpe28BZQnp9crd
	 krH9gGeQT7k3Iz7JHaIvsb9foV5DTwo4job0uutUp9kvsim7rmLxMhHT9jxI2/8ORP3DB
	 px41Ej0hGj5VRBTxaxZWLRZiQY8r98pE6E3tXg2x5/9ViSei50QHb/p5Rusc33ef3xUqd
	 5+H3PbH04UQ7d+8ix+5xRxVHcqsmg+v8bJxAOgv84uyonr2oR9wcrXCNS3OY6bBvfMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iioMTg4o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVZRVUoU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7360A2614
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE7360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iioMTg4o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVZRVUoU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FO4W1552889
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=; b=iioMTg4o88vJrWcv
	qokRQnEyIhyuU44Boa7MPEdCF3bSrIJ6ki/z3lSpw33Tx/hPvDe1xupsKvo6fDuL
	A3M4Zlb0NusESGvdEFRg6gS+PeaF1iVcRVQmV+P5aovWt2GLa8oVBAUu+3Tia+xR
	fz1XiUpXeiWQGFsfFcpZMI0hhZ01C4m2v6gNuQu1RZatkkH3sXd2F8hn0JEZUoZt
	K4JUTSx1Ig4MOgpm6JXu/4+M1bIOfs0B5O8AILTdz5+8sDSCIpl72Og3jXo6zzH8
	el7ZEsBJrAwHMxfmrrHhULrC3lxDdtZ2WopG2ivo+vTOSTovZr7IOKmq74Vu6muF
	9YjbQg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttndw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:13:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a2de2cc1so8713186d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743226; x=1793348026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=;
        b=BVZRVUoU99CYL8GUihSOINAJKWKlaIuFQjEDA+6iYCO3hsln1kTQ4sebYZV2+zXEPF
         zPMcRgK/YhzFriwDGWOHTJiCetYn8lavpn49+lUseabBHH39PYPgVTldqlbHywKWsI/p
         +AFtUxQBrf6yGPkxv5QkNLuEd5jbsftm3PZkqwJDLv8zQsSKtVUHsz0fWJP89AoK/3SV
         M1qTBU7wd/8jAZqBoKVOEjV6N2sTB5HzXBnN6XAvCJr0POYLI2WgqVyixuUeeHukJpyb
         SmO+Kz2iK0/7soVhuCc1kKdSMidCoJODPFjoscQyhVDvKu5GpDKt4duakzeFqNueFEvv
         QGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743226; x=1793348026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=;
        b=Q5+MjH+AuadDRjxqURNrgnKOGrrlsFQdm4Q7FLQG73QxufhZ9r3AKYK64MFoD11jto
         /Kyz6PrVRaNDwvqvOUPck21gYDqV7zuhCkS8Vt1LerZx2hsUmXsmYogGuy2og9gcGkkD
         GbLicViccmSLKHBcjelq/k0jewQV0PrNbq5kqm7IUzfgxdu59I56zWwCYtVxpIZRD7bk
         DUjRXh9SfpsAeOnqDjcUsLYe/YZxSlh6Ip6kAaLYDTTms2ne62bi0BozgPZP38QXEsz1
         Upt7Us1mkXZMy82nb0BWo6j2jUw3AgODAz7eLduVN0tzrktPONBs5poowzRtPhA/nsbO
         V6XQ==
X-Gm-Message-State: AFq9FYJ9AgAjC39gELCw8G1iSfeG2SxiC8JiWrHqAUDDuo26ZiarTYa5
	geJdlqsKGig/52h7ifHeDLlNFa8T4CuSEO4RrNWYyeL8CPulr2j//9nVfnZ//Gik7xoP1wES4Iw
	oYLCzc+064hoRzHW2eZe9Bhe1hsaNs1UJelHOs0+ZrWi4Qmr0BCv/dwe3kTDnsHW8JNEy
X-Gm-Gg: AYBFou0iu15DKVk9fYBFMN6FgSfVlvlIYkTn31h5CTz+xeykA3aH0HxvEGxH8lUi+Es
	jffuL4r/UPJ4RuZ4DYmkrM5bu4wmeAM6nrLvqu1gHlX57sLto+Fq01356Ss5agXkCxS1N8IHeKa
	wndTxo6CcovqiSWjKdsdJ6Jm7BFSvqkvccYIwgUiJrIPFrEcSfGDFuzYyiPNNtIKImeVAFLbAZk
	4X0FqP+B9MV+xZ723dof+Jek4te47H4eydnIeqYzDvo8Kbn6ebOKIiYOqOAqgKXroU+U9gSkh2j
	KRHXSTecwuD4uRLFy47H6jN8SKeJoIF9ePodmzKFAYCLJD6Rnq4bsAXb0ZBMD4YmcS2OEPBd9IR
	gLeztgvt3KSuvoxYW8xBr2EQR6hPjF2YgOO9aKrgL9BGc10z8pOmvb51fkTQFPg==
X-Received: by 2002:a05:620a:2b81:b0:93c:6fd4:467a with SMTP id af79cd13be357-93f6f79e874mr277238685a.2.1792743226159;
        Fri, 23 Oct 2026 01:13:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2b81:b0:93c:6fd4:467a with SMTP id af79cd13be357-93f6f79e874mr277235085a.2.1792743225628;
        Fri, 23 Oct 2026 01:13:45 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396af493sm14345626d6.9.2026.10.23.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:13:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:13:12 +0800
Subject: [PATCH v4 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
 Kaanapali
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-msm_gdsc2-v4-2-40b6a71d4e3f@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743200; l=2645;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6TSsqvMj9lDcUSrMsfgqAH+EDW5aP3WVFlch5mtFZ+A=;
 b=YxqUVnVMz0zHTCQ4ym+KlaNtNhpZ0/b3mrjirt1Shk0s/UWoPnLbG91jqQKbAk50s7p8IBIwq
 92yj4vz7rhsAN8tMn/GOkmbj/StNIrEJA8iYLXZlWH/cF0gO2gHnkIB
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb173b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hNyr2f_ZztDnRCZExOcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 15lnNpaosZoqsAC_b-wC0HlCuUBmxj9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX4ng0Dlh3xfLe
 vNSrwvw5EZa4WTya6HAc6umgRfHvvON8G8q57w7YI/D73VmN/9Y2hnuuJRbZlvFXDnXZycnuVYw
 pWZFMnWD9IERrCOAGU6+jvHVmq0fsSWEQT5Thu1LguV7Hfq6OurzN0wK34LEOItSLkvi/P93Z8z
 LEkFm9d94cR+fHwWzZm+XPZAT4yIrWmtFHRp8vpXGgKaGPojJIFdTpvl2LiRXHWh1aluv0T9xuu
 gT26ZlhwftTb7zWpvqnGURb/p5lHlG+POxzPO2UpT1w06AsbJjyoTt2YOzI0/Dg1XlnLanVFG9H
 XvB+Un+2SBXBVWGTRAaVHEdVnEDlbdJ0Zpntpre7bXdIU7ZUqyAK3ZKZqGJs1Q5MXAFgWEedU74
 WGdWNm5Cn875Y0sVpGzZJmMv3JXVnqf1r20udYAkAFXsoUjMluU/kjtKOuyVCvW5iufdwu7GUQg
 +B5omCPNCaymr8eb8tA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX9EAH5JqzQXRV
 nYY52CBlh76aBfemw++XjFdqck8I3nWUdeEsk4Vw8b64VTAzeKAyDzLYkMFcH/8zxV/DTyx83yP
 UDrljG8A8vCydZnBqY4ze/Kpy1jrUU0=
X-Proofpoint-ORIG-GUID: 15lnNpaosZoqsAC_b-wC0HlCuUBmxj9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032

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

