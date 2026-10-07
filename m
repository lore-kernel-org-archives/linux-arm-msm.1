Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839BE392C21
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355868; cv=none; b=JFcw+nSePVrfWOzNRv59VoBVPJ0/iXYLMjM2o5cpn0MLqOYpWpEA+ChpKHQ7Txt+nYOHiQt4eBUOV4svPXSHqAAt2MTorpWgC9V2r3LVMFZsM20ssPxeQ2ITl23oNv4aUGofFphjtpxh3fXIgX8FuVnn7/BsG5Tnn+ULl0egBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355868; c=relaxed/simple;
	bh=7xTUJn13ZVC2ulMbiUxz9zRqeDyOQAhzkKrT63gf7f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+7jsYdD2dHTslLSDWxBIEUDB4Rg3oP+kHYpF+Kk1rvFgY5wErOgNy21LtlF05iGX8571CPjL70/CphCUd5cNQHY2Bv/nJ2gu7N/zpawySxWfPLhcvgU6x7X0qNl62hsw32m75o9L4nlsvb20vvgPzqZqYNpivf5PGKfSyiR3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZO2nMAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Auz/Hwzg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZO2nMAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Auz/Hwzg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974UCe71895447
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 06:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZE/tjzIfxuJJ4Ojhyg/xfoP0VuBfZp+JWppPMH8e0fs=; b=YZO2nMAdCM3sJzeJ
	0NGp+JTDyEFuvZj2s81yu9/ddDz7oLCNvRcJ6grUCPS4CcRxNLmdx5bgNpPUeEPu
	vjyNBhc/0Xnpz3aCLLAFL8BW5t3H0FyQToyVBRYKu6q0h60LJvdm/i1Wu7SzxNoB
	12FmOK64gKJJTGubeoPNvEEStn8lnyjBxSQS2BWvwa9b7srnrBb5yT0YUdVO1B5z
	Vf5XSGCjvKYglOX9jzrVX0xCxx0qAAfdx3c5qk6l0ga+7C5TOoJQIEsUMUR9ct0i
	6s5IU7kvgehSPVCAqrmtPdSBzwkMw81fqDU5XKXDkRMrsBDqvdVcTTHaCvLw4iIO
	i41jhg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ask7y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 06:51:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3516711cce6so77450eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 23:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355865; x=1791960665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZE/tjzIfxuJJ4Ojhyg/xfoP0VuBfZp+JWppPMH8e0fs=;
        b=Auz/HwzgUnVVmV5arlf8yNbZntEvPpWtt9WrGrawMCqV4ezc/pH8+jk2WUPguC18uB
         UFOUekGZIqodSS/mOmozaFFXiwkakqsfcsGs8lMCqx4mdd1LwdLSKxJNKLBHVSmsti2v
         oxx87MI4yeEBTYPQ10s9wvbfoLKo4pirIK7W4EGF5oiAKw0DsZbHx4KFdSAzU3RoZdya
         Tzv4hyJXkiKagkG1JGorNNwk90NttvAugz3y1gOXe0Xa3RD+VMxVWJAnaHTz97th2tGe
         R3KSrrAVEdAO/RNA40WxxpxJzjKdkbIo3qQbWkyRds7fp8RrGYPDXeN1GR1Jb0HrGX6P
         hLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355865; x=1791960665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZE/tjzIfxuJJ4Ojhyg/xfoP0VuBfZp+JWppPMH8e0fs=;
        b=Zl6Q+FUifVlHIcN7Tw61lhBVhTYryu3Mz/RCalUhkfxxLnI1mUdCXRmrRM+adpHo5a
         NoZwVa4muOd24UbuLGuibGtuAV4Xr6a1rrjVyPkyRoYd6uhVdu874Yu+zrZGF2k0+Qo4
         0EUgIxvld/uRmBLWG/cV+q8Kum8cl+wvkUYGmcxjf/+UUm65RHmSylQkNRIiFZSCQxBJ
         y0mu6v9Qx9oLY1a2LBA1SA0bKFI+rZC99uCCXqblZzGhb8az5Wo+Ev1rZQlK65WESXbR
         1u1FI2Em9X2WgJSOVQefw7d/gxRSlKmzP97fnI6gLzr23tL9i0oQhPEyWc+IC9cdgePr
         DalQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMW965jGjHThQy+QFkT2rGilqdbrDPFqcadHiq9P7wP8xqL02a786FmeXvjnFQXonV7IgaGdUB6YDBJfOP@vger.kernel.org
