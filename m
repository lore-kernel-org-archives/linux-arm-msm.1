Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160043;
	b=eXeOC5LjgVU3UFH92gPFLTRE5BL4wXxZ0vAh5Itw5iAv0ey42dlTRb0aB9JtJL15rSJZ
	 uuQJbd0kRlHx8yHtJmXkWzGqmUsJXR50DUowATJCmUNQEJb6aMG11GQCWpNELXyLQUrnR
	 ep5kc8wjCWGdgnr8mx+izSw/zwVwed+5p7jirbY6cG+UT1kIch1mui84vuAgONAjE6PMC
	 2ptCQwrSeUbhMMiwvmYKRyavCrIZeX8/OLDl4zleNysK8w2+GpRvyWWliHHx4b72aFxDt
	 qo8VZTIfya/kig6VY3S4SOxEHMxSARFiZ1M0DjAnYiqToVdc3ykgXs+aY2o8JFjOJKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=dRCbKVifUa/A+MTd80Wya0o8AE12g9/i69EuJKXieO+jWP1mDVDMJaeNAC6r/uoq6GuF
	 ClxqEEkID2raQ6rHQDgSdB+oieUXv8j27M2rdaFqWp7WjxB33cfHhuuqwgxr1EEdbaVIR
	 y/tUDdAILdEVKd++3N6f11IsCtiRpZGMrF5A3uRFzllbBWaAZWiV7e2TzTH09oS/8NOgD
	 F7VvoPJf+GE92rxLF/BI51An0siUZXKFynIy3ymJUdU+68xROwFd6zE8Eaf2gb6CzmxXe
	 PiOmXJS2WjyZ/94KyVqaBF7LdlNYHUoNOkIVWNCfDDE3Vu9Gnt0hb8qmDqX+IoTBOYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac2qP8kZ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EF2606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EF2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac2qP8kZ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so3926125e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160041; x=1795764841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=Ac2qP8kZtgMyE/fP0ZMJG+N+JUCH4QENZ/z1bfsgbihnepp8xs5U1n2OVY2dfM1Ybz
         8eL9nbD8ajZ4xAXX5Jyxp7gYiy00V65DPd4lvr1WAsKMEeB98T6LxXPRvnVJk04PidcD
         BMspLbHPsfTy2TciIM1ZHJ7Uu5HfkTkWM3A2FQpA9P4UW0Q85AQTlAkl6SUwwhB9HWp8
         weJ5Yjufokz1DfRsoI1HB09H/j4MHX83XDecIRETVHcTbm0Flzp30A28S4b52j3aC72u
         dZSBlUbcdaT92aiYk5uXidatSk2144fZfZpYQDrsaNhNQWNUGI7xQ0QTjNAeAlB5X3a5
         9nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160041; x=1795764841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=YgYqzAGDeVQSsjv0I1OoLayI4oNAcZwkd5aXJG9Mpwgsv7EMopEQ6P80vCFl16uSJR
         gNNCSAp89wnYxyPGyjEbUGqR+pMHAgQDNTZvNFolWEhsyF3nR5CgW0mCqz9p8SjMurtw
         1iaiCz1kaTq6zBuhQdX6keFWAhX2B7GJTOOlXAOE6dqgkLmbILhDQ7zsNedfBsdzBNVo
         ZwVEa5cUKceIJM6pj1rYWGEtAxABiQ/fdzAa2V3TkwxADjVxtxIL7LUIR7f/BWpk2EL1
         Wes4ryGAV5EtKGVZ3uNqTyRgNVdo279PEEgUTy6Fr/NnQjgC+dxq6QJ8LDALRgDNjZsu
         YdhQ==
X-Gm-Message-State: APuU4Z/lr37OoU4YFdd693dtISgWdoKNKDOWq6m7U9DeJbt24nGiUXme
	9Bt0CJqXNvaS+IAzz7Id8Nc3jKgGN1pdqoTPnqTcZ4r7bTvxxhQsj36/HCBH2TjiSH0=
X-Gm-Gg: AYBFou0rQQfz535+DLG1HQTSDYgOuHzO/S+oYzMIoQSaVPszd0mi201jTf5p39XIkOL
	/2AjkZ3L0Xv945ueSqW1ndBzTW481qKhZ/RCzKS1VZXw7QHsIKl2HfZPOyjY6nGLmkIbzdBR6Ao
	wjwGSO0JzCm0QEnbT1vk7NWv5i8WuXdWZkX0jbzXelqSrQ0KRGVdD/Mrvd6YpLZSUboxOgVVJAG
	nWsvEf6hyf8FIpr1Bi/fYIlag9v/XrY4Z6JUlnYZRUwxarG+dDN8OP65fQoli1pY25f8SXE8J0d
	MFhIM6bOy0CWTOSh5pl7hgGOh6MDQV1/trTAH8z6Bk1UUIMAvmdvBPCEKD6o5D8Yp8gf2TJfOUq
	WGzUOOSv/Jlf2oTj9Dmgh6Iajlew5C2ksgQ2XVGJ4R8F81qfU4eE4PyugKAPqYIE8cRcDxJgYvk
	02JQfKR+bxxKK2oo9sv7+LY9MHtzGxRJ5XFUdIedqnvapLvivgePGrDIlBvRLbVd6gxRdxLY4Cp
	XxAiHW4B3ujpWZmxScf4GMV1L/WXA8HfNgyRW6VB1yV4b63AqIrqHgSo4VdrID1tApkYC4vBcug
	fW4aI1sTyP7dVolueH4JdCWuV/9pD1kCvU7XkkyeeuY9KSrNsHRFJC79UWsBl/7d+d5frk2zywk
	=
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr41369415e9.21.1795160041183;
        Thu, 19 Nov 2026 23:34:01 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:00 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Fri, 20 Nov 2026 08:33:49 +0100
Message-Id: <20261120073358.10267-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

