Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213426;
	b=lRHodVyTgUt9704Uuo5NBeeZQbhUjkcEG8cyVlB5qbk9vKgMfHn2UdTspZA1+M8D4yer
	 F0L9qCVbXGTZmjc4IVHF55PMffJTXxs0f5TwjF6fINx8dSSj9+bButqpcYZKcm3bM/ApR
	 km8M1rt9bNSsepBlI+a75CBm/ir899f0XU2rKv7v8VpSYZADJ96NoQABuqswry2Vvuydi
	 fdHF49zdKQryjcuKB96vDyq8CzKJSIJ/KP7mZ614bkdYDHLE5k4HOMKNOaM7BdawXN8+7
	 sI7//Foczb8yJj7VwZS5QPgaMVC4aQokObA57H/gIrGD+q/fE8hzw9Stt1jIvdsTSog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
	b=LGRDcjgjZNGpek2XTftwOBLp1aDpFfVaklew590IW68DYYMoBEIfvMk+dgqrZRJCzQ4n
	 tg3VlO0C/4harp0tJ+eJXEkj5ebBuKU2TqIOTHHCOjREvr8gxTmC6mxgGvungrxxlzQxI
	 hr2NwAau2U7Os3NdobcJu0GTB/K0Ye1s3s7RAELuhvZcvSaP7d1VAjnppvCQNr8vgTtTi
	 B1VW6r2rzeOuvtqYJLd38iQ3D0HNZBheuHBFfD9zPxehOPGjZxpo6SALZzAakCWxun3x3
	 CuVeCj14fOuWrIYtQpjOWY4RpcZw88z/8XdFM22nkE6gEo0oQivOgBbwkzxdLbbNA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnKMZmGt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQqOh8sq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BABB606A331
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BABB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnKMZmGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQqOh8sq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96ARLg2007713
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=; b=lnKMZmGtCPDBiFDV
	O+2J3/bw25IP3lHVDXfZ+xEfGEQhOQfAE2kr9LyOa8YLzd+aKMP6uQKrpzHYdXDQ
	K+OhhRyt61g0L64vXr3sGCow2GbkPU0jGUekTLJSwhTwMMRCCdGepvV/LaLSPDDD
	VVujFEDpsPMVdVT0pb0YGUrTEknGGNFmTRE+HZyLoragy+4Cd5u6Y5ZoTnybjp6p
	Yxq0401Yo6/L1yap0VRCQzxQF2fbqOaK603Wv0Jt69VZHx/Fiy9G27uBvTgnLBu2
	/UrpqciPcTtr36VL3ZFADZVjLDwowhKDjVo08fBvXStABN8C3ZwWtshmRJVgWFsa
	XBqQYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k59p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:37:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-946811b8f8cso55490785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213423; x=1794818223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
        b=dQqOh8sqsOjkWW2uSoXUxMqcj+Jwb0t+OR4h7QmDMWi3OElO9CmwVvZNcBY0zD8f6u
         iJUbcXzkqvrTg2Ic/DA20F3NHVU5U6x3kpyRFUo0YS7FZwCNNeNaEjOsqjdgJksv08zM
         u3PLVc3vg0/H2Z6Bx/Q795EujwASItEH9YthlP/3i4p2J0tyVSrv8+wnfa+vKMlsxdOM
         wd1ph9P1vV7+HuelOCYkCIfzE+DD7w41vhsj+/HKh4VLYsb+GpVg+HInxxL1nvuGvQDB
         5/MOTzTuWVxnFLxzaUC4dZ4U7n2Ell7gkWMg1a2EcVQ/5YLRCirT926HtEfXZ3aQ7pD6
         QQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213423; x=1794818223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XtxpwepNLFe4At2B+OUT9XResQf2iFVDrkaX3oWwYA=;
        b=BAIR/ybOLJqwu56Kxjf7uczimZIoLxOBoAThPn2Yf9Nsp4xsy447rAV0vFrvIpSvXm
         WkPu6/3xXzurzOBdMr68ZeCLTVwEla2Gwl/PYC0cyqYXO1cZHLw6FmWJz7Gwr5BP0qb2
         x4TcIaKPhLl1NJqBCg45aG+95Ewv1rZgjfwJFQq1P1k5hMOK2AWmS77+ZGq7FLUGw8eg
         A9ZYxawDyInA/g+YOTpZuCVx9dAp+QKN7yNdXs/V5n+eJ/KbYXYZDwybvBZBXB2gzWrw
         XkjHQ1nsPcxY6zacYJ3aRKWuaGVkO6mgDj4tSLeMzZ83QA+FD9iJdBlDiFQYPCV+1ko+
         5reg==
