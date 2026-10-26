Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014257;
	b=gZvGL00D2k8HsM7qnMay/mou2MT5RkLQS4CnhSta60KWGqYPm7qWPDo5y4BBclgqYkTg
	 vB4X9R7OopWwhGQjTUGIG+EXQqIM+BnOShzyUyNxfSBMshjxbrdh2woyHJT3UHtzXFunD
	 JJyTXTpq5WWpPfHqlq/mSQP4Mrh7RQ7EiWcB065ioD598L+m+bG6WY3OVojYppbbx2nHd
	 I6Kv8jF0sJSVu54BjP4H63WJY2G/ZmqHzekUSRYRWxEP/IUTkoyJ6vnth8gguJnxVqR0I
	 blNc1TiQoG2ICjxFq1xcTZuvgtCuibPZYkmNseap6QpdlprtgrtwpQvXrZ46i30swmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
	b=yzSTPwwfyWTlcCr6K6c9j37bsKnH6KqhPLgWhfLAktPGwADKEbCHg8///KvnZFXnkTEz
	 MYYmqVMVAmUGUYi8x2kFCx30NLVemsDR0Q2Nlr2DP2zG7E+VB3eRmp9c+3dzJIu/enUnA
	 CI9GFHNcAeM1G1y1DtFI0DUa1UmjjMMBT8/yTaErQIbz7CHil+j0r18B1GAYL+dg3kuQx
	 jrEshEscq88L/7Sc6Krnssgvg2a0prsq88/F3X2MX09EtJdpx5XSxJ5U/PKhDL3wZwbQb
	 uE4UGHYDodtoKt97Cv3rZxnFj9DAWkXYHTDEY08hKa/nOAywwM8kuS1pqVatT043Kew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajL8txNM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B8E60A261A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B8E60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajL8txNM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2v83632933
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=; b=npaCX9jtYxzYT5Zt
	t7JV3UfqfK/8A2WwX5npM8A8GheMCA+qj+c3P1NesESmYtTssFoxz6b4+uHeBRYB
	MQdKYlRY5jKKRc92oQ3Y+9CoYXD40WPyHnAURMSfEvePs2h6bFQe5ShF1QkSV9bt
	hGD/AP7gXGbyhWeRuATFmp5KoD2WAF6vgKgHU4u/3pxpu8CrfwLHnJAKvdK1lLmp
	z0P+FZXpHNqfy89HCnX/waWyrlQ5SqForeAAnhpT1gfzezJC33TMkqvbzbshzi+9
	guAIn1wCZKyXU5vb/FPwi/Qh7c1sMuHy/x+7u0eqFAk1Djt/gzTvT+nMnBWV6uEI
	7xLAwg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf09wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adbc9a47fbso2787942a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014254; x=1793619054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=ajL8txNMeeDcaV4t3/kNEeh59szn487U4BNRAG9zOyH86OFvLn+lfffVs+8P+o8TmB
         dcmG+4wvSVeWQBb0I0cT3TJkfhBhjB3YSsK+XgbC9FlRq3WNuktkprwJHaaaw9MLUhyS
         UoDsF2gGxQrg1C6euYTQP7zNrsfbLLHmPjKDY2z+cd6RAc/OJ5TTV8P+v079oOeLCcb4
         LGi8n3HN2UXYvKKwKJEjTpDvn9rtCdud+UrJSiC0OZNHvIkziMurwXxHhdZJIOfN1bf/
         JniK05KrU1sk9jaWqZ12X3jWxPVhPDZ+4+sGYt+uCCCFhaKS1N1EI/jkKVojy629qx43
         c/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014254; x=1793619054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=TaibxYW78M/mTcWpHeHFuDC+acP4y0rUHcDApHVRn1Eu7T2hxE0eyvac2oV033tNor
         w/XEvfHAZBSzIAPy99PfvUBcdza92K2lalKOMkv7K0hasz8sPcRSQAgrVD+tO3l6GWbr
         HCscKW/9zoNv8Wfb2mSBrcHclaFoaaPtHcnGqknEYVeZ2JpQbufFqJ+OLyrLo59ricki
         gcb4I3tYFl5hTowulfQV/HqQIqv4GZms9qtocpuEL6FSsib/4COdoOl7/Z6cTdtesxoU
         sLH+wGQDdDOF3oSlbv/0cqAkbB51XGV/HH347T1fjwgAnvT9Qecjh9GLgpPf6Q+tLsJ5
         j4Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzaCnzeqNfgfRmWJzhoNClcMm/q/kz3pyg87E3CdmEPgiOxoeol0S/Bs8hK6ATLTyhkGoAjhwNoSvepPy3o@vger.kernel.org
