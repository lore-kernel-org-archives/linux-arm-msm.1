Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706561;
	b=zRSnfXO0aSgGG1lmXhUyFkM8cpZcNEx9c/W9Mh/U4oP6lzWOl/x7N40BzzDk0UNcXyCl
	 NbsQ+BPGvW9peEp9UuKnaRGJzYhnwpqTX3FqoVtx9uf/wbq5+bAssa6OVrnXP8NeKWN96
	 SsAOhUqXehn8S3o+jFvGN2h6K0qq9SaevYqEJroC/eZy9goxPiG+KWSliLWTmgppdCGw9
	 eQz9XweaUVzhx5eSPPD1q7r3R+B02J4SWI8gXS/Pf5xDfFFBHiF4FIN9c0vwu5LcNnPme
	 3LZEhC8jgkWwfUwy+Bv7qNqa2onw/6ourCWHdva2InP56vN6bvQMXbE+1fM+bP1/Izw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
	b=NcV9GdsGRgcKZVr3YoRGpH9i9lbF7mZRZ8GHnVGC9Nj2CUYjVJMK+5Q9piCOSv5OHmhW
	 VgQz6mKC2HkfumTQHX7WzGprxnft+f9hNBJhDaOrRjI1jhyhj83WfVwULF/rSSX8yk306
	 acZD3zEiI010phq9ulx4cKPliGMZ3FY9fU1kTJTtrdSpPwgXbul+Ktyx5rkhEH5cKr2eQ
	 XIjYfqaGiFk0duRcTeS3zVbYX/XkUExdh7MosHOwc1jUR0C9B3PrcnJtCozIZzmuaA70y
	 D0WqFHoWOD28AAlg21ZqKpIHHS/ju43CSpz8KQJTZFFqQCkcmv77v/4VnM3fJaaS++Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDi+MWpz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A9606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E2A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDi+MWpz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so70962455e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706559; x=1796311359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
        b=qDi+MWpzqiBvWgwSOPcp5Bs3CfXNH+cOcpFQJSl+RIc6CH5tZlaLUj1iH5K63qXesn
         xxPWPzxoH/Wr5Zgo67x0S18ZH7SdnyDipqkJlh3d3WHtsWGsfRL5jWCgjcM74a3Z6j/u
         fSJmLvJ+R6LM6/dQ8p3lWoaxk3l92dSawUICIKmJCGh8jB/VRkeMjkXQOoMJGs8PPnR/
         0oAOwtmp18ownkufiDgF/vbNxqfSLg668cuFtmlj3rh5dDiVJN6e9zzGIlvtgVMXumqH
         h6pSoSsa+T4bRQpm/DodcogGBrdlC8e9PIKgqxrPNRCs5fzSCmFYmoucQAW6r9c8y1JI
         Prqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706559; x=1796311359;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
        b=Av/fecyutAhWveSX3BTqVEe2pVVUJYOz/N+Smb0ITmvUtmTW18LJcfDV/ARPfSNbXc
         8plYKNSv0n9xKexHefpCzXhRexgAsMbUp2wSxe0TPcI9XOWdexDfx/XLtpnU4sYkWjIJ
         2saAy1dNBq/X8FD66hYfbiYjaYxJXXq0xPvsbQIXD7jfdXJBmoZBU7TSebA73kncWooM
         RDKtdV7SpHaGoy7LxdKNh8J0v63Q1C6ZhToE6quDz029TfGI2mlmUnFZ8VrEXAoP4ppp
         F970WjLA5FCcYRDIIe2Cm9jI+b7CFTRgaewRRZL+He7dzQ3pFEhrozv0xQpb3bs4NJkn
         /PsQ==
