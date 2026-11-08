Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177746;
	b=eCL3XuRjZIPYlfyovTnN3KZLt54Lx9z9wt+XfBU2OCvXhX7iGn54dnRPISlbEtW5ltzi
	 GFx0dEM3+14nNIuXOcEtNsl6/z3HE20aalzBx34iFS0NfqzzW/jM9XORZOAALMevzPoih
	 lO/kER67lzGxUPL7xaiugRKCDCXFu6Cph/fY67fcSGAOF8449J59VmgWzsXFAKn7epDY/
	 ALKcrOpbXchR7f15aWI6vregwBrEkhlByY4ELOPCJ1maw3/F5D3g1qLCRfwkSlXXYi4SI
	 T08+E6JFYezIj7KXVuLBUBmKOgiQULD4bEdkqHmuNnyC1YjT1TUEmw0TTDDFrxHD5Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
	b=pVAa7Ga+0qgwo7CYy0BybtVMOuCUdDrdm/pcKvCFaMgQJ3ezd4Mx2DETsoS+T08WHaAU
	 4wJklB+m7r4Kbkn09ZoEz5qZIwGUKLadqiNeWJzxtsWFD22Coe2OT7/wjx1QGAXdZJgxJ
	 YXT9BbQnC16fxdg3WOYes+5Y3QuM3X+OsIEpowtkuV1SrbHSI6QELYKWpRXjjz/jxHzzf
	 JCLDZr0S7k77ILz+zzDGQMwcPvdgDHpd0YLaTE8/lPcRYf/Fdcvkd5Jpm9kUlTzoJlX5J
	 kr69JLftoahUwD5SHJZBNP7XkMkhbyeGu1MjNz5ClCj8HsumxJfi1dbC1mtnS2EaUqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw2PLEPD;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C68606D815
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 22:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C68606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dw2PLEPD
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-823b938464fso230748a34.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 14:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177745; x=1794782545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=Dw2PLEPDbpFCfu4XxFCaCh1QZeg/ALs3U+6/YbXln+vntgLeOlEZOPaj4Ra/+X8JVR
         MBBFo86JEJihjptEFJITLAQ8K2XSOIV92ibo2YsFbJVaOZBpx28ymhupeCVGUh0HGjAf
         CC6uPRYK/gNcDIxETqrlPjijJyFsXKlWxxklIwtWb/ZQYFYAfrDA3V3NG33uz3ydY3Re
         R+Mhce0M2pX/mFH0kNJLKydmAWEJych1vXeWFVNUh8b0PAtL8R+qPiYVvDh/NQpIGrDb
         nXl4cg9+LvDNMUgf3fVrr+6siBsrfdffSSbidfxJb6bRMB+K3tl3ZMdFLb9rp217ptqE
         tLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177745; x=1794782545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=GqYQtg/ALmwfInV8r5Mu4et4U9Rc30G/N6pdJX/Pdm7nAOp0PgxGWJ/DXHeYE9NIpp
         FPALfdi4Umb7OSY/rHq4qYbnRaO/bDdp9RR+DGRZ7s2PoSqNu35JOFEtAaR8BUmY7I9x
         0H0+pkaK1w7mX3w5uVLS2wwhSOl6fzkrMq9m44fUceMmF7OpB/UNz66EtZJg6Yjq0VMP
         IcGRtE/HCQLo4yFTSSd2FwQe6iJjskJDBFogDB7uXP7181ByKgVYpod0mv8k4Hd1iB5+
         Ubd1Rm4JMGalwoZgYyAdXP8kW1Fvqoy1eMUgurUMI194b8eZR4fzE2J53iHTKyWmlROt
         kOHQ==
X-Forwarded-Encrypted: i=1; AL+hErGvlZcBryiW7D644GWkv7XbrR1SAEppb7mijEx24P4bOMh4BD0lIg/5RJLaU/FGv+KIdEvHB2B0DHEQEzg8@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hszqg6upiPP3YeeUbHmQKr2fZrfIOgDilwJqWEvvdiwF1jruO
	eheV7nOcKAHE887Zaev70wy9s59J5eDEoQajI5jlpONcDmw7ZSsFiN66
