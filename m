Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A9640F743
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164081; cv=none; b=fkN7LG72VUlXR0fFr5MP2QQ3JgGo8EqZ5nG+1ivFX/46cN9LWSJnRvsLpI7FezW3AYUbzmc7qrubplzaA+AAOIofthkDPCd9I/8jeY5uBj8URFvOeWFOkROjYkqcROxiaK+Q1/l2QsHfWP0zPm/9c1FxC4UASVyfawY2L3k90xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164081; c=relaxed/simple;
	bh=d09lYffK7NKQtWks133wtN3qnkJ/qWtJQRxHm1karAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/dIGB2rGJ/ILp4GzFdCLQH4wmMiWtz1jcdINNoheFz62vM2wc9P4UtsuzjwS75KWzFVZf0b2mnhYDGaYBbn3oTDym+yoj6Qdw13gyQWlV2ValsDjPpKHvl6AFy+ApqqEyY95QzCeKAOrJy/gMrmOxyZ2QGHFcD5FQOMjJUDDrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFj/2fS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOG4kynT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFj/2fS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOG4kynT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlfZS033174
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=; b=XFj/2fS+55hJQEhC
	iVV5hLgmxyHHXCXTpl93qBg6Z/Oy8achWzs30QSxI7gGB7Z/5M4ar2f/ldtqEIBS
	T796Jhf/s5pO9xRiELM7ZvoQ5lIDiliiMVXv26rLNydIqxbrzcEpqYx2SJMiqAgH
	acVHSyU9RgKNbrealDlSDuj4QUHWXiDEQKVtEMl08HywmhuRFCieX95rl3zci5GJ
	OCHIKTa/uhYs+70dWyGS95DL/uioBOExv5l/ixcObC44QQPSHqskwD3YHQVuEInx
	qZRGW2hJeL8FhU0dDGtzNVYn7IAxKXMRrkAP/vR6enTdFlVmEC2dxyRhprtjVLm6
	i6hDFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c61bhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so36386131cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164079; x=1785768879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=DOG4kynTp6lHQuk3USHeJQtyYG/kU+zryVLf0ToWYIEmrf1ObNPJptGxly92KiS2eY
         uiY+G/oF4PF3yRuPiMhwt7gFnO73EnnPEe2H2dgqi4c8UUbEesmOGBHB4Ix5DDozHcvD
         jJaost61D89tI8nfLA+QhzRPXviHDnwhIVjheWyTEOgxPIPSLAdoq3ncQlZRiJkyTrvH
         8RKeIJgPZrebehSj+MTTukHiatyCYcM01tvKoiDUlqZ3N41HGzYX5RsVvrjwmifcD8uw
         T2lpYgKfEOXAI9w8qaG8s4ge0Xft8WvCIYY9sude6biNamrFUZevIMu4P1WoCkKr4rd0
         p37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164079; x=1785768879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=OqR88K0jRmCZecQQX8mH8EZXrQf9jr4sB43RdirCEdqGJftQa0axQOQudXNz7a3olN
         QtA4fEzdAVXFAxWaisJDhic8IuyZjEWygYzO4rtVEjOa7YVTUl7Vida8OVLkcFh2UUm2
         Ly7QD0uWlXua7/Ar0LXXfRnxxR7OymskyFYn5G9jTZbpFGBE3+9t75crCX0EVPoP8l7l
         4T/Xys8M+gNayiG6R0n4YxsKeh+3JWM+uPYtut094Ve+k6pDbJ87K1rH/dEW5iJ4rA3a
         8A2JhUR8TcHK0U18fSRldlZm8upqmMG9CKrqSlslV+93R9BHqnzLyof20yx3TWllomYQ
         W4AA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw8upDw+O/rPxXCQ0dlVjJtfG2z6Ne5sXxtupT/uVNGlSH+56HEWThDLhEBDffs1FfKAfkjR2XEA/zray5@vger.kernel.org
X-Gm-Message-State: AOJu0YznfQagW8vnMg4Ez0dIBjXePgtwEPzL3rS/UdKQ+w1E7TlWFgDD
	yF5JC+7SE/uLQ5eXTD3vLQ3Jb66ln+pB2hA6zhccybiHvUeDHA3Ot60J6Qbeh1TyOZXH7UYBG7r
	FbEXiBkrfFz/4dgbrtrOHbl92xYPudNmviNBtaH9/QeXM5HzurODcaqauK4Qo562Ett4+
