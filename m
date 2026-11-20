Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174224;
	b=wV1+FPiQd/UzWnUMGuU8jqFcCD3KnuS2O/IQ4v+SPKebGhlwKWOEpW0KBSQLHhQuOy8Y
	 dhgDy/g4kgURpai1fJzom+CM4v1OS/EhNO7TwP+3MLjphl4yv++cFzuYGiBhN2IxkKBb3
	 6Mnc5BCRYXvoVX/xg7LM5kF7BxK6GukctoivLEArPfzwgdjeUdOsyZhwvQ/cTtfXHzoW4
	 yaMRbh92xXuv+7BWsqQSNA3Sa5YsmxtbGeRkgXMsUADuiZAtHgsIKptF7HHTCvUVt39K1
	 UrM1TiXDSO987JyHmNtt3EhrplkezcHLbLz4eV+29tF3h6kRihD/9a0Dx2BM7m1WpGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
	b=Pk7fp5e2DtO366Awauxj1RnjRpap3SbVDAiP5a+hlH1N3O9d+HpLccBoncf7lAKrUSR3
	 nARMq4DwVgCAvllvDWZC9Cq6PbIhBIyLr34SiuTHWZd0A4BzO7TDoyexaqrns+tpJ20NN
	 Ee0tjfURxeSiMNsB6QOLRtB9m5/6srYqrYzYxzPUXdwH6B4ciPeMt/6XJhGnJLDnBhxZ0
	 VExmxSx6iwpxPbr5qsV0HbEgnW8i6iSxgw2W+zl34XYNIy8DWSvYUSslaVfS/3r8OujZm
	 bUA6zAb2IIiJX01gae1G2k9XGDAc3VXnnikQqXZJSGmbbXGYm3055lpSsNiH2RKJooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cPjXIYET;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRUeItWR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121F460A260C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121F460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cPjXIYET;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XRUeItWR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1ql2433131
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=; b=cPjXIYETJtsw9lh3
	xJURsJ6/9D35NP1OWydV91E3GCvAVaM+9qJV5QTRNtbpEkHEJDTzoPemzdiNG5BA
	Ok2q0pHPET8wriTGGRqSA3NQeQTCBxSirzEX/VAOUjYHN4Ot4TrXNH7gSZ7CMZvP
	idzUgDOymbest6qWodiD0M3NJOq8AUReFrNpv2gkfn+yXVlHdvupkQb5vxCWayVp
	pPpgfCuUHsX34bWcoe/Z+wle1pm84CaAg7N3qeVNnoqnja6HuPjKUjbKT8+IPvPI
	jFc+9gZhgz03bG1espcz2a95hIzwgW03sY5kZFYoQzRNf4oZlBeH7KSrx9OwFhbb
	6rGeig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9he2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:30:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08904845so11636575ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795174222; x=1795779022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=XRUeItWRpfl2+5sDeT5swyjh5+TLiyV9WojOpYLX7Z3I0GJfsUzdcwmcXpTNzkb1R3
         D34f2i0s9YFl4QahjGrkKhXVhZHwa43YdL1+DK9o9xlGM+sqkUdli+7V7zuYw0gEewC8
         vaP49wEWyl+4062DC7NIzXL4Q7tfy5Hqbn/KYszdfM78OR1/LmuWDjP8Ud2GjSZhkcPS
         f9e5J/QQEgwz2QkRvkB7EbbQXZ2872JK02B7MFPrnmkgbFPs/QvFkfSdDm+ELkaQXn/l
         KDcWpqT7evgp+WMRcwMpit5Y/PXzMjT6l4rGFAyM8ufbl+c9NuxhCqS/8b5MoOLc/p6N
         JPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174222; x=1795779022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=SZI8L91RMVDIW5SgO/n9avcxGnNb28Tq0CJA/lCP/tBVf70rMSYw5kxOQJ/Wn1g8WK
         LAJcGl+9NYiTCpNCDV9P2JUeRcWFse2P1nIPC1LrgXwm85g7Y4khF3hFj1TWfwFtQ90/
         Hb56S2zQUw35qdOqX3WWWSga3dxIe9k2zweoFLnnxQbL3v5B3279rmtgbQJ6YvNRIev1
         6sJX3A7PPuFw6y/ACtC/Hs0lktz1PsGwhhol4iUvO7wjVSZC0zBTgaCWPPMnQAFc24ct
         ehFlbW40yplzu5se9y5nAPFnm5nazG6zfxaOz55p2WInSjxXkdINTllKfw2OiTN5sU1+
         R7JQ==
