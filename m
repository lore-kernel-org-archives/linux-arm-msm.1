Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428391;
	b=byiZqT3ZYdX9gPdlaY1sfDKOhWV/BLIZVI/0FRtRzL1ewtM7y0yzRP9WXqAQlqXjTeae
	 R4eUTB/ed9kzZH9w8fEvCuONzmf0xPO+xcMZjzx4Yb3I6cMNskeYj0ETiLRaBKDMuDtBi
	 7n4CAQ3+ns7PW/SDvpQiygncKboPyquOHhsRPfwIone/XrJhvoqhA9EzeuDbT+DIfJK56
	 l0Vyrhr53JYD70xzDzTQf0JuJww6pxw9ZegOoFi9SgSDN4ZtAAwUdz/EwiJfhoRR2DuHH
	 7moU1r7wr+1H1nK+kch96JbIh2Dh1fj4szIhsh4DJuL3Ln8M5NE7Bp6r9zElEXDi7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
	b=tg9qXN+1gg5gnxAChGEIA4ClMrEVVdZxKJ4HKwQNjIt/GmM7chO6A6hoQdAYxYnvM/kx
	 Mh4m218iJ4U2DEoWAkN6KS1eMpo2jDPEWMT2liDaBJqB8rGhktep1GOqH+jd/bDZG2aIj
	 qU0A17vQ+rPg1YC+5rIEDt5gKHZ1LGE7NgOM9IzlNUbZILDeneO8pX933HKx7gEg1ii1L
	 uAtCjxuurKQyDHzdg4MXckPWxlNt3RTrCl1OvDTmdE8YVSVN2m8H8uvAwj6uERRKCIBh7
	 SZSZ2m0bcWmNGKqPZ9faPGNWKyM4NJBrZXr1sfLiE6M6A7sSfkbrEEQ95ZOHj0yMMgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHblxKLu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBaDPJ5x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AD6606A333
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02AD6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHblxKLu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBaDPJ5x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPQ8u1645997
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=; b=OHblxKLuoJZiKego
	b6u5LdtXg2slRe2xQKarFPnSxTXwXz9egl0tAR3lI+Gx3B445FqzUg7RvGZAGNOA
	pD0ScUHX+HVhIl9/qD9WHfK/z2UDfSqAn0I7R099U8At9TCdpLixL/KmHhfTqq7e
	LL3N4/90aA9WnIwiJe+PThZky/M+DQ2X8X1ImD2RrIVdqmjse6JvBmoDdDBNQmqE
	olCEe0aQ1x9hscjd3TItsdGS3uJUjHvrlW5KKJL6v6PcSnABceKCaQ+P1FDnubHq
	pfvVwYIRYNBmGdsdqcdvgCfb/yDM2rqdyYbvoTBi2TG6/0srXaloooRJhSzopW01
	8w3hLw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65j8h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:46:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso3680341c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428388; x=1793033188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
        b=YBaDPJ5xEcOF7RgVbc38tuWNxg/Vh3KPOhi53sx9TNX/43hD/bQpVQLYgK82rIy6dN
         kpe/4Wg/1XbL2kxaX6DBM69Bz7QgKI2z/4EheSjRTp/omkINDhMlzXoIi/FREGFjRSgL
         JMy9vbc9ktn3TcB2ouIOFcEHBRKQL5985kbboMHlDviH2q53OWTYObtbAeRUZh0lcewD
         aAm9z+mF2CeDfyPBmrbFY3Zjdg8AJUS22e6WS0M88Y4AHD6mk3WcqhbMDqw2gVM4xOsa
         fNYe0yAgJ/bRRl+7FoES//HFygIgrnshvVJtlcTMS7XOyHF7dbSUnZCgKfi1Im33u9v1
         8GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428388; x=1793033188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
        b=ftHn36wio0doxyy2Jnqw88MtysO3svG6H/lwP07fTfDWifRGVE8w2l/e3Wt/j+3G5Y
         kzPu6p0+woLBwBYor+OJcMJc6hORyehRcB3UXB2EzELrBdqOMWAB78CrIfmYlyz/zFk4
         FTbdHDTZ6AF/by66pUN+EXVfTw+K3PpjIEhErF5amVNkQgh8etzbhqTi1z3waEGo2mLL
         A2AOGFG1WbTfo1T3YPFZQpv4zOoYI0nr0FARFeToQzVLUOwdNEqtyrfy0k+E2ldvrGHI
         8diqSv0zYoov14ZiQpgV07xpi8Cu6qlwTGsw0UgcJMeyy+JJBKvZfmsLOHK4+EQLymyN
         MTXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe1Kn2f6+wlLGSEGT6cvzNMGBMSr2FHzqVU4kDEqxt5JNCf2VOh8VuK8UJOhjzTFEuP3LB8xsI5ofvP2Cg@vger.kernel.org
