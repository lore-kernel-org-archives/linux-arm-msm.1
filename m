Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B9138AC80
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427252; cv=none; b=r2zkED7LbS/azG2dY6VnmAEHceWxnwck857Fix8uxp4Y6yOHntPHx/Qw+3h9pp+AzztbJODNYG0n7+IJEqd/l7efwB810oDoJYLp5vFf3Im7espQ5yUHByxLhWFoQb4ekKsW6IOQOUoof1nc3skt9I31U2n9qEAxDuggdZQhNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427252; c=relaxed/simple;
	bh=xh4ucig5hPRkaGw1GggCAwEU1pqdfnGTPbj3vUFpt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bmx/dH6qyoWokYzyvq8UG+hAYX7vccZkhf99nl9kPIEb0Hp+s2//5AhNFAS9tSWnahJQJsTX9i4sgr1zRFt3fHwfIveYddybBZMAnSTkhlV315RueIw2xFnINM55e/uosfqOnq+h6MhVm5shZnsjlSmN8ehP65nSaZtm+YD/VcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mdc2lZTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f995O6V6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mdc2lZTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f995O6V6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQmYm1087180
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=Mdc2lZTPtt0S03NT
	RZN2LLYKd+6xXhFCtur9/pn9KUxEL/qAs2gSangnk3Eojs3/CX2/U8oIu1o6fKhC
	XroQfXn6jyxAvPOItfTXBxB6a8IEK4aVhaevupkro8jYPxWKsqEiumETD82FoNCv
	zojIrPoVqqom+od2/ljgKcP6kfMDX5SNaauAqJvwDWm2OmxejTT88jaqRV8dhhuA
	+pBxJQKtP7NAOOE4f5RoZyu1f2FUpYzK3pNhCbkmi4s+mx5iJ+i1z3qg4IrYqyDX
	v4V16C0fVnXQTebHonIJ1OlzTzv7K4oWtrb1v6u6WZahOxMwVdixSMnVEx8rgQet
	SXIImQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n38cud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:00:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so44328101cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427250; x=1786032050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=f995O6V6+l0ZkTnatqochmwWKk2TqvvIo25KbncSpPzX6vAL/qZLk39A3xv2u8la/i
         Zt4REh5JjVxWhTeNByDVVqZ76ylrsJVeXnjeCS4j4PIchyKUCmJ+IZqvQiaVki9tA5vs
         HulSow84e7BYuovTKejSUnOYW0HCDhYGrJaU11gKEX25pLeJWIVweKHTJSg5gYY7WCno
         EyAJsMM2Osl7b8ThXJn93hOjn+p0mCtzphUju/vHYE7MtINnLm9P4bAhMP0UeL2pk85b
         MbkLiE/HGRX2C5cJg6HrtjH8txlroZh/wFvMIMilqiHs/ZFy74Il+6YvwFW7nmSvNAS0
         SuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427250; x=1786032050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=ihS6Tq4ZIMi7kcDvTOzt1OhLSJWYtDUdMTLWSJkJpvgmGKuasXpg/wtZ9h28L5Sijk
         BWrDJKmEKoRy12SCeu2VtjTGAh0x8kwavHJs20IzyWPqhiAesFgBh6FJar6lWZmSad7N
         5A7rKyhhsagHri3R2k0WVvqRKjyh0zHkIwVJWaLjKW36fm6nOIpK7PGA91jyZ9iQIzEv
         6W3HpEpwshW5TXwyT6En+8O/mXliOmRcYuTorA6/QurukilelS5KOzYCHpJxmrR0lFeY
         MiDs6kbPCVzLCkNbRZODWd8L4jxHR47wsn5f8dYQS3raTLQ2S6NApmDAPc/aQREmoaCe
         oUow==
