Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200899;
	b=Whljy3nzOgyMA2U/3ZeL+1kg0eVFxP5ZLxpuQvttW42MU8CNaYog0qve/U7GKECiTLPr
	 WaEYR5oJopiBVD+CAC/ny+gDd7jnsQ/bultsqDOnZfD17EIbf45V6x1/cpkR8rXPkmDq0
	 bpWAnaDOcm9laarvH3+/5WjF0NEZdhxT5+YKU9kYVBOPl3tV22oohkyxUIAE3cZ9VqqYy
	 tsq6IcFMlTLc/mv1fwJfrXseFTcO6Pv7tb4A7DGFNyf6sjvX9QOJFeGCQs/LvDHJuzeVo
	 os2iVP3vL1Gulm9QP7XkkjUQyVMSdcgjxwYxHptd6KsGDiYCejWtcKGtVAtr/wA6cAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
	b=DtU0jHeQe41xBC3em1O4tVEW/DCfXFYVtZaPJZnxWmD5+mXOm3feAuzo9mOQn+AfGftb
	 mMFftPTTwLGyxapS0xsGtl9BNjLKYIYJPwCHryam9iWNogyw45fK+SoFBWkQSnmVxZjiW
	 Ys/quYaZrTFzq4tJFcncCplmp3LTniNGysxJwlQqVeD92wYES9ThYQKehOFgkTi0Ry3xd
	 cHoseMNpEk5DOt11WQ0OsAR7qKl/GG86uI5DYSubMp3f+LaK8IHRwHhu7H4Z0LzMdn1g1
	 KJQUuSmaU+oT8B0nBqQL8zJ3uleoREKchpREmtO2OGqG+t8rY2n79GA4WzFbHpnr9Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYyPY4uI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DsXZZ+oY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B212A60A2607
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B212A60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYyPY4uI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DsXZZ+oY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAYU21153386
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=; b=KYyPY4uIeIylLUO6
	z4yl5UozBPzx75kR5b4cgzHeRjWUzq06WCeh/XZ1uQPyTDRpawcbiNdmaM0Irv4O
	ktiealJqOSjYchvjImimcMVMrae2FCG+3frWh8VWOUXetMsWrnTURN49mqxu31uY
	EjTa3drCuebJaazLeiGtFR1utGzzEBcLix7HcvBQyAP3RWZFixGaRfKRQzhIGA8S
	/YA4ctkItgAjlzuh1tq9hB0PB9m1o67eoKdVH2ERkERNRS2TbrwDtQVNX6ocImlo
	sG+gveqs/Nbi2THtYvaxjxqTOGoaoWqBC53Lzdnhtw63LgCYNhiwkPvo1rcfhDZ0
	miUwaA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be34sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:37 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679a2297c50so1059816d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200897; x=1793805697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
        b=DsXZZ+oYIA5EC13rOhqJIwVdaGbpuk2eItxHnqeQuKSvIsYXTf3FJhDjcac8ytVNyO
         tDzHTV2JjIIu1xxDvVuMkzAKWhOrZulHLlg8eG35ShCF1YCLPqmXS6fw6Sstmhnt9apm
         rMUd6dr7JV/wQ8IO35bKG/ix53gPSGOKL/2IXj+jAcojebbtfE8nXSIfhGBf+c3wLoDe
         JngPkiDyODbDoQRBP2KxvvPIiFRm1Kg8BJNQHIlmOlFwf7Jy2HZO99AKMAQwluN8cRVJ
         G6zBESe9sBpi9ETl4P7OkgMpGSZJdYFYxmjn/d0qQcJ4NKD3VevpvoXHzBmKA3htiekF
         r/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200897; x=1793805697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EljixnZBl5xalbXxR4onDZVZN67B5eA46yADJtCkT6A=;
        b=iXhLmoG9/FutR2nyQLnDEPaa5zWCE2gnhM8yPy8B3lUzu8YsPUgrTPiGvzw3GVT9wG
         d11G7pVwry52ydK6X1a/3BmJ0uqbSGNFy+6zHK0cuZ1oStzPgvv91wGGu4Oi+NaEuEyi
         meqVTpH0s8dP6P5G7V3uIXLSaitA3JJG5o/QCEMEWYeozlRU+3dSwAN1NJ5K8AZfMjEM
         lWQMkC+UKrkCchV+J7nWlhnEiqPZtdYznxWE5lEDCn4ABYBTkP7Q3wbbqrzBENzRl16M
         LKaGwl/X88XUJD7M8o8CHarv2ghhXsqldz2/sTfBVVg2b40AaM4nJDNjUpOQaaQNqxDH
         he2A==