X-Gm-Gg: AYBFou3eeDFNUl/kuMK3PpFeJjq2mDLyw4fh7xn2gZGpvpyz+i4Ndgch3/OZG4xQbbr
	4HjyiEhQplYYKJxojNKUoDL2klvV16ii2hn33U057nyKEk+mTJGIL+NEkTjVhPmNqwR4VNmlQ+x
	3Togl3g4xHNK9rGjvwMoE3cOg+4n3IBYqUnPJBSlMQTkkrpyrLyyyoM18IgTKJMCVURtPhWCKvx
	flsaQ7MtzYy6V0ZtamBhKZ1ZGSmMfZZYNtjagEFYSKiIPzfa0nsrQAyJ4Sq9SvAJohQo21R3sPS
	CQCyQCZWML69xZHmTmYRZc3d5x+aXf3Du3k3SKW5i/f5Piy077cx+bQ+i9LYB6hQl8CWUznfSrn
	Mm5PeflFjQoOopaJToVAw/7vSUQUtlfVA0mD53y7myFstb4cCh9Of75SnOgWxhkPoTb+liE6Sva
	UZwNVAiFftYLIbm7HpiQk6dncqeM//od7PCoOqsvcf4x79DFfcr8rS/cLDkWyaNMFDH0KM8LgT2
	iSEMaCfidxdvwIR/FTsJddvtPy8WS7eh161K6j+/jLy/0K2n8OmCRFEmrPP20WdOgJQF2epb6Yl
	LdD+nY+MtltZbInX8qlXtQc4v87FSCr09ReJr0d228gcyP8yV3YdXRBYWdwYs/vUtZq5mGH+4eq
	atrWGQWnEnYrKsUHyy0iMVSyOOApE7ce8XPUe3dVSgBcERpy0aS0XysKKtR45l6VvgSc4VrCfof
	PbwQyA1AuosT6ePvUOrQ5ep02ynMNeWElhHDKqcZreEHXoPovN64r8
X-Received: by 2002:a05:6808:191c:b0:4f6:3401:1c79 with SMTP id 5614622812f47-568143dc9bemr1634647b6e.49.1794177745010;
        Sun, 08 Nov 2026 14:42:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:10 -0700
Subject: [PATCH v2 3/4] mtd: rawnand: qcom: unwind registered chips on
 child probe failure
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-3-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

qcom_probe_nand_devices() continues after a child initialization error,
allowing a later successful child to hide failures such as -ENOMEM or
-EPROBE_DEFER. If the last child fails, or allocating a subsequent host
fails, probe releases controller resources without unregistering chips
that were already published.

Fail probe on the first error from an enabled NAND child and propagate
that error. Share chip cleanup with removal and run it before releasing
DMA resources or disabling the controller clocks.

Fixes: 89f5127c4b0d ("mtd: nand: qcom: reorganize nand devices probing")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 062fba9eaecc..14bb7f3d6c36 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2085,7 +2085,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
 		if (ret) {
 			devm_kfree(dev, host);
-			continue;
+			return ret;
 		}
 
 		list_add_tail(&host->node, &nandc->host_list);
@@ -2094,6 +2094,19 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	return ret;
 }
 
+static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
+{
+	struct qcom_nand_host *host, *tmp;
+	int ret;
+
+	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+		WARN_ON(ret);
+		nand_cleanup(&host->chip);
+		list_del(&host->node);
+	}
+}
+
 /* parse custom DT properties here */
 static int qcom_nandc_parse_dt(struct platform_device *pdev)
 {
@@ -2184,10 +2197,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 
 	ret = qcom_probe_nand_devices(nandc);
 	if (ret)
-		goto err_setup;
+		goto err_cleanup_chips;
 
 	return 0;
 
+err_cleanup_chips:
+	qcom_nandc_cleanup_chips(nandc);
 err_setup:
 	qcom_nandc_unalloc(nandc);
 err_nandc_alloc:
@@ -2204,16 +2219,8 @@ static void qcom_nandc_remove(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	struct qcom_nand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &nandc->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	qcom_nandc_cleanup_chips(nandc);
 
 	qcom_nandc_unalloc(nandc);
 

-- 
2.53.0

