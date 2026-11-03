Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736359;
	b=EAPnneLpGKq3gOvDDNbxOY+csEPteKWdj47GaaTs+/OpeUGZOGyvIIoXU9lpkUPrf27/
	 vwBygqCdAuROrAb8a9tNAfxpZprcqQ5GuAe8bXLyWnRqKKm4GjNnzOOdFyAkZtAnr1Yj4
	 lgqDthznNWNBOHKsbH+O3w7100rqWMmqTR+T1AyIr9EYGUUOwPGZaGAQMipEwLxelI1Pq
	 tOdIFjMvfehDlN6/QPYRXO2etvD50ib6CbUDOelq0j8r0lSqSA9gnN49GV274jqG7RFvf
	 XKv5wj2TjUw18vacay1huuNRegUTUXZcogP3MZWX7vwKhAyojoI40PS7N5L99VfQW/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=Rhnx9sOQ8jWt8ErIS36MMBIUc27w1bd4FiZUZo5HrECeS/SS+HOw43LikMXAP30hV2LK
	 CE8z7yEnwUea528oKrL1k6MrTibgS5ve7Uk5/fIVBgonCH46xEGpkKDwfxyJo03Y5sFJM
	 /W5rF4mhA9xw9RZdLcLkZDk15La+hjA2+N2ME+HNVqvqEZhmFMOa/OOl66p84vi/mae5T
	 2/GDc1Ma7Ts4XFb8egd7iVuER8CB440eYcXGHSo47m8z//F9qDBI8BP++aZhnM/CXE6JO
	 TW+5Eger3bSgvYmFI7h7a9/7niXHnfDWGubGibCvagl5xjJOrQJqcnZba9zHG6QP4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5Iv1Cnw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaepFRxH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151B606A329
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 20:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D151B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5Iv1Cnw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OaepFRxH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ24T3318791
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 20:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=d5Iv1CnwTgATZ5kn
	F2knie7kyfihVHGZ45g6zCc5TeK6vVdIDTuBIlPZaKgw7W/k5PCd0iB9gMIbXP+s
	H5yYfg6mwWxb31EFFRDeoIjIfv7JJwuL0QC+WTvlsstRD/fAsjVklLA87IPucSl4
	NiWYUlOiLnalFyDo930YH9B6uCFUSzvXuYBA7iTu3784Be31kmkfRtdv8bAtS3P7
	Is9DawMStKYd0+jZ3HopCEXbtkf+Y0j3WnI7+aBHH5G7ssyFsMJo3T/IN+06KBPc
	J61tnRAxyDhNhkJBgPvqprvtodC5t1qBH4EdxORCqAyumOWGWtdGxa6DWjVkOm5Q
	+RpWZQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bhm36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 20:05:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d07a14a71cso3631837137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736357; x=1794341157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=OaepFRxHOzH8r+4ygD/AlHzH47tHJ1o746zasJWN6N2zTh91YFgfazPWcfv9qgTzTZ
         POeO9ury4U7PQRD8ZJyr8XCOvvl7Jd1VWHRgqKF+oa2mLbnqyvx+K5Kre/wvvKAODq+E
         pcYIWgyF1T8nqacnD+wS+hEa4SfegBJV9Rb0VhbJFX45NpbHxtCXDovURo3Je7uVxQOu
         +c1clA6cefc/N4NSlj0YWzdJa6pK5oNN8HwrL6vM9xL4l26IVATZlOZ3XTHDK8FvUozl
         8VhYVveewaYQ5+vgepzl6gZv5liGe/z3LmZ/kLQCH6nf2OuQ25MJ+LcsG7hYBglrbQtH
         en4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736357; x=1794341157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=g+ZJypOsiO6JTbMvO2qiWV2YAAZz5ByXFTSmKshIETqbb0qbO6IhlLQHGg3/sILw7e
         va2vMhpL/+zwMugRWNOUaV7f68BYRDT1BOqZ+IjZguWetwzMPG/0MxafqSzDqkn9aNdG
         GUGjID/HOh7wQm71ElpJup4806lgEbLi1clAq2aaS30QTRVPeP3Qh1hVmPKxSNf/1DGA
         CoFCEWIdfWJPhKBPLHDpTjHNXeo+9T/FrNctMrqONXdk+c7KfQSz/c2wD7bW/UN2v9cR
         HG3l3jCQ3W+9v7lKWy69x5gDgP1nkMStyX9wrfsu0jZ/Gga0fcIVxVwEUA3/1R4PEWmx
         VorA==
