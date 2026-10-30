Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346260;
	b=M4irCHLYL8JAyKKnDLnSg1pdbtNhpnhdqCJ0E7RsnjFkTMxRuxyAHCXSxb84807J0bvA
	 lon2HWOhgCxhPEUfmtWeRzUQLbK2s9Aavnr7t5DjFtfMyQxNSTwmFIGDorTkJ5s1/o6uJ
	 8MiNhOD7rBofaNaXSWFjy533YzSsH5BoMbpbOkXipuE6tnmjKBcf+oUTAh9/eGEHmt5Ni
	 QcSSyTOHYLQVO0i/qlQLewU8wZtUAOCa9IOuNVv8QSrbUvXy2ZZKCdG896+EQ6e+rwKUx
	 S1ULPzX+06iuyMozVXo5jtGCImhPLUC/JRb6Ja1Xz7FTdA5cpud4DAMhb6MZEWxTayg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
	b=wmht6hMWTURYVPWO4cXZduJvXRCZlDLIXpJWfgHXoVb/3YWiGoYHKBMQinp1ypf2nde6
	 XrRcx50wxT6vGYX7Sbu1j5RsNjCdQOUHSpvn25ELGbzKHUdroL78IMlhL9TUrMatpAZFv
	 zkTcqy3riD27zb9ownFyRHiIhDA1CGs6mkGreoBUD1+WHU17+7ZGJIFA3biE9o6ES7XXf
	 RUrO7+mHWbF967yya9nRooGO7eFRBAusGy0YW07hk3WJ+QNzO3pBPKTLzy1Oq4bbuENgP
	 wFeZPDOYt63GP79WmJOzaiEqpN7rAcBIhZ3ynuLeGm6/1i+39AeuS0m3DOziySqjsoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX8paL5q;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE09606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE09606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX8paL5q
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-188406bb948so367344c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793346260; x=1793951060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=wX8paL5qsDtcZsMgSgtZu/jOrHyINzw0qkafMwUUmyCKUP+cPCQ4QfoXL86d1EgC/J
         vrzscfNIIQQmsTpvtNi5putEQE64KNqjVHVR24bmfCR5IHqBbNc2O3KY/wajJsj47gTS
         eEelyAd1XBePozajS58A8fF5wVnwcLI3gIqhFgWdFyKQjuE2EfkO3QhNJeQBRJbjHSDi
         llooS3PoM7dSrbJerzmjnNuBNBQmx5BNdSrHxVzao/urNix0sPT8tzQnAZAso40RJXnJ
         7CY24bSy3DNsj8I9VxC2okaOrzxo3NVrwDd96BFgPyaxHRE6J5tgyigpCStizvxa9EA2
         sCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346260; x=1793951060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=BJBDeRNgMpMd/nq3TDcfE1RyLvxkZoDGvH7RZHRVi9JItGeRCxJWOJuJlwvhghiCuy
         B65Fg+tt8Di/Zbxh4yUFZpik5AjsKv/FgG7MAGCa/yXKzwN4q/2UiYOAefPYpzensgMc
         OiA6RAORu+0dtpT0JkeZugW1RO/Zl6vOHFmUzkRxT6O3ilsRV18v+vng9eeYRGg5FZWZ
         9btpuZMrqdBduaugejfjC9MpXiWZDZw5LIReeebkMBcKAPbdEtvxOXW1Y2cz7Rlly3lO
         VMefF9lBVU/Z5KHmrOyE+HSJUC3I1a51PNN8FgwiDseT711GJZB/mDcPPG5jt77sRqkq
         7ucw==
X-Forwarded-Encrypted: i=1; AKwUvBxPAojv1gEcy5MFk128chf+QhJz89pFnevwoaNWHFz6/Jp77JZKmUY9ppocLFgyqQorBUsMduW1T5EWHAbr@vger.kernel.org
X-Gm-Message-State: AFq9FYISpIBfbFR++zT8stM3ELj4VO+b3bHf4z+NTV8lBPPx+G/4VxeV
	ZA4MrdReekcoLUuseI1Oia2tmPlG9ce7ZsrN4nKm150PFgLJo6X/fLpY
X-Gm-Gg: AYBFou3VJk4/QCfU6PjmzYnT5JdZL/pwRgusLLrwqyoarN6KRBPgJ3D5rAPg/ASFfrM
	GvPXIF4cyOdv6XW9xWKunQne8+SIm9PHG4Qvyb1WKt8QwZt7B9DB5Xy1lkeM/E78F2+0ek48hCB
	029EXRdOAqG6m41HYYGDUJywVYw9ZOgpMIl3tmTbY5AAoxLRMI3UH0z4Miu5Fbte5wHUiF1J5uD
	oo0K7j2cbYsXPN0OOWTfR0hOw4INLewefW0XeCiBGwUfYxpQQF9y3+ckf0vfIIe/4DSMw5cT0o1
	q3TaZxYcFHqzKQNDlsemFTyz0MCBJgBzonuSKqWwYCDj5w/73GTy3wFk7Km1dcJjsJGnJIlwXjx
	vy83ZiksIK50ioEG4shP3GYymyFmDzlw7cI2QrHGoQVdn2TBUl+kScDEvKgtPHLSMBFrPxZf3sd
	7BKUFGmpBnvWpvWt1TGLJEtWg0Plz4H/5MLU+dQ+DRY/Je3Te6Yhn3uXdbjiqYIYzbQ9mnohNxK
	cXAlpS5wypFbtdrFWTZqn66z/gQuyCXjwffQdCtGc33Omk+ChuM0mcGdh3bV9NzacAi8elMvBRK
	REe/rtosGN4+A+18B5ezGv3zKAwhuF8my362F6Ol3S/17FbW0k/W9A==
X-Received: by 2002:a05:7022:b0c8:b0:1ab:6b10:461 with SMTP id a92af1059eb24-1ac5e3231demr1805763c88.45.1793346259452;
        Fri, 30 Oct 2026 00:44:19 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:fd6e:e797:613b:a5eb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm7466562c88.10.2026.10.30.00.44.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 00:44:18 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Vicharak Axon Pro
Date: Fri, 30 Oct 2026 13:14:03 +0530
Message-ID: <20261030074404.33517-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261030074404.33517-1-blfizzyy@gmail.com>
References: <20261030074404.33517-1-blfizzyy@gmail.com>
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

Add the compatible string for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..02c0ebc3668e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -472,6 +472,7 @@ properties:
               - qcom,lemans-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
+              - vicharak,axon-pro
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
-- 
2.50.1 (Apple Git-155)

