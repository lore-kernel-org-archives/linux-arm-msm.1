Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4583A9D8B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855124; cv=none; b=Bk9RMj2CxSm9u2tvqcIJowsNqQ3OkOOI8dGlhNuf8Z+8E670XghTB5dVS6QDZpb8zlDg+fm09h154fprD9qy+t9zV3BoV+BIjW1bfSOfNjqts5nc0M9lkagdOQZ10ZL3u3Jj4XGENQMdn+LqizrCvw7MNq0njvDWjiCSurBJFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855124; c=relaxed/simple;
	bh=Ob8WeoXxpLEJOGu3oc5akP43eFgM38Bg5bmqR1LkHEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdPtSS6v2bOZGusPdelrrW6LNvsZQNyNAWyq98K8pnMdkZKZme4LwnbOS5CpPEh9q6HJpziEihNa0NxyJgVaZvAHlgPNiDrtaOgLyuzdxLPzzAAlL2BS9EotZkeN2I5A1ityhct+bHr2nyg+pYaeU3da1mExbKVOA9njFx3zh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy8iBNSr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy8iBNSr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2531f453eeso598142266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788855120; x=1789459920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tc3w/tswhYMPPzbx1rKOX62Vnkfmu3CgvOLefEoDV8o=;
        b=cy8iBNSrktXaSI1ITftqan858dQSCsj5a/cA97C696Jxe/BJOYbKBb896pblayp7hF
         raYQuoXuORLM0HjSL89Ox/ikKBB+XNUY6yS1xNLxti1KLKGEJrCNREkpsk0aKeCJf87y
         41nCVN/yH0WTGSa/C2oPrmUOFXCvfAyxaGKl++7Y9xYiEmR5nlPpfne2rOuky7Y/QbgL
         oQMIvcVZztSZMGmO5QTL9yVhn0Zd2aS42nev5sNl0d/lKRWU3WVG1UOmfS7WwsMXtFY/
         qytrOw62T4vScQG2SJbAnzR+3Ah/nSvDWEmF6rEob5SPv068sQbRoXLaXALtcQKArppd
         La/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855120; x=1789459920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc3w/tswhYMPPzbx1rKOX62Vnkfmu3CgvOLefEoDV8o=;
        b=RF/luDjkWvM24ATQbKBzNkRHZhtlQT/d4bKueR5LbDILqbaJpwNXDebdzuL7j+yPp9
         jiUzekdEjbU076iaaPw70c7Uo4Hm/k3Dn7X79tersoRoMBkrj2GpaFwN1MI7eVbMpTQd
         kpZd54VT5UlSxOVar9k7jEbYxR/4sVMqY98ZfNjvUtYMdBG9jwEnGwR8ARfnlEHdqFNT
         OYkYWURDxx7vwkoQwc0m3dhH99RqsOnYRl5T5c/vt8FohWlnNEd1G+eDFbU6KKGsBpRI
         Q9LbbrBL9CjJhZYJpQCVt/VagpWqvdVtQldoit5xYLsYCaQ9hbd9qAQGxb1Esjo1pKCe
         H/+w==
X-Forwarded-Encrypted: i=1; AKwUvBz4Olc4YbXEZzXHxbz9/wx4JIgMK14RBXY6MKxRvDIQ3UxR4yW8kQAesyWrDs3vLdlTm/z4lc8xPZTJZRZd@vger.kernel.org
X-Gm-Message-State: AFuF++kJbZGCNHBcMKlsWGGyn19FvILUciiHKQsVhXtlyxous7zVsxhr
	GOBG9OtQ4Xlnu+w8ou39CqUjPOQJP+CL9Azf0m7WGTnkEKONInjsFvgT
X-Gm-Gg: AYBFou1MI6icrR8Lwyhe4BuIJ8NrGdamtL7A3VoXYB6fKJVb6nUUWYBNTU/9KkMYWFt
	g87/SVwnHrbyQkvDewGd87VVMuSN7EhGFOhETYa9gN9sGDvfTR/4vp/VCVuHD7YVXOXv1dvwsYt
	jPgXrmEpGHaj4c0TQJKX4tCC3soaOsGlfeI3NVMaQmw7qkbhKPpubipITdWpPzn+kIEyTORUo8t
	qjXz+zbNZaMlNmjCkLqMiw21a0NQWbPd+B7Vtwn6TD7pF3ZFugnGxFsP619nIRn+bx01Gw/maI3
	4mqk0DkltpuZPRoICyQj5pYWJu5Cp/WDVEvpixQSRfZpLlJ0jiov5KIo1km3xxcjRVY+vwPWwyl
	vanpA+LLqQP4gJg76EjFQDCP/NbG2ogojzCdAlCR+6wDkoYpuknmUe4KvfZ+KpMLKVr7SLeqkyT
	6kYZ3mVrcM3AskkFFw194Ad1beUXHUsjrC/V5ZzU1wp3ex25IfVU48CC/zFwwVawaSCuuLKu+NU
	sWiIv1WsA==
X-Received: by 2002:a17:906:7308:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c260c8e77fcmr2227127366b.9.1788855120150;
        Tue, 08 Sep 2026 01:12:00 -0700 (PDT)
Received: from localhost (78-3-21-163.adsl.net.t-com.hr. [78.3.21.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261f673000sm490389566b.24.2026.09.08.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:11:59 -0700 (PDT)
From: Dmitry Sinyavin <sinyavin@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: qcom: Add MDM9607 APCS IPC
Date: Tue,  8 Sep 2026 10:11:58 +0200
Message-ID: <20260908081158.2399852-1-sinyavin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MDM9607 APCS IPC register is at offset 0x8 in the KPSS global block.
Its CPU clock controller is in a separate block, so the existing MSM8994
APCS match data can be used without registering a clock device.

Document the MDM9607 compatible with the MSM8994 fallback so the existing
driver match data can be reused.

Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>
---
Validated with dt_binding_check, including yamllint, and positive and
negative DTB tests for the compatible string combination. Existing
MSM8974, MSM8976 and MSM8994 APCS nodes also pass schema validation.

Built the APCS IPC driver for ARM (multi_v7_defconfig) and arm64 (defconfig)
with Clang and W=1.

 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 39bc374300c3..e87373054d76 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -33,6 +33,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - qcom,mdm9607-apcs-kpss-global
               - qcom,msm8974-apcs-kpss-global
               - qcom,msm8976-apcs-kpss-global
           - const: qcom,msm8994-apcs-kpss-global

base-commit: 14af7a96afa39f4f3c1972705489b9ba15c01857
