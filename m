Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7248C3E9
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524516; cv=none; b=SBhItuAjoivzBuz2O8gX507M48kNdF8TaT6+T1q/8q/K7X7SJBdn3cdU+Yox3gxdMnjngZXleif5yPdgEWhuZJW0tG+CG+Tu0to0e+3A+KnxfZUp5geMtcWMT2GL+DXGiWRJR8NBYkFADp12vbAqbvQXtNhKhH304ytXBT6w1zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524516; c=relaxed/simple;
	bh=8wa/wSnNATr/8K4vGBf2S5lyn2SdVEy4xhQJLUykVPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEA2W5cUZ6NsN1qiR2YMxvmUu+hMx2Jj4rBa9XPED2QriZJnXW+lvRQxgo57eUC2Us3R6vgriLAw4gRYvsqqe9IFJ4rToKAh/wK7fWltC1INlXGlg1ooRegzpduYdeL5juGuo+erciu0c8ovKQxGAb8fI+ysiXVvI+fbVDAOgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AED/bXIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXFg3Z3/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AED/bXIS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXFg3Z3/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIQ2u3168626
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 12:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC0mExSjA7uuYAyulwUXl6wDgugRq+25QGgak22CRV8=; b=AED/bXISAHQvMqLK
	ZaLhDWeC/u+VsxxjOAUHFBWaDG7gAL9BHviS0KOR6dFKUsPoOsbDbSgZSVq7RVGz
	MbgKwHLjnOO4sLN/WxJf+drnPiMynzcGXCW0zRb810H9bHiNp0piJWBaGA2zRjjb
	G07XepPacdtrz419H2/CAUXZxZr1ccrHjxafLrAv67kaophDukkzzHC7SEFDGaIv
	25t5ETIs/K0k3X2QSktZWtPGD3EOWyYw7KKJTMUjiS1nLCo27/DB3WPbMXuyR3fH
	5liKUDCFZeh8MhJGfq3fZL16zg9+rvQRdzq+byfvC3zfX3/ez4/tk+gJA8xnteVL
	hfHrvA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqtsa45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 12:21:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78580a6b2fbso204572137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788524513; x=1789129313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC0mExSjA7uuYAyulwUXl6wDgugRq+25QGgak22CRV8=;
        b=RXFg3Z3/mhLTszXUwhjtalUeRIrjjhEQ+I6Go1bkGsIVZBStfzWQox7azpGzlemATL
         e+xsOUwUU1t9rPeERQh6/z1qlSsHsMK5WFipBXREfsC5Taq/F8FRt0B7WcBk3uGmo2uv
         yl3Phq5PypyigpWmNtak3P2ICAu6fqAHBCsw8SldUVa5pCQp9IBdcbzixNdQ0uty1TL5
         YgUtG56736tDzkyrZdRs3gO8+39sIzLlmblsFkS2hqCRv2PMOB72hgti8tZRbZcMZtAQ
         GAFtEGBTBaf2s5h2bPj9StFVEGlS0uLjY2JroBppxruvguuWTy8l6RWaMZeu+DGLPo1U
         vzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524513; x=1789129313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC0mExSjA7uuYAyulwUXl6wDgugRq+25QGgak22CRV8=;
        b=rwl3D/heE1+0OIPWA2YwHSJQf6s00XIBYnzsW2v2R4YoV4zGrQrOPldJwX0tc7uEye
         zkkS6VguZCHfQZgxp4e24hCsK8BWBsZP6Bwbwumtmbe8AP7HBvmWgbeSjuGdl6raLEYi
         khag0ydTrXdMENdDmUWC28iS1op2QQG+Y2wyhtFjVuFmWh4BDYD/BTiRRarie3C5j8K5
         GashIZes85dkRfOE+NEGrVWYyHks7biCyYb/Xojmj8WTMIBaXZOGARqAgO++fIJ/KhSH
         dzje60bzlcjAFJSAk4bbI3Uz0KtmazdEtcxPO0+qID+LKP+UsBu45RGd6ZIOtD5YxoFV
         xoUw==
X-Gm-Message-State: AFuF++kMwHYy2Ums0ZIM5jjuSY2hxEcSb7qkM+QAx80HIupIU9MmoIXR
	pEsxXSoAuB6MQ/2MqxiFu1SwwMImGF8Jgk9q+h3t4GAq52+A3MTKVYbeBO3yRY6FT3SJ7haZART
	FqTiFgLiwNBB4TYz2kSsfKnmlzqL3iobhgcFFqWG9vHVwv6tXyY/eP8EmpWuD8lMBFF00
X-Gm-Gg: AYBFou1wmMWBVsUqjKtovG2Hyi3lLRRjheYY8YoSAgBws+wFIm55f8YQQzzu+IwGAVK
	SkmaRJ3dOH9xnUn3O0GlAv5iMxMtxRpYsUpsXz1dlUMMlUeoejgRba5wbr2pMUSKDiUzzDXoNyI
	C9C68ZVKt/+D/6wvpeZrQnqxjDGu1djeebi3WiePTqJsnCxjHA3wUqQbjY09u2JSHVHXgIP0Z9P
	qHAYl7G4Ghl67JBoDpHqFP9J2ADWr9ztU5MvTrTEII9VUQ1BkDoBhxEzxPGHWvJ/zfH4sgR5lJR
	D3XVVUdvSkfK9TJnTOcHl7WPb6D6Sew9e69MDIcqSn+ttpAqw36HnUhNs6ibUSVVHYM1q0YJnyL
	lJMN3xg==
