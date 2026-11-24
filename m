Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531714;
	b=i/ZIKI4hU1UoNSH2FWiueBheF29eH3Pm2bvpevl1Ty3fBrAHgyeFU5HJdV9jMNVcSEKM
	 T3aNaasf9Oq6W8h98+hDI4eg9SgTcMeVul9W+64cd6Sptt55gxi26VyYwqqDKBXzVtwVg
	 z8ZhMXFTV69IBanqvXzZzgpvX1wTPCBdkCHoI5b0kVd+iJHfLoKIJPPTLjgC4exVeqo/A
	 tGkBuH4Yr+S4BObEjeXdiWrauc2AjjSUT/BjUiT1VD4CcBa6jQhW8QX2NSdhDloFlGaP0
	 n56Lj65fQSZTEBY2j0UNOY40Yq1WK9osfBx2YybEKFdNTRIn+wg87xVwMn43KmXTmeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=l2Oiuea+KA5m9hqd8bSg+iI1z7RZ71qgwzxTWYwiy0E=;
	b=xP0sfFOm03pVBr5w83X/jZ101udCoLthaHGnzeIIZ+4VZC81vjsGCPcaCLdIf0K5G3Cj
	 UI7Imp6QvO5W91I3uvf+QsbGskFFfvzq585Pr+hPdWEKMFfYtuxmR9I+DKtfV3vR1l3fM
	 fUGxXs3TAKKpOdbDg7N1T6n3L2GyJKSaatjPZpExvZn8AFUq4gJs34yLX1RewZn3RiW7y
	 lkWAiHmLWp2oDrmAupKPg7XWaG1gPgnfbPXDmlzJ9U1VZLy9+OqKY9vQSasDADL1zPkdR
	 9mceXlXonW12Z0/U/9v4QgEQc3guBLXciUXWlugoL9RbF+7wppIbRzxw7PknltkQ8XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NNg29qI+;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86650606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86650606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NNg29qI+
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-3831d564bcfso1761511eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795531713; x=1796136513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l2Oiuea+KA5m9hqd8bSg+iI1z7RZ71qgwzxTWYwiy0E=;
        b=NNg29qI+mZX4JsHfOWFUWwXkh91kEVYjPI2nsEbuGbe+6GvXEmQkEfVnwCJK3JnsD0
         6tc3RHwRRqsWwLU7kla5A8NTzeE1n9tmXP67lwDdzpO7eLE32iARwog50/tBp7gxJICq
         9lr7p1toipg9YX1NOLYZpXMWyvd8W4sU6knxSaHpB4IG6dRasZgkIzR3r8ToohQNvyJb
         +RfXTpD6osUzEpmGptdzTC8hpSuci4REe87sjD/L4d7dmXbowSRZQS9YBSM+j9/oMy8l
         gfcShMdNWqjVMxA4wR0BJt1S8/4S4EMIg9o96YZESQUS13LbFpH8/BM6u0iyTNy6595A
         xyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531713; x=1796136513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2Oiuea+KA5m9hqd8bSg+iI1z7RZ71qgwzxTWYwiy0E=;
        b=0oGP+e6paN3VeOMti2otkgiz+djgWoyILam2EgoyApfQIiLS39aTD8nwQm1hPKWyjC
         MyWwOcWv7xcBFoun6RIMX123VlJib6+pESb2NiodzD7fpxQHJO52aZnSqqo03WO3kHwk
         lf3WTMlXb+JtFmaAGrEDOsEngHBsOgEzSlzL6yT/NtjQZhY0F0yruzYCkKZWhInJcOW/
         y6R3RNoou9S3WzLZ2MHj2yqPn/DS3A8ApLJgLleE+n5G/CAJV++TeXK+fKoouYPXaUvn
         K1pUt3fHlWvagkdPFE/EudEjua0Q/MIqqeSB5djny/RUdBSNb3fS40U/V1cKOdYgDZQv
         MWRQ==
X-Forwarded-Encrypted: i=1; AL+hErEvnclnvJ4A/dBE13ehEmA58t9KQSyX/IdpfloNX9FVbhUnblgRuqLw6V5JA99p+J2RCijy085k8kYFp33N@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fk7P1tOojbZ4oK2ILDmpYvlQ3MaObbXr95QlJpigLZfRtLoYg
	0M40p0MNC7SJCBvby1tLzLwJALPkvzkG9Z9J21ssyBRczPfKKAxoTSw=
