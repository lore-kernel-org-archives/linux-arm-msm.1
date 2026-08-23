Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E63AFD04
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514490; cv=none; b=A5nsyp5ib1mg0Ow6UMDmU1f9M8lkRMRDFXHrd7S1KCSMAuZyfUe2tezmNQlgLWxIfKdbPGSwiIiLDOeun5kifomVBdl+mEec81H2OuSiQK+Qb9spU0tAmYaRaLOhGLD7R81WAdAya2XEnu28GmB0lyKreguH30+NlQTtg7epqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514490; c=relaxed/simple;
	bh=yZHf4T0CLB4PjBjPpZVhgQRal0eKbfLeRuyb8wFOOlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hP1svnYj7vfGGVnD8kVmF609WdNm3tSSrh1AEwi6olJHCZn1ejeloWYvXL8OS5oc3sMz7d6vdzeJY/PM44JAw7utO9UHDj4+oRTMg2f0lae/vXPyXEQand4/8fyCQTGY335QoCf+YyxrQQ8Ps8ejY7R9rIoTHzzpKp0wZeF07gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etVR+Tye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JpCbO9Pf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etVR+Tye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpCbO9Pf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG7Fbx3406706
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssoNulhqcE9INTHbsFIQlnvQlFudra1iNtux3vGPSYU=; b=etVR+TyefsxuvRFI
	ZehRM2fVLcmOQefu6Rm3PEXXeTYZARj/sKeFoyKb7NWg3gv82rvNT6Nv1aaUC8pq
	JgyIQH2Yl/WwxyTeXPNpNaV79CWN6f3z+az/qdg6q6ELYLxqZbhv3afvLPxtQJ9E
	9e0XRhn/lLi4AKzSUw/v0A512h5513seakzSzPY2Mz8ZphCWxXDjrBZOFsBvW5GX
	tXp9rN9N2u1J3DQ7hfUjjqvPtzoPfs3zVrH5VDntVoN4nQhZbHsfKvh6sxAhMYj2
	6+i8kAAhCk0IXC32aa2RWw7cDdvjXDaHDqxVLheccwukbao3F8Rk84KQH5Fe2qMb
	UQ33tA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qvc8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84865f326efso2573785b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 12:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514484; x=1788119284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssoNulhqcE9INTHbsFIQlnvQlFudra1iNtux3vGPSYU=;
        b=JpCbO9PfQKUWdq38+vDr/2aCXoBUvSnpHEUa8jNwBX8ETrS8hO+VhCGUBr86kZYl7U
         MoGRZimo/eAYOw1R33QrLgepfQVgJ1toIxLnP1pffgc3POuzgMErncgmYeuDz+sZOs1J
         IWcNWGDqm2ZiA4saaopkcPjkM0IMSMxyTuINHb2vqAEfJxn4DSMeE01qcIbcYfQNlk9i
         hZfnTt8S4xgYYoOP9O4RLC3fDBuHhOkKebIen7vhUswL65IRKjn6+wssrhHUUIzcjL2T
         iImfX1mpZcUnugn76XpjTQ7g7j6WlmyPOfrDfPSgP2wnqA0zSLcdKz/mq1LCVFk4fhrx
         rQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514484; x=1788119284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssoNulhqcE9INTHbsFIQlnvQlFudra1iNtux3vGPSYU=;
        b=amL7Yg03p1QPfbrTsgxUCa1u6gGIBqsE1b8U1xSwXIdfhQJHlmzMn0vdBsVZHZjgvY
         gd0iM0Mc2lZoFMLl96iderpO30CP4GJQgaTA7whh33ShGkBcJoSJgfun+d09JLeIJ6dT
         zhSV8DSTuJ8RVBuaTBP5OYz7CcXKj11o8oM3q4LKfD3KH/LVR7U18doSiNmdZ7bcIlB7
         9oS4Cxm0nVuZBD+b6KY+6+xpmQg/dvGEPv2YjvAda6nOFYHsUpcaVjxXATECxpBn+Ike
         mcPLC8Ep+XLf9KhzhN0Mrf9NFKP2Jkv5Sm9hJ1W59NRkT7gRXtK0CQrqn90qX978YIoX
         VCUg==
