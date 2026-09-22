Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA8D37F8C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 01:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042290; cv=none; b=DUGe4NS0gh7qJ2KJX1+MCifa1oBK7XripaUG+IiUy8L8/Ycyj9mw4HMD/8E9aOEX97pkPIQcXLKa+qh1STKXQoU3mbKORSJnuwBAnyqwcydShV+jSPEos7vbmsZb04Ut1oSzIqYtSEn30+HlpWnN7T8Xo402z8f8yVCv4s2zVT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042290; c=relaxed/simple;
	bh=+O1NeYSuri4S79GlmKPTW09BIsp/P7lIpkqORs85qDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOT9soQSkkShd22POs03o3Z/HFjqqWIkkhYJ+WJy0Ulxko+sY39qdjmxfbjacJ9SOPNMQFklVoqA/4UK8JlUnQy94OeCWPB4rObe0HBd58/zo49YJCPY2S2wiY6bAmxMJd9mW7+8FyeLD6aUaylybGsZ23lvQ7+wPOWCsOhFtBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce+OYzbY; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce+OYzbY"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-912431d946cso3912636d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 18:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042287; x=1790647087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZTTWNFFjmLpkOK1pyUx6O0RCLHVTdWNdkoY/2euWxw=;
        b=ce+OYzbYyLddfQ67mQI/jmxRrdB1SrKjhVzX/aoOZQj99r2oBpNkKgx4+VxIHUaC2M
         OZLBUSa5Zitunpk58JfrMLrTT209IhR6RMs+3GZRBpEzvlqPiw2mea8dRaniLMpbgqcW
         0bROrCvw7loTwTrx3vur228dO+71FnlYfI5RAaikGxcu6vM/glaCWWgtMyCBV3nkBPbF
         tQPY3nEa43lgjFd6opYSPQEiNZ+G1Gr5FpFih697u4+I2usIQp48wtqmnKROoVwcZh8A
         Qp/oERHsDPx9B01pmmwPRcYiEe2f1I769uQ1a4qN8ICnN6tVUDpX9UoeIrIPBycXpWlY
         JF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042287; x=1790647087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZTTWNFFjmLpkOK1pyUx6O0RCLHVTdWNdkoY/2euWxw=;
        b=1ejlcgeF5tgnAcrYU4SeJpzenEGLsCnLVQY2T3pBBRaWiVRADq2O5rBm5jgQAQ3BZt
         50ZdgeGFrNNx8fNojFZnv2OiasEZm7SOEbBFzC0+UrqPj23QJ0MrVG2Do9J3xfh1XbEa
         cAek87Ukd6MqOhGHAkdAFBHyq8Gy3qC/b5+Od0fmj/N0qvF/OXWjHRnWVS/WzYz1ZjnW
         Oxx13gKhYIf+HeQ9Hg3wZD3VR86T/Ty3y7im2VpQ5A7aJgmXQWnaGYNstC3OIQAd30PT
         vjAzC+5VxqhJ2HmxV/SO56mY5d7J6K3vsAzoq9dihjalKxEz9FlnERzn3haDUns2L9Al
         UKcQ==
X-Forwarded-Encrypted: i=1; AKwUvBww6DpK4fif8lZzAtBr66oHhka5BqVc8eJwB7ZzjcV/odmRl6xuPER6ihvlt7tSZaBg/9WqN7Mdz1NAjb3b@vger.kernel.org
X-Gm-Message-State: AFuF++ny8FuZqAT03rKskylEvhm3rjeNBsVHVlTHuW3V+5tgp6Kc2bdJ
	u1cbkPg157ZM4GmqJYBqcu8/82ii+nWpatbfR0BdYErvt63nZWsiUO0H
X-Gm-Gg: AYBFou1rPG4yghK8ryEHVpSOxydWPAKhB0L+rdC4wqCukHYnbNi7JBCLd0z5NY8ezUe
	ca/daouw6aE1veb4OXLnY5OBHguPY4/vZqYO14zua18Qx2W4AAUv5R7XNhFlCn89CA9e4ym1HBG
	Cex633gd4dvN0mFQT3cldpFZ0M+YBJlfvdsHZwc+TAtJFdWTubDg5xO1ei/ebAUjzbHMRxLcQnh
	DwpnWv8naklBqKSKvu/v5Riw7kgfYvnp3aAhgRrvWsiLggYSZARf0AG3ZO98GQ92QIcMxx4VO1+
	dY+8kGAQgJYDeoo4AeP8bZtQ+jr8op00QzGcOKmZz7Ccc72qQuSy64wNrcFIURrHoO/qdglhNaz
	dKxWukfMbt/IARJcL8UcnGcJyCtu0sUNoSMonYLe6KVnpWj1IOQ5H5Po5kzTLHor/nOG2l96WgH
	/WZDeERNlTL9BI9DSVE9+hC8o+sh1fm40IR5DbdpJn9JDURA6yTlXF3m3OqGLOWm9q3Gz0fAm6h
	w==
X-Received: by 2002:a05:6214:458a:b0:90e:9d5f:d3b with SMTP id 6a1803df08f44-913ff0769d3mr23040636d6.16.1790042287445;
        Mon, 21 Sep 2026 18:58:07 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91402bc5498sm3402396d6.6.2026.09.21.18.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:06 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 02/11] dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
Date: Mon, 21 Sep 2026 21:57:52 -0400
Message-ID: <20260922015801.32373-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the APCS in the SDM670 SoC.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 39bc374300c3..74f24e07abc3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
+              - qcom,sdm670-apss-shared
               - qcom,shikra-apss-shared
               - qcom,sm7150-apss-shared
               - qcom,sm8150-apss-shared
-- 
2.55.0

