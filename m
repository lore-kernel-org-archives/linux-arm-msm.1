Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119960;
	b=jmPdANTD8hfVaAC+lWq8nxgu16RZGj75kFHjyaJhEUJN6Kr9Vv49ujQ3/kiedBUb3x4O
	 sfU5FROvTLUN1E4H25CjnvumdXO+jtYuHJtEBjev3xijKGArWB+SnI7SEX31jEvnfmOgi
	 etNEkRtYenjsmz3C27WRrPjG+zi2tD2onTS83/0Dg/pgtTGu8uaen8gf2K5u61EMvZ9et
	 9nAdp1VrqFNN3+Zztqc7WmECzJQuSbW3a0NogHN+Afj6Db6eUb1oZpmyfx7WFnBjp6ryT
	 bqTuHl+mkJV78T9+/m+om4zzAOwnwBPI0I1JL4g5MLTT+pKKjG1+FXTseW/A/KPnbgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:Cc:To:From:X-Mailer:References:In-Reply-To;
	bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
	b=LAYBSCoJ2mIWN1/hh8GHzmdz8OR4/gyn6oXnQdK4Iv3O9ookYfF1N/neaMUaM3o5uMja
	 DOcGoUId4WC5nao7PHgUNTW32kZspOUnoMT3pcDXWP5P5vSEKpkxuIY6wbmFZvq48qaH8
	 nwjcg0wDWCA68CDlz0f8rUd+tHDjsKvCpb+6jJjoDqAGkg8QmFCt+Pa0vbKoV5TTXwaQM
	 AY+GHD6DzS2A/OchhWrQLmnQ1DaqEnlne6wwZjd6bGaNnxuhBdemR6++ry6GNx35fzjTZ
	 1uZfm171Csw4Ttqi3XmkTWdjY08wV0zbMujSjv8tvcfR6dNgaUTUe3mF/wAGzRPN3Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcjtgjTX;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043E606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7043E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcjtgjTX
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67a79750749so49512d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119958; x=1793724758; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=DcjtgjTXtEdgC1bhvRAnyTPZma5OI3VE4GrINbe/kwo65uZfS8pthPj5h9S6qxE13S
         1W3r4+mNCNnWztUjUx8kR85VHvB9QEJcnxYNBBvXygSXWpm5BxopqumeMaCqfZf4sTOw
         GU4/QAcRk5Rne9D/p0QpbBEmO7Ezk7ck0iR/4t83S6IqgJgxynokhs6JXZBoZRaSvL9L
         MM6LpL9+OcsV44QoNIjOndAbdR77JAQm68NRn4865j/Ky/wQ8lNHx5WJkgcWe1a51Glh
         lXpZbphucm6YwvQ3MQbGOvAhhMOrCk5v/WdwpwrrIShf+VWFpjZvHiEIW6LtszDxxtRq
         kjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119958; x=1793724758;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=UlSn/qoMQIkGnZBt2w8rVzQS/hpsrMY9B12nuvtFQKBKJLCutN7+LWAgVsJhivuK4F
         DslKz5fvpbEAAaAgmBie+0FKVVXD72GapSONSY8mRpsKWsdC9sdB4o3U59PQj59hq2ls
         exmWWO4hfysCRaW4eeRSaFV3e1I5FrAyROjK+rLFUE3vqKuVshVV3mIkwPNjOZciLWJ5
         P2bbECecmVpO3v72tMevsXXCfbDAFH+cvf1n1My5WDlX4JOOteYft6qrA0x+gbixsCWn
         71Dt+tmFgOx2O6jOKNTPwmj3ikSbpy8FIQdmX6FNbbqBkGUupLFYN2Jcx9l4SuysURrI
         4+wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy3Gp1kDE059lukGBSd2WEG61b/OdtmJfareNVOMwFNZ8qxLTJNq0OqHEIpkGuEKY58FTd9W9070reeSFj@vger.kernel.org
X-Gm-Message-State: AFq9FYISzjNvGxWkc9qXr+P/sZHndRp3ku4bL1xb3eEJFlJvCWXacRDH
	U1Ho7dOu7tU3dB7tihboOg4rXrjHuQl0eLAWAHPMEJmkS1bpoeeCBq+v
