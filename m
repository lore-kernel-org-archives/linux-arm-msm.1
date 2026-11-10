Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342352;
	b=l29i1FIFpE43jOBQznxJhyTCTvPwUhsGJySiy8dAookLEbbNys1zetZLEZ2jilO0w3by
	 Cwln3FYnm/0MJPxTY4M743dU0yqTwyidgSRKXm3VjAmdibUDJofxrTzGimx9g4VJRtunF
	 a+pcjqE0zxHQHYBM1vdlRQFP0Cfua2cl5Z6roo0fgF9cfr8CXuvRBAwl8m6KjHt9/3Mft
	 TyeJ7GNQb/jncqMBY3bLJHP57xvQgoZgYhvoBpfhEK5ffZ+3U02HBZSJ5PsHLBkuA054O
	 OcKSw/dCgTW6oevdZNEReSh7EHriWsDZ3jA9xBdFCbsQv6RiYUnF1WdSp+Dek/vJcug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
	b=XUbgYDY9wla3YUC0vHvOLAH/lSpX5hOA3nZhzSnb0aBhpOeDmBuawvFO7HB4UYdBWV8q
	 Lg0bFlAY/Kk15nj4gqw7GwtLKEY+SR8RQ+Sp44KKrken+ClAP9CVfeSTKF/2vcY1sr/cO
	 3Cm1KqSeLLsABSseb2f7BWy1szD+pNNEAGR8hs93wNoXWmCS7fSqvoKpJ/kAQnvLDhMUE
	 M9zQQQRQUJyTn9+Fmf+tSu83JSB53i4qVPjOQgVVMFp6zgyS3uayOXfTVu2UZgMWhRhR+
	 a2k+yna8JIYOiJJIK6HNxshyfso0jWv3D1PiOoY2ddvSyuXNjCuj0dAkfD3sz2a3+HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWN4Qepk;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A15660A262A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A15660A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWN4Qepk
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-703be215729so1031957eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342351; x=1794947151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=EWN4QepkIXCVIdcKNmzFh36ehq8MrWn5PnXbuYBRx4cSX37gjR0oS+0Cs8X7utggTx
         hfOXC/O5QoRI/uM8+EWmnlP9JYuAihv7Ikg6fYJYpzL/sj30Oln7vW+jYkPJAbdTmr/K
         uq9qV2iBwRWdpoe5a2mKAIgxNMJhFISq7Sxtct9eJxcVY0fFYrOjde/3uW7iBeRvyxOP
         MG505TuGjvQZBr+D1dKg5KezNUOE3S/FlBegk4ZGChrKotKmmXYs81fa106oxqs/rtV2
         gvjSXGok7gq87RucKQuCeqd4KJU0MTXl+FvFzHXK0Dh/yAe+ozAOV1LMYrLgjvO+hRMc
         vh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342351; x=1794947151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=HkmzIeGhtcYlm+TgDrErQn8X7vS2+e8yU00YmS8U620Kpr7yGFKnwJgPiypnGd5LwA
         nHq6I22U0rQVESBsNhlz9zxsuf53sJB+slM4PyHgQ+ZV0RsfR3AWTAzBrcRczh8xaxpI
         UBwSixNwQPnu04QpWTy+uAi3kXViVs8mATmVBsJIUV2nhlLvltYdeBEdTftGgMZ2imjJ
         2XQGtymjUkvEjCx1uqkbxW4zQvyOCvi/Rj59ON0z/svVfZtQcGeo2djU3rvP/Tb5fXiX
         Yv/qXKJRiZ9k9HV0rDN30FHm9zSmfMq/NR/aYXyldx25KeRgoDW5820zxL1CyhkS7Njr
         rYEA==
X-Forwarded-Encrypted: i=1; AL+hErFZq274cpXE+mkTgmd6PygaFchioummk6JVd7d7PxqkFZEAAveNmy3t4o4afcAgSZ+6t1fPWUUdEdWOpsFq@vger.kernel.org
X-Gm-Message-State: APuU4Z/3OxWqUuZSthMrU9ZuYrRBvF/UylcyqqZsqjDVIKc+7OZSh1Nd
	vmmZrsU00eW8xEFqvFEAvzZHSx1mjOxwNmcrizeDfqh15sVIxd469n6U
X-Gm-Gg: AYBFou1lRvtsXZ/MpAtoIkhE5/NZTEuv7M9fD4pVSPqC0Re16mEuHltw0EFNqWxwe1q
	y0L4vMJL+SQv9S4Cqt6TWBDcAq4n23euKFRYnQaAjnleMH91kMzjGj+ir4sToNihIsvci1r2MH+
	D+yN7+4gYmzJfsjl3OcgamhDC+J1Bv/f1Yr3IyjkQguBpJOVHgJVq8qXo0c8gU13LfRi1AM0r+3
	QwJQijEzHUQgfut2POBV8iG74uWoTwqTN3c3dDqkkETpzbKEjeMLLByuG5RFLdVrMfGPdipooUY
	6CMxgK614bYtrLHEheCVhN2DA1cyIXSJhKjfpWTMkKuYEC2g15BV2Lh/NIJCK/DgpTEZqWfwXhm
	kEne6OFmMUNOOrd+PIS0j32vEyNpQYD63pkzFrV2AVlFTqluuhhvXTZzFcNY2UH3HDArzGXCjMm
	WDshf0miGyMI5xMgOukk3lbKSpN95Iz3DqkYXJjO3AkWAxAWifah7KKxi4GhocGXH/fqg9es9bD
	x1dEiCzgsgdFBVWzRNr+vd1vn33OR9bVYsPs6kgKMMHjrLaAfkvtLU2WMFJ9zR/e9Z2SOG6v9A4
	IhikltcUeS8IPOmnMftuHGxkSpee+8bksc3yLwpTq3brHA/XGZCCqQ==
X-Received: by 2002:a05:6820:c0c2:10b0:716:cea4:5adb with SMTP id 006d021491bc7-71917976877mr70777eaf.68.1794342351084;
        Tue, 10 Nov 2026 12:25:51 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f645d4sm2353252eaf.5.2026.11.10.12.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:25:50 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Tue, 10 Nov 2026 14:24:44 -0600
Message-ID: <20261110202445.14100-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110202445.14100-1-jeff.roach0@gmail.com>
References: <20261110202445.14100-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f6998..c3b6014ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -212,6 +212,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
               - qcom,mahua-qcb
-- 
2.55.0

