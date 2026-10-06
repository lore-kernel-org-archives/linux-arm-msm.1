Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62982C08BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264591; cv=none; b=GOpJsb2B5hEHkZUXDJSJJz8Fvary9TgpxPvw+tvnXNHF8R7qbwrXGfzjV8NrGAu3q3AS4s9sdP7JfI3R9SXDEw0igS84pW59txFVxKPR2jJWJPquz5cLpeRkseHsrHzg2MLUzwL1Rc33EGip0PZ/+XM7arFaJCxojqVPTNdKMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264591; c=relaxed/simple;
	bh=0STYxAxDE1NjmlumOdbThi5YeoSWS5eKyqTdJTbik7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEC+mncNzT9+CNfjMfz75V54K7mi9Tto42mYO5NdwyMM8fqLsiGv3wRS5lTPsTQmRxSs/B8qDs13vlPilT18Z1JbL9mfYMgW5TmKuJvtjWDaxqZPmex+L+pRuA4aJZsVIY8KSrikFju5nGBIhSU49oV/uJMrqRWvFUGuTUzN5v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IggwAbbW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fp652PEX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IggwAbbW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fp652PEX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AVAp093766
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 05:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=; b=IggwAbbWmNdtGWOt
	NZC1t16nsCCoDYvnR8PWijwHWTARmJZ+I0kKybQ+YJCfNg1nSkJxG82NM6NlUsKz
	/5XlUuoojCMkS38u0RPhGQOLVPGDdN9dfVtnf7J1eqOG2HzEl9NA1jesG1giI7zo
	4ZocwQoE+kURRbfyE7NFOaAKEEXPUKKp6eRVTCaZoskU/DFehwxGMwTEIJef2gk3
	KizFKkyAj+qnlcu7LqARfzlnUydr7CuGjlS7IePVT24pA+8ngb61nlgPXFwBke6T
	SDxovIc3xEaHOiplc7CKH79NheqISOdu22BNHhFgkdRLSgOGWFSMLdq1X4KE8EuH
	V8cRfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvurst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 05:29:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so5504530eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 22:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264587; x=1791869387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=fp652PEXkDto/ckwNul4l2dS0TT3arp8pVyRsxnfS2qSmEHonPtxzI7mPnJOKwAS7G
         FiXmeujWbj4FIvGJ3hurllQfErxCkEXwmCZL0JYU1I9uk7t1myr7eSuVDy8lAfDGmFRD
         OUaGwLGJzbPE2g8JwhgGmMJ3UTfKpiWUahObWnvzuUj5OCup8hmSJ2TCqDqHkZXasRh2
         TDWLCnXyEhSmPv51wPmkXMcOpeC6xlD/gZ9ry1/lwuNcGqf6jPlk+Ud9aEtQJ8gSvHYA
         XeUVz/+IeAJaPdSLcuCYIcBF3TN4nCXUj9Z8l5pPvfc3ImgR/5t27ewkrjiWiFi2VQSK
         JRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264587; x=1791869387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=GRWQxr93Umr0aFwv7ATo5rM1g+dhRdTM1rKvczNdhqL0wXyZfXbpaLEbBcHTub5nmK
         rydNCXWAmzjimwNrKDqB7WzfRKSMVfFeb/GksF42oHiIu+eYClPTLK5c4JNyNSmCioyo
         piZkQZNS8ujpWQbiz4/lDjuFnd2k5+iuGKU0VE8d+/MCTTR3RpUXh+CazxidDuZuG5h7
         p96hfQJHycGotG3/Tfecmd6k7K/GWQZ+da9gE+7ECKPhHP6BFsnypgvUhmRFl6J2SLBg
         gsvaCM6pDPSwiVN25eeWy4rYVUMbOet1v9eBcDHMM+tIUx/Q8eU/sOYkqiOj8RBwiLdE
         ZMpA==
X-Gm-Message-State: AFuF++ktVPBBJ0xeEoraPyMynSSOUAdTTAE4pIUVhV/zoWjMf2BeZ7Q9
	5dtcJsbWp/F2cHgek1tVTz9o7sQycWFYh1j9nyc5aajBsJAyk7H47daMzXTWf1Lglwu2nPQzyMB
	JN7uBKWdSMImUmcoX/8INzmz82LBmWJNDnJMwj6PzU4VvBCM9PvqIncznPk/lbS4QmPdp
