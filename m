Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19474AE8C2
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844776; cv=none; b=B+zbx+9kCcMRoKYvRW3M0yyRbj/nhpAEdldBg+E8v4K4fLwwXk7oinZ8RgY4JFEhrJeLuMbOtTkcLrh3USzjGDgIUhGAK07o6Ao4zkgiIWmJNM4z6LSnyquQIUHwP/kjDpeAdKBsJgGjF/ea9MkADkjY9nEeiH1IKlmTz0xf2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844776; c=relaxed/simple;
	bh=Y9yhMCMPK9PruBiJ6LLN0jqdCuRUWCX6MRlxm3UxClk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gB/EweBa/lMSX3ihRUmELQfpeSHOy+PB4vnyYdZhW1mbBx4OXbP5TE1WIO3N5WYop5RN2OBe6J9hiOAjHmWYMkE9IPmAvbrUWM6Y+MVLhznqKNCXxf/nEWFHbxuTitOdfIbO/IGi550tWraZjHrSmbaeW7WySoamLzPW2wZbHQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wendy.sh; spf=pass smtp.mailfrom=wendy.sh; dkim=pass (2048-bit key) header.d=wendy-sh.20251104.gappssmtp.com header.i=@wendy-sh.20251104.gappssmtp.com header.b=hZUvRIol; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wendy.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wendy.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wendy-sh.20251104.gappssmtp.com header.i=@wendy-sh.20251104.gappssmtp.com header.b="hZUvRIol"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so1058631f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wendy-sh.20251104.gappssmtp.com; s=20251104; t=1790844772; x=1791449572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZoHLp2qEvUU4qcQZHZqw/kSI80wjja3vkqgsp5gvpnQ=;
        b=hZUvRIolB3i9n9hDbgaKj22rKmXPO5fsvbNjVF8kgAJKEt9GW5VnqpciHJkxVjiemz
         hn+yxCqgccnfcy1/MzkQjpfQI6uNdgeNskLHMUvhHlmujvlui2vpgb2oOoRWv7A4Y3Zc
         5E5W+G4fod5Ncy30PaEM4uVg9NZgAUawn/etf6HMmo6zSWsdMHS1lEryL5v8ZY7tBjtm
         AVVgayOZ9mi9dIJUwvmEjgi947qOH4cfoue6J8Do73+zjFJNScTBBW+wlUMZqpMl6b5i
         kAsjCdWxJ6NGx0I0ElB8KmJPQJgeP9a91cxwqsyqE44R6xjTDrS9yLEbJqmdkKqe6KwA
         H9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844772; x=1791449572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoHLp2qEvUU4qcQZHZqw/kSI80wjja3vkqgsp5gvpnQ=;
        b=ZEMu8YJQfq4PTswfovXaAFwy/l4GKsAXe617ceawcxjcZTpS3E9wp28GRWvS47SjqR
         Qq3ABZOnEqajrM27oP1jNqV2YH+krU1/n/5rdLZYIDM0hUl2StHyMrXsZEcusCb74FrN
         8DeFJVbywWYptmnZ46igpJqD7bkGQmqRMrlN2vVv5Im7drStD96gKLGslggiOqmWXebh
         LbSc2idPSfJ+/itzc75/CBnyWOeGRbwPZ9FJ4z+eCpxKm9C19IqAO5IE5swJ7d3yw9gy
         zeVyG2+KR8eYdVeA5qK/Iqt/KimNWuW8rC4uW+iLBsrt/MM3NUOU9BkIxNWQyjE3W05y
         6lUw==
X-Forwarded-Encrypted: i=1; AKwUvByjHJHCH8a6N/cWYPOhIE7GQvh3ANmmAZpgRWolyxiCXsYq4pveX/cLAihfvYfwY4n3tVG5o5GIiTUbyLvk@vger.kernel.org
X-Gm-Message-State: AFuF++n4RcgbyjeFzOBByApZVMFEDUKPmSOpM9f91gciNE+dAVFU3wiT
	jFn1dlLns3BIvVXoIrsAGQ875dzLXsn1ChCTUMEGXXuVrKfqgZSimvLWqzACfXwjcUc=
X-Gm-Gg: AYBFou3ygbGfO/ihAHz0ssr9KSr9UZr1Hw1ztGV8K2KleWW8Kfzxo50PcNIMvRHG6kJ
	y6anoHdI0166gcUhx9SUtj9rviit9NZXKTJ4dfMAL2m2ptxd1lENZyXQnMBmM4QwcCoqAvCCh6r
	Odc+FKBCArdRwudA7XbaYzjvqxoKA5NgO8ZBvAiLkjYPHATefL8yLBx5uHEgxFGkQEC9xQKAmIB
	dI8i2v323aZynkjDBms5SFjzYbXoNlVcR+zZXdOCjrSLgyS0qrWa9Cu2KbY8/M3Y4MsRU16X0Sx
	dhJVfVnGkGc3DfjEptGIkjH6mfzfrTEidreLxxZR0l8J2U7wh9zdGtFf3/itr2HiaKpG7+hqqRU
	yXnvryc6oxmnDA2rqmDTcmfvrT9yGZ5/nkLQNXDqpI07d4MRHh0P33xWa6WY+UQO0f5VbVLyU7g
	r1YGHXkkN99h49YW5GbjiaFErhBLUCEwwjFtAZmVr0oZq0himiiyUbFOMB/qKy4CcP5KmSqmNmn
	P3PWSo=
X-Received: by 2002:a05:600c:4745:b0:4a0:1e3a:411a with SMTP id 5b1f17b1804b1-4a01e3a417emr39422725e9.1.1790844771644;
        Thu, 01 Oct 2026 01:52:51 -0700 (PDT)
Received: from bke.ddns.sjp.renault.br ([5.2.196.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f979f4fsm55556345e9.4.2026.10.01.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:52:51 -0700 (PDT)
From: Benjamin Kelenyi <benjamin@wendy.sh>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Christopher Obbard <chris.obbard@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Kelenyi <benjamin@wendy.sh>
Subject: [PATCH] arm64: dts: qcom: agatti: Make the ADSP remote heap no-map
Date: Thu,  1 Oct 2026 11:52:47 +0300
Message-ID: <20261001085247.1897991-1-benjamin@wendy.sh>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP remote heap is declared as a reusable CMA pool. The ADSP has no
IOMMU, so fastrpc hands the whole region to the DSP with
qcom_scm_assign_mem() when it probes, while CMA keeps lending the pool's
pages to movable allocations. Once memory runs low the kernel touches a
page the DSP now owns, and the board resets without an oops.

On an Arduino UNO Q (QRB2210, 4 GB), writing and reading back 3.5 GB
through the page cache resets the board within seconds. With fastrpc
blacklisted, or with the heap declared no-map, the same test passes
repeatedly.

Declare the heap no-map, so the kernel never uses it, as the other
platforms' remote heaps are.

Fixes: 3fbf3b85bf86 ("arm64: dts: qcom: agatti: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260908070331.2189A1F00A3A@smtp.kernel.org/
Signed-off-by: Benjamin Kelenyi <benjamin@wendy.sh>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index d9f4cbf..3ff97ea 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -385,7 +385,7 @@
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x0 0x1 0x0>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0

