Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738495;
	b=ZgDn3GWHjYw0YGLNpQrCpmq4D+P0DrdGLW4E6x3fba1nwXZXlEuaENyTdRFgfrAIKL1w
	 AWKit0zrFyzVgJGm171jB8AJSZprG0sAawD7T184zNZKsTnSWiaxod71Hnm34FyhNJtwy
	 uLJdrGX/os7DWZ73R1rwtYdiT1v1KXVg8dSr2A8pQzx0PbklMexDnYKWPuHQc/Izz7NJO
	 rmkbB+8jzMvdFYGJMnjwg+HsFlT81dGJtSROyLcy3PEbCDnr5u2SIcKtvTzOOwo0F9dQC
	 K8bEGDK9H7u17XqAlzV9iVFpkeeYj71Dx2vGkZpBQa1OCwSVJ5BzGCUuNjLgJN8fpuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YETm+Up3HiqhI4HFEq9kpUZu0+ZMnC5rPWZMwVWWgSM=;
	b=hz82WJ58SBcQUHbIq56GSqIz1OPlnksUO9geeVUH6uWwh/ZRSgq8kE+HlrWwdixWJ7WM
	 tMpiDCtCkc2a3YsHNTKwOnnlSRbZXg/bLuNZcRjXgS9jfcsi1MnZeZlUsBveyjpLwD5L4
	 SYog8JNnCWQ+0rJC0sqOnetLyyPiO2AyFuU7TCSVYOlAwFRinIWvOJ1xNTovDuZ7Aefr4
	 HmJHMdafl6N3y0hp2CiInK9C5hTowV5ikaB7MOn6Qx66+qLH8qCb4rzmxZjTXY95mALvm
	 Q4JIPAu6kXVQJVEtw8UxXNGNVlF55+Xd8mEbjM9nvElxVZfXZjJT1BZgVGTk7ey5h3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSTSqJMR;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E6606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 20:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163E6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HSTSqJMR
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so42099265e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738493; x=1794343293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YETm+Up3HiqhI4HFEq9kpUZu0+ZMnC5rPWZMwVWWgSM=;
        b=HSTSqJMR+jvEo7ahjNsMaM9qSyGCUVmfTGwVA2e8aiMWGnRNXOoFjjT33oaJBoYquX
         RzwiNuqcFYR6QHmjbTuWi+SEjZL8eJkpRxntpXgz9zb5jTEL7o2tpXZMc+aHbXUrfrDK
         sdXBdeLSeKFdOjKMq5rUA3Yeelka88N8ziOo9B5uD4PXEl6CIOKPBTH/MXVh4BVMvpiX
         9XIpEdm69UYiebiVZSJ8g5+orD9Xhx1CBwqRXOMljrDP/uHgP5/DK0/xVJq8uyj0eNn7
         p/eOYxSVzywNomXd/v66nUicck1CmOOGUj9nCrsdPwtAZRmcs4JMcOMUlnmBDkLTA7xo
         d6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738493; x=1794343293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YETm+Up3HiqhI4HFEq9kpUZu0+ZMnC5rPWZMwVWWgSM=;
        b=DiUuivqUCwOtsdOhcknEaXdTTChK3uy855VUrVjlAhkjrsJAw3hBckz1edmth0Xo/g
         aVQQ1NE/paqDfSNWgzmiNumJnBYJmJz3IrQesRYtd0Hu/26qWRjlaEqdsbMLpx4InaAZ
         jZhKIomroxgxcWKYhyFIO75jD6LD/0BrDvbFc0HJQa6duRRiW6wkTxv6bKWHhb+mIQ0F
         D9gTbUpETdEWiHjtGALHNiYlW1/SZaPpMcET8lFa7UO+/BK8G+GX/bjOjU6C2W8BTFQ3
         xQv+7h4H0j+DtubFyTEJm3j+idwv7qISTp+UMvTmaJJIpJFBaTKF8FMsNFOKRSZ32cEa
         ggDA==
X-Forwarded-Encrypted: i=1; AKwUvBxnglG1CLoyg7mN372t5VrnM+k6TW+nAAzyCGF2+O+L5PViajAz5VgggOf82W0kbnycfMiQPEykbchvyAfB@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZZqGbHVXbAYIaT8qosShGHDOVlVkLFKETHSmHubgsoH2wPP+D
	qCJl8NCCaJ/SgZ3Lq+bb7CscooHWHf65eOkhssElpXK+i5UEjCFY8hMR
X-Gm-Gg: AYBFou0qKrR0H5/MH5KM57/YbmCkrnFfxpcqW6sfcS6Aq7u6N4rLT4pcNEgekWJ2hQh
	v7z6iPUwgYKNKmLtl8xcEHTrEn7OiFC96kbQ1n3PGaFNf6U2EGqDNNBRCG90Cbdw6Wlh/kId2+b
	/E4BZG/5erdrViESD+2oovtaEmakL2bXkN6irRxvb+Q2bEoHzJUdKWmyvpDCg3AHJogNZRNoCSD
	/+2PHESNGhuFRrZdJmezTxhFt8tl3mgq+XSwMhRsH21CR8at4gHfi9YK1hBKh/qgzh37ext2e/L
	qbZul/Wn9Dz+ToqEXKoosnAx9o1BtDE5eIxxJfRsAP0oTMbBXQaUuuWAUON+pjVqwWi8bbCkC+1
	naCIZpTYBJqgXrEauyTDg9mcIFaE4ScGFUqW6/uo4xbe7EvywYI1LQFn9gmqXg5smaKCXXRDSWA
	bF2SQLPKt89dFyD1bLHcs79pdd+jdxY5yppuPOo4p6hN0s1EXW64l2LVjCvYmY0EIxN5f4OD8Mq
	bBZ7plF5UQGrlTC/xf+hCjIMNebu6mz+S/F5/WHT1bOJTsr86uPlQOGxZ3o1F6w3LGMjvT1tB4y
	ttU2yEyDc1dZzpnxGX8YbXd50AlVUUsC1S0XrheUhJYmoG/39/patG1R/AgoutAV76PN/qyu42T
	1FUOztXslc78xhw==
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr321941285e9.2.1793738493245;
        Tue, 03 Nov 2026 12:41:33 -0800 (PST)
Received: from notebook ([93.189.202.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4134ff2a3sm6859995e9.2.2026.11.03.12.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:41:32 -0800 (PST)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] bq27xxx: support interchangeable OnePlus 6/6T fuel gauges
Date: Tue,  3 Nov 2026 23:41:29 +0300
Message-ID: <20261103204129.278715-1-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019-master-v8-0-2517e41c8992@gmail.com>
References: 
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

Hi,

Gentle ping on this series. v8 moves the DeviceType check to the
bus-neutral core and uses the existing register access helpers, as
suggested in the review.

Please let me know if any further changes or testing are needed.

Thanks,
Rinat
