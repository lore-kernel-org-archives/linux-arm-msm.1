Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E9248D884
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611277; cv=none; b=eBhY1xPgG1wPHahjOxFhAhlca7E7TqbGIcNj8SAgjYA7LAFGeziEVPdqaEZr32AJos/aX9eWdX3i4jtUIJblUtsqKpj0Qv3CN62E43/IN4QxClCwYUIu/0bFJbFyXT9laRCpqkInumMkx42QUwcrqcT1I2ftWtFSKR4pZ7Yi9pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611277; c=relaxed/simple;
	bh=YS2PFBtPYDs63eo930+d89nki8D8vcJ6NjzJW80Rf6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f1A/c8H2kqR3BacF0ZZX6+9NbGLK2z5vKuf8E0eeaAJ+W3TSxrPdOf3cY7grUsZ+XF4Lv8JtqRYeapOAutn5wfR+sc32Nmy7ttiHVQG8ERenn8nCO9s3Kiol5yVpYoiczcMbl+liIwEKfjiAfmHr+P8f5KlpbQ67ninLdUlBaF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgV/L0oc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCxcMCOF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgV/L0oc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCxcMCOF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BVmDu2249714
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 12:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5
	l2uvS4q4=; b=GgV/L0ocVxL6qJqSA/3LD13V7j9Fy0OHydNntpaw02/LE1+jK9a
	PzccGEskt8dAbAxmhelaKfF4BYu65iTCmRtyt8uaal6MAYagKkAXF7BkjFJx2nKv
	jIJbnZLD6K3lztzpS8SwIvg/d0XfPVEazwJz50/9eeSol/nuS8G60rs5rLnwShv8
	bHhh++6VjWMKQuE7f5k6nDoPDJGPfWyVy6WjvHCkeYL9U5FrXRkjv7Q/jEyMkLG6
	p6VN0IUYKMwMJVmsOe09yY5cgq8K6Q22JCUXHVcSB/RZ7mP5wHSNoi6e3/WKrGYi
	kDFO0YnEMWjkGiQYCtpzuvqx4BkgpvKardg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggba3gxju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 12:27:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b571432fso310803785a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788611275; x=1789216075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5l2uvS4q4=;
        b=kCxcMCOFWIImvRhmGG0yTqmpRtd17D4msDb647PYjax9uyHY3FHVr08N2xI5rsLdFV
         EsiSyQFCEFQJjGqeJRYyb65tJU08gZj+SN3104302IyN7XYLMcHgghU5SAh1ixdxbLXx
         d6sCWhpObcSIuuYdM1WV5yWytF8iuo+a/1TTijcLYqGM7UCjeVJq27Dhk9pZnf0GmVF6
         vTiCvrtCGFpMhh5rh8q9HuHuuNhDw951T9ecaw/OE0FShFpCKMFb1g4hNMhrN1mRhhlv
         LDNomwRYV7R9yoPeQ92g677KRGluTJNrVv5ZoHbENymZPtW8CiG3gTBALwCcPJtNb6c9
         Prmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611275; x=1789216075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5l2uvS4q4=;
        b=tDLSSEoIKLCFKMDOaMA+wk3z1JdUI2ztVMrNSF90jt3MKlR3+l6UBZRP4K2gsq8XHP
         DULGGVcSt6Yi0xNF+rH6bBkje7KpKYcj35M/trrjDzWZ9zwWlyyo2eOzQ4wWN6NMJSR6
         oHg9bvz/WY8fhElNGYjjC8x+4Pn/MtSq4qXR1dDoPiHOi36GkWfjBK7sa/EisVwWV9Ln
         xgJFjVIwabOSbE2tNF/M/0r47+dJ9qieW/EXh0/espYUAzWU3Gmo/lEpWwb1+nAUi4dk
         AKL248DL3Ythjud/qnVWzNdoYMg55ageH+EQC2lTrP+3ZYPB1NCPXT0t4NHTnB53TPSh
         FkYw==
X-Forwarded-Encrypted: i=1; AKwUvBy0soeusBwkWIXVFd1VWoYYDPiHH7Qtu56UkIFAQBx1apux9oqFQhAN3hdiSjIujFC8w3sVaIKIwhU5TfFV@vger.kernel.org
X-Gm-Message-State: AFuF++nA/xVstBy6AtnJOvpe12OzlIUqluyyt7FfFJabpvYB0hpVelum
	ei+mo+MzAYjK68aF4y+oYz8eaOwTGbqbIUZUkTMwvrm9+ODt5OVhsnhecN4PvlsSXXaadoY/pAL
	Q8o920pbJTCI0Y4QRa1pmXrCPia+g8ZDBhuHwmtWI1HaSDKK5BsdGjy1gy3EWZ+V7tr5Oey51sy
	t8
