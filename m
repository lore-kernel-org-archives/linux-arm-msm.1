Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463880;
	b=hye7/GVl/MYcWMqD3cHXfQ0bu9OoiTEp+ojF+4I7JbtgzBipYGQcFlbRey82Ib5kwyGy
	 qhM4yhq05RSl2KVERRuTSAadunCxhytl7FoGTz3KkdJRunqdkr8jiA6i7SpPmW371qMWb
	 bcFzlUVvGadaGiWmxQujdhUnVzfF10ZpzcM/Ve1AAiCJpbPpa0JgR5yQ4RM9eBdD4u7Tk
	 /FtNQHpehm56tF5HCCx7w0Rzh8xjVXikTVvCUUSYsGXV6PJhLrZbOh6maq9mFqGc2eqdD
	 P3Bc1XT8LLpWdx7KSmUDiyA8t0XKV2McnsEFUSjUv1qAbFQv2nguTRFFJXDfA7NSdvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
	b=C4XBhgsJg6lmojf6YpHEknBE3GiWISJ0kyRAV9BO7n2EmCt9KIycSKcve2p8BEdfacqz
	 yxKygjQTrOXkdW5RKBCQtdtpIFPKs1J+BVcHbV2sxh/egFeXxbOolVmy92hw7C9wVDOtJ
	 8mc4YOvR/LwgrN9ymMXLEGKOh9BSQAFewIUc8Bf2X4JfIuwlRuFdHquhG0pHE65B9cZqM
	 hxglKIk9i6C/SGp+avcmrhGr8XIaVezpn6HaqV/3fR9xHt6TAP3fBrEXWC9iiVHQk5wPp
	 YLblRQHFXmcfc3HwVvWgajlGoGsZC6iM6752zhOINO1IVkeNUgZYHy9Z4NThGzSiGqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yq/pWgdi";
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D0C606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D0C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yq/pWgdi
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53bb57f1310so21579891cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463879; x=1794068679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
        b=yq/pWgdiyCpd1vdvfsuGa/2o7ID9ecW4qEKgJeLhtCzJ8u6W7o/2nn5EQRsUMfyasd
         KjIPYEP0mDurwMzq8s72gSr1/YDrZ99jDbc3EcJCeNh8yADXnWZsPGuI/croyX/Z5RgP
         GkD/GLq4Bp/cljhrcS18pT6IhYrIkwc+5+2uU2KkhOrXdbtkEvynKLV2OVVUmFR3Jivd
         me5F+C4IEgS5BDzoPITHTR0Sjbutsa8TmkfYSWcg+zYBUbHFifAAi+UUNViALQWSfj0g
         nhbfQ7kFBpQZEGgLgK2Rt0oCynFfPFVWO3J8+ksCduLC4MhpUaTJRLlv+Caa9G2T4YMW
         DyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463879; x=1794068679;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUAmFD9Oafnzl8e9wUgKXyASSE6sDb5DqBio2IgezSc=;
        b=g+hPUksue2ROOPLR57HqJXXpJIHQzCulEinx6oml7j9zFMZw1lQAWhrxyfvvOrEfgI
         xoIL9u6MPSKZJixzt4vLuXKy8AOvr8wUgHe9SY/xhGGPE/oOf6PjtC+KjGfiBHWnKCAK
         BW1xHK7/QcHYo8P6GAHXYl1NmyyidUfawckfiWKUY/MauN2OWVA6g75AIeLhyk/KU3qy
         juY1wRvAH8zPebQOgzdRmQ+UQTODwZf4IbQpzegUiW1W+44sAOLyiUPrXbflmajrbLjL
         H9C8MduwNegTeKmuV8AqkTA9JinviirX/BhzbfzqUg7GgpScNC+bkbpXV6Z9NvFzY8am
         yGCg==
X-Forwarded-Encrypted: i=1; AKwUvByAZVggU7QZ6y3ZiN2Q56+5wvhHnO3fttbcV7ZBISIDNVzDUedsPzcI1xZXP34hboHSWZdAsbnz1HtKg6NZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLHTsmbA6OjgrD9KE9a6TVSlxabqCzUpgthRChhufs78wuPDoGw
	wAOGzX1XCGH35oNCevqWvMxBHzZGuhiBTOLwSi/dHR4vD1WkrD4/NHia
X-Gm-Gg: AYBFou1ttoNz4QxC0ZAoKfPhtmEUKdhles35LO8Deij0PRnLIr7cucp6kCp4+2MJDlu
	6RYzCEvX6/A80gZ5v6Duc0O14luE+HeNXqA6beg17VAzWKaLe8JhIHDjfwou6iojqsbfE6di8D/
	6TGScl1mUTmqxgkd3iPoQF4bI2vJ+ZQGy0fFUrTz93iuV/P18Ljt0YjmdeySZHpPobnZasvnHnH
	52jNAMZr3Po1BRKRevVZ5jbG/JAYHIvpHr/XkpktQGAe6F2vTbH02sxkDXCyj2smKHywmmg8fhL
	o57zRi5YM/0kG2/emQbbK0AQPCSaaoBAerMrF7teYR2k4xPQ/pV8R+K+Pv9g2LbHg34bRF49qhF
	9GeM1H4GsNO+yURd2mQE1iG3uMcKAZWJRS0tKbYQ0WhM9HugUZ9Att6nlknnfPZlEXUM4sn1brm
	zGOj0CPumBDAZytG6sfFSjv6ZmM6D0+RYL5hUi+U2D3xTppJmC4EQ+L/WvYIgHpfBbW2tdIUEgR
	tkbjk/ZkuWCMOMN/ftAHtnWW7CtRxUvR49yteZimv+RP0AqvoaPF9IZAlVAEgB1m73w6o3AXyGf
	j63ODtvQKxhFNqBcfBd4UnSuE5D0ENMOtlylJ916DFyxD8YmyQPUYZtdH6sIgm/FO4fxN4qByYp
	K/qnMZg==
X-Received: by 2002:a05:622a:17ce:b0:532:cad2:539f with SMTP id d75a77b69052e-542b7b0a59bmr93775091cf.53.1793463879448;
        Sat, 31 Oct 2026 09:24:39 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54312a5943csm41374121cf.24.2026.10.31.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:38 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs
Date: Sat, 31 Oct 2026 11:24:37 -0500
Message-ID: <179346368381.44447.1485218660714919850.x2e-share-reton@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

Without it, s2idle aborted here with -22 from xhci-hcd. With it:
19 suspend/resume cycles, no USB errors.
