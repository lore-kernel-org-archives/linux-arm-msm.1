Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9469A3B8BCC
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043027; cv=none; b=BsZ/Zo9RHUUzj9VxlJKber0Mgqw1jUgFG2P9zIwl7/4woRKaSINwp450OcXhWIvDS7niKItAFEQZGAVQ1dzBOLIkktKq2rBcp45AR9gAPbjAbvCKaqHtPFxd5kwVeus5lqNYQDEJb21c0ZNZcgXJIUjRuxj/q1aed3nplwQ2V0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043027; c=relaxed/simple;
	bh=hVjwrs36QDvWL50htkLYGsmbGmGTIUKSnLJBPQH8pPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLSWyuJ6OMzwEUaq5+Opw04zgZD1o+k5CVpQcJ4UVT2tvEcskTHkTUE6G2ZzLXRNm40LFr5hi0w8B805/eDQTSZk6YrjRox02hy8TgCAhlNSXd0gK1Rl/7e/dc9p5c5iR6lMufxbaOPOo7UVJcAQHhGwuYTyJ8ony11c5e2rrWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HsNX6XwL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HsNX6XwL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso29205025e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787043023; x=1787647823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g89jeqUdrFfNXRk/XO6uIU0AIb/g2xr+NqXbPSW0USg=;
        b=HsNX6XwLOOjHThBh3G4UsxRX2T2iuD1Mna4L8yVuvRkdO268Xr61dV7vezmV5G8AMC
         qLzVojOAKCwJbFFT2SuIiy4ao9Av16sXKwENEg5gfJtrNS19Hren/vdetHda4OPtRCVh
         xlrmoEHY91cPS+jcrRNfzd6RBR7d4mQnezgaYGU7pZqi4PqkjRV7urxDXjl5oUUv6Dl6
         yAli7g2Iwi73bFCHYKhL+8LuTw74cmdrsAZpcKrvChi+VThRqobWYwT3ESQoSjdIc911
         h8AlZVYc6ZLOPfhJSnn9+G5D0oWsSEQFKTqdXIa7n4APbcspzJCKfUQmaACZ8n91WcCC
         SGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043023; x=1787647823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g89jeqUdrFfNXRk/XO6uIU0AIb/g2xr+NqXbPSW0USg=;
        b=Q1GR4kgzmcMw2xt7Mwb0qTt1IneQDH2yxO9BZT3GuAZqTBCjyN8Dyw9C2fJWBWHaCI
         HbsoFnWAGhdGV9y4Hf+WaRjhu0Tsuy04Fo0LLIs7gVyVcUyiI87OzR/LPb8b+XBWZz7i
         /JfZqRnPIs4TnDl9fGed6VFeXdjqY20bia6/lDmHLLrFZXJZwQlFUG7VFlJAF37nRJt8
         m8Ew8OtVs1qraMJI5MlCm8+Fg4cJLqQfecBvjEgMZuBnXjGBPska17XsY2jZhQqWnxV8
         lFkEu5ucfS0+T2pCGoNP0eUGcgnA+KOZpT9gDYRJ7Fl6KmMzYoL/yGhumu0K59hveVnS
         n0PQ==
X-Forwarded-Encrypted: i=1; AHgh+RohU3f4XN3GQmvVJKZqkThP2JNaS8xc71j01zCLmPMkuyU3HVc5bD4OXDrfOAgNEZKnNtbHK2gQrQuEtBJG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/cuL7ce/E+1XhvQMMVFRqLcDGp8/XRlggoHTyVU5nrc9CZHRh
	B63e9KaH/2k4q0FxISoAyuYbS3505+//Pd2kIubrtqWPDPStQ/pwAK3zb/CsRHI3kRM=
X-Gm-Gg: AR+sD10hv8ewP8+45YhFfbsLYvNUSFWcLGLfGK4x+r8vrZN2y+WIjhd2/GRgLESgEWX
	xE/wJZyNBHD7WkeqY6401oJY3bqiZ6icpwo6Ocr2korYoSO09YFuXJlIo/YU66P4Stf66nB4NGI
	V1MFq0HO7e6DF0D/Mr7MRjLPKlAWY3u4KdK24O/1rbtD+Ot9UlrTdJ2403XQ88NZfGbVnsLuuEl
	LHhBPPNuBGphlZ8FGZ0dtiwY5+u/GRxehBmnX3+9exGKMImUvRPL8uKHunPJ3JokH6pvxBCdLSX
	npsSHmmocp6PrslPXdS1/HCv8NkEv+EJFO1ZyCJghaOAC6BkyKGJlqlQELjfK7JKekV2CPVLgxR
	9vOaVBfavcwainaatbYch/Uxzy7NBZ6rwecBGzScFUO41qvIF2CC//pS2ORVJjlDuaIaCvcB//h
	hUYmc5YkgjcnL7UwuMvmvSu6Qr120mFKmCaBNfZdyNVpQlEIgBMsvfHZtZSxcbcx/beVRSFtVdI
	S9u/6/JhO02aZjfonsxhzNFDdb6UEnEVwHhgKSSzYJtouGyBt4kTKff+DAeDZyF
