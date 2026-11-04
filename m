Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768940;
	b=ySk7X/zx8cgDSIF8uky6rEBZNGmcZaFep3XfRGXos4A4xsUbhw5Q1k93sCxoBEDVTFIv
	 p2w3ojsqwynZKKzzmiSWagBi9M3UeFULd98+xU3Nl/GmH9WLY+i9uE2UARobvdlwiDZE3
	 +2nPioAufy3rOVdQ5yYdNiUI4mBj/wqWmckvoW92p0rloAXfstkvvtANFeuPyLqDPmdYP
	 R8DvbgxAQElbx1bJE7b88c/HhhIRYTUO2jC6LJUpq24A/5NuBB71D0ehnmZkp3OiaOhl8
	 Q8PkBn+3yyEM3SuoblDHBN9LmfeKIFNGe4+8jJ7TsfaRVshB7G0BdyYUVQQLqdlzgnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
	b=exp3aMwUSxB93qKodXkLmfFGawlUNwCTAXh9KZBLQPmKWgZkzsStbMlwFC9qxSQcQMCg
	 cceDBcf4TukWXwa98bCt5QJc905X5nYbVy/eu/zxXaulIh0Pbn/9GvHdb5L1AA3fn1GI+
	 UBkHn9QLlD5VEuA1+f15MZgDVhR3Y0X62gbNZ86TcaTjjyMkJ3of6bDUcW3HCIhMDXWKY
	 2kQvHnEizVG4CRTXljNkjx5iIvuY7+g8k0UtwfSNB+yC9+cp1aYNDQwV1YrtS1apQChQ6
	 02HJqd/L4/jGKVlK48x468BWTKMSlHSJMmSdZ/tV19v9CIIvdki0DOJ7HjHRJAPzp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RefKnmzN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjbueMa+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F21D606A337
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 05:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F21D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RefKnmzN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjbueMa+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RrDh809992
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 05:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=; b=RefKnmzNWvv4FqdS
	xjwAg+ah2JqQ5tnLdTw9NQ7kuRiVB6RqadPB6wdN2VBHIvYNaxALHBqHxC8t+jlc
	lzUldt5o8P2J+iDReMwSzR+ewNfMCxHZI6JBjChtJc27vswdp/PzTbL/ooQuFXwb
	wepIsbT1oyiC9rlkWbaC9qYbGcFArUYT/uIX0HetS44e9SOOn7ESosi2V/3nw3U/
	A5U1R24Onl4JKlEhn+PXLZCMK70GTS1agkpIQAV6xnM6W1mVfh5Z+FhMl2aIrWuw
	eF5pGsUhI3/2liur/kdUWs0XGAXOMQ4VTCJhe0j/KIszPqdNODpsPOIPTtB8ri0O
	yByH1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpantc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:08:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so592626a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768937; x=1794373737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
        b=EjbueMa+mQIxqpLaSDEecuN5Ny1MGeM+1+TZUaWFTXbsXvAmDII7cfDAij96Bfzr76
         PmPapXJlP0wKbY99PL4NLTLO2z6zOxWWN4RS0WWDSpAC3JU9v1HXwRYm7t9/O37AqC2R
         xMyvuFF4/p9fG7MLJ8mCTlSgpOuJhD6UjtXR0IlIZ4b+hyBrCiE1OxUMqb3fl7YQw1zF
         YwuFNELgOJlqr7zoP6WOLjoY8RjUwq3KEzuiUgAFuGkOGxPyi1HxhUJfEqf7v8vWjzNu
         jef5FY3JgNE1NJ9kSb6cbN/1r9aAGtRtJyyzpJT7PfVHpph4jdLuZQpk0cz5G1/IMhIj
         9MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768937; x=1794373737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
        b=kT9cZa3/EwX+MjfABr5KWQ1F0ClNijkiIzucF66nf6CLDGYSyzv412z1T2aWvZSlvX
         6aVGbqc6AVxM+2ZdFsSPXdLwGO9cKcd9PpS7UlBGLiuPIPHCNUN6GgT3oUJx5P7mZyEA
         BDgE30htsaSb4+F99/1Gc/tp1yaw1kd9PhOvDlbPHhASOWNSEISJc4jBQLXdld3pSkn+
         yqh9ig+7tYmdcje2HId/7yrLc5DIrX0OKNrTVlzsQ8G3iddYKu21v3sdCzyMvcX+e8lJ
         Q696gSmwc6+o/J38vn1lc93MExK/97tTh9J1lpQS4GPdEshkk8OPnk8tCnJmsMPzlSD5
         KfoA==
