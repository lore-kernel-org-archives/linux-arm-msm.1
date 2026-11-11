Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370827;
	b=1XaNDNTOSm1ITe56uIzYm34vA1zeJiqaPVDcovxJPelW25+UtjkSyJfkXetiwsqCS03d
	 NZNftarNs9YE1lkYie2FN/d50enheOumUIUVOZcZEKnlTxQZmNBw+sYOwFvNs0A4dAbXl
	 bj4rbX/NLj3PK57YW+HpQewuYhZOkTSZGT8i8n0LaBef1ygb0WfRP+bvs8TNWPJ4cjBsh
	 aS49wnmxsQvqXTFQj+QWlRGybEiVuzphaCz1Da8ZPxQ+EBIA0AFxD0aJaOvgR2drHRFl4
	 u7Dg25NOOuSlM8xcLKNaWLhc+7K+im3W2fgQ4oMTv3Tfu6I8/UwP4r7R2TR4p9drUvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
	b=2tjQIqlDL5kKcbbxb8KwK6VmClWHUzwsHgDs20BAlrsU98IRGKbRDIMAl7kjFKeJzHRY
	 k2edYeqzT4naWIDOx3+itNoTekO9YJYDYkSlGM/SgtURRBl5Gs2QcojpXLQuPQ7RFmuzl
	 Nj/JCNBTf8a98WJ52ufencjfD7nnmgMxDv1cmL419SfHITnV/f0/7ONd2klOUs5qocQ+9
	 AyOYtFvmkPrqQqVQkfWdqZaY7phr3qjITyuzoiwyFKhA5W41UB+Inz3bVohRHQ3XNk/jy
	 Ti+ySa0n7Qi8Cu+TyuRBGqVTeIDr6551eAM1KWIfHlb1K7t10soSI7YjoJV/0sMIcrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV7N11Ml;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0l7EcQT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A7B606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A7B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV7N11Ml;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0l7EcQT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tKf1899182
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6VnyTbD/yi
	L2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=; b=PV7N11MljGmeoTMURIC+lfZmtQu
	2+X6oNuhDRpA8aHtgZ2L+nzXiy/PhqYS+0sTSNzQT8FwaNUXvhIR0DVpxSI+5MTe
	J71UE7DOkL1jnxoo2a7vfc0XUXA0IIQo5OvuYOYLz5B99vcvKdKLEdNDXxIas1rs
	vlaUOlQAHl+KqO7+HaG1uhXBGiFrVTJHO/RSqA2sT2qnTGrhZfd8OGnwCu0SnSXz
	9JNZsWtWt8hAq6Pyfkh9+GHgqApKSA4pGHIjAsEpIMWtamEsgEmgzuxL1zbRb5xH
	MOJ/1zCV4Ak3wDFM2TP1Y37Dg1wRla3OlhjHyh5YjMkdYkF+maw9vWGOxAQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufv8n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5583037eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794370826; x=1794975626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=O0l7EcQTRBFNrzpTthQ4gQiOymaC4nen2WyPGICa29W6OfXOh6UQjuu3VKIheZwfup
         hi/HWbzB8HX5LqmlkYd4svM0O9JCCBiMn3ro3cSv40CBgD5aHAna3AhugSeyT9uc3Edz
         anzK1H3be9/KK5W1r0BssqLpL46L73NWbWAodds8ZRutX/DdjOWI1LXVuF3WTVTH9pPh
         WbHEIJcGpbQ99aT/IUVbqZmUhpLLr+VXDV5qNWEc0otr/oaAUNo5jUBJ/mMZS7r5w7JP
         QgA3zqTVlrp/GPBpRwyW2vw8qWD+P4E86DsNrD8Z5kOxeZFg7SZ0EcJA8z8GGWeJ92PX
         kueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370826; x=1794975626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=YHPebEWwLxm52lNqFrcP5UttoAgk/2FtsJcYHlpud+ZddJql7azat1fTzSohqTotbt
         ZSODOVvzMcKrydIhwp75MAfncCgO9YtYPSBaHKvXxYCbA8Y5zI1oqYNZ8bdjOzTFbF+U
         AsmBH60pS2nq7CCtsxSWWKrojccMC7cmOtowiJiYzhTp3SmLQGETCDUoRIhUfa9KPtPS
         eZdxC3feyeNtx7p9YVXXCFOmCgXuVyyCLK27QEDwddATurO2KgbZU4xMTyJTYAc+R9uG
         1Y4r03MGaU2v4Bci3I/DqoAVnSrUKLAhl9/h0Q3ZhCrf2JNKen3dVHYh84ZYYuM1km3w
         9XWg==
