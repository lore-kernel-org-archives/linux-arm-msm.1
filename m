Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804263;
	b=4m9o+9+JICjQij1KLtz4Ol8AzYsOpJPRqQ5uutP7ioDkDtYuE17rh46UkRtj2Dqd1nHd
	 c5i+VH97ttJEU4GyXS73qeR12R89D6U7k0UNTwUKsJWAoj7e3gWNaMh0g9zUT6MBNjgcb
	 Sz+ZEFw6/qQYNtK/y2+v2lPGyRZEvO8aqKU1R8LY3ZbfN7VJ2uU5KNEG/ZimNndarck31
	 89JjQhsbJ3xBRs8NVRaGRyb5cots3In70ZKNCbcitM4MENorrtG0cjv4mS7s//dzon7oI
	 7SM9XaGyGGOMFOcEjoyGjFfNL/KN70r077FTAQ5GFYpHLijr7Tnq4NTpOdBV8ymNGHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804263;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NVAsAR5zG4xnELhxbpW9Ha7FNFWibj9egzi66nB2Mtw=;
	b=ALiyAPR5gpiyjMkbi6uJKNg6HmGcZrQkyYo16gDHYSdC9lQSBwVLECE/uiyNkh3fpllc
	 TCr3ldExf9iARERPJXGtafNjmTqZVp7Qakb+7cDoY5dab1/zEMAy1WjlSZTvdmBckY+0+
	 qdw6v8mPUSBh12YW1A9M/mSX9eymxOqids6XA0JbjQnJY3BDrROON/AxbEXxFur21Ql3h
	 kHQ7mDipNJdu12GFcPtYsQcQrfbYTlConwVfCYp1RQhOENemBkGJtGM2L30QVfUyJksMy
	 g383XjREpBpJMseZBgDEkHmc2BjuEkwDfSlYPEmmhzGScx+NzvjHjynQ3NGUOYODxOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843A606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 14:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7843A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490f38e9688so47421f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 06:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804262; x=1794409062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVAsAR5zG4xnELhxbpW9Ha7FNFWibj9egzi66nB2Mtw=;
        b=akQGo4Gdu9z/vudq711oH9EgiOPKY/qhGGccCddFtwyuXK5jLLZkMF5XnYcecBAcCJ
         D/YD/9+uBsd8MJCPfyAoHaAXUctnuyh6n1Obc318gOQBYGPPSqSubFhzKrGreQi6hXw3
         szpAtkesOKG0Z4uiL00sPGWeQyOyZ5J2VjGTnAQiycL/acUombxmQnlI7CLgvBBLSt84
         EDGpQedVfBw9mSlHAQz48KX+o78DNKy3/uiqTBQVWUvVCczvzI1zcAmFQ7vb6ITIMq9+
         oA8bHyF9Chk6G3BvjiraTb19WbDmJqiLEhnOO4ihexlMyXS54ELFVQEZmHggG4sz9xXO
         4AtA==
X-Forwarded-Encrypted: i=1; AKwUvBxOy8LKd8hQBJQre1tkeSy5TpJpVQ8FZN+1sAjnXBu2ND8wxyIgK5lpDyYfBgMElnY0sAkmr5zN/4SDjDzw@vger.kernel.org
X-Gm-Message-State: APuU4Z+pKwxhsEoQgZ5b0mPgOS7xkuc6kP27zWMynx8T/c7PyWm44xR+
	cEHCjT4odAR2q/0Jw7OyyCyk0FCgH48XJNfpDE1jW1nSj11RpGAl7+gJPOWBq/lFSwnoJ4Qbq7t
	2FymUgcHXGmi8
X-Gm-Gg: AYBFou3HpEK6ii/ILgYvCkdNe+NuCqbhRYmu9F7+d1vWoNX2XXjy8dj/Mpr7TpSnufW
	bQIic3y5oW4QZJuJoazpEMNCyl4dPPMeiYlelo8dBnrA6QJJcTK9VMr4OrNgsy1OGP3/litPhVJ
	Iy/JyatD4ZBihTUVpjHcPExOs8uIN1zDUrNcHbp/Trw74Ck3lYZvuItn8sFlg7brX56Y5NFisLn
	BCe19kA3F/sJm87tgrTcCV1ucx9+pG7nawRJM+HLHlqtHEcwLQNrMYk5zCrdp0/BP4nxkL+RFx9
	0klt1PGu8dQ7ICNaqTOTr6E9sU5iurmTG24zLqtBhQcdx0sDtVQuunv4CkFhqphT2qiyIVdGVvH
	r0hHboU7LSyRukoqPn3VY/VlPToPYkYGIJn6R4ZChC79S5C0819JRkea8SnCtGcl0U/gUB7eE6z
	0IgGymHX/H4XHF4rVHfXHjQgs3RV9OZKWy5xcGJ4b0mbIZUjE1e5gRkjPrB3sZkhg3byZbDioqZ
	DwhXu1qq99o11VaM/lYVhN8aJNAhq8r1BgajdNuQvc/pQqUyKWqaPsm67/z7hdjBXBqi5m9eAoB
	yP7lvgM3WXw5jCp+2sare09LUA==
X-Received: by 2002:a05:6000:4010:b0:48e:55bd:9cdf with SMTP id ffacd0b85a97d-48e6e2dd3a4mr40175116f8f.21.1793804261780;
        Wed, 04 Nov 2026 06:57:41 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8ef85sm4830051f8f.27.2026.11.04.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:57:41 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Schmidbauer <opensource@grische.xyz>
Subject: [PATCH 0/2] thermal/drivers/qcom/tsens: Drop __init from the ->init callbacks
Date: Wed,  4 Nov 2026 15:57:38 +0100
Message-ID: <20261104145740.2623473-1-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
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

Every function that tsens_probe() calls through priv->ops->init() is
marked __init, so a probe after free_initmem() jumps into freed memory.
On IPQ8064 with CONFIG_IPQ_LCC_806X disabled, fw_devlink defers the
probe of gcc and its tsens child until the deferred probe timeout,
which expires after init memory is freed.  On an Aruba AP-325 the probe
then crashes in init_common().  With CONFIG_QCOM_TSENS=m the driver has
the same problem once the module's init function has returned.

Patch 1 drops __init from init_common() in a one-line change that
applies to every stable tree.  Patch 2 drops it from the eight per-SoC
callbacks.

Patch 1 was tested on an Aruba AP-325 on a v7.2-rc7 based tree.

Not tested:
- Patch 2 on hardware.  None of msm8226, msm8909, msm8939, msm8952,
  msm8956, mdm9607, ipq5018, ipq5332 or ipq5424 was available, so patch
  2 is only compile-tested.
- CONFIG_QCOM_TSENS=m on hardware.

Christian Schmidbauer (2):
  thermal/drivers/qcom/tsens: Drop __init from init_common()
  thermal/drivers/qcom/tsens: Drop __init from the per-SoC ->init
    callbacks

 drivers/thermal/qcom/tsens-v0_1.c | 9 +++++----
 drivers/thermal/qcom/tsens-v1.c   | 7 ++++---
 drivers/thermal/qcom/tsens-v2.c   | 2 +-
 drivers/thermal/qcom/tsens.c      | 2 +-
 4 files changed, 11 insertions(+), 9 deletions(-)


base-commit: 2dc1f296b5754dd2441fc8b6613a362a47f6b98f
-- 
2.54.0

