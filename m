Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665817;
	b=vl0rGgnmmWPjx2W9kgUwbCy+I3K6qwoAEGTgapww/5daWP94nyXLDMZKDenXfmzBdBtr
	 qnC0/Ut5P3jwTDeUtda7ADqb5Ttu13lfAZ8TWDYT3csM3R7QYVCgO2v5vwSCsVjD7Yr5Q
	 9M6nlYatHWQ8skGcXeFa1qkX9zyjCUbaY4jT7tUhZtls8ppaXNSVdxhKXDPRD9Pi3CPAE
	 8gBWaQ/ZSCKsOyGVr9g+I/PhZ/E9J6q0MciN9gB67GSh/HdITfHBlYmngX32L/tbViIPr
	 EA0GCqigoYDVLDFObArxNvNdmonMx/iYvCc5SzAlTTYn7WAqc0m36WCQwoGFTHe6P0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PwdaQerBGB8VsbcjFamZ8BEBVtAJ0iXtzS5m4MtJtyY=;
	b=I341iWvVM8tn4lfgWp+JLix+E1u7GzK1i5ezNmea3H3bE7fdM2BLKsxD13hYvuO/t9N1
	 b8h0FrMx/T7MPRfxeaDhzcok0Ilb2ffnp0u39CzU6zQQq+WFgeFW6NziYxjQsAJ1URQ6M
	 uKVejO892PlxsJ+fv/JYV5hE4Rhd4aqWo7fgvOQeUs/Wp5fJdyQmaMm+SrKRConZvGXCa
	 eZLSUjb2yv1mmA3jRHHoOxDmqWI+OOaGRaMc/ICjsruM0cNAf2bL9WhsOHGJJde0YXEvX
	 w8W/eRIceN7Bou9kKpvrOnI9ZHDBP1qsCALp/tWzJyst8/vIH1Oxod/+2IIwmerwu9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cGtFmEJQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YxV/MmdO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF056606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF056606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cGtFmEJQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxV/MmdO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA4evu4003782
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PwdaQerBGB8
	VsbcjFamZ8BEBVtAJ0iXtzS5m4MtJtyY=; b=cGtFmEJQProFGNk6CkQzARX3mrr
	b8549rtK993orTnRw4Qec6eB7DSScyUBbKfAf318H3wovZwqWTqFk15lcZG5WBsI
	829pXhLAqI/zRjSuhl0bvNov8nwF6nUJbeQdDX4gn7Sfw6gEDByE1wPz6pxBKu8W
	ze5BjrpqFP+qfapTILGnIn1IQrq+6cNDVQeMFeG/K6f/Fc0zyx/LSl4RkGJcUG06
	5x4moI9HM59h/uHgiShbp8gyxy2XAFV6s91xeMNBvRChYasdBjqvl+IQlnly64ve
	2zCErlBXy/yeGblzWObSYeufKrV3lw7JCN3C7l6C6iiaUfnROBEe7BJKvrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ca582-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e94f72fb9fso15513615ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665815; x=1793270615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwdaQerBGB8VsbcjFamZ8BEBVtAJ0iXtzS5m4MtJtyY=;
        b=YxV/MmdOpwB4AcjM76Q251+7P06RTa9eFtrpz6ruBelweeQxM5SJ7N2TenXi33RwgI
         tBZ74dnuHHNEVefKuGe892gE/F/djHeeD0bXwySsfic1SohfdYAOjkDLvFtgOuDzFqF3
         sUMI4XxNNW7Sq7ZOKRrBEAI0L3Wtbr2ly5f4T0yYxyuYGAF8VReLrxRXhYTBIqGFMLQd
         /yjMp74Tki+WD9zjbP4uaOy7okGUL+6eX2382iBIdFzxjSyVxHJeliQA7/5XwCiwhTSi
         Z4yl6ydWy831v3hJwUTYl/6nTXCOZoTURidgtTjIaa08hV3STMpRXAdDIiXkQTrlpgXd
         v23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665815; x=1793270615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PwdaQerBGB8VsbcjFamZ8BEBVtAJ0iXtzS5m4MtJtyY=;
        b=maOHE33RyYTTybrbWd5vte5K6kuYxQ3QIrNEZsx63h77v6n4/p3u1BypKrQ30X+1FK
         ul09a6CRvbF+oKEhoycSa548M4RsvSLJANb2sePYeU8BJJF18ErF3ef1qRXPOYuY5jnB
         yu0US75e7ts+241Bg9CsLz7gsFbvknQk9NeCMO6+d/WXgv3kcDNpNzktKaVUa2YN0vGY
         7HI6JrFa/VTAvrkJQbBzdjqy9XtXFg0Em2XLPPckk2WeRXVlPulomMwz1kg0sRz92Cv/
         Exbgxyc1O4rUusbYwzmZYY/OLDn7ZfztUOKjYmXUzDUMK7PJspVeEqbd/vSdSe3jq16O
         na+A==
