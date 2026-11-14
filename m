Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670766;
	b=LqcX/ozyJ/fsVQEoVGJ8NiMp94s0decya5uY5IcqGD7ue2nOM9wkwMr6wZeDWpQu61tS
	 u6yCLliqMYQGDFIce2damzctKjFF05TE0Ezfhs1ayfwjlmHIqgiTA3qhrwxQh0QGIFcM/
	 MLZBdBulWDFonw/EBl+A/SE1aZeqW7DImZMEiqC34nybATMmyabzIV4/Ow9SWSBLP2b9Q
	 8nPl+qVBsO/Z4USkGfey+Ac6Ps/Gi2dcC9BkWowq3xaqPT+qCGq487wBV+E9yNGt3mbJl
	 HRXwVAfKlSdTswBD3ksXUUlVaBd0R11k2K0XELhfBZNJvc/uo2mNYTAp2lcaQHPvP+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
	b=2PXHvhsJgahjXVhgkWfBTwFuZYPCR0fAC0ad+RkEFOv4KjIT3brBws4/x+7TrLnMJKVF
	 P8iH8ifVRwLQJTK7sHoA4F+wkuvpDrw70A2fQOcOYTZduhALJ2t8bZi+Xtwo2+lO1eR7B
	 Wlr9UzP2oatzPBjTzkeMYx1LjwoyVH77XfvZKZlVuH9Zoq5CozU1kLFq/u81ftPh3IMYs
	 tWaTqi/krRF4wlHXCIv30xkH3DVYKDePO/sQ7gQuhEeWqc4FuD+V6jk5VTyBx+xnGkd0H
	 KGrYgmKUEXKtDqtSFJo+4weCryJjG3Dgf3IbYP2IwUHhRPijOvV5bZya95smHoEQxig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuW2YZq0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igE00FZR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D4606A33D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367D4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuW2YZq0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=igE00FZR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDjv2R3173369
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=; b=NuW2YZq0Y41HQpkr
	fnC8EY82DmUdPIgA7mZsD1h9N263pSYE763MDan0BExrWxog84vFzN9yvWjUsc8k
	Neji8rVB1KxtF9iUH+WKDJAa+Ze4pV0fuShj2MNCiVemBhTHc5dsxO67snggvMNj
	hZB1lA83CYMfR/qhnXjhf8wSGEiE3LpZ6DTzoj76naB0z/qeZZy4cRGFJtq0LO51
	EAPivJ4y+rYbujXM8TirtH/WfdC3vgUJCGfWc1cNXE6DBl7JN2rcbqEo3JKxVBec
	VYJ/6rC97gjUlgQeMmnbf4PsmLJQn8tLQCMbi7t3a+L/JE7TiIIfUWaxCxNS5Oll
	mV7uTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhh3er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso328869585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 07:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670764; x=1795275564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
        b=igE00FZR5jgQO+U4ihtj1yJKqqcpVhs8pkpQd2X+yedPvNTGfi+BkfIoabjks2QuXc
         xYlApRqC7/V2fWUN+aXS87PfoYcTZn/vVbfmQiICc/kpZiiDcZos5YvnT7Li2HErIqSK
         UgdZAhcxbP31+g+WrAyn0zjDFAGQrYz7WJk1FysZJhPuaJil3dD+lsYcQIq/dvbFaNSH
         OKqASf9XZzlPObPRhm92u7h0GMQz3Z7I3RGcrjZUZPrLP4TDdkFkUsnyuJ4fpAbj+s6e
         Lac5G0rWR2XTx8DxcrAdy4ZyUIIcIdnC3vSZfL5wFzJPG8enMwFEl9gc3aNa53Aak7vc
         jOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670764; x=1795275564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/mPHONDiBlbVDbKIfcBd4APZhECiA8xyKQZk8yM/d4=;
        b=Vsl2ddWUvDbWPW9HoDeeUWGW+WY+tlfVogTLCWWWYfzoaWeH3t02l5f9yn8Mf68aCM
         LCmymsl1I+XSsN/PO7ubsz7+N/8fLB9VR/q3Eod+hH4LT2lTkiOVS25jPSn6iYe5ex+D
         GcEagzPKI51wrvv/l4jjvm+r7FQPbVtk5DNqocgdNe8n7UH22hM/W4tbGPK5Is093C05
         cjWelVxejr9JMuG9+fTwikCJ8bcOfVEZW4NUjCHVTLlqisDDjRdZjfXP6P1ak8b0eWi6
         lIke7uSHjHCeCYaCsGVVpAcbAxD9x4M8i2OV32+y8Hwvn+Z9BoMZ3qBLUb69uAkRhV6S
         ETWQ==
