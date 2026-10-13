Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA073EB11C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875417; cv=none; b=jLC1w/swYpFttkduQSFviPLSxRBl3dPa1xAUo7ApD9Nkm3asN4uFWtEbFBdh3ZCDn/m+Gwa12t6Cy9VKhyD0THKDHIWeGG1EB2BtnzD54i0gPDoa3I7QMoy8uvNZYKbfUGUqraBdNuoXaAK7fPcF1dTpQ1KY1UFdLaW35kSVqJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875417; c=relaxed/simple;
	bh=uKLWTrcDR7c+0GER3Ovnt8iy0jidYHa0ZNUnMq1N7iM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Doy95yCnMLbzpf5/IwBC7GJp6nj2L0Wkjyq1sXip2ulxS/TSM8BsniCubExEkEBN8ieuyXW338taHZDTC0aCaXZyEg4lnoey+2MdNTKdpycetYuVTT6F5UiUJPNEH6mqbB/mVZjqpHYarajWSuW3p9rBnaAfflOlmnfZXnf8y30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwIUozhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDW8Ckxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwIUozhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDW8Ckxi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D212kv4071816
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=; b=nwIUozhnlodgFMfQ
	fTrYp4goMiGU85bztPsWLGH/E8v2BkfnbUCRm3z7mTmbHApk96JFSSlODnC3HT0K
	v6T+VezMNnkAS48ETfQcnlQ8sq4eTJJ9xUsGKXBiE08KnXrwE2Yildj+YyISnzo1
	2ETyBIGO1GJLm2OEE5W6+R7bTPvqJQJHreswJob0ZiaInHtYOSJ7h68GNWDhgjZ2
	SYZY0znCcoFKqc/YALmwJpXtRxLxJsKwDdX5ziInM6D0HZ2DHhaDEg47a+Zx6hb7
	KCyJUw5L9Du13+rgbVSiHpa14tJ5P0bMw/SOBtj390Ph3zHcdgoH26USG91DuE6V
	GBrmlw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jju7pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:10:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2072437eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875413; x=1792480213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=;
        b=TDW8Ckxi7B1ufv3nu/q7bjbX0y+CLiE+8D5ujcHyWS39SfkzKOg0L0qiQtKcpPzOOK
         z+jxIcnWyfgQi7AkOXPx/JzcsGQ71/yeIwJhHv7MTdElx17bsDTvgQFLnYOvJo8CjYtR
         u4dDZxpfDS4ZCew/RvGcAEQvGV/i4/XbH4Ew9qQUhkL5rj/J4lX5w/qnTghZXA6siGoV
         P8H/T9tKctlJmQXehPiAnBh92vIKs4kgU2Y683ikTVLWAkuzeqRSnmwAlaP/wqEregtJ
         n5RX69yVp99lHIK2vU6OhYT0U/fVwum4N/V7TM4hpeeHf+8ANLF9VzEWNMewA9tbtuoS
         KDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875413; x=1792480213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZw9sWzUNq4w+U3H1PQGNb7dsdduCmaMFKqaVwAgHa4=;
        b=VUW3c3Rn7OqyTfH6kZzdPHk3f+bVxW52lEgeemKd+A7uvCoHt+NVc8Im0bhSIzFcUT
         H2Ibco5j3lSiF7tZT7HAXLipYV00IiSQ2tCYtzfRC1RFYjOeQOfiLLvp4s2w3WsA5s2x
         wlOByNhPuNVwhrX/v7sBYea54iU0g9mPLy7eCcxck6txwpMejumGF5o6Z3Hgj0k7vXqt
         krML8Zh1aF4Y9c1e+4c0lStn4fmZl0If6mGCNv8W9QSgLuohARNk7/vyh6SDB3CCAP3P
         qADFaIbNMDDAb1WWmSf+wzX/y1ve7jdOxSp+g7eMqeATGBkEaGXyNRj5yBn5PhIbdrpY
         7h7A==
