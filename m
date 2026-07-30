Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D623E1226
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401669; cv=none; b=OyPIsqQ+PjUXmwY4S4uFZ85axkfjBbk8rB+Ac4yPnORO0e5Vkr4sMGKhdnbDLNjhEuxDB7Hzrg58DmPwun4O0A59G5g7cjdBcmg1h6KUCXzCXX+IDBEyf+H8GdBEwIb0IO+PxRHer7eGDMk7swfUwQfezHdcXR9FhIInf+RTaD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401669; c=relaxed/simple;
	bh=Kvtuszz3nRa/+IdlvXfvBPOMgtFAA/VHxwZTL40appM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pC/KIAISzruAyPEDdsgC82x8Nhs8SmSr0uGbM7R/xfBfefqL1fLcMBZ1PNZgufhwQIVldtq65WYL8M7SyeumH0MIc6QmSQ0//HYceoETCOH1KQsrk8MZoFCDSsODDOx5AehsM0sZrWARW/ajcACf3GjnumQyYR8reZfgGmTNRaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVZbkArH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVZbkArH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c24ec9525so320713366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785401665; x=1786006465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=216gNUt0ekkJYFeQoQEhN31HOLBnWymhqc9D9IgKUL8=;
        b=eVZbkArHaaw5H2FCbLF59eYWc0giCJQUmhDWt+vsE8RYrH32pBj6a42jWshXl5RcJT
         jhgm1B0QfKsrWk4Djy4mtdSCLy4aLDJgYC0Aj83GIrIwc9bJnGtJbdkj9hO+fhokOWhR
         6+vYy2iLMRIKbNFvRoQoVpj+fQEqKXS58pCIW5YM2vBZLmdGwk6VVXKqywW7zjqt28J/
         C7z9sVg3NYIXaZ88m/u+VIPPgR20nVivd2KQnty+Lubj2MAiwW3eMp9np4h2xp7XyNoV
         ShP9Mc4eUQCH2zyX+XlITP52nCTfXv175h5ehNvZpdhuZxwUXpYpxQnljOFsZSqPWsj7
         HDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401665; x=1786006465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=216gNUt0ekkJYFeQoQEhN31HOLBnWymhqc9D9IgKUL8=;
        b=I28T7ZGha+Y6D7DS58SJXVj7zQ2Q0UDZDR2RnxKFHyK+RqJyQqHIeNcHVsrsGNvF98
         MInNPJIQgI7tdYG0LPQieWH57GcxoKWBaCUTdNyCa3fVCoxj4P43YboXBSLbG6T8jvNg
         b6JHeT9/OzZytvCou+wmJxRqiJLrK5938otA0pRTP4FuM6KI9pFGC0Gj7S81oDQYxUiG
         BLCUGLhoghIhFZ/yHE9rYbCd8csgv7PCbKsHTvtOOMexAvpfp7cWobnK/sV+q+Im3Ak1
         ALFWkz3I7fBCKaQJ/rsLLBss41RcJGvCEYa6m+M9yQj4F4Rj/9/CwcTG1/xWKiT0BpZx
         k9og==
X-Forwarded-Encrypted: i=1; AHgh+Rpy8m+FKCHIaCpSRZlMvV/gW8LAkw1cRQbdDX7NCiqKloQpqJhQivcdFGGARuPX1ek6g6cCooWkkoN4Snlj@vger.kernel.org
X-Gm-Message-State: AOJu0YxTumsPHYIEh8l23JWMjgVF0a+LsUoegCit3ItlvtJ7MPnAG4eB
	LAAOnCeVtroTHYpbFTm07NenMF6uUM/9DO+XG5JjqzIO+uXloFG1gXyg
X-Gm-Gg: AR+sD13VKPu3BGxVHeKY/7TUR8V4v4762h85UCoelzvbIyrRTCu5aIn0XvE4czWb7ns
	HduBM6WEjoj/DgMJWUA+Ce6eKBiMuZtBePR6A9HmvvkvKc5IPKs96X5cuGpY1c1pyasWItFX825
	SpAakH5dCOvOZmxYxShmhmj6jLLfx0XmsnUrwBKxLijYCj8N5JlrD0UiRzu7o2a4yicgVcrKjQb
	o5J3cakCC/WY2GgStaXyT51LbLxSxd9au1iRioFZMX35uXmTsXO3yvD/5dNuuTeQsI5ijF2M+Y6
	cP4xd/zMv4wejNM72gUtSpTQX8b2Ol/ISEI+dj5wnNzQ4sC2V/DfBzeWmp2KEPgW0toqEfY/Lih
	1W+vwXb46Las85PALvj8162kvpOQ2ZpkQNDgLqsgkbI+AqDxspFgyz9FUetsKXt9Se71a+a2gIK
	riCQ/9HQcy+8fRWo8NiIDI0JdSJKZYaCiUMNueSTqQVK8N8lOOH3/tuT8LuEsVeH+7dO6LVIktC
	+OXhr8gJ2EG8wknUZc6dQ==
X-Received: by 2002:a05:6938:a08a:10b0:c12:96af:acf7 with SMTP id a640c23a62f3a-c1fa574388dmr61198066b.43.1785401665319;
        Thu, 30 Jul 2026 01:54:25 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8beda56sm41603266b.55.2026.07.30.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:54:24 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH] arm64: dts: qcom: taoyao: Drop adsp_rpc_remote_heap_mem override
Date: Thu, 30 Jul 2026 10:54:21 +0200
Message-ID: <20260730085422.631896-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

taoyao originally redefined adsp_rpc_remote_heap_mem at a fixed address
to avoid overlapping with cdsp_mem, since kodiak.dtsi's version was a
fixed-address at the time.

kodiak.dtsi now defines adsp_rpc_remote_heap_mem as a dynamically
allocated "shared-dma-pool" region instead, which removes the fixed
address entirely and so cannot overlap with cdsp_mem. This makes the
override unnecessary.

Remove the taoyao-local /delete-node/ and static reg-based redefinition,
and inherit the definition from kodiak.dtsi instead.

Fixes: 28705df5d0df ("arm64: dts: qcom: sm7325: Add Xiaomi 12 Lite 5G (taoyao) DTS")

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..87f267aaeec0 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -27,7 +27,6 @@
 
 /* The following reserved memory regions have different addresses or sizes */
 /delete-node/ &adsp_mem;
-/delete-node/ &adsp_rpc_remote_heap_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &rmtfs_mem;
 
@@ -203,11 +202,6 @@ neuron_block_1_mem: neuron-block@d7f80000 {
 			no-map;
 		};
 
-		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@e0400000 {
-			reg = <0x0 0xe0400000 0x0 0x800000>;
-			no-map;
-		};
-
 		framebuffer_reserved: framebuffer@e1000000 {
 			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;
 			no-map;
-- 
2.53.0