X-Forwarded-Encrypted: i=1; AKwUvBzSy1JrJAWcUiV1AO5Jr91TnLrYReOrgVO9olytlAK1aotLMnLu3nOOFb8LaUy0g1j7mGyj9NcgOZUN1Vvi@vger.kernel.org
X-Gm-Message-State: APuU4Z8mFWZ9gB0vdR38F6j9STfTM3AVeuUIORlQSfVQoykD3HpX5Rnv
	sA6oXgEumz8r4o6ICiNZZyrSoBTt3fvBN8sRpyrO+Rck6nmOp195G0RLHHJ7d4ztfvEiNAkDcED
	9t6zOO3u3EDMq6LIhxC44KkJO3uGRcKk3s4JafxE+hVY5CGt/HAHCU0+1tKwA7fM56d0h
X-Gm-Gg: AYBFou33SEK2z032CD6DAa+qCZkVq5AGEgGuISGn0IK6xe4KONGP1VFawNLOiy6sQdG
	bLzXIu3hPKTQNBYcWQrYSqE3uwMvezuisviRf3xA/U/4+OwrQ2sM5771MLfQWBd51cMDcP2hX6e
	WkfDPfERqWIZSsLqGxyuqc5GrHWDeO1hIS+TMdNIjjJWmGWDzCjO9qZvcyo3uAyYUticzXMvOCn
	D5HUpiL8RgIq+NIjuBL6mr3OjqSiSXi10eEBvnyN9Dj+M9kCh7IfgTgSdG2X4wAJ6oFl0PdhtmG
	ezDpPEg4ctwNcy8ofHlzaVN9KjNqIR2KwOtGvXBiHK+gnFkbazlG7X7kuBL+6VpixkOaF+EMpAg
	oy97+2+DTBICgg6AZGZfEZFggn1eOdlvk0Sa/SVFIY0QbEeyK/trdEmahtow5kVF1UVR620mjGE
	hDZ1E=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13545614a91.45.1793768937102;
        Tue, 03 Nov 2026 21:08:57 -0800 (PST)
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13545593a91.45.1793768936590;
        Tue, 03 Nov 2026 21:08:56 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:56 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:36 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add support for AV1E
 clock controller
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
Message-Id: <20261104-glymur-av1ecc-v2-4-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXwEBwo1gMnwM0
 EPIJb8OSfsvh1RrzqoNGp9kEHQlVbomxgIoKzOAl1A7RD2Zg5ow+PLnweQbFO0UVI7BT6kKt854
 IA89jgn+s3U6oC/QIB9xbece6XOA8KqrjAG2mQX6RN+JBrHiykrkAfouzTXDfwG9vN4RHamIZ5e
 m/37hmke0EYpTWXBTebZGdOp92vWWCLz2zQeH6d1R+PdvcXv2yyW+WSpSnLa96FOgP86e+pfX98
 1PqVZr+PzbymxAbY9Rrz1/bKy+5tS9FgbKsfVK+hloUNMsLlGzbAlFzAtgl0zsFgDFXMOC64x+b
 PVb1VGaCO166hQ3scpa6oQ8VCoUG0e/tGWZD/01m+k5UUHWnAf6q85/BE75YLEVoLr3SzUGwSug
 aiiBNNa9Wi8RmSUVHPPMXX9JTqh30h9vfENhjdw7UHPRJuUF9hoC4oE7QZNbnjMsJpd6BWEqDgI
 dfUeKpfnCv9r5oKQ8og==
X-Proofpoint-GUID: oqIL8Km8v8JP9hzLBr2Av89Tu8OsyDsp
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeabdeb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2qHST6af7bV6ZHC55aQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX6tt1NgSutjpG
 8O0rfnteuqgV1M8k7CWBM0p0/ldurUty8oLHAVx1emQXxWLByV0w16/caRKo3yVktbSFe+HqzkD
 tXUsN6avrgr7sF7O0ozqjvJsY/0kMLM=
X-Proofpoint-ORIG-GUID: oqIL8Km8v8JP9hzLBr2Av89Tu8OsyDsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040020

Add support for AV1 encoder clock controller (AV1ECC) node on
Qualcomm Glymur platform.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a99208584797eaca8196348c617619af..da7548e6f1c555a01513c964dd974d45f07f7266 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8146,6 +8146,22 @@ apps_smmu: iommu@15000000 {
 			dma-coherent;
 		};
 
+		av1ecc: clock-controller@15220000 {
+			compatible = "qcom,glymur-av1ecc";
+			reg = <0x0 0x15220000 0x0 0x14000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_AV1E_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pcie_smmu: iommu@15480000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x0 0x15480000 0x0 0x20000>;

-- 
2.56.0

