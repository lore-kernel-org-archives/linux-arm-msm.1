Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067578;
	b=13vRS1TSzgV5Sowp0OQo3D9aBF2mpg5tDUWU91Iqa3iuMjuiGBuD+ju8NDZEf8csFpBE
	 K9UJfPhGsJ0Ntsj/+KJ/7r4kSxIk22uvMzkQNJVsA2xSHlR5KfqVLHXQTnfeShPfN+TOE
	 8ukNiVTnI4hElRnWPfMDAnO86hpGLZb9yLl8Ldy7FYHkhiMCdpytl36QglTBuWwh7bxzX
	 tPqDZtJ+7SVo8QA1nPLM42aedl0oz0HEUQFH15EeRfAtjope/CNgTJLuQlfNbF8JEResu
	 m3OTqoi15/TqEapB1J9xioWN3Q6x3TgX8U2sYN0ojb3Ft3b2LLV57RiRlEETPlxnVMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+oGtn5HyH2tGay2E9emxXMcr59j7/7G6D6wMx8qk5mA=;
	b=Dyej4CZ4urGOO63udzKqeTKhIlHPBho5QXrepgU9+HGxsljVLF/zsAVeS0veDsqUcDo8
	 MoDLLzeFP4CkSn08Cs3OJfte9ttJ2tiBILkW3sLvRr30zaCZB2yvx/5OMWR74Y904WTeH
	 nMeKCsrJkWLKInNWUjRebqsSZwQ0MF8VVBSmS098G/YBZ0Kp95qCOCklM6MOe4dIPXVzP
	 iev4h0tgb6AHSAwaUu234+etUIj8hGlDWGP1vKN+naqG5WYxuGo8k/ahr+ZbpkVxdoBF0
	 +X3hr1uunJG+3oUM1qmsHe+2eRH0LYnSqZIAc48HvkhMI8PqAyRjEYPprTdessUJkbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LY4Oi5Ly;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBE3606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBE3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LY4Oi5Ly
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d91601bdso4649447b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 19:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067577; x=1793672377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oGtn5HyH2tGay2E9emxXMcr59j7/7G6D6wMx8qk5mA=;
        b=LY4Oi5LyC2nqWp4QkFqzZNpPW6fsO85fRDIBN4RXcD+McXJeYu+Yq44Xss4ef2vDIc
         LyYsreCgEHwr8kP0luXzKJHXMi9iu9zH1KYngJEtkHYphSp+y8/mRZJ1AcE3UmdfoQ6s
         4ujHiJjcRcct2KAS3C3z1TD0m4W3J67QPoH2396fSM2BoEKaTu9+CmqADXOH52722yD+
         G7DZ3bPME5l60fCqh4fSE6nAzgE0V6HOsKayc6xCIv1MUwZqG9x2J2jssppuhd2kOzNa
         2dBV6jqpDBD72CUBgGj+bT5bj8uyFKShmmt05NLXX51jWU0rB3Dm00eq5NLoF9Pt9gxv
         IVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067577; x=1793672377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oGtn5HyH2tGay2E9emxXMcr59j7/7G6D6wMx8qk5mA=;
        b=wPOCDxboPy0kInvBCKSypAHrbXbZARlGwV2slPcAWD05u9Q/zfhjrbePxoskid77JV
         y96BlxBYAktLjygT/vgDz6uryr0Pnpg27tiIZ9H/jt7jK4HEgpt3Qo3KaXRflVu1fDsw
         RLLGRprKvRyg8sTA3sH6xPBcvNinPt8YbpCPcgpHBHzEPRKZmfr+hmn1UX2Te4rO1hEM
         VgXJX5POrZPYdhVKGIDavc+4rJMfAgJ0iyKwXaZ8RiL1yvvoe0vk0ezttBiXh1BImVZ+
         QUJ/fd4bdH5Ij+UwDLIKcrwiCXiox26arRzR3YQSnsPxqKpHNtHXDpMLZyaCH1gpp2RM
         ATRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9PyJQqF3qe22x/Fr776ZYUZceKXKnF/5RQWzHV5KJc05I2EwkwgMUi6O3VJR3yXgOVCvsqVmZkSMa0SP3@vger.kernel.org
