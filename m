Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960DC3E40E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389705; cv=none; b=swlq2rYmzjGh/egvxJ1gunKjnlco7GVEO+ZYT2JZCDNa4AywdkYD/UpSOLrxkilApXhNT4zg8+EHwpAM2BQjJe2Wn7VBDJQHKau8R62u+iqpnYCx0YOZ/8G/iUdm4Rpsp+tXs2T5/YUrWK0XwSYrduCbokXQuSWZepUdUWURwlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389705; c=relaxed/simple;
	bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IT+pnyfdMO2J/BqOakvqd8JU9qiXH1h0uDrKqDdGA9MoH6lN8n8O0WbKRElPaF3R+bu4CgJkSrfLG+S0NrEjn4uPpV8lGu+E4KvKPUEn7Vd+uy03BrLuf10QJW2/UBqouy9+xzp+UKDE/4LiedaGPit085bvglYxsNkxdL90Esk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVarydKM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVarydKM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so11467515e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792389703; x=1792994503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
        b=CVarydKM2wPlPmY7W169tHSfWFl/CO+e0ZQNdVNxHgnsF1cLhZdnd5KrzqSKSRIj3F
         BhjQa0+AgMTIBtzUv1gcIPtEkmtlAQelga0SCTVjqI4z/FVPMrlVHlQ5+sNxIMx0X6qS
         GON9q9J5eu71Mnt932uqrMTyDoSP5AHM8AKYVrCTe753yFILDipd+LYKyD8GboP9u5FP
         oKF5Bj/5+bjmxkVDc2RJOV+f62G1pg33r8rl+rYpr2JHAsH+W8W8XhrMn6QrDtsKLEwd
         o4cciSt0juX4Dr0VlVj48jQaMX2ozAwg4lvLoWuT0T24QFqIj8tt2uKBAj1Yy/4EXm6t
         QeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389703; x=1792994503;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
        b=P9nIoywmVlt1F9hVmp5/6e/3CNkxWXPYe5PmG9J2FDcvu72iJalzm1rTB711rq3XLg
         +fTiWqpX8xT6jo7cQTOOxClyR2tqkYOV2DSQ4SQvlYmVfsyz4wHUIeze0NWbBLa5vF/v
         VP+7Qi73XBcYx8ponjNG1bfdhClb1uFbQaqxBEraZG5Yq+y9NSvPqbgmpBT48xEo/whh
         +A3tVHORTomUEieo/Gch41A/LM7tLsSVLT60kDSkcR8x5xpBke8b41ByFJH9xSI5eqs/
         Iq4mbf772LdI3Z3H/8HuxAPCDELSYIM8YIfifSfc9tSkFudeGOdrtpu0kL5lYrqsjBr2
         7lww==
X-Forwarded-Encrypted: i=1; AKwUvBymr7e4EO7ut2v2WJBixDybzXPXhqvkDyK79Vu+uUDHsy6RWuN8PnVh6/lURxrDFe4bn0rWhsTgyRpYrwSp@vger.kernel.org
X-Gm-Message-State: AFq9FYK71Wkyf/3YKQS6MocZEELg5jiRvGODbBKFuXjxoV0vNMaYIL0h
	gyIK6VABadwFAPQI5ft78UExfRwp91R/14tjrCrhAzh6a4Mkkn+tP90x
X-Gm-Gg: AYBFou3LJwRqi43qh0iNpDEeBbjYb8cJSgFA26DWUMHb2Njv5oY34UCk6WFXHlyOZKi
	65r0kBaOM6B1QK9Kn3antFsFbBhBlpqIhDVRZIR76lkgsLkx+LXNSA91Hrxh2hpExtptkgf6oYX
	HwKhvRiU3QBtbZ33wuBofmrYfUqWkGKsx5dYm6qrF+J+H+XSUte7Wni4Z8pqzCX+pKg5tdXGSc2
	hTn4X+8mMg+g3ADrCF7PreG+C0hb7KqTSP71t7Mt6mCruEB9ruGTRe5b9HcH62r4klfg7HN5khK
	kDP/pLD/yBdc826/C+ppfO6JndTx/1LCKokrRaeRadYzWrQQEONUD0gPzS12mMvLtOJdl9xSUHb
	fSNqz2ovQF0YRilGeVaGdK05nWCzc2KmJY0g0xH8xf/a1JQZSYY7lFjUh/cJBLUQjAdOE51vR2z
	qLhjx4Uzrn4mcf8Xod/NDeEj/8+7uPoL8uqxzkwXvSGXQ7U1t1aIFxPZjtWs1ODQfwgZLKj43wM
	UYISILJ+epVnaOyXOu/MOYWSzTHlPOEVeEWM1qqgPzzJNOXK4L3P4/AGybNQB0/0E1lYsns
X-Received: by 2002:a05:600c:8709:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a1d75f8f28mr128077975e9.18.1792389702573;
        Sun, 18 Oct 2026 23:01:42 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm17817528f8f.3.2026.10.18.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:01:42 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Date: Mon, 19 Oct 2026 07:01:40 +0100
Message-ID: <179238891227.1168109.10270505331710088980@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019054322.3675-1-lsa.uz@pm.me>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com> <20261019054322.3675-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792389254; l=701; i=geocausa@gmail.com; s=20261015; h=from:subject:message-id; bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=; b=DS7K/pbNV69ikcT4O9oFfkWuvpKoUT5+ggT/mW2lfw4MIoEmtfMQ6LjF/XliH8N0jK5n87w1q uwvJ3HiXCG0AghdVQjgFgM7sMmoQ+WnIBL20m2Anfrzo00reccsco6s
X-Developer-Key: i=geocausa@gmail.com; a=ed25519; pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 05:43:30AM +0000, Sergey Lebedev wrote:
> Retested v2 on the Intel model, on media next with the power-on v4.
> Loaded before the IPU driver, the sensor's probe defers ("parsing
> endpoint failed" in devices_deferred) and binds once ipu-bridge has
> built the endpoint. It then streams 4224x3136 at 29.95 fps, and
> v4l2-compliance passes 46 of 46 on the subdev.
> So the Tested-by stands for v2.

Thanks Sergey, much appreciated -- especially for turning this around so
quickly.

That confirms the deferred-probe path behaves as intended on the Intel
model. Thanks as well for reconfirming the Tested-by on v2 and on the
colorspace fix.

Best regards,
George
