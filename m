Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334697;
	b=KBW5s3GKnLZt5LDeL6uAD4pTZU+cy0DukTmSBwJrjwDM7leQQfVf+rPW1f1EkumtcV/x
	 MDJPIPM7XbqRR8bfJPaDb8PhzRglhc8PAJ3R7XpHZcxVPqLAGEOhq7MdICypi2RmykQxU
	 tgZM+WSG9DguxF1Lh82eUYfL2jgGhE+/yKcv2vt9auwZUG8mtZgEwQO7Q2Kbi2igDHCs5
	 RSaZk/33CPA940c9oLIY7tM7cg+l5aPoTM2/Kcehs5EFiQVg1dGwDvf2eDduqUtBzT6Xl
	 ee7pB17EC7z6SIEbdOSIRFemRR7XDebwvA6R9mkfz7P3fZrUg2o+YbCXZBv4zXcWgYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
	b=IMowuUFt9ICEf96L/NfCh+E9PJsqoCkeohghqBSTUqi5rW2eXlXKjrS1UVKif8vxDlu/
	 HH2LmuqQYpl5EC0J6yVPxPshoLIrqngfVwnOFv7YnjX9CR45rJAAKJM3m/kuSNw2Pt7Cz
	 SNNTyal+qbRyTbWyMLWa9Pgp8Ws9mNL6pdVFJGcq+pQ3gHBt0WGzSFNMFCM2sNSDsy+XL
	 WwcylMFLZHO/HUS8tDjzc4ryu08KxSiZg0uAPIsjWs2W2y+qOjT06ijXPwJP/rTfkz35u
	 3m4TSTKKygirE3frkRnNEm7+bsSpJKhQcHrobQyUXBATpzOMCg4HG5Fr/BGjq+svrrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xkWQC/Lo";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED606606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 04:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED606606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkWQC/Lo
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea138a3497so1803045ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334696; x=1793939496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
        b=xkWQC/LoB26hhGfn0zGpbbOjvSjxtSvYyfsNZwxGMLIKcHiS4oC/ac+8BnkPoKJsXK
         yie/eewiy7K2gOWpvcw+6+mgJFwYlY0gJam/wCfuASg7yUN5dOCQbFmVNkMvrjBjSCqK
         e2w9aihkqgJPcf8iActWxxlpYt56dcdC5hLvm68OthfbKQ9yzhFKF8bEbhnHNkfHSOSF
         hj8MDGd/yWveymrYwLb4Ou68GcjkWKjgVPtFqKTw+An6X2XYlAXNjXscYzK0PLhcEB3i
         hk0sdQhoCksFeaVshV3t1YCbfo89/VekNeJnrkUe0p5BgbAbXKUazjiRfU0hX6qMz7by
         229Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334696; x=1793939496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
        b=BzCrzmXxGRZ8ISB9v4iV0WhvTrzCfBYmiyu2xO/IH7HIgWjqr+s7BzhQNsLooim1hG
         t1VTkB9aUhOI+51yhu9IZIoRHodTdR2QktKs6AzzunHVhCIambFCnoUNXeK3/Qu6kDuI
         fiBm7mfwiD+08wRB5x6O/ohiFCegEq8+9RrIJqvZxJLTx3elPlBdWpp3NsEhBD6olF7v
         4F40v2HNwCcxKPf4XSSENKUNr9b7+UZYFBfEL6fjjlX9PKSB8pvNPvuL+7Jp0ui8UPKy
         fVut0iZhVPyatS99EkrQD0fK7XsI+nzocTarOKAX2FHSgsvxtgED6j9u6A7Gxve5J7t5
         e3/g==
X-Forwarded-Encrypted: i=1; AKwUvBzE0YK67D56JV8R2ovFYhm+HEV0auNiTa8dGZW5UbS0xQr+1g9+Opj7ijZArBg3IVpB+tNfkEyCTxl7y/rH@vger.kernel.org
X-Gm-Message-State: AFq9FYKGrAqcPMEKUaFWB6+D3eh2PwWFfRdAT0gzL0JwzpTAWMNS2I9Y
	R6BqHSRrumScuHeTkL9Ep2MONYqGLVp0C5YF35lySnaHapcWF87VImQ=
X-Gm-Gg: AYBFou24iWuu8qaifwAKCzqnMiBu6sp4CbhHDJh3BhKrPQXTyCvdr7sHgEvgoxfEYob
	qB+4c3i4+dizApi9S3eNboO1lUteesB4mRIan32zhWw1ti3tBoDtalk5GrRm6HFe9WCCnaqFldg
	TeSu/Vf1B/IBvKlB1KiBwX8gW1AEBc2ua0O4Ymg3/RsrlRq3AQcytDH8ZLWPsmBhokFhdeQwr0R
	jIo6+tGGCyITWfjvM/mGOsPL+WxpZncdWneDRCiW4w6s0mQmJ5nviccMWgkNSjFoAoqtu10TfWK
	Yyizh/1IYXb2/DITDr6TNZ9QfdkIPJ/Lm5ATEC1bHoTnFBtDcOl5YD5AGgdQsWKLETVcUNqoVQK
	K5wMjsYMQDglQliLWSC0/gpZP46Wd7Q2weU2MRtWLqBPQ8VB0IL1gVnmCe9bVBI6wwj5J53e6LN
	p84Jb1PKWCXZpfwsDuiMpLe7Md7QoQXpPkAKVaaYrQFBiTS7WjDN+kItTHmORdWHEGnynCUtM08
	mUAa8xqwKUv+Id6aMUUcs1PHcJUX4kFi6q1hwI1VCA+7FPM/98oNniSU1Gj26Khmrgh/AfLa11/
	Nc3SoN3V+jwkGfvu7H9DbTFKpLVdIAJsHUpNmSghrAkQfhU7/Ew6eb4wd5CRAEsgjyKxROLO+w/
	7TMa1L7dWhKaotQ==
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr914461a91.36.1793334696274;
        Thu, 29 Oct 2026 21:31:36 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm2259922a91.9.2026.10.29.21.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:31:35 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v2 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Thu, 29 Oct 2026 21:31:31 -0700
Message-ID: <20261030043132.2746814-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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

On 14-Oct-26 16:01, Jishnu Prakash wrote:
> The series also adds support for skipping interrupt configurations
> which is needed to support SoCs where the PMIC's interrupt pin is
> grounded, such as Glymur.

Tested the series on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2
Elite), on v7.3 plus out-of-tree Glymur platform/board patches. Its
PM8010 is described without an interrupt, so this exercises the
no-IRQ path:

  - The MFD and regulator drivers probe; the three LDOs the board
    uses for its two camera sensors (OV02C10 RGB, HM1092 IR) are off
    when idle and switch on only while a sensor streams.
  - Both sensors stream through CAMSS: RGB at 1080p30 for a 60 s soak
    with no dropped frames, and the IR sensor at 560x360.
  - Both cameras still capture after s2idle resume.

I didn't test regulator mode voting specifically, or a PM8008. Happy
to re-test v3.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
