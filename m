Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A6F2EEE61
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296350; cv=none; b=sH+pHokNyIUsJzL460Nuj/Q5WGCwMk09uxvIoWJKk828E4H0MbVc5M+ZowZEi/SGp8YVjCQVSeqMz7cdLyQx9QIe5W+te6J/5nT4RkKV3Z9GtA9T8KSTgXPZ5kNtq6/Y6MAcVFOtREsxdN35OJIAhwvjwd2Ft/+s+iUw0bg7JY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296350; c=relaxed/simple;
	bh=wAYifBw4LrLjWPQLRl35hYzVyfpBjeQp/AkgYLUI3gY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tz7+wG7KaKjEnPm+wO2n+tY1lez6jgipiywxlwgtrVazHGSsOMCt89yiAnggV8tSSvlglHrugBsswoLwH1xYE/RuNr+pLAt9qQAie79LrKpW86hwW6TXmiyNYCwVni/teGp50MV1hK1RaQBmnMUacA7hDxN8oH0XFfI//hLFjc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cSr8OuX4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cSr8OuX4"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c20e70a0962so103077766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 00:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296347; x=1787901147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=703iFda3ZiAtYyhVCmZdIqpRPYpgiDOlfHNwV7wXBo8=;
        b=cSr8OuX4SYAKIfwZjMCNZcGmlCXn8/2Obb+O+5IYJRiYexEbIpZG2F0zo3d9TCL6fK
         cJIGJcXFxCEB4tCOnLW3ThmHmXR8PWfsnQckM5m7Plq31noysQrF1BjPNpeTri2IiLb8
         bNDXHfPaDNU/qpKbR6axlCLJpvFx23Dc9DIQ4533mFuqJDLN0nZLBp1ETqAELNl8MbTY
         uTbpwmzL1B9bgka3qy+8ppHzDhYCMuDATwu18WcfKH+rSDvYhOnfptVqoEyB/jzTSvwL
         x4PLHxlYEg9wU+n/gK9b5juhjvMMD+5mEVU2cfThS9V5TGV7ZrTQpnDAv55yu0/i8Ag/
         gchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296347; x=1787901147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=703iFda3ZiAtYyhVCmZdIqpRPYpgiDOlfHNwV7wXBo8=;
        b=lgYdOYVC/Xq01GTaBbYPoEkeyWwEaIJarLctUQWTjL6Ax56GehTCB0wfKfUcD+gBvG
         NHjG0sT2iPxfMxfxRUg3ZAA5jCxVKE56hZ/+zHct6KjkQwnwFtKG3l9CSLkPsynVb9k7
         vTxPWgkIzig6EWMgPTIcqGYEcecRdspHzkp0vNhor9vnRpWhdpxi9L+hr68WB98Ago5E
         RHrPF3i6DiZXAlM9P+f4dDxWtEWBi+sdfbu6ixe8fqsJSntQIj+kx/CZkLK8AN9aoWeQ
         RprOEe+Ec71pynETspeo40XBKZRDya+YpvHZiZJK/DPg5sHoToV9nZE+3KbrFjttYGij
         cNRw==
X-Forwarded-Encrypted: i=1; AHgh+Rp77WSGBoTuOv9UBzqJ3Yv+3I/9quqDXJIzysioKKsj48PlYfm4yVr/vOcPIE24RGZph7WHWH4uQStVT5wg@vger.kernel.org
X-Gm-Message-State: AFuF++kITafxAgwug28QBH4y/evMB5i6vJylC5L1v1UdyeZYmfEWUkLV
	haNEXDp/aD0kM6Dz09Nc8L7IowsQPOjKhBp6g44Nm1HqRhC9Bzj45jIGSdLxQ5Wau3px8IUS3Q8
	jZa1pMMM=
X-Gm-Gg: AR+sD10/sOvfpwqbiE1Q6p0FtI/LNSCGzw/X2klbd7NLsc99X8NdAEZYDBjiJSTDGvo
	hSXiA+B46rGsZO9G/ts8se9brbngHORQf+35Q4UUwk5YuLUDqjhgfCSGxGrHlkGuT9uEemoICQr
	RvBHhkf1kSs9uPUNNdgNY/dyCLJJoYzYSvKwncntNViWSvGldDvxHN1ZqCdHvhLZgFeZCi3cwLt
	FqyEGOYfIOX+d0LfrTwzR6YdVEqZZscMiZEVRePFoggvdBfGWF6m+zYDo+yMUUp0eh8UWRiWg2t
	yFYnvenjA1x6UXJrNtX2k7y9YC1Y1cqcBCSbicZF/vyjxjAMlE1XvrGPBLZ6mjwMwXQfZPCanIe
	2uDsUJapShwL3j3nBo0oBxA9gcxA5LGapjFxS4XCPWOVthXJkb6gsR2nzn9fVXJaong6G+Qh9FU
	3zuIR/OVrcYy0QQ8ecmEFS/PUZ+EDhHfsCdm6Qw9/dbXjqYcA4iWX3tThQEXIj72mkpe8sXub2o
	0I3MYe/+vMefxvQLjacFKbitngsKvkWHaq9n3qw9MxvFoDzIj57IQ==
X-Received: by 2002:a17:907:ea8b:b0:c21:2c32:e2da with SMTP id a640c23a62f3a-c246a5f4515mr470788666b.8.1787296346819;
        Fri, 21 Aug 2026 00:12:26 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add Himax HX83112A support for Fairphone 4 touchscreen
Date: Fri, 21 Aug 2026 09:12:17 +0200
Message-Id: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wqDMBBEfyXsc7ckUWzqrxQfknStW/DSJIog/
 nvT6tNwYObMBpECU4RabBBo4cjjkEFdBPjODi9CfmYGLXUljZbYTiV2qymU0hZdQao06m5zQJ5
 MgVpe/7pHc3Cc3Zt8+jnORqDPnH/SUQNnI6Ef+55TLZbbVUOz71/IQm0+mAAAAA==
X-Change-ID: 20260820-fp4-hx83112a-b3e14819ae14
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=797;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wAYifBw4LrLjWPQLRl35hYzVyfpBjeQp/AkgYLUI3gY=;
 b=2Dj0qb8NpRFvmLKwoYP/zkmS6yTYwg+eM5kiBlrtWmCLDfScI7wglxoxFsEke4uECD4sUI0BF
 eFHZvO/aQUsDuuNZzHcfBJmTSXU84048+NdR6JfrehzNS9Ya3cqXdiL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings, driver modifications and dts additions to support the
touchscreen on the Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: touchscreen: trivial-touch: Add Himax HX83112A
      Input: himax_hx83112b - Add HX83112A support
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable touchscreen

 .../bindings/input/touchscreen/trivial-touch.yaml  |  2 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 21 +++++++++-
 drivers/input/touchscreen/himax_hx83112b.c         | 46 ++++++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)
---
base-commit: 237a1c39e8dfd3e1c6f1f023eea37a48ec04cc63
change-id: 20260820-fp4-hx83112a-b3e14819ae14

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

