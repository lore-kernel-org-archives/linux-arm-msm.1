Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426526;
	b=YnD4HJrcK20Zwy+eRLt7nq9IK9P3rM5RNqmuHl/G1a1gT3PU01otqyG4cRtPZ8dnLYUF
	 OIbw3t5JO2PlGTkzxH+d4blkWt2GyLq2B7AjcA2ntgEW/uiL+lQUY71BJ5Oyh9FBGy7WT
	 rKPaDTFHtlg+uCDnWMHEvyJBYu+W9Z4ZuIWPTFT0SaFCx+S9ozH7c+phh+IoCnqp+NMZP
	 BLvw5o648zX3R0AbJ9716DjKzahPRk1jZbEaZvddT5w2bSkjkthz0LHRN8eYPEUvMU9NP
	 j9KeleUNQjV07iTMgJqa2poOBXCWA5k0ZR5B93Rhr/buAV1G0hiRlZnRKuoe81/3edw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
	b=x8M1C1co8qPGQgEU5Pr3AD3UvrlRQ7SElhLdNHPGSQVtrmArmUgBvapCoSAAaOU29SGK
	 P6XV2atGE7vcnskAMKsQG2A6qxUKkoiHIDcOGjuklVOVAveZVUVXtVHdTenk2gaqlLx7Y
	 brCXyG8s4W15B5izB7NHz19gbM/qqbX/MtG+tXv+c24uCEKYPHMIR8uS59RYCN5Y3/61n
	 cVXXHTd7tDYGyNNX5cJ1OSKWZqErzVNx6DQQ54gAot27fYWR5Hd18FrcyuUvjYvn34nAG
	 mPCO8100H8aQ3UAQ2ajxBo0lqU8PwqP6e7xAKAJqMY4v6oqX7wKonjC67KXTn8WWqHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZ+fB9Yw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRlBPVGM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC9B606A334
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC9B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZ+fB9Yw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRlBPVGM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Go0N1900947
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=; b=FZ+fB9YwwOl7Z56Z
	SwqQQ8THaWDWGaJJcIiAcFbnaXqBV6uco2lBY9V2oKQ5y8A3p2t+B3DOKCnzioCJ
	zXmabR+Z4WvOC6aFJjF109/4RH40+EKGJax7gA0v9wWTri6v0Ce1poJarfce789C
	7qyJ1lHF6tHSSV9QH0FCRx++hiZgLlvXxeUOKf/oWhfCLXDbNoPj/48ZTx/Ut8ym
	vT5pQCFZaqwqQj2Jf66JafYROwGHQdpf1snyPk8DX36W6NHvABKi1Pzwqxb5obTV
	35cs0mONSkHgrmFCHAZ1nuvPmX3NQTfBBvEyGS9L0qGENPnjg9ARNu8v2BTB+1iH
	YFKbDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k0qpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:35:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so332436885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795426524; x=1796031324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
        b=GRlBPVGM5euRKBOh+VjQ/m6yUIMVY52aylcuFXAcbaKiUa5ul+5mGZ28JZ3clrEn2j
         6X8HWv5/OYCCRMY5GxFCmbgpXaSakQm8txlWCumzfuHYK9MMZV5KSUJUZ5vypipP2RNs
         Ln/GO0H9+HfRiQcWleKZ20QPlXxrk3TqXOJrlKNIADV0Kt/IrTDiu5/ACBi+mdNUWEHr
         EBSvLCceXo/gWnEtqiiOdG5T2IyOic+nyuSfZrJe+KUBfD6ocamPEIrRYWAmNRBkH9Wl
         euvIJ31ADm2bH/Wcr8ye3Q8xVUrnouUZIWJCDSSOBS2MoogjDAUxEwlsLfInPUl4UItM
         PwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426524; x=1796031324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
        b=jV6A5Zvud7e/kg/AghTfTef4bS7Hf+6YXexj0jnEyjSDvOsoyec5S5lz8CYmI2AI8q
         jojSThywQFNjm8RDhPkQij9oSL5JbxsgOvW5Skwm31xR/So+vmw03c0dw4EVXF9RuPUQ
         Q8e8+H4HxFs+VZ7zNs9qqfuHewcjdg8NSS99BYtHB0xiC03zWnEV7FkNJsN0jC7ea2UW
         3inrOw9LTvMmymMQvNpbSY4u59ELQHHR6e5QNrknkpk7v87u+1UpA/snol6tE0kn38vh
         kIFLKzodyzynNpOFqY1vFPbh82/jfA9safl1zVI5jDzwidLGEJknAdEn9hQd6KxAYz3p
         mAMw==
X-Forwarded-Encrypted: i=1; AL+hErEYyu8y3WlSOr7356yZWS9CiQqAwS78Oeyq0KWT0HzukoZF4HK05YRO4IEVC6YU4KeiHZZHuhkDasxmog+U@vger.kernel.org
X-Gm-Message-State: APuU4Z8LNLZd2rI8DWy+N1QNr1EALdCsnTDMdhVaTysiLiMru9VP3+Gl
	BQPKeosWlwidV1qa5NwR+/FLGqFFvyCrQMb65+XGpy0ICPdwzJmcs5fbq7e0kr7KTTsVXaCWA2p
	bHrHPWoNmsBwM2bqVIgywnHvIKAqBsjivYNsnQZwMWz6hmy+Vl7d0J+92MjCqRuOdDY9/
