Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640076;
	b=TyKvXrEAV7cKvML74Qgrj+AZuRy9m+ppOhjvtzAAjsa5pjOrEY8TyS1Hb7X5J1nnxKQv
	 ANbfo1ojn1s5EAh47en+iUiruuNjlo7HajeHa//tefxcvO4dYF09Iwlpce+jrbqkzIsf4
	 shiOt6Ogu9Xzwqr8f3cSxrqg/SNgURLgMUrErQ2cIm+Y0H8SHxMnPHGW2KjmhFUa9+oXG
	 8RV+VzXPHwC6jMxXFg7r7NRRPHTkDCns/htCW4FESyM1t3DjXuOkQT5YKhpejmOvvxbZ0
	 LY8QmOGKuN1Y8etwM9XzS/RvdC5hfbJw9X9CfBlYYfIKbyDRchZApRnwzz3uWmdV5yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
	b=NvJaY3oq7f7cwdbD+HLyAT0+GUmjvxUW7kcmTqZzCC9XO+yIw5RJxxIO/xsNaawIrvCp
	 4AQ5uw/Yb/MLhLGsXgCeS04N5s7mnkeOsxKDTRcuIxaRGIaJ2jFfnSaq/DS74wLiDexwg
	 TM/8szWOyE15RUzFXLLTgXGu2GN2jVswg/TQhByMq6vHsQEESIeunTp6RR6yejl6J+tkV
	 7WK9ic2ksLSNDNsqav8bsl29MVrn8aR+As68pOAQAgfTglYjQ3Nef+8rKGO7wBTecpdl3
	 HG02xaTYPw0GUhdBH9oRbie+hPSWeXDzaRIS8rLEAmzuQub2tQBmwW+ktl9sMW1NoZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UCWZumXN;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F5606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 395F5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UCWZumXN
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab30d04674so6414011fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640074; x=1796244874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
        b=UCWZumXNKB7VpKk1OEd6h86HAysZ3yO9N1YHh9rN/RWOjFzEKHU3RdQd9bpuGHpWOB
         MH3ZWC6SbRKqo/IiFV03pxOJYJt2iDPhmzSR1lq7IClpAxp5PodIJ3hG4NF0v8bKMF5g
         d/MtsTBs6dn8JAcP6w0BVM7Ws9eA3y5QjAAzNWD83WROs239zVht81+FBZHPr+Znfwzt
         g2qFFJDQcfGTdu5dEozMOVoHbD4+eeJXf/6UrX/qxS6XXL2yIjqEwTsqPg4ota8PUgbw
         wYX4CnGVGlagdHq+3LaIdd55pNqB3vw2ehY9wEO+LRqwRSHF2jgllbiyttSOOgEmC0J+
         QPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640074; x=1796244874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
        b=Wm31eFD3M8k5xB80NXK4Qrt9rkGeHjk3BvfxZ93M67JfMOoAX/gBz++/Lzpd5lpSsT
         L7qjIXDzxrVpRSIW/bXvEfIp0iOlsiJZiH+MbrgUC6RrWAq4yl8+4XZMosLggQ/JAbxH
         YeT78HhdJ6tvgZlqOqFRuVLK4SGIJeNus4ZO06uN7lGLi6IpZHyjCTxVDZhusOr87js5
         luHhVXRkJT+d/rgHWX2YX1XwxDL7vJ1Tmofh28PpSZLBqkimyqYc+LGzjtRe2pMm+q+n
         E+qIuImbxOHVQIJaKHFGPaTBepm7n0zsQEADD+gfD+EdClc+QEHyB5jeV8u+vq5WC7Fs
         pMfg==
X-Forwarded-Encrypted: i=1; AL+hErEBrworkPkG7JZnLsu2Wvt3IBjMYUlIeKhNK08lxdo+FL1XrcBCi+PiwJRonQIJNVhlOQDyB3u74wg1sTaT@vger.kernel.org
X-Gm-Message-State: APuU4Z8kQ8UsHRuJGkBKgnkxNn1YzXNh+Vi7o+UuakUPDxB7jcjID4Jv
	ZMa1FouOLrIiwUC3YbS1ZdhXknN46bXpvOeH4zOOyEXLZiTMAU3ewOENss/x1XcFU6o=
X-Gm-Gg: AZFdTZcO2+bEp9zCu/AJBz7n6doIDJutL/CIW+UY6iuu78MD64BvGwX/+WnNf9ml6yU
	eqgi9vGzy/esyycXrQbPwsthwg1jKiQprkLgL8i1voaMJnEhzv4EVw0wXDwa9IPy7Ii4sLXuYNP
	yyPeIt8qd3sxkTmC/voGtKIc206sJSmvwYAKpBoAalZm7b8pcALlxuLlAIuyKiEKjB6RySOXAYA
	8MHhsC0lH9o1n1sGH8nJ8NMk9e6u1JECbIJzkycZHDKSQ64GVYskrnLCnAhYIoZKsC+/Fszcz/4
	1mVdt9lw2OAGzjxc5Fi8sN8JG9thE6gmFBH3UDzU7bmQo839wq3PU0zrFIcic4YWOIXUnA6JsHb
	jl9uY5IDCrUo+keQIsE42HW+nCo6EnxADgRr7BExqnOdO99FRI48aQlsSXobfVlamink+vzSA7T
	oKhRdb9NOt2qtLkmstGpariYLx7VuAKrxIGCKzRTRrXaGkXxU5qSKsdME1mQwNlh7/3PbymhVcR
	nQwzjCGK8GBOpbynPCJH7nOiOLVgIlwfUitx0v9PSScpweDZOUuYfpe9fKtqeBuNTw/7c3gLDwQ
	sLkiR6WAPblxIlAYeSqgfrvidnApAnhsovDZbikywrRl3YL8ruvWNCAT2VMHG8qudVaepQ==
X-Received: by 2002:a05:651c:e0cf:10b0:3ae:11a4:22e8 with SMTP id 38308e7fff4ca-3ae7f9b4af3mr40150491fa.1.1795640074317;
        Wed, 25 Nov 2026 12:54:34 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:34 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8650
Date: Wed, 25 Nov 2026 22:54:16 +0200
Message-ID: <20261125205417.1437355-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
References: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
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

SM8650 camera clock controller PLLs are powered by MXC rail, CAM_CC_PLL0
runs at 1200MHz and it requires SVS_L1 level of MXC rail. Without
required-opps property the MXC rail is voted at its lowest level only.

Commit db30c1160ca5 ("dt-bindings: clock: qcom: Drop required-opps in
required on SM8650 camcc") dropped the requirement, because the lowest
MMCX level is sufficient, and at that time the MXC power domain was not
described. Require required-opps property on SM8650 again.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 64f5002931f2..666d2addfc85 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -87,9 +87,7 @@ allOf:
         compatible:
           not:
             contains:
-              enum:
-                - qcom,sm8475-camcc
-                - qcom,sm8650-camcc
+              const: qcom,sm8475-camcc
     then:
       required:
         - required-opps
-- 
2.53.0