X-Gm-Message-State: APuU4Z922UraREgu9l3yNxovvORBF4r9Lgto9yVlMY9KDGOioxCl/lBs
	7tA3yTfd7yk2Tj30+XinrqdkV6JiclDGxYe2ePHtsqxmbmRr5eogRbQpUFec0aUV3Vv6cWTipJh
	OU0zxPrf3aFmTFHaVPdC4Fbrfht/9rOrDUORJpDgcAg0he/BOGNi7xXPVnZ5i/P92GvFXvJpsqU
	1yRnE=
X-Gm-Gg: AYBFou38kFhxQSm4wJtR/vjtgNpDpZDPI3RhNgLbhQyYCctgot1RDSQbzlsCtlMcQPZ
	PFNajzwAJV7f1hDVxcxsez0nLYjczcTP7e5g81c7t2zs4tnSBquqyA9jdqvpQ1or6NjwmfzH21h
	YhNlXEFLeRCGZ/CmLEKdup70DrMM7aoqfaNrFAlHd5aKYldmy5RolpO/0h2x5axBALgIhonGLcG
	ZyMSPSQXgfXjLvaxhPvb0tLr4tiBNxaKi3H2HcpDD2cMorZRfPpigNS5PqNQ0+qAgAVEVdxyfza
	9vRJcqYedwFBSNxE8kfs8580ejFmEu74A55Rnp2HRcAivm3ftkTE5Ux4GiRXX/wP9shZGVjt77k
	fQdJGYUxhquedhuFze3Bj4CwAZmAoAgtGrLnbw0OBHkUqr2+zPTNlJXfWPH/NyZIU9V9AKDqFX3
	WYm8Gv033rq7mArhsR31aPtDzy6oWeTffjby4=
X-Received: by 2002:a05:620a:a986:20b0:947:920d:3408 with SMTP id af79cd13be357-947920d3502mr120149185a.46.1794213423304;
        Mon, 09 Nov 2026 00:37:03 -0800 (PST)
X-Received: by 2002:a05:620a:a986:20b0:947:920d:3408 with SMTP id af79cd13be357-947920d3502mr120146985a.46.1794213422839;
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782dc37e5sm418223385a.34.2026.11.09.00.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 16:36:36 +0800
Subject: [PATCH v5 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
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
Message-Id: <20261109-msm_gdsc2-v5-2-4a3159b5e4b8@oss.qualcomm.com>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
In-Reply-To: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794213397; l=2690;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=k4/w0ByaTXPXsf61RAe4GLz/Jc50aw9jLRjtqxw+Tis=;
 b=jm/6dNLOk9BQB6T4YigYCRGN5rjJDhn5xVlksn8EDet1BPVk3o/WxOyDPoNbrLiVSarhzbAZL
 DRv1xuJkC0MCjBgjnFntvfBf23OQYChfU4yNnGqvGROfVkRJOaa72Qr
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX0z/mUvtMLK8P
 L+yXOA/eXa43XKgvABF+OWFQUd2rtKx67Ld3U2vEC27kHVHDgHavUuaA4oIHNdruGdVzsXx+zjt
 2Buqe4h9mcClNIHo/rdQ+BipysFqJ3Nw3KnrBuZ2kU37X7MgQ/zE/mj26xcHKsTTLl4RVYkcBU/
 8OkFVC6UhPVqVpXP3UK3kWpMJq+pjSHOKBNFaZmjP7lSLxiO6Vg72tq7DaiC1vFavMZ92QTO364
 z+21IJfTJ9Ekm6Hzn+cWSOFQJV2iJkTYvy+X2Y43QqaMcFt9gulixMG1lr3jtCj1cWCKYRNMEaY
 YU9RkDgeaLcZGhCmQiTJfJEuNRczx5p20MPWEdYFq3mLAFuDtZwJaPcZULuPRQpcw2D7TXFEedc
 6dP1crqm6u+r/sThfxyruVL6waU06D9e+qUYfkP0R/Tg+8cVHTn4KgAIDVVUTQSNxsgWGh9FERd
 m2lVVRu12n1jLPdDuoQ==
X-Proofpoint-ORIG-GUID: Bjjq5aBVGI3DXhx8sYysPz3DMNbo0lVh
X-Proofpoint-GUID: Bjjq5aBVGI3DXhx8sYysPz3DMNbo0lVh
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af18630 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=hNyr2f_ZztDnRCZExOcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX4Nq2QV2H88AT
 ki6O+OsOaxqijBJgSjakssI8CdO2F0ZaachqmI18ZybvFtRR3Vw6UgFa5OzHks2hYQ3L2vOvZDR
 hSuC/28MZ5NntlTzNw4ubYJYtWGFyyg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

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
Tested-by: Joonhoe Kim <26rote@gmail.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc2..502e50ea5acac 100644
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

