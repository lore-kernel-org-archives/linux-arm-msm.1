Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3563ABD95
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537070; cv=none; b=e12BDJbUZrkvR5Z2D921yXIsFJ3wYkSx03NY94qZogQ9amwEyipzsq1M4GKv8GQz9FD1uwdaHnvFWRANZmaMbYZ6/Y89PafWAARjJrOQDPXxlv+YC/ze2KgwFVdI8VD7uzxIY0opcHGySTZnPcN4N2Zmkk3seWtlW3EAc2rPchY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537070; c=relaxed/simple;
	bh=av9Af9qA3AYN0apNWa1HvbDsYAoNsAS/A1GCOMQG84o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2dnfxsRWxJU4t8WDc9W6otY9Y9B5DYFOcIRj847SoBtZu2gEyz6rJzIU+TVhT7kY5QLQD+eGtcfGwu5GIpoeWok/5dmVs/CXxb4oJap9poVSjoqo+aTY8LmbmyCXdBZTett3+jLpYA8EFvsulypJAqn7Rhv0Tj/bo9Qynp7HPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGMJqpy5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HXSyL2+u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGMJqpy5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HXSyL2+u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YNf12044281
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmZRJE3QliI8ngRIiweIPhnI7WNysb4MqIkWbp6/7E0=; b=EGMJqpy5bickj1U2
	wqpYD6Mz/+LG3HGmNiikXcYyegf8lJ1s+gOgwpUdvB1hBNAZ63AILLteSh1aFWIS
	Wgyy79mDvEaKoI84LSC6nHkYmuqPh5uRCADez7isy2IEeLxDlGqP5zVB634nnPCt
	Skrc89jLWDcKDZTHq4JykbqtN94xX1ZgNXlD+W49KCxmqcGzkI6AKS7YmlEa6V/F
	PuMov1OfUUSfNjYWpqAgR4EGHa5qhq5mxkdoj7/A9/6WMpxXA1vNBzRihrhy2Fho
	LNCJN6hXP70WiTF6IE0rKE9fqzxtgEgfSP4+oclUBB5wTsdP7DMm4e9JKyTP0Jyz
	rS/ukQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcg8dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:44:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90788be4315so4771446d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537063; x=1785141863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmZRJE3QliI8ngRIiweIPhnI7WNysb4MqIkWbp6/7E0=;
        b=HXSyL2+usVG4RlX1hCeE6V8uyI/6GQ9Dsisyt4w3k5fT8EHMBLhHzBTYPCSkJShef6
         c2s9tYx5LkBBJWiX4qVP02EGUdRBZGiipCk1N+nH74mid47uQVX5Z0r/MZE++ADO7sdB
         4l6nDbrhm+1m0+z3Hi0FieHYOeyDZXoRd7uLQNtUrkQcl0DntdMDPBlRmXkLSXEHhh91
         RUMmtbCNeYkvL+1feyTGvbg5AmSpbA74F0GaEi2vkYfVPx39FmM6cNzsVcH/oDQpW/Ln
         rGEyouQHKRJtF8skyOS/UpN7HzTdWx7BQ+HtN69kDYqWvYxo9+z4N6wyQ48CpVMjEJLn
         GSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537063; x=1785141863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmZRJE3QliI8ngRIiweIPhnI7WNysb4MqIkWbp6/7E0=;
        b=PtoVNx6l9SY90v2OtozIhfysU2k2atUkjrpYCb4C4erkyWQJnycX+T1ZIuyq6hwrEJ
         9QOyjD9igAabmRiXrdsQHZdECpmN1WbtRlvHlhkiCPnnpVqWGX8wYFNj8dMVf1wzGYW5
         WJ+kIO0VegkDxw6zbFAzXrBRQ+HJVjdt5wiSXCcFGYtvaR6wqv4+WkN5kVVoQLF9h8nR
         A9ygcrGT9VG4QyQF9hPSDhsPlnL328z9z8SPN6DAQ7QrRU6BAMPMUSb78L7tfjx+L8hB
         9wUJhAAJMe0EUVrmULewum22vUZNFIAa8oiwzDayPsmTMjGwEn5sHrU6EMS7l1vkASwW
         Rczw==