X-Gm-Gg: AYBFou38ZEx86Aoek78mhjUBcUvUqKinVODOzCLJiFpyzt+BmClBwV6nbAgqxWqex79
	SwXfRYEePB1HxmA0103sjXT1yBaa7NtT97YSHpOJZTjbygXWuUEdKAMSHPTRHFdW3Veeaiqd/bi
	V3RW/pPfqDjKTN4dcG4VF+YF26aQ9flqQMqRau1V00l3x2hyRWVNOqL+edqzY406lS66wE8Mg/j
	SvIOLU29gUCmsmAwmL/7M2iMXo05kh8tTcB+0naFRA94Cq6XjFyodEnyy7y0ucPCq4qeNUyf8bl
	Tlpdoi482535jrcyFO4qMoCSq8GYUSbpkWVG9uZa4jf1bnBg5I1th3RwsQWfF7UephqezI4riSw
	poeCZ3Jf7/3FZ4vTrFwPtLMZIsqUJSojke2Ql2PWxkskDg94KIQGO9r0FTVLMnEefBBGBwtyGBM
	ArhpIWLPdXed3+7OFsngsGmmTtrb4J
X-Received: by 2002:a05:7022:1504:b0:156:3684:96d6 with SMTP id a92af1059eb24-15eca924facmr586319c88.27.1791264587445;
        Mon, 05 Oct 2026 22:29:47 -0700 (PDT)
X-Received: by 2002:a05:7022:1504:b0:156:3684:96d6 with SMTP id a92af1059eb24-15eca924facmr586297c88.27.1791264586924;
        Mon, 05 Oct 2026 22:29:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:46 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:18 +0530
Subject: [PATCH v5 4/6] phy: qcom: snps-femto-v2: Fix order of arguments to
 qcom_snps_hsphy_write_mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-4-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4874c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: y5nf1V2Qa18Oqc3OtEu3IlA5wQg_NMNp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXy9a9KT62YXD6
 j+ndJP3Sr/YUXIt7rWvcYPd7QbzVcQmSD6NcHcceg0kFS8PEWx6A4MADrjUnut4gj7TSfmsEtQJ
 6TAWtZ6RIWrxVy7U8Qbkx9NC1c1e0hlgztj14IYMaZEri69vgv8OQGmJmrUfzHuobiYV8OT39u+
 xxKhFINmbidu5S1co3skFMB2ZF8iF4VzRA8OoC2JrmF/xzruEyfzdsSAl/8VnFMT1VS2BHhsAiN
 dWyiiu9yrSN/tWjKlk5UKdQXZ68dXx2Xh1qIVd5aUkjQRn16Tq/AL/bY9WdI8JDks7k6lz/lM2G
 dWyRXDZ1lKJIJXX6zE8he8ydnZD/Yv27qXrOITQVnyGG4vjvHwfoxaq7NKcQPjNiTG5BMQlGukr
 6Ga5F2/KJFpyhijBI+pDKdqL8qzbJgN7KZ/c8ycI+JIPneFc5FNx8Pj2OPwfQjT0UQJ6Yu2/pau
 CR4NzLntz7pZQ1FFr5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXx7evFTLC9tGF
 ZUpRlpxvT+Mv6/Wtr80fmX9ez5kGQV/Wmalo0umDl2QcbFJyjEN7ZonxR8G+TB4wULy/GVVx6Eq
 GUr2qM9OodDwWCGSJIW/EP0BDLjgezo=
X-Proofpoint-ORIG-GUID: y5nf1V2Qa18Oqc3OtEu3IlA5wQg_NMNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

Fix the register bit field mask & value argument order while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..0ead37c0dcfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -193,7 +193,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 		usleep_range(500, 1000);
 		qcom_snps_hsphy_write_mask(hsphy->base,
 					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					   0, USB2_AUTO_RESUME);
+					   USB2_AUTO_RESUME, 0);
 	}
 
 	return 0;
@@ -426,7 +426,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					PLLBTUNE, PLLBTUNE);
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
+					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
 	qcom_snps_hsphy_write_mask(hsphy->base,
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);

-- 
2.34.1

