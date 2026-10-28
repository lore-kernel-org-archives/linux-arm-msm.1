Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183972;
	b=hjOxRkMN4Dh346wWtZluEW8XHi+G6GP0w58mi7EcARTHPcSarPp3/Kx7HS2RVpio4Why
	 3HW923/dTdriLEdGeH1GG+qgAGwzN8x0Jg39byd6He/sqnEyGpEhQLPjjBN5dkRk2XMlE
	 OB4+DCHLkxz6t+1VJkDAxHcBLGxL8vxMTpNLw50s0w1IxwUzT13pIM3/zmgroampfmNMx
	 vFksas/Q0H0IYadzPLMjjsXstKNjGVlSYqjCkP4mcEx/EaC8CPaPR/KPUhekipM/NC+lC
	 BahQzIG9CMav9jThUCZsDLMSyq4ohyH6PtPNdQ7EAqnqSkPu8dJcpTKCSHVQXOi0kPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sa3455GO92UVU2gr4OcaS3igM6dxF+tEL6zEH6pm9fM=;
	b=ij/MhWlazSOny5RafmMdS+DDMoPZ9W71gRayhWzF1EpF8C1Y3aLLweiWGRKKhlD0Ka9q
	 StfjUMOM1gqfTClZjMjwBFpRJgjOm0gvmloOqQeDvpc7B30dWf7/q5Fvwr9kiGLuSvGon
	 TtDtDYuubgR8qR752nkt8IAw7npSFcgSeC2DoCDqSVg8a67OGKcQ9VtdHPb3whhfoJDPs
	 SAGcGYEIFt2KEs7HPwoHuHnQ+urgDSzgqz9nN/gsS/h9Yvj5dNX4w9EZMnz5B4E/NtSdY
	 Tgtg3qpiHAy91exMDq0JyjOMCKejRX0G2U22r2KemreeSYqNgph9DFtk8m6L5vHfqrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ochpRf0V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SD32Vonj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAD2606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EAD2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ochpRf0V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SD32Vonj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K5uW1167739
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sa3455GO92UVU2gr4OcaS3igM6dxF+tEL6zEH6pm9fM=; b=ochpRf0V6xv8E7h9
	eCDUcixBlb8u/JkHdOENgGKHpJgt/04OW9QHBq6DjWZ2ZmrkL966xzhmYyTAxKX8
	lS2Qa4DphMCizgYmfEsFFYL5gMyzOExOxVClwH3ogQjljnY7oRCYd/G8rGZgkfMp
	7y6VQMT/EbFlcxfL8Wh9ia0GleoqBqqTeflFpuTjXQWxl1UgrxJZcwnZtphjZW/n
	8rixYVdyDGEakN98CO+W7sylop7V12E/jdYLdmQSgt+Dt+xdvYIYd06RnIE7wl0f
	F/mXI0nbMFR6TAEuJah4+dvzZ/ZBEBO98nxH3B8/qO+Ii44FX12TPMhiy5slh9vP
	1szC9A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7hsaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:39:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so976104c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183970; x=1793788770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sa3455GO92UVU2gr4OcaS3igM6dxF+tEL6zEH6pm9fM=;
        b=SD32VonjfdWJhj13jHs9Pc1QgJg8K9+GfWUjJS5ee/gICGAZyvMI7sopXmXdvV3hWd
         3PbkpgpJCEz1Y9ZpLb75H4DT457nuvBvw2+3TYyH08CchVw0gx8BTM9kN7CpZEP05UVy
         b4dXHX2Luj6inTEecCxX69JWhDcovO4ZHr9ssyqnWPlNyfsmihB4HVVx4hguW30SNujQ
         7d1NbR/vojVDhVlz5pqCKfbhK7GRADEkmmFDPiZNnkgfw0gbvR7vlgLdTVSvDd7VA842
         iZGjjYuvzbIzc/dEaHnwOzD/wlIoY10ryq2n8SVDwvkRBTB2sFyskXH+AyhcCcfcWhdz
         DCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183970; x=1793788770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sa3455GO92UVU2gr4OcaS3igM6dxF+tEL6zEH6pm9fM=;
        b=nDcG8BKK7ykkAiCB+oTMiGuuF36pA4BP7l8LvTNTAO/iEiEvgdaYcIYZHSQAohtN+v
         KLnSjb15Pfye6o6wZUrKKjXQpZ2c3g6JL9l5yyslTRnOW07ov1LEnV0vl3me5F6p9/GG
         tDbCn/Gk7Xbwpwj+jzYNp0YcUpiwZvrnXDZfplHAoPslH6hcuIE8JWyljLmSu1Jc6zkW
         3KLLOB1ZUcSlvdUmRaIMB51AMDMMOZ/fROQvoQLYi06fACKqav3ka0q+HOsHMr93KJsr
         EeAO9McUntHUxDBBg3a2tGaS4tJU60/mPMS30+V8pMo0uIyJr7O2eih7FctcdvSiC+Gg
         4hRQ==
X-Gm-Message-State: AFq9FYJp5PDYuRJ3taVfBTQ4MooNIULezIJTDmcmqFRp5qNf++/3RGob
	l7N6hxNPqYVAIP/1UHc3P/TbvJ/csQ48EQJZSH/uQx9zbMR1OGXaBKS6soOsTL7tJPxXVfxyVQA
	m0KdAIK8GU4m3IsSCi4rr3mSz3A3lPNyHPuUnkczDiNgO8RsDKbFEpKKKzziNGRjz2gcq
