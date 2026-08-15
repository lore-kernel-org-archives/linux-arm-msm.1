Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3D732B13F
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786802995; cv=none; b=HVCCF6V5lsy1ZEgAxKgHqFK9nVgoFpOZN+Oc5/djTlL8hAAVr0wYDRCFBKffr6ZowlpjYpcuNotvu29Z7SKREfg5gP9STD2rDYEX+E9grtDhd27lBPZD7hbWNrJNpoUV/wzPghPOxUs0HWPB2XsP4mkfYl4I+4GMSn4HMyn1YU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786802995; c=relaxed/simple;
	bh=S1LKiqQSNMlXcxi2Yv2UEG7wi3iotbbEkUf1MkDP2wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cAM77WtWgyukvFRonRDk9SVukbxXX7/rDEcn8xS3t+H9EoVfCeMqrN4hcgUr9TrpyqVb1pWkBth9e9UkAwdR4nFNx8h+7fTZYKFGCq/UNoPAT7EzvH2ujiA0cBvAxsiUHAA3NMpDph7sg7U0lQZeL6TKGZFX6gHy3OpxHuQtb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIX0byll; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIX0byll"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1642591a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786802993; x=1787407793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rk+TK55LIKRB93LVwwGii2OByDhMrzrdTRJzsNIADDg=;
        b=MIX0byll+ZOae0HS3sebYFKi2Mub5gXColQEUuIeFFiPYx9fbclCfMh9VVaIZ+eYzl
         nHomhK5W51AXjicsG4O5FoJ6BbOvUZWKfKK2UkEwYL50XVJIULq40i0XReGfTvShqjta
         1PwcIkOQyE9ifGvuwv4AkwWi1EXTUSLqHwC3x4hIJMtxfkDjEHrXxfZRKEUS8eOAUNew
         u6d82DUHSCFJa4z6OM1+0XRI8rhnvXNcxczYSK6wy2UCfF2Coftn42aWwdKndxg9xPSS
         mSc38rBMe6IgI3a964RQpWGBXDi/rYAIYOv3W7nstwYtTp2IE4Yp5pSGDjmdtnONPDh4
         T3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786802993; x=1787407793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rk+TK55LIKRB93LVwwGii2OByDhMrzrdTRJzsNIADDg=;
        b=fhv/Z0d1l5alzYxCd2Rz/7K5Y9oruiIVyNH9bv2MHAMCplyMXRUlnbcNKVM1WDEodr
         omEkjbgD8FXXDJSvE7NcIiqoc/JoCwy6+xDVzvwOKv1i55dHwbGK/CQxQ1904i/kFqlz
         WHaZIH3Uz0ZWea4t1BFp0+6WPzkcanC8BLL6mQxLMAU9TApVkyTd86GJ9kRnc4AXdlb0
         +EPeRCKzAddLrL3Lan7UOJQdLB70MlSHvn7wVTTFYyop/nRCh+qHvGh1ecAa0MmOfQVW
         nwPdPSwE21uXzyJC3hUafxavpwWjmj2qNZ4KHQTNF9n66g8EiboRCZcfE5vdmPNxfotG
         NAPw==
X-Forwarded-Encrypted: i=1; AHgh+RpZoQs2qVED54wIReh3LnStm4MwZ/MHmkLYTkl4yZVVvkanRDhK0tYxWL3rs7EVDMpagoW5aA0a0NQF3SXx@vger.kernel.org
X-Gm-Message-State: AOJu0YxyKthL6/NpOqsDd9Ma31jo3gubixO3ucx3OirMb+0lGdndKs5/
	IyzZND6z9H/2NkQivMs9ad8vdvwhljxK2SEzNBtTwxocNZZ9nzCSf3NV