X-Gm-Message-State: AFq9FYLAx0WcmIORql9hwaXHJd5BlZyneBn63zD9lObt5rZKLt6xvRQQ
	qnh1mv0PwrtOZT/jv5vfG+Na/dTqi/XyIuXhmb3erQk7ErohnTUa9Lyy
X-Gm-Gg: AYBFou04qeSdmaW13PsNebs/7CfO47zzAItGM+PNB7njEUi5VUzVxUdY/B4ce+qHhxX
	SZ6nPPeX88nJ5l5QatyCfpaB8SVS7zSXh3QHclAPJ+hjy9Fj9wz6E14j6vphgUGsPw9kKz9oAVo
	pnPa8L9WZqMiPx8oBELyJfsV9cz/YM0cqu4SJ3xKdfIAiLXZOC4vkFgOogbBF4g/VxryGJ9l8pR
	eKComvL4zX586GZ9BBl6LCwlKLskEVhklCEPRn8f/PjTShPwQ2cDezYv7PUp6oCHKnQY7tHn/wl
	wA1hOKAy03dEqRTe1zIVYzdegap5tFhpHdbRGp5kpGzoT/FSQgMK9RK9O4uKExKkAazwQsnafjB
	tJdQVOkqiec/rZ4VxeKYetqy6c+h+n7tYnpXpM8hfQ1Vr+e3OAjLp+D6ePTRrHGspm9F2QnWA6P
	OinSL7m+IiV9VWxxQkfT3x37i+Du9Z3mzBvxSftYkSt24jz/aVPs4rMi+qjeuMfPfx12NyBk2U+
	SHO8Juujn8mOhOXSDz7HW/0kAv4m8ZeeDLFcF763NQEqf9d/arRVF9FJQ7c3hyaHDxKhbj8OAv1
	2bPVtkf8kyKUws6xGuKEJfNSzcV2q4qI
X-Received: by 2002:a05:690c:6807:b0:8b0:a01e:2ce2 with SMTP id 00721157ae682-8b19c9f2242mr11952457b3.15.1793067576776;
        Mon, 26 Oct 2026 19:19:36 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ca51asm5148467b3.31.2026.10.26.19.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:35 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 1/5] media: iris: Don't flag an empty source change LAST buffer as an error
Date: Mon, 26 Oct 2026 21:19:30 -0500
Message-ID: <20261027021934.22113-2-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027021934.22113-1-ccortner@gmail.com>
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
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

When the firmware completes a source change, it returns the last capture
buffer from before the change flagged HFI_BUF_FW_FLAG_PSC_LAST, and that
buffer can be empty. iris_hfi_gen2_handle_output_buffer() sets
V4L2_BUF_FLAG_ERROR on every empty capture buffer returned while
streaming unless it carries HFI_BUF_FW_FLAG_LAST, the flag that ends a
drain, so the empty buffer that ends a source change reaches the client
flagged both LAST and ERROR.

The stateful decoder interface says of this buffer, as it does of the
one that ends a drain, that it "may be empty (with v4l2_buffer bytesused
= 0) and in that case it must be ignored by the client, as it does not
contain a decoded frame". With the ERROR flag, ffmpeg's h264_v4l2m2m
decoder reports "capture: driver decode error" and outputs a corrupted
frame.

Exempt HFI_BUF_FW_FLAG_PSC_LAST as well.

Fixes: 7adc11e6abf6 ("media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
Reference only, not for merging (no Signed-off-by); see the cover
letter.

 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index f0782c4b1e6e..b4fe9066fcb8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -390,8 +390,13 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	/*
+	 * The empty buffer that ends a drain (LAST) or a source change
+	 * (PSC_LAST) is not an error, the client just ignores it.
+	 */
 	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
-	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
+	    !(hfi_buffer->flags &
+	      (HFI_BUF_FW_FLAG_LAST | HFI_BUF_FW_FLAG_PSC_LAST))) {
 		buf->flags |= V4L2_BUF_FLAG_ERROR;
 	}
 
-- 
2.56.0

