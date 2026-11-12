Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486250;
	b=vlGfCAB73XV8WaFK+aAORLFHzolxRO3cst2uP+3phhdM8jJ589BrCEFDasV0GkjYRuKu
	 7hTs68Ebzyk+UoswdYsxTpRJ4+v800ToNqdQr5HM0wlozsWUfvoD8GQznwWM3xZNp8MkE
	 a9y8flbkW8EpTXKSo3nqsN1TPh1nlhcNMCZUSjIh3OBVntwGDjtHKE6pgZu6PS4LcrtrO
	 uxQd4cDe0qpE3cutq1wjADyp7uL9rwAPtCo81OvrcNhOaHaCexhcCseQ+HyRW7KhLtE1G
	 jau7SyUkzYBlX5nvazw0xmqM4zAyKRitgZPiKfBgHt/gGVzYJSoxwq9gIBc3TXi5+Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
	b=J8oAgITwFTA5dr83oCj8TT6HC4usM6d1/VQLx3yfwIY4L6PablRToAriCDkmVHiGjY76
	 1J+cRoei4ynbyluVD26ZwHPI31DOq21OmyPST7XHO/gcwsPVAyuj3hiDFPgpp2Ro+x9zn
	 XERMdwDeNt4jiFQx/auh/6qsIWT1TeNSNWnwT1FglBtio5cHPp5lOFLGdp6lBJbIZpkcV
	 X/ZURlVqaaj+oNB45/oqx3OZgsLPZiq71Bb2A/W6iiBVoIdg1NRmMKabNtYZz2svdnp5b
	 2zAQ4Oyh7s8Ie3oqrsEypsNlgg5nNbhSvJ06g5izGzPUP7ogW0a+bz65/pvEsanguCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L23mmaik;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500AE606A883
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500AE606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L23mmaik
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso9274088a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486249; x=1795091049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
        b=L23mmaikCY+Jsd315IBXg/zTyoa42t+VmyZ8aMGiwsxXeY380o8Ap88X5Mqxl02op/
         bHe2uj8e5n02XfWkRCEhI9hln7bZO4WxZFqr09arcjJBJPde0vc82w9kXA2I3yzvuwtY
         s4A058wfU8lQtbpSfH9Nx3tZxRmY1tfIheJNflspNjHhCURoxKdqXL+Pt6P2OOTurmFS
         NEYQdyw33s9Qa6EmKiWsYojXpcW1LYz9Ea7gDHvnKG2tFKQwG/KmkFHC8JaXTb4FRfwK
         oatWn9QLLbwjn3AJDpx6X7WxREYDlaC8TiMm3heez2+AvSjmtEIS8pYMOelizS+fAVOL
         l82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486249; x=1795091049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
        b=HxCom01w0kUqWWa71qSmQrRjixL1e9dsKAp80svkvdWj9ognDQ4pBwm5C4CBrglR2P
         4k7V9CrWnkxEyyoz+553rmhPNjOacMg6bIDra4Hm9XcTPJ/lPzVCqumQJpJ+oFShOqx5
         jCMxBzBVj9K05xGizIwt1Bo9yzD5bKlh1ZeFsAbuLKdYlzt+8z16+uxec8GKMez377JZ
         UU/2eVd2UvZBKkNV7IuoewumqhlhpAzYKRKNGPc9tZHUTB09aRCIICZ8y75fyNtPt3e7
         4J+4RsBUhX3FiiEnY5qTaLMCyYj4PZo1/uD4kUwOSBfWlOFGhJBHRQf/VsJAm4aW3A5q
         IN4Q==
X-Gm-Message-State: APuU4Z+DizYaejFxxerNm+3vcDuJ2gdvmQ9a3FW/jlQAwtsWeWCZXssj
	jmHfov4KgKq+KoqqHi+xSYuvDCg9JD1bbDVkMn2yhKCFtiOG2cCOc8EH2hzSabQy
X-Gm-Gg: AYBFou1Vbr6jvrDokOFdrjKrzvIz0flLhH9s7gbkij7Y1A8DY+uUvAgYb2BwS7LNWbr
	i7Yugft0/Xh6q5cnqAq7cj6U7HksG3o3cJt19lomUNU87LdZBbuVwGhbJNUcj0r1/PUM+MHcRFB
	bdY3ypEKUStXpn0vVcRr50v71ZJmxTTPamVe6M71j9taapPOXc8flHbki18LWkJGbNPwBC00NFY
	/TAdeH/2EAEBr8eUxGljZbchP6PzYjtKQP5VrsczV8rDr0Ly4VzY543vklK/c4IQQxMUelIrh4J
	9ysF5SFW0tfPJpq2BBGkGV1hTwJLVJJUcLGfzpN2HikWKap2H8iJLkO8+c4oPAYNqIC72MKgztN
	uCEWViniIWrfFwUErS+tHY9UgkrVGUxAoVUtDwV/tj1FMqpCtRG8wIk7OU6k9+guTzedmT/RC+d
	0yciIQv3WRkfno/ecAYaMxzKfxV7i7w1xJlOBp2wUaX2SUy3HgA0oUXrcw9JOIYs2JQUXpUwiNX
	9rTrScYxYdNWNev4L2LPHt0itHkj4n1nYsT6bMEkTSzjnMsX8V/9bS/2gcLQ5lFZZzbnudxiFdb
	L0Bg5vc/SCVbHVNG++dPJdlmSYMRrq2gy1V7w6kE
X-Received: by 2002:aa7:df0e:0:b0:6b6:fed8:e3bb with SMTP id 4fb4d7f45d1cf-6b7773edf13mr3161861a12.13.1794486248604;
        Thu, 12 Nov 2026 04:24:08 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:07 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 14:23:22 +0200
Subject: [PATCH 1/2] dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA
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
Message-Id: <20261112-sc7180-gpi-dma-v1-1-2a8eceb49563@gmail.com>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
In-Reply-To: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Document the device tree compatible for the SC7180 GPI DMA controller.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index dc7bdf7c4201..01766475d1b5 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -36,6 +36,7 @@ properties:
               - qcom,qdu1000-gpi-dma
               - qcom,sa8775p-gpi-dma
               - qcom,sar2130p-gpi-dma
+              - qcom,sc7180-gpi-dma
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma

-- 
2.56.1

