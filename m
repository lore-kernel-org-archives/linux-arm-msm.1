Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183330;
	b=NwQm1q3CWrtsBd+23SIUgscuesrTbJyRtb9T6gVW+pyY8/fIQ6rYg83u5lKUhdvcLIV4
	 2qSzTUoFmWn7n1wCxVdrLuc1tp0foD6U0Tkg+2ZOfAyqYveOKxoA/3fttQrbgCXgZbEcL
	 dSCFJi0Ta64JhGtT6oaavuAcv11IDz7r4v+H7Ys8DqeofzRqWTYgjmOeuvSY2IKvPWnyC
	 qdZWcWZ0+WqbuO9HfBRlUZd5xt3f6n+u53Nx9fRMMfatQGaOiKF7y4GCZYT/re+nKSKfx
	 DGObJsb9IjVb04DuK6G6uPvoJU0/cC7annHTlMy2U/GWgZ/mEgCu+VqV4kz/4QrVchQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
	b=BbucwYZTfIYl/F92LpdzLq+Byybb9pIakOflwHbT+Yg03ZxBJ0sJ+QtVV3FOefpHJtG6
	 mN5IksPEkdqgH/2pf8YDQheW8IMcN2FRTbkH4X8DWYq13TXpPmEQJ+vZXwKygnb2vdR2V
	 o/0NF8Ag00rqNAJ/703KRNGh4S9L3m5dfI1UCDFSZUQZeErFbRMqfyIKF1tx8XezE6ECx
	 X2AKTCU1UA8mZCG/JLCNZMZRW7HkuFVyJOtnUvmuqvsd3+nfkMF+01bKEqrP69UUUy7MB
	 ShARZWNR538QBByE+omOEynAl6++vRgtQQaklmQxnLtG7L0+VIbWip3ZELX4YICHsCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bjrIIsE5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FwGI0Shx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5253606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5253606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bjrIIsE5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FwGI0Shx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ke3rS3076664
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 00:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=; b=bjrIIsE5UjStFi/9
	jKbRcGHt46Hbhao8TnWpV0EYDWG6HSasU5PNU/Y9lbkxe81roSDy6Ks+5U5Fvhhb
	e5U8c3dF+gEGi+4kzJYPMmbXX1upf1AsZ475bVN59oFMz5T+DjsAyxERqnRS2Dc+
	VgZ4aG0Y+Iqv8r4Po1DCKblEPYiOqNEnGRiL+7X1SR37FvPJYboHmKH7aCkCqauk
	VrrOqmNCAAqK8jV0+Y7VacOI45nswCQnMZKZw3tdqJDzVMfeCHy+tb7IHWbNx7/k
	UObeBZHlC+xZb/pd0R6/SvfAA8it2eCJNyRZKpPIlPPy1J+qwabp5vWB+qWa6ypz
	6b7heg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxc2en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:15:28 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so523487c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794183328; x=1794788128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
        b=FwGI0ShxRRkijK1Z36+klEQOsQzr/ymfICMUvSoet3RawoO0mBRpfrSQoOyMViNcjm
         EOlTU7rEj2miDfmUcW/VPhfmqMTNQSM7FtznoLiGRFHou87hmFCQknBo6sV2HNwuhI6Y
         KEEvwcl0UK+67N67LCbJXScZj1Jrne57V5yYHEqVqsCv69fQJDxTieMfX6KQgt6mfsM9
         U9lfu7s1UZjROm38/ioJjF/grwkSX4pVouo9ETSnVfkmk3+29zQ9WtdB+ZAVJiW3IyDq
         vTOT8L3+BEwxgVOBYeniUchZqlFZZDzitCBQmsfWSEit6k7bg+fOJHjw5xDSm1CgMZmt
         pi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183328; x=1794788128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atcqyVfN1zAKYh6SH9e+X1cocOF3Ki1ITDoA9b75HF8=;
        b=wXI7abO0nQgW8y1Y8v/XUFizXA+/7e4Gip4JvCGi+ixado4oIWlPEX8ZZBZsQLpOcC
         n1ngxM3WYQkm1bzbeJB6Ai7So0kDk0A8El6wDGZZ+JJo9zkPT7+r04gYJ+UKRSkcQQjR
         rXOC4T3eQ40U7VAFdYhCQ7Q6cGBT1PgbTebhU9jphlPUlNwcJs222pe/m3VSOwr+Bt4j
         2/YBDxKK+pjOKihTERqZY+6HVNDGfvv/Sf0HzlNIdP4eCY6r0c4cWCmWw4LupI9Zgwy5
         wzG0XnqqLbRUY9qtja/2kfvUNMri9pbS04sXhvgMv3W3rfgO58CwB5vSubMpK1QH/8H3
         j/jg==