X-Gm-Gg: AZFdTZe1wosWm8FhXLt6jNwi1UgI6gvBRBaegLfEyZOf/Brmclusig2SdI9PaAkL87T
	qSvGeRCKQrTuwtQePy0pOkytF4WR6+5hQvIRb3RlY3pvbY4NJdtKGgJeo7OV7gPMqHlB0fwq647
	nqW2tnE06LeuLfVBPR81YhsKqgbyK3p7MY9zUyYfddAiAhii0B1b3TL55JxqEhdKzpfP13xGJqb
	v0COoOLUzvjcFfqM2oVHZy57YV1dTmn/U2r9GJv+FAiathu4m23fllt8/rVX9C9KBuy3+hZxmA8
	4FFp8nR5QRAgPvmZKO6jYB7DWWH0b1T+MIxhOWPUR75TXmkrJZtJDxiPR3VVYIWgoziDuEVqK2c
	fviU0sNNbIdsnDFMx5htKk+9yP7WgYa+4yXzxNLEUaIN2H4zlE5Xuw8tFQw==
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1723261085a.8.1795426523931;
        Mon, 23 Nov 2026 01:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1723257785a.8.1795426523323;
        Mon, 23 Nov 2026 01:35:23 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm123208315e9.4.2026.11.23.01.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:35:22 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:35:14 +0200
Subject: [PATCH v2 1/4] dt-bindings: embedded-controller:
 lenovo,thinkpad-t14s-ec: Add Gen 7 support
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
Message-Id: <20261123-t14s-gen7-ec-v2-1-3420a6202366@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=aW/Ws2tcO1sy5bYtB2QMD9F+QpXYhZTfqTiGgY5aZZw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBAjTZo2x+nFetcp/vZWh5OUfrT/X2LS3oAmUh
 a+YqdMfBZCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawQI0wAKCRAbX0TJAJUV
 ViA+D/9AIYpciGbl2CH361KLQrGAlgpvHSNrjn/Fpn8HtxTv6jdjj8tpKpHv2tZf9BUR8nNQGr7
 uT5BI/ONMTqdWu9UTQ/bo5X5aklNg8SLS5NXHjUYth+1ZV/fifVBGOkWjDfICtuLMwN67tWUsZO
 gOtlYu1odRhvJ+l98QDXFIFOuZAinvMsyLMPTuapUrils36EGR923a9LszGOfoTM6IupbJOxvOS
 ERIWVgiPFJ1BvpfIypqjbbM5ercI9lz+z3Ix2mT0DJp/XgpReU0HNeVinkGB3HF4mAJgV5oe1C0
 IWpdFmWc1n7xi6Qu1ku+CYbnG2c9dt9cjHZ+2KkEnF54u1pVfVKANsWE8BDrY4I7ff64lYGjR28
 07weAb+ObQS0mYbbaS+9Hu3XUveGAiq9W6jDehs7Egrh5b3AE63SlHKLcVyLCPtGwjvhBsX/DOQ
 9BCo0sTNP/l/JIQQgN34LKBkYHb7gDGFAfxGNBCpaw1TNk4EwPh32Nl44j0wi+1dlriPxHy/h7k
 TDTlgzNfwdQE/Kr8+5x51HmH4JoYm4Y1svWj0CiyYF+hrP4Y7xSzie+hbzF2Cirm9lSfEb7i/UI
 SUGcf7W74pcUluJ7bUv3SEk8EdSQZehnn8ljC4Y5BcOGmfke25Zo3OwnnqP8SVQkkRJzECimzXs
 /3VWrBZENrk3U+A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfXzQbFIXukdybS
 n5vleBm/GEAu1yzTvL7qGaTIBU1fxl2RShE34TjSPARdbbTl80670j2+3g5HbmNIZZ8yK0c+0jb
 Z5G/ge9o5syvJtSF925af5B1dnwCRY8=
X-Proofpoint-GUID: rGlxdKoH00GeGq2_dHXPVl8X4cjYaNrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX62L8jBKLvEK6
 UhEjksTIKBRAS2g6RXa+2txx3p5HFN6qE/XSsGr6mAU99NPrJFFRndc/eCH7PQ7a3P0h+83ML1K
 QSBkUzZPNXzYLcCLjAGMXJ+fESCsK9fnboA1cqbdZVh1ldjD2gmDGtbBG/Ew6Mxpns9ltdkcnP+
 bBv7di0iGKZX6q3GkXeZIuZ8uDmGu9rv4srqwmMc2eJwulopKqypUdnvsW5cBsQl9efKxGfK9wW
 ylcSz+SmJ3rlv2KE9JzHBQX+CZpLiy3Np+NOWEMrrYIkuBTnuswsp8kCRWRQGPj0o+wloRmCtjM
 dNsQGWvUPbfsZRU+ZAX9P8hi+ausjR0sguZw+y6+JyEXgASPzymWKdaYDMfjlquqEBGdov4n/ob
 NAicuwlm+6+W0SY5waLCwoml4ltMMyjA5OxNzT0mfBtYlhkjYyPpPlfESvFEq30Y8MVAZeV6OFy
 kt646GeYklV78UTuzSA==
X-Proofpoint-ORIG-GUID: rGlxdKoH00GeGq2_dHXPVl8X4cjYaNrL
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0408dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uZMt55wJAR8SEHwxpHMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230037

The ThinkPad T14s Gen 7 (Snapdragon X2) has an embedded controller at
the same I2C address as the Gen 6 one and reports the same kind of
events, but it talks a different command protocol.

Add a compatible for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..99e5e7ae3cb6 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: lenovo,thinkpad-t14s-ec
+    enum:
+      - lenovo,thinkpad-t14s-ec
+      - lenovo,thinkpad-t14s-gen7-ec
 
   reg:
     const: 0x28

-- 
2.54.0

