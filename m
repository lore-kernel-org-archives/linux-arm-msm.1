Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1765C48032B
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 23:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789513405; cv=none; b=DndmeMlgo/bC8BOp9z4NYBQylJnRsmf7k81xOm1dFt8xEykbNqtfzg32z1ll8s6TxV8kYVdvrtw1LGapssPbClj4daLZZEZgt33WJtJ4Y11k51bRI4EjWSe2/XybrOtTHTWr1QjHNlhiQw1s8S5ZA6jAMtIhQJBGt8HppqYDCUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789513405; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R361ZA1v4Fr1ku2+ZKBsH7pmEQQHtj8x64U4cNLXRXfcfiBW1LgUY+3qJK7L9r/uWrGhxyXEWIQKiNsOSdInFxKpHLH7XLLJ3QERGviMKS9Aus2Pdx1NrV+lhCVF1tj6KeMnjjhBP+khf/66ZWahdggvMR7DdPDXHwvAjRwFNhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UUon2hN4; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UUon2hN4"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso433809e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789513402; x=1790118202; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=UUon2hN4zMF7AZ5+yjfZqKtK8Fa5azuHu9FBjLD9xesTQ7yViOFw4Nsvt9IeVBoci1
         vYADeC9ChtB3EuU5L+LJAyyZooq5p4JEcemwIi03SQ03UkBz4atDPqGGVIrwxVfhbiMT
         1pPJ+xtriHqcKxvJHVdrwiMstXblmGaFNzhyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789513402; x=1790118202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=EBdQAMjp+B3OZFoeLOl5n5P8X9aTlJkyxoG+2loehxSg8ejVFVmkiTYE4L0meZTNlB
         5A6b2Csub56DAygBSOqD6YnDGgorng3Hes3Qi07cAfmiJj6S177usgIQS1pcpS8bZsM9
         LlqV7W0jqVzW3v6n0/s1BSFYvNB3RKcZB/HZRsPfE8z4ckDenACn5TtNIHNP03b4ehld
         PU+7xierKpVLv66mgWl0dHrRb5929CljWM7NrDmWgqHNH2G/TXI2tERRA4xp+wCSm2X5
         KDUfxlt/tlZkPZDaHCr02XFJ8GOYUApUQlX7VWH6mVGozmesFLplCPuXtKgIYW26L6kK
         MD5A==
X-Forwarded-Encrypted: i=1; AKwUvBzRWkqZ6dw5BB6Ohb+JEbfEVGBb2+pExjDHCDRIj+QnBLhui+Fu4/VUKANiDsdj+rD+QuS3mKADNbFIrMY9@vger.kernel.org
X-Gm-Message-State: AFuF++l01HrT42STT2eo08aPMSNNiGV02lfU5Ypzucu7micwBLlOIRFg
	oJcvm8dK4OCmorUz/O8610yZx2mIfGbE2sUTVcpZg8e7QJENx1BMpwt6ksqvPOJNjyXlgwy63aM
	oisnoS1gqjA==
X-Gm-Gg: AYBFou0z1v+ao4Ado2Dab2oAkKSVn6N3IJV4dkFwkMlgr3EetsgEnJbmX7o0OCLKjyk
	XdEeahfw/yY+3peV0tD3xFptrMp9CVzg3sX/wzkLFCQ2GDkHDZ5ty9F5pjeBwC3utEF2GNo5mlS
	u1QRGuxxTZT6SSZqX1/hJcViOePzzB9YR7L96JM6N1VtdMqZvluQE5ne2/AsO9SK6o/f2v60Qr5
	unB/uSzWJ2JNYstjXwPkbY/u9q7PgkR0CbHgrl9JuaidcpZ8+jytz/72/VdQFl1sPc45rAhuFVI
	V7EdSXyfgyCqHUpdcpBeHMJWBuPdWRyg6NPVByIqf63f4Bb2PVNb50gPna86uVcDM5nAtDrf4Pm
	JMwdq2ftkQL7esN2Pe37BX4sF4zPTUWywodaN4vTQWgWdaZL7I5XYhmcKiutMYzbGYv6lOOXuEP
	WTQZ1vPINanQn+UnLWslarmVQslrNNw6glIKGqlySpXMrtqQ5b12pVE4QErm8v+Y5eXspwtwBa4
	oL9BTvltBkOPJVcrJAU6wktFGv4Hsc6ud4sMLK493lkiFJq
X-Received: by 2002:a05:6512:ac6:b0:5b8:9a27:9042 with SMTP id 2adb3069b0e04-5b8b660a95amr48136e87.2.1789513401998;
        Tue, 15 Sep 2026 16:03:21 -0700 (PDT)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com. [74.125.230.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3b97sm297961e87.29.2026.09.15.16.03.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 16:03:21 -0700 (PDT)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff163f65so2753651fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 16:03:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0nOvz00HN9LmEz18PBhQCngVo6c11V7kmQJYIHF7XRWdZKMxWean3+QTxn1K5X9LU2vWEYy6UF48rkU7B@vger.kernel.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus
