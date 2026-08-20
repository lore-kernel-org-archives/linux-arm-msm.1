Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA4402BAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218982; cv=none; b=iQP102USM+MlaP+vHwZTeCsLPQi2qkL7TD4VdEb1BPAM20LsVchy9Ef90IviYbvDg5s+mOJOHTqmSBWMe41r9zmhSYAnojgoAmQCsP/ZaJQI0stOGTP7HWaEkheM8sEmPNmD84/qQpY6iUc3FO8+WAhMwK2dGEXMlYui79HRp4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218982; c=relaxed/simple;
	bh=aRikrKedr8rRD84dJqfsSjKHfSLi0ROhZlN789CUbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHxAulQSKZRPMje6yx0lsUn7ezdq5w6gFr0W5+3DdXuCXR39Gq8mDL3KYYb+l7vUIX6m5vEL/rvxRwZEjL+Tm5I5V5thKC+ErA/Fv9RKNUsQiNEMM1Hl3eAaKH6gl2b2HRnXNT8t2d6RGksCO92LTOHCKHQn/hvshNITSdkuCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYQrHhqw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYQrHhqw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f84023916so1929464f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218967; x=1787823767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=JYQrHhqwDunqVDwPcJHQUvP9aXnxfrHW9Xwakk+BYY1l3JiTN3MewFxDzsoGljwHKp
         scScVkTBq5ZndXqf0MPLPiISlydMfqdIpCicEDMH1o6xfXCQKeha5Z3UbT0/BV7xWQsU
         WXP7CaktAaJ5K5Z6vgBhFrRDGHiREoCGnh/RvcQ2Oi56gNpgJdrjQMKkdxbZul1vNm5+
         rT5DCVHXsAfhugDOzBbhRDakI3cr4UQgIzfNNloJLwI6qlbA2NI35C1JAC0AywadFr2H
         lZ/Pzd2qPGjgcUsO9S76xU6gTRupEyVWoCN09LMWk6IgKhN2x/rpiXJzDEMKrSd7kSh+
         mNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218967; x=1787823767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/a/K4l60N8ZYR9C9kOGDnGGvsCsbHCt+W0MVudFPQc=;
        b=iKfPL604MF+T4Kg6JwbOXo5AQP97joi7uygWfU9AgarWTlc58YUy4BtTZ8wdSm+8zh
         7mzGP9N8tx/pA6IzVxGCHKO4y+Wu60rOwbWrXC//bRMb3CGFhw0xV7HwN4xPilr486hz
         Swk2HDoyk5S85ysb306CTPtcvnfJr8jAhBEER2PCzzL39zwbcFcLDz/lc21uhbM3oQQt
         StoDwtGhUyUJl2/nTKvxBPx00mriv5F4p+gQITi05NJjdHnf2Nl9DSzbj+wqkOhtv0Fp
         MTVHj7VaYHike1/viPQ7g1+SDVKSi95Q5DTPDXPTjh2LvPAFJPo/PBOxAbm99NSphEnQ
         6fsQ==
X-Gm-Message-State: AFuF++lFSBj1F40K6+oJipz6oZi2v3BNrpB7oyodeKZldMrHm0psiCje
	+fzqMgDZchj/Cg13NW14n+AVOpPuw2ed8BQQ9KzmDHVOIS24vhZYARlr
X-Gm-Gg: AR+sD11JahnTJoz3/JOBilvjXiInvtGjujTHYOmZpHx1XHQYuQCKEAF4JOMjjP6yH+E
	LI0C8+NDkpFQEEx4+bAXdH24zddEIjetbzihG2V9xfkHRjOc/BUDYB7zH5d2asU4LkrDce68F6u
	9ubhmN6DtnGWJWXDrr/vsjuXd133lwTmBMwBhRImuvy+yvVZzMJsZ4/pUlysbrfm4fcYVfhQZoo
	W/WvLRRjd0lf/pPPek3E95uYvXHarAqxp8PQ5mOzLOPa4VMUePyW7Y+fsa9sZjWT1MQ4+hkJjYX
	FJ3EEyXk8fe5ZPK5WLDQa1PtRISwNrcVb2B+bzYUq/kSNivyhHdeRgdUH+Yo3f/0UHRejGZR3iM
	DtRFwpy5mfCKDFyQeCu4/ttMFxJg/2v1971orBeGBi0Iozi83TIyZ5ePt8iiH/xCMArsRnyLNwn
	UFibq/h5UKHcPIjesF+lBYp51ArSN7e963dINCMsC34z33icOh4RF0qDtYvsickzE+4YlmP6tFB
	AmqKeqUAkCQ8skaKWjRXJJ4
X-Received: by 2002:a05:6000:4b08:b0:482:9a18:d753 with SMTP id ffacd0b85a97d-482b1e872f0mr21368794f8f.5.1787218966783;
        Thu, 20 Aug 2026 02:42:46 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:46 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:29 +0200
Subject: [PATCH v2 6/7] dt-bindings: arm: qcom: Document Xiaomi Redmi 9T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-6-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
In-Reply-To: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatible for Xiaomi Redmi 9T NFC codename lemon which is one
of variants of Xiaomi Citrus lineup based on Snapdragon 662 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 68542f76df30..5363efadd4ee 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,lemon
           - const: qcom,sm6115
 
       - items:

-- 
2.55.0

