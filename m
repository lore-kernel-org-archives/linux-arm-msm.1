Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463575;
	b=aUsnvuyuIifcpLYwS9BKU7y7mwt4il93/v8IoGKKl8H+yYdb+ali7yaNFFQb5ZNTz79h
	 NlTKq8FR8TPXzqSIlZ2CJYm6S+m+Bicr8X/LSF10OBwhK5lbA8KBH76RwyiXLfKZ3RUC2
	 c4GXq2GZ7q1qjUDlKbGnI9jWRZ3jr1ij2yUGN2VvV75ikuM8rikZkh6i9X7v4TH1AIHon
	 26rfcQotoOG/2nAxW65/m3HIl0WC3ImFyk+8GTpT4RCShtm/lwJ6flrZwB5W8NLSZNPN6
	 Gie+A7Lx+mHpX2RsmH90iN0OC9RW1RjRl7sQ0n8IplMoh3J1L9yC85Ttx8gJPO1p9eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
	b=5Fd5ZC0nLMvrnAFexDNz/7NDIDN+Chl1r0q8GR0lOQVG31n1T1TxdjVeDGuUmNgRWHt2
	 RGGm9JIRwus9eMvKNvbm+W8u1puzf67feLEsU+b60rGt79ABlwiFwmJsfRVy/M4fftrSN
	 VsedLv9ml2u6cOwCWfz8Q/wO+LXT65N9YE+LoOiUyVStRvkMJRfD/e8D/i9dTuU0zwluV
	 6bZ15BYwT9SnmFBVvODLxsIWolM6kOsHvpuCj2AsgqRRi3DyDvJ8nK+9u6/CvtKBrY5fu
	 Okpcbuu1T5SfL2pFspHqPh5Nh3vYEVCAX30BlxKON3HTPmnytZbTU58SdXk7c8wEgaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Y0hE/zS8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56C606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C56C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0hE/zS8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH6LV2340475
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=; b=Y0hE/zS81YmcykKG
	Ecx7laIbm0Hzc+GkteZPg8CAdeAGeIjeZGQU48SH2sird9V3JAO/iFfkwoCUTVoJ
	ZVi5+y6FzW5bFIjuu++7tSfyGdhekHYdXAcIG+2YLz3hoiAkU3sxbxbwF4LXshGb
	vNLB5AFID6gDFqP4WY5cUG5OCgZdveos6bv4aXOO6YMNMBQA4PjtBkDs15bGO3BN
	akrCYrB79oU/0eLleq1UD76CjvGxhlmQ16hBlJvyr8Z7CcNVqJrDBGMMo7JXwqH7
	W7rbNxoe6G50pzt5w1fRbLAJ8QtqYe4856foBuEFI9l2iJpcUtqlAbaP03zl5Pcx
	1FV1ZQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3cvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386ad819860so151318eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463574; x=1796068374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=a+p2zF5JtQFLdHMI8jOzvdShY4shu+kItzg/zAcqC/LI6swQaqMkUdwPPxgkJURXip
         JevgGuQq9EkEybxmx3eOp1yxtn1hzXV4RPTixwSbRKueWS4BhkPotrxteuz39b3sqbT1
         on1egO5aBvBWjKRhbS+9NNQWd2a0PYH7YBdU1HZbnBqtgFhcEWJZku9wHJpKXpxjAocd
         fy+TaU8Czy7pGr23G3n/RHtzgT333voY86WR9IHilbePBBuV7vu6oWyrTMmNZoYvKeS2
         etZL69TAVtHMOk719w9WoSvNq9WoVkRoTRWwkPRkn/jBs1NBKuw8Y87HNLRf+Gg40A5z
         7OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463574; x=1796068374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=rLb/JuKx7dl5RbMYj4XReThbbqLatJykFPjuXu9zpqPRjkYCKBeIcylm6+zF70POdW
         RYj7EBwv7QaqamTADxwtTnN6D1hZ56J7f6jYwEF6zvKDIkSVKwG7mRgRJv2fs7UMqAM+
         GZU4fXosPYH/uBfqCwInCOBK+loTJ6HlONnmwBnDmPaDylYNIElZbgXfv6RRe4+wWDCL
         OXqM5HGCcmp3A9tFsDAmEY5Qtqnw8gP08uRFL5x3zloNR1dzYuz0Rhy+xCopaPieh75L
         WUQJE9rCb5KyFRV1OT/4N4B8sSnuP1YXlcifFCDWcInFo9o/YygOlmCNIN3jz/cQUBpU
         EBrQ==
