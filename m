Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9084718D5
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449316; cv=none; b=jUz9t9/IpABABPojETWH3Z256I8CBpeCpardoR4l7c86zxb5M93LsDfNldbmEGxFRY1NtZBJS1Ps8YzGho+Cxzdee5++nm/x3IlHo99EvzMTY4EbGt4yK4wc0Z5vPy13M4iLRU1lTiJuUXJH8iZ+xRBh+Wdk1rS8bMQvUMF5da0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449316; c=relaxed/simple;
	bh=M38zr4UDDSTutNGbAEBqRcN/i549+qASNFRF6ZXlXao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pH3sw19vPJTlYVbVj79zUc5gEPJleDWZ2kkE2WeFLGjevrKrL1rRr8IT7tl5pHxVijKWUHVT2iwVffjLFZAANh5nolaJW+EeSrRFu+tfhEMnBIkXUecak7gD59nb40hyu5i39gTSmGw5FjzdE1gVgyrX9h7hbZ8DrhllqZxm6Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alXGJfJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHX5kbX6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alXGJfJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHX5kbX6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987Ka3X1170062
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 08:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lTF1ykEwo5DXZWlyE50I/v
	qpScUvMcBObYB/UQq3D9Y=; b=alXGJfJJsfyOMO/kf6/xMm4Yr5Q4gP5iJIqCgZ
	6MAmJSknJQdX/ur0aYRLyAVegkWSVranv2SIvv+faX4DPQjsIOrcZtqgTifd5sYv
	js6o7IKgc+dfDbBc6N7lDLhkXUlZccugLGm3C15pe6bL0SIcGoQXmOJUSLQbWZwA
	wdpajQJKjUnXMhwYx2czUsaus1e2JVKCRa+0fgJLpxtWCp3FZhbBB9kXyFiVJtTg
	2KviL7vT+9AfWad3J8nWyqOiIyLN6vwSzRiiu7wEhoVbo90hIetximT9QcPobbdG
	0M+Ozfh5jnHaQTlQsX3JyM4exrH9N2MqNPk58fiz4bWTjaRA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39yaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 08:48:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef5fd7934so13582121eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791449313; x=1792054113; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lTF1ykEwo5DXZWlyE50I/vqpScUvMcBObYB/UQq3D9Y=;
        b=JHX5kbX6FvooFNeR/RLesxcL9IKHkjULuuLuv1ULaO1SN2HweW6c26Q5qEKatoy27p
         90oSrqx/Iqzn/aHJeMHaY8J2Qfa3qi987rjKaVNeQcObfA2IKD0ZhP913aies7c4dHPh
         dtn2WXwlOETIwDMkS5cvXO5OV+7UcJriwJb0v1mIK8oxvrq83YRNqtr1zgN/qvj9TofW
         95aKqBXIFrys3sLUI6oEdJVf3GL5TVr5AnkiqTqmS/YVHhIgc2S+KIvX6xmCZdC2XUlD
         RCGqK+XZ9ttX03DHCutJnDwFFb+Go3dreEcuIYvCIR1l5v+Y2wuKS2iQx1lh6MOy6eb8
         adMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449313; x=1792054113;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lTF1ykEwo5DXZWlyE50I/vqpScUvMcBObYB/UQq3D9Y=;
        b=akGuykb0ehTOL//bjDOA6344uFEGksSipqV6w/fvLyBetcywj+ekQsmAD16LHrxRPe
         oKVVRCAH3NuWanj1CKMilbfLYnjtCyvYwrzNf5hLHtbaZokKRYiCm3LtLYDZWUEdA0dA
         dsHlTZ9K6K8W3V3hJagjsVvZeJERGNtDpXAuv7H8o/i8oxOP7HpnYLHz0yjF9hQo8beO
         eTuQ6JWlVjyoUzkRVYs3Vs7rNwF2VoO+0CSee1UunuUp1fg6nxzKx4kau7g5wU6dkZUd
         8nZFMYXkvrb/7DiXZIwonD33JcExpPx+G0ML17GOxCsuwWL9IvJ7Cj+2MewQwoQW/Gq0
         wzdg==
X-Gm-Message-State: AFq9FYJlVrYLvVsv8zDvU6t1RaTZ5fGc5+ao1vAUiIhQ2QsMKjSVk0Tj
	xxoRrOo4NMmoX1gjQNNzWU0LGAds2rnaq++yYJrAmNR+cGnO4f86MHCJUdQfH8XCgUMBtK1um7M
	GUdLCzbLGkPyBsxTR9H5HK6K0Zp/En+mJI3FTC1aAQnSSpiS1xPyCWLNE8cne9ckfW1pB
