Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653275;
	b=CglfmvzSFDjoS3b2NJ9gBuVQwkmv0wzd5pUk0hT7RIXsRhyu89gaa3/0JJxSECIBwP7s
	 9bTTodRqFLFS9xYdKd0WZyhu3GfYoEP9Wf1sId3o+GZYlDHnv5OpHooCCjX/XbrL/vF2a
	 /7z8ykk6PhLi2YKT0ksdd0DJqc1izO31ub3/jnolkVyS7dWKcGcB6+GVMLEsQqDKpUw+X
	 DUNSlZBmceJSXGP9MVNa+/uUIjh0An5SdAEnIMJe2TlCOIvILvA/FGYwQgy0osgFgInl+
	 fkoiSg3iWFJM93l7VjrVJBuGu/BNAn3ko5NPRblyUo47EtvY13bWZVhjCqJywP9MMtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
	b=O4QEkericJbg9i7hRQz8j5+OaAqa8kHi89St0dkq2G1WZ+ih8vGFmEuNAe8oHrzEx4Yi
	 NE9et3AuaR3kMS3afUwfmwo6sxigc4boeGIO7yF/jVNrNyTIMas2r+JAmb/fg3r2go8xx
	 o8DgReMfzdIENUsV6ZIWZX8zMVSKC7AtHYDnfQYChM/8Amk5enKVG7ogE/d7hDaVazuV5
	 jxQl9QzeU5PamHQBy6Jb2dOI7wklC38eXN317GGewpvGrz9/zZGJy1dDg2mLwOAfN/0CA
	 Z/mP6yv2GBENrEbHXL+hnFgASXyFtrbZoWI0ZDp1M/O2D/fc2GYN1Wd7ciM3yqg/HGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lDNVZ+xI;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC46606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC46606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lDNVZ+xI
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-181516de561so247329c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653274; x=1793258074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
        b=lDNVZ+xI4TWk8YtbkTL11n92mW4AB3EEJcGsNKwMrnPi6zNYDDFQGLFaZGqqo+h4Tc
         Durk78e1tFd31HvcAc9zIzRX9DHyAx/IADWbmbXIU8w+lDgNRVHEyKyR+jqxIk3U+uot
         SKw2yQy22Ju4zXIBb0WPRCG9bTtsGCNtkOqU1A0hlE1geL4i+uM58BMz82zrPbZNMeFk
         3xrsCOqmdOL5COho/iEgTPgolIROIIVEPDTwAgnDXjvHficbn/Z4YBODnJ1At2d0bxQ9
         ARaKtFIKivQPgvJ3RL0W894tmTxyooiqbjwg7tcrUiLOlKbLnNqijx+Y1tvG+cFWf0uV
         zapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653274; x=1793258074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
        b=rbwNUIKV7sZ2Z9K4NhTGGgSHiLUrF6ESiGoh1Ox0rxMGaJVNN5tudrGUGmNiVtoRUQ
         TPLZFnWm3PiRSAiYvNQIguyINKHlkqFf/8o1mf/6wjP1xHUnC0xSPHtjt3Yr4bHDAJ06
         h/t9SNU1IVF3ncnQw7Jq7VVxlYxjm1S5gLrT8NHBAJBEc1I2vyM4xNnwS533b/1k+HRU
         t2VkNbdVxJoUvb62vCHFUjM/DK3BBW/kYiiSmQ1Xb7HqH6Ma2CvcYjeHPZDGtitw1x0u
         UnDEyUgWC9B9giZY0kdZjMDfsWfRuN7VvGxX3ymA9mtdc8GJY4t16lO4DJXDwtBtpg8W
         VbNA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ526ldg5/iQj38604diLJoXmnU2onFhRxlWIfwav4JaoIQrY1KDemA18s4Nz7+p2bLIrM0xwnWzEMOuJN@vger.kernel.org
X-Gm-Message-State: AFq9FYKcg7y0oXPhWwbowHnQsJ35d7sND0NSU0cOv4cVmm5k9HXiMrE4
	bAfjU48QlAITXo+np+n2+2vXIt4BoKvlGclYbVHbkj0bTwzM68lMknO2
X-Gm-Gg: AYBFou02FKsX49BPlXnWfnPqIBHFE4LZBoDaCGiJP1Hp8co0TuUSWXbOXSiq/0guRso
	4K6PQeLpGzTRexbm+xkt+7x/Tt0jg/7DpIibssiWuilxIVYVbV1i4wEr+frgWNmdZ7IitaAgX2j
	9LjTGLR2wbAxjUPMOmaDGnMBxxPBeFT53RDMjl1ITmSW2XaCtwse3YNRr4Up3w9QDKxjey4neM4
	GFYZQjGk8fWrDSGc8/1hLbwi90NJCnsLSDRRAYqEBAC/wQFcVifsdoYsLIBs91vVRPmvBS7Ce0l
	VaqR5p3xJ91xPWrAIzWsNpu8D9dIn0ixhTFGbJ2Uv4w9qFM1aTsDMlo24rcWcWzO3rjXm80Ttbn
	V8+/GHLeGOC9FOdwJ8fQbl1xdEhW+SMCl58jPUC2xcr8x+K0nJ7IAzRX9f90Rh358xgEIcnjl8A
	95ohLnDgaQN9s5KfP/eLDo0bSK28GBF2cqDhg3gj3I6dd+efvxoBIV1+0G/eMr7RUmsqtxb5if5
	Xc19qIOUnlid5xbTbd4WgkgTz5Zu1s8KlsK3uVLSU9xC/g6JBdLdA==
X-Received: by 2002:a05:7022:458b:b0:14e:d0ba:75af with SMTP id a92af1059eb24-192eebbb953mr2935796c88.6.1792653273782;
        Thu, 22 Oct 2026 00:14:33 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:33 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: qcom-cci, media: ov02c10: Fix camera power cycling
Date: Thu, 22 Oct 2026 12:44:16 +0530
Message-ID: <20261022071418.26895-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The OV02C10 camera on the Lenovo Yoga Slim 7x can fail to restart after
streaming stops. The CCI runtime PM callbacks gate the controller clocks
but leave the bus pins in their default state while suspended. The X1E80100
device tree already defines a CCI sleep state with pull-downs for the bus
pins, so select that state before suspending the controller and restore the
default state on resume.

The OV02C10 driver also enables the sensor supplies before MCLK and disables
MCLK before the supplies, with the required reset and startup timing. This
series fixes the power transitions without adding a regulator-off delay or
runtime autosuspend workaround.

Tested on Lenovo Yoga Slim 7x (Snapdragon X Elite): 20 consecutive Kamoso
camera open/close cycles. The sensor entered runtime-active on each open and
returned to runtime-suspended on each close. Both modified driver objects
build cleanly against the running kernel configuration.

Saikiran (2):
  i2c: qcom-cci: Select pinctrl states during runtime PM
  media: ov02c10: Fix sensor power sequencing

 drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
 drivers/media/i2c/ov02c10.c       | 20 +++++++++++---------
 2 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.56.0

