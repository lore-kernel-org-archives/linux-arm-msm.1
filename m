Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C851A736
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577178; cv=none; b=JZpb1TjFzpoqp4rInk6ZcBTP45AWKsUhnvAklbVQtDf9U0wOvsWxQ4IBayoxWax+0GNhMjEjzDL0rI/GHmFXqF8yxq4KWjarcFXi507RiHBMAyN2z2+q4UnR4NHGCSZ0IqO/260Lb5XrZnQkaM/RgpJPJGw62KkNjiV7bTLHsKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577178; c=relaxed/simple;
	bh=1fs5/9PJdlbuBhTs0ZxkDNW+v2WItpOPk3QzGFWOdbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EdcIfl10j9EiWtfiBmqgTXgQOoOffHGzqOFQxGGpyvHB6RlX02fsiQGSiYsGZ8V7yx06hvP7chQoA4RUHq3SsfE6yJ6c5q/GbQEKQAEbA6KoCVznHD9t+onozaDf9pnAaU+KliWiAiy5DwL4z0r1ps2rPqYZJfAr3fUW6/2RpKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMSLSCTc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMSLSCTc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so918438a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577171; x=1790181971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fs5/9PJdlbuBhTs0ZxkDNW+v2WItpOPk3QzGFWOdbk=;
        b=QMSLSCTcLtJ+AiMJ6XECO+C16YHQOAZXJqddh+1hwfr5SVCU4HFWiTSJa1dhNOAfge
         pfYOyTxgh+G7+nYzG29DcTK0mbanmL4Ki5CnnFA1nBDvUO6vmqKWePAB+FZ5FpUy7ybf
         NvpmQd8hmW1D58fLfNxQ2IO4hTT5eo54DBnXZzh2iajCO69bt2cf5NtANoLSgFqyO5/A
         9LEmXnDntVcj3+khqajRkChzL+EBb5PV7pHymXnMoVk6pz3eKRz4jysRegqRDLaw73Fi
         qXC75IwpNB6FudUN9Cqwzv40xMcW2rJfnS4fRbIUZsdSRYywhbx5SH4WUeYfZTSmmPUN
         0lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577171; x=1790181971;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fs5/9PJdlbuBhTs0ZxkDNW+v2WItpOPk3QzGFWOdbk=;
        b=Mwk0nM0YBEkXyhRteuGCRJQIwuoDV9s1tmp+2cdkyssSUsdUuFGSDn7DcWF/g7CTDM
         CmANIScWmW964mS7AYH4N+TZt/My54ADS1c119HscieeaQv8mwgNF2KSCDuPYowjW7IJ
         jO1pP3zujwWuvsdiVYafRoNIntD4IaLJB9zXZiiXnZzLuTI1HygFyKjcls3emp/iRuA6
         df2G8wX7CmEhNUoq/+fpe7qCWa37R0/ZdND9kpc4zpV+9GUmP2V9fbdzYfNZE3UkMazb
         4Piw7URTImoC0icwqLlsvlPwwKN+ToikKAxOas8xE6N5MMLtV5sjXk61U9naGWdTlBGU
         F6jg==
X-Forwarded-Encrypted: i=1; AKwUvBxvKY7TSd8K3AHqFre4gha5SzFNE9sn0Sf/JSV8ITrtc1DaAx/4qI7HPgOaRibDaybpI92tIFZkZ3jm765B@vger.kernel.org
X-Gm-Message-State: AFuF++m3p1R7qBcsSfgQeCeYXaiKVYtGicRkknhNQcdwcLR+DZAPMG3K
	mGcgZ8jq3qRQ7AyQouYKoQJVnYs7US08XhkJZhB2GVSWYv0TFUF3c7n3
X-Gm-Gg: AYBFou0ysLx35zL9uVIetsySP2K1Qj9o+e7+JztIVe9EpLtAQwJdy8FzXLD0vpVOwnF
	7DZzsuXa7eR8xmo6zQbqWk66iWQjz3sIJN0amnxBig5vBUvD6upNfMBP98AtYQ5MAT9A8mumfw+
	A12UQHOcplE7O16BHZRQMAr4QEEBPav9W9N6yp7UHC7Gvz9ZD2Z3POVxcPdBHXbxcEyOsosYGdO
	iYcWyKoyW3qk9SGH045aQprtzyQ8ZfrBe6GZTjZdpyQppNITZ6zH1eknUVGCLDJysZJBhqJ0nqg
	/5HUPV5snd3LnruMSapOf4Cx+uLpgTXqAkzjGxzG0zvxaE9Y3YDqmuJ4GI6Hvwppvq/4MypFMwg
	8pYKZE0VJIjp07ztT1wLgdvo6Ef9EwdEN25X3H9dUs67/A62LHtqcRvLxNbKKr12Uwkayz3UiJm
	knoHYO/3B4fq5SXMfFz4Tj8sI0uDLaHnsPcIDbdLjf3le97bepVAo6oC+wj4+cGufreA==
