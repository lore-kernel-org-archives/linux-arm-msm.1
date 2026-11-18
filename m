Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981862;
	b=L/DpvmtnoPxd3cOoOsBFbaRHRj6TtiFGNh7bcTidnNgdptRqq7LZyIhUMc/3TaD0EPda
	 GeKTy0afMsSFiMJgH3F1454t2ppK/wrtFi6bVECBvlzNaoquwH6FLLftt1MOzabzt6x6C
	 MAJ5BNkrmhLRNa7+AqA+W7BmU4uFEk+0QMow3lK3oD9ObpSYAJnbq8S3gHv1oPUw/yb/r
	 TDtxGRbO5GtWMF7hnCtqTjvKB9g4w5hvl6aTEPt6ZdaWLljBcWkpX0A4u39rIabpQyHNk
	 A/Y3JLCvCJ6iZW6M9fuCJr0Kq4ZHaBt+UmaHvGRA82ZJQNFBkJB8hpKpBMfw8FG0Mhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ob/tVWI2XxD6etRSwiBuLcU/ib0vpkb8fQF/8PO/hHo=;
	b=govF/ylJ1i4fSk4Hw6D35lIizeSAD4yZ3apUNVfHJfjtHd5qvchDBsAx4b2raDjIsIJc
	 w5Q2zuBpa8juMPEZ6Hf179q8tzkmuuq0gWemN4J9SRu3LsE/zjk2qHdmLJYJRo2HEuVR/
	 LQsnrxo37Jh1vGqKA/NA8GntE6EjP8UmTeeGr9/Z+B0V7+FcXBiCtvxB4HUfdap4Y1CD+
	 X7J9eyaNONAiPtlzvHgIHbhwa2LAvQ6YnIuvgAhPfhI/cT5K+hHI2a8y3rMlcGELxDvEu
	 XQKZhhyP1U6vO63cTwOM06zgXUQ8nBRec6fK6iCTHKPui3DsoinE3vTlRv/arwYIBaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzvZ3Hc7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvFB11KD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2B606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B2B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IzvZ3Hc7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvFB11KD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uoke3371277
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ob/tVWI2XxD6etRSwiBuLcU/ib0vpkb8fQF/8PO/hHo=; b=IzvZ3Hc7sXEM2y9w
	B22i3q526s2eXREC7kxz3jbD5rEGH8XIfcKwHa8detlRbx2BTRfjyAgHQXWLYW1v
	rWQdxbPMdJf3QnUZT+DD9c5XeBERiG5zJC9jh/YJAaHZ59ePld+YvH1VTF829cyF
	SpIme9FDRytTX4G2ErhWumnVPC7sp2wHjjmCKarupF2zzW5unckiA5iT6pIqkT3k
	XNmvjextAoYrYhaNlXk55hr/3mjQ369lv6r1gNTtXzQU0I16cXRpwNxDbgoQUcGm
	5GkpBFSFCEQGiokx/KtbCJXN4oJTbwE4eTi6Rimg7qjv67Q1e6DfoI8+6dvR5iYW
	QJQFLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sf28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea0fe07201so4216575ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981860; x=1795586660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ob/tVWI2XxD6etRSwiBuLcU/ib0vpkb8fQF/8PO/hHo=;
        b=GvFB11KD/TVzLGvtw6X8tCBXRqE7F8u74TxjI3n2yGgyECQT5LbRZxi/ikT0tKrfgE
         ZJ+V4ohzOrupaf8YJNmlwpZJgXHNOzP86FjSOW7QfXaeA4dN2cA89spL+ou6u4yWEPGR
         XPVkHoISL0XYgXhzl/8Q8aMAk1cKUFV0cMqUuvfgAq2i8jzsmjU13aV9TA3K7I07QT3L
         PxYpuHxmPwp2RcrFzii8oj7LEoPQ2QmnfFy7kIUGj2Vlx1PEjMGoMpE7I6qbue9RzIP0
         3bUKMg2b9tFtrzvUOTz5C5prmXHh0Vb4JtnB9Fa4dD7HVQU/z9CRIbSZCDW4l+1lZPsH
         e0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981860; x=1795586660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ob/tVWI2XxD6etRSwiBuLcU/ib0vpkb8fQF/8PO/hHo=;
        b=0vTC9IrN5CpEtIorSo5jVi+61LxsPc+0G1MUh/jRTWhFhHK5iNXBv7U/eL2GHKsYYf
         oUk2BHkyjupKXTGK1Ea5EXG8rwArWRbsd+Yofff6f8rlNWPhSJVBy2/vHlpASqahGIU7
         XSdF4O3n5X+793jrsp3U67SPhElEI2VqfS+Co38kXvGgGtwBkfPGWE+gUJdpUeXcMZLV
         nLYCIRvVdGFtiR00CM1/WyAso64eUIGeTmLrFiADR1SXc4usfhJ5yJoE3eHSgF8Pgc/Y
         /euCstVX9C12q2Xqw4xZfUSAX+3nBZtST98/XXNPVYviV6YIRtF3U2IhK+KMXr0+a/4D
         gSzw==
