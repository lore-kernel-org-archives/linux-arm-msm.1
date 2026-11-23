Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466057;
	b=Fxr0mTmvaAyzcZ/UcM9vEsV3aq+kRbAF8M3GyTHkJYK7ji+MoCuhLymy519+K1pVKffP
	 ORM4FGXq3w3CGdG154pnNx5epFXWlAsS0xwiYYiVhUFJV6VNp/RS0M8N9Ndc8HPch/nZ9
	 nb6SeLeWtU99mSu9h4X63TWkwdJhHHMdHfS7ufDXWxqJmaaeFm2OpoC9T457Gzcblp5gi
	 42PKQOgSUNdvNjVNvHqTyWnrbhKeeulHrJUKreln7bylzPwxhjMZfbMxMZ1/rioRR/yxQ
	 9uAoMGM1Wqqq5bfjRONd92gB5v75nzG5PwAT5X7etTy4hbpW455u4smk1CiPgytcFPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hPT/ypmWmLMxLtJbyhU72b/6yrEAVjSw6rFwMDxvsHg=;
	b=wm3Wq4NVsVhM4NG9Xw5QGbA0tf0y3UyLgCHlrSZlJbXRUHdnDs6G7E1APTieS3lYl8wJ
	 +7FJy4RUHY+mqDXbadPPs8OJ2gx0aKYgfwtV/FbGq9ToMI1YIlqBlVclcdZepZymfY4Z+
	 6sQbWtHGwaRaaJrbjSU8CWBYJZf99qjDGPiDi1AtxFO97t7Npz7u7H8bMjHfh5MNkcTjn
	 dNKx1jMt7cKRiEI9oo0ePlEinsnRgRf9RLAEevk8RtvsgV/k5h1W1l0qfKg3jq6TsDwqr
	 UUwQibnnbWiBeMlSMcm5dmWj3h5exZowiqmwDUMXmCE1h0AbVSbaG4bTBw4z4SsFByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNYlOwFm;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8160A262C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C8160A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNYlOwFm
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so37040535e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466055; x=1796070855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPT/ypmWmLMxLtJbyhU72b/6yrEAVjSw6rFwMDxvsHg=;
        b=VNYlOwFmrm+wLhEGoOMDJnlhb33JACLnJI2PJY6WoDx/+lw/0L8iwubY+Fe1T5seGq
         uZOpHDJ8XNVSvY0CRcJTzls5ESPF9EJEteQRXiQCQXzG5DSRDqmPkOfoqugitUOKR8ti
         h88EGkLgbTcUZz5hMLVudh2rLEHCHdcx2s0zsG6oPyJk/ijyqvJBXe0CJGxMIoIKJsXv
         ucw/jA1j/R0pu+1/mT5GuEZdh23/cy6/Hp8C50+7ByE2ZlF3+vtEl340GDeE5NaXFKfS
         wCVXj4rqIfT7XGkND+GsqDdX1A8i8BuGw5pjL+cury/90Nswk4eah2cqRYyqMffqhhpi
         mh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466055; x=1796070855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPT/ypmWmLMxLtJbyhU72b/6yrEAVjSw6rFwMDxvsHg=;
        b=E284eSxc3/9ztV8jAc0pRFM12suljb+iKg9bBAHwMy6cjpgIriNnc0tQRwRj6jakKh
         ctd0w0OeEI2t4qmySM6eu3B4pyl3rkYJPpaCzMT+fkWfsXWIryY+Zxf4WVSOC3dltmhw
         7Rnww9nuycvge8TAXY+PQAyB3vM/tT/eX2+dREsFxCYxmdk31RCf+mfOrzPUduWp4NE0
         JP5ehVkTMzb56Lq35BFbuPbdqj+E3cw2pPKO1ZUAzNmcWOYbdYkzrNDSj6dEDhBMZXEu
         mEgLdFVnW/mECRQfoEzZnEb8xAhoEIF9hordbsMWE2wP1UY14HboY4+suAvnylDD31Zf
         EnoQ==
X-Forwarded-Encrypted: i=1; AL+hErEcTlzDpPIzR/X1gD5E/OBwspl7hVf3LM/qDYOtHSSyP4YllTRVeHDw3FwoAqu4Wm0VsEXZ1XDQ5bkbbutd@vger.kernel.org
X-Gm-Message-State: APuU4Z8qfQO6+5k/CdksjefcuD90zaqY9CDW9cBeiZtI8XTkYnvSJ/gi
	ul0WRJIwwFxphhHF3iXtc0R4HVFzl7oK0Q4vPdMvD3QMkFDj2n5YUfuR
