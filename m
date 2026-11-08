Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172606;
	b=SRo6prUHHVcHIR7AzQjuNw+ouZc+yMBINREsiJcXrdZ3HTz3ISIa9VzMBKEBe5nn9qiY
	 VABmImMkOzOHy1ar96sJBAoi9CqfdEayB0u1ZNZM8imDV959CMGEretU2ILCHtLa59Fhj
	 sR8+FKEajkDKgLB2C0Obn2sjcja8om4PVDxhQpA+dWrqkcH1o1ddaHikGRS9VkAASOiU0
	 Pw6qujXXwFkJGv+6Yy7g5bzqc9D3V/e/NkG5Tah/C9e3+eEUF5rvrSKHwsVl7rSJYMgld
	 rd4fa9WBLVvt3JgyjMcPIu6gxssjnGKYYtx547V4lq5HKx39hZaOG+pJpXMDLzqZdWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
	b=luQjM0SlbnBirykFcvImLTN1YlOC+8nLv2Va1GYM+nxZFEzv8CT3UXqtfB83B6fPKVYq
	 /zI3KHqnO5ufWjIsAluqUI3m0pIbqgieVs3Dp5HLuKCdhgM9hrbyLEFz+muQf5V/KENFc
	 KFV1ar/itpmHLNwDMJwoYjcoicDoNMepJjoqlutl5k4M64sJrqJ7miMl8yoSDmKZIf1cg
	 cqisNBMFvbh05eZVUpHJT2ezKTm/F3Ctd6BDnqSF5OgEDoDJrtG4AgAxrzzbL0TI2+7KF
	 78FX7Eu+FDAknAPfY8NpYWCklJAH2q/baueRlrgt+3OU6P9f331qtXdsUeXpkss018g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLiYNlLH;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4760606D81A
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 21:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4760606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLiYNlLH
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-717034b331dso154919eaf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172605; x=1794777405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=kLiYNlLHYt2Q5LxFaYwrrKJ3TOZo7V6oaW5kxjrB2UxRLknCa8gtM9BVVf3r/p+Til
         VEuBYQ5s7n7pxoEAWKPv0VNJfTbpItxnzGL2LcAFJIKpSOPj6d0HB0r68z6WwTshAB8n
         tJ8L74Y/gDRhwln5xuRtshSZvie0zmiVDgBnboHQM0wThaM0JYyvkZjFLKjEdNtzsP9y
         birS3YC3rTMeVnqUqAmoIhEhuchBBxFZ1cpneXcJzeOGV0OVbpqN2aI2YSZsi1AhAFy8
         7VURTjRGDkU/Wq3rJ8yvvwIMpK45GWZdsXrkO1zTnWTmwJV7NPQwhNyeMd/H0PWRFbCK
         hGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172605; x=1794777405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTsIQ3GHuwszTciCCDtrpxdJaKcQmTY5JV7uV9WKwZk=;
        b=g5mxfGMWxcVF9OAT0n81Cv+vS9r1NpJSMZGqztNeQeqMiRzSGPI5I5e0BDKKxiqGlz
         kfHIvNNFUPb5e0sD72ANXvPvLc0VC3HpYwxJHXx8dv1IMtHQzenHW5lFM+KT/fml1x1G
         Di1+Usq2X5SBpIY4OKTVsQER7nTNZRGqbFgWMbOGBOjNiFHZ9spNiRtq1ckKJnAXuzyf
         lFX0zf0XZhKhgHNgTtyXfRUK0FpjmS/nqznOyHS303e2IszVZlxZHjiPzsgkfCvOOpfv
         IyocbjocP769kW+pp4l1b53JsddjCr+tNA0yXHh8nP80Rao8Fnj8oca1hzkoRsVnauPN
         SEAw==
X-Forwarded-Encrypted: i=1; AL+hErFlE/jJcm8D0VYsGTmPukxBaTQA8Bwdzcam3arm8R6uikhp29RGphE35tJ7bHyZuj1v3+If0CXtarWEdlCS@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ef7AMkopFVNsudgpXPn6oR6h/NCR6i4mSvgMjzdydMxL37DM
	3L3jfwJxBUJp/qAAuy/ZAq9cjyvACH7qH7yxug7tP7QCjzkc0U/uu0yF
X-Gm-Gg: AYBFou3MY3PKy2LEFqH2OUp1o2KvJiPsvdD6tPNQFmZXr0YX8+ar4x6P3VzoXm+uPI/
	orUe/4vp8hpiu2XibjkoWijQXd22CNGyUQ4TGdAnvomfJDb2kJ0ax2uvS/OuwNN7peHn0jU6l/Z
	g+LLQBAvRP8VXu9V6MlZSPzbqgaD6G6KKY2vVJLXMjwf7Hc4lmFuw0vIg5s9qDZxs9UPxBJIimi
	UnGi5ykfKbMeL+wbHkyIXS0qOEWWYXanhH5vY2qKxZXzfFEs5nGse2g+oXG9TGWKUrlvW4I8uI9
	5SOuBLNYQWxbpzYYw8sDMUfy0tXMdDI2lVQm+XJ1v2iDV/to0YGWHwj0f1Il8zWcO91YG/7Y/zU
	8rj8gvTdxs4AbCbrUVQWtxnvOUAxTv/tkD8HJczf8oNorFkrNUlpG8rkjHwJlUs8lSQUas7MITV
	CN781hnhBpWXQ210nyiLIT62Ej1ju/Pwu3GnJcNioqCC47yKIe16OXmf88rYMPhjydv4j+abUDX
	hLht52pMN8GdVOthLfORtPPWamZ1oOYGr96W6XBSjzS0kPnhMZMrw3iImFjXhhIJ5Vkau22qt/V
	eaTDUj2JrXy/nM4IH4h1OWg13PZq7CwIw8A6j3agntxMSHRPXESBY6FZow9BojCLLXgWlqMLf9h
	X6JjhztMURN7uRF+e7zf4Epi8mD3ru0+vbYTVmnEHO7T9j8+U6QUHFfw9ea5zTGm5mwQf6KOe7O
	z0ObPWGVI5SnO4XDLyJELl0xnyh2e1jhD1a1SRONZkhZ+Ps3dkuRY+
X-Received: by 2002:a05:6820:858a:20b0:716:e3d0:c671 with SMTP id 006d021491bc7-7170f25b9e5mr902761eaf.14.1794172604868;
        Sun, 08 Nov 2026 13:16:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:37 -0700
Subject: [PATCH 3/3] mtd: rawnand: qcom: unwind registered chips on child
 probe failure
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-3-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
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