X-Gm-Gg: AR+sD10pGby1mJyGClYaQ289rxsGFbJMbMBQ6FSHjm8B4F1BQJa1FQdgHGuv927Tko1
	NajXg10GNndQumZuYRQvmRWgr1ExAe+v0pMjqDfcBA9L/nlCtMiRawwi+bWBuXWNOtQ88FpGgHp
	IA2Zkkh3eoMEpyuqknVMcLyo0X5DShC2XC3heEWVgIQBgZq+qFOBYrSAJ8jUJsC3ChH01xQMiX8
	uQUYTMzjp7Edjqx1YmU2qF2HeLl/zn9PWyv2s9AmAbb9/7MHp+xHQlxdo4NWWsIN7EjEX/A0Sik
	bWzzDzao+vokfTGiPor/PxNY+alQcyB6mqZeo5ncXqHEbXjQKBtefsnpzqxsw8ZF12P5shh2su0
	cFEWXEUKUvqxgQD8MTNkZFrsL42oaBSeyThZkfRJ3zFzsnoQWM1vjT/01XVVV+YqxdZzK84L9fC
	fIdVCA1tSniQoGSeldTvknH3iM4EANqXFSIBkoVPfPkDVdS+kM/V+ohtT6Ved7Ig9el3RdF8Ud5
	NODr+mctWRwx4i5S7xIFkwp3q4=
X-Received: by 2002:a17:90b:2888:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-3933b95dbb3mr15321257a91.19.1786802993171;
        Sat, 15 Aug 2026 07:09:53 -0700 (PDT)
Received: from localhost.localdomain ([240a:4280:4800:6ace:25e8:2607:e94d:caaf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea996575sm6327788a91.8.2026.08.15.07.09.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 15 Aug 2026 07:09:52 -0700 (PDT)
From: Liu Zhenlong <dragonliu2018@gmail.com>
To: loic.poulain@oss.qualcomm.com,
	rfoss@kernel.org,
	andi.shyti@kernel.org
Cc: vladimir.zapolskiy@linaro.org,
	wsa@kernel.org,
	andersson@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Zhenlong <dragonliu2018@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: qcom-cci: fix device_node refcount leak in cci_probe()/cci_remove()
Date: Sat, 15 Aug 2026 22:09:31 +0800
Message-ID: <20260815140931.53297-1-dragonliu2018@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cci_probe() calls of_node_get() to take an extra reference on the
child device_node when assigning it to the adapter device.  The
matching of_node_put() calls exist in both the error cleanup path
and cci_remove(), but they are placed after i2c_del_adapter().

i2c_del_adapter() clears adap->dev with memset() at the end (commit
bd4bc3dbded9 ("i2c: Clear i2c_adapter.dev on adapter removal")), which
zeroes adap->dev.of_node before of_node_put() runs, turning it into a
no-op.  The reference taken by of_node_get() is never released, leaking
the device_node on every cleanup of already-registered adapters and
every adapter removal.

The commit that added of_node_get() and the matching of_node_put()
calls placed the puts after i2c_del_adapter(), so the bug has been
present since the fix was introduced.

Cache the pointer before calling i2c_del_adapter(), the same approach
used in i2c-mux (i2c_mux_del_adapters) and mtd (commit 56570bdad5e3
("mtd: core: Fix refcount error in del_mtd_device()")).

The of_node_put() in the i2c_add_adapter() failure path (before any
i2c_del_adapter() runs) is correct and left unchanged.

Fixes: 02a4a69667a2 ("i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index bdeda3979c48..61c535b8196f 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -618,8 +618,10 @@ static int cci_probe(struct platform_device *pdev)
 
 	for (--i ; i >= 0; i--) {
 		if (cci->master[i].cci) {
+			struct device_node *node = cci->master[i].adap.dev.of_node;
+
 			i2c_del_adapter(&cci->master[i].adap);
-			of_node_put(cci->master[i].adap.dev.of_node);
+			of_node_put(node);
 		}
 	}
 disable_clocks:
@@ -635,8 +637,10 @@ static void cci_remove(struct platform_device *pdev)
 
 	for (i = 0; i < cci->data->num_masters; i++) {
 		if (cci->master[i].cci) {
+			struct device_node *node = cci->master[i].adap.dev.of_node;
+
 			i2c_del_adapter(&cci->master[i].adap);
-			of_node_put(cci->master[i].adap.dev.of_node);
+			of_node_put(node);
 			cci_halt(cci, i);
 		}
 	}
-- 
2.55.0