X-Forwarded-Encrypted: i=1; AKwUvBwgrHhul9QBbrivmSwvgSl1TAvuD9zilQAg+TrL9wgghsmSnC2R0trgUfL+MwhjU+WJp/7Q0Fkwm8lxnCfr@vger.kernel.org
X-Gm-Message-State: AFq9FYKh2N7D3DTYdEFdxLFi3FArq7kK5YqctkBrIZE564ZrSmB/B22z
	3BYwQXSX62AqcTI03I+8nBYusdxeuYcRG8oX3CMTha9uObVZJxbEyZwNkZ5DqvD/5e/uB6TaNS7
	V2GWnTHhSeQbL7X9MZElG8lduUi9+iSgJ8wL4GaBUg9fYB0kIkJf4Ukacx1+BV7M7xmIL
X-Gm-Gg: AYBFou1JbQyPk9RxX1TURdlpHzZNhREU1taC3kKX83ugSvXz7EHNwax2Poq1X3hc01d
	IWaUz2udcIEQlzRSB6Uqw7dHyCs8C9y8Ucfoybo6T1EuIH1c1UY4Ra4UDoiXXrFnJRwhDQITk9x
	SejmVyOHDHCTGy0FTVFAUYyfRdLhB2uriTNG+m5H72hXOQ6F8rbgrAV9CCVxZKWkl7BsNPZe02H
	K7PJRSD+4uB28Ik6xqp9+zdMTuPXtSCBImvI18zffb9rd1rsZeqm8klHQMu5TlqGvhJyBMAnSrv
	AC3A42YW/QQZYftN72TD6ORvmo6CZuzXUVN0+itoaUfQ56eZm5p+UpTSQTkBmxfH3CwNd6jeT4g
	iHYbJafUt/hfN5i5ACIcTInR1VrbfbAB6vMXFeMw5TtUNKxSg5Za3A0VcRK6qcEFiXaH5DgoYuw
	M/L8exby2YjvD4alYNypu6s92cSG7Mpg==
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr16364106eec.5.1791875413016;
        Tue, 13 Oct 2026 00:10:13 -0700 (PDT)
X-Received: by 2002:a05:7301:c016:b0:351:1cc6:995e with SMTP id 5a478bee46e88-3537dde3aeemr16364064eec.5.1791875412510;
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:12 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:39:45 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-icc-v2-3-196b219e25c1@oss.qualcomm.com>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
In-Reply-To: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 4qFDmZPOTUVBjZtQwW_jkFLRs39Gmm1D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfXwFKqknw15Gfa
 Vg9ONrj8pjL2BNsg/Jkve3mIRWC+GWrOMdX9+50WWDjL+uLdMjjCvlI5tOlQxCohwFZRcDuplDw
 saytuAHyXGpPtrWEU4XS+y5JJsedWC8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfXzB0fnHfUi8iI
 ZADLroZDEfu5m0EeOPXpPSsUg//7EujcESKOwApgOifl4pKNUN/ETuuMW9jMVLQgBXQLE1svnDz
 qe4BlXAVwvBVkStMP6Ct4H/vRZMf3PadQEDwufZrsnfjiitElntyy2r7yRhHUUvuAl/nVopHUSK
 y3/VM2wKndjt0XuTU50TW5Trop5FJyf3mPWrx0AOtX/dmW/tAHuMZfkSVmHp3juH9jziiVezMmb
 RYj/l7KjUbdcqtoPo6HdfGntdWOV5OuOj4nLWELVJ0tywrzfxe9cJtXYzd8D0Tow9CIxxcnMtoD
 tg2mwGQqiHCSzkXPjrKYEVbWbO63qEaWtBXIjgcvWDih8NpVMIuUg6xlivqIiSIBIEEOC/br11w
 ZQr1pHql8UWxpRze+aYCGPPAqlfz+CAJgvMkpUsnRgXkH+9A3E4J8hezS1WmYqag06qPcaI2WJ8
 goueguCdXEsvFtwHcDw==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acdd956 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JR9XVsisKQFD673mhBYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 4qFDmZPOTUVBjZtQwW_jkFLRs39Gmm1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130028

Add 'interconnect-cells' to the clock controller node. This will be
used for enabling NOC related clocks using icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..20e8b240642c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -152,6 +152,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1905000 {

-- 
2.34.1

