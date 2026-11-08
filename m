Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177743;
	b=w1+WM7cDIb3UH7nUU5aU+a8iJt5s5PvhKqPvncJVU506JyT3GoAYztUn/aR+Umiph5K7
	 r1Wq7smo/Ux7XApcOwGlpjNOZm3HfTRMM8bIlm9LFRMnc6XL1ygLQSZx6Ca9PSwHQ7AjL
	 BBT5o4T7CE1ERBt7Lv3X6Xk3tkagj3W0ajNbw5XEKanYoMIaYczRVNg8HIVA4G39FIFqE
	 RVVEpxmVzTA9lh9Ze9ASA9abfzUz7nzaWIyEcBnuiVBfioCX1M1KLNVsvqu6ia7uZe5GG
	 Q+quecT1T3jkOUQoDAJ6Hj+uZ7VVyHc0wXJHuYtM1veMD7ArRm7v0LWZ2ia0gwcJb3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
	b=jABSPVzyCLlIkRy4nj4R/NHtJt7nJMfubG6bS4M34epmvhGOsnDfSTeeUVT+Fz7V3Dml
	 a7MK9WBGo/nzlTiOXdroqiyZKCWPu7nnMQx3zCD65ifG/66TiI3WzKrzQZt+1RwfOCO1r
	 m+KuwfHb9OYfI1KrPY6913Jg1zaQ4bU323+pEp6afwT5Ro2MBY+Jq7XZgP1ioKYXlZsDK
	 VkuBAcUJABxqRNV0W6+yyn1KCjVVFgqLensT7X8ixOEXMgfFtOTMVslCUqhqay8hA2QFl
	 /rqwAthhkkcLx1xsG3TX6FWv5zQqQnCwmbRDoT0ki8z/ugn0YLdFA++cyLcIvdAvKPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIQVU5h2;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58689606A333
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 22:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58689606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VIQVU5h2
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4932b13c4ccso176374fac.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177742; x=1794782542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=VIQVU5h26tv3OKc7TWsATktTWmtgYJAbpgl/p8DcQdl8UEZ6AvTVJSni42N9dJo/lT
         DjZHWlI8NzZgqykUXGdy69BPtqWcHHwqwL+hsadvwI5FU7gchQY4iLM50zNnDXFI+Hgp
         jjfpWblv6FnJFfv9wnIg7Of+7QSbBjcrzUg2RCgGSKH3dJABG0tbM+EdVOYQXfqIrzrg
         Tm7ozyMPMvY1YsCKfbf6ZyJIxaXGoZw+eMKhqIwVOqC2Sj0rKY9yN8O7DKyUb7aZrpmU
         koGwC58ejA8Qm+zHrxT4sDSzMiFWybsT2ImwEsF3pDa5p19ENyJtQNnUOCr25GvUMmF7
         bGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177742; x=1794782542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=bKcDmZvJkzTWG3HJPsceXgzOi7nsje/shHJbSK9cfSOb1E599HhOcIMPo80JLN5iKl
         uYF2KYJwCvkTq7ZfSQjmYFKUPAWDYJLtHeBHvfkdQ8FZcCito5LwsHGt9UBr4pvnOMce
         LzXzpLsB9usbKxhFsLjdcNeHhvpKhr3mE2E4S0+jN+B1SORIIxXY63oDb1pTVMQ+jES5
         vkFPnYQAXKy8qHqwH9YbUEOkItYd+gu6DkZ7xn2sX0JCzIErg+M0sNK8DxYdK8I77bX8
         YRLWOnBtjcly1Xc2ij8OqOzPSGDE6FXOZIJriXE4poAcXGANNW4OXw6IdcB8LUXeXLvl
         NU6w==
X-Forwarded-Encrypted: i=1; AL+hErHrKWJfQ68zBxfd3XabPH03ndmbAsCgSiPjPTHOeoAeiAuVWobUThX+rYYgP8Rxx04hDEWtHQDqT6nE+jgF@vger.kernel.org
X-Gm-Message-State: APuU4Z+/qeoJbU3SrBSd8ZWXxQW3zjzip+Cb1XIUcoCyAdQSSLpeaHsG
	1vD26hDi5w0VSFlCnSEnS8N9iQV5sPOH8CzsvL3Wt0/2A0hdw/8szxT2
X-Gm-Gg: AYBFou2pNFOBP5ad4fSeHNSFWZn+44+VWdcv16kwQ/zCVgIL78j4+e/UtoSKSp6qwxv
	g7OBsTh+/vWkjTklrXIkoIYwFa6Uxdt4jEPvW6TUhZuYI62M0yHXnL3PiSH8WZB2QUmJwnuga/0
	gg+DQm/BBILAT3zlCj8nL16qTwzVDPSpu+GmPzDH0lbP/3GIW/NfDx5UOOueZk1p/z1NtbtVfei
	lw5vVPURYxq27k86ZJn4teyIos19zOzp7C9fMKfVtqxP9klnj8nVBifX6mCqXQn7TLfn074cvjw
	1OtpdGYc39Gby0oRUuyb0u2nfynvn+qbAOdjOr+eJYMEDMNMLWKiYR0Kl0XbWP3R21tovcTo111
	mYT2fsiV6cKkK9t4dGe6qWcwGPyoH3QrUOxRJ6pymlFdkIT1mu/Ouh8C6UhhyXBmFpFLAWthBWc
	Sas/zZnIUDEN2TA1SZYDHlfrty2eGRocmI1SiGIOCxRpOt3tDF55fuux7uL9RVLcoe/6zkcaVp5
	oc07//90c4+Ik7RJy1Q1s7wVGwB1MwT52UorrMPPzcC5hu6rj8U7Wd5QfDe0JolD1S3h1S4fFBk
	SKIws8dV5Whi+xVdEbeQCfIAEt4R26HC0fdbGPCLPJNb/6uwwdCyJ8SLIEWWfQoqU1UXdH4TAKD
	Sa89AG35jaKsvGOwAwKqC4KrWzDndU3Z4jCufEt8G4sIHgxi7NwMq2E//zpx9ZtmyPyRYmDxa8R
	/PtVmqacnvZSZ+4wAtcOkC4bi6o8xZRwgTXrNvjm55aqOiKtzJ9J18Ru73UZW1ox+u9whg8v8bk
	Q==
X-Received: by 2002:a05:6808:1514:b0:4c1:5614:acab with SMTP id 5614622812f47-568143a9715mr1370591b6e.37.1794177742300;
        Sun, 08 Nov 2026 14:42:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:08 -0700
Subject: [PATCH v2 1/4] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-1-4a8704cbf7b4@gmail.com>
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

A boot-partition parsing error currently calls nand_cleanup() after the
MTD device has already been registered, leaving a published device backed
by freed chip resources. Registration can also invoke consumers before
the boot-partition layout is available.

Parse that layout after nand_scan() supplies the geometry but before
publishing the device. All failures then reach cleanup without leaving a
registered MTD behind.

Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f240d1effa04 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2052,16 +2052,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
 		if (ret)
 			goto err;
 	}
 
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:

-- 
2.53.0

