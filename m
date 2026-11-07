Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079359;
	b=XRLwGtNiXcOwG1JByGVpLKSRan55d3/ZthAHPcLoDpDNvfGNAXAG/roFeIcwRVKGl9Py
	 MjeC4wIQoyT6MTa0K48Hjn7t3s1NBXVyEcTO5WIa+1Brjmog82fwIX3rvyKsuQCcvAUXd
	 2JThkYyEsoCLnFGzu8TavzrcGiXfYnKqQ0dq6V68899P7g3NfTpmjIyLwIXRYkKhMuX/s
	 IFTF4mBXPhaIHRfvGzYJ30FLDi5Neqcm8RmzROGwfK/0pzabAyiPhetwLnyMjJVpFrdyp
	 8T7JXlwkKIhqZHUSWG+JBwE8gRKwskBC7A5CD61U0fdA89GpMZ72gewUq7qSVpKYCow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
	b=S0g1ohpPb98lDbMYtKSj0Oh3xoqvCihomCrIz3PaFPsKKw6eDl7/3GzlNMSh6amhnUCZ
	 ecP8lblwjQ9hliOtpQwMBzo46Q/DgLIUifgaCFlKqplC6MiKgokX0FqeCF4akkcStVgms
	 grV2MLO8VLCUOYv0mjo2sjyl+zlPQAIL10SrvuTyGu0rrgqYBBtywnKPn+6n7W60qX0vb
	 pLwm9VVQlFIplImuKYMPE/9ToKpkOHWbqtH6CnCv8Iiq6/8nmDS926EIJ5iitW68yxxjO
	 SQ4tHyc8FEoTzjUrjzH1UWwLwksfCWcibuHhu690MyfZwZ9v4mdn/ld1+9Fo5oJICZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPlZPym2;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24798606D80D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 19:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24798606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPlZPym2
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1032582fac.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079358; x=1794684158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=FPlZPym2uXrEKfatPBCADeNjTybQJXizuucFUnEvjPFiQrk6RFjrPRRUf1c8C5HjUv
         iXSgKpx/eBeS+qItB9pkvi+lNcHf7Q/wk7MEj9Kb2lKWJnOgMbFnOG5ICVIS0r5EHGIP
         RuADCBkJKpCSptLef/054xG9ggEVUmwk8VNM39oJ3gStkDC0OeWpFXYAeYlyigfr4H/b
         pKZui1WlPk2zpYfKnOuQWi72Uk9yPBltOwq1N7CizXvAjbtVORCyYiSWP/4BDldotP6W
         fwGkCRB7dN5Jml7MzkLdrUjqC2HxRmqEWBQCzVDwKV7m6aPWoi6uVqIBecfAwGO3jSod
         YcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079358; x=1794684158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IYxRQsQO6UsoPYARG/MQ3DRm7b0plb/fBLBgAtsE5Q=;
        b=GULFgnYBNIm0VFJ9qUI340olrWbbbErcgvhBsIht6YfsvU1HP0RETWM8VCnf044Zuy
         5kexf6Ta32iKOnAAF4MwePYaYDnOxnRVKw1tTfF9iF3xkuG1tQsi7v3WyU6KdSZB4daR
         OKxE/nEpa8IcCe4Jkl97IKlNGaj2jUPSZG6POWMXbAVjITRnfc5EGxbuHsbjlfV/AyNp
         CknoBLwI6YelT8mGW76UAmT3V5dBH86J42NawPe1PmlJPrEIeD3vvWttX7LqLvRQ70rz
         YKBzE2deWjjJ73c6zItGU29aZuCiPDYa1EUe1ELDgflkLP1Q7hI41hmEzjc9BnE34NS1
         q5lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfF01dVGKANoM+5Md0R5YcdvXdRPR4WppPeGieyJL8UEpw/MnJg8JHyaeJHacXjF+2zrCIxgHT3pE5MZBy@vger.kernel.org