X-Gm-Gg: AR+sD10wxvoaL9+EZkecnT7sPlnq0d/1KSNJa4weIh+EgzGO6Xma2pXP8WBjLNFO4BA
	ZtZr53fUJ7NFSlAV7vpAZwVyiDrF01apB2lucOhsacPKQCRW5xoSXjL809+FlaEsH1i7ItxzpFo
	mn21YmlJHrSTPth5kLwk0LT86FarbnTemQietptwMlg+MasrEuBaixM/HWre7SEIrs6Aqo5arnI
	/1XG4jf3+J8ZK8VtKNvKnOteJ1LO6OU904tiB91Vvjjao3o/zj2QGeYbt3/AxhUiQ+RKMICuhXL
	WGVBuCEwBzA1V13IpqaxOniAqEmycgE58dHq7OJQa7c8729JVLRrqNObRNITNZK2+7ojc7RZRa0
	PsBJzN6Z+zQCrxAQmybk0oP8gJAt08xNbBX8TDV8dt/PpbOyQfiK1MXS5asyDvyKhZPYR+DgpFE
	SE0/p8XVDk4ZhYhfDKJrwCgMHF2wSwX8opwGuogkKlXY4iqGPT4OrS
X-Received: by 2002:a05:622a:1823:b0:527:6d0b:a632 with SMTP id d75a77b69052e-5295d377f2dmr111181651cf.27.1785164078835;
        Mon, 27 Jul 2026 07:54:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1823:b0:527:6d0b:a632 with SMTP id d75a77b69052e-5295d377f2dmr111181381cf.27.1785164078387;
        Mon, 27 Jul 2026 07:54:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:54:33 +0200
Subject: [PATCH v8 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-monza-leds-v8-1-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a67712f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfXwWtNAZ3L3pZw
 lwWRbe3pwtacpY88XGNHB75FEF7WjcDBH+AWnRDhwnkD1ZSI94cYXse1mumHz7WyfDo6Sjvf2vB
 rFoWG8JK3g0lERHCPovlTm5CwNGUWq0=
X-Proofpoint-ORIG-GUID: mDYpemCZKQ3X_ThE7Es-hB9Uwcac_XEd
X-Proofpoint-GUID: mDYpemCZKQ3X_ThE7Es-hB9Uwcac_XEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX+DfNdGdi8cJ8
 yG40phuiUL8cuI6WifTmAC7/Fr1mqA0hm3H1m7hNlMwNAZeMAND1bW4KtnECE9oIj4CRPv0LM+v
 2zJn3E3JHAVUKvUXPkO2DTIoQaBKjHGOTMUwvvxTXwUfVOSDFDaMn0w1zwbN5UBPCQGTUM+r3R0
 3JjNko7GjWojjM2bgrDN0boXUEt3pcEbCwcEiVuMGNkPR9E+0spcF1F4ZslI6w9N7BQa2mBnoFo
 EPJivrGECNbfJM/xoDtmFOCNNxf7d3LSWDI3AxICaH9qZ2kiN8eMW0CJTDFTFlYWh3mdEkac/K3
 U5i/578d7BisjMw5IkuHKbHXgg4igEIc3/yoHXWsKC/Ia+4FFCKbBtSTJgy2ZVUqfSp7i5lgO9K
 IoqNsGyCgEswuR/MiQQC2G1zicSCuEvakygtHKzhnoxVztaYrIKyeq5D/Q7GtEt014hb3QV+7T+
 zKk2XwCp6h2WIbwu7Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270140

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4fda602912f7a9443b8a77e46bc015e244f82e08 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -62,14 +62,14 @@ properties:
       open-drain, newer chips to totem pole).
 
 patternProperties:
-  "^led@[0-9a-f]+$":
+  "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
 
     properties:
       reg:
-        minimum: 0
+        maximum: 15
 
     required:
       - reg
@@ -88,7 +88,13 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:

-- 
2.34.1

