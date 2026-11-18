Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003639;
	b=GquYUxjgrBKnUzfiIHJ5jxu+chUCSSceSPoY8eNRP4BxrpOfMww5NlTMF8VU9sY/66My
	 6oE1zmzXyZGvhCteB81kzpzMEZ3BoJxVzxKrjxQMtb06HSZUz0jPmCS1Uef8ihSukwozr
	 9z6mcp5+hvEN767Zv7pwLEhWz/eIHhc0iTeP7Y+Nv2oXWZUgkkyz64um9ron5sso603Yk
	 mbCreGIEcC0VPcqbrrFx31bZKe7/T1ZTal75ZJPmtdehd8i22H+Nq34UccZtNasJRp1OM
	 DUXyuFFFiakik5xwYht4eFYOmLokaBrEOx05SgNXcEQeUqjXoWx4XCHxeWZpzqAbuCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=2kqeK+uxriGjYfxPfHpsuuhtbTWvgp/cGD3/7kvF1tO6q52vJlOqYN6edAv3oxdJICsI
	 QRNO2Eqih550EJA5l9nOuT2Wwi11ENYfSSv58Q3o+xJ8H7tQgZ3iHtBAiZg6M3GAzWLfZ
	 UzPZnPLVngUg6L6+8mH8r5gIr8iSjBPBt38N08zySP846BkFL3bazolf4fsvR0FzJXM43
	 ESRBcE+nVA47Oo1nlqUHiGqmDFnocOhwQ+dqfPqBq9AuwAEfosQB8gU7W/kYHf1ekRptJ
	 /DxachMw7Fpdc8VhjdrmcAB1H2O6+U13HCv0SLw44uAqmzOapeTYjdB1ANozZ+K38yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMquM6pt;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE301606A338
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE301606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rMquM6pt
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492690dd5daso648131f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003637; x=1795608437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=rMquM6ptDsutIaiNx2Yw5NPovGela4gqxe32OKyBmkc9+Gr7c1LXKVFsiz0LwoHMGi
         580ZTI/Av7s/ToqUw3YGWhaZdKj7L+hk4AC7B7/p3oUSV2yaMvuL4fouNWcm5dvtEiAe
         E6O3Oo9LdLfW/a+SEPyGwjfbvyak/8GurZcJQhewbWGcsuzxAN0B9s/B0EsgD/osUoyt
         c0GJIVMyfi/frV5jVG6gZdURV0zzIO+LR1T6rddoFztdIlwcozOBUT/HzGNxP/7c5zQ6
         vFlHINj3hmsNKKhkennDdAzLsee+13zqdezn44hmvFj2mypUMX0AKnSBH9DuMy1DG1jC
         gVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003637; x=1795608437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=ok/Th0dQYRQcnU2V9quHmVc3kLoOd7PAeKwzGRRPZFfp6pS8WgjI9rtUxbpdobCgks
         l616JH6tkfz207kRNzurkplnSGbonB7palpm3cOAMGv4HxPuuz3DHBdD6iTiaygCQ546
         6W6WjTnSNQiOxkXv+awgNje0olHjnTvLaLvBGi3KqZPQJqL3+0ghR5dBGnNZc9gZ2DOP
         xDNwJR0RYkI0Yd/sWnN9mSzzsldQiIwAs+YtpvyhJhJbUDEJbiYQwdaZGcJLhGRJBD4N
         lbXL3WU19jnT7fyWFn4y+BkJ+5joA8h2212xQ9gVC2UuEe41K23lO7ho+GFET+QD5dk/
         DqzA==
X-Gm-Message-State: APuU4Z+pCohI3cXjqWUUfIWhb0G1jSNpflBNJHp2oLguNaBLtv+6uIxs
	aQOkfPpAR7HaRkG2VMIgkAXK+qnMXej77AsYpQFP1alhXGvLKpEDEjBWxhMIT/QJCxa8/QcO
X-Gm-Gg: AZFdTZdEogTQrE4iLx5e5dz1eyHfNipWSrC2GBRNK26c7bgx1/WJ741SoO5Qy242pOp
	7Oa21FcnLgr2jwnmWZyrUQU8pYu7Y4313B7lQERNiLDaFd+Jx6bVJsks0EgoUWnt1xWO85x+rq0
	ogvJnOXxYEXJ1n5lRftBqewQq7QjtB1sJfGEjzzW0jVqYQ5mQ5b2UuxNcAhU+HTa+VK5EQWjM/d
	LEmga0IADyPSSS3NNYWwJw/Yxh/MySkjTksOlfLwljDPFnFzhm+4fJHOUaunOyIEzTZRyvJDH2z
	ssPXTr/Bh3QMvqYcRusP3jFyFums0zcep+dnQl3woqwzk8Sv2gHkJHfE9/JUyGqpbpIgrLQlu5K
	fkkjF0qLWJGqmtqGHIcKszDPEk/4xQi34j2morNPu9GQPiYpWshhkMUJ0Z6H8o7iapUhXSH7gzm
	6AYgoPWGuzx+G3PvvCW8U3VzPH9pUVPSNLIIDKIKmJBBn8AflJ3cJioRU3smXtDbfUUYrXlHXQw
	97S86DurYA8ofiBufMit6ria+U9hOx/jIAuRV5mrYw8XC68Fe05uRVABzYmv05aw6HsMGTmkLP4
	u0Q0o2UI4De43YcfKvT1/cl6Q8S1SWzo/q5FE3xtANCfWLl2JKUASQ4XPJeVfwm0AuyDKg49QZf
	XVpkFEikobhV3Z/A4dm//
X-Received: by 2002:a05:6000:41c9:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-4a638eb6cf5mr4646275f8f.21.1795003637378;
        Wed, 18 Nov 2026 04:07:17 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:17 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Wed, 18 Nov 2026 13:07:05 +0100
Message-Id: <20261118120714.31505-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

