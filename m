Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884087;
	b=wYhTL8Idp9HWDhZGWmx+2GtncgCK4zAhq6YgMKqk5BgCzCV6lfAheqmi/DvDp4x1toIm
	 YP1fmH7LqJF4xgeGQkmZsxBxjPQXxlnHMECriQs9HwlZpKWUd7lMvvIPUEEnH611OGWUo
	 gj/7OWNY8qXJvmWrFmuMI4tOwSrI92cnpJh8IIj0gNqc8gPBWIJn9sm8g5rPbyykDF5ns
	 xlLrtWanQpvboLhbCEYDsFvqg+NnrkcAOC95t0zWWty6u5yo2nTkOhjqlbh/6IEhGFfR4
	 ustInkdbUN95Iq27H9UAMk9R13v3LsoWnq15HxT79ddEXTILlCRjYj6oqSY64dirMPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
	b=zFlgAbi00zqNoshMgBzG/M7fYUtEweJYE6u/Thj2P4mobRAEOUy0IrIzG557nbZpVcE7
	 +LijSSfcuy0lcBJfaPgPHzn+FFKwsVze6w+8FJP3ZtuIYCiWHMdLfntGfjKLkIWE0ORX0
	 1rpvaEO5f4MJ0+JhIOUb6hD9j6J/ZRXRGt5Z3KCY4OV9ENwq6aDykhGFL6w795T3RyWz1
	 OXEvsR4FlkmWlrmXOCzCmCWYmmI8bKx5YhCIh0UhZSjkPwyw1j3wV8pKJCSJDBEdj/lI+
	 M/9KsX+JaezGgqj5wq9pVp9dULpKuIAA8jyPItF7KL7Hd/CkU2+w0DxSiJY0y+HzdFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of5qfoBT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVnLdgok;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D2D6082BC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 13:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D2D6082BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of5qfoBT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVnLdgok
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ai36Y1583132
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 13:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=; b=Of5qfoBT2tN7w9SS
	eTfmrVcEdQLOeJ91QDApW8Q9Q4pmu3QFKUx3TLEJMqG3ONm5Yy57CYpyoFrobkJ8
	WtAWOsYmjaf/la3Zb7FvCsf4hcgqFv3zc6krJ+B1FlKFUNSzdRXWUkIlhhJstMKX
	JgPQoaf1ghM0u5rJX/6nx2LBSeY4+HnbiEj/HPSHHXGnrbT/N1VqBHcHnRiFtkGI
	+q4I6AmA79Lo50xLbVWEqTa7pGGOrq3uoxT+Z+uxXUgGBq+z5XIPxisa1r4NHd5B
	yTP6sCLSh5MuVT3lUBwe/x9CSG4t3g8UxETuoILb7cfw7G15prvoNHD1aCQbwnNY
	dW6aKA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraarjm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:08:06 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b18c67095dso27875277b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884085; x=1794488885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=JVnLdgok5agBSKZUB8toVIcyAUIyoPGRkwTKUzo/zynSPCs57SRvRc1QXMB0/rvgnB
         fLYq7g0f1WllPtPCKQHPYti6wv9Ijcky9mCj0qvatvuJX9pd5BQTNhcaT1Lwll4qPqsC
         L3azSHHHaumB6WBI+XcpeNXGvd0q1udenIuG8dgA4F0Ok3+rDYJiwtMM99u3AeE9SmEL
         5Lz4i0Lr6zAnyYCT+zjA2LVJx9MlCcxkvuKOqLmiuXmoAsw/o2PY3FTHwIFgZvl9BGlV
         ntat4z1wwuUyFx86Yq0NLRr3DTgx71QUmA1XL3hNHlyTdCN1x/AebzGB9Aecj9Fm4TGH
         w3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884085; x=1794488885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=g3136HwA5V88MSosbE3DvJTy8tW+7WJqAX/kOiImuvMJRA/nYN8db0wMRGGU5xX0gk
         Rp/Er+ZGefuBoEyYOsQvhmBY5JMuMC1gXx+YJ0wnf92qZG/OpYzIzSYlr7YHME9cB+ld
         SOijbecTVxHeO+edXA1EAuwnDTmTRsmEhNP10JFNaZV4cmbd0XVKMuwUGYpAFz1c6Fyk
         BBGZhTsLKehwjpaCyMBBHcXstesK78TuDaXyYSkmTWjcPHW3G6uhSD+NgqTqzXI5bmUn
         Vb+VzdPViv8eBywimN+GdHWKAFPm8jLva7ZPQrKhoODaguVuBLAXKPmljaAFtSkiCIcp
         LViA==
X-Gm-Message-State: APuU4Z8p0ryc5STVXxUf7z5Z5ObqBeCCiME6i9ThjMAJ47uXd5Nzs2cL
	ENwRkc/hag0LadTGXqMCDlp94aYrQL+6U/LOAyINwLduISny0Mdb9ikfRLJgFlmxdJSwaaLZlPC
	bU9TLIqq6tIR5m6YJK56GPrGk47sFnr15yFRknaG4nTUKVFSd6wcRDiBRG+2c1Yr0kfqL