X-Forwarded-Encrypted: i=1; AL+hErGbnsjLT15ch3/ZoPu6qybNC4K9MVwkKx8kAHWFv4L6BkF3/QpAL6kMI8M5HKu0CD6CjdRFawzlvi3btLl8@vger.kernel.org
X-Gm-Message-State: APuU4Z/4cT/2BRDxyqaiNoHpkRf9imJcXSDod3kfvCITlRQDuY1o1uhy
	d2riWJhM/s5EL4QbfG+976eEns0iQF5UYqZ/Qz4dv2+mbP97i3mDFpiRTkkwNB9OxIKR/woRyqP
	vhYYE2f6k27ZHwLfogRIy6eMNojErWCcDrFy32vblD9cxWg9nRjtjCvM6E9z/wNKGK0eU
X-Gm-Gg: AZFdTZdJPywz2SRAHTal6kXXATS1/64zjvy44+QM0L3mgoil8Hhah8T7MMeCDssv4fX
	25g2+dWsF9y+mrzdY/f90XkYsWxerePLZ0lzkOQH45uP6NxLD7CY70+fx/73YIKzar9P8TMPJ1D
	zaPLJfLffXILz/fOsDSGVPJe5YQrm4Qtzqixrdgx5L7T4iIuBXqE1dPhUqACS1cKfci2y6gmPoZ
	xOtyHPix73sKest0y3Mdoa6zzG9gvDhehRUJZixvses26VpHSiD1JbgqGZSjCPcEkU6Nc0Bupkw
	5KWlk5YoGLKHmCqKr8Ne9Bcz8mzlX3xOIPjKwWLGG+uts3m+Kj9djIX3r4oAGUHLgAFSOC7QwNy
	RjIzczUn1Inf1n/W0wMYLFnHx1Y5PNw/lqiL59N3XIeCD8T7NAzCFk/g0JK4o4dfzz6NLgaJozd
	jWfm2N/H4=
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr21097195ad.42.1795174221645;
        Fri, 20 Nov 2026 03:30:21 -0800 (PST)
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr21096925ad.42.1795174221174;
        Fri, 20 Nov 2026 03:30:21 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm2751245ad.19.2026.11.20.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:30:20 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:59:52 +0530
Subject: [PATCH v4 1/2] dt-bindings: crypto: Correct Shikra QCE compatible
 hierarchy
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
Message-Id: <20261120-shikra_qce_fix-v4-1-5249e31394ce@oss.qualcomm.com>
References: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
In-Reply-To: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002f4e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BEl7XTdPtaVR2fHMDO0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfX1JonW2i1YKtq
 h+KncdM2oJyXLb88wBuyur8DPQSbqzmBfFKL+abqCGO+ZR22RauJomNl3BhaKCpMxY5+jlfuAnI
 wBXInvF+aw8r5HBae2EEZuPv59k9sts=
X-Proofpoint-ORIG-GUID: xZ4G8WvMG0sEtLppQ5CSMLVt0_nJusC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NSBTYWx0ZWRfXyQHkUhB0taHX
 IJC83zqmTXXSc6nMJgFwLJaSle41Xj/NOoedVvf3YpW40n0kdGa83eTYWmJE0eQNNwB9wXtv1e+
 U4J5suMtHZEYJaFXpB4JnZo8mcDOQ41KujroOSNnzlWOkfLiuNww5gj8na9gZzM9y49babqOJy9
 6ukSKjzzvaBT+QFiRqHrMtb3NuBEJpDS6MQXpdhVhLTIi4zyf9mW6GXqP6uxreuB0I+8+njvOIq
 Ub2sooQlVKlhBoaei0GS5P8JMcf4cHI29E4Vitd0mJycN5j+Emg0EFUiOLp70aRfZjPzepJI/oR
 hGOa5aoMRf85GqzRSgdb7Rf7rWy3iSY7qbsnpSUrf89pBK/Ub5boiN/MwUPRPjgoOIc9y+FSDrP
 oFp0vO+k2siYIMCH+WomeglwojHTKj2WCokyIotO/bdjbcNpJ77+Y2bDsCxl1/7UfGyWxsvrsX+
 Frs1USKIKXyW/4dLXWg==
X-Proofpoint-GUID: xZ4G8WvMG0sEtLppQ5CSMLVt0_nJusC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200045

Shikra QCE requires an explicit core clock, while the existing
"qcom,sm8150-qce" fallback allows the clock property to be omitted.

Shikra follows the same QCE clock requirements as QRB2210(agatti).
Update the Shikra fallback to "qcom,ipq4019-qce", which requires the
core clock to be specified.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

