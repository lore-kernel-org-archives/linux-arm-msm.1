Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184447;
	b=MthBsbMpwIlSMqLQZfiMHmFMs9Vfr3hgFDX1qnobFoqwOPFnqgKRE5StOcBVWW771s10
	 yPcdBJfuvfz36An2abDW85F4Zd7LBpA0bCtotP4amL9OxXzZBhJbcZX0Yix1yK5smT7qE
	 RCn+LFd9nn1xf5zhzOwe3vE7uieQGCe+u1gp6dZsP8kF0lmviF+AUb6c34hKMZGGXwmdg
	 16A+E7MkfJGanh4ZqKZMiFz6srbE+q5UnOCTbyd8EbyO3X6gJV18qx5MPzQf4tPuVVoSv
	 x1tCwwU7mIA+6dqxYdtZ87Lz9js6+AQEwHF4zfS8bHYVUdBBQG0rhnsuEps0rmizVkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
	b=oRKqwAy0eX2yze8nvOk4IbybgRdfJvy3zwjDbLY3yUQlfFPrW2zMzHANlIf6RpOBOyok
	 A4nMzQkDNScmGGaCkx3bklR4mFj50fQ6mO1zMbMNjFb29+0S4v7hL7FtIQJmE6+tphkFA
	 lTKstup1flrHKp6dIp8SicVvyP0AsHCvaqSzokuI0pxevslS1VqklVPv63PiXBH1Fm1lQ
	 bSB3dc6opSGstzfQ7ztczk2mudqHql+zPOfVUZQWp+OJ1nx8PVF16PdGIgvWYOi6PNu4d
	 u0eyz24wGhXE0KSscJLEhue1S/QFvYTI1YxAgibZVIbrVHieu+ywOiIoPPRQ6g4quxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSlqzKjX;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA8606D814
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FBA8606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSlqzKjX
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so2506065e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184446; x=1794789246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=qSlqzKjX/7sPDCZRvmng2Fd7M44NFkTn1QnTKlon15ILFRt36QNjsrqLJYYai8FaJT
         xqdBUzCmut3CjikZFdWRXcM18asXALumcNCoDZ8wkDUy/vLNU2Yu18uXCs9ENs9OPJGu
         nTOZcCyszK4wAzAPo3RgIbwzygxedCHuazWjHdx+F6NUU18zcCBMt/igNH+VXF7b6oYH
         qlTinMkSbUjNgaZL5pqDSb6HsOSqrLuMpY53PyfJXRmWyJcmK2xZiyNp6qhlx0aMWWyk
         XD5wvPWvs0D8+P9xSygLy6qITW/i8jKmud5s6HzgGS2nR4vlHSyW1pd61/CmzpTA+ZFX
         bwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184446; x=1794789246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=fcpir6Iss5a+U3FqIGPzLjieZfQIbJS7hIQH7d538+AytA+S1f/cUfMD/oZNPqtpmr
         brzJL3ypgq3BO9t2i2LSxy6a6vkK/OKeXTmyZLQmsjAcJ0H1oe3zvLa0qlaDdgqVXz3i
         DDIKp9JwrVQpcLevun6KqUOqToNe1MatKa/7zemmSy2h+s2Wy7LAgz07BGDL2ku3ABoA
         rDZtOfcWoZk/Fmoj+80RB9hPFS2eAIAajjAmHfuCM+/tcEckTYJDymdMPhev8nsV+uik
         LDFyTqtuFis0oahP79HuZ8ouqaL6Pub7b0LDmsPPsG2WkVwyQe2ZSbX2fHkgSJzZkwjW
         y5Sw==
X-Gm-Message-State: APuU4Z9qmWvESlcZMvWFTm1Gw9h8CIgkV6+PqFxApo9ARDml0Fps3xnh
	bfUqQyXI7/oPmuyaKRYj1HpsJT/7FMtKVIsdcGl0PPgHEtu6IV1GuEqr
X-Gm-Gg: AYBFou2f7uWCtjbaHZUUE+zCAy/AgaLqXXwiQDjmztWm/k2EwNG4iiNZPGzSA4Pn1tj
	Ghii5lh1+ZF2m+2nMKzsdGKrmfU35JuLTY8Rfb1AERz68HYOPWTlXXtJtJy8l6Fg/AsM3JcaMe2
	1CaxBsvapDZxlgfr4SY5sV8EIKeyc6YyBTOOnTktwu8enkX8EnjifqtqHfWowjCoUNP1TjZdLWC
	/+UPfYzqjCsAVPNW4XumPg7eawS1zF6xVzrGNfp/CfpewYbPp0mxV+6rZkeRpPLLxTEGBimG6Zw
	7NHHNa3FLJjGkxaKm8qh9Lq0ukLBQqj1xFGEq8esOilRx3w9K0r+rClCpQVG37n0si2cSS6u7gg
	UOp5RM3XW5ddbdWNHQ2vpx2VfGqzW3J/fiW4Xy1CGGc6qunb3ub/dJ6v9GSpsIc4XGwJ9hD08VK
	SahXcJNueQupqZfloCYWCJpm59LgQJER0v4/rmUzwrgw0cNdnYsqaxhBYhJD8dR+AzWWb6TD7n2
	L8abKl6s7zkJovqfPjU0HyzC43hBmGm84OmzdHK1QzaUlSHnpSM831C5HQ9J4bkC2HsHXwXyuxK
	na/divi2zQO41cgXkAx2/UK3YVpbH4boxLOGOOTL
X-Received: by 2002:a05:600c:a010:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4b963ca3a7cmr51069905e9.35.1794184445733;
        Sun, 08 Nov 2026 16:34:05 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:04 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:20 +0000
Subject: [PATCH 08/17] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
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
Message-Id: <20261109-halliday-dts-v1-8-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=4DxRuDlo3Sv6o3VM377FCKNLzrNNMHf6FsM5TYa93t66FIlBhCp/mgcC4QeOncc3ZgmuRzx3Y
 hjxDAxOeJv2BA5u50QEvvg0b3XgcZ1hYXm30qFoJ+yx+NwOICn4vuuC
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