X-Forwarded-Encrypted: i=1; AL+hErEbNmt0z/hhg2RqZsRaa3WbIMC1wc0vQ7GCm6qdm8UYjiiIVl5+LwMWDDgOsK0dnXGtyqZ/3VhryMDM3BQo@vger.kernel.org
X-Gm-Message-State: APuU4Z8VbjXS9bFlaM6dyk5YElchHuKM4TNkufgekMSW7zn1xH40iPlQ
	goyDN8JFThTQ1WGPPD1ADui62KOhCtUY0u8TnNUyKapooEWZh7YDpiWNmBOJCFJAkZoQx2BxKPH
	4C0By1k3gjaOhK2BSob0q+TVLCwvUqK8G54gVXr7WENjGif4FhM8tS0IvwIDje/kByol+
X-Gm-Gg: AYBFou0k7+ogYqey3IeLJ0yYikCCmPavNIv73QiDSOGy647+jiw8ZHth2XlZataMsjg
	XasWmc/dFdzfGNgyI54NkASuk1yHGKWfZikS9h12Tg7uPq/EeBAeIilkTjKtant3m0IwCo8VVK9
	6pOeZwzy7j0ThzTLDeEklV2KAwrYNJux9j5/vS99+u7oLR+mEThPf/q9HPLePxbrkcy+kNe6Chc
	N9U4Fw2k/z8wODCW1Xv+czU4ibcKTNGs8537FnoD0ofQhePkYWWnpeOKq/UMJw4fAQgnn29eMP0
	O8CxbOn38XjivqfF33yZgj4HdctdRILPrqjy0d6S641L330W3nWwQmQytocrMuPvrOk+XoffmOa
	7842Y78ZSESgl07bFbttJfyBxrUyIzh/kzNmUCH2a6zFFvjQf88nB72zKfG1NdDhn/h/0hqqRn2
	sIAPTTwXKZR/CyoE5PmjqECCA8c5aibqAS
X-Received: by 2002:a05:701b:2212:b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b3c0376554mr1193712c88.42.1794370825408;
        Tue, 10 Nov 2026 20:20:25 -0800 (PST)
X-Received: by 2002:a05:701b:2212:b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b3c0376554mr1193689c88.42.1794370824674;
        Tue, 10 Nov 2026 20:20:24 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm21690542eec.16.2026.11.10.20.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:24 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Wed, 11 Nov 2026 12:19:39 +0800
Message-ID: <20261111041956.3639092-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
References: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6T-WQk8bRbimLrihSHt0r55Nhy1XdBov
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af3ed0a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Pbp3yVwj6iIoPtAh08QA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 6T-WQk8bRbimLrihSHt0r55Nhy1XdBov
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX/8NfGKC+JHGm
 XroV1EsPq8bPy7ZOMThn3QkGXG2JoHH1xhu1Gt75OZEfa59qykszQcjcnR9DzM/3zOH3/6Xh16D
 cSLU7uEe/Fd5NqZpzXrN/HJtSK7Ru/I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX2LYQrspNJAek
 SnMDNRB1YuM3PU2C/Eh8F/zoO73X4xqp/1s6f3NA1xqQa0VzEaqY3mXH+Fqutyv2QKRiNMUZOwC
 8WIY4S+LSZAMJ4SkH0Ct5AEgC8yqWzQfqmTgpg+l/kYGZ8oNJwhGYSSIkS+A6wk3StwMFoGszt3
 F9Paz0RbdDshVtLxLt/s6IBLt5UnYQ1t4Gmh428kbjDbr1mlQqtpWEMFwpeMl7PXNZFeiawCbZj
 5UUBqGJGyS9L8+wW4h3xc2QdBMV4dpOYzp1Jr36DkymB8zucWZzIZ5LymJpPJ4g8HJoGsTWJVCS
 jWdmV5OiaoSXUF0+pSVf/dtW5yrSrARcH/lBWyoBXXy6ZWDEAayOsmzl0gZRQrKqJYO1dncEo9/
 aFLiZhRbUvJ9fHtEKjifAr40HGESxE0Z2JrhEJxsGpLZu5S959R3LnCFWjktubs6hBH6U8/Dw4u
 mX2WDH8vl5/w3MzDBcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110017

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