X-Gm-Message-State: AFuF++lxKgFT8q790q1YAft4/jQDO6WsR2s7wwOKn3sWpwpxPxSKx9WW
	pEJuTedw7wIPAMa7jNqh/BHpm35pmprT7FUl2wdiUlS9thVL92nbSU7oTUn5Jx7NNgurXZVgq1v
	WpGOW4O+x3tT0hj8I9qvKE5KbUlX9asxkdJocGv3P15lc0VtgXix5JRrvNfObUWOFPs0BUSRZRb
	wU
X-Gm-Gg: AR+sD12NnvXAe+xMvEEz4w0wBuVwk4RTLpKGb2OFyTwkWQ1rK/w6ETmNeluLZDvW7qz
	gtLeMLVHxGNdtzGac/Ul+8jt3ZN69EiM1TfJvJ7Avd10y/dO1cAL9H/iqd1Z74p1g1MM3ApK0qB
	l/+VQjclWk1ENT/2Uw4yMWaVXXttP9X00ekDuCTmyuXgg5+dWbXVgTsI01dS9HClODhbEO/suv2
	DaUJUt9azFfDsS7kKiDRHmNSdc0RxaLG60yVoluwTG6xiWyepvcvWwh6vaB+wSBEDG1eMQMmC5Z
	eZJFcSs1bHZjdlTMs9MopV15VmBxftnwqtl6/pSv3cjYXGedlWhwvxu2YTi6VmktQvUjgzXQFym
	HrNR8hBy3GgEYlcUhVwUoreBErhRu8EI1/LMBUQ==
X-Received: by 2002:a05:6a20:ce4c:b0:3c4:42d9:58e3 with SMTP id adf61e73a8af0-3cd4bc358a4mr25216845637.13.1787514484475;
        Sun, 23 Aug 2026 12:48:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:ce4c:b0:3c4:42d9:58e3 with SMTP id adf61e73a8af0-3cd4bc358a4mr25216799637.13.1787514484043;
        Sun, 23 Aug 2026 12:48:04 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:48:03 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 01:17:40 +0530
Subject: [PATCH v12 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 6R1cczC3LLDAx8ikStX4gDf4jKVje7xb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX7YWmpQd3OuaA
 wfwFEsKX9BOTroL0AR0eddhejvtK3iRe9AzR//By4HX0bJR4eOd1dZlMdwkym6o17PGQa2tze7F
 oq7Wkd2KBeSjcW6zymRVG94e44MpYeBnaEX9M/9LG9TmjE6zjQZF3HalSPDcOmDnbHjVcArRJwD
 Egw6ew3DXRG+5Fn7B/3qg4OmifoLw9SWpu5ebRbbt0Tjs7zQqdY6JCh502wDatHTuSjO3JMcfes
 MKU0z0qa8t76xV57hgXCQUn57wSwSQiuyfrzb4dIA8lPXs7HBTlRkjG+y8cLA1k5DMPhh+TNtfV
 BLo0rJ15LDUsYyGUQBF9htuJ0EIwU9Yb7mgAComwSGcY3MhSgFTrXDWU3qu7WbJ9qA9ejtSZhTw
 kakEi5nAszZ63eTMt+ZmVUvHqTslV6U5LAo6y7C6l6jlgXBz6Q83fqzjgG24kU4UTm0mJqo8o1v
 pp52tLFVReAZbNg7HTg==
X-Proofpoint-GUID: 6R1cczC3LLDAx8ikStX4gDf4jKVje7xb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX3Oo8N6mKEw51
 XxHbdR2mVfZsRZqwE2SdKtWWVVGA/brF7rmUx+a0tEHO6JzuRNbW4kQXiWHquO1SnXHZe4PBlkv
 i0LdlsgFHIyFS9elC5uY8jrFZrA4ous=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8b4e75 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=PzEurhthzZq-M9kHIYIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608230181

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
to align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..1b4c276dce34d76dcbe75117de37e09ea2002633 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1902,6 +1902,16 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
 
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
+				   unsigned long target_freq,
+				   bool round_ceil)
+{
+	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		return qcom_ice_scale_clk(msm_host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 			      struct cqhci_host *cq_host)
 {
@@ -1959,6 +1969,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+
+	err = sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
+	if (err && err != -EOPNOTSUPP)
+		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
+
 	return 0;
 }
 
@@ -2149,6 +2164,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 {
 	return 0;
 }
+
+static inline int
+sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+			bool round_ceil)
+{
+	return 0;
+}
 #endif /* !CONFIG_MMC_CRYPTO */
 
 /*****************************************************************************\

-- 
2.34.1

