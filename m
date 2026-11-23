Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463569;
	b=Enb+UKx79irO0O7YgFUkH8BPh4FtpVqqzd99g+iszz7WMlNcrFUFUNOJC59KQ8n1EcPe
	 yGjderxVVOLT7Uwwai+vvhnlZ7iyUvVzNlcdMUJ3EZf9WZK1Wkch/VGYaX7R8n/kL9RpU
	 7pbxxJV/yq3yTYCfGFSbFMj2LjKxPNdRbPvstvEsUC+Thb8C6PVNRTQ9kYC8Ol1UF4469
	 U0R4iAgSaTlYpHlR15BIN7KmZCkD33tMtqKduA/+g9fWupGU1YVWWAqsY6dma6XnxWgwq
	 oAtYbfgwDQ0hHQonWKUr4zAWnIk2Oa+suQRROMjsUNrs7d+wrlB3E877z4OVOSXRBiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
	b=tExGKbz79PELGPz/PhsJWCb11Z+mRy0qjGm+umeX7YXuvdFeD7MTZ7IMoDq3X3yK0b+q
	 YDTjdriSvM07BqB2nTF6n+ZrcpUyn8Eo7csE/pIRzucB/ids6SUAAJImvwNH16UyVaiGb
	 1l71Ip1wElwTzOqdwKaBeSiTepQHcPYOutFIKMZ2m83sV6LFSD16CD5Xf+f57uMXJggiR
	 K2LwRHuoQb5ufcJe4p/6WsulHbEOwjk7FGWdeaUgYsa7bG/XUWIGQR+82vvrJzDz4yZvb
	 41cqNdSbdb0OdpqlI6lbqvQKHSwkitnoT8UqaFlJfD7RUP99AbLcVDT93gtrzxkUPoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA82606A333
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA82606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH1Do2486670
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=; b=pk5OOLF6DEIadDHg
	RlXb7d7E5t8XB0z+6gUx+XTk4g4tndVYynxJLHXJ3406JJMyjVhNipZvsMqQ5whq
	qxWl2KSc10E4Zj3JuLvUvYOMq8s9xlbhQvfyX0EZFCTYC7rEIOrvzHA13SZ42zOy
	oQyn6MDdBvfdss3jnieqzm5p8YJJtfSl8M8IILqV/7jqtjiiaThWR/f+KT9APKxs
	U4BNUkwPG1oy8K5PFX/k/1iJgEgYDIgX61+RHqTVmcO3JtNWqd1TRCWc9/s7WtOM
	K6vuUOg3wkYYfXld5lOhtesBCCLyj+oICCKZuZ/rNz6vIcKaqfl2Qk+Cv7cwCXDH
	MAIxKw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy037y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so1676666eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463567; x=1796068367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=OnDZg4iGAVxr7B9cAwmxCeK7c8SLlFnSFrhFxjIG06TPr4NfgiWE68xrtZrrYTh6NO
         JUnoGr1GJuKxDdswmrwl8+j2YshJ3l9lCbaDvNfquVxjSJt6f2AZsqbV9MxkomkAGWuH
         2FHKcu+yynt82XQ08MEiGmfWSxlYrNaZu0TFY6pyiD5Zbf5/5L98iWWNkNDR2aZS78D8
         gsElgimNLkCRrDQH12EFVwhIr6++iyqQFEe3ZDYN1l0QXmuzfMs4PL9ko+OLAYvcq2uO
         k8esH5/3GzN4PFWelqScIdX75dBazpDAq1PSA7JlZIO7X9I7Xhmpa2oXxPE3oSfntaMN
         P1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463567; x=1796068367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=LGcGqVCpc30kDRaeZZ3yQSWoYLEk+SlKQ91wVHMrhUtfzmSv/vvJrZFZ5uNqaATPJs
         c7HGS4HNLNH87Jc0479n3kLcTvrF6v4RAtO2zxspJwi/LZRqIi0WOVe0yg9Pzoroswt2
         dPBFkNMuFLdceczCyyVdN3d22Yu+mErul8r//KwiirKnaDvcncCdJx5SmE/h7m4pk2Z2
         +36MbUMz5bq/kfP1NBZT3yf1bz8Ns58wEpDUWbFySZV8angeSmYXoxqb99FYEJLlImHH
         e3JbUrnmEF9tCTo/nBPCLN07plCm4HkPBH1SkZvR9Hygg9L6BdWm8EbLUBFvJSUNZOsB
         mcMQ==