X-Gm-Message-State: AFq9FYLC2+lezF83CDyui2LwE20p/QXVEN/sxCi4nKsaDJSjhIlfh17j
	TavBLgTXc6PrpkNMvu3VkNHjduJskCzszvLXr+V2VzJdoOw7Vi3d7tY66u/o20ta7G4fWylKWps
	3F4o0napR1OBkd4Gk7mpABYrys8Zk4lDvNytfYxbdU9TbpjqPpgTJ6ug9Xgdo3ETM3RJA
X-Gm-Gg: AYBFou0SHEQpwGu8JfvqU0C/0bCCThzv6hwqNJfp0QNhaocci+w9k5M8lXyDE+GxFu0
	YgoDhCpFGkLUE6b5/Heg9T33UmwHJVEmJiExNF94EpNGn6DbvwetVSpYI5vhsgxTmyv+TSbfmKC
	vgpdlwBDswo3wNcrGluq5bcUVRYAt95IlWmM/fzmdTNxdKxo6Zml1QMJf1KKHAqQkg0N+GWWDPx
	xuyX/27U3Yz0OlcjifX7Hf4Wq4PXCbYATE+diarAuQ24CRR6fk6uCEXmA0kUa19SzRbuR+vQuYb
	4mHnNMDvqzl8NScUjinKiDX0M1ItpvaO0vcPJxFnmyBHPz3WX9btClY45dCfnENK9/PiGsoURiN
	3m/G/RMlsPynZYjdSpfgOv1T/qvlFy/hcmTTqmPjsrH0dq3c50vM3gyxBg2QgqCcKchoM4KkxYM
	9E6QPcmWOlLNf8r6fBqqZov7MfdcYMt7ftGCU=
X-Received: by 2002:a05:701b:290b:b0:158:7ea9:4a5c with SMTP id a92af1059eb24-185143509a6mr11591218c88.27.1792428388425;
        Mon, 19 Oct 2026 09:46:28 -0700 (PDT)
X-Received: by 2002:a05:701b:290b:b0:158:7ea9:4a5c with SMTP id a92af1059eb24-185143509a6mr11591181c88.27.1792428387663;
        Mon, 19 Oct 2026 09:46:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:16 +0530
Subject: [PATCH v3 1/3] dt-bindings: sram: Document IMEM found in
 Qualcomm's IPQ9574 and IPQ5332
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
Message-Id: <20261019-imem_restart_reason-v3-1-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfXxSJPnh8xV4/q
 wvNbakMFthcdosuYWtaUatUmc5eKp8O98/XhRZWxtdPBOsnIPMATAyHJFlmwPGrNOceFZ0//nMw
 w1ECFE3kG0n0H7U0ZVDrNnjh9Tc51Ow=
X-Proofpoint-ORIG-GUID: acaWdkIbXdeK0eCH9ReCWGJst3QkMP87
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad64965 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zedVYrxwO3aBKnPp0vMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfXxcuBFARNgf0/
 rlB7sN/ZXavdQqttj4k5pwTFPNxlxNzi+gmw1xXopxc8ephQO2EeojAEXBuaP0+j/SjK+fM0EKi
 iytt3uxtGnM690LQkePk9R/RSh95/gA4FLQ6MlIwNHnSULbNALWeI6ZOCe4QUR8Zvr0EWSGHb99
 UG3fnBa3tDgFlsAmLHQBzp3MmKowGOIYSh3fLzrnWLHMw8jik3ti9nrw0Uw0PGj/6Iwg8i/UlTV
 K1k5M74Xs6Q3gqadDw53iXMUZrKNybTPoXVB0LazjMS5zxBHzzqSEYCvqVo7VFNB2KR2F9X3Dpn
 20sen7PSLQ3OD3b2A7Hf06D4863/LhNRrCJpamsIzjIO7uccP4CCwA8TWgsc3FRtMiXSuJfY/Dm
 MXK35ZdqOtfKb7Q+cJ+5sZxK/7xDs7ObdnMXtPUZQpM0WgwQcZ6jg2Bl6Hk80JPfhYVv+X3VnZY
 71pu9PJZl/tsCwr4yxQ==
X-Proofpoint-GUID: acaWdkIbXdeK0eCH9ReCWGJst3QkMP87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190066

Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
and IPQ5332 SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 6ee0b1464722..b09a70b3d576 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,7 +37,9 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq5332-imem
         - qcom,ipq5424-imem
+        - qcom,ipq9574-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem
         - qcom,milos-imem

-- 
2.34.1

