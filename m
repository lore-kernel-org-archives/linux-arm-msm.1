Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981776;
	b=hxEw/9G1XlJqUrAFZnAonKyyruCLCkUB8v/olk3eXen3MrPWr61+yAxqyF8YoPZoJsDh
	 f/KSkI1MuXBHkAGBDyVdf7EV8s6mmBkQUNMYPbG+aj1cOsEh+zbFjddD5axsSeUcYl8MG
	 fZI4gd/xrf/3lc0RUmzwwPFEb5uYROLkrTUaIRbqyP7CEDc5amZiHETghJr0X6nltcLws
	 U4NFvLfISB0BxpXwNjfzpQXqK1wwYgrHq+9DPCq+br++l0h7g+7EiMKRovKdLRU0pHihv
	 M/58RBvSl9EDFByyi665ptwZlWZR1/TvryYTL2aaQRAHgjUFibXsjCpNbm/DvRDqTVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
	b=G7y9JotEsWduCi6TdsJxhYkN81Ur7kMIQrsoEGCDyEUOw+ebDuXculczAoRAEKg3ZcEr
	 9I4wFIHbLUWiXg4aYf8BJ4TnGgnP4QlkSKc2VKwILH7IpnrlKS/JLC45bqDzmUDEB8cis
	 SQMow5R42Y5EMpVnQ42Cp6wyxm1id/1lpgbXSasS+F5ycLFZQxqx1lI6Nb66tL1qyIS7S
	 ecSKprxREkl6aQsWnpbVANIs4+zqw0k9jOXmWVbyvVJhfAO/NIRqyl2G3xF9G+hwzTsk9
	 vptHOXov33J6ikAjKW1oE9Uz4FgKYF+6nkApEDIxHZ8+wWaMEN/AgTn5pFMBTgxj+Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IwhNYp45;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xv0EBeHm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1854F606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1854F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IwhNYp45;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xv0EBeHm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvvI2453546
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=; b=IwhNYp45yfTHbrN8
	hXWdn/e/aWA+ZKN7VhfW0e6k3QGTIwcSXL2k2pvr85n6e1ZUn8s0oOD4SobYfO/l
	JY4JFxOfmWhH2dWsRnTRXUhvDnOctE+qRK36UVMXucBj7lWDC3X9XGtwzDgBCu1w
	eSH635JDem7ug8xwbgX5irsxSh81VUO6YuYt5gSYtDum1vckKnBrtM0ELLz4AX91
	GPX6jD+K4rwWJHUDhgMDLBTa0HTdvwnJEIUyUjX+Q3FECx16WgQSkWEafxeCYPIJ
	/TEJoRXJOm1mwKf2XMd2f0wQdFZJNrmUMTpkKsuk8ntC5M8p4/ONfPTJLUoKPxHN
	ZjZIpw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99enh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:02:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f002ee475cso1664165ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981774; x=1795586574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
        b=Xv0EBeHm4ymrqedm6+K3Z/kCHblBBkbmMq59ZXD3aTKiI8c6kSI79fw0v5/cr9uHVw
         U6WY6Gg9+PRX2oIOpK6ouUr/J7NXmem3wiFfzsQitv/zVjju5jv4FM/MWf2OA+Suihrf
         K+PQNcEjDIa1SsAuhe8N5oyQ9/1BQ0+c5qcPZfXjbiijXF2zCfQaro101p+Xnr+jQ2AL
         4hyiGbTvdPNimFczjv2P6KQ0T1yw6ImxZwTClTUfvE4nEmzg1MRaKEL8LRHbqslFXsGO
         SHj4Fhja0v2/pUjDHY7luaC5CNOIDqCJWbo8eAP6E0UOTvgivw2OTW39448z60tZEPAI
         wOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981774; x=1795586574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
        b=wbdb9OSIRAGuiGhSvQ7D/xKtfOFPFEfTfgpFcUWLZTmc/YO8IOIIzBPZo4gPy+DYiQ
         aIERv46y99AI4AVwV5/N1mHF/9XmP/KF4Lh8+ZQnh37zojXGdrbMf0T25hL6KHftBrMX
         uyoFcZujmnd4bRNr7Fw5kX8CYYvGuBs7g/gNCL2Ww460ZB7vYqiaj9uqiXlpRb+SxLEK
         KjrEx/EcJS1+lba45tKRoq9YjjzABfoAuLsKKN3ttzK8DVkFi/3v5cWbQxoz6w38R7ol
         K4Ifxo9zyQgDUf2O8Xnvo/02OniU7o3+DuUbp3Z7zfXQ/pMjbXCmhZGfLx7i7tqOERDa
         0Tdw==
