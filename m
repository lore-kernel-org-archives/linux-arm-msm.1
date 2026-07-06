Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1E38AC90
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371957; cv=none; b=EWCi6t4fqJbFf0hJF+8d8yV+YTF3TD3uTKiiB9QedcVes7JgBR4VkLoj6tUbZfg6X5kyvc2FCogfwrZc5ttRyRl+8FlveMzCkABKzGFWJr+j9nyUXaQeHUeTXVsaBkVcPfELq5FqDB4JeXUhA2kAmZHiFWc6qjsyg8o7/enMTsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371957; c=relaxed/simple;
	bh=JkHc4jgN+fyBxFfZzdD2L1wN0DrB/XlMCgvF65LmpZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKBMK7E4UqtKZf+VPg5a0QyS/ua2j5BlaOVqBMxnJgmC+FB27PaIRUHJivXzk1WwIm1DooBH8IJip/Mnedcjy3JMDHOc3IItttzbcYwijIUwQIHU28SPEPbEWXMcHV/pShKngX3RztdvjQ66Y4fLTY2yz6PMLhnw9dB9eIK+c58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4DbrB+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtdC2Vtw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4DbrB+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtdC2Vtw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KELNS1626824
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qa7nM/+jKtg1HCqC+sdDdPuWIJ6eeiZoNwQFGtncwDU=; b=J4DbrB+jhOv5gxN9
	x5IJA/SUxXqaEzWIz+uaTGf9ENjmxrOqUsWX5e8hgxA8bI43ilfHl6PNDT0DG0vb
	WCzY6/oaAcbo1o2Wvhrk4DC/yMZwplNKpkhSHshUGp/lACDR51i2Q0X7Bdocpt2D
	NCco6LOMC78ojg3oIgwq7h5fMW7mprv12lwMWVliMGgduqbgfDtPwo3WRBXkAWZE
	BI77d7v2gE1knBq6320z2tUpFnbDdGEpQe9F7yhe++5G/zc/cBgpxR+JptWFiMkL
	UsGKziW43XCuCrV/T0d0QxLSyA8ngBux9b0bjlIV4Z8fHPm59XSMM4OEFWwpGWnJ
	3zJ6ZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9bbtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:05:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso2548565ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371954; x=1783976754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qa7nM/+jKtg1HCqC+sdDdPuWIJ6eeiZoNwQFGtncwDU=;
        b=ZtdC2VtwwrbREKz1sx/1hprf4dEQjWfA2mIR1muKNnFGvFBcvsNn5WvfwnFVoqFP+/
         yElv1qEQWMKRbg/2bFLRMGilnqirjWnulv99P9BbGvcZSz84YuSAaQQUA8G4+3/LR6TY
         RtCLUfyIM+n5Zp6T3T9vku7GSABhulPG9ONMKotKNG7DnQQSJ8R1WB12tZxspzTLvknZ
         qm3wsL8anE3PHeT3ssq+vEexcB6pccsL/Bv2cDGdP56iERiuKjIwdrZ7PYcABl7m0ywP
         lca+0C/D8wzuRWamZArei/JcFvVBZJ5dF2yb5x61StE1wL4HYjTcEAdF60llwpfyIHCC
         6TAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371954; x=1783976754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qa7nM/+jKtg1HCqC+sdDdPuWIJ6eeiZoNwQFGtncwDU=;
        b=Pm1suRiV3MoV2ZlVCrGVcIYk5bkGBIrVzJdiU1ISMX9dRc0YhzZChBPRCEpd17V9D6
         Thw9G/ECs+SmGTmTcbkwccmoAFgEHY5JNgXnM3upEzkZ6lNh5/TgXXiZ/4POcBxEJCdN
         p58t5eJvm2Y/AA9ROsfsXeJisSqrda9fgjAkr1UHn0CSYWa3g0b5WiFYOzh/a73DmbaO
         EGc4YdFjQ2EyNMUfH2KVQfIWF2XLOEtuc1pAP9F8BotUJD3lqz6XYjZn3QbvgnNaHyMn
         pFFzgUDv3+8IE1cmO8es7Y3M95LwoccydLSZAOgq/5lAULwG979risQO4HcMjZaTZ3yG
         p8RA==
X-Forwarded-Encrypted: i=1; AHgh+RpzJsYWTF10IeZMaIMirJjMc6MtQMGlgYkN0JOdudYkv+Cptso3LvyAOqBsO/lrxKgs4D1m0yAXGOkT4jZO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/1RoHptozVKz3fR5JhNo2I/jVN8ZUxEuMey0q/u3vykOQQZSh
	veKHvOgU/AezGxFtsRgROnwUTUbUlzxDIDV+mFjMhiqJrksxQYhd1G0HPH9NBHkq9RwlstzzJIw
	AMjYEwEdk/u1mE6hJ2g78oGpGuJ8EgpjBSgvAJaxSvyKgM/DdsVykcArM6fhAGlGkKis7
