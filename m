Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184486;
	b=IYkTwkcdn+biyViaIrkeiie9AbRuv1sQKZOc/eqKdX8lYJz02lLSQUnoggIRMpTzrYpG
	 ypcuscN9IoVoflc061C+qRxFbs+QpwA6K9ksL9Al7/Xkam68Y6bLQ+NXHwuS0MnIaAIsO
	 QnJ/jTpuTq52szc3yfYvYrJV7gIrpC8QyhnvDgzmfA2lj4izZ58F/94favQduoFSxGQ4N
	 Mi5abbQ6onn32rMSeGr7R+mnrn6Ss+60c5OesEYDdU9vZ/uNDQ7aDgRuRK/40FAtaImp2
	 WPqfPvmzmKauhJ3/DkksMXf3SrSmUGarGHEXJQ7vy7BkU7oxEmhZY9Upcw8tD85wAoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
	b=5siYz7QJ/KaSp9HFYCWWK5h/T48A6nTQfZ7sq8VkwlpC8rUFLzq9i/N1YQSxGLu97FYE
	 0coQOtmnSvHRdTdjFGpGIIDP1Nn4m4WONmyAFOkxZsC3iaCTJps3hh53TYPM2TMzYp4UQ
	 dXvHwhdaZi519zIYfpmuUGNB1zHXztjUTyufSgSmCFLrwbC9ES4zqDQdFJ0vvSLIPiE0r
	 7ekmeYf6YtvB++2iyDg5dvaNsDoZPRbifSSuSzmqmhyQxKDeKy7KOp0c053ICokS3ZHnF
	 lgxyGUJ+2hEfF/P1/U9dALPGnsTCu29C/JaWIxZhcYNflWB+BwQ3HfwiZO37d5sYf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ar0o+lOa;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590E606EE83
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6590E606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ar0o+lOa
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491aaed7565so189475f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184485; x=1794789285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=Ar0o+lOaLQ36hMaSQhz240QICDkzMHtmQDPTHSSCzgvKoRRu6+3NEyf5r8UGihmdVO
         YbL8kGYlIwYFzt0m+P3LcvsNsXWFp1DnoXb2XeAAeHKjD0e3mSdbFDeNhE2C064eHQKn
         FBw+L6yYJJRGThN5FTZYemlT04n3GfqgGq87rIHUjOJoGNcaF4/DfTtKARyZDeZ/xjrR
         b2ektKO2o/QtZcCAYpaDtUDybpL+f8B/n0nKzY3lo3ZuY+C94fC/nTZn1362e+1nZpVD
         khlpFRfxsUKvqLFNzImO1bvZjdT7ysUCEMcuRxy31zGl1OqROACCKC3fKd/G1KVQ4t4X
         QYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184485; x=1794789285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVY15LYwgm0Qc/TTM/+0NaikfZtjUT6nkNDgccuwjcg=;
        b=Tav5bD4DCI1Tgp/D9PpcVaRhhAAvDLq9xN1hMw5xUgK+FcKgGlcuiIJ+ccGF2hUeaX
         gQZJTm5oeVMnzzGnz74kOwBfznWY5wLnG7qEhBvZD+/iq9169NG99i+sHrMgpz2r6UHE
         itAyEpmOQJQJk/dQQwqoBVYzeteC6ST0jtT1Hv9HuvWPaxIbqxIuuSk4ry61TJU25kch
         BvAbiDrdG3dXaJRXRaesqHE/VKHF1zDGIWLVaG6hraN+vpYtF8ZxW0Do+J54yu8WzSnB
         u3wxD77C1IEybLBzH6WqOjAxO8jpemdr1GoLv0nNa1E2RUBj5hpPfuVnED3gKZOuJmdE
         WO4g==
X-Gm-Message-State: APuU4Z+rjtGPuGnefZ+7vOHNTeyKmHuaY4qLiGzd3Q6xVReOFab9mlTI
	Ww+3WqjAgbUwBKgiIyddkBdcSEppMHOFjUCs6ODgEh8kYkFjVsQ8UiBY
X-Gm-Gg: AYBFou1Tc46zrGM6kvKo15S8ex3R/Bjaiod3wdEoj/SVFSKnEWOKXp1dUsYc1ErMFAp
	IJMSNpfC8dQ3pf0XyY/N2E3sLHxRnc/aJuKMIQNMFs6fMAHBEK+lwsj9UyYRmtdFIQZiDgIYkAu
	QX3AxAC5+pzr8yMQqRbl3p/67xOL4vLksibwYctGhfEPdF11KUUipOD2w8XHQuu+SbhUFttzG+H
	feXjdYHJ4kimaVrf2R4JXf0OjIynzO9SmuP1Mmw53qrSm2+ToHjWxFh/eRVxqXqDDQ1RnZcY7Zd
	iT8kqXFZ+Cq99+puKKo4SyeZndEV2kbvtVWRmu8QPgsrSQM7J4IHeR7VkaJ4cJRxCqpsIRBUWUf
	8P1QKnSgmEBXbVF61KbAwPhChIqObO1p6MFaLGsxPeNrdcCW+k1VEIpGgtdHDUEJZjOth4NXVQP
	yRWzCStgc2GObNTB/b23RnDDe+uJA7aDis3mRa0vmpB+/ukEheexm7DiwV1K1QZqNYv0qKZpQMR
	33eX/tQByZ9oEpwnVrwU/T7DnPBBn9vuVZYkvMQLA5L2EXpA9DfpS8cnIMbbaZnJ0h2sKHXkaeZ
	G76wV8zRPNE+qSM544WBc6Hc/2+bkugkZXBFQb12
X-Received: by 2002:a05:6000:481a:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-49584690551mr4596063f8f.49.1794184484831;
        Sun, 08 Nov 2026 16:34:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:43 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:26 +0000
Subject: [PATCH 14/17] dt-bindings: interconnect: OSM L3: Add Halliday EPSS
 L3 compatible
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
Message-Id: <20261109-halliday-dts-v1-14-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=844;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gWRtexQl3K6zrJ8s8OX25X6Fe6c5gXvBp3k5tSGU4UU=;
 b=pnbK9TbDaJw63lMsp+XBx3cpAT1m6LlRO8M5pm7At3undTaYtmQjFmjLHcmBIU0XLq40cIoX8
 jdWhe4OxgWuCqPNlp+TJGp7ld3LSdzNJFNkDbr6brDzv5M8VXRxZg8B
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd6685683bab..6c3475005a35 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,halliday-epss-l3
               - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3

-- 
2.55.0