X-Gm-Message-State: AFuF++nY4qrc/wf8th1S9rflo9aCvubZwg2i8mgftOFwNEgFQ9vboQ39
	QI7LU52I3oMfLEara1QDuNCe81QwuXeb89Qpem2nwx3v7v1ULOVIc3wzlNcfDuto35LmRMT7glL
	52G41qVOmSmbUcpU35LmaA5qymK84gZlKXT9atlYDPeL3s4oyCYJBy1r9qWTVsp/ARB5S
X-Gm-Gg: AYBFou3zdMGBWSbmr9tGUH5TKY1sAAFcVR3G1XTmTKJEZxDb7sdXLXBcey8Ojo6yPLR
	348uKZjmUBp7tBX8HKFwmq4QY1OGiRmoBsQ931DjPD4wkroGEL8bP47rYkOEUHamQevy/W8OcnO
	kseQS/ieWOuZSQxpLeexEMGUiiGU+GqnNGtmeHcleiuAwguOUzirVGPorVhyKPJY53iLAExDob2
	ez73oj1HthmD518dkc2CgbZHWVbgf/3T1dsIe3lNwMefJh5HJhMIHJmcdD+w68sDeWatER3WuhR
	ScrKVk9PpYKwfH9P6qoV7A78uiDa0EnmVakS4BxIA3010P7bp/euAC+FYN3fnWSVoRd7THP3s9y
	vQMSwExWF6iVgjoxciKbkzGMHCOMmTNt+NfspirtMaNLl/UdbCXdIKuqtWh7fDLGO6PGDfWpPQ0
	kTSusUqVZIaTnXhbolM7e0fUnKFMMmK4jB1Yg=
X-Received: by 2002:a05:701b:271b:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-16207b90868mr1008617c88.16.1791355865176;
        Tue, 06 Oct 2026 23:51:05 -0700 (PDT)
X-Received: by 2002:a05:701b:271b:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-16207b90868mr1008593c88.16.1791355864644;
        Tue, 06 Oct 2026 23:51:04 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:51:04 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 12:20:45 +0530
Subject: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration
 if already enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: kx9hkHBfmh-kyO2q0doxgrncGNHpIDU_
X-Proofpoint-GUID: kx9hkHBfmh-kyO2q0doxgrncGNHpIDU_
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac5ebda cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HvQ8q7LFvqEYzEKEMhkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX9D2qYqhZhWtS
 AgFs/0gYDMolk0OTQkNtjYZGHFZRSbNk6Y3x8YINC0BnaFmi3P7YhTnQacNtRj0uMR7CGyzWi5y
 T4FIoQ9gE18sg4lbnVmahjyMPExbZuTvUYPw0z41UPt7BPlq+TV6b89XaNgG8HSe276VYxRuBOP
 PpCP2UzN6ZKZ1iIiMbQEJhHvgZf25EsZ82ZmpoiotGsIkHKz/SLDjLYGBtrhrjaOrksRnk6qKT/
 wbBzXIMuXXj3LCTee5jhaI/FBPdMNuZAAbDIKobbF9QJpp9+Hw6lN/+xgcirCkHm6gDd8tDwF90
 r4Z2eup/DJ4lfDdy370bl9zP83hjne0mgHaYxNcxLqUlLFBtgYCgLoCZuVkcTAIZmxfs7dDmdVP
 HfqDYYAE9cBbMvjf8rM7lR/xP1107PqLrl3ba6DnQjMN8rroS53F49QdgSpz+cVyDuf8b5+BKBt
 P+Ftg+isaL87Zs3HKDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfXxTlzdLJZKhDu
 QeBpEiZjGLlismuS5sAn7b5PieIphns0uZPuKETtAmdl1lVcHdqvpVWgeu6G+JpG10ZOjuEjElh
 Eqwc1J7OLiTUM6OjspAJv/dS3/q8TnU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070027

On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
that provide the clocks for the A55 CPU cores and L3 interconnect. When
the APSS clock driver probes, it attempts to reconfigure the already
running PLLs. As part of the reconfiguration sequence, the PLL output is
disabled and the PLL is placed into standby before being re-enabled.
Since the CPUs are actively clocked from these PLLs, removing the clock
during this window causes the system to hang.

Avoid reconfiguring PLLs that are already enabled and return early,
similar to clk_trion_pll_configure().

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5..3641b2da92cd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
+	/* Check if PLL is already enabled */
+	if (trion_pll_is_enabled(pll, regmap))
+		return;
+
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
 	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);

-- 
2.34.1

