Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9854772B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462152; cv=none; b=bs97N3JRkZihKmQhlV1irriIwDEqkw4DI3PUGoTzqeRY8AIHEvSt2LTuQ+sLajYrb/zrAsvaT4SNKfVyxqQ6kIR9rliQBfI7+YVyrxxbAY2tAn9qNbYlipfaHlPfYym0TwPCOf5yr/PQ9WfdcZHsvAKIBC+99P7V62o1x6GVo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462152; c=relaxed/simple;
	bh=a2V+I7UeXRDj3lHU2NGFDjdBIe3drc9UQsymhMr1D/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGwzRysCW3MlaXW3+fr4guo3dZ7HGgR5xDnXogTVr9XdbzCh+YOK3XfKXH7Zk43aCBhW7/2SbPwUZV+ZRQUaVHZvRd7PFbpoJMeZ0GC/hv9SSa8C5SHMqKxhX4xVWUA6pJ78HdTHg/FbEb6bmcCy+WHi0gqF2T7pYMMohW2wGEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSeuqfoh; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSeuqfoh"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so6299666b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462148; x=1790066948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC6zM5DNH7SSIqqjxl1MzTwo2sU+cNMvlHaMx4m2Zy8=;
        b=SSeuqfohJURUKjycap9F5z+aJZ7iCSURdtZibOyhO3hvCOFyz41lmLRYwcTVgacVfC
         LWfwa6nTCLi55gxhj2za/c8l5u7sAb/L124ZcgbJ6+jAVHj1zugpuEtItf8tEzFazhnL
         2LuEaQn3b6q+6szsI8r6B5dokeyKEebIHpzXikm8+p+xnl324MF1Atz/Mv3MECt6pxZd
         +SnA3w7DKZQpXGDp7NEATbcX2S01Si2YUc05+61Uk3yfpYyrkGW9vibGEopCr6Iou2aO
         N3UlDj/4nl1ynntXmx+mXslHCYIyKcm8teM5BuSAMB1pXjK5qJ/9c9KnIu9g1ihIYZWP
         RV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462148; x=1790066948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC6zM5DNH7SSIqqjxl1MzTwo2sU+cNMvlHaMx4m2Zy8=;
        b=lw66luemfixhxeX69Kqt5CUZPvC4TePp5W9IKJAUu9nfvbgSC5K1DHKS/NwY2KhYW1
         B6XM7Oll0eERZHfqm1kvHJaGkdGyeqYH3i0rCvkO0IiNmL7rOQNHyJufLhHyEhtHNBmy
         eCkaMps9k777RM3xidwTa2SqbXcH2YLvEgok/jULw//adWRphmPGhXsRB45hW4veKg6g
         v7E9EmCwAKHXrgX5ieVe1kagux6S0U4Mol/UaYNvWrl2CiLtv5tPO/o6g/X7EJ41QO3v
         0JktbmhWNmgoph4W4dy0eLRs2INLPzxr7FAbjGPJuW8q5jXfxjAvjWa0q1qy3oMShGij
         KB9g==
X-Gm-Message-State: AFuF++lS/TzgEybtFFEb6kz3MaciUBeNghbONYVtDxYr4SpIPO6DBpi5
	WF4LiawlnYy15f5jbJJrU5LjF5Qdf+TnkIqffq9/p2YvjYuv7qn8iv4q
X-Gm-Gg: AYBFou2s7+s3dEjEPutIhIglwcL6SmfyJ0xl1jfZzVwGwfP/J6p+nEPXgTFsBTwAS9q
	SzOko1s8a6pbtDa9p2Pj9KRNFWrO1UfvymteVSpm3TM+487N3Pl9nQ2bcshRc3Owc4Ax6fu+Zi+
	lTwFqCGQXR2Rhu3e3EGkvRJhRYOawWE0M/0JLFTFn7Nd1/+QNfvzOvbPGIa5ZYZy4mlim8+NcVH
	2eK0068XR1AlWy3E0lOAtHqfwAAIn9iLo49g4CKJw8/43xZvOYxIN9o5JU9ruarbHmqHmtaddK3
	w6zeIuq6D7pJMV6zEc5+G5lRQXVlbqTsed452M8QaD7hzqIEVrIWkKc3KoLBoT5RJLppAB7N9cI
	OjtWQ+i6oIKThuh9iU4P1MCIbzA9dIKqsIOxeMBUDt+qFVGd44G1pVKC0Lq2Y8lrBtHuRaGxE0D
	obhFffGWF4EqWB1fdCYAa8wG3tVs/AwY2R3cRb+xksxRikKF2IGDIGJKOnRJBu9M+7iCXorx27N
	xPdTWYN6NleyWR85j0q5Oq7Us3PQ1vS
X-Received: by 2002:a17:907:d25:b0:c29:56d3:65a with SMTP id a640c23a62f3a-c29d792b30emr12532966b.33.1789462147841;
        Tue, 15 Sep 2026 01:49:07 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067101sm552702966b.35.2026.09.15.01.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:49:07 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Tue, 15 Sep 2026 10:49:01 +0200
Message-ID: <20260915084901.56622-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915084901.56622-1-zstaseg@gmail.com>
References: <20260915084901.56622-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
qcom_battmgr can identify the device and apply its taoyao-specific
battery property mapping, required because its firmware shifts
battery property IDs relative to the generic sm7325-pmic-glink
firmware.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..bc4dfa49ef38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,7 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.53.0