X-Gm-Message-State: AOJu0YwTwYBszf+7zNGcnSU8XPalqsaXNxBmGW+Xa3NyjIAhTDUuhMzi
	e8XNPzw1j27Tx66HxnNUKfJOQLqftfHSs6Zr1xA8YrKTkIA2zN6pCjkhNgWB8Lh6Xh4CuKX702i
	2p3j+FVCv8kV9oCweSIs4ERzWKqLzJ01MWKhW203ZMCNezgM3V/a25fMUJslZ7lPaIauV
X-Gm-Gg: AfdE7clHBmKiXf2XfxmV0wyCFGL/8ruSdEelxLerc+RFOW9T14MJamt2y87gk+DztgJ
	u2QOayz+uXkQGmqz8Wcd6e9r3PaBu11B9hxn4Gk5UAGSLzRzjanv3Q9nWoKKnJs4Un6iVIYg4KI
	YjBgwk4u/oViYWHSH3KtVmXwwYv/WWBDFWDOG3lSNKIxhvlQ3zCrH1ZaQMIqiSthIxsvy9EB//E
	UnnzYR4W8+OlXLfMiQjRDrGanglDCtJQ0MTEwnXpjbXiYxdpzOROnJaNUe1QtulIATyotUXdz2o
	rMxA9C83zPzHf+JAWxC3BFVxa9PAayiLQr3NgEWk5Z2tREZFRw/5smrL5e24lLvrveV0cntZG5e
	nN3fLuze0PzRhdCBJATW2t1/Kdi3j1aJjSQgLqB3P4pC+nGJ9oD15L3N8zGPEZWo=
X-Received: by 2002:a05:6214:400d:b0:8dd:d13a:8c84 with SMTP id 6a1803df08f44-90778310a4dmr138933866d6.8.1784537063453;
        Mon, 20 Jul 2026 01:44:23 -0700 (PDT)
X-Received: by 2002:a05:6214:400d:b0:8dd:d13a:8c84 with SMTP id 6a1803df08f44-90778310a4dmr138933686d6.8.1784537063073;
        Mon, 20 Jul 2026 01:44:23 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871f650sm87061716d6.45.2026.07.20.01.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:44:22 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:43:54 +0800
Subject: [PATCH 2/3] drm/msm/mdss: Enable INT2_GDSC alongside CORE_GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-msm_gdsc2-v1-2-4687866d6cb0@oss.qualcomm.com>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
In-Reply-To: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784537040; l=4105;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=av9Af9qA3AYN0apNWa1HvbDsYAoNsAS/A1GCOMQG84o=;
 b=M7+jWI9nwqNMj7No0I4fwFmPw508sY6MGQZXxwx4HRg5+Gxw2C7V6UwlFoWHTyj1PllZFQLuJ
 EIGc4pTbn/CDzTDxo5E+tcOczC4FerzgzxkDoDNjolTBGyBX2UUE+Rf
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 9aEoG-0_DgPF0K4S6rT8S_lD-MGjDeDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfXxU3If9+W2cBg
 ktZ9TfitCcYf7GQ1HsKjz223MIgYxqKvi3hOo/ojNLvHvPIN9c07n43JUNtLGNl6YEeplLHscsS
 Mv2HhGEyJ/92w0klsAyOFQkVsAtGWE4u7AiU2vJhJPQn4LexxsCQL6xIjERz7l/iZ1zS53fQ5SA
 7cHePz23ASgIWos8BqmUMqI8gSJH5yVz0jZSXPHF39whRiva7MJW1qWXwyg5XrPcS1t11z1KVQi
 2U4pUyVONLLMU2CcRMW9OSRbxMes7SKfq24D2mm90lnms8AKC0oyV0H1yV2eabbHyy66mAG5O+h
 T4DiM4GtAYUM0bMmajjRuM1X8O/juPO7a2qf+9Qa1d9BshiKbe2hcnPqk2GFcC6CRUKqRGcTf7k
 81Y6Hz3XAQXrj1v6ZvodwntPF/FbFsheGp28/ipum9xhS0eImCUd6H5/1kX/fk0FHAdsZQCLAoc
 fFO+vI1TI1OPTlSiApQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NiBTYWx0ZWRfX9Ur9wy6N+vuQ
 E6ayfYTcr/JxCpvTC0m0i+2vBRZXsD0rAvqy4g9Me8aGomghaQrAwQWEPHXipN+6h45qY4V+o/j
 ot3J02vjpRn5QoL3arf4ay0r2jvMGS4=
