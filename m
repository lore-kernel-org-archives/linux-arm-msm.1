Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661788;
	b=YDqw304l7s7PG/NE0mj5bJ7dg5n37i6zNl7I0JHQW9gWgmZYsrSKUjC1FAp7WGabK2Qo
	 GWqwmowD+DQ+V9vUtgc4aOC6HDYcHdFF+X8dLtjBWyx9kKO5TlyZGhcEE1t5A2iDhWQJ6
	 1mvrkXzLN8L1p2nhwlcLraV4h45EYvYueZxtY9pUEYbEm8+Y+W66+7Mu9Nm0pH4TqWj9S
	 OYc3vTs8MiWlvj3FvsRG1tj8YxhPCxQAxyPf7XjcazQ+3Oz7T3ttRVrJZav+l2XElv4vT
	 KHP/yIAHlJUTQZUSCyzQ8Yq+QNHcLMrUzAztvI8CFW5UQTqOpxteM1UQRkc61wOyEzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
	b=uG6NL+wjhYhfisel0uwHWdInq5vU2DINzfKytrb2It3U/v7o8Eeb1YULsiDvGXcxMPhO
	 yQdtC1IKm0EW/6nFxXJ4ytfw+nvlN8sc5DVzr+nbkp8hSHpdjGPLMRyQT5eDSO6LMEGLY
	 RBZRSW9fAxcMPdr/rvwGEhP5ckEXkuz/GOCG8SHN49pODpNRLd83qmtpQJQk5Bt7HOMvI
	 uYJLWyV48YuifIiw0eEjgwBfr5AWou5VcAjAUChKGNZ3snSlmFQ0J/xZ5yjnPZnclZkSu
	 cCPNcrAZozmvQj+YLZqqSRGXqvpD/fVumgd1BI0GvUkvPo1nqHwDlB9CMtQMmEVZiig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z6Gc3KKg;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C3606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30C3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z6Gc3KKg
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso4114055e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661786; x=1793266586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
        b=Z6Gc3KKg/oYAyfA63MIOzEmNGfHOAR/1Lhci/ackt8SRuDfk37Desc6os+fkBrryV3
         PvczyzJSWYBJR/mEJoMbQxyt+Tln0KuEh8sThqbaEgH3N2S76Sn25SUQZ13IGWROgA35
         aTQFIF7OL5X77aIAec39hFln9l8ZOo0lm8qYzCTkznWspomG7pZcdMu+E3as7mjukHky
         n60co3jOknhHrKl0cYCHYyDGYCvhCFUJq5fuImDk2m33wdz5/hI9mjD9Hru3ddzT9xFh
         R9pPXKtydSMY9Nr1u6EBS8Nn1YuxroQOkoks/GrhxbI5wyRKPARcifwiHG5VnKLr420S
         yp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661786; x=1793266586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goNBE2gyDXfkVuotXxQksHTb5GB/j9Cz6WD7aCZPTR0=;
        b=Kib3z7qK9CiHqMKBHSIUguOg+Svkzg5jUfgwOf/rdeJS8g2A4UNwUrxZBAvL7OM6Sx
         JSq8m+HcT+3d5WlvQAGwVq6BgRAWljlWRbx+Awefnjx4+HCOUN62oCOR2NiQtCwmhoRi
         1S9vHazgCnI6RkK1lq+sZ6rAkEK1akvIn6z0hs2IVS3xtVQ70/b783E/VUmcwskSp/zl
         5PNt6n/4UahEfFUArmlbbVI3bmbVszT33nEiGB7jo4/+PBBFFL6iAuK20YIFAhMVeWTP
         y/38fbHaidaLKYpYUX1wsLc7TiGAbCkCU0Wz0HRA6rAQCg7i5g57LZPQoQCbT6/xvZti
         jAJA==
X-Gm-Message-State: AFq9FYKENyMlaUf7mM5DWvpaifvR1OQmajN+r5jq+20k3FZF5S+WHRJI
	igpLrsBJj/ilffcA2OlqcwMy+1dtMfQKBcr929a8LawLnou5wQETM7NhEnq9uNz/K+6bCV3iS8E
	TDZxB