X-Gm-Message-State: AFq9FYJ83LXbtlNWgW3CbgqINxMijGNaUbo9scHUtMuXc8w5urEGmNeC
	gUe/rcTib6Yt34eHxWtej5fgIl33iMjVI9mG6aGujIGWpHjpEmPbntFR8kKSBhIaqFjpexWa+yA
	B1+QnhtWTlp1HeQ06MdWquPXgrBoXSlQUkXW3KU25XMxbiJAxaGsu84qjUW4VoaHwutDN
X-Gm-Gg: AYBFou1s1+P7R40+MCPi0K/i3xzuXKkOe9zoUT13D8HMtvrYpj6Q25aEHR5L783SYA5
	zbTNo+GmwzB+/F9ysCYU8zMddkeX2iQzCpfvDSK0+fPTp8iXGZT/pLOo0lI5tXbhukh588EVSHV
	8w4w0PUkPxvY5r37/05f6Wu0AIMBL93vPVXPD1+90KAzmxhzLH768NyIlcDFW63P7cLwPOQ259m
	tCNM6Z8zcs7SyEP9LyTkH2U3eZdH4jMdJQH2mrXjPD7USvqJW2OU8bbIeV5Pf4MTjBK7/C9Req2
	rKVKAamkYeIDx7xKl5wkz1GkHfJ+VpKORsD2m6Sq9ZjOnu8fewaGNf6WbVE9eMSm/D2JbPrXxqN
	Y+9vNtp09qAkberU8tX3dCLg=
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288316a91.3.1793014254502;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288290a91.3.1793014254037;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:35 +0530
Subject: [PATCH v2 09/12] arm64: dts: qcom: qcs8300: Add GP M/N clock
 controller
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-9-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXwdoOoGiCKwmQ
 KO3L5t/pWtif8hGHrirnF+3xYWlAFEaOFtlSVFrH+7E3twQItHk0C9Mx4jJ1SSguGcR3C7EJb+9
 Wb+Ex0qPHnJkhO3GC7ZSuZTCknDRT08=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf39ef cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JIsdQxy8wyWm9aXyvGIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: MpRS_bGeW97RHCyNqXQlugo3JjibG0Vz
X-Proofpoint-ORIG-GUID: MpRS_bGeW97RHCyNqXQlugo3JjibG0Vz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX4utfXs7IBFqN
 BAtDIrgqc3Hh2fkLCGCxRTDgKbE1aqkWSei8Tb12S0IQqe1MO2jv2TPMJeP3ulGFPqDDbLE3FmW
 me3RwKRwnBJW4U8jILQQCwPo4600mCCt6Y8+bYg9MlZcWkd34ki1Vy0PnbA4+QKOIbIhCdtk0mo
 tANkZBeDionM2BELU7/kRgqmOFB3TQ63cQwgQz4NswYyx7twds78cAR6eg6BqNZv1VQQzDhY7+n
 s+MfvnQVsFG4myIgy3Z70ONw5td7jiyYwHkXZvCb2UBAnyqMY7nHJeJKFQFmsd44TdJsQL5P337
 Fobl87+kzt/f4fcXEOhIX/uCh2KMobFNiZX6ZILlC+tX4AubSHYPnFXZJ6FJP3mfTPBerR8g3Yb
 tgxNm9RA8FSIbJddneG6jswa2pY2onMmiPOv1tDaAZC1ueDN8bJkbIx4qaSnZWMMRmDEls4tfn4
 gF53TDPUiQfBTp6wDRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS8300.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c652005dae9b93bbb8f6a28b48be3b..e122f70eaf20c65df5854e644887ad16da94a7ec 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4891,6 +4891,20 @@ sdhc_ice: crypto@87c8000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -6457,6 +6471,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1