X-Forwarded-Encrypted: i=1; AL+hErFrE3EJnRS8hO67HI0iNK8zFQjSOvQ7arotzrh4lgMeM9D0d+e0MDs98ZOkY0ZtoZpqS5lNlV6E0c/pW0Dr@vger.kernel.org
X-Gm-Message-State: APuU4Z+hddX2E3bj5VZNemeuUTVV8CwcJiVUgH1Z2qn1zScoF5vzcXyg
	ETw9+XESrGLZs/4g68LxCJWcURJ3CrrezdwS51ov014YW4A8X8wgZMWJdmvYI8TcBEx/Kk1gl+1
	mugZJsY45/a+EOnFUZEBpqbVfcuqcjLaIAszp3fw2/fV80CyYblaF2h6w3NbqxtYJ+8dl
X-Gm-Gg: AZFdTZct72K6IHO7z88RXEQ6PY4Y/IVl3jH0pvLc2Bunb5pgWforFLOfVCVyjmpBow8
	UKgpwQHOb10BdcnrVW/jzf4Yg58A/Cq4kExZbwU4OZwRw5IIOxQZzT3vbWqNP7FZpjKT2QkVTOs
	pXsuR1QV0xN740KuUjSs2sSyG9j/SEFIyhZTyccKooClXpS0QOnc/3bHqBipL/KOR2gbOwpOYDZ
	1HFYg34zJbsHuXBB8gQ30BKtZtayfzo51URSVKICSxxM0MHnykh9fQ6Twd/mR/PTx16HKMUmp3v
	r672d0yd3UdFoHWiRUgIqWPQ8fZgiFcUWrHJ/sLalJZvbojo14Aii5pkElNYdQBuEUFID6S2grg
	v+vhVhtWCHaWmchFY1WN3GkxIHeYKbiGTTI7MKEBfvOIn3lL284TpsT6uNF8mOlTrjpk+Q4hbEQ
	==
X-Received: by 2002:a17:903:41cd:b0:2e9:9a19:c4f with SMTP id d9443c01a7336-2eff76a8118mr15550155ad.61.1794981860215;
        Tue, 17 Nov 2026 22:04:20 -0800 (PST)
X-Received: by 2002:a17:903:41cd:b0:2e9:9a19:c4f with SMTP id d9443c01a7336-2eff76a8118mr15549805ad.61.1794981859733;
        Tue, 17 Nov 2026 22:04:19 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:19 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:47 +0530
