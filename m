Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E41A4E3EF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576132; cv=none; b=Wk7/jDOH2OvkkNSMuetqYSImRkN/DOQGnEWOq2jNiJUSsWGcsOdfQm1vziC25ZZAMoOKBRDK339brqrVfkuJlNK5dfQ285CJ3aAX8mC3/Vcp6BWKaqCRUikOTlTM/rKR7lQ3irAhpUy9C5eAdmel5KA1kJI5bvGabUnd1gxm/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576132; c=relaxed/simple;
	bh=sd8lC+4Cqbrm6JY6F2H3FLocfjos/39Rx7c2SQsUVHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fjnv5ktz+6KkSPTMcgO/acU1Y2xodvrKEv79jy6vwYrgUb+u1d1GFPzIog8FhMykDYV2/KOUBpRYYMkuMmJC2RD9b78R29HNfdPBYXnW6iaZqfeCeB1mFEP6Zmh7wWxxzcUom53gRoxJ4Lkxzybixkz1XeN4EWS9+TaTfNL6v3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+FaMes8; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+FaMes8"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso757289a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789576129; x=1790180929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sd8lC+4Cqbrm6JY6F2H3FLocfjos/39Rx7c2SQsUVHg=;
        b=M+FaMes8POydks9qxsVMwuSEEz6WSq2JFHH/frLsPfPq6TgAtbdGzf1lqOEGg7luDo
         QYQdKMS2m0pgVEa4DNqGCSZgdQQNjVVNrBnAfF3xWUV9bQty7Y8h7IG4YBlmkcHEA/e2
         0JCTw5EzZwofmPAbwdOI6XeD/QFB4eoXHduHuRZiAag9zfm8hnSuNHdSw8QCn4EOZkmP
         QbeCwZCQ1J8fqo8XZNBf0ZvDzcljnk62t3X7Bhu5dTwb2VUkIupAMyX6LlOeLEMsvdFN
         m47fuHlbyUwPxNxT9GDRV9WHoAeS4YdgZcq/+9pGePkj4HJvEEhdVVbeLILIYmUZMd4A
         cypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576129; x=1790180929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sd8lC+4Cqbrm6JY6F2H3FLocfjos/39Rx7c2SQsUVHg=;
        b=fXogsgly510BvSGhKP+WY9h4Y+n6DE4IumlD0pZ7ogZ5YenpifDKAwtkAss2Y/xqKK
         o2B75pTY03WAEloZJ03xEmlRB2l8iApVOek3xx+PVTR0qcHtyMpc1J1m4vgfCviJz7Mu
         Kg88Fy5n1dlsRfuozggl76c2cYII8t4NGxRwSTrtVwKtLnkaENEvwe+tTyAW37UHfJsz
         ND+8ganTn4qSWGAD8LJ8j30/Wt9SIkJnvyXo6A5Lo0rOakmC8Pb4Mu/gulvVPsUymuMZ
         yxcQvf5kSbtMVKVb0OlbtAjkTARBOVrberOO/o0IsU4Q4KaY6WWvYfJMpf+t1q4SU1Sb
         7ZGA==
X-Forwarded-Encrypted: i=1; AKwUvBzglP40XdV+BB/qzQQti2YdYfABh6HCxAOssDcwGP+LHr3dUdLg+R9C2rQ34ssgNEZmpq2/cO3EFh6l6fiH@vger.kernel.org
X-Gm-Message-State: AFuF++lkmAZ8Pyg1W86iP6XSLQNE9TwYT7bZTZi0A7uE0ddD7vtvrgek
	zxsXRnOsUoUMIC1+g5AKsmqJJh69B3xyZnPCm2HcTnWwPLFRvcxXJ+V2
X-Gm-Gg: AYBFou2fMjDlfjKvVEW5WDFYR/Udr4EmusKDVihivkZjf8MtJUP4e2dmrWE88NBFl71
	+8IZkNJq80+M34lSjIqkj31v0PGoyzHhRSjwKJA0bxkmlLN93I6akLYHx41Mwsxe+0mPt2o899t
	BjPodfpxrTBs30d7GTl9bZjBayglA7Ky1EsmN/uJZOH54tTHLpzL9aSDKI4Fq2V20lS6/fS8pMt
	HCbKar6p6fCxw/3g5L2O53BypnwQCti4HGAX5Bw8IqHSLRDMS4eFrQBMW9z7XxxAo1+z6M9nTVY
	5SOw4iWW2EGmDkbxpeuW+xRMUWDmz9OZBtIBmt1k6YmLu+oQy6Y63O9JUd4Kx61S1S9CG3u3O87
	zbrX7uq+iDExsOv3ciCADnQ13cPlJ056XIiUs1IzufaqUOXylO6txbnlFTUW/ccLf6U3/pqfnyt
	U7ZaB2/eEYz/m3CTlo9X9fqdCmLJr/wTLoybfmFCkrZ3f7boCDKCUHlj28h9rLCes/OQ==
X-Received: by 2002:a17:90b:5105:b0:39d:f18c:5f05 with SMTP id 98e67ed59e1d1-39e1e25a054mr7305861a91.2.1789576129023;
        Wed, 16 Sep 2026 09:28:49 -0700 (PDT)
Received: from jm-X870 ([2001:e60:20dd:7c28:de1c:fff7:d3a4:d8c7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360a9210sm217191a91.15.2026.09.16.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:28:48 -0700 (PDT)
From: Jaemyung Lee <ldc.jml@gmail.com>
X-Google-Original-From: Jaemyung Lee <jaemyung.lee@samsung.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jaemyung Lee <jaemyung.lee@samsung.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC] drivers/rufs: add Rust UFS host controller driver
Date: Thu, 17 Sep 2026 01:28:38 +0900
Message-ID: <20260916162838.2557370-1-jaemyung.lee@samsung.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026091124-treason-trickily-bc52@gregkh>
References: <20260912-rufs-private-v1-1-716db733e655@samsung.com> <2026091124-treason-trickily-bc52@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 2026-09-11 at 22:27 +0200, Greg KH wrote:
> Many many years ago, the USB subsystem tried to bypass the SCSI midlayer
> for its storage driver, and while it was a "quick solution" at the time,
> in the end, it didn't work out and we dropped the driver as it just made
> no sense to keep duplicating all of the logic all the time.
>
> So I wouldn't recommend it, as long as UFS builds on top of the SCSI
> commands and the like, you should not attempt to duplicate it in a
> separate driver, no matter how much "simpler" it initially seems to be.

Thank you for pointing us to the `ub` history. I had not considered that
case when working on RUFS.

After reviewing the current SCSI and UFS paths in more detail, I agree that
the initial normal-I/O implementation is not evidence that a standalone
driver remains simpler. The difficult parts are exactly the parts that are
still missing: sense and retry policy, abort and reset escalation, late
completion, power management, device discovery, and existing userspace
interfaces.

I think the next step is to identify concrete problems in the current UFS
integration and compare a standalone design with focused improvements to
`ufshcd`. If the complete design only reproduces SCSI functionality and its
corner cases, a second path would not be justified.

> 30 files and 10000 lines doesn't seem that simple :)

That is fair. Calling the design simple at this stage was not right. The
driver is already substantial while several hard areas are not present.

I will treat the earlier failed approach as a design constraint, not as
history that can be dismissed because UFS is a different device class.

Regards,
Jaemyung
