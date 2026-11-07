Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017534;
	b=QysVVJZZYt4RYRl/aHpvY/yKCwRAlqEs6+iHaD2vLcUoXiWTfy8Kf9UZYsY2XEGZtPtf
	 svy3pwZ6ARJipPBRcX7O8y0IaiwYGqwkzAX4YScNJ3EneOZb1+MjRbapQBwho3gtAfmgY
	 ijyOerQgsknafwWg9XUlJ2DeCPK3zJf4S5wtB9YCq0UUOkdbvunMKX2pGTUX7Lzc6DjTn
	 /YPx+C07Lt0Y0zG3NELZ3ZUDO0WdkeSH0wwNEHQ1qQfXAruf9G5kaSzktpcE44mD1KiGz
	 shqj8cYAc7QBPSRPxQI9OLRlZsu6QcN6MxWUVVMH4lCO6zePrfrMM9+kTA/VGwzjz5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=agfHd5pdc/EdSGq69ep6mXfkA+pM523Mmt9NosKXhZI=;
	b=H5LRgUeiKEdyWalGhJlfnbDfIebPWYRY4J6IfGeWTs+MFB5mDJ3TIj1hA/Nme952MTeO
	 GTpQjvkp3YZ8LausZNh/m3GUP5FNDNyq0DhO2W5DD0FE8hL42kpOvzbyyx+GG3/03CISn
	 nRpS3ugtm/g3WueCAOlnD24Nlfl/PDw7zcTJZcRsU807efSrnNI6YLd4UpmQVNNKTuEGn
	 TQd6RCK5Z6kdlEqxAnfII2YnhlfEWvOYaPsGC4zYn8Blz1zOaFsTNgbvY3R++lnmefQHO
	 qJnt7p5T7XSBpV97qi65Z64rjh6Uoqxh0txv/4abQuzD+yxrhHnCATdqmhu+So3r3jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk1G2P3V;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CBC606A336
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96CBC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk1G2P3V
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35829219da8so271529eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017534; x=1794622334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=agfHd5pdc/EdSGq69ep6mXfkA+pM523Mmt9NosKXhZI=;
        b=vk1G2P3VZonFehrlwAOTR2M8l4khy55Bf3En/v5J6SKdNEhWGermAOXjyGXZhxHt/m
         li2H6VU7eCT2IG0iYJeXtA4GIfIGZU8K/wqkI8YriPjsSDI9sJxnEszcifYwE+0m/Jd0
         C5UIQIjjDNBWcRxcv/Qs0KWpeehmwAceLrRZD4PilxzOiapEsEXJDREYFT2ZkvUh1X4Y
         AEyT7gy3oxWOinZJYQ12n1y9uGeO0LsKbLxAC407865IMGoHus3APRczL/RMoY2X6kTn
         bb347asks24Qjd9DuIsUEEjUpjEPd3/ItU3YKS/w8Pp61uKZceRCtgKZRg7GiX5IgnSM
         tCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017534; x=1794622334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=agfHd5pdc/EdSGq69ep6mXfkA+pM523Mmt9NosKXhZI=;
        b=2X4nJAb+H89fs0zgq0Y2F/p67CDmk5uSHOmepz9RA3fJYgsE1YrYgY60ZGxSUi6+uo
         z1AeCcqxCDYkfzr6gGqipaqgPDdPyH/N09IqGmlY6Cjl0iNy6iC5P5Gm6NeKe20OsmiZ
         c1V/0WYNaEsJFRxHuw2fGAsHlaSSOptUbP7yfJkOQmv/YoVtTt2J8/JVPlStMc9EhUur
         xjJm5Axox55QoQ/WuT/HpniHluLyqgmyG+7J8HtEy8G9GuHQ96LRY2g5c/UlFrsjvJlN
         crLFpSV1y0DRh3IOGBfLeXgAruTaDHa8w/qsEkdZxBH4EcgBazWVKuqvS1OHXpHPiUYq
         GDsw==
X-Forwarded-Encrypted: i=1; AL+hErH3/K21FUyBlMDFI68n9g3rOKue1XjKpxUoqm7ExNM0/1Q+GoVx+k3hA/8KmICEsuaLA986Z1An/Srwjk91@vger.kernel.org
X-Gm-Message-State: APuU4Z87QunPbcUQG2ja9rB4suo3SdMYyK31mtMIbepCYYHUO8gu578C
	lftNxqD3H9PnmJjhTwNvC1ZjsxGkwmVSvA9BOOLi3PKaPXbcKwORqr+8
