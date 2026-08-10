Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D6430CD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380972; cv=none; b=lTIFrK9UOw2njNgZ5Sn4Ouovc0+eIZ490/CAthxxW+6LcmoB+vu4+gTwt947ZTGHFP9gKuGQze4SA7hqYsCKQLXJCDWjlFYxRGPc57tl/MvYNyunb1sgGfeDNBwF1rH5+k2l0bju3L/OswySQVNkIwfyof5gDRgbxULeEHdtfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380972; c=relaxed/simple;
	bh=rQ8QaJNg7DR+O5snF8SeTz9/FRvBNXydzduaI0phx6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/6Y/hNJ5qmSNDLZRAaGYz/qq73k1uHCPzWuRpatamb9bPQEUFIS7C77k8pPKx7irxpe0vIw+Hk9TbHzpu7wTJckV+v09CF04Vo6g78+AY9JUBvMyqLH4EeeCl+cUZg8OM7Z9DMGjqfPoasUX7SHy1PNa27/fdnswV+dNbs8Os8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bgp4O2/i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bgp4O2/i"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4955de8797cso14330585e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380969; x=1786985769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpkqSlWYU2Zu/Y9vZRLFbjkptzRsUkFruMKaA3Y+Tgk=;
        b=Bgp4O2/iesN8qPoWuDpjcjEBxNeFaXWfdoluYdhXsBB9rTVyvwI4Eii8HIkS0dqrOe
         4r/Rl9WC1T4cw/+7hNp0WDPFSN+0hltFn5EDwR9FOZkYddseXfEBzd7bMfA/iylOoiHs
         2jzLMJmbl3425HcsLUGLOHXX/S/CaVUR0CSgSfRyzMCFD5ZkZhditcgnXbRee016NtBA
         V3DWOX425EsdhnuxZk+Juobfcp8qKsjx2073yIBPNnh0Fa7uq+BAVMlQ0HUosp0Q7Ws5
         8B1n/3x1zhmd45l+kPuPIvMeMidgksZTPcOXuEDSGcsf4W2ujpvLJoxKYo0PfKrvTojP
         MXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380969; x=1786985769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpkqSlWYU2Zu/Y9vZRLFbjkptzRsUkFruMKaA3Y+Tgk=;
        b=YJfa5JlZ33WMhDE1UrjNIbQSxHZiQRVu8vrV6nj+EZmnNLtJi8PrRXISyEo/Q2N520
         c6yGg0IisoEhkhhBXD9o9VRn5btVn5R0WhSq5ffyl5KEgEGYVEDf6D8usEQJZ04Sc4YU
         HKKYvnukdFTeIMBNT0sYi8xPXWtKTggBJvb8tICXBJsZtSskckE7aJHgHzXXvEc1/4Y4
         mNJPUqYemwMP1CRwH+uNTFnK6+2CWrzXfeDXuNOq5pLPTCf+HmVrA3sdBU2BeI6vha0e
         /ZVGFV5cD4crzeZYAuFP37Ivq4njNFzwAAO0QJaymMhI/mWYKEzuyBLbHSmynqovi0M0
         CkRQ==
X-Gm-Message-State: AOJu0YywqXECIAVH/Oi/Qar9cy2Q2t1scnuGteSR4pQ5YSHFaefpbc6k
	rJHy71tN3BsQDvYag1GXYi2xpftdOwQSU8nptL7iiUr82bvQh6K4gcqX
X-Gm-Gg: AR+sD10UFea/TSIYm7NF5f3LnRqzdI6GbnByveIL0xga4QI/tFL0Qhz29N7L3ra8bR7
	jDcpnzr9xIYymkJFZDkCUIozbld8NCACdZvhQEKiAUgkM2jXsjw3g2CIk8AOLznog9YgNf+0Mvs
	yqolHgDygKyL97TzjkcKzHazVzw4efQUuOIC8SaURV1V+/QQ5bQ74p4/uShPklBafpM/CuxC31N
	jYY806GO0cD+jejhz3UUBe63xDknwNOropLobf5ryrVlRywNG4QaqJvQ6lDb0oYFjYjFBXgHQeE
	W4/XmmpafNe/lJgTkitaF4wrwAJjYxq0295VyByJx8ee7vU/beRzKTv+JdgjOKzyMiMm+5u0VEg
	1fWVzVLUySSo71FfMz5+DSLn9LBJLWLh+Orxht2ckZSoYzff01GKFqtBR+CWbjh0R7TIczL/s2M
	EaSwjshNglmT5hmFzQipSv/o1Mhk+Knge5loyzT1/usk5mxL1JpROcJuOCDP0pN5mbo0n1Rhygc
	NSckmW62iw89IEb92uZWNcJ
X-Received: by 2002:a05:600c:1553:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-4995e0d0182mr304436635e9.10.1786380968973;
        Mon, 10 Aug 2026 09:56:08 -0700 (PDT)
Received: from [127.0.1.1] (83.31.73.193.ipv4.supernova.orange.pl. [83.31.73.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c8ffsm238472635e9.2.2026.08.10.09.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:56:08 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Mon, 10 Aug 2026 18:55:37 +0200
Subject: [PATCH 4/7] dt-bindings: arm: qcom: Document LeEco Le2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-next-patches-v1-4-79a779d76173@gmail.com>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
In-Reply-To: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add compatible for LeEco Le2 codename s2 based on Snapdragon 652 SoC.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 289a3de1d24b..68542f76df30 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -348,6 +348,7 @@ properties:
 
       - items:
           - enum:
+              - leeco,s2
               - longcheer,l9360
           - const: qcom,msm8976
 

-- 
2.55.0

