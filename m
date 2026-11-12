Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523175;
	b=1E+K5Jnm79I/iUz2TS3HZ6XNngceF8evIwlSk49qwK1qi52gXveZEADpyF8q0955N7Xl
	 KlmTUxDprzQtTq/87Eo4ijPsZjGDyi23kyj9F4drBfN3ny69uz8oWHNwNDg29/OEoSy7X
	 pNMEQnBsufzgI9tabi6InrhXIEI2gBPGtSWCyLsjoAzVzL1f6Dv/CKKgOOnZwGgBD4wEa
	 B+ACcUJu74xGpl3VKC6gYQz0H1YIbDpmdJPr9tPYdxX8yUnc+JZBpLjf8camyGZJAlwg0
	 i4mzxOx8XBHkUltKTE1reEhl86WHXNU1FFVUNXmfV7ogEWAqHEsPtk2Py65HRS7RcjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yc/mt44iiI3JDnoTa+amNxghgBGpPCt5eP48vxd/muE=;
	b=BRMtqa1lXvFWLsHjEMBC3KHfjaPl2NT3aYR9mFYlj5RHgmQhvTXrsjNIFNZSRbpb1MAx
	 WLy4kH8/VtlHWUKTNrt0bEIbc2owVxSsFotrJrmpcqJFVmQHXzT+1Xddwsf3i4uc/YRJO
	 qpEhlkF88Sp+Y6ney3mi2O/ww6kzDQRUeKBxmn1deVOfAyOysXb6ylPwlFzTvC/ExyjQK
	 jrGF1FMkuxKXWkR8WaHmueLLFjL4BY0hLGgIuwP6H3di3iH3NYx6J6fPJS5HTW2Bmh3bS
	 jVm668Bb02qdcVaZ2AhdCRqpYS1H+0VMynVD6tRR8J0puYzqH5zdUosui5EyY1waiKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmOBb8rJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/HlP/+a";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B260A260A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C4B260A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dmOBb8rJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/HlP/+a
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZkru537303
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yc/mt44iiI3JDnoTa+amNxghgBGpPCt5eP48vxd/muE=; b=dmOBb8rJ9DJUSOlN
	31Fzm000FnyJBj+8QH/DajyZ69iDI04r1LceMymteo4RXucWdvGNTTGt6OAeOnU5
	xbfGLc/WQvzimbrDkwOhWfhf9eMedTZb3eGzgYse0EwgmtqgTYG4ONV46Dwt6DB6
	Uuxui7UGB3YIaQt+2YIEpamngOD8oRw+r7aXK3mYHDarFLSYkKX+kWFpTFR0U1p1
	UByb1YQw3yh/H7r6RX+N0vkofYtgihVgHYGjRyv+OKhEuUZ43evtgFnOgetS32Kt
	7nhEq8sZN+lgxKLIpX2CKj8dLct55F+8dQFiWnmkvStwh5k8RzzMHEU2Jlqa+itd
	63uHSA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b9gy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so765357c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523173; x=1795127973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yc/mt44iiI3JDnoTa+amNxghgBGpPCt5eP48vxd/muE=;
        b=T/HlP/+ahzjBAHcmMwdp40+2HfWnVY6Wf5oa2Ecpg5OCTvBNoq2Wp/ppBQ+Cmfu8fy
         +UwoNevhqUJ/oiSUhVKINxiFItj5uEPOdpDckgTROpoPzRmxUeezZ2jm9xZOIbecp69d
         xOF8EcAZSdYcegY7k8M5v4U9ngtTxQAPe/MckIjHWHjdW8PjcyrmcNe1l/C8fWGpYw5U
         X7FLRl70rIWK9RaF7Ep8v340ghgNTEoZl+W+yz7TFljxGNwhJ6S85qprmmxPxvvJTAGY
         FFwfb3bzCTgt67nbOheXvh2OXkS0mjjfAfBL6R2GlOxetv/7uC6cftpjihqmPZwW3lgQ
         QcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523173; x=1795127973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yc/mt44iiI3JDnoTa+amNxghgBGpPCt5eP48vxd/muE=;
        b=zVZ/AddZeCA82EgIvPDMRM2CVSvD/DOsnLTHTBe7hak91rvHxwtQCmDvClLXIDR2OZ
         eNmQeR0FMtiIF4xkBt5eWiGBdKRWkijopekZPTpvmtkhY37OrsymTBZEfEixrRtHYJQ0
         RPwScV2uScF2v7OfNF0PnJuM1M6qfIwTyLGendLs/jCg4dFRJs183AB8KykdmmmXaSqX
         q8XsTfGebf7z3qxZdSS3M83oTQofb1ubQY2BDDICE+q2CS4mQx8yYbdEkFRD4yymSkAB
         8CSxgggB9Wjt/UKbY1dcGDeO/ddW+ILOO6+0APEPpeNtTkWf9iib+PetOaUXaSbkeBZT
         ExFg==