X-Forwarded-Encrypted: i=1; AKwUvBy1khwCIuYza243Ub1MIMpAs6MxtaStYr7FPkv+mc861D3InqSp26XYGdwEQU3U0D85huONIqG6kzTKkMYE@vger.kernel.org
X-Gm-Message-State: AFq9FYLMaKDqaSS+soOl2J9gehJ5xm3rnMgiwmD0YOAQ7XZyzhZBm9X9
	n2tbgnRq1CMG6Ubigm/L84MQ/5yCAzOjWc1eJ8dNo3YwGKiDrEuWZwyaXDJw2WzuAlDfOHtl591
	n3FfZlaSJHuMajE1QynI/M+r2wPadV+SSVeVe5yIejoa9emN4+BsL5uGL0Z70Kr4lkq6X
X-Gm-Gg: AYBFou1d/tm05Iub4ty2lhs8rGXPRa7bLABIV2IMXLoEPNCm3pt5xLRy8SKlLI6Eekt
	D56VlxKrij46hZ0f9axjnwbLMcOFDVRNhNI5it6TOdEYRH5UE54oqFv49bJbTSQVKmA3wogaYxx
	6i2pKiLRDCJ3UD2vXJGMiXVV18hPPLUeyqulfEZ5zODUVfpMmc8QVKHGI4qseJJQH/Kadp3h3ep
	GhRYv0Mj+dWXetgy0eeyxxA6WXI3pgOyESCc/nUMqUBRKmkhfhNxP+Y11/+tQEtNwwKZ08sH2mS
	ysNSESL/a/74TpV9HsgvyfgshuBbdXpinUq2mdj2EefY1iBOu7SWX3HYV7yo+qWNKb7Ky7Bhg6J
	KVnHeqYFlTr3fZqRqhXm3oXyVasviIbbqnhkrtJabakufTNNxqsTjka85rUPPXmGfXsTVPASGEE
	xqsRBB8IR1zW4tpaEAkFXY770cjX2xsfUN2BaGApPtc1hGZ5krrqXOu6U/b8G+
X-Received: by 2002:a05:690e:4844:b0:679:a3bc:c23f with SMTP id 956f58d0204a3-67a7bc69839mr1147889d50.39.1793200897118;
        Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
X-Received: by 2002:a05:690e:4844:b0:679:a3bc:c23f with SMTP id 956f58d0204a3-67a7bc69839mr1147801d50.39.1793200895124;
        Wed, 28 Oct 2026 08:21:35 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:34 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:48 -0700
Subject: [PATCH v23 14/15] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
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
Message-Id: <20261028-kaanapali-camss-v23-14-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: tJzzVs1Oewo2LDLj9-SUpH0k9_E3qek9
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae21301 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4Dwyees-64n8yO_2jeYA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9dPlmWzYgO9j
 2kvo5jdmeoXYzOzsU9A7xH2lM+2SAZc7ILiavo6dsKLQ77QO+Snf+4uBkHmM4K/duosUnZ5eEhT
 ZbcmDL7djWQw6WDKLb0lhzvTbPBUJ0g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX8EseLDSxAJxa
 ljWmUbPjZxCi+y+agyISFnYwO9yp3Pd6CItdcFU0V5vAvLMNihGDDAtiJ+3H6cdhToZVWXWUfxS
 KXdLZdz1urDYzan8moPfp/lA1PWG5SIYg4PY1OwOmWOlhzyJsQKZV1YWx7qXyrSfzE9W3lDZPj0
 pt5QC292b/uYY2/nRW4xwrC/jzvxLNdfydE8rnjwUqY2OUkr+gnC+RMpcaxq7rqLdFjsPjnYqxt
 98AzZXbCCxXQy5lwGt6Gf4p4Mf4Jm39nIcNIiylSQdv8FSct5/bmQOgc8ojm3hhpkUCm0LujNif
 Km7PanUWfCzciu0/CUjVCBtNf8t5+WqofZsOewePmluxALBkw/mYkF1I+i7zjGBxOqg91281KWi
 OiJ9cX+QTB+BWgcHRPBjjHE34WO/KAL8ueY7ROGNi73YAV4Q00Pqx8Q/jxBhQxo1T4etmfzruHk
 9SezpOpbPt2EP/S/J3w==
X-Proofpoint-GUID: tJzzVs1Oewo2LDLj9-SUpH0k9_E3qek9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

Add TLMM pinctrl states for the camera master clock GPIOs on Kaanapali so
camera sensor nodes can select the proper MCLK pin functions when enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bf3922f0ffb3..3f28f279e4e0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4647,6 +4647,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_i2c0_default: cci0-i2c0-default-state {
 				scl-pins {
 					pins = "gpio110";

-- 
2.34.1