X-Gm-Gg: AZFdTZfJ0a0krGFkGZMa4hVTA2ZdR/JBlf1PYeuRdBxSQFuAQknAXqo/uL5Q6oln9A4
	VjNiNuNE7T8Qx2QwY7fWKe7GnwT2AzKqohms38acPM4g5aUT0+7s1NfegOdY3yhPJf/BXF3DTre
	gxjhe3SddDI4vkvek7vWrAvdDMlUSu8waaqQ0v1WVPDoD32tOcWvqxL7yPdx88w7WxBGTicu+CT
	SB/AVp3QdJBjMWEI9Hz9+mMUsRXuKNhMgsecYlGEWs2YnfMm7zlYTpcDnZLDUxXnuOSwm5bwftu
	elVcY36DS0KghOvad9VnGvgcU1xjj1Kt/4S7Yrg7DGFeQK5SzO7vr9TElgkHEwF8wC/M69pCJUA
	mhiVI+rl+5+HW0CYN6HP+QgGCgsRMRJ1WgctMlUEdWCID/b3tWoIO5dhHT8VKJvIpqCvlJCoatZ
	FcLvhMloJ+fbyc8MZxZK91jCHBtTUeJJQ2AgymrpOaVMZw1iNKZ+F6FaJvfRj1YfEq/8cHtd8V8
	150aXBraGgXM8fOoCdRrgcxd1WIq4xKl+yBqJ3t3iopbl/hEcXUusZyN7pzAfEfRsTikYldlRr/
	FBZ6RLyKy+k0iOhhIR/Pt5S3oXs+zw==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr271461095e9.32.1795466055465;
        Mon, 23 Nov 2026 12:34:15 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:15 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:57 +0100
Subject: [PATCH 5/5] media: ccs: Apply rule-based manufacturer register
 blocks at stream start
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
Message-Id: <20261123-b4-ccs-imx376-v1-5-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3499;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=VfDCx66Bt9Q8ssDuqyaFOOZuxp5MaGCTsBGPv8t+RG8=;
 b=NAftwknVuWdeZhsZgh/6X5zyWUZbkl202qCbHJEL29BwWA0IUWx/7BgmqO5i80iqHzD4qKiJ6
 6mHO0e+HqvVDk176PadruzQefMIA//D4e/+mM70fA0XvtZsNzGlkz6V
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The static data rule based blocks were parsed but never used. Before
streaming, write the base manufacturer register set again (undoing any
earlier rule) and then the manufacturer registers of each sensor and
module rule whose if-rules all match the current register values, e.g.
binning_mode, which is already written at that point. This lets one
static file carry settings that depend on the readout mode.

Tested on a Xiaomi Mi A2 (Sony IMX376) with a static file whose base set
is the 2x2 binned mode and whose rule on binning_mode 0 holds the full
resolution deltas: both 2592x1940 and 5184x3880 stream correctly from the
same file. Without the rule application full resolution output is corrupt.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 72 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index acea07d906f3..db98590c1ed6 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1620,6 +1620,72 @@ static int ccs_write_msr_regs(struct ccs_sensor *sensor)
 				   sensor->mdata.num_module_manufacturer_regs);
 }
 
+static int ccs_rule_matches(struct ccs_sensor *sensor,
+			    const struct ccs_rule *rule)
+{
+	for (unsigned int i = 0; i < rule->num_if_rules; i++) {
+		const struct ccs_if_rule *if_rule = &rule->if_rules[i];
+		u32 val;
+		int rval;
+
+		rval = ccs_read_addr_8only(sensor, CCI_REG8(if_rule->addr),
+					   &val);
+		if (rval)
+			return rval;
+
+		if ((val & if_rule->mask) != (if_rule->value & if_rule->mask))
+			return 0;
+	}
+
+	return 1;
+}
+
+static int ccs_apply_rule_list(struct ccs_sensor *sensor,
+			       const struct ccs_rule *rules, size_t num_rules)
+{
+	for (unsigned int i = 0; i < num_rules; i++) {
+		int rval = ccs_rule_matches(sensor, &rules[i]);
+
+		if (rval < 0)
+			return rval;
+		if (!rval)
+			continue;
+
+		rval = ccs_write_data_regs(sensor, rules[i].manufacturer_regs,
+					   rules[i].num_manufacturer_regs);
+		if (rval)
+			return rval;
+	}
+
+	return 0;
+}
+
+/*
+ * Apply the manufacturer-specific registers of the matching rule based
+ * blocks. The conditions refer to registers that are already set for this
+ * stream (e.g. binning_mode). The base set is written first, undoing what a
+ * previous stream's rules may have left in the sensor.
+ */
+static int ccs_apply_rules(struct ccs_sensor *sensor)
+{
+	int rval;
+
+	if (!sensor->sdata.num_sensor_rules && !sensor->mdata.num_module_rules)
+		return 0;
+
+	rval = ccs_write_msr_regs(sensor);
+	if (rval)
+		return rval;
+
+	rval = ccs_apply_rule_list(sensor, sensor->sdata.sensor_rules,
+				   sensor->sdata.num_sensor_rules);
+	if (rval)
+		return rval;
+
+	return ccs_apply_rule_list(sensor, sensor->mdata.module_rules,
+				   sensor->mdata.num_module_rules);
+}
+
 static int ccs_update_phy_ctrl(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -1993,6 +2059,12 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 			goto err_pm_put;
 	}
 
+	rval = ccs_apply_rules(sensor);
+	if (rval) {
+		dev_err(&client->dev, "applying rules failed (%d)\n", rval);
+		goto err_pm_put;
+	}
+
 	rval = ccs_call_quirk(sensor, pre_streamon);
 	if (rval) {
 		dev_err(&client->dev, "pre_streamon quirks failed\n");

-- 
2.56.1

