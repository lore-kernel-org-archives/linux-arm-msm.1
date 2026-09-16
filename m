Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB5A3B1BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575317; cv=none; b=mtnhdJfyyE8yEIzXwNw/+mBrqGDVi69Xu9eH1EgN1fu7hZ7WwiAYZgjEzvYTa8a0byTJXsHXWizvv5VLfoao3IwYupodPUYbgqBdsysfy1p3M/rp4BHWctl48T1hlcYYdAsOmLolNrJS9x+ktzcNVWPLXOwD4MIHNFuGPGL7z3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575317; c=relaxed/simple;
	bh=VSJMTDKe7CQqLu0Kfw5RN3XzESpeF60SOgxpBgUBlKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwDnYuJaIElcbkuIylYJJImQ4czLfGEggHUFQkd+44zAJTKU3FA/HAHNLBi85UBnX0kWQl//OE237FUq8fnYfQRGc+ZHNPLoN20xbxPhDi4jAJ+1+GQQz/a6Kh1RmxZlgh6xdQgcBMvDPBmBnzUMyrf3QCwwL+tXL8b3yzWjxNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4/fT4sH; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4/fT4sH"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f38so11529475ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575314; x=1790180114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSJMTDKe7CQqLu0Kfw5RN3XzESpeF60SOgxpBgUBlKw=;
        b=V4/fT4sHj65TVRq1ODPlNc7kRBHm3EezpeE8GhM9Ru6IzO8qH65nO28s+gpo46K6+R
         0vLFm3VrsIMyp6mVF8XRVRqGjkNshVAKOGgkFwCp62voLRjBpYEXcBxIs/VI8dLj4BG6
         SdgYa3hlTuhOTYilztykgrjG6+K5OWnUl5OFYqKW0jDpfP7kNN5rqOHs2GNyvaxmufES
         M2W1m3EEe/XgpBivfMDyCy3LUVy5w7KPIA0yoJEyW9SAXfBqIadUJx4TmSJKYM3sWfc0
         Dlu7wV7PXCq461838YMx3ELKVDLFNgHQl+f049LUZzczqfkuWGCAIFg+K2TGnJExUux7
         UYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575314; x=1790180114;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSJMTDKe7CQqLu0Kfw5RN3XzESpeF60SOgxpBgUBlKw=;
        b=hfNCNPHjsirOtnKSzjLBqoX1oXngA+0FJE+pnRZ2V9ZfGz8X2iuvIrY1ZzzRaP/sKs
         YV2HeuBruOD/WHev38skgTsiogJeG82kTvMZur0x/3wbSMueai4Iq82FauACJO3eslwl
         fkAd1NbWJzN+Wom4/aj+Mw3xkPHhvxuDWH89tUqewQM2stms44KP3jyPVMlRMcAwcATF
         MCIKNVdt7qMOrXbN0xJM9YRD4gd5S1Fyb9373gKCg41/pThdgLiB/AXJJPpttO8KKkTF
         j3QULpfQfUOTdm6wMkYNzG0BjOjVW6qCSqkfjhUA4GLK/MPWpsukmnoFGK1kLB5YsbBS
         nKFQ==
X-Forwarded-Encrypted: i=1; AKwUvByiZyhCNh/MgNf4Hg29bT+7RSUqos8xVBLW2tvKqLp0kBgG8StQIrzBlfd1VtMW48x3qsjan+BE1qHgiKKZ@vger.kernel.org
X-Gm-Message-State: AFuF++l4UHRENpImctHzSVixaB0nAw69nDr8Kxllf600cij9qWnpPwmz
	VL7/MlQsNp3rxmKfBOzM7OtgiiLUZZXGMXLKO3oxl59M0OWu+xqX6Jwjv2ZNKZ+5
X-Gm-Gg: AYBFou3GBPkSB9iXTsE0VHzEfZc7r6Im2iOEtMk8LYIAwRKILKduZLv/PvrnE236ue1
	4Pfod99Y1SNmKklCZv11cGRnG0uRxWnu1xxaqSTVZBweHRFg562TnaS5sMbOZTAnYJxtmlkDh/Q
	bLEMFJTmatV27rgKAZseSFQYAyO47rUems0NweeVqOQ/RK0MlVYBloDNXq9AWHLdq5cCIr2j0jw
	LDsK/5FUQyB7624dI5yAWSd+GowQEgrRFRxKPvtney7kyi1MEg/Aal4/gBNJor0Dt7RcmCHf8Xb
	srjrHsBAJcCxUxV4u7rHewsOzbwCvIeAKCb72orONw4obctvQjTzZNa3BHmep77Y1M2LRtuOEpH
	bkS4x0pzpP/H/2+uqguypWAUmu8RUj506G97RbiQsYdEZCSTKYwGs4rVKJ1hgmRfTzy4/UfidD0
	onbzGIYsQIDTIg6sR/aoTBQN4nr0OzuBDK6CM7caqb/1jXPydhUpCPXyP+pYAtEO8M4A==
