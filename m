Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4636E468
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253144; cv=none; b=U3fthKu+zYuWy7YVtwALi3aLWSHWAW43SNz1NE0zAUqD0+z0HR69Qr/mpuOhFc00SzSrfLY0UjLItcca7r36NrYwIURhPr0YI5zXO3xBVR9fXtAuehLiTcrpkkGQ2ZNkcbC98QjZOn6Pu+bhB4CWFiynVM+Q0TQN7L+F4kLPBCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253144; c=relaxed/simple;
	bh=wUOmiA7i2EaKRUV+bEKJTs81gkHvhUOxBuyUyHxqOK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T2dML6HJX+ZdY/lySS6MO2OzT38GrPdlOM6cEc1IMN8Lr13R9bkRFYRMuhpQ3que0Di6iBC3rt1lWDJitkXUlX9cBaPVpEqsyEkEMzUcUtarhygBP+tuNxVny71nxDhosji9toXuK5qgSB1/k4gEw93l8mxAqvP457ToGvvdeWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=h3aOuCQ1; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="h3aOuCQ1"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15e592da74so538728166b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253140; x=1788857940; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5o+LGs+bBAm+txc6iMYrrNKuZZMfQFh8GU+2rXK/RU=;
        b=h3aOuCQ1Uu0M0ADm0IWukQ5Q63G0BhhDQXhVYQ4E+hSsQtUgOzqcfqu+uwxj51UaGr
         RiQe7QNrWUpq39F+gOmmlqHhAH7PF9ESldCUueVkTSf1S22v8xCZOBgOoUMWrnrvALEV
         KembkfItZcoVOlUP8sCM4qZqb2jwT566bd4eAlHgI1tkUFmNCZ8LZ4Y1s35vMAQt7eFT
         2HFINOEmb11T3pasU9sF7AsT4iJ9SwdO9LMZwODx0+KnAQgetdKfCtzpwgBGaLYoE8x5
         iwBUuAdMtjEsyt+xoGuRYp2B4tEccE84j/QmaTGAyXM/dxtlSShxosj+cHt0j6WlLlkW
         Lq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253140; x=1788857940;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5o+LGs+bBAm+txc6iMYrrNKuZZMfQFh8GU+2rXK/RU=;
        b=XwMbZVpzbua/6ynRy0NKFGmHJJVC/DTrS+RHDTSmR8+XEzKJ5bbLcCT6ZWm2oTqN/7
         f0Tmpj8dQMVpJxVtoBlmRQ+zyTCQInlUsyYsacmAFA3D9jc/zIqkPtZYIraqp82jTcib
         7OiAA5MbHLlBn4WNCOd2LY0jqlTcLw5XIqE7+2uj/0uab4NNEbEDfXnos1fvP/uX6C5t
         1IeWiyW7tPcIVHzQL6EVNq8fR3JioSk9LF24D1JxDDGCYeVG7WQtcjFBsT3+AD2huIfZ
         xzJXizEBrsgbYb7h5zRsvY+/ENqOY0sg8DZkO+7zMVnNek8006rqOyGZdyir90Ybb8eU
         EEmQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHIjEEivzXit6kB47GNYZLo2GFfWkoyCFyRNZyZeOZMfaG+TqBpoKweFuQT+sqE9JfcBXTLsmPcS6nE6WD@vger.kernel.org
X-Gm-Message-State: AFuF++n/+skAP5nhv4FdGMGJdc8b9ZI9SngXSSFssDEAXY2TcLBFBz1r
	zyuLYsciFudb5vPwGya8WxV8FPZkwR4cf+RXI34gIyewBED+rsmPkdJZOSpUQ8+SI3k=
X-Gm-Gg: AYBFou1GhK7XbTHI6guz+t1LdvohszH+vLfbpyQcmhseZLs6G/ayO4rdOSu4kzHfJHe
	qv+PA/cPRP/Fj2W/suVX/k2QdOkxXfKnWMNFqIWylE1pGEo820vg3L8qLuF5bNcKUS0c+sTtlzt
	i0T4V2wX6vd/2IjfVZOZTwUmyGzjR9oqny6R5fAMm+8WiXHYfo4iYw8IHhZcJZiklIdf6I7DZFF
	vHy0ZLQ6dxmhHe/tKuh+ZFDAAKxizsaQjRmeBzgwLquJvYaRf28QXcBMiikzZBJDpoV+iaS4ICd
	b6YtFREsjm4Bn66HviO7uuFbjr4nC75+Ei+NrUaiA7abzjAHLAKO966xTybPYI21jdn5L8oVnZB
	2R29dxtuVkQdFl/QrvicSOVBGslkAwfzXB8yyITLqx23eu8P7mAYwWypN/nTdnqeJTTQDmqwSrf
	OgOiRPOCPYE48/xbHLawcM4aR5tykZnQzteFWc5F90OnuRdw6qwqSf/n5FUdUuEFVks241Er+VX
	SlhJ0EmY7s2H+Qw3xVJ5ihh4CXlRvy6UEcHTh07y+g=
X-Received: by 2002:a17:907:728b:b0:c24:680b:3944 with SMTP id a640c23a62f3a-c2557169784mr1987875966b.13.1788253140425;
        Tue, 01 Sep 2026 01:59:00 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add supply names for PM6350 RPMh regulators on
 Fairphone 4
Date: Tue, 01 Sep 2026 10:58:55 +0200
Message-Id: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBeoRTqyVxk7qEtdRLQkVjbEd
 1/djt/h/3cwVmGDW7WD8iYmy1xQXyroX+08MMqzGLzzwZGrMaYGlYc8teuiaDml6YPXGDoiYgq
 +gZIm5Sjv3/b++NtyN3K/ni84ji9W4RMUeAAAAA==
X-Change-ID: 20260901-fp4-regulator-supply-7f6b999e9624
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=899;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wUOmiA7i2EaKRUV+bEKJTs81gkHvhUOxBuyUyHxqOK4=;
 b=z2eqSalHbGfQjzg71aMZg7ujz63UIPZr2SrhpswnbsCCa14W27/nIzJt0iuISGhF0S2inwisN
 7Wb3f10VUziACsCVq2rcq+yvaJ2WQiuMn8q0Cm5JxWtP+/gDDzSxrE1
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

During bringup no parent supply names were added to the RPMh regulator
driver. Add them now.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      regulator: dt-bindings: qcom,rpmh: Add supply names for PM6350
      regulator: qcom-rpmh: Add supply names for PM6350
      regulator: qcom-rpmh: Add missing regulators in PM6350
      arm64: dts: qcom: sm7225-fairphone-fp4: Add parent supply for regulators

 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 16 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 46 +++++++++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c            | 53 ++++++++++++----------
 3 files changed, 90 insertions(+), 25 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-fp4-regulator-supply-7f6b999e9624

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

