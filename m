Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105019;
	b=mYDT3C4sLhw4sfN8nqt9Z26s7qCNOaT66MU5RnYDkDa7Zb1siF1DF+Rj1yirqGUGw7rn
	 plBuhSqIrwB8+0Hui4NiJbE70C5GTNRPHCv6Uq7+UHxgsZs2cCevmZQWZ1YPQSww8vEMN
	 xSSsP7eIdPCrN6YlqWf9VbqD2fyXS0FJwWplFd7XFkYpylggNoDLc22jMAowrlcdAbVzn
	 fSHqLyYDiAumS5D3hlFOK0xeBkrDM6bxgE4HfdmdPErBi1jQAKJFIxgfGK+a4iCZnqp28
	 t/JYcHSDVBKMD/KujAvAPD5gZC7a8ZTG4GJ10RyH4uP7QYQf0RtIr2Ovl8n20jSRH4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105019;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xoEWK29GLcrWcExukGcRGFJ8+4/LLLLzfDVl+1tkX9E=;
	b=yzQYMNBVl+/mUT6Ph+SDcDPBpcYGQuODGE8T4ND8GyK9DcvkX4BdlONWqFBFe81MiwWH
	 V7namQO9JAe5RjagAnrAzRgG89ynCnkUlZedwTxe1OYTd1vv6hpN4cmcw0z1V5Lfj5UvI
	 qx4ubQm26tZsyFWio+TpdHPoIWdlISX7GzlGrDt/KTGWzL2uyByxcE0PD77USUFlAA3Md
	 7lxr66txk25RNqL+EuKvSpvokr3j36LVFQzsq2X1FgaCe/mm6Yd7KhFEP47o2HsISi2nH
	 xRHWEwOw0nLDLE43dVn7sffb2emw6e6oXoLWD/U36r0vt3VYkIYxrTnYjOrUv6ICz3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="U/m11y57";
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01328606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01328606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=U/m11y57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793105016; x=1793364216;
	bh=xoEWK29GLcrWcExukGcRGFJ8+4/LLLLzfDVl+1tkX9E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=U/m11y57KmxG03YshGWxr+g+mkG8gfCTlP82mmTKsVJRezPX+s/s1CSv2Fy61+Cqp
	 IWUoSmmFziYRBLDgmhIXjMEbqA4nAIApZ8VoEIrQuadq0JyaBpCDFC+jKEoguM9zyO
	 iEtOjq5dWb371s7m0H1xwLzTRINcGQkMuBJ7MZvtL1LsW2hXO4UXb1JpMvGeKghf3a
	 INWPRqTurFLwBHMFa+onZ6n/+XJV7M+3EK2sZZYKLmDQqY+0Hx8jxn9gjsic2Va7Qt
	 9Iu7iOhf281njFyyNwcW67OgzJVY5GwpEEnDuIF/Z7QO1Z6SLwPFnNkhV4rvDb5Ql+
	 mCZYgERbLJz3g==
Date: Tue, 27 Oct 2026 12:43:32 +0000
To: Christian Cortner <ccortner@gmail.com>, Bryan O'Donoghue <bod@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [BUG] media: iris: resolution change handling stops ffmpeg's h264_v4l2m2m decoder on glymur
Message-ID: <179310500796.73918.9946996824482992887@pm.me>
In-Reply-To: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
References: <20261026160952.22082-1-ccortner@gmail.com> <36201ae2-1cee-4d8d-9381-dfc9013c522e@kernel.org> <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 21821e2aec1b4d378e2fc7aac8b1d807231603ed
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 21:19:32 -0500, Christian Cortner wrote:
> Birk, if you have a moment, the client would show whether X1E80100
> behaves the same; the fatal errors you saw on an unmodified driver
> might have the same cause, but I can't tell from here.

It does. Same Yoga Slim 7x and kernel as before, so the resolution
change path is unmodified, with your client built from the attachment
and your two streams (min_buffers 3 and 6 here too):

  ab, START after LAST   30 of 60 frames, five fatal errors (2 of 2)
  ab, -A                 60 of 60, identical to ffmpeg (2 of 2)
  ba, START after LAST   30 of 60 frames, no errors (2 of 2)
  ba, -A                 60 of 60, identical to ffmpeg (2 of 2)

On the unmodified driver ba stops as well, without the errors. After
START the client gets a second empty LAST buffer, START then returns
EBUSY, and every DQBUF gives EPIPE, which looks like the stopped mark
from your problem 3. The fatal errors come only when the count rises.

The fatal errors in my ffmpeg runs follow the buffer count too. With
h264_v4l2m2m on 3 second 640x360 MP4 clips, 24 runs each:

  x264 -preset ultrafast    fatal errors in 0 of 24 runs
  x264 default settings     fatal errors in 5 of 24 runs

Both end after one frame in nearly every run, as in problems 1 to 3.

Birk