X-Gm-Gg: AZFdTZfT1JPrQQgxs6u8XEIjPyEybZQa0PtIiiJgrUKmLN/47MtrC8rSFjjzkEzAm54
	nZreXtXMSY4XNEapI/lRgJm6KCwibmmiAfP7AZZRmhuD4Zk+kqL44+e2VSG3r/gufTjAnlXp5dp
	9yOCEt8Pv1p6ftyRSaSjQH6RyJxoj+30ms4IPBwrUDH9fv4FxAt7zJJyUjW33Lb8fvadkdvsCq8
	V11q2CviOdfel+dQnLGLC6+EwmB6dqyIM9uIg4ejgwF5Fh/tzOt0aInnQfyba52KG6PQcSxC8LZ
	oMHv3l/c0vyN4wTR7Ar3g0gFzg61joLIIOx5XNF06P2KAKrkH6cs0Cyb/vZ9HhoHDyquLC3ADXd
	gJUCugL9GFQc90Wa7uh9LrmaHWpONqKE0ST0+8SviWF6cAfXxXJ6p+a0PPuPhQAncheyFB7FwXs
	Ki/AEJ/vbdnqEhkwx9SwsvYxsRlQ/oLPEOjZW71MRmdOjBeQKbSb0eXMn3GB/1y2L32U9DDMxLC
	uFM9VrA7qjCWAt2ogJ5yHYjXut3Hw4SAFxfABrmPqQBoIqBTYKh4/OKKAQhKqzE3aJEwi2iSD+Z
	XshdlcIFS9Akcvo8vcKnEXQB
X-Received: by 2002:a05:701b:4553:10b0:1b2:6a1d:bf58 with SMTP id a92af1059eb24-1b55694435amr15016501c88.38.1795531713236;
        Tue, 24 Nov 2026 06:48:33 -0800 (PST)
Received: from localhost ([2a09:bac1:36c0:1f38::1c5:14c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm35544589c88.1.2026.11.24.06.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:48:32 -0800 (PST)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: anandu.e@oss.qualcomm.com
Cc: srini@kernel.org,
	ekansh.gupta@oss.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	jorge.ramirez@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com,
	rene@renesp.com.br,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: Re: [PATCH v4 3/3] misc: fastrpc: fix context leak and hang on signal-interrupted invoke
Date: Tue, 24 Nov 2026 20:17:43 +0530
Message-ID: <20261124144754.99753-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117-interrupted-invoke-v4-v4-3-2320a8a7eda2@oss.qualcomm.com>
References: <20261117-interrupted-invoke-v4-v4-3-2320a8a7eda2@oss.qualcomm.com>
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

On Tue, 17 Nov 2026 15:09:47 +0530, Anandu Krishnan E wrote:
> The same unreachable-orphan problem exists for a timed-out kernel
> invoke (-ETIMEDOUT, only possible when kernel=true): the bail: path
> used to unconditionally unlink the context from fl->pending before
> dropping its reference, even though the DSP may still answer later.
> Leave it linked on fl->pending in that case instead, so
> fastrpc_notify_users() can still find and release it if the channel
> is torn down before that answer arrives.

I am new to this driver, so please treat this as an observation rather
than a review. I applied 1/3 and 2/3 to char-misc-next (917fcbf03) and
read 3/3 against that tree.

The -ETIMEDOUT claim does check out: fastrpc_wait_for_response() only
returns it from the kernel branch's wait_for_completion_timeout(), the
user branch uses wait_for_completion_interruptible(), and
poll_for_remote_response() converts its own timeout into -EIO.

My question is what then happens to such a context at fd close.

Once 1/3 removes the loop in fastrpc_user_free(), no path drains
fl->pending any more: fastrpc_notify_users() completes the contexts on
it but neither unlinks them nor drops a reference, and the drain 3/3
adds to fastrpc_device_release() covers fl->interrupted only. A
timed-out kernel invoke therefore keeps its worker reference, stays
linked on fl->pending, and through the fastrpc_user_get() taken in
fastrpc_context_alloc() keeps fl alive until an SSR runs
fastrpc_notify_users(). If no SSR ever arrives, nothing releases it.

The reasoning you already apply to fl->interrupted seems to cover this
case as well: if fastrpc_release_current_dsp_process() succeeded then
the DSP is done with the whole process, so a context sitting on
fl->pending should be equally safe to release. Would it make sense to
use release_err for both lists?

What made me look was that fastrpc_release_current_dsp_process() is
itself a kernel invoke, so it can be the call that times out. In that
case release_err is non-zero, the fl->interrupted drain deliberately
keeps the worker references, and that call's own context is also left
behind on fl->pending -- so fl, its maps and its mmaps all stay
allocated while fastrpc_session_free() has already marked the session
reusable.

That looks close to the behaviour Renê de Souza Pinto reports on
QCS8275 after an adsprpcd init failure, in a thread where he has since
offered to test this series on that board:

  https://lore.kernel.org/linux-arm-msm/20261124141843.3967523-1-rene@renesp.com.br/

If that offer stands, an adsprpcd init failure followed by closing the
fd might be a useful case to try, since it is exactly the path where
release_err is non-zero.

I built 1/3 and 2/3 on char-misc-next with COMPILE_TEST=y under W=1
with no new warnings. I have not applied 3/3 itself, and I have no
Qualcomm hardware, so none of this is tested -- it is from reading the
code only.

Thanks,
Murali Krishna