X-Gm-Message-State: APuU4Z/M1u/p3A20P32V3XGQbdNTmg91qwpjz6/6IUiiDEN9+6dX0qoo
	S/GFA0h1aQQQ1OMo0H/dQ6PgBbi8JJk3WNWzdazDt5hnb35wIPbgypeNCSPBsVsJPUViDpoKPlW
	Kkt7ETkP6w18CB0NhhoZdEuhQRZOu4WfhR0OHBpQtX/YkfDoxmX+lzLC5A+bklFO2B7PY
X-Gm-Gg: AYBFou1YRc/DeuaAcX2trK+YiRdFpl6Q2A5nQ7iwM6tl7wwYQlvb40evR41mPc5oHc5
	RM0gS1frhQiqCYCLfKDuOC5ncuXPPaYfrXE1l7GfAZMft8iHQcQmFDyRi/YecYdjOaBOoPnsRVV
	DuWh5m9G+RmUj9kgaMDlru8JM2do9JXbCHBnbC1kpL37Vj5FdYOkNb/wvnoVtZw9k0ZBcC5VkZl
	eUWtg6NkkIz283srW0+kF1B2IfPW6RNnJ8WIyuIWXpyuLVaubDrvjyW+zv+HopB65J8jQQ2Ohr6
	T7zRFFu+9VNydnq3+M20O/wdp6EbbaJwZ0IUAfXBYYlIjW4TDT4b3E7ZIeB028xsVrAAzIWc1A9
	gBiGAQg71+0RzFtFFhGWY7CB40hDdd0FYvMxi8Ep7cG+k91JeXQxbsusW1FNJyR2ygWW/WObHXi
	gXXnlJwzwRcg==
X-Received: by 2002:a05:7023:904:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b50319ce0bmr844399c88.35.1794523173075;
        Thu, 12 Nov 2026 14:39:33 -0800 (PST)
X-Received: by 2002:a05:7023:904:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b50319ce0bmr844351c88.35.1794523171031;
        Thu, 12 Nov 2026 14:39:31 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:30 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:29 +0530
Subject: [PATCH v13 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-3-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af64025 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=PzEurhthzZq-M9kHIYIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: UqbTG6IZnLGPwdx_L4_AjRRHkpFr-gdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX71NHhLeVDcSe
 195onKHLOjEawB+X/AUK+V4B/hp3w7mTXHCzeps+rUXMhl3ummZcoJCpIUe/+EOnzjq1PMr3DCK
 5Sx0WhuIWrz4OTSNkU0zNVoD8/46Kp4kTcPRJl+9GNyc2hPzQkTzTAPRupB/pyaF2bTdUAR32hx
 wiV0PDkM76Ua4m4l+N/XgK/Hl8S21Yjc5J9QPXXoQpARg0NR9SPyCZS+/cx07BpnIS7bvCHF/gb
 VeRcsAwkF9zTq1CF+94TCWoOQ66anGI+tcLgcDJZmvqc1SXDvqbhyX/I5Ol8mklfaUehao+lB3q
 988u+G3m17eHC+Jp/LBDydxGxr1jeAD4zAGmHI3/IQlbybXKyiZoPYc3PeSNPni2qjspvYyyKut
 5DYloWh0+xBoRDNDJrWpdS2ERQisEhSN1WSAxQcNbQqijAtKs44qZPcyzpU/ci3O6WdS7VTQ9f4
 QeYiLzVOXI03Gf1fIxw==
X-Proofpoint-ORIG-GUID: UqbTG6IZnLGPwdx_L4_AjRRHkpFr-gdL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfXy9+RhlLHLGUM
 /DIW+VN+K4m9FvVTMyDd1ZbtDLDhED2+4WFczCFjGFz1iRYRTBvp73GP+fJLIGfaCUrZKLzsKkb
 iWsIUnakXOyMxzFpZ3shQHuyMxKNlj4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 32b1bcba47d6b75578f01d8de6ee9beea3b1e080..652c5cfc87bcc3c59b845b9e2fd785bcba197fa0 100644
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
@@ -1960,6 +1970,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
 	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
+
+	err = sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
+	if (err && err != -EOPNOTSUPP)
+		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
+
 	return 0;
 }
 
@@ -2160,6 +2175,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 static inline void sdhci_msm_ice_restore(struct sdhci_host *host)
 {
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