X-Forwarded-Encrypted: i=1; AL+hErFhtZtsy7azMgUKVGE2lyez4B4QTGESGMl/TLnoDjAp0phvAAu4QS/9FmfCsO2T+nj7uTxKTb8Er6ttohK/@vger.kernel.org
X-Gm-Message-State: APuU4Z9D2EHiSZtDpu53E1Gm8a+fwoVsoYYNO++blTqgw0wwPEEO4Wq0
	WWui1tMDhSvdRl7Tx+6/qJPRGRvJh3spn8FTkp2IBltkmSXYkOOJSxu8
X-Gm-Gg: AZFdTZd7eDyk1P0BXPwsoX9ag13cODQJGYX3JnLhdZ+ELBZGB00e7CCp5AbB6t8kkFK
	5reoP6jtUaaHArs/n3O2abHS2PBa47cPQKVnKD7EnR7YNjDTRtOqwuDXpJ777mkgTBtQb1KfmVl
	gzj7Xe/uO/leBnSkq0TY34Aqi12tZrbuYs/Hb7GquuN5I5FFnPBGDzXSFoTBkU4WW4X5DOQpbn6
	A+6ZYUi8Ba3xmweSdlPQiA5L9YU8Xa2LbybP1brmWUucp9qZ7kPAjTaBBFN2C+2WbARL/YjHhD/
	GvOTzpTWUJZ4u+iNFV8Iv6K/AEU1rvKIynldztVooTBCGKNLx24eVxLhIPuCXdVADiWA+pfNvC5
	UjSQ5ZmXZ8KqA0BAKCNbRZS2kC198Smh2pay30z2FFPBxxTyaDqKzaGiJGWungjKmIGlYoOAQys
	XWGpAV+8ulw+UGcBWZwri1yoDs7e1T0azzvrE6No3gvdfWmgquA+0NBMcDQIa59G4EIjsl+BfFB
	5u192sMMbG5ttqbRBk5Y+zWci4GMBhySmu+rwefkmMAAuWFwVl4etgGIzTQTICJKhxL6mPyYo0J
	UT2oZ94Gfo6KO1q0VZiL32OXbddVILDT1I2EBw==
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr451013865e9.3.1795706559520;
        Thu, 26 Nov 2026 07:22:39 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:39 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] pinctrl: qcom: halliday: Add the gp_mn and gp_pdm
 functions
Date: Thu, 26 Nov 2026 15:22:31 +0000
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALdOCGsC/yXMQQ6CMBBA0auQWTuJbZA0XsW4qJ0BxpRKOsVAC
 He36vIt/t9BOQsrXJsdMr9F5ZUqzKmBMPo0MApVgz3bzhjb4ehjFPIbljhNOMzYLymUWik675g
 ctZeWCOpgztzL+pvf7n/r8nhyKN8jHMcHLsoeW34AAAA=
X-Change-ID: 20261126-halliday-tlmm-gp-functions-8a8ed8d454dd
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=1110;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=HD8degU7LtTIkgstinfaN6iEKPajs7uLNNN6OR7dmMA=;
 b=DbhUTn77kjaP14rmgpnE2tKjZrsTz+eG3NVAKIQqBaftM/TYrwCoShxPg/rNFmKWYqst3Mam9
 XgfSwrfmVbdAMzsG5s4pyXsc1IGO+A2CqxofzopdvEz2keNGSkToRYz
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Konrad Dybcio pointed out three pin functions that are missing in the
Halliday TLMM driver [1]: gp_mn, gp_pdm_mira and gp_pdm_mirb. This
follow-up to the applied series adds them to the binding and to the
driver.

Qualcomm's downstream driver does not have these functions and the
Galaxy XR does not use them, so they are only build-tested.

This work was made together with Claude.

[1] https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: qcom: halliday: add gp_mn and gp_pdm functions
      pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux functions

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  3 +-
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 32 +++++++++++++++++-----
 2 files changed, 27 insertions(+), 8 deletions(-)
---
base-commit: d1e44b75cd10eead6750f929e3cf68febab8586a
change-id: 20261126-halliday-tlmm-gp-functions-8a8ed8d454dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