X-Received: by 2002:a05:6102:1483:b0:77b:2881:580b with SMTP id ada2fe7eead31-78a4a949f58mr1669264137.4.1788524512991;
        Fri, 04 Sep 2026 05:21:52 -0700 (PDT)
X-Received: by 2002:a05:6102:1483:b0:77b:2881:580b with SMTP id ada2fe7eead31-78a4a949f58mr1669248137.4.1788524512483;
        Fri, 04 Sep 2026 05:21:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm195686665e9.1.2026.09.04.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:21:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 15:21:41 +0300
Subject: [PATCH v6 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-dts-qcom-eliza-add-cdsp-v6-2-d4f38936902e@oss.qualcomm.com>
References: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
In-Reply-To: <20260904-dts-qcom-eliza-add-cdsp-v6-0-d4f38936902e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8wa/wSnNATr/8K4vGBf2S5lyn2SdVEy4xhQJLUykVPs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmrfYBz624aa1IQ/hsPcpt1AhqVQtyPxIcH55+
 mMvM17AT7iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapq32AAKCRAbX0TJAJUV
 VgR9D/9u3zASCVeGdo8xm50SaWFhTCDpcj8OiKs/59OAp2CQSqvuiMcDjb32pErzckxHV7v9w3v
 de3gMwhP5TT8IlTytNO7S2zVoG1ALZKT3bxe548k8kqqcFqxarcO8Wc3cotNpgHIhyMyT3urXwY
 5VNzMKQ9BS9gXsr0W06fcGHXbdm6d3s9xH7FVDE+Rqy8Pa+vpmZZIE32ykH0r9AAU1v3mZaDsOE
 y3OHpYX2NxuiOVEk4ME0l8RaHXuWqfGL6cC9lTHzHXM7wrhdgXd/M/WEJencqk8D6DXkhjORxTE
 BDngwucyjkLA0ug8zxfZL5xqe1NQseZ/bGhUiBWkz9ukUG4AWwY+JsfJpW+S0dFYJSeDivBLNLI
 v2DL1Duu1mKW/q2fZW6qfdmsqdHRjzHdl5PHUbkzhk75tJhtxPfwyP4mDbFdtwKkXjlKyRNNUhC
 P4gOXUHdZSpuxAsx0dry9fZ8hhokIpI4zbge7fQ874r4QhfIgcFCGQU3CF1gVCokmnkySPw4Kwu
 OjUDcHM82an3F7wRC5qfbRNNcwdXUwBCJ6KjFJXKjbvdnioeBLlkp9K06YzhoJN4XzLsNiKHA+O
 MHA3FU97g7w5HIx/pU7NNnpxCs/m+dvdP52QFtpY/75o4x4zGkI7Iv7SJpO+4TE1ADIpGGaSIBY
 WG8cr511y/hPi3g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a9ab7e1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9m58Uli5dF-u6rxZbY8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: HKLEPyyLWipT1scMjEdB7bzQESqQNA9V
X-Proofpoint-GUID: HKLEPyyLWipT1scMjEdB7bzQESqQNA9V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX2C3nqKxZ5Auy
 PYfmSBrYeGhnpzncvbeSrUrdUWzvTK+L2KY/r9NNJXL0pNwDsvaJIhnf9ojr6EZ+dNlfIbsQBwj
 89DT9vZoHELkCcURmv81IyYNP5Ywwxg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExMSBTYWx0ZWRfX0ByHHzYP2/rV
 0zvPrTPcMR1FPKw7S8izQIPxSKhQNEWLM2BaLrZ3EdcsVUDtKgOPsLmbjqj+iXRWZAAI6Ysc5/B
 6uZlRjLBs2ojq1fuHZAj1mUKhZrT1F8LRWxrs64XKybgDM4NeKTVJiYIG4G3eQUJxX+P4DCOWbi
 K+mdjM0Bb9HA4a41gX91iKVM1zNpf5vUR8ZA/XgNx/2+VhSRtZyjFm76Fi9SxKtDwF2f089748W
 LXupa6N8vuv7pSA0IIfZkkqwD2NT2rEvyLuGdFdkQO8eVQC8GNTt1mpErGHGRX/3Eb2vSbUhwjr
 VNyCRkfMWzQatiLNSRNN70JoQMFJBX5pc1Mg3+mEsf26z1AfjePfcwo02bLD8ZcGscTIRiFondU
 IBSfxr46kIH96dTTjezshnMD0nIMZWTxmizvyBAWeXW3IDWr150nznOx+l9p1JJx3hNbaMyS6i9
 EeJbs2Dy3brPOm+nWzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040111

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 9ce41ba4da55..d22854856cd9 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -492,6 +492,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 

-- 
2.54.0