X-Gm-Gg: AYBFou05/zO4Q9lK4sZIeM6KcxYv5rzWI8Ar0BjwCo963pEZKP5g/zKLtacKpPfLQkC
	i8LocyxIzVk3Xw+gsFBljg6xUDact3+sYU/7T+vpSl1QNxOyfX0nqKyttFQH/PYJnarPnbty5bO
	skyXzWBTtuz0E4l3vOMSfUA9AWK+3cqCewjHSM88qryKQh3JDqwEgYxckAPskASRNZiq8TtZAxS
	ihkLrDrGeuPyQzW5yLqqpWJi4A6upnC0lavlFlpPHtk+YJU6H7MfqQe7WESXcX/d8Iblpk4wIJa
	G/yBnZ3yEPsNynt/6cT1XyWBiJaM/7wBSIfPv/zNK+0ZTx/fB8PrybcxfzevQvjke2wCiZDDWC4
	PwsHMXecSo8QlOFP5VS3af5GDa3hpid6VX1LIpGLtgPQLT5iKCFwsWRDFyExAmMjF2KHjMJ5EF3
	JO9nfCh3P+ABKd++aqnyMIB4wXJMzRKI/BaFRzgYRofHLy9FxRYxi1kU5tOOFrWqByFqYNsp7ja
	zLWGuVLceJr7BlH5j3/lfk2E+qIiZjYWDWBnWw1Wao3FqESb0owTA+O/LOnbviFXMllXInQN88B
	qrhB6aRvi7S5j9G2jGg7Wy0Bbkz4gxzmk+tJ6nCeOrigW42DVouWq4myHLCh7U25XhSi9lYOM19
	BcSeVTs/fq4mI
X-Received: by 2002:a53:e7d0:0:b0:677:c8af:d149 with SMTP id 956f58d0204a3-67a7bd1804fmr61705d50.74.1793119958354;
        Tue, 27 Oct 2026 09:52:38 -0700 (PDT)
Received: from localhost (host-209-35-187-178.broadbandcancun.mx. [209.35.187.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a080d4csm425545d50.4.2026.10.27.09.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:52:37 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 11:52:34 -0500
Message-Id: <DMFRZ3B3A6CH.P7SKUZSQR23T@gmail.com>
Subject: Re: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event
 enable helpers
Cc: <chrome-platform@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Marco Elver"
 <elver@google.com>, "Bart Van Assche" <bvanassche@acm.org>
To: "Rupesh Majhi" <zoone.rupert@gmail.com>, "Alex Lanzano"
 <lanzano.alex@gmail.com>, "Andy Shevchenko" <andy@kernel.org>, "Benson
 Leung" <bleung@chromium.org>, "David Lechner" <dlechner@baylibre.com>,
 "Guenter Roeck" <groeck@chromium.org>, "Jagath Jog J"
 <jagathjog1996@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jean-Baptiste Maneyrol"
 <jean-baptiste.maneyrol@tdk.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jinseob Kim" <kimjinseob88@gmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Remi Buisson"
 <remi.buisson@tdk.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-9-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-9-zoone.rupert@gmail.com>

On Tue Oct 27, 2026 at 7:49 AM EST, Rupesh Majhi wrote:
> veml6031x00_event_enable() and veml6031x00_event_disable() call
> veml6031x00_set_interrupt(), which needs irq_lock held. Their only
> caller holds it, so mark both __must_hold(&data->irq_lock).
>
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
> ---
> Cc: Marco Elver <elver@google.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
>
>  drivers/iio/light/veml6031x00.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index f6308498e422..476ac3717f8e 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
> @@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_d=
ev *iio,
>  }
>
>  static int veml6031x00_event_enable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev =3D regmap_get_device(data->regmap);
>  	int ret;
> @@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x0=
0_data *data)
>  }
>
>  static int veml6031x00_event_disable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev =3D regmap_get_device(data->regmap);
>  	int ret;

Thanks!

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
