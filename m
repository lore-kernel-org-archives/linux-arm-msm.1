Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3CA514757
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677928; cv=none; b=EXS2N6Ek0D4g7Qm880HtqrDGJeAS4csk5qj6RB5jAL1CdiwRTRY2wGGOLQbWK8D2cWD/wEw5kae7koAH5nbWRJfQCCa6KOUSmwlqo5p4TSEpmaOx5x9OTf6NtSWGiIn+5FlXv6eOwyxVO4TC0osX9wuYUXcGYADDsrCfcpgXUBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677928; c=relaxed/simple;
	bh=ArQtZ+9cT8gS6u0y+rbtGV6l7T9LtDxkG5F67zh2qbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+jg1xctPfSoEsMpDK2/QBeS3wLllO9hDSYrTNLsEOfEfDcRUu8e8Pjsb3Ntt4tR+xInLIxO1xlKnjwISMcrVPIjX+Xu0+poBlutT6k6+G2oiLEttmhb7FSJEUaGrhrS0lg5e26/7oCOi0p7i/uc3F0BWBq7qd9mOvRu7k3EdOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adkz0bBT; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adkz0bBT"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2db425c8ff1so3171255ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677903; x=1791282703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gKgYa/panWCzY7t8wKelcXz5le9XR8NMGeIjQu3y4I=;
        b=adkz0bBTmbl+aNAMAWwPNelIdldyHnQrmqhkfOFHzNifJA4hvd4D/ImXavAgYmoQTe
         yC3pIWz+qMs/WjSk3EJcjYdDzmMhYa5QFej3LzcuuDzFf5SxnQbXt0O91HEq09z2lJHP
         Lgnly6nhU1vhAqZ2dfXmA69Pv246l08EYNjFE327oK5y4DWrsrGirggK0u8uPUzBPDql
         8C15kYaGp2132hnhcbObVv0JhOP2jaF+kO6x/aLaQnBpVZN5pG1adf9pYhMcpgthM3MP
         30yPKo4nJdoYtfFkrD/NtD4foOcRMgAjUMSAiFFSEasJ+0FABrewsKG5L5d5ScCJW71s
         7aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677903; x=1791282703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gKgYa/panWCzY7t8wKelcXz5le9XR8NMGeIjQu3y4I=;
        b=GrAWzYS0QBVO2SeLGeHAwz1HnxsOrM4peydzGs5ORcGP3Ni+ONg+Y9PrXvHIp7xT1i
         Qz+hFsUsmzlxf5opobWZQHr7ENUDYJj/TtIvDwMcrMt+sQIabt03c1hewB4IxerB4q6T
         n0ob/tZJbgZTbYNnc5XiXDYPddjzTatNt3A7HMQf+D5gkPzEJ/Edu7hGE/LVCLL+od9h
         CBTKOXTq/oPmSeytia+kGmvOJ5RCyjU/HAZc/r3ugAPKUHxvJUHvR6oAszahdiJpypGA
         tk+CYnqNXXCMXmvgHgKzyYNX0a84SoleP2QbeGHqLGhMRBqz5GI8KKxfUXqL4K0y7tmK
         bdOQ==
X-Gm-Message-State: AFuF++mYCC7T3SgpjeJQByqAjngnnUxQoTLZzp44AGiQRE51HFn5DxvR
	6ufLZPdlzexCv/R403l6nk3Gj1IQIJ/EHgYbix+8wbSQEspG4+4eZmtyFtgVdmRX
X-Gm-Gg: AYBFou1/7Wlx7DWbp5Kh1HHcKHOxnOuNUJcaBjguEv00WkyHArqzJkXf/USRrwB71vm
	fdACfk4plx0SLctN3sKGJASkxFqNsNWOevEaJiB7G7nm0+/j+hNrDvDBaq5rlyy3M1SKFe5rGoh
	z+QGgvrpJxdvNe9s3BDLlfi40wwdKlem6Tse6VjJB/cP7F2Iw6uR9OvUxrk8DAY4mN8iuXBoOrS
	VvD6xudxdzHiEeG+jrmuI3YTg+f9YmuNMBVB+in1gZStB9p7MBgO0PafwYUq+emqf7QU6dqS2G2
	MH7qROtsY1Ots0uHUNcExc9Qj+2dr8+29vQVy/vtmHCCveIjFXfCYfUyaOa6Rmfm/hBghotsAZu
	X9gSJDxPk6wvvr70OgMtVb4BjBgMjRtNGk04HcGMi/fs4GyVn5h1OSWEHSCUPwhWyY8goGVwSSR
	cV9+PnimjZq02TC2SEsg4WFWo5B9j1XLK+eUle43KAz8+Da4fJmHe7/unrBSFRtDy9V3QNoHoet
	Dv30k7+e7pLJw==
X-Received: by 2002:a05:6a20:e212:b0:3de:50df:7faa with SMTP id adf61e73a8af0-3de50df9a66mr11320741637.1.1790677903224;
        Tue, 29 Sep 2026 03:31:43 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5901239a12.13.2026.09.29.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:42 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 18:30:26 +0800
Message-ID: <20260929103053.10241-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929103053.10241-1-liujianfeng1994@gmail.com>
References: <20260929103053.10241-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E78100-based Acer Swift SFA14-11.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Changes in v4:
- Update patch mail with commit changelog

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e6b123ad58c79..651a89b258351 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1204,6 +1204,7 @@ properties:
 
       - items:
           - enum:
+              - acer,swift-sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.47.3