X-Gm-Message-State: APuU4Z839FsIb1+8cUc9Qh13pIaf6lbVb7ELFGz0IA1cIPvg+pKeHrYV
	ieYNUbUKssKA9i3zX7kHZyxsZPctSs2RiZz1qrJxn6musvBbxX5BnFhPGXQoFyzHpW6ZcejIzsE
	QHjFi+60kA5TdfGXrEnAoEaExqTBhi6q2p8ImckT6yd5auoTTGjvZdINrZFl022lSAz6N
X-Gm-Gg: AYBFou16P2/eAuI2QJdJeMdCA+WN3pA7dc8h+V8LsrlCvPNbnkVyAywPRB4PEcwWPyy
	c8l9hlLYT8Xh7rQ/z1OaC4facRGwaD3LWmIQhL5HmVyuPcaRbzjmGj7/agzosQ4MSZkE4lDYUCK
	oN1NOUR9/QqXxq1EinKdAogG2TfDQfM/UhFPUfTM75SRypeQiG4fHtNv2Ue3Q5BJ2HnfrGF8OBe
	9o+CjhaOcZ+/7V1yOCffyIDZRkHxIx1l10pC3mEgIsOwXcqqRGaYruB1G5QPp3cskTBZGV8Tbop
	Fj8OTS0JKH3jRmR5VJ04w35f9BzpVrpr5gt3OnoZfWbmbUOGWJEIbKwge80rLg6lV04WV9EpVP0
	t603Jm2KI7NYB08YQOKOhxvCoUCS3h05F3Glc0KNMz8oLvCorWqwNyDqfIOGHHooQHLvyi3agGD
	Wa4XI/0FNPXoxn
X-Received: by 2002:a05:620a:28d6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-9494bca6f3bmr1030873385a.59.1794670764512;
        Sat, 14 Nov 2026 07:39:24 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-9494bca6f3bmr1030869885a.59.1794670763980;
        Sat, 14 Nov 2026 07:39:23 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:23 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:04 +0100
Subject: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
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
Message-Id: <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: jwfyKzletShUeoqDe4llIW4eV4GnAfGg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXxGqo5Kqczuz/
 3c+RGiyPemMA0l9LNDOw2tzsU1S4fIGXvzLCtu8RmcIKtJ+IT4CgMnp2jQzPJwAgoKSU4taL1jd
 Tbyv2OEoNPxIv6yXP5U/fILGOWnETDU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXx2K+zr+BG+Dx
 toS86e31CtIssmcv2/YY+flbBM8wbsNjO/3Go9CukCsVRj/FOndO1Jl4LiuMECgEK43XsHupvJG
 RzaBGV1vqu/EnBZhUWaKEBuPHnM7rksDhlH7N5jaoi9xzV4dPJCdS4CYfNLV/xKhrAmdnmhjaYp
 OJkDaoRYI+kGoh1n/6cl+ruL0DLEvEIbeTdsaQdU0jroxiFOZLtsj8qN3jT/hqdAhQM7atUzDpw
 Uw8+dvJGDtiRLVOAPldkT4lpueZwoKrAGqBozUBqNqlLG1EpQoIv2pEOnB7l3NtCH7KtGW5/hXc
 NyhaHZJERejs63bZNLXajiotCBGi0UTXDYu8y3U1CwnN0yKcQgPEjJ1qEOXeYcriEq+m7I6Cypp
 M9ImBH88TKBtdqobmiCm9HgurvWxPxT8PczKJ4JOg0fwdDzcTYYDo7yxy2srrHdiI4rStL0KHRz
 0e2z5u8d3rkXIU/AuwQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af880ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=A5wwQmU0M-B_W0dhetIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: jwfyKzletShUeoqDe4llIW4eV4GnAfGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
CSRs and the mode manager register that the secure world writes on
behalf of the driver. On QCM2290 the mode manager additionally ignores
the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
the boot firmware does the same before enabling the EUD, and the
register is written through the same secure IO service.

Add the compatible and describe that register as a third reg entry,
required on QCM2290 and not allowed on the other EUDs.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..14503527cdf2 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -17,13 +17,17 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcm2290-eud
           - qcom,sc7280-eud
       - const: qcom,eud
 
   reg:
+    minItems: 2
     items:
       - description: EUD Base Register Region
       - description: EUD Mode Manager Register
+      - description: TCSR register that has to be set before the mode
+          manager accepts the enable
 
   interrupts:
     description: EUD interrupt
@@ -50,6 +54,21 @@ required:
   - reg
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm2290-eud
+    then:
+      properties:
+        reg:
+          minItems: 3
+    else:
+      properties:
+        reg:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:

-- 
2.53.0