X-Gm-Gg: AYBFou0knLuoWerT57Vw6nXu3CmdpJ7uaFk/K/g+RQ69RykNE9LLYRDiePdpz0WcujU
	vUxKgvL6F4n8145ZGwadIZlaiLMQkDAhEgvO++b+JgSIU56J7syhkxiudpiTRy2qnruYINvEi02
	qUjk0pvIVyxz95FZCB2/Atp1wtMEePWtp9Q0lheimK20zfqvGJ1B7b24TRv4FEhDmoT6fXQNVpe
	3tkCqc06lr2GMWkW3+0+y45oc2YM5V5I9+EgjoOAnu0p4cieItAdkj/ZPDJNGk8HvM2HF4tFx3W
	J8muHZO6jtEiXoDhO/m71kuPWT7fvnHESssU9Omf4kMVdc42pNHierhMdrZaU2A7AwelJfzio+l
	7b0mL6TVyiGtR/YNdnDFlTXXAFsOTYEV2cF7Fgpo7ttj3lX3D2SwDjyblo2pwgh8sEfXns+dp90
	w=
X-Received: by 2002:a05:7022:ed01:b0:15e:6541:3099 with SMTP id a92af1059eb24-1a6ce01d3afmr2759418c88.7.1793183970048;
        Wed, 28 Oct 2026 03:39:30 -0700 (PDT)
X-Received: by 2002:a05:7022:ed01:b0:15e:6541:3099 with SMTP id a92af1059eb24-1a6ce01d3afmr2759368c88.7.1793183969473;
        Wed, 28 Oct 2026 03:39:29 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:39:29 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:08:07 +0530
Subject: [PATCH v6 11/11] phy: qualcomm: qmp-combo: Fix error propagation
 in qmp_combo_dp_power_on()
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
Message-Id: <20261028-glymur-phy-v3-v6-11-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=1738;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=WL4YAlfjN6MhAdQ0GSQ+FQW7IyH6mURHkrvjaQtIApo=;
 b=cLzwJ3/oKBc+VW7ndAVeXK7ARSNAnEndg/bgCgzCgEHyjoZW0xsAVUe1F3rVCi2OnBBhVmJqA
 5iyeJ9IyRMDDLLYO7LuksNXCkbMzGi0bXcd2M+/jiBMpffxYTSKcrQb
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX3UxFZkBJBrfS
 YDlYcpOffn1r1sPoyq7iIybk1RclKd84j0SvmTjdsiI3hyyPnRWA0XIfK1XbEMpnnwqyJdJEJrJ
 s/TGHtw5KekWfGKFHQupkCGUNoTb5/I=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1d0e3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=uxOsGGhB1PPybffeXOwA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-GUID: N-o8XkOAPpubsfYNyrRBdiXqS313CfWK
X-Proofpoint-ORIG-GUID: N-o8XkOAPpubsfYNyrRBdiXqS313CfWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX74vu4/AI//xx
 xos5CvaBFaRL99GfBW7crKAKPJsVnzORwnmaAsE6yENtq24TQuQJ08wVt50uCxg0mi5SU4hAk6R
 oP6NxSHhacVrIeNQAbtNFpnBmRmVmB5ZTWNiXvGf7jAD3JhpPoli5NloIb23wYAq0aDUBSvkKEP
 GwGN9cJAEUffu3oCt9Cs4m2I0kn+x20NPGKTC/dGO1dTzKqLOYU3acy9eyOB966+4303/o2beOY
 HrVXkts8XamUE4TG1rZ1+CgsueU2VWXUkvrYGLozaCVcujsLLlsA3lL+YcfRutG56ayiAS1UIQN
 pSmmIeYnXDG+aS+1LeApRuR2sJweQUuMEl3mvkOnJm20GtmIrjkTQ/YSKODgJDSBb3ieYKw8q9p
 RE0ez37e+K8895hTwapdNyLHS+VyAXftuS1Oal3je8zJeb3sGt3N+fMmy2QiShOByge7z7FgfLN
 d2x4REVDfAeGhF4lwcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

The configure_dp_phy() callback can return an error (e.g. -ETIMEDOUT on
PLL lock failure), but qmp_combo_dp_power_on() was ignoring the return
value and always returning 0.

Capture the return value, skip setting dp_powered_on on failure, and
propagate the error to the caller.

Fixes: dd1153651b038 ("phy: qcom-qmp-combo: merge driver data")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b34b892c2702..4def2bd991a8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4416,8 +4416,9 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *tx = qmp->dp_tx;
 	void __iomem *tx2 = qmp->dp_tx2;
+	int ret;
 
-	mutex_lock(&qmp->phy_mutex);
+	guard(mutex)(&qmp->phy_mutex);
 
 	qmp_combo_dp_serdes_init(qmp);
 
@@ -4428,12 +4429,14 @@ static int qmp_combo_dp_power_on(struct phy *phy)
 	cfg->configure_dp_tx(qmp);
 
 	/* Configure link rate, swing, etc. */
-	cfg->configure_dp_phy(qmp);
+	ret = cfg->configure_dp_phy(qmp);
+	if (ret) {
+		dev_err(qmp->dev, "DP PHY configuration failed: %d\n", ret);
+		return ret;
+	}
 
 	qmp->dp_powered_on = true;
 
-	mutex_unlock(&qmp->phy_mutex);
-
 	return 0;
 }
 

-- 
2.34.1