X-Forwarded-Encrypted: i=1; AKwUvBwESCiAnWK7VOrjJUdF8po9VgwtwDMiLfdlueM2+0MJPTz3oZNWBvDAt84hRZe5xSMW2dGnxjLFyvCYe/so@vger.kernel.org
X-Gm-Message-State: AFq9FYKrQLkRJ3UENuutVxNW+aZunz1/DhYdhbdq6lwuuH9ZsAD8mUBU
	Zxv7QsGxRrAOdprjMbfj8/LgyXQr3aeYOOFJvAkwFxPTJ5wkI/WWyeEo+mTRyvwycEBOZ7nVH/7
	JNV/uXAry6z+dvhPjdolxwXWoWi4OfaObRoayQOlQLwUcDauQLo4AdTpewHHL7k/6JQYQjak1If
	/D
X-Gm-Gg: AYBFou06pAFgawTVY8IC/016Q6mqzHLPSNeEzVXmjmK7A5pLJ1OkA3+O79WFSplEJLK
	YgVkaqxvPppnJ9Ioe6Rd7/dompfcjvlBxVwnWcz9es9iv5/HT2g0VuLB5DaGsb9WmQxtXyiKPWK
	BgV3kZwZ+JnLWHgtjyiGj6zoEA4xcEW6uKBBN5gYOJusSTX3ciNzxhrnYgqDLvAe2gG0QJ/3nUN
	fVgPuZpMeS/ZtKKc/4hTbjgqgu6kBHZCIYmxeGpbwtgImajAb2U3z3QiEOyVmBHLyChNEmxEnSk
	kNIp/Z076BRXrRl3b8nBHZxTGXZxYrPR73MipvF200QJL1sqMD0bBZHiArJDejirzpEAqxssgO2
	9khXiY//5TFQUyp31OKlnSjtza/f0
X-Received: by 2002:a17:903:8cd:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea43d8873bmr41711765ad.23.1792665814934;
        Thu, 22 Oct 2026 03:43:34 -0700 (PDT)
X-Received: by 2002:a17:903:8cd:b0:2e9:851a:7188 with SMTP id d9443c01a7336-2ea43d8873bmr41711635ad.23.1792665814505;
        Thu, 22 Oct 2026 03:43:34 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm22327565ad.39.2026.10.22.03.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:43:33 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 2/2] phy: qcom: qmp-usb: Add PM suspend/resume callbacks
Date: Thu, 22 Oct 2026 16:13:21 +0530
Message-Id: <20261022104321.306679-3-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX7/5ykNB+SQu6
 yOwidqTzUZIChCwB3GdprJyAZKaF0kXYyTJkQRDGufW7Ree78BO+d5f/O5HHd+O3fXzr1aQEBW5
 xEsaEByWTRaZZIygBv3HZB8Nvvlyxxw=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9e8d7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=AU_F4iWOBUEdUAq3O7UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: odgExsNLXXndV9jXGuSHL5vBQJMqg4wA
X-Proofpoint-ORIG-GUID: odgExsNLXXndV9jXGuSHL5vBQJMqg4wA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX/kNWLRdjyqU2
 ghlqgDrpSc2AauiZVaNMw1DnmV8opi9fhMPaFEfYvVY6s5Vh3E+pjNt/KIs7PLUqG0vcv7J4Uo7
 9xQB418NQWgbtN4r31huMRXltkLPB0j1+fy6KrbnlUbZu8c5KxKZKWe5yM0679v+nRGPOsbbr/J
 DAYMoRQt1wmrwYuiiAsaEoXf0jKTo/H+6/QB74zsR7Euv24k9Y17PVSgYXOPY9Eu301zO6B094n
 6oKZOHWIEvo7cCMM7sqQtCLHrJEwPX8G09TuMNAd5ae+Aenvxyloo13+HpLPX69PXtfBStnPlFw
 IX6tQTMtoNku79uH5DW4OEHDnYsRKNL07UWkJhm3QN81FhfKLeoDKOX6RiKnjwYB09JHUb5plFl
 zguY6ffReaT45YRcr099/l2u5DgkPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220042

Currently when we perform system suspend, the phy clocks aren't
turned off, this leads to power leakage. Prevent this by adding
PM suspend/resume callbacks for the qmp-usb phy which toggles
clocks on/off correspondingly.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b0790bcf0bc8..d2863633007d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2150,9 +2150,26 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused qmp_usb_pm_suspend(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return qmp_usb_runtime_suspend(dev);
+}
+
+static int __maybe_unused qmp_usb_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return qmp_usb_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops qmp_usb_pm_ops = {
 	SET_RUNTIME_PM_OPS(qmp_usb_runtime_suspend,
 			   qmp_usb_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(qmp_usb_pm_suspend, qmp_usb_pm_resume)
 };
 
 static int qmp_usb_reset_init(struct qmp_usb *qmp,
-- 
2.34.1