X-Forwarded-Encrypted: i=1; AKwUvBwIcETQvNlfo//SQtRjARYLLGbKc4fi+OA31ymiASXC1r4gnQknOk9O4223s4ICJqA/kbjk5vbiV0/hs73M@vger.kernel.org
X-Gm-Message-State: APuU4Z/QfkLQm4+JWK7RSzc81rWg1oHq4kkVcnl/oRGbFcUveu78t5xQ
	nCuhzbkWXJVh30mRxp3ZmsP9VMXhOHy9csZHXctdQyc2uJJjHRPVEPiL8RGAkd/UY4LwL3HpLNE
	LAmPoyHuji5Txk+/NijvArQhRpvUW95NtpXZLg3ps3JA5gwAqh84CiDnXi2l9S5gi5YPc
X-Gm-Gg: AYBFou1rFmjZpVFDmXbsjqIG1rlCA8KWykXvCv3I+GmMXmx0GwNQH/1X0L2admcx8Jv
	lxq2AV5JM0UjYxb5jxAa1N0LqDG12qwvB13faOsy8yeFsPMk77/D6+CaIRIkDIJucMaU9mEDhOk
	q51j3nqoHnGwG/CWoQwSZL0s3wdGs4p8UHSa1mhq2exVcfDRif35/jqaVa2NDL/ytI3uxDB/DJK
	ohBtEVA3wNpk7cJoipEfXrJIg0Rff81HH25aOrU2GCKE358ryb7hbAFYL3emAAldvUeakNfjOJL
	ljylPL+JMUb2U5Yj0BYZp8kfIQjj8/haItoqAXRiTSULQvpn39cW/kN3y8x9QrFIdP0wyNBpm5S
	5FYUIv3DeOF/Lcu0IzLQSl9WvXBGQDv6YiO6VZnU9CQfuPJd5e2CiCe3saWSCJokhCIUORSKCsJ
	yoGzcJYohW+Q33RW3awEUqLyAUAmpohiL0zkOlKVzkcxIjv4inbmi8vmfNGucAuQm2ORsvgEBkd
	2SRoVTFZl8kS3wIESCes80dq/r5
X-Received: by 2002:a05:6102:5810:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d07226defbmr6266286137.1.1793736357055;
        Tue, 03 Nov 2026 12:05:57 -0800 (PST)
X-Received: by 2002:a05:6102:5810:b0:7c3:39a3:f65c with SMTP id ada2fe7eead31-7d07226defbmr6266274137.1.1793736356506;
        Tue, 03 Nov 2026 12:05:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:47 +0100
Subject: [PATCH v13 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261103-camss-isp-ope-v13-3-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXx7wvn5kbqYWh
 SCOnANLb18IVr3ujH8vwpbLUeGYrSunwFmZz4GuiaO9k6nXi2qtc60dQ/V6qfsKgZxOEuzcskX+
 eZAjayGdMIteTNl9aH+jSNvw57MBEcc=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea3ea5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: A4196RbRQRmJA3ZXeEC5FzlTw8RhfdgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX1n9UwMWU9j6U
 fX3Kc5Eb1ecUovY7Mv/m8kmSXBkHiJd5f0i4LdfbRXVdazj9SLmXeA2HLhmzjBVv0/kDrUKCJQt
 iR4P9gENHuXOqFHxssisM4h5AbUgulN+lYXBgd+hgGtVV2XVma41fwSkzKtLDIY/CBw1fvfQsqv
 z0HWi6p/KuIb+QYw5DYwpvwf5C0ldbyb+fQ6rtXCgH+68ZnO3bxzr4tQny5cEBmqtdH73Gl4p+E
 ySluM8KuaXiTitxbJvPzw0edERhLDnK6gjm9LGFSZth1oJqAcVrN06jINSTwah9n3KsdylcA0Km
 QigJAPvgvWHgqE4vGJtbGT1K9Iqxn8RyBLSXITLn6yWnOEuVABVo8KU74pvWTaxDRDqmCk9zBZk
 f25LeLOBKmgoBzXppndEGUC71mQd7tcWiolMdYKfHgGSwKdd/OTp7IRmhD1iz9YZgjndASR1d6B
 YCdH00PzquN2jByircQ==
X-Proofpoint-GUID: A4196RbRQRmJA3ZXeEC5FzlTw8RhfdgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

