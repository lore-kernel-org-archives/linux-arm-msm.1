Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5E447247
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189520; cv=none; b=ArgaWqzeYH5caR8SdYP+LO24RjRBf1Q8Wr2ywZnovboxWVbja8fYCk+OT86m96Ad/u1I2qP/GSzdaLPr4LSrJdWxutt+2X3SJqE0kSecXIvkxMZE0PhxCencpEZ1I7iayfDg8jo4z76AJiZmYCCIKwTi95G6Eum+ORJdQ7FJ/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189520; c=relaxed/simple;
	bh=wr8nKQRVMvFmNlpalpzhVjt9cczrfUGnQQrpEM2oFRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKjS/uI/QG6vpz4EeQeMM3WCdQLCweAvK/yhJge7iRW5uiooM7IepEZA/L7u2MGzpDTGoLsVtPAsX1LNsZkfajUdyGDUch775MYa+iQ4yth7wvNJpJxAPW2VpW1SZen1xOvJqs7aQCU1AaD1jwC672PCrgQwYXtyK5OMVjHhptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qr2hZr1W; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qr2hZr1W"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so5181645e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792189518; x=1792794318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0gV+4463GGhxnl9k0VDkO8zdfsUzpizNELkAcN9qFo=;
        b=qr2hZr1WF/DP6wPL+hw+wF0r2KgciwrvMX7JpoPPRXhlBza/77KO0U0AIrQ2chLOzb
         3/H/vTbhphBptrxbdoPTCjNWJeeC+7u/bYIzk/2UvpRr4gXvFBgxhxqQ2gRI+jY2WW1A
         QN9VstdCGxjKclFme4TEqoCpskxWZprwcR9Vh0BZF3WH+65w8Wyd2py3EWqWyPYtNGWg
         a1IjF4D5qj4XNjwsB/SKv5eqa1HN5j2BIyEz+zrEclGwxH220N8R9V4BGvbWedkjY1JB
         LZ8wITZ9FjYNgp8McKJyuhWJz2ep3xSr0BFmXGVn4B5nR3cOoUvqJEOs3scFS/WJBqIx
         ePWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189518; x=1792794318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0gV+4463GGhxnl9k0VDkO8zdfsUzpizNELkAcN9qFo=;
        b=bdi7cPVY7mZu28ljsz0s3vPTk9VpP6Pm7bHLfPMVhD7ixyF7s+er6ZK60EIKNJKAwC
         OkVpSxIDjzyhn7rfsHFAApoxpoCEmCYA65LkrtTwQMgfV2N6gsADD3MT0UXC5AJox1MO
         QvOeVRR12wNCcc75EFPI4fd0e425WTYEHqxhT2vaw5kqfNu3b/RJdV7fuoUqleJqM71+
         IPaJUlUno8BJYK8NT8vG2HpxFUOwOO3pXWA0M5pRPMKNAfwqpkIrhMnvoHC27wpV17B/
         RZOOkLLYbEHPbZvXk0uNYaFK1whSAk074zNovlc5sjX04K5tGirEmb9Q4eN/u9DcPHUf
         bPqA==
X-Forwarded-Encrypted: i=1; AKwUvBxTfqUUF/5Wq0+wMxmCIFaNwTSQHnmqU825jPRUZmx3Mo1dUAj512AcsatrihK1WMXdFwLs9GHI25MyXABO@vger.kernel.org
X-Gm-Message-State: AFq9FYKyxxecpUd9cMrtT/+ZUea/1HIdFcPBL/2FwRvAYU/AyG0Jllo0
	EYdQ3ASfp/9VReOPpHv/up91AWsgdWnVrUP2JmfLIsM0cjDUdRczO7xE
X-Gm-Gg: AYBFou3agl139NN5iWh+LbQQY+9oOcUB5wKGvOySd9g6nnpba/9QQujC/m64tTiSoue
	OesSTgkNfgdKjCWLkzZBwd3w/bjdStXe6De5k9RnvxoPI1hEZVYG1b293QUxFfS17XRFiPfQRyc
	2MiFCGtqytOWpOK+RO4xDAOaDDROGeeu2iRiqxu6ZhCIs5IJNp0VpeD27+XNOQ7zq+/J6TKJgHu
	/+TZ518SPLhZObkmKYsAnK4XnCmJkTRR2+Q29fyjdQ9K7xomGuid6eOIWo16nY1nwuKZ0A6FsKC
	O2dlouucBttw1soj2pcrO3arPSB6QyymRI5K6dSSjVfu0hbsRmPQHVMO/OqUmhAT8DAw3tdbP6l
	ba8n2hszsDnF9X5Z42Pousd6zhwgZAkPHxnZWyKmiq5RSQLBXt1swtfGVe6ytGDCaOCwZBZ5kKK
	WZWapznNc8LVI/w2R61Tc4matoiBzUBCbozFmNiOFevuYPNlfCf1IdaRrkHPFI10zR6t/Zem7ux
	DIsjjkjyZaN1wyW6EhoCJNTqbxIP99CVnpo+SRfOizu7odtIBNwLwkUJhHodOblOW+XMwIB
X-Received: by 2002:a05:600c:e54a:10b0:4a1:a475:d885 with SMTP id 5b1f17b1804b1-4a1d7634d26mr15613985e9.34.1792189517741;
        Fri, 16 Oct 2026 15:25:17 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4feb6bsm8149752f8f.41.2026.10.16.15.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:25:16 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Andre Gilerson <andre.gilerson@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] media: i2c: imx681: Add C-PHY support
Date: Fri, 16 Oct 2026 23:25:13 +0100
Message-ID: <20261016222513.23355-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016211450.62994-1-lsa.uz@pm.me>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com> <20261015-imx681-x1e-v1-2-fd22f5f3b0c5@gmail.com> <11f1a19d-7d57-497f-826e-901f9f88b99b@kernel.org> <20261016160853.193378-1-geocausa@gmail.com> <20261016211450.62994-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 22:14, Sergey Lebedev wrote:
> Either way it does not show C-PHY here; your reading on the Snapdragon
> model will tell whether the two differ.

They do not. Read on the Snapdragon model while the sensor streamed
3844x2640 at 30 fps over one C-PHY trio (linux-next with the PHY
series):

  0x0016/0x0017 = 0x06 0x81 (model 0x0681)
  0x0111 = 0x03   (CSI_SIGNALING_MODE, as written)
  0x0114 = 0x00   (CSI_LANE_MODE, as written)
  0x1600 = 0xff, 0x1601 = 0x03, 0x1602 = 0x04, 0x1603 = 0x01

So 0x1602 reports D-PHY only even while the part is transmitting C-PHY,
the same values as on the Intel model. The capability block cannot
confirm the mode on this sensor either way, so I will leave it out of
the evidence in the commit message and say why.

Thanks for reading it on your side.

George