X-Forwarded-Encrypted: i=1; AL+hErFolHyANf1VEkCQjdHsvgdzLNGFsonUvaARLAk/svSzBQb8P6HdU/7208ZabJdCf1IUZ/vCTEWfSWHRe1zD@vger.kernel.org
X-Gm-Message-State: APuU4Z+9DaDg6Ew5uB3iBxv8w26bIIO1XkjbazzqwzOhQmKONF/EF1Ou
	8Zr/Hs0yr474Vo6WUZk0/lskh7+7YaiTcl+3GQGLv+eJE5SyBXPoMjkvGUU3VBJcdoDKfMIVERH
	sBTuRroGhGX3cM22kj/nAbKSLPAuZ4cASNYsBI5PP5gRNGvsHZE2Jii5zZq2GKHUcXgHw
X-Gm-Gg: AZFdTZfy39coskW/WQG1kqvyAQ5ynb+0To/b+s0Cqk++MOVCTIRreZv+JwRT3YgVUlW
	jacpR64BCuZM+YQzfnNPDJzg45dTTfuPUOxEOK53IGruJb1UVpgwURxz/uVQ8VQ1rwvoMp7GfJg
	C8QnhuRYXYXuIVfLW4/9s31v2e/07Zv3FUj4W1scKgM63+Psg5Sz8+wM9Ab41/ZIwRV+5vj2sbg
	tHUayy8M6s9bVk4k0cUJfIuCflITDJnnvJbjFTKXTnN9R+5EqVHtYAoowQGQmh5ea2Fffdsdgr8
	gJGFJzWS/ytve/3MM+WtV9psP0FcBUYpYOgo9p4apKnIPxlTiAZZYpdEKZfCCP7rZpwH0qjehVx
	bNxjJ2/x6PLnSA42Djm2zo40yoHSh81OF3kF2LAJqGjtMDaqi9tJtm9PC8OendsJC0D3lVXHsfQ
	==
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405172eec.41.1795463574040;
        Mon, 23 Nov 2026 11:52:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405145eec.41.1795463573559;
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:41 +0530
Subject: [PATCH v3 10/10] arm64: dts: qcom: shikra: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-10-98db26a87500@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b049996 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tsJniCoxF0iYytplHVkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: g-PVinrPan74DgG1zs1bZdsdNDRNNnh0
X-Proofpoint-GUID: g-PVinrPan74DgG1zs1bZdsdNDRNNnh0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX107bQ71cFoav
 noThUNxy9nNUY8wkO4gK63CnzZjh/jVtqviUqCkR+OMtIXYNF6VJKyemDGkhQf0NyoCPRW7m45c
 sypB5cPbfgPxtHKSVouzvfw7iyODWuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXyYQpYlOvjlrU
 EGQe4HqfZJD+/F0MqpAg7gO0Gekww17VXJXOG/22qq3YkDWDDqT6BM1HeKqFDsbYG2bv3/9y829
 aefoFGY3H/K4iuJhnuXQ+X50fs3b7NM8IKMZDFbmivkAnQ+gQf2Pm67R9TNpihRotV9c06wLu8P
 6bLjxbBq6DpP5npCEQFnpsIYE3gJTFMYB6/inyWPGyHpFg7RCDCY+MKj42M3A5BEKiPohy3PQZb
 ad9izpKYCv7oov1ahv79M9ur0s5T0AHAbBwEKYINItW11S9H6EcfJY88CbMrnOC+UCg3Z8z4c7w
 b221bdAzTDswB3QnpO6DS7rv2UjgeH/tCrlT98S4VRKRolzihk2YcVHDzn9b001PFGeP4JtQuj8
 B4jsYstNWpLU7IEtLPW+qnqycwebtH5Fb/LULs308Nz3UO4JjMMgQlHQFSh47Jke8SRwvUsyj0y
 /nq4hl/RZhDNXQomwcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for Shikra.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio87. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582c643f97e2b0725eb88a9f262d83c..a5079b82f22f518fd9e858303292bb7ab874e1b9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -992,6 +992,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio87";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		pmu@c91000 {
@@ -1303,6 +1310,20 @@ sram@4690000 {
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 
+		gp_mn: clock-controller@4713000 {
+			compatible = "qcom,shikra-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x04713000 0x0 0x1000>;
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
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 

-- 
2.34.1