X-Forwarded-Encrypted: i=1; AHgh+RoMd8GG7/dLGH6n59pq52qxvnaGTiwWxRDkYjjViX5cEjyxFOULjxs0zjnb+x2VrXgOQcIFBUc3I/I5mGGy@vger.kernel.org
X-Gm-Message-State: AOJu0YxEurjE2cdN5ql9uKSj3yisSizyc5BFas0vxSbCKLC4srLNrQeG
	YP9mO4eaGsMPoXkr8IIUQG5EX6iQQvBnS6bwckZc4KCDZ1THIlYTTh4ywhj66AUAP8tfli/EC9F
	8NgnOP8kuqHwzRd75wIcwKUkp2OG7KQ06eWSwntABjw85RvhU1Q5FM+NU4y8+mbu/CSHd
X-Gm-Gg: AR+sD11sQ2Y8Xcrdd8XhQGjSTihUc3Gr0WclY/pA1b6X/fUFaCkQVQ0svjoHawYAiTx
	i4a7HUeIRYPeleu48iUtkd6BTcI3X2xgTQYg4YycSl6Itk7VC3MNXcPnPm8UNM3pTBfUOM+k5qh
	ANR35r8/MCmkaoinrfj4JWFIeumAB/n4ntPwSrZcrZnrUr7mwervPK7ZsufgHNrzhz2AUJ4U5GW
	2+3YPLedmLYBBd74j6DCwfsZSWR4SjHja8qocJu+OX1BerhnVnydm/A14A/1eCQDjrwcZqmz6Qz
	9g9nI3exjc5DKv4CwfQEd5yxGRkJfMMexQGukSoNTmP9FTnRtLS6EQy7vnozI4BEaTLS8szzceg
	TPWswKBTwjuaweOWy8spPT2OlLnR2c2xGVXm4LAUB1aPvsu+IwwPILmbtcGb8R4ILmipzGjyObO
	zX7Hz/7qO3UYXLYYWAYTLA3yprVM189MrtOrNPOANPscjUjeIuNKJM
X-Received: by 2002:a05:622a:1e12:b0:517:736b:e0c2 with SMTP id d75a77b69052e-52b384c7d14mr37918201cf.27.1785427249361;
        Thu, 30 Jul 2026 09:00:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1e12:b0:517:736b:e0c2 with SMTP id d75a77b69052e-52b384c7d14mr37914671cf.27.1785427247300;
        Thu, 30 Jul 2026 09:00:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:33 +0200
Subject: [PATCH v9 03/10] dt-bindings: bluetooth: qcom: Add NVMEM BD
 address cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-3-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b7532 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: r3V5L4PW96hydJy-YPrj_EeG8xkgqWJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX1V58UzzK9Iea
 N0bewXyzcqENa4Es+QTJUM1rOJIcd+f6zqWq0LpnVPkN6BFbyjfeazvyNsrOTrZEHJX+UAqrc1Z
 Py+bgBekV9ywiIDyRPNyBQeZOZi8I6aKFcNT0/43EXFAFB8SG8Tas0DpVrlhEUWRmBsY47CEdq+
 4EvR+8x741e8ySKzUKlBsS0xzFOYd0EBR5UHBgAJp4jK4YD4lvu9/5vKAsoJILWz42nHwTdaSc+
 vmQuA65dDzGT//zgwy/vtopa/7JmYNKx1o6ehDBoFI689G2JsKX6zgeUQrXj8mQJ8NiZyAnNtRS
 EXPSGmzl4RwWumXdOgDwbBlw3JDDEapLXwZR7u8iAdT28bk38YkRVqfCQjUXwvHDHRRJsL39pvF
 rQijXSYimo1Z/X5fEyp4zRjso27a2mABdiOzRbRNGV3bDpzuTpMuP5ONUjMKKp+ABVF7EI/fBj3
 rq40vh96SJ2CG3hmacw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX8ye84VGQ2c4f
 wlAzhQV+k+JuC9rOTZiDGlB8LSH3miONKlbwojOwfqZLVyDIiRBj9M8m7PRdEwQZgPm7CvlXNP4
 ZBuD8QmqMw1LwycINFNTbjCsxqElZPU=
X-Proofpoint-ORIG-GUID: r3V5L4PW96hydJy-YPrj_EeG8xkgqWJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1