X-Gm-Gg: AYBFou1dIcKKhyR1p7dzK2lqyXv+hSKla7QWrpA9Kanb4jpa5V9f9IC/akMUSqpOQdp
	vgBGbFqqTZMZSlnqKX4piBDBvMcfIOdEnH/igM/+KsbQx3yF0dMVGPQoj3tkvVvV8G/+P3LzzEv
	hk55HU8Qc5tTPko43m+hQhuHLzjPKGZCnarQUNMDEBU5mThFhBSqAr8I9QUIrbExcdZ78vbMWYF
	mgHOrm6aJlwraQCCHxlQqbQXAPUABJ0E6TA+s4gJp6QFDODbRT0e79nVdqPXZiNKIfz93OTHnnS
	s0yW1est9PHOiig37jnqVgRcSsefq48qirr91Jz3Re352uBaa1N4FDrHdJUO+zXWHFQHeyWpdwC
	85U0tebBYq5xLHE8=
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr1206549385a.2.1788611274601;
        Sat, 05 Sep 2026 05:27:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr1206547685a.2.1788611274089;
        Sat, 05 Sep 2026 05:27:54 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm238334095e9.3.2026.09.05.05.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:27:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-ac-evk: Drop redundant whitespace
Date: Sat,  5 Sep 2026 14:27:47 +0200
Message-ID: <20260905122746.72952-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YS2PFBtPYDs63eo930+d89nki8D8vcJ6NjzJW80Rf6o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnArCJQEz25Tbvuxh3RdG3ykTADbGRSspiPX33
 wbHJ3MJlvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapwKwgAKCRDBN2bmhouD
 1yJtD/0aSZniX4+o1wi+yeun/hPE5ciMO2Iekx0JWN+4ROYuL6K1yESzjC/JyCVg2uWbPBvisKM
 NJAzWmlv91FlHQxWOLnqSEUrMvu0pjFppjr+omE1mGC6bIsg7S26fHxaj015tYkk6fdftkmNjq9
 WvDz0RnOzz1jiqacLCdYLlf3IZmCRb+b+6lIGF0+ek3EWDZJrQCmT6hENPwE0HeWDK4WligL92A
 pHh5gh9e+aR8rTT2DMP8P2RL7swnlD4oVFrA6xZeZ8fFAEcaiowq5OQVMZE+bol0yaPySPvctaF
 cCuG0MTnMb1JTLgPG4N/x26PbM/Pw0SvvIPuK9A6LOxLz32cWArIq7PUfkIaBAyFu1HejnLJXbo
 mvV50XJ+DP2C7dhE1ElpBLrfbY5RVEvM1XW0QLOVh1DGdNpUXtVzWIXRtaB2iCJrKB3ny6TlnMC
 rLfkBMHCHkJIE8rgLasJQqGCNbYseycQ9kNvKMxDsosKJIwD3f7ELaTkz50qmvmmwEE62dxpbQD
 6v80TwbdEE1DY2P6bklMEl8CIaaWcNwInGqUwEdLh02I8JAxgC15wzuKsTVKPuzB0rLAE1DmwOk
 nbAbQs7dVyOKmriDmWyISHswpJVgFrP+wgpbZOihaV2F3dvRU7j1Cc+MUGWrzfrSNRXRZcWWetH Z7W8Lz/P60vlZrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDEzNiBTYWx0ZWRfX79+M7zTDOUr8
 Hy9o0eps/jlaC2ALP8L3wxYl85oADNu2d45G2xDXCYOwNxs2hipwuZ/KrpBRTh1msEUyRgBvPnO
 VVlqnq62kLpbOyjWD7eAWOax0q+/dENssc9bQxaZ7etg6uMU05nFAElVPAn3AJ/A2HEHBbz0uLY
 FKJcER/NVsaMmsxlz6QD4qLCD81FeQX0HnffDvIfCh7aSpOIde8yMQukY0xXPdYZfmx6RYTs0QU
 BicmRArT8SR2uDk/UiY2RgxNWkRjMDFQtjGwH2pAdGr3KYi4Dov5wzjP5TDNRMlsrWbKucEeG8f
 VjHCOLoHsV6iIvIych+diTvz84XMOlVPQLWmG4YqtFZtkxu3fuemTvKvQYeb88RoVDwgSWgiGUO
 U2aGFmaN+AbJuymdvndyU50vpY78BA0b/z3qEnvb7yBEp2/1sCQcOnEb9tQhsoGMt5iTRHYGnZV
 LQyzX64AwjKIki0977w==
X-Proofpoint-ORIG-GUID: YHnM1QNLNWsPivifVeaUQuDJRgvXhBBq
X-Proofpoint-GUID: YHnM1QNLNWsPivifVeaUQuDJRgvXhBBq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDEzNiBTYWx0ZWRfX+0dPG8hahQCb
 mnCPuU+VSZThnLArFtG0A00wlL3JGLMsWO9kE30BGV/j0WQw6JyRZM/of+cNPiAkNGVkej8ktRO
 aCF08Mc0id6T+sGXVk6smUBOMMb3ifc=
X-Authority-Analysis: v=2.4 cv=Tf2mcxQh c=1 sm=1 tr=0 ts=6a9c0acb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=iQ17RmGla2tzZZFXTgAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050136

Drop duplicated whitespace after ':', as pointed out by dt-style-check:
  monaco-ac-evk.dts:825: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
index 6f3c3ffefe34..f3d41f738440 100644
--- a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -822,7 +822,7 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
-	expander6_int:  expander6-int-state {
+	expander6_int: expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
 		bias-pull-up;
-- 
2.53.0