X-Gm-Gg: AfdE7cmdnAEdl9LlHywT5cIRBHlisXf1ETdKGgNoH0VlzsihrHHvXjHuguvDvmT/RAs
	6Pkf8lvyftRWdXvT+3Un0VF61xmTvgz3otmgGvgWTMZVtLYU8pUY6a4zyvhwzY6q68YtZH5zpIj
	uyEmKbZBKaTfriFPpdMelhhH+gfd18Qc9Snl/7IIDEDFdkWRr0QOSf63D5G7SO4avoVnWX1/+2X
	PzZWdMOPsZn9ymC5s/d4SxgJ5YtH2+az+LV460uNDN5dcJcr+X9hQBFSgkC7CpfKYUMqVDDKdm0
	Ca7D+pXumcTUW6rlej/0f4zJ6JG2sFIsd3qwNa+Xcv3xhEUX7Ongevg/f0DEnlCpPG/wB7DW+ig
	r+CPXBIbiQqcDWKexMOk16kfee2I8nPAhw2I=
X-Received: by 2002:a17:902:e751:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2cc92ae0e05mr59298085ad.24.1783371953839;
        Mon, 06 Jul 2026 14:05:53 -0700 (PDT)
X-Received: by 2002:a17:902:e751:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2cc92ae0e05mr59297795ad.24.1783371953336;
        Mon, 06 Jul 2026 14:05:53 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:52 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:38 +0530
Subject: [PATCH v5 6/7] arm64: dts: qcom: shikra: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1469;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B9OVGtbnZYkfAOGV7e+idMmskau8zD6EYz9PXmb17Gg=;
 b=EocsNCEZuvcYsspXlMq++ZuX9obJ9DqG9XuT+DH7vkNuX9uG1zfPZU+oZXMB/dZF43gnqSmnT
 sPV/SafOjxCC6F8qTmUW9Uv/DOprP1rlIUxv5uQc60NlDPDMd8kGgWM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: -69ahZ05S_4URvqxTpTsKQoWXqzxoi-E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX02Z9Wp7almL/
 N6bai0+J7SqRa9vPCy7/sPjVEkXYdMGm3cPsV6b0eiswRn2p3yF+Ge2eWpBAKRm4E8ssUmHu6W2
 D9qQ+uD/oN4gspRJYngjKSi86Q2ikqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX1jbw1jUMcF/Q
 /7eEOU1DZN+ppcU4eIjwn7HJwwLr3jW1YJmQ0JhE5HpkXiChvzTucM6yt2CvaIoXZMA25N1NsYD
 /AHBlHjqdVOyPA5nnyViXxgwiU11CZqsblsf8NrrqKYrTkSPaRu9vTrklUmppBuwS/0WKZHXEAd
 tmcLAzhqhDRYBcXb/T0wjZvHRVu0UEtkyvZ4lo6h/depZHiBq01B2pMmTIoJ6TzdJ4JUiOsK/ph
 P+tM9Fnj5ld5s2hzOIrfazLWM3EC7OTcY1Lgu7JddAPLlfMPc2Ug0TJj6FuKxC91SgnuYFEtZqw
 vjJZjUWV7hY7SKgIye5sU3B2YuPjEAvC7o65SmDAoEN+PoW36EchWQB+W+gMjIpWI1GmLrd878K
 4s6k9mYjiGPU9a8u6nfcZIRQYECvtC5SRw6xoc5xlWSUjVmqMbuptFV9hBkY/MvTYtssmtU9YPm
 QdvsSqdo6DTx6zfZnjg==
X-Proofpoint-GUID: -69ahZ05S_4URvqxTpTsKQoWXqzxoi-E
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c18b2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QmmV89ZizECaiV4F4FsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when reaching 115°C. And
use a passive polling delay to ensure more than one "passive" thermal
point is considered when throttling the GPU thermal zones.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 34261221664b..eeeaa369d3a7 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2510,6 +2510,7 @@ cpuss0-critical {
 		};
 
 		gpuss-thermal {
+			polling-delay-passive = <10>;
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2519,12 +2520,25 @@ trip-point0 {
 					type = "hot";
 				};
 
-				gpuss-critical {
+				gpuss_alert0: gpuss-alert0 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				gpuss-critical {
+					temperature = <120000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-thermal {

-- 
2.54.0