X-Received: by 2002:a05:600c:4f52:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4998793dafcmr498537755e9.7.1787043022601;
        Tue, 18 Aug 2026 01:50:22 -0700 (PDT)
Received: from localhost (p200300f65f01710416869d85a644e839.dip0.t-ipconnect.de. [2003:f6:5f01:7104:1686:9d85:a644:e839])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49996183b89sm277907285e9.12.2026.08.18.01.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:50:21 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:50:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Message-ID: <aoQbo-k7QA5YpUNm@monoceros>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55khwhgfrwnyjsj7"
Content-Disposition: inline
In-Reply-To: <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>


--55khwhgfrwnyjsj7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
MIME-Version: 1.0

Hello,

On Mon, Aug 17, 2026 at 03:44:34PM +0530, Sumit Kumar wrote:
> +#include <linux/mhi.h>
> +#include <linux/mod_devicetable.h>

Please rely on <linux/mhi.h> to provide mhi_device_id and drop the
inclusion for <linux/mod_devicetable.h>. The latter header is ugly and
should go away soon.

> [...]
> +static struct attribute *mhi_loopback_attrs[] = {
> +	&dev_attr_tre_size.attr,
> +	&dev_attr_max_tre_size.attr,
> +	&dev_attr_num_tre.attr,
> +	&dev_attr_start.attr,
> +	NULL,

Please no , after sentinel entries.

> +};
> +
> +static const struct attribute_group mhi_loopback_group = {
> +	.attrs = mhi_loopback_attrs,
> +};
> +
> +static int mhi_loopback_probe(struct mhi_device *mhi_dev,
> +			      const struct mhi_device_id *id)
> +{
> +	struct mhi_loopback *loopback;
> +	int ret;
> +
> +	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
> +	if (!loopback)
> +		return -ENOMEM;
> +
> +	loopback->mdev = mhi_dev;
> +	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
> +	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
> +
> +	mutex_init(&loopback->lb_mutex);
> +	init_completion(&loopback->comp);
> +
> +	dev_set_drvdata(&mhi_dev->dev, loopback);
> +
> +	ret = mhi_prepare_for_transfer(mhi_dev);
> +	if (ret) {
> +		dev_err(&mhi_dev->dev, "Failed to prepare for transfers: %d\n", ret);

dev_err_probe() please.

> +		return ret;
> +	}
> +
> +	ret = sysfs_create_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
> +	if (ret) {
> +		dev_err(&mhi_dev->dev, "Failed to create sysfs attributes: %d\n", ret);
> +		mhi_unprepare_from_transfer(mhi_dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mhi_loopback_remove(struct mhi_device *mhi_dev)
> +{
> +	/* Blocks until any in-progress store() has returned */
> +	sysfs_remove_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
> +	mhi_unprepare_from_transfer(mhi_dev);
> +}
> +
> +static const struct mhi_device_id mhi_loopback_id_table[] = {
> +	{ .chan = "LOOPBACK"},
> +	{}

{ } (i.e. a space between the curly braces) is the more common way to
write that. Please also add a space before the closing } in the line
above.

> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);

Best regards
Uwe

--55khwhgfrwnyjsj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqEHMgACgkQj4D7WH0S
/k4Yugf/VIbH7UA6qkvWrTAx0hVC7cD+37HWFqkx+JBQkWIH3GNC4GBqdiFF0QUt
SbQ7kzmrBFpVoag3BE7OyuFRYkUTToDJ1gPrBpCTaar1L620vJhADxQyeMqLgDVn
gTxRAIgZt47wXLmyyAd2NP1bD5fw5o1IOf1mmSBEuIyIG2j1Kx+k9DIHLU3bSaMw
6ZBZSVUvM7twDtxUGqLchNqtPwM8I/X0HTEw8CUrEmnACQBdU4Epf7i2Q/+HiJ/k
/SrieoMHYSbZdwdD/OIBpDVNurLU1uOfWU73VY7FWgTlx7pxhNgVn8ijH8vY1rm2
ZAlWvXubjzmvOR4Yf+URP8R72NhMuw==
=n/i3
-----END PGP SIGNATURE-----

--55khwhgfrwnyjsj7--