X-Received: by 2002:a17:90b:560d:b0:39b:3109:10ce with SMTP id 98e67ed59e1d1-39e1e45cbaemr7258907a91.16.1789577170531;
        Wed, 16 Sep 2026 09:46:10 -0700 (PDT)
Received: from jm-X870 ([2001:e60:20dd:7c28:de1c:fff7:d3a4:d8c7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm292100a91.9.2026.09.16.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:46:09 -0700 (PDT)
From: Jaemyung Lee <ldc.jml@gmail.com>
X-Google-Original-From: Jaemyung Lee <jaemyung.lee@samsung.com>
To: Bean Huo <beanhuo@iokpp.de>
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
Date: Thu, 17 Sep 2026 01:46:01 +0900
Message-ID: <20260916164601.2562349-1-jaemyung.lee@samsung.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4c38f13af8f75020fefc35827463e9bc643b99f4.camel@iokpp.de>
References: <20260912-rufs-private-v1-1-716db733e655@samsung.com> <4c38f13af8f75020fefc35827463e9bc643b99f4.camel@iokpp.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 2026-09-11 at 23:44 +0200, Bean Huo wrote:
> You still use scsi everywhere in your implementation protocol/scsi.rs
> builds READ_10/16, WRITE_10/16, SYNCHRONIZE_CACHE and UNMAP CDB, so
> "decouple UFS from SCSI" really means "copy a small part of sd and the
> SCSI error handling into a UFS driver." while JEDEC defines the UFS
> application layer as SCSI, the SCSI work doesn't go away, you just move
> somewhere else, and it has to be written again.

I agree. By "decouple" I meant independence from the Linux SCSI mid-layer,
not removal of the SCSI command set from UFS.

The current RFC has CDB construction and only a small part of completion
disposition. It does not yet implement enough sense, retry, recovery, and
disk behavior to show that the complete UFS-specific version is smaller or
simpler. The cover letter stated that conclusion too early.

> The "friction" claim is weak. SCSI has already been changed to fit UFS.
> Two examples: UFS now uses SCSI simple copy, group number in scsi write
> command.
>
> I doubt how far this can go. do we really need to pay effort for a new
> RUST UFS driver, I am not very confident, unless SCSI is removed from the
> UFS spec and JEDEC defines native UFS commands, or we talk to the device
> directly with UPIU. please name the JEDEC feature that the SCSI midlayer
> really blocked, or that was historial issue which has been fixed.

Also fair. I cannot currently name a public JEDEC feature that was
shown to be impossible to implement because of the SCSI mid-layer.

One of my main motivations was the amount of cross-layer reasoning needed
for product EH and PM problems. In product work, I often had to follow UFS
state, generic SCSI recovery state, block queue state, and device-PM state
together. That experience is a reason to investigate another design, but
private product experience is not proof that the upstream architecture is
wrong.

> I would also like to see the heavy and hard parts, because they are the
> parts that decide if this design worrks:
>
> 1, error handling: abort, LU reset, retries with limits, sense decoding,
> this is the very hard part of UFS driver.
>
> 2, user-space tools interface: SG_IO and bsg (sg3_utils, ufs-utils, FFU
> with WRITE BUFFER), and the UFS sysfs tree..

I agree. These are architecture requirements, not small follow-up features.
Before claiming that standalone is useful, the design needs to cover
timeout, abort, LU and host recovery, bounded retries, sense and Unit
Attention, late completion, DMA safety, PM-aware recovery, and request
disposition.

I think the next step should be to document these responsibilities and
compare the standalone design with improving `ufshcd` before completing a
second implementation. If RUFS only reproduces the same behavior and
complexity, the standalone design would need to be reconsidered.

> Did any AI tool help write this code? If so, please add the Assisted-by:
> tag.

Yes. An LLM helped during reviewing, testing and preparation of the
submission. I will add the tag required by the current kernel documentation
in the next revision:

Assisted-by: LLM

Regards,
Jaemyung