Subject: [PATCH 16/18] pinctrl: qcom: shikra: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-16-703f7badd194@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd3fe4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vWAPUwD82HWDNdXDe9sKlKeptKTrtnkW
X-Proofpoint-ORIG-GUID: vWAPUwD82HWDNdXDe9sKlKeptKTrtnkW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX9SWOlp6RTBOQ
 jeLEd9yOSvln613ihoz4s1ebz8gyUK3Kjco6IGpInFpgJlbNtt10sN1d8Khn0O4B3nbxJsayj6u
 PcFMCtwzl7WOZYuzYQmBUA4oFuy/ommLg6FVTI/76Zj9OP9YRWuM0DWlkeB6u1/g693evTh8MJd
 oLyIBcyd5mrz2muLcP07IOYqwba5q7/20cXk8a6sLCyrf61IqhMNT24HvLjqV/Jc00Sih3IzZ+u
 SvNBRAAd7RZfgtWevkv2Mihhv6jn/txyUNNaUQEZ2xrttdVtGDRDLwlg7wMuTn/an8SfOs2l9+I
 SVexkv6CLYaXYMYH3AmcpFrd2fhD+WHyyDJzuI6ZezvO2d4u1oQE8X+2Dg+sEW35UHGBbYVDitD
 Ceb4iyQcOuUvcYjL/wwabdfh2FooknEp8jGcT3DY2KbiPtqAzyo2F9tOISPr1yHD0tjvpFhnmCA
 +aCGsYMVad4Q9lM5pSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX7VdsEmET4zms
 UVGtxbEyr0ay0wLVmn+ZwM0EY9jxOMH5OQmG9O9C48eqMTHAOFSrgeM0XBkBkJe/PG93EFUC2yD
 YcZljuPnZxqYGas9jOoc58JdL9hOdu8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180023

Add the gp_mn pin mux function on gpio87 of Shikra. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-shikra.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom/pinctrl-shikra.c
index 55aec2f675e6b0953c6a7ed1d9c33e85a47bfbe3..c411ddc48440db732712220b57be6ad1278fafe1 100644
--- a/drivers/pinctrl/qcom/pinctrl-shikra.c
+++ b/drivers/pinctrl/qcom/pinctrl-shikra.c
@@ -459,6 +459,7 @@ enum shikra_functions {
 	msm_mux_emac1_ptp_pps,
 	msm_mux_ext_mclk,
 	msm_mux_gcc_gp,
+	msm_mux_gp_mn,
 	msm_mux_gsm0_tx,
 	msm_mux_i2s0,
 	msm_mux_i2s1,
@@ -666,6 +667,10 @@ static const char *const gcc_gp_groups[] = {
 	"gpio45", "gpio53", "gpio61", "gpio88", "gpio89", "gpio110",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio87",
+};
+
 static const char *const gsm0_tx_groups[] = {
 	"gpio75",
 };
@@ -945,6 +950,7 @@ static const struct pinfunction shikra_functions[] = {
 	MSM_PIN_FUNCTION(emac1_ptp_pps),
 	MSM_PIN_FUNCTION(ext_mclk),
 	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(gsm0_tx),
 	MSM_PIN_FUNCTION(i2s0),
 	MSM_PIN_FUNCTION(i2s1),
@@ -1103,7 +1109,7 @@ static const struct msm_pingroup shikra_groups[] = {
 	[84] = PINGROUP(84, uim1, _, _, _, _, _, _, _, _, _, _),
 	[85] = PINGROUP(85, emac0_ptp_aux, emac0_ptp_pps, _, _, _, _, _, _, _, _, _),
 	[86] = PINGROUP(86, mdp_vsync_p, mdp_vsync_out0, mdp_vsync_out1, _, _, _, _, _, _, _, _),
-	[87] = PINGROUP(87, _, pwm, _, _, _, _, _, _, _, _, _),
+	[87] = PINGROUP(87, gp_mn, pwm, _, _, _, _, _, _, _, _, _),
 	[88] = PINGROUP(88, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
 	[89] = PINGROUP(89, gcc_gp, _, dac_calib, _, _, _, _, _, _, _, _),
 	[90] = PINGROUP(90, usb0_phy_ps, _, dac_calib, _, _, _, _, _, _, _, _),

-- 
2.34.1