X-Forwarded-Encrypted: i=1; AL+hErE+eM7yon+QAo180h0KJ9Jd2JCAy9zFshZkFaI19QU/Fy78PY1+a2XUB8hwuzhOFo52XXJ5Axu2fIWoXH7S@vger.kernel.org
X-Gm-Message-State: APuU4Z9s/QklbLVdBdq2Gmv9QKqXZ7VbtBbBG6UntEnIBuOr2AfYB0WK
	XSiw8HdrqGGf29WjNy//c4N6p80xpNu9m+eRYbcvxpQaYKGrVYED9pyA4Vc6GBCchJdpxZOd0oo
	59KzpZ7NGDwLwZwYDyHy3DxpSHrDnxhjNM51xhqIYr8WmIdnrLGr4CyFm5IZTYSROKAQuXsXHac
	0T
X-Gm-Gg: AZFdTZeKBBEQdTc2ncTQ2ewn4UM9GWn+dgPbNxTV0Wwdlyl1QT5vYlHHF0vd86nP9mr
	LLBS3b+WlRjTWnBSS9j4c/OGlzqtgKg9OJiFJ8kRaZr9r8fNP/SLhAopa2hoH78yArM0yHa5cJG
	9r147Lu0OnwVL3bUHUsN7oPrBR5Nty/JAVcpA0MHDnPNhlUnlXZsnz0iPmMx8WR4VrXOXNI7He5
	/uvSsdRT+tcHj27CwfYLGI2SvVZBn6QFnwveQ4+UO1vDJwKutnEFVI4k8uQkiVWBxhaXZ6jsAF6
	oA3yEGTMb1lrxckipAzrH5NGGXIm5Eh1Lu3PwKKeHamqUMIhzDw6FwThqqyHwhByi0bgkWDs1Ns
	GuZdeGVlyBuQXoRkMhQBuLunoHROQ/vLl7Qn4z+hcEzk8JSeND9Ppu58FEVcSTNL7U9lZEUFypg
	==
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083781eec.32.1795463567239;
        Mon, 23 Nov 2026 11:52:47 -0800 (PST)
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083765eec.32.1795463566804;
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:40 +0530
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8750: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-9-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXy/X2YHcrDQfw
 8MuwJLEQFAi/w3KvZ+FpBW0C5QrA8tu2QtDiRqgXhClkQYJ0sKWseldOIPkCuqiqdAzSg0d2exf
 2C99yi9VLdWMwbYHnUtQmjzWpZlfhotBNP9TgN7EOG9WjBz+h/f76poV4JHkduc0Ty6WkNqakCt
 FC0mFzdnzUOXG23O99lJooKNLZo0KTJcr0fXOiDQB2FHYH1qDKKW3+u4iklOUgW5cPh3DBYqUDo
 ShMSmCFptlmZS1OjQ7a4psBtZvtX+CBjqGdaLUDBhRX7HU0rzEw3RHQd7TKC5bDMqIZNQJRLdi8
 VlMm9div13B37HP+6EYOpQRsgHxCab0ht9b9pzYNNYwMIwR4pSpdunEixmc6yJtLTzEvP717Q/s
 cZ8YAGPWpljTYPbh4eCi51y4HnV8IUBjJkS+VtjXzrJbJl6SJhW0g94iE2sdMlWg3IS71oZuKuQ
 LYsSG2VCDHlVKxtiUBA==
X-Proofpoint-ORIG-GUID: yXYAadn9rNRRbsG8GBte7TC_s8kOykgD
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b049990 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hYfjAn83TXJ5YwiWwP8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: yXYAadn9rNRRbsG8GBte7TC_s8kOykgD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXzSKBeBD4YaSn
 wTVmKyrHfIMoEefAZl9YwehjtHNGHZDnsnnsmkSa2NdWfNtf4mAHZm+g2seJXxhJn4buZpcyOuD
 DdLsWLwLGhjixy4CGy7KDwj1BZ/8aWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SM8750.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio53. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..fcc78bb3c8334b20561af6be87818af8f5ad461e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3067,6 +3067,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sm8750-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8750-m31-eusb2-phy";
 			reg = <0x0 0x88e3000 0x0 0x29c>;
@@ -3921,6 +3935,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio53";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1

