Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661788;
	b=LjkmUGuCrquA2Ou1eqYWjwyh8VOoI43VdEmgsgYSG+2oUYtLOCUt5515czu9VvViuVYo
	 ApV+htxpZRfx1dMsif8qkiG0M/XyR+PacxFTbfL4EkOWvdgDLgwV9m3J5zVOVdBH+IK2/
	 nRHmp34m22nE330YqWIEylt/NW/aAFcSmwjHJuEhXBGyT4IiLMvjlsFpi3t0EG10uwtuz
	 HxEdTWwcQ7pI3DAX6SEFw1E1WNFtGq2G6QgoQY98nrlXHntcefTNJYlvplUq/5PK3v02q
	 lXrrgO4XYGpmy2dKB7KHsNE3j2S2r/zo1f/jkwGu5OvW0QFx+kYInmEtJIrPuhsCNVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
	b=yLQk6ONw72pqjxSodAiidUgURj3kcOecz86mj13jHYWZDTBJhzrJq6D9UKJjxlcpfOKB
	 877NxTS8YUnThYlxDK5WGxj8Xg//mylC6xRO7NJmuY2A3o9pGtcZLl9ahFf6PuiqFcRaL
	 pHhGk+eDuGzc7MpqpbWnFJZxLhFr/g0Ur9z0kWNpuHakVb3npkx9dFoyY+VcCrsuoTG9S
	 wCsWNl6r5Il87daE7Thbfmmix66KuvB+ZOlSZljudBQ21tnqJXuuCN6emHzbun/ZTbBWc
	 2scWwqScduKsvqhNGT+m7pJef/H/bR7GWFYJWqe2RtP3I6OAw55R1NNw/CXD9zhQgHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KKAAeyCn;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B3606A33C
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629B3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KKAAeyCn
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso1661805e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661787; x=1793266587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
        b=KKAAeyCnPcWgRh0IZ8+4xHbrmYgnquXBo5L8vA33oB3DfLBplLtZvb4+tdyMEx6CZU
         MC/jafSv4nbwsU/OuW9nYrpFDTI47VT6mrrkFvIbheV71QwQURpQYb25Sxsqs8yHJlYx
         WhsmQB9VBdQU2vp8qeVtTnu23rAIkIXJTk+w77kW20e22S3vdXtyTanaYbonqaq9NeNb
         2vXMrPvuVdL/66liHN4KjBL6YpajHFMr7kMJuIgU2BlauIfi+VBZfYdZHxW6PUsD5Mk6
         jQZ4jRloIfzo63wr0gcJnLVPbnYkxRCrkn7cS0C4ZhFEB6DbC3yDw97lmF6rXJnzdOyG
         jaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661787; x=1793266587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
        b=psvcxwVtpmAeyzzJ0hEemjQGLTnOwekQp2Gr2VF16nmhNRzYFhpHtr75onUFmJi1tF
         oGz6OCQ9e2DJ1Wu5G3I1uBVu/KKOBCcgXQoQ+W/3RXk25j7CCQyy8vaetuGTldL/0PWc
         VNcre1Cmerd4NQ4hivloYP0Q5TUXnYlApuCwPF/evjy6t4e3kYQjRPno4ieyHwF0kdwk
         VsTJ/aIsntlbcgCOvVgvqDraatvnaQ3YxLU9QgH7c4ECs2AknBJF9A12Q9VzQr4xWtVM
         2WaF1kKKhJNa4VIeES10SG5IlA4BHkhm1NWlo72f/siMJa2cogwWziJMyEu/XWuuwgF9
         vSnw==
X-Gm-Message-State: AFq9FYKBGQffRS7yjxmdiHfTZOTFaJxobAWWzIZH5S+gvIw6EmgFOmeZ
	9ZLqKRDofAz4QHrPIfvwQyEA8jG/ZZ14fIKt8AGjl1bZpcu9OOilhPubq43YHL7w7mkt+E6oPvR
	Fs0Su
X-Gm-Gg: AYBFou02kGpvcaAzwdIhfSqRM37WjN5NY4+pmzt4ZvXxBS3jXGl3Ip4GvBPaM3l0BCg
	1hc8T18wxAu8E+jmN1jgyokcduh0JvUL0f+81tZZecQm3nzvCRiMfnXy9NmztFb7wa5XCw0Wjmt
	WiGu7muJD6KDha/aE5UENWqNXaboH1f3525ytBA7WF8b6XoB3i9B5naAv98hDDKCWc5mNGaZLxx
	Q7ZS1k2TTtvagDJPJMqklPriNH+Z4Vq89/DFWP9DQRizcV+0rwg4Cpq1dm5f7M0EN90uwlVR/X9
	5zMVJ4WtEcQYoJP4up0YDvpQMVfmcllCOWp94mWhX3Qo+XYP/0gyhbrzEr+bttzIA3oZCOOdrHe
	a5hhEE68eHRxaiwDmx9yOc8Bp7yiXjMYNjPGr0juIDX6zS7SHpcDHlcsEVfDvDjds85GzOQVGnP
	tuMh6rv8sE82+5iqXi1K1B/l3yWQFojAOVC2u19lDCNNAFHJq+DLZwQDqtzajpxiui/BY+8SCkp
	U1Cd17PbiYnANoSuN0Q/5HS9LDaVLJvvDpuYPbwahEk06qxtNX09e2zTNY49I3KSWhkvBnmpNx6
	BK30a2uprVcPBece
X-Received: by 2002:a05:600c:628d:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a1fdd170f5mr99283825e9.15.1792661786569;
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:22 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hreQtrvscUJJdl22qtTpfQsMNJBU8/Pv38wJioMLi+k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkWzY/AnMYELYGe57U6RsFJV4K33005WEHPXZEa
 I5JsDk+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFgAKCRB33NvayMhJ0UreD/
 9RHj2TqNvZhc8tCAqohC556Wv5dLj+qJ8xFQiqadrhwQ3TifglV4kZCYwvpamw37cMwVBBniQ6akpj
 Vj9kv7p9jHB3USMQ/a1UmqQdDenwyZwsJL/Z/bSy3zOU/anKx8cYCyx9JK8WtxIT3zIDuYwIqwqw86
 atvZZ5S5R57dWFiaYO24GFYkdP8MWCZW+NfwFK5hEl6I2ngvKnYYbThv6e2//0dH35NdK8xAPWFHsd
 CHx5X2+IG0MxhZJuRiPPWDGZ08c/9qMkmAAnn7vgzg+SOIsfwHgfoJQZax8o/p0ovfkD63oGjVMRg6
 zF4c3ILYvg0f3E+PP4IguyNpJ16cT2zIstY3ivPQafIl3eUHUY/SUgQoPCIlEpMuRfcZBP240+Gzta
 ZUAv4RmJqTpp3pi1MxyRjMpSNcAZl3vDPVxAAWg2b3ust4VuMUfaEGIUObHedASTcxlkWS63Xm4QtZ
 mK98IU4TkO9DKkM9FoenGrG7Jzh0J5Bdc5UPNfMhRsAiWjJ30jN7yB/QZGeVZLRHGM4hKJHUrIXLHU
 4EpQJ8iPRE140xE2KKne2x47ohznkYrqTZRGoeHMblkN+MX85iDeSo5Gw5oXbgmy0KPLpf5hq2hY2s
 RFKECkjfaHbJcW2R1jxJQ0xOi03LIxrmPfTYRmsiF5/kBKAH5X8iLuVdmVrA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 6c09816983a2..d28a51b6e7be 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -294,6 +294,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp-dai-link {
+			link-name = "DisplayPort Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.34.1