X-Gm-Message-State: APuU4Z8BMXk6mC2F3m97vtnRDxppFeYWeBLgi/S3DNH7gxZ+78PRH5XO
	lBEm8oYhB7cNo9puBOZG1MF093E3vqkPE8bFHndE/7qV2S5xbFsSVx5E
X-Gm-Gg: AYBFou0JkQHgyHNWfdnTrshJ4YNAQEpJoCfbI1jCOU98l2LCBZ4baBQZU2G8LNxQLIC
	188L8vs9TtQjt+Ki6D6+QjFuoKL1CSQyPvpBPrhSgSVM7LMvTQt2nHwtlaIZUXdccUAc2GMXq8Y
	O00XVbOVoYFXyW+YCntCKKJAhjqUDQtt5rxUbuAcFYie4VS6OWCtyd35bF68wdKIStC+aMrwXPI
	LdVsL6GoJWE88KSrcPTHy0ZIVQaKaNqHyUhQl/EHfEXjNLcu2IOGEyS/IWr27Y5jhvDMcCKXluo
	jFEcSklLUBrvS7dsuvKOtyo9UfV4QQv3WS73ozGxAKpkuytIKQPS8pI1r9V6wsPBirTO/v9LDHd
	8ckw7VSGBk9ZwM7SjMcRw1YJ5QSSMt905iv/jdbqTlqyA4tzOoiOXTqRJRZRg/OgC0JuhiE/scg
	3gjuUcikLcU1Mlk/W0F9Cm9HI1IFd9255MkEiz/tcId7IghRNsNdYbXECesthh5vT3pCWdykz6n
	DYUrsMgKPYiBqAdSUSuVn23YKtgVU2uoPnl/bJc6BGbJWdaVuWkyt2XtLF38pR2fnK7YXjIZhfk
	2R7jfXMJGv7NfYJDMBh6PiDsINu7RlYHREDfyjksyHYPs9BGCb8SeeLoWSLayHn6DqVfhjb8AaI
	Sw7cvRMovgFxuRvmbJEu2G1MZMiEP9QcOBUFqAGAfwonDWhdgrst2oKHAJt7tY2aWhKrCmq/jyt
	wp4hjTUOyFQP9k/xGgfAMZ4+WuNsmLlBH9gRVtXWnVzlpyJAfyzorLkw==
X-Received: by 2002:a05:6870:e091:b0:49d:c88d:8bea with SMTP id 586e51a60fabf-4ad98e66b72mr4108041fac.42.1794079357895;
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f559sm167644fac.2.2026.11.07.11.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:22:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:23 -0700
Subject: [PATCH 26/58] mtd: rawnand: vf610: retain open-handle state on
 removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-26-0181ef0cc4c8@gmail.com>
References: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v1?=
 =?utf-8?q?-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
In-Reply-To: =?utf-8?q?=3C20261107-submit-rawnand-retained-handle-lifetime-v?=
 =?utf-8?q?1-v1-0-0181ef0cc4c8=40gmail=2Ecom=3E?=
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep managed register, IRQ and clock teardown after chip disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..903a25c549d8 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -805,6 +805,11 @@ static const struct nand_controller_ops vf610_nfc_controller_ops = {
 
 };
 
+static void vf610_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct vf610_nfc, base));
+}
+
 static int vf610_nfc_probe(struct platform_device *pdev)
 {
 	struct vf610_nfc *nfc;
@@ -813,9 +818,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->base, vf610_nfc_release);
+	if (err)
+		return err;
 
 	nfc->dev = &pdev->dev;
 	chip = &nfc->chip;
@@ -873,7 +881,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	vf610_nfc_preinit_controller(nfc);
 
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &vf610_nfc_controller_ops;
 	chip->controller = &nfc->base;
 
@@ -885,9 +892,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nfc);
 
 	/* Register device in MTD */
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(chip, NULL);
 	if (err)
 		goto err_cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return err;
+	}
 	return 0;
 
 err_cleanup_nand:
@@ -903,7 +916,8 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

