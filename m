Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661791;
	b=tlVgQx/quaOpkba92/ZARZwh/FBJ70wWlLqe0ARY6S9bRuxIl2oyVO9QBlXug9anbqM9
	 qSjItX9UFMVk9W8o2DccRyReiuSHV6RiZu+Oje5ChKYceSqUh1RHv6UQ5QVSre8fHMek1
	 PCJmRsECZ0cVoUeuXWdV+LSi5SgMSRRBjn0Fzf5DJssUCAb8kBdJioM3OvPXfwDmdXv3Z
	 h06lBKy0i0xRuz2hyt5wJtCzahqXhfWQxmFfXBksSReoNyEohs3YrxgUAxZDl8GJvlS4H
	 uEKtBYaOtanC+pE5R77CWzJue68RGx3z4gQ+VrPiLamK0FU+dfGvnerZaRDeUS2TG3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=TeRZMXuej1vip+D/LnUqBGpOH5R2x+fKEjyc2dQze2I=;
	b=xbI9+xDif+ZjTk+IyL4rHIF/+uN5JzCuesJ7R164GwYEMVY5SI2KazpJBpQ2s0zFTUft
	 hrAa4B3w3srAOnCyOvrhUvpWoGAVUi5qdgukBhnVK6pldS6clzlxtILh0JFn9OofEynzG
	 OvZivic6HAOOccAg8xZ1tXaWx8syO1TZI4P8rz9zB4yDmdDIXBqKysNQBBXxbLO7bA+Ob
	 9se7kNnWLo/kOoGnIXWxUfsoIpCtOyWHg/9p7nseCeo511mJBBjsoVcbnSZ5gJq6HHCS0
	 kPIEYnPs9JBC3XpEQV9Rl285xbMVPWASKKiMPqf6CfEG1GXbxOo8NX7X0hu+yvQ0/9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b6b73ZRy;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E98F60A263F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E98F60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b6b73ZRy
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so8180035e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661789; x=1793266589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeRZMXuej1vip+D/LnUqBGpOH5R2x+fKEjyc2dQze2I=;
        b=b6b73ZRyxrybytJWvg9Gt+ZEM6ida9EMY8QbPkHfRjXge9jB2CaVy1nBOLIw0L6n64
         mdFADsjiPvEmIP2sDeMSqLDr2vCLq15xSLVzZkorVGTV5YCZ0boHzADnzP2sbkJ6j4IL
         dCCQmbEuwxmobeu5A2OAxUAEOp1ANOlYajWPNRHJLY4HMN0KrMyWmU0x1zj1NJVqLqYe
         SrcxUxrOObJlyvsUxpyD61N2ygXhpchdXLkdw588YQ1qkXi5x+3DxY/Y5WyGXW1zMptL
         xKUqhYRpYDc1hhtMzg6d4io2wFuSzndnC8bwvePFHJMvDQjlFPmQ3yQ4FfWjiu34NXhY
         jK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661789; x=1793266589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeRZMXuej1vip+D/LnUqBGpOH5R2x+fKEjyc2dQze2I=;
        b=Qh5n6N1pSMevEIjixqFSuIlt/ai/zNPceTasV1VaXB/8H6NFKLBaEeX6tQkyqi1o4m
         G4++Tq/sX95irJT7uHCf5qdkGwn0ChAmQKGPrnhuUgbBp7ytEhKC+C9RVkaMZvRpwVsC
         tbS3lcX6tIY8C4FFV8efsO16Ui0I5+7ESol7aeXz6rRd65xlOMJDQwi1l6+q/i75BmRQ
         rJwFtoE+ibB9byLzyLK0dYeXRq+tNSXvmyjkUU4nQibphygZdQ/ClFC9KOmD9SCYaIe2
         vqOweSFxfwiGBmaaD2jUD7NE9wAZ9/xL+W7SDh8Q5875Qnpb0Hczz9MKVQW2OWBPwhDh
         IQlg==