X-Gm-Gg: AYBFou0TP9KjzyXkoSiS9+h5+Yw5q8SNNjtIoMBPh/TygSiNUQ46cu1kY6WENHPxw1P
	J5zY3cz2sM9nHUjKSXPFjz4TtIVY+SCCWqm/ozSawmzOBeU4lsqrXTBcRP1IuOaaGB2PJsjOoQY
	1owznLp9gFhiH5OhmDxSHtv03JJlrLTY2Y7+eEWPe04SPZqNl4d+GNIzFq3oLLg7z1KrgThQUjL
	x89axdD6Y1OrjwsZoovx5Gc64dENgcD1N5bDDxGAsyXs5uVpkO7GZlk6pz4Uy3VrGKaYsDHoTvz
	os7gw0d7fX0xTrXYFZ7ZQdgZ8co4l+GMJCA/ZWtW3C157WD6hL13TxKM5vFwnxfTA98BGMN1hyp
	6ztHVoqGm0sczvrrf6j3fTLG3oyfOjISnnEGLw+sCXaOjLprIGvZfh6OR7flPs55n/FVGKFnxoK
	uDbVcJsdBhNLBeS4UafA1pNKsJf7fgPQ==
X-Received: by 2002:a05:7301:670c:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-3515de80f23mr7606194eec.9.1791449313181;
        Thu, 08 Oct 2026 01:48:33 -0700 (PDT)
X-Received: by 2002:a05:7301:670c:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-3515de80f23mr7606146eec.9.1791449312571;
        Thu, 08 Oct 2026 01:48:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm15302755eec.26.2026.10.08.01.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:48:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:18:24 +0530
Subject: [PATCH] dt-bindings: crypto: qcom,prng: Document ipq5210
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANdYx2oC/zXMSwqEMBBF0a2EGndBEvxvpXHgp9QaGLsrUQRx7
 wbF4X08zgGehMlDpQ4Q2tjz4mKYj4JuatxIyH1ssNpmRuscxY1oijJpbZqkmS0gPn9CA++38q2
 fFvqvEQvPCG3jCbtlnjlUytEe8AWhPs8LZjHjD4YAAAA=
X-Change-ID: 20261007-rng-1894b2545628
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: bPdntskAzMS3hZnlslkaq0sSjdHirB4x
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac758e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8y1xNrmuCni0Qpi8TC4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfX2r3tpLZJ2Ugm
 s10w1WGCOAgKMvDSojUt937IKXsb3DSiIxde6cNgRT/oFYONrdrkF0Q/CyXHpmTuZoORSLo8kFG
 gM+Eqdy817fNcOpSerhDxZFN1PWltFY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfX21Cmzrwbn9rw
 HKaSsmnXynLT4MJvMue2wTMONlk+jOPRV7p0VSFGB4W+DzcTxY7obvNoHjDxj95B7rkDlKNIFMa
 f+GcF84JjXZilB63SZhqhDyD8x6fWiya8d10A/W/rf/7zA6Oaq8X3vziSfu2H9wdmBP2a8dIFO0
 lQi5ZWPYS6GXL7aa99T6EUVY5LPb+hpqhFLKY43OurJhzI57rBB7742QsRdKUPVm/8JvJajz9wx
 0m/ntxMkqdiKFzR+mI7GZVlYEvgkarFLJPDVKUP0ndmilFoGWx0CwXLQRDHqcoftw84QkH7a6FK
 f/kRIqVWwGeFWjemQHKbhZU6zDtlaVfT3Zh4B4vAmrb3OsnZQE+2o2aUgeebWHBTFHbRz0BYrXY
 kOvwDyEr1lIC91KPov/1lvSVIUmd1zdMvnx9x2GpZYYwVlZoRtxGukIUSPDDjFaTZFH/u9+wzsZ
 9MMjzRNAwtkEAodP4gA==
X-Proofpoint-ORIG-GUID: bPdntskAzMS3hZnlslkaq0sSjdHirB4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080034

Document ipq5210 compatible for the True Random Number Generator.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index de323969fe64..2acb629e816c 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,glymur-trng
               - qcom,hawi-trng
+              - qcom,ipq5210-trng
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng

---
base-commit: cf4a8255a424f691f95dfa378e88336f33aa8ae4
change-id: 20261007-rng-1894b2545628

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