X-Gm-Message-State: APuU4Z/kqraMm8iO7+jjJV5wPs4WvGZPDkPGCdIo+Imfkx41sWa/zip/
	JAAJgJGE0CnamRNZ7g4doB07kLj16B+ENk4tol3gLCbugr5WnMGoculoGSh035kWu5bWox0WHkA
	79dns3FVthQW5K0iVpd9OLp7beCwUovOOfFrHTKZiTrtMiroTZjXpdWUcysBDT7zRpazlIUQwG7
	BL
X-Gm-Gg: AYBFou3QAyIKMnsFswG1jvbw0KNLURTApN/my70BZimwl6SAbqqeAB7X7v7T/aWfiAE
	xj7XVMjyekmY6oSKsGxsAQMnFOmrjTIVLr8glOtkuqVt1IhsVctnDhLR5HcD6Guoe72Aov/4KlU
	OFBmqkbWbe42HqmPSvMp5XAsQt36Mb5yLCN6Bf2679vIDc2rhk6BQsfC/EstNZm+NeQOc2NXM8S
	AkJVOp3sBxj3buqMWY/1OZCHP8mV+Nry+/q8yrhuNyz9mfQQXFK0Ra6Zk7jQTC5c32uL/Gg2WWe
	55UZ8mK/3oOvxXuKzssKNG8Sh+xwaKb0awoHOUUa6fh5AFxvXMjRJVlGFYBbOGpEJsunKTDKrVL
	/iF3EF9MtdjZO7czXvnsi3WUiKa+qicMaPPkoHLInhv50As/8E6X7/qkT4PCH1LCcPQ==
X-Received: by 2002:a05:701b:21ce:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b39fec1d99mr4134344c88.12.1794183327601;
        Sun, 08 Nov 2026 16:15:27 -0800 (PST)
X-Received: by 2002:a05:701b:21ce:b0:1b2:42e3:e5f0 with SMTP id a92af1059eb24-1b39fec1d99mr4134290c88.12.1794183326715;
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9105109c88.18.2026.11.08.16.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:15:26 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 16:15:24 -0800
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
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
Message-Id: <20261108-hp-omnibook-v2-v3-1-f489fd0bdf33@oss.qualcomm.com>
References: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
In-Reply-To: <20261108-hp-omnibook-v2-v3-0-f489fd0bdf33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: yYARw-2CNAaTyk67eusNozN1lxX6YqgF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfX2hL1ZicvkXif
 9MVUG7MoHwZxcYbRPeJpqlGNVzP/3vYToVADFeLIhrmDpJV2MwjNCGDSj+KtDAGPkyKGKTu5g/J
 Oz7LklAU1ZaO9ufwCRzeJPHIX7Cq+flFivqJo0nJi619mfB5L9o6rpoeihRDd86H6x40VXe2fzY
 MkoTwmPQXotMLbp067e7m1xXBSD4Dh1TFRiIOoTzGJFkyA38YSK73BEvSz+zeK8vM9CwcS2gLOh
 i9ikV3RQMdbu4Am1qzEiAFSonadl31asYcd0fDaRJOCdefclsKVQeM9LZEG4Mx7XWdTH6gmwhPR
 W/ZXqYWhHV9XSLTbMfq1W89PCasIeOsP8Pd+MWOcwVR61HteUJcQAoSnGNHp/kwQ5nzICR7Kj2h
 uFdgcNnljkXVFIiBe0/gg871+AhxvIvKgCmsWdV9ZDJSxsAZolGB+idshjeovi9YWVwQNeuVWnt
 /2iAjRMuc+xLK95frBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMCBTYWx0ZWRfXztGDUu2Ntvmh
 7SzudpDv4wnhI9LBRY+Lw5wJGusFbRY5FvsKEaazL6XOd+j24VJoUKjBjCuhbA8RQuqbn3ygEvX
 QgmwaCVZr/0unaqyMTtr9R2eR8B7C7U=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af110a0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ryRoqLvdJD4GBdKZh0kA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: yYARw-2CNAaTyk67eusNozN1lxX6YqgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090000

Document compatible for the HP OmniBook Ultra Laptop 14-kg0xxx, a
Snapdragon X2 Elite (Glymur) laptop.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..ff30fb4a91cb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -89,6 +89,7 @@ properties:
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
+              - hp,omnibook-ultra-kg0xxx
               - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
               - qcom,glymur-qcb

-- 
2.47.3

