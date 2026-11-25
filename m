Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577289;
	b=5YItqguF3u//xLj9VZNj5cJHPQnx+gm8gecr1vrIawy3Tx74FP6+O1pQp1kl0OLW+VNk
	 lUkXKGv9202bBKVY/c38WmeF4mf4zX0zzksiaMji9Eq6HM2xfDSAl/ScLSjjDnaQZuYYR
	 BT0q5RTX49E33iWTgi6NAvcI3hNpe58w2OtGnw1U6bVTBfh+a1t/p3tErRMgEl0VxJj9u
	 7Q9P0jFgg+VUsTNagwSn0zcoRJpLGbEkhMk1AEoRrlCVhPj+PpHowBVzJb+fJA3slAosM
	 ywt1v2r03Hq9qtgEsgF2BN2A6xMKykjpAqLbUEEBycHe21cZ3yuw9073MKh/O8YqXeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
	b=0TiJCEMw2r3OvZtghK7bOBMzrHQCweghT0WWKv0ksGYOKNBY/Ep+7K4TpylahfIMXk49
	 2NgvrzKOBcyWh8BKs3qxpLuvEBq5/Ghjvtp+c2+8ny5w5tYMD91/1wbbXjIFCJGvIAVlC
	 vI1rVJdE8LAIvmkcw9pZcisVeMHvzSJkKbkBUZm8u6ol7/2mRy3Oog3IY8Swtx7smJZkb
	 FK7IW8Jo6UicmhiBYbf+b9w1yn6cl0KSotuURtYTzkM22y7TsGqyfcP72D4A+OnDUIZSS
	 LdYK6C64jHY//FO1uo5YKZwLp9o2wklof/OIF7HPaKwYGW2+UMeiN6Xcod19bpHgw+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkKmFZe;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AF8606A688
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AF8606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkKmFZe
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so3118827f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577287; x=1796182087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
        b=GAkKmFZeYJdeyxoFnkh9isZrU3i6UCbsZOVdLwfB4v2LQF1h8z+4rk+iqz59bQ64dn
         8zTxsCXgxfGgbE6Bwa6Y7qsBmv+4Dxzq8/S70qdc0R9PZ0Y2uaKHghNAaCKEOExHZJiU
         POquc91sPAnlzVRSxYnsxLtXJobZNE2Fh02SJSPUWOozFb+nfxqG1QU9tdbVbhxm5Uxw
         mLqebyiqt6urRpwsv1zLryw1YaoCw4UmB2EZVv+JOO1xupHyEOnxQ/kJpbBGb27Z31Fd
         TOHDGZpnaCOvqS3bf9g7fpTTOeuvmsjLnmLXGqVHyBSXvon0XYkCUiyGwjjRuScaP8op
         infA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577287; x=1796182087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
        b=bWBRmKC8KZXhTfhxX10pk31mjWiwP0O5qd72bS3L8k670JWQarSpWmdsaUfNLL1gxF
         FLEkCGIbnBe0X2vlM7PVQ86vadwxb55ZnhSEq+yTKcRWUMH2bNuJ3Of4VZe/ObmujSJq
         72Vc4WEGuZQQWWs2wg/PqDQteuMG76/o6CfrTknqJrUiITKB1JYAA4t0LCvZT2tyVc7d
         bOp0SP49QejZh6zk55uT/AiJiyHJLS572BlUUlyzkVsWvwuJwsrjt4lix6qM2wKb45Ca
         AI+CIFdaOGYauFkAER+dvt1GdZb0PZKmOJhJZA5XGHhxhuFud9YM0lokLU8gET5D5PGt
         KzEQ==
X-Gm-Message-State: APuU4Z8foLHKV4nb2qO2nQMFUvLx7PD/JxkusGPSPX3sTx1j/A5tnWTG
	1DWfVUK7DtvCSwV56L0O+MW+BRP4NYT83Hg3dXpp0VWIjegaOiPaV0VpK43uIKjoMxGaow==
X-Gm-Gg: AZFdTZfF5LYCH3geGS5P1BNQfHhTt67SR6LxGQJfUv8BbqKVl48g9210tByShnZFniD
	CvB1zvGAB+j8t+MAjLvCDgGoSRfwo7DXxFNuZx/aiJVvELDyx3LEmAQNswIkAnf4zDXpcZWRSBR
	FDJj3Z0+2ZSFm2YwNaAk7Ll9UIAs4NLqfvHCGL2LqFhWciU/rSBijlwvxMbsEwfpxZyQP7BmYs/
	RkenUgv98vnp+p9SVODGW0nSXqu26PsRk5Rordf+tfLEvV1PZ5LTmMBoDo+SaoUfz+vH+x2QuzC
	rEtQRyUCd/CKdLFCGTfHwVPmPQP31ozwCQfOI/lHvIcX+IBoM4DyHTGHNBNLraSoGkGFHyvrwFc
	+PzXWzhB0vWyV9EPoPPJXjUAkP30wNCaLPCxM5MiPh4acRlwT6+NsbtcHPs4RqmfgcWA5T5aV/s
	gkfZU4mWot8BENPOy6k895m8P2qnOiWtaRZedzy//P8zcFkgWdQ9DKW/hSEo50Gk9Ybd068oYNf
	/W9JNNVKTqNu19zxMmhZpFDTpY33nj4whg6FTucCBqNpjTPQCa9dDt8+95be901lcS4a51dEHWf
	HaWhFreWSsjaDj46qPogvCvFGZxFl/tWrDhdDgeUQqYpxSmuhzNh7WVuugcXFhc8uUifJdfXLRM
	rLogr/E/wu4ZCW7I3P40RbUGc8uve058=
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id ffacd0b85a97d-4ad5d5f9320mr30278129f8f.2.1795577287400;
        Tue, 24 Nov 2026 19:28:07 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:06 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/6] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Wed, 25 Nov 2026 04:27:57 +0100
Message-Id: <20261125032802.8460-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261125032802.8460-1-rofikcoga@gmail.com>
References: <20261125032802.8460-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