X-Gm-Gg: AYBFou2bS4GyMDO3xn6m/OLvwZiFgAw8tnJ2poyh8slMJgMr0AijeY+1j/BPAZw8Ayj
	IxatGkDXBCyLZN75zBIr1rFMVakxIpBnBgRXbI4AEQTle2OJhTS/XXeTd891Sy9ruzFn9pNE4ci
	Dt7bzvHfAg00fB3snVJs1r7f0/cbkszJ82uXWhh0L2pR8Q8eXp7RGIwyUZlJtYuhL8Kr7KPJS/1
	CFlVXuid14UJfm+NCuq0UUqlOB7IOTZ0WPuR5vO5Hwquzj8Offzixdv/xjTFqwD6NLIqKY1QDYl
	JmvmETAwathj9aqhYjUXiYlCmVzLgvsLGmKFhmi8nLQvU+mJYEXUDTZTju+M4W+otkO9eMV5veC
	nPb9mRrEzmr+alcP6WIzyXv345kQW+/meT5iX6HdApLQIVUg9Ouw/mQBU9EyDXh4FR9H/A8aFeD
	CrBcXapf5jOcxPXB4euTKix1ctW8OVgS8zHURIh943aqML7xGbufXQCJ5A0g017Dq27otUqx5YP
	Fz4q0/GlgQTrmNx6Zl12sqkCKRwYF0T2qkInOUQ400wdo2i7XptuByXGfzQAjO7dwC54ae8KCyO
	NJDbIFqIpRUTrHh4wUSZ8+ZeUvSZ7oUZYlvcZMV8MNVxFWk1ayMO+bjkGTUiMlkaxQ==
X-Received: by 2002:a05:693c:88d0:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-370f71bacabmr1019359eec.15.1794017533493;
        Fri, 06 Nov 2026 18:12:13 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm10374563eec.23.2026.11.06.18.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:12:13 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: replay last HPD status on hpd_enable
Date: Sat,  7 Nov 2026 11:12:16 +0900
Message-ID: <20261107021216.952-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
References: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 03 Aug 2026 16:43:08 +0800, Yongxing Mou wrote:
> If a downstream consumer (e.g. drm_bridge_connector attached by the
> msm/dp driver) registers its HPD callback after an upstream driver
> has already reported a HPD event through drm_aux_hpd_bridge_notify(),
> the notification is dropped because bridge->hpd_cb is still NULL.

The same happens on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a
monitor attached at boot, when pmic_glink_altmode probes late because a
mode switch it waits for is a module. A kprobe trace shows the HPD event
from pmic_glink_altmode arriving with no hpd_cb set, and the DP driver
enabling HPD about 2.6 s later.

On the two Sashiko points: I tested a variant that replays the status
from .hpd_enable directly instead of from a work item.
drm_bridge_hpd_enable() has already released hpd_mutex when it calls
.hpd_enable (only hpd_state_mutex is held), so drm_bridge_hpd_notify()
can be called there, and there is no work item to cancel on unbind.
That leaves the stale status. A mutex in drm_aux_hpd_bridge_data, held
around storing and notifying in drm_aux_hpd_bridge_notify() and around
reading and notifying in .hpd_enable, closes it. Roughly (plus
devm_mutex_init() and the initial unknown status in probe):

 struct drm_aux_hpd_bridge_data {
 	struct drm_bridge bridge;
 	struct device *dev;
+	struct mutex lock;
+	enum drm_connector_status status;
 };
@@ drm_aux_hpd_bridge_notify()
 	if (!data)
 		return;
 
+	guard(mutex)(&data->lock);
+	data->status = status;
 	drm_bridge_hpd_notify(&data->bridge, status);
 }
@@
+static void drm_aux_hpd_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct drm_aux_hpd_bridge_data *data =
+		container_of(bridge, struct drm_aux_hpd_bridge_data, bridge);
+
+	guard(mutex)(&data->lock);
+	if (data->status != connector_status_unknown)
+		drm_bridge_hpd_notify(bridge, data->status);
+}

With the mutex, the monitor was detected in 2 of 2 boots, and 2
replugs and 2 s2idle cycles still worked. An earlier version without
the mutex was detected in 4 of 4 boots.

Dmitry's "drm/bridge: aux-hpd: let drivers pass IRQ_HPD events"
changes drm_aux_hpd_bridge_notify(), so v2 may need to go on top of it:
https://lore.kernel.org/all/20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com/

I can test v2.

Thanks,
Joonhoe Kim
