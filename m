Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C813F54DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223846; cv=none; b=IqAVrbaARGLfkt5vEOwvU9p6gvMnQPFvxwvo9oPQ+d/5bBWy+3JpYsJo8yzze+IihUVCva5q+cm76E8mrnBNdsI5ZiCui5dlgB1/VGZgF6vAqt8o2yLtRmQkoodgEObfwHbLSYR2hazLo7JtgzZnDc5vd0MmdeZZvhcWey/xnes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223846; c=relaxed/simple;
	bh=OW1itF3pW04ZwcOtTe3C9hR1GDukY9eaIRarItB6Cdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xkj1eXCjrQsqb8S8WB9oakBBLopT4v+rSaFZ5s9o0tbVa51xADvUE7LAJ0mIP99I+V7RWmTxKCBC83POoZSaqt+ydhYIHp6P2BEOfH+J4AwIahpGqHg/1+sdDO7JV/t5EZ/9UiCCqB+ihe1xWiPTbz3D9BtdXC2j8M48V/vkoLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9vAOiha; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9vAOiha"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca80d708489so533751a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223843; x=1787828643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=89O3yIa8FljSyPfxcumxQ9/l44h1IUXkEORh/AimdNE=;
        b=G9vAOihaUZTgQZ6UzZkxXKMutYOtScbinxZSsBUa7yEeWMp/j15/ECJHzVFVL3diiw
         M/PV/AlKgCGgJ43pesySRv8gCC0957Aj0OjguKIpzXUJmr9aj2jlW6Ml22W4aUrftk7G
         Fill+n8BLiwVGw3zM5gwxcEEuFfdA65XfUsAQdbfXu09nbGuqGGvGsXBlJ58U+pnzvby
         vz14uAhv6JQzDu9wSRq+qpy2LWxzJPb4p0oDBhUDvv/lBxz4AE3EMZvNDwbney4lHJoD
         5EUKA5U2TSR6D9tE2XPxSxFWj+CgQbwhnfhFhQOURiTrcv2jXHL24f3OmGaj0i/0WTvX
         Wc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223843; x=1787828643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89O3yIa8FljSyPfxcumxQ9/l44h1IUXkEORh/AimdNE=;
        b=YgzUqK2Ppzop3XTvE5fk9gkUwGsGualVbi2kLFLovk5QKv4ziClzgPYJtmqMrWj8Qw
         kWSBuTJ/p+hBjf2oJa5Fn06n3XYHNljCs77Qca0WnRJxrMxzKVN28RTbawfxCwC+EpWw
         txZ6JjSr7XBREIxQU+JOVEld+PE1B/jRYj0oFZNyr16wiYFhq2xbIcexOwqVJK1EVseN
         3mlTxA2fjJF1w0Jr6PLMFPnN5+dQykqYC1QlYF0nfHazxLMDgnB3d0KxoueLGCnasiHv
         qzXSK42tlKz0A6gW9ZVAK1xogSxqGwBoyLbzw5l5KANpl5nnr3tcVxlo09a0T6utu8xq
         6xGw==
X-Gm-Message-State: AFuF++muN8S1MOOb9a+GXh0mfJu+0abxOJMjeGTkgnpz8AVSSp1AfgS0
	BUTZnrlL4ZOZ+dMbBciJ8Zai0okO0fJ5IPCUMkdniNh5D+VXBXI6F9J6
X-Gm-Gg: AR+sD13Gnl9TmxkWQeNCACdY46wkYKCHXDW5qBR3D37JqKZ55k8Car4JRpTn8n15avm
	AZp7/1H8TZjOvNolpfQCGT/IGrAiw0KEbf7N7lVYKjdTsQwHBgbCJ3Za+3EffZ47ogjPOv7k/yF
	Ofdt7RZtCeeNagU2mk5fLG2a59SQZouneMUrIWcKBzFEqHIBWe1peksaUwqndXXPpQC+3fnYLoR
	p9R/aIBRK3svsV/K+4jUFfjg8hx4Jt9pBklTCUeta0hUitY7CqyijWSPzSDzBbaFvfl4baxlhss
	DsYXiYx2rwSQvWs1j2dO/6KfM9s1G/RQRRV308Lrkg+q0LUZRGpmYKQOloO8SbfmdD9yRR+qQBC
	cleG15+eXh4YG3P6fZb7u+piGjqSAAp28Jjl3Vd5NvQ6LxYSHibbXbnZYv2x7FlxIUBlq0VpEqm
	jCvMuDepfVYIE5XHv34/FwC5GPLc3J0KkPMs4fmDz8VRjc/NnQtAA=
X-Received: by 2002:a17:90b:4ccb:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-395a06edd3bmr6114006a91.8.1787223843243;
        Thu, 20 Aug 2026 04:04:03 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7015:a156:d857:47e6:8c8a:886f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6200668a91.4.2026.08.20.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:04:02 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: Refine device support for Xiaomi Redmi 5A
Date: Thu, 20 Aug 2026 18:03:44 +0700
Message-ID: <20260820110347.98068-1-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
- Simplify commit title
- Add commit description
- Drop redundant status propery in LED node

Changes in v3:
- Add vcc-supply for vibrator

Changes in v2:
- Split the patch into multiple patches.
- Change name in Signed-off-by field.

v3: https://lore.kernel.org/r/20260818093548.27803-2-imkyufie@gmail.com
v2: https://lore.kernel.org/r/20260810105337.855546-1-imkyufie@gmail.com
v1: https://lore.kernel.org/r/20260810062611.735673-2-imkyufie@gmail.com

Reza Kurniawan (3):
  arm64: dts: qcom: msm8917-xiaomi-riva: Enable debug UART console
  arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO haptic vibrator
  arm64: dts: qcom: msm8917-xiaomi-riva: Add notification LED support

 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)


base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
-- 
2.55.0