X-Gm-Gg: AYBFou1M62cECo+7QOuMeLupfB5AislJGR7TF3vDdjsK6QOZVq14EEuO3h1sHRbAsCz
	mkXa+uZCrmox7LTqZqZI+jr+CVaurjPOnGDtdb5A4vbJSRart1tANnrfmmy+/9eNMgaRF8o/QQW
	UJNiLb3icpneReal5Qb2SuN4hUwwlYFTrYOmzxzNXOCr4lZ/RQLr7R1u8v/sLQoZ/K3ICwllQ75
	Oxvt165+eN6FnWn1O69bRG4lwWNVeSA1nZYY24b88EJG9MCQ7ybaMAtb8ICxamJJXi3Zl7baB6k
	bT+M8IsEIthlzBbGk6J76SrsmSJlOTscI23EUqJ4sU+lOcKYwRIOgoJ65vkau06XBxNCx5vZ4IR
	i6es1Mg0kpctdoX3YcFs6qPBDdu3YS99L1GlDqMtqwNoPseASssvK1XF0K27JLC8AP17DxJ1tvU
	ORkB1vn+8qnLZSoiEiHICFj/zVfV890KhfSVPPHhJ/hDuH6ncOC0+jwx1kKb6Qd01/XkDi7cFQJ
	0vOHnEpEGR6kq+5t7H2MnN6SrYoNtQacv5mp4N1fW5gWXJdITTPKPX5R/KNDIlptSYZ64vk
X-Received: by 2002:a05:600c:1385:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a204baec93mr38224445e9.14.1792661785913;
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:21 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
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
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UWXXuzC/enK1xjhdLzN2w+vJuBnYK+K3pjEzgf3HLbs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkWO2ra7tqkUJAk5fYcrGA26r8irPaElpk1AkSB
 UoAXgfqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFgAKCRB33NvayMhJ0doOD/
 wLPt3RnWZv6Re51uWRfnacz4vZKAixI2yIt0Z61uZDMmMHZLbOWYQ5NFQVisQdk7m0kH8O004YdkUB
 F7CRSZ8TX157lgh1EwhR9iE0SeSf0fCYGqk47G4iEr4wdQV8Xw/qpmqjW1YtP1gcK2SCtplbLcYGgR
 3VssKsOv/n58OUJOfoNmBuPbNd33ZUF5ONpVuIVl1c8km65mGgXlZY8Dv+j12p1A00DsXlIYn/0d0r
 HDQVCt8t2CtOHcMUU7/QbRPcTHv0AShhjJYC6xjFWqsF+pKMcI9q1rUZ81Cmm5h+jSKeJXx1MjVSjX
 /b6Inrs6ELdCuZt4TKJp2lvM4EPWV64mZdJmGBZ8GL/2iiMWkeklLbkTPEV6lZPXae6LrBRZj7Ncf8
 8sCesuWb6BJzlezlBoKBt9+owNX8r+1e9qj9QtnuKLSSiNqrJvzpzJxRT1v2tCgTT1InbqcmiblKOt
 bd/4/LHB9FiIar2tJzoLAntQVKM5N1jlTkoTIqCRJioYuLuRLc9hiLlvDp0fEbC3vCS+vD06TriBfg
 7/nkGWRlh2ew+6N/u9MxT1xvetLK9sO6cg+mMGEHLHFHHoZoy2Ru4ImEI8Nhg3T4vUm1XMxkqA6vde
 146K/0zTO5QCJ7nGOiA63WTHtaPnG4Mjs+50OLjxpxOePrfLgIT6j8Fnko8w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 9b55d17869b4..00dc873d91c0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -1113,6 +1113,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	dp-dai-link {
+		link-name = "DisplayPort Playback";
+
+		codec {
+			sound-dai = <&mdss_dp0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {

-- 
2.34.1