X-Forwarded-Encrypted: i=1; AL+hErHnakLFzJG9l54r4IrXxE4Bry9Q9pJkstlDzHKk8QyjVfKuPGWg+lRawIJj0Gl3rz3ZkkYaH8QsYUYosNmP@vger.kernel.org
X-Gm-Message-State: APuU4Z9CYPpQfRiw3o/HDYuqBnyq5LeNwOvj24pkePwf7yupVBpJj2bO
	9KS1HIBRCPL6l7qP9/9LiDkv/3K//Rco6l5QTQZFkIz57TBaZNAqFjzB6sYWbHdt8iS8CBmBjl0
	pUrJzT0bWCIqtJBKHJu7lYtSQkf3x2AnPEsYc/jLbNQBa9xLa8S9+Z/WL2ith9QqtbNX1
X-Gm-Gg: AZFdTZdT6kKtUlcp1LTMsPRGhlLdMWO3LzZL8VrMbuPQcNYfkHmqduyK+DxjjNQU4TR
	KFFmLb9qanI7cDQMb+bXkc7x8MgfbrBJSosbOncCaRTOw2qNvgSfQdoKWCkQLXl4WQF0tQ/tjsr
	wrecXTdjrDnN+2bu/N2cKPstPfCSm4WS6s0qNpMmVyrg/oa37sqZQpGSQv6ZWn0ICHijtghysBE
	+i/qbbsaMhOLK3YBJ8mckrF35kYDud/if7JL6suAiq1WZxP7CHClbszKp41qPli0uUcMEzy27ac
	TRsiUIwXgYLC+l4oObuzZNFbPzpDcUj+/ZhuNgDvVBuqlbWv/3L2kdn470Fv8USa4dIRxfF1SxE
	1/LpNLnlfX7Wt32MybQKG4FClIxhbTKx+gQBFyO9xkolOA+AP4BJ5nAVemykK9owzFbSBn60Riw
	==
X-Received: by 2002:a17:903:228a:b0:2ed:cab:e973 with SMTP id d9443c01a7336-2eff73f1f09mr15536145ad.13.1794981773942;
        Tue, 17 Nov 2026 22:02:53 -0800 (PST)
X-Received: by 2002:a17:903:228a:b0:2ed:cab:e973 with SMTP id d9443c01a7336-2eff73f1f09mr15535925ad.13.1794981773512;
        Tue, 17 Nov 2026 22:02:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:33 +0530
Subject: [PATCH 02/18] pinctrl: qcom: qcs8300: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-2-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX1y/M0DW6dqK4
 YrteXoiYz6mXfYndW5ma9g1jCgRGKjm2cOpuyi5swJRgrt40vcySPCYEi9wmAFk7YCMnmTgTgNM
 UgltWN1n1gm76rNTzh4H9028UhiUl5E=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd3f8e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX55XbKJq5hM4b
 x8HydindBusuSXhNuvNBYI9AK/3zhKIygpDO4lRpl/Wd7l0TCroERt/VUIw2LbYGEVr1fPiG5oW
 qUg80g590MminBth4viTiTjt7ojXviaW5OWJ8Fw12GOjt6j9+AAcOBSBXuAmfNTGKJLkd8DbCzH
 mmxld1Oa4rapzQsK8TuntCqnbEDFrXrqZ2zuRJIMob4D7zuYFxMsN/XPNMZTAi2l1Msnz7wp5OA
 Z4EydgdKDPw0s8zthvE+zs/pV4ThGe2MfUd3LBXbvoeBhEUDGs2RXkZXYSG1X+bjMTFN9iJxjNS
 b/MZ9RuH+0dbCyblHOSze4/AROHojCf7R73fm895RCQnvVQE+gZo8dk/9u/XXWs5kMxgzhSNjc+
 RcTYG4G7yfHbZq75+4Shxb8+3VCODuqoBAIkcldt4SGEpVLV2XvgGqsTMezXO+657ynzEdCE/wJ
 QMiWlr1zNcXTrb5/Tdw==
X-Proofpoint-ORIG-GUID: 3RNx3_vZh9-67IUAPphBfuqRgbJk-zxp
X-Proofpoint-GUID: 3RNx3_vZh9-67IUAPphBfuqRgbJk-zxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio32 of QCS8300. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index fec86818c51188a0949e268382fb0c5de3f66f1a..349369fcdf18342b27067b91414eacbe378224e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -424,6 +424,7 @@ enum qcs8300_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -651,6 +652,10 @@ static const char *const gcc_gp5_groups[] = {
 	"gpio76", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio32",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio106", "gpio107", "gpio108", "gpio109",
 };
@@ -955,6 +960,7 @@ static const struct pinfunction qcs8300_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1062,7 +1068,8 @@ static const struct msm_pingroup qcs8300_groups[] = {
 	[30] = PINGROUP(30, qup0_se4, cci_i2c_scl, cci_async, emac0_ptp_pps,
 			tgu_ch3, _, _, _, _, _, _),
 	[31] = PINGROUP(31, qup0_se4, cci_i2c_sda, cci_async, emac0_ptp_aux, _, _, _, _, _, _, _),
-	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, gp_mn, _, _, _, _,
+			_, _),
 	[33] = PINGROUP(33, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup0_se2, gcc_gp1, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

