Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764598;
	b=R5/sDdKK0hlFbQaEqmQpb6x5BEPeA1C63e84kz7ZTiddCBBxW8/GWqMGLRKVxboD12qk
	 TSXPSlRCstRaU2u7QMq6ROyU4c1sGn/vUnVzDi3abCPX9CHEFOLny15i4ycJBiHx0sKKH
	 R9+NzwvIPqxbUgdjIrhIEV2+xYRmrRyR2CAnHwajHp9XaWKgDKvhM4trC73YAzxp9WKei
	 RNqnEHivTxKFDqSEM4tuyQCqz+G892AOJ943ByjZmk8WEDnRg6KUGXiGVA2Y3EA+M7AFS
	 cim6/KPD+N3EbamW7t0kYZ5MTM0+obIVkUJ0nNjstTLRec+WkSLWZSmtZw+0kXjtsOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
	b=0MPxoOzHV77/gJFdDZOfqYKT6aSAlqqakYXGa6Kn2X4N/p2UZEKFd2UcK6xbfdf0xpQx
	 6iUWZZ8NZeK1Q+eJkJxclOd63x/e2swTM7ortDreZ1WADOIv1EvDJcnKuvg83JDRiahYz
	 Kt6GZzRQqL0wX0tlYnK3p1ogqaUwC7+HD94sqpZjTGuRQqGe7k41uB2T2S8tkEAUvvS4n
	 nKtuRoJevLtDN60z75nZfuZIS2B/YbNyvFPy67RNSYshu7AWKCW6rcv8vxHTAWa3P51Zs
	 6mZGgAGHBrMK8cGEbm7pIBEbaX6RREpi2mMSqzYiADi8bRlh5RXpWwwKY0wT+V+wIcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9vPGd20;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C6606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 17:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9vPGd20
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2235542eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764597; x=1795369397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
        b=j9vPGd20QA4d1srp3DoZpoHFs2xzS/ViN3RJrX/XK6MGZwKAO+CMxanOpdescGz1Za
         uwzbsVA+H5Lh0x16eM49DuYJp/q66ePhUzxJievnH8PEodeslp9lPe8F78hpjPQSJoPH
         Mjv6OVIzPf2TKxeGcR58vtCzvtB14AIsi1/GYSssX1IWSRfWICjtDZjGIlMaKji1flkO
         4ySJsYSQa9F+i/WvDeNyp4+4vqcwhVE/f3ia58jEDAuSIJ0+Pod0jcJ62K7XKTz5Qril
         Dg1tOxu6DdHKahZersMMAGxydwGy87vTS8Xz4D/hptOR5j2JwfEd3OVD20LwnvAX3yAf
         vZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764597; x=1795369397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ny45OBe7md5aOufozmgYkErwn90rLNDQ3eho9bjVilA=;
        b=z26KiU1mQGf8IISv5E18zCXLSWyD0lNZ8H81LiuOUGECrJsqlKAxuO1bJWPS2M8NBG
         SGQP+HsCZFIf563DV8pEAK5/CIhkxbPK+Zsl8gc+OVgZ+16C6gw/sNvLV2zaPYIKpCKF
         OicMR2lEhXC5CQhnycOq1IGAlYxNqg24fTXlzs0gkRpMM2zxQOtO3eueojmUZpHt8uKC
         1uIkLLCFhYifgQpe5tH0tUYkTTI9KANxwiyCi8Gm1SZcIaqJ4HkVePgI83xCdPhKXNpL
         UUgB1p5YdzSbdqDLFjxQPpbjGqkYtC+K3DAxN2vTrs8m/aRy/Ipj60EIOZJnU7x4+8m5
         HrAg==
X-Forwarded-Encrypted: i=1; AL+hErE6qHPBGZKApc4kbdFCEUaA+FmE1QGItyqlPJ9tLpy4BokpR+9D8aK9nUxR9j+Lgg1c1ls72CpN1voAEQYD@vger.kernel.org
X-Gm-Message-State: APuU4Z8needrbzablgoxryhzJAUGDlEDdKMwC5ZqKnW7lcz196i6NZpt
	TvG8cbe/ur24SvJyk4U4oEMm4AbdF5k6m0vue5v8AzAFi08xfCO7o3lj
X-Gm-Gg: AYBFou1XzRC9hmA6dBrp3Q5e/HSJpRTNzN8OqnQmNEuSv6ldrdfwYKEUbV462WCVQnd
	VU5E/FwkTulL4414LTKXSaVbTQfHJmezaT+ClGunNEFsewO+JIcOTnbj6R8OfKYNanZwBPm4LtD
	pFho/8/W11s6ygHCRbMEu5h/L18pozfXFLqXG/wS3Pq0PpJi5Z8jnZ4dbGPf+sjfL3vZgOuslVb
	sudc7saFIAU3zTb6tycZWwibxyOAnx/FR4OcvIW0N3mIj5Ub40PFvebbFKTD5E0/8zl/pLUa9uW
	CA53qFZi1jCB3YmpQJxh4LKuOv1Rw1MAWskvAiQzo0c33gqU3bkPQaLqZS/Y2pQigFJCuI+jq7R
	XyQGteW4VB0Ztg+v9x1G6RNwpfr1cXif39E7PnXDE19ZbOjeb0+gdIbmEl/a9GHkblAfU7gsV5p
	KaM6wtgiX1LKXiwyHRPUxpNUB40KtqZlmMZaslIiJ9qkP9pel4al2Tau3tYC+Vic69BtSaect3W
	5Xy2CFH5y9SjIyZqrfoOhhqX/qW8sO/DtdQc5TR7pNTlIpzkwkv6Nr5tOjJY28mjxHdJ9eHW5qk
	+kqB1z7WtLE1ODYWlcRMigqKCMxnJtZnYpy3uesLngcOnUeyQb185OLZe7YqSU/giBz+brTNQXy
	vdelvLgnuJUhKXDPyn5LPhhB7Nee7mogkvFecjoA5o7B5QMTKXJgMWb/M816Zf0Y66jVvRLHGmB
	mEPE0T7R7VORHR03ohUyktCMR5DQ==
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr9335361eec.11.1794764596860;
        Sun, 15 Nov 2026 09:43:16 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:16 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 15 Nov 2026 23:12:36 +0530
Message-Id: <20261115174237.48908-2-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115174237.48908-1-surajsonawane0215@gmail.com>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
function ext_mclk1_c, matching SC8280XP, but the binding enum does
not allow it.

Add ext_mclk1_c to the function list.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index bc7b8dda8..5f7870fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -64,7 +64,7 @@ $defs:
                 qua_mi2s_data, swr_rx_clk, swr_rx_data, dmic1_clk, i2s1_clk,
                 dmic1_data, i2s1_ws, dmic2_clk, dmic2_data, i2s1_data,
                 i2s2_clk, wsa_swr_clk, i2s2_ws, wsa_swr_data, dmic3_clk,
-                dmic3_data, i2s2_data ]
+                dmic3_data, i2s2_data, ext_mclk1_c ]
         description:
           Specify the alternative function to be configured for the specified
           pins.
-- 
2.34.1