X-Proofpoint-GUID: 9aEoG-0_DgPF0K4S6rT8S_lD-MGjDeDm
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5ddfe8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=f82__hHJf2zzz38AdHIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200096

Kaanapali (SM8750) and Glymur use two display power domains.
CORE_GDSC powers the main display hardware while INT2_GDSC powers
a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6).

The MDSS driver currently relies on the default runtime PM handling
and does not enable the secondary INT2_GDSC. As a result, display
pipes backed by INT2_GDSC remain inaccessible.

Attach and manage both power domains explicitly and enable them
during MDSS runtime PM activation.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 53 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..63ece55c4f2e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -13,6 +13,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
@@ -44,6 +45,7 @@ struct msm_mdss {
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
 	struct icc_path *reg_bus_path;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -233,6 +235,21 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	int ret, i;
 	u32 hw_rev;
 
+	/*
+	 * Platforms with two power domains (e.g. Kaanapali, Glymur) need both
+	 * GDSCs enabled explicitly; the core framework only auto-attaches a
+	 * single power domain.
+	 */
+	if (msm_mdss->pd_list) {
+		ret = pm_runtime_resume_and_get(msm_mdss->pd_list->pd_devs[0]);
+		if (ret < 0)
+			return ret;
+
+		ret = pm_runtime_resume_and_get(msm_mdss->pd_list->pd_devs[1]);
+		if (ret < 0)
+			goto err_put_core;
+	}
+
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
@@ -255,7 +272,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
 		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
-		return ret;
+		goto err_put_int2;
 	}
 
 	/*
@@ -276,6 +293,14 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	/* else UBWC 1.0 or none, no params to program */
 
 	return ret;
+
+err_put_int2:
+	if (msm_mdss->pd_list)
+		pm_runtime_put_sync(msm_mdss->pd_list->pd_devs[1]);
+err_put_core:
+	if (msm_mdss->pd_list)
+		pm_runtime_put_sync(msm_mdss->pd_list->pd_devs[0]);
+	return ret;
 }
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
@@ -290,6 +315,11 @@ static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->reg_bus_path)
 		icc_set_bw(msm_mdss->reg_bus_path, 0, 0);
 
+	if (msm_mdss->pd_list) {
+		pm_runtime_put_sync(msm_mdss->pd_list->pd_devs[1]);
+		pm_runtime_put_sync(msm_mdss->pd_list->pd_devs[0]);
+	}
+
 	return 0;
 }
 
@@ -421,6 +451,27 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
 					 msm_mdss);
 
+	/*
+	 * When two power domains are listed in DT, the core framework does not
+	 * auto-attach either of them.  Attach and manage both explicitly so
+	 * that INT2_GDSC (needed for VIG2/VIG3) is enabled alongside the main
+	 * CORE_GDSC.  Single-domain platforms are unaffected.
+	 */
+	if (of_count_phandle_with_args(pdev->dev.of_node, "power-domains",
+				       "#power-domain-cells") > 1) {
+		static const char * const mdss_pd_names[] = { "core", "int2" };
+		static const struct dev_pm_domain_attach_data pd_data = {
+			.pd_names = mdss_pd_names,
+			.num_pd_names = ARRAY_SIZE(mdss_pd_names),
+			.pd_flags = PD_FLAG_NO_DEV_LINK,
+		};
+
+		ret = devm_pm_domain_attach_list(&pdev->dev, &pd_data,
+						 &msm_mdss->pd_list);
+		if (ret < 0)
+			return ERR_PTR(ret);
+	}
+
 	pm_runtime_enable(&pdev->dev);
 
 	return msm_mdss;

-- 
2.43.0

