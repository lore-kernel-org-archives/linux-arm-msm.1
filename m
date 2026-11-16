Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864316;
	b=AhEkZ4/ZqmmKV4ayLnCS0rkh2ikInWcn2sPh+j3b6xSbcE+MzmWW/BgM/OiWvv3w9Bem
	 WqsL76pQIRr+MeYTpOV6kVdyfWjBEcauL1ABDkTlEJGGZE/JSTfF5MHIP0HzybXAZeIvr
	 Y2vitt8jgUsrMdKYAZegIVhK+VG8zrY5Vd+SrVgEOqlmRyymYvHCstXNOoBA3KUFveKsv
	 gajGjViFR7ZYnhG7WvWalzbAe1JTbID3uxAAnjSgyUC3K5pIOt14Auutltsr5eDUo0/a+
	 bbD8ViB/DxhKZ9yw3hxwRszTl/Y8B8CSkCx3CilA1FG+ISnLqQ+gLv1B8GaalcfdL4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
	b=KhiN53wx6g07i0rWj3d1mpv262fj3NMn1ZYd3TjzwL88zTHM6g2vlkm2mxwuaPjkagR9
	 mteQ4bLN/DeGiPW/g3bCmQAV29n9SAEt6rm/gZy+bYGyw0pOwfPYjbCoXngf/yMWohxT2
	 zv55YiWydUUwAeoPj8Tta5AcTcAsE6m4AiGwppsvi93O1gJzpLEY0NoZp/Qwco6/ee3ht
	 afwcGmd/YhwcNSaQil+B/N2/S0rzIcKsSmGmCWZF2BZZERmckYlxy3HuBQRvvUxWhj0WF
	 ee8xuLlVj2aM4ge5MSFyEIxWxLv3HqCJLgZl00/6GlHL9ZVfcNhCux1SgiCntyufcJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iseyRQOE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978D606A880
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C978D606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iseyRQOE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso21046745e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864314; x=1795469114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=iseyRQOE/E32bBmFMCAGUZXSR/qaLS4KuLAqOaM+SdB1JDnfrcopkhfWQ8b3jLTZCD
         qnnDF/TT02D8xCrqB4uYGpagOG6wlWE4ePRpg8iEyCytXx0rLcuO5fHP96J6BIpDA9gk
         iLegNl1FcpOeWC+AHGYP8S/mBYbuBSsoLoq1b7+0p3YSyh7zfJ3Gh365uu37gQWPYdx9
         sRQ1K/GlWzE328os4/xKBsZiUoCzRXcrQhKQfvT+wt8D9oV1SyfpnJHrxcPhviF8ImRF
         nq1pKotED9Wn0jay0acJ9SaPH1qUzXlfvAzx6TQMAmwR2F+FrUQxqO1IV8FBYfMkmPfX
         W99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864314; x=1795469114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=aULEn0FicFs2G5kKTt4SUYAuYdoWknAi+HQR6u9SYkNf7FvUv6zVibLNU4DuBPbljy
         Kx6fh/c756e/5pRGCWqx6rWuoX5wiPbgETeSPevs52B0Q7TY2dI9+2QJmeAGO6q5ytHN
         J8lg5sCc4Feg/gMujdnqByLBLHUaoALs3TGKhRPgPihNpPHByKIhC7NESO6ykJDPQJ43
         +NhrEhSVrb00jkXEB8JCiXRIAyS/Y+zp6zFumfAa2m79a+09p3VHqD16pDegFKOybUeW
         VxM+gyHnj2RDLtUO9vW42ZT2JB6pWikD0x+9Xj68YeSEa83EuhMQmN791p/OSqIrfk5A
         vy4g==
X-Forwarded-Encrypted: i=1; AL+hErHpF5njY0LpSs1mqFbZ1xOrD7tenWQ6ZEQN7fpuDSaj/4RRI4jB2GtgOp133WQPpaVoEIJmri41/pwMCPZ7@vger.kernel.org
X-Gm-Message-State: APuU4Z/GGUISkyi8VljSydnoEVoEl1/t7tJRhyN5Ysahkf+mwY6c4YDV
	Q/LoS1asqsN+MyHFfKPWiquPxZAc+U4CTHbaUY3AslZxU9D92AC1Jij4
X-Gm-Gg: AYBFou3YQFMYZ8RYdY0u1+CsSF9oZ6QrpWNXi8L6X7GO9RB5dpb4YxGpLStY5edFgRp
	o3HrgVOcgr0V0j2p5leujgRXm5TvFkrvHLOLHkBVu3x4pvll4hLbQawo0dmT7tPr8A9AnlwQGZy
	9HMr6o9Y4Td2Lt4nWjozZIsI1fTXoLzYiePfC+ru9+87e0UAfGmu7Mgx3JB75KzOfI9OPWxd1OS
	29BRFrXrHSbu9LH9G12G9nv5b47ftI5LdrbOLQ5mgwEmB3Vp4sOKvoaEjLiQhtXlXY73Q/E7NSK
	cLvmgRXCIFI6SNymoXAd+2vekl+ukGAOH6E4ehIBX7ue7aZIOs/TYzWK14blay/xjc1/xdiRObk
	lLLx9kS9UwNwoQJsdYQzGC5bAw9t3SFGxhcymqCIwhN0OCjmqdPzMNWk49jqf/mXoXrmoY4P4F6
	/hs/9MvCOY3zdvFxWwewbd1XLpfht36/+ID800Q662rOu+QTWKb2c5iaOYcGlbxXbJZhHpuR7hm
	18YvnS+4AQpReeDyJZyK5BdHnr/2iHe+pcnm1E0CwDyrv/FdQCasbcw4z3bmSa0zEphcTezLWRh
	a3LfEOefwJ1BuqV+jneVjxfJo/eEo7gGHoV2q0duS/69Sgzq1k+KOK+7zqoxmw==
X-Received: by 2002:a05:600c:4e88:b0:4bb:7033:c936 with SMTP id 5b1f17b1804b1-4bb7033cd72mr93163065e9.24.1794864314291;
        Mon, 16 Nov 2026 13:25:14 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:25:06 +0000
Subject: [PATCH v2 1/2] dt-bindings: cpufreq: qcom-hw: Document Halliday
 CPUFREQ hardware
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
Message-Id: <20261116-halliday-cpufreq-v2-1-e518cc055457@gmail.com>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=1136;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=/5q7xJNdAtVYNP2eKqnOFRxkwGs69ZAxtJgwpCpPYPc=;
 b=Nu0RqZZ5Ivs9eeDLVKmj50eQ2veH0BxWIj/S/nAk4YibWF4bJq1xDQ9cK7u9JqZQViYI1Hn/b
 VTSNe8I5N9lCjoKUbRO4u4YsnoQGGy5myEbsLjX4rzZ50PPP5EVJWt+
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff172..d6040cd293f9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -36,6 +36,7 @@ properties:
         items:
           - enum:
               - qcom,eliza-cpufreq-epss
+              - qcom,halliday-cpufreq-epss
               - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
@@ -135,6 +136,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-cpufreq-epss
               - qcom,qcs615-cpufreq-hw
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss

-- 
2.55.0