X-Received: by 2002:a17:903:1a0b:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2dd8e7a4eebmr77883505ad.19.1789575314262;
        Wed, 16 Sep 2026 09:15:14 -0700 (PDT)
Received: from jm-X870 ([2001:e60:20dd:7c28:de1c:fff7:d3a4:d8c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f06be6sm14690515ad.64.2026.09.16.09.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:15:13 -0700 (PDT)
From: Jaemyung Lee <ldc.jml@gmail.com>
X-Google-Original-From: Jaemyung Lee <jaemyung.lee@samsung.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Greg KH <gregkh@linuxfoundation.org>,
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
	linux-arm-msm@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Bean Huo <beanhuo@iokpp.de>
Subject: Re: [PATCH RFC] drivers/rufs: add Rust UFS host controller driver
Date: Thu, 17 Sep 2026 01:15:00 +0900
Message-ID: <20260916161500.2554458-1-jaemyung.lee@samsung.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3c1c0025-2a88-463d-8aeb-6331dd09bad3@acm.org>
References: <20260912-rufs-private-v1-1-716db733e655@samsung.com> <YKq4TcQM0v2dXF4wTHEvZKwASII6PDd_R7_UiHWe3NRnR4JsrC_ZS-x6jA_Kl7P6ONehU0REHYk7WaLz8Xv5gA==@protonmail.internalid> <2026091124-treason-trickily-bc52@gregkh> <87mrtmvioe.fsf@kernel.org> <6JMwZ4EuSfQ8V4TGaPwatQ31m30TceLJblORsuILQmy4VV8Fx2lHbihL8ARsRUuJmaSUqek8L54y4Nk6DuZMXQ==@protonmail.internalid> <bdcff6a168e6d4b8e9c9524bd598281817a7df2c.camel@HansenPartnership.com> <87eceyvdnv.fsf@kernel.org> <RJ3H-1s-vh5YR7DRuPZ6p050ld3umNGcKNeBigg7n3KUQt1WJ2C-sR9kEqrF6f4ubj5AHoHNvB0MRGJyw6tf_Q==@protonmail.internalid> <77e00073a9254d5ea1ade771590da81a859b75a6.camel@HansenPartnership.com> <87bja2v5g6.fsf@kernel.org> <ba386a0a-8022-4c3f-a1c1-bb22205b51d4@acm.org> <3c1c0025-2a88-463d-8aeb-6331dd09bad3@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Since my question has not been answered, I assume that REQ_OP_DRV_IN and
> REQ_OP_DRV_OUT are sufficient. If REQ_OP_DRV_IN and REQ_OP_DRV_OUT are
> sufficient, there is no longer a reason to implement a new UFS driver
> subsystem because the upstream UFS driver already supports these
> operations, isn't it?

For a private device command, I agree that `REQ_OP_DRV_IN` and
`REQ_OP_DRV_OUT`, or an existing UFS management interface, may be
sufficient. The purpose of this RFC is not to let vendors add commands
without JEDEC, T10, block-layer, or filesystem review.

The RFC statement that there are features which do not fit the SCSI
mid-layer was too broad as written. It did not give a concrete example,
and the RFC does not establish that a new subsystem is required.

I reviewed the feature examples we had in mind. Some, such as WriteBooster
partial flush, fit the existing UFS Query and sysfs paths. The public FBO
review also does not show that SCSI blocked the feature; it raised code
reuse, ABI, userspace design, and implementation issues.

The clearest public integration issue I found is zoned UFS command
selection. The earlier discussion about using READ(10) and WRITE(10) for
zoned UFS exposed a conflict with the ZBC requirement to use the 16-byte
commands for a `TYPE_ZBC` device. This is a real JEDEC/T10 integration
question, but it can still have a focused solution in the existing stack.
It does not by itself justify another UFS subsystem.

One of my main motivations came from product work. Following one failure
often required reconstructing UFS, SCSI, block, and device-PM state and
callback ordering. RUFS tests whether a UFS-focused request, recovery, and
PM model can reduce that coordination.

The current RFC cannot demonstrate this because the complete EH, PM, and
userspace compatibility paths are missing. I think the next evaluation
must also compare against improving `ufshcd`, including focused UFS hooks,
rather than assume that direct blk-mq integration is the answer.

At this stage, I do not think the standalone architecture should be
presented as an established requirement. The next step should be to
document concrete cases and compare the responsibilities of both designs
before investing in a complete second implementation. If the same problems
can be solved cleanly in the existing driver, or if RUFS only duplicates
the existing logic, then a new subsystem is not justified.

Your comments on the benchmark are also valid. The test system was an
Intel UFSHCI 2.1 controller with a Samsung UFS device, so it tested SDB
only. The randread result had high variation and CPU/IRQ affinity was
not controlled well enough for a strong comparison. The data should be
treated only as an early real-device normal-I/O check.

Regards,
Jaemyung