X-Gm-Gg: AYBFou1D3mjEgIb3JwcyxQp7RYEPnrqXlDQNqRgsOjd3XEplmFJ/NKOEl1BPWNozPLQ
	7r+Bg+OOZclx2aKyilZkUJDsLt3i4drSgSotsnBzFbB2EOhE69phRf0rNP9JaYwldTZJk81Hdph
	ku63YF5niiHoiBsdJdd7fZ4EXN4X/tyt+A44Kbw5juUOibGCuncGzxZ/v12bDQV7P9SNBpl0OW+
	jmmtx7+Aels9J2qBVu1rGfWFWgQAkLHJ/irJR4rC85EEf/BgHNw2pUm1MngBQLGOVxuKOYasvpq
	FLeKGIshmvqxdBBI+GfyfOo85vHXvEKlYNCkYWcnQFI7qZzPrn02r7pun8Yv0T/ujGwQgkD8iVD
	dPl96/BnmLfc8bgbmgm4I/+8vsioBbMVXRgpeKY83+vOYIse0qIrTcx2daQw4wp5SpsIHGBQxR2
	ZXejrTbIMKSFO54DHQ
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr147056407b3.24.1793884085025;
        Thu, 05 Nov 2026 05:08:05 -0800 (PST)
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr147056237b3.24.1793884084340;
        Thu, 05 Nov 2026 05:08:04 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:08:03 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:16 -0800
Subject: [PATCH 5/5] arm64: dts: qcom: ipq5210: Add NSS clock controller
 node
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-5-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=2069;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=V7tk6aEtOPhfOk+VPI7cIHGev2spKigLOSXp8SeaGFM=;
 b=NQZ0VnXNNs5TVcS/GfGIp8OMqr4bqDVVREAqgfRdanu4y70VLhmGeYPMpHa85TCG6ztA5t6gu
 bw6K2g89zZUBmx9UG19aSrHFqkgmyhdbqNUcRDDR5s47APAPUsRdBd/
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX1rf/hLXkZmMK
 d80TVhNwaa8oXPNNck5iB5iDJd1rWFtxfu9/Kizz6i1a1loTfGUqsqqJKHKPQZ4zL+97UwKu8GB
 btqfMmBDj/u5T7iwWGl5p4UIgZHa9DQ=
X-Proofpoint-ORIG-GUID: o6fKWpG0GnVwFYq3epaij-pXjym1b-_I
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec7fb6 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6SnK136Pe_QpXSRpRBcA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX14uiGyXBSwEO
 PFIHFDWK0Wc6WyKzNdGrswuGkJN5KmN2A5jDO8C+i+0zw9lFn4pL1GIgiovMHqKmnzONLWUdKN4
 O+T6gtxSKYpQrDpESMMme2FnNPKHfdS0/0MbgJ8lJn+ppIklRJFaZwrm/+/iSZIr50UUMh4sRaW
 o9UvZvn7cicYwjvDTjax2H9QKZEujW1QQECx8ciZ/XfUNoQRRX6dcAVxqYqGDUt+5oMUIbcEQv6
 MicLo+rmpaSrZY9OH1+Uy8xVR16GiNNZRx6DuulbD/dugzhizC9Sx4ZBi6L2N+D1saqxuMkAdu6
 rKaAPCgJDL21M9k/aoKN98a5JmioZZ9XeT3njblTEXjY5l6/eBbdiEoywh8/R1Tvj9iTEyGLn/w
 1fRrlSoguzn32GwqUskWtPIYG6znN3j1DP15z1GZ6JscD4Cp9MS7xTdqTX5B3aQf2sawv7WkBTV
 p1ZsFPlGLr+4IJWFAeg==
X-Proofpoint-GUID: o6fKWpG0GnVwFYq3epaij-pXjym1b-_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

NSS clock controller provides the clocks and resets to the networking
hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
the integrated EPHY.

Note that the CMN PLL output clock names are reversed with respect to the
hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
Documentation is added in the DTS file to call this out and avoid
confusion.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c1ede0f73b2..11915f8eb156 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -331,6 +331,46 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq5210-nsscc";
+			reg = <0x0 0x39b00000 0x0 0x100000>;
+			/*
+			 * Note: CMN PLL output clock names below are reversed relative
+			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
+			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
+			 * to the PPE hardware block ("ppe").
+			 */
+			clocks = <&xo_board>,
+				 <&cmn_pll IPQ5210_PPE_CLK>,
+				 <&cmn_pll IPQ5210_NSS_CLK>,
+				 <&gcc GPLL0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>;
+			clock-names = "xo",
+				      "nss",
+				      "ppe",
+				      "gpll0_out",
+				      "uniphy0_rx",
+				      "uniphy0_tx",
+				      "uniphy1_rx",
+				      "uniphy1_tx",
+				      "uniphy2_rx",
+				      "uniphy2_tx",
+				      "bus",
+				      "ephy_rx",
+				      "ephy_tx";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.43.0

