Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206240;
	b=rV7GeKQcjo5MFOJNTQrcLSHbnhdhZpjG5wkkxdjLg0+2L1/enICHBlYbhC+5w1xKOARK
	 w1WyFxShcIPJ9RCIq8XJIM/BL6PI5IhHVdoTQIF4dHcLDmbrzgyI1BhzsvC3V4i8zuu7n
	 VPUiQjX4eya3z3083YQRodFyhg8SGl8OeZFEJQWrPjlEbBqHsv6Mcu56fvqoEZb5Tq25/
	 /m76osT1llgVEbTtOS/6Etrl4+4Ht4T08OpLSfZMtC4E3g4u0KgjbPdt6AsllgEJGPVnN
	 gerjdLgncolRQMD1nL9XbueP7h8WYb7qa5HMc/MWZUFTWDtooUm0qpli5J8pHIhmTUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
	b=tmsyu55hEtsxdLMKgXeHlcusYBiS+7OVUSRJTJled+0L/sG1HB40oTzhNtjLXWG17ZuM
	 K0wUq4g/cLXWe7P+rvhIC6TcYafit8wCSi0ySxSLSXZbC9B5gkFg7kjiPslG80H7J0gh4
	 FXArVyoCy7Jd+/p7vCmmZJkSmaRvijC+Aka1MbglRETWaY3+CkM+xnIWuU3RItb6q0vzJ
	 EUEaOmz2dapUh4WE20+/ovkAMScfJP9iHbgwzQSOcqcQNv49x+yoZ8v3gCq1TI9CgOG+J
	 CkBz+t5yQt5B5B1AZN8rv0zJ5LgqJx7auLQaXXirUjUeEbAV8TqV/DZFCmhPcuUgFxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2989C606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 16:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2989C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13630455e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=bvVViE7sfBqKWfi/kLDJYlnvzOUXPLQxwi7WE8YcmF6ZlMSeeXt5LVtwTgYjpBwkt8
         SYP3vMcQXr/owFcgMM1gE2QwZ/DTceP96Ogemeuc3wSVYptLjbh5WQ0zOa/QFUl5Bsyv
         t91KeRJRSejTTfSC30ERKT+SYsNtmNlFP19tG7VGrb/Fyrtxkv8HCWTMM4co1xxufiUC
         fsayYomNX2KXae5ip40Tnzxu0+b09pZZ8pnmB2UJbRFHhmlzRF7my1fWETNYJaMtDwI5
         xLbeFqSzSFzkr23lLp9iNBgX8plx3P3KNsPgixIQp18S34Dqr3UjM2Pb0SImAbIC4Wby
         52og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=vravN90LuoAyBEVKsJ6gUI4PDSnv3B9iIQRw6LFWj68ML1kO5NmZyn5B2Oem2/fx44
         X2JMOEd+A75kkRaHckeWpHEtLfYHSpNsJ9ic02kgzDEoDaXSQKaHrrpMKLEBpuo1x1wC
         SmlKvdIZ6JRKHacTSCLoArCrWQTj0z/LyrH8ETxnkF5WA8uoEturALzr9AUFzsac4OPw
         cpSTDSIOF3QiZOzmK/ONGnJd9mGzivIoRd3TVrOUr7sR/de16i1t+cNkcUbTqBCT0rce
         rNHFLsD1njcdXJLdL2WKzWcXHAF7rc+q/KcNizDJER3o/3G9HNE1UXwqeMTiUGIVgfr3
         Hoog==
X-Forwarded-Encrypted: i=1; AKwUvBwJ7O4lXkc9cKTUQbN927thBxyYweeAnUZH59TwLrUxcJCAQ2TmPulXpzq1rP9Rd60cgPkgwTslsbRH8x6F@vger.kernel.org
X-Gm-Message-State: AFq9FYL1A2/5DrBLxUgCoHVXrzl2mNgWlmhIWgRFrGRwx//bwwB1f7oe
	OwvHM1JHYzuXO6mdSmK4d6iMg6A3PcafW+Px5MxukI+hxiPTc/KKmgGl
X-Gm-Gg: AYBFou2ifZLCbc/oFrzGGmWJ+Lzx6jZALjIbMiojufOQpHlfX7jF5QzR5PiEw3ll1Tf
	sqP4ShEzzfMUirizhlc95I/u7OWGdjtI5iEhfEl9fNDLtj3CyCxQLaXYz4ELg+POW6qU0/fZ+Mc
	3tV64uFMXwevap4BZaeqyOEsNNnEIpzNzh2kGr8T4d3tT1G7I8xmgTA7jfyzwCy1kaok7K+CL8H
	Z6Lk6mPOKIxW2yuNnGdGe0C81WQlLyOsUOlTKGjvFnJ6Cjq6LJh2ohug7299vjaiYKnusp4MOf9
	cm7hEy3z2bKCGMmwjPKFdbVTftE7h2ubmVUuIVKMrSTSL/v3VGSeO8swbg2PJ/MG/pfbPIbrk/F
	UWS5RCaa1ZCloGkO9Ldir+5FqZw38iA8mOdI1wKolxc3Yqnwi8Xf6Hj+7echFvdo/0J9WrKy4y1
	qGw4ma/SuT0YevLt34skr4Tf9JQqPdwB2UOF/llyHMz1/ELtMjaxUq++P3LJOSpZhbt8h6KTE26
	n7tS1geThnKTsV9OHtjZz7UGUvH3eJnJOfp1v2hj1orH74xkhwVvlD/e967CIY+THDSnUvS1iVe
	36k5kh18C9fH3TJlQtss6o1PNQpRxMM3eiaVjmjgfmj4GfSLF7AqFVqIpDZw9CkZuqNUmtrILZL
	UhdikZ2jQBRhRr/+0
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel
