Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342638;
	b=nXWpR0iTVjSWyB3Hiu/Mr2A0zIbKik/2FcPs9YeMkck6WK51EH5VeyM7bZLvt9Z7CVId
	 WG3SHmSg76fHCKA21prbn5zJk06pVwOFsygOfEYrwNRJwXFZPNsLSyoEuyTjD7zYLzHgT
	 TJWgRg3EOn6qpmiP6QNOB8QOoyPiTJQxlhPLCtbjex09g/8aieXwplr2AmkjtqC/Xr7hj
	 lfCitR2uTUgecVDB9G9yt9QHWbO5Ogz2S44tJ2RjQXtl2FMiBJilDYfpe0LAXhrnN34QS
	 RoVCK6TD4zV2h9272VJHVYPK5G2NErofXsMfbUrDmiifXKapKnTTf4Jf0wMOtHOjtKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
	b=LA3z84XE0u/h06dmWb7IwJPa33aj5Sdn7t6T3VDjAxrnC3EwE+YS2o7ZTnJK0J3uEuEL
	 Uq6Qy1+6KPzvuztIJNcnhA0fy/vpk6j4lnx0fTEwW4LC5hHcPU9ZyhqoxsyzHWoomHxVX
	 pgakQ9U2y9oiPGrOr9gZKgVFz7rNBbz4hyLH6migtvtKTqTILSnenft6rAUOGnBz0e37J
	 0aSiw+gM3XwPMnz5XPdBsYlTt95dONGjsXPVUU951ZXsQA8HnU5vMbU/QRkqZtroXETU/
	 hCqdJT0WvIxxUvveO7OaT4DzC90Ljew9CphvrsRfbdUAewIztaUDu/oZSZyM41RIPNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeeryRjE;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEAF606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeeryRjE
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-353804b591eso639188eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 23:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793342637; x=1793947437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
        b=JeeryRjE/f5SWAdspU+P2cXzq6VlrJ9uZbNsl2Z3bMp9eugk4YUx3A6vk2Ih7llCbZ
         xnOSmidWOPWclMfpnOU/zstPnq2onY9z/0sqQxrwW6C42jgnlocQbLsI6o65snWFWdcc
         K7WkOdn+fQehSCJ0gfAcOTjVEU8fW4vLw/0gOzbJWqWeRHsRgdYsLIbUSq9VWDaC2bs+
         Cvq8Dmkky5Gmdiajsk6xf+cFiPTrIIE28wLdGxyGf8U1pWk49R4w1sbUVPTim72G9IvB
         BE91pPFk3TV1QPjLIwkmcSzR6L9/mYYfTOx7RBhFNdG+J5Lk0I/ht3yV7QtfZebwvFd+
         zg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342637; x=1793947437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3XSfexUEQIihbbvfLU/6+xIU/w28QhcpSoaKqiT8+M=;
        b=D9/ap4Ya0OVvuJSFhI6fr65WOeoK42ptQWBuFoDfJazJExXUiHGGkQJrtFi0MZ0aPZ
         /rvT0tnWbBYNNH4Oy6RtA2yPRdEPXwqazGfoY0FSbio1cIIp4nBoogKwt1c5hq1FiCNZ
         QGaEoHBXEYor/Few1j3I/emFo+XJgUlcOlcxW6E+zExTUdnYZeBmpCfaY+/+SYEqYqM0
         UGBOCCUpFG2z6KPfK4SEZHF8d03lrf5p9GHtfZba0YtpTfcm8gFDgWyx+MnM7jx8q/Ji
         9ADhuaJV7ExcjKabb7M2NN4pTQZcHCM5zUNG+ECpqYzTaGGA3+IPqkqKyICjbdH2DVmi
         1KOA==
X-Gm-Message-State: AFq9FYLZ6+ly8kHGtjDGQgA+elwnafmiamc3lKE6Kp7JmQBII85ECC/p
	NGglQVEnullfpIQIJPXQ29asue6pjtx0ByztSBv+k2s+tFc/q9ua5iqH
X-Gm-Gg: AYBFou2Zv3RgECp2NRC6IezUUGr4dHZDQ33to6pN2gv3tQgmpgoSWYqjwl7Y8yAB1b0
	zbZgomqCyqsUat5Vj7Se37jEZZ7WraipV3rEJUV8n2UQ7cg2bEPhJkK98US7vgwsJ+H/vp7k5Hz
	ENImkMdE9ZjLjVWOvyv/7hQThmOwCvVJorsu9Ex5zA7oegDTmVv9qfRpj4o1QeDdNGqxE6Knm9Y
	8JXt/rZ3OdlTEgISaO/LxHpTp2PmnRgtHLhQkxyK8tx9JWsvbk0ULlpBPJV5Rv215PJvc1740Ho
	Q6jFelNsUa7uZEqmN0zIpmNofBT8dPP6mcziA74DBolm41aDhYsU0jXqVcHG4rRb6R2Vj/iyoVF
	LL3RP3VAAYPLGuRIPmhiQ4UCU0klY/vC80WTygX0dzndLupSvornYgCmLWQ/vCAAeiZjb3ICNgq
	/ozfDUY10+6WOhl/uXK41YqP6I5UDB1CHG+9ReOWNYUUt2LiBNOchjQhbOY82mgueRMAxU7512n
	HgRLWbVXk0otxNw2ftxk3dWzuiwqlzWcQcEX7rUSa5Nu+71HuBdETfdR3s/dt6+EVX5KW1N9xti
	XSxoZ/x6+KtEBAAkFvN/PNHZVAAUyv+4pceV
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr2052934c88.46.1793342637307;
        Thu, 29 Oct 2026 23:43:57 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm4173902c88.23.2026.10.29.23.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:43:55 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	abelvesa@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
Date: Fri, 30 Oct 2026 14:41:47 +0800
Message-ID: <20261030064149.14736-2-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030064149.14736-1-kaipeng94@gmail.com>
References: <20261030064149.14736-1-kaipeng94@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Acer Swift Go Pro AI (SFA14-11), a laptop based on the Snapdragon X
Elite (X1E78100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..027207758cab 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1240,6 +1240,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-go-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.53.0

