Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398010;
	b=r111uNKeQSmSy4+vZUi9gHc9ssBrIpmPbtDWqFDu02ICWC9cM4PrcvEu+Thvx4eghYog
	 Zf4AHyPbWka/aio3YNJTNU0Idp/thp/v+B5vyBTHyNJ6e3NU+x2H4T+6mdP9QF8Gzptii
	 Z1fk2UE8HyBNzQRGZwzFpqMGyd1KUo89OHMccZlgW12G6VctffoX0kfnXfntvxP2HM7nT
	 a1uEt+dpU9zm8qfuAXa5bOBJjX7Xt70xSnluxqTh5Bgn2EjnRHup39X0nGbs8xMfBnmz+
	 U1XcY0OryGtrmZjpXDr8tFEJCPhKIaqf6/atng0Xanc15EeAcqErgCL5EOWUDV/izuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=XRc9bcTfS9KrVi6PNu0N+sSRb3VPAO+LRpeWc2d0F68=;
	b=k5wMFCnsCDZxhA3rWHGjE4cH+QQLpGO/bVWYwG6WFdMd3I12dHnBPRlBop1aFiwrKPiY
	 AFOL8aZHPPlqskBXp9uSTg1fdVWtsyugPAEJczrtKxT4t2yiaOSLZhgS0rspOlBoTUYqs
	 lbX4Bo1HTb8jGddpP1pQ7WEQruy/hEqfU90RPlzm1RlUt5N5uqUmDRV30dNZAPrfkeFt2
	 Dnwpor3w8qzISXZVGIaP/jrsAOYUdGlIg5uxdKks0NhTrtjzia+ot/1/3NEzoMuZAjnEp
	 1BdozaAxJL5ZfemQFM6weXg1yECk9VV7UZSxeJpTqSCxQuV+0c/QDpJHMhB6GU4ItUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Bxf5/A0D";
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5221F606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 11:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5221F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bxf5/A0D
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49febef74e3so20315955e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398009; x=1795002809; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRc9bcTfS9KrVi6PNu0N+sSRb3VPAO+LRpeWc2d0F68=;
        b=Bxf5/A0D08hb7XkkiTCrBzFmgaBdkMfJS4YBuDvyPhHcppNBjW5Ap1c1J2UP4lFyIM
         cVNldeBQVlbj+s3IoM5O8RtfPiHa9fYKbdKpuI0q6RcyBRjqElf1KBQ89uMuP0iEj02t
         ShqdCfC7V7RdrnccFnd5vJ966aQ+bI+1bl3dtoxKiR229xMCcKkEex+yTcOsre71vXae
         u3BL6j/po+G9EiRB3kNfQH+SZqltIApLNTcwhikkn7knyI4wNEquimguTIfFJuYecU1M
         ltuXA826KR169voFnmzgh+DzMxc7C1fGjiVE1pBhdb1Zgpi6e+3VOULz2h5smpkHr68X
         +36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398009; x=1795002809;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRc9bcTfS9KrVi6PNu0N+sSRb3VPAO+LRpeWc2d0F68=;
        b=FRL7nqPmqMNk8DkD6ToMLLV7adg8XkMb/8nenQEUuOBVb1GGZ3iYoikYHTif+Htz28
         CX1LjA3J7Kw3FXqm2zhp9Jay83abF5w2jZh4Jw4+WJwqmrQG1zTKrRfj4EJm7CXTpexp
         gpvOanRFgOQKgxH9/Zcfr0F8XCo9YS4Q60PrHDPOXKNqy/+Rtnk98WNdqcOu49O0nm/7
         IZJt0GC3nOA/njkkfeu8j1pF0qSji2DAG60L1YWFt+CBrWycmdbvNUmysxg9qZCvxuTS
         1z1fzjSPEbLjwQ1nbuvmw1e3rj9KLaxcHkaP5KQQ8gLcbhynEzjW/oA7pg2/n39TiCOX
         FjeQ==
X-Forwarded-Encrypted: i=1; AL+hErFB42wRCSv48KI1WWMLnLAL5fgg7F/k0kMojEk+ezrd+ZgYbEITUun6r16T/h9aLhV0qKWtuWHr8IhdDzFr@vger.kernel.org
X-Gm-Message-State: APuU4Z9P/5r+JefUOq30sqkvqewOlWAssFyY0BrJd2CSegPo+k12LUb/
	LUBWe05PX5zqqQIJZcH4jFD77kKNaU+mytyRXJUa5PE5itl7v4XF1xyhphg/XIgySVtEGZFW9w=
	=
X-Received: from wmxb8.prod.google.com ([2002:a05:600d:8448:b0:4a1:9c49:8b1d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b83:b0:49e:65f2:db64
 with SMTP id 5b1f17b1804b1-4ba0935bde1mr40606985e9.5.1794398008579; Wed, 11
 Nov 2026 03:53:28 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:05 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=ardb@kernel.org;
 h=from:subject; bh=eTbPg8U8qIh60PMGDcb39hGuBroyzjXdab1zxw0EvZw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuGLqD5mI/nNZv3+nvlI89PTcW7PjufKLUmZqT41NW
 b/91ZZLHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiWTcYGR6qWb5XDzUynVzy
 X/9FzmWtowbXJVedWXlrzbXkhd7vzCYzMlz9yLJp2vbH9fejPmy9Hsh1ddaiuV7VH0+vnZJ75kq pYhALAA==
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-10-ardb+git@google.com>
Subject: [PATCH 1/7] arm64: dts: qcom: sdm845: Bump fastrpc shared DMA pool to
 32MB for 16k pages
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The CMA driver wants memory pools whose base and size are aligned to the
PMD size, which is 32M when running with 16k pages. So increase the
shared DMA pool size from 16M to 32M and set its minimum alignment to
32M as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 844b840bc546..5f554f6b06f7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -894,8 +894,8 @@ mdata_mem: mpss-metadata {
 		fastrpc_mem: fastrpc {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
-			alignment = <0x0 0x400000>;
-			size = <0x0 0x1000000>;
+			alignment = <0x0 0x2000000>;
+			size = <0x0 0x2000000>;
 			reusable;
 		};
 	};
-- 
2.56.0.611.g1030f0b940-goog