X-Gm-Message-State: AFq9FYLvUaQTVol7aHCF2qsUVzWh5IaubcK1enJINjptvG/QBPqxuAzG
	zAbZs2WgIdKH5mauS0mpda3nRYVdHuhLpp1yRTe5+l7jnMVZFRKU03CCqDzB0rTbVR0NabFRxG3
	axQlb
X-Gm-Gg: AYBFou3CrhewxSp5V5AGGYXeseDddcW9VsWDQ8RNSCp/erTddDstOmrLs1r3azZuiLH
	6VdyAaqPPcMLRu7urfGTYfK6dfrBsn3oCmTMU1yU0sPRIRlErigYloGuq4H2egtVZzrQKYyCWrC
	MWUVssRgL585RP87JsewbBaao4V7vejfyAf2/RxM21aR2tIO6n5o+WN9FhZPG4hRQ/yUMobN8TR
	/2CSIYVKpYWr4jGjksw8moH1agEWk6lnFrxAv4leDRQwIW9GM9qqjk26HjwfEPhOXMpzbdLyxec
	7CYM90yr/5/4zkv6Jtqxyy8duxf+0tAD7W6Jw1bGRbFx7LgCz1oHKVQcasUi5h7VRyknVQjoKZd
	DP9y9EbLkkg+ygu5QYO3xzBlFusPUSSRUh44bHjdWBFzfOWmpIrRnIzPJLH1E9+bI16H8whqiOu
	hc1zS4/Qw0xnYiNIKRrtYVOJijFIcfw1cZbXTsPwYF+ti/irYkb+JqXnuqsRHrlYnf30OL51U+z
	qbBPgNnIhvnT+n+JAG9bhpHHJDgdku0a2v5G+WPqacOSjk0F31QUdaCPNIhgAa2cmnUJI8=
X-Received: by 2002:a05:600c:34d6:b0:4a2:bbd:ea3a with SMTP id 5b1f17b1804b1-4a20bbdea84mr8960065e9.6.1792661788705;
        Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:25 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
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
 bh=h5ekk/v8cfSdkNpefv9/IcGORcNHW38c+dJwzsUJ6fw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkYrcPOhObJb97sLE1075e3wXJZZjVJ46O4pBAb
 Qs7LfrWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZGAAKCRB33NvayMhJ0VQCEA
 DFz8j9yfd8BLHUk329queLQf3+BCEPHHk359q4pNIpE+OI64CbupPPlZyD0ddtksqEAz2eYNyVald2
 IIn21v3Sv54VpYwvuNGWBZbbQKTKJEYjlJgy/aG423Jr2Xu6ErZ9w2BAJ1EePM1k3Pr+ejt2ELAoac
 sALJrGn/2JSnA6sdROpGc3VB2C8QLrj75DZdKqSA3/YLkNcf8SY0UQNbqbSoVLGv8hscH76Hb44d+q
 Ju7IZmG1AbvMxwuKMFg56atfLk/qoTqEYPoWi4T3BifKwT+V0IKwnt/V14sGqB1NMPmwssf14FJSuU
 3dLhFvMwYLbv/qFQezvPht2RbxsCxeVSmR/hXJC5zN4tk0etsas2SvNaTfuPjQgPIUZph4W1IPnLeD
 Bsvp6KRCKYbkXxhFqoED4AhbufuqY6BVc1W5mDoTBSqNYrfHE0KKxTHmLVq7vKnsDLYZ2oVTy+WmVr
 2y4wtRLFx8mDzZ58huJmKLnufKj0fSsEvHSTVGNB38eVm2hLghinLr/3hUI2TZb2BW4wDtaoVaGMED
 gskIllnCXvtcysXZ4ZAmsE5iiPmDkvBleI92NP7NwP/2YsXVeY0nXFjgnB6SsHXRCIdQTCxdHRWKth
 75HmA4iS+of3tKB4ICkxsSjHHlk8OW5J3CMrFir6mzUxKMZ6Zn4oRv5AE6iQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index f693ea6a5461..11c58a4aba5c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -156,6 +156,22 @@ platform {
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

