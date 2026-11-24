Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.231.133.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534668;
	b=CwThtJuBkVG+/VJX3WJX1kzGJ7SmgFExY2vDn8ELMjhMazeWSCvzU7d91Y3pB/SakjRs
	 h5CFIv3+E+pA8BgYIWD0xd+u3WsZuwQNHIEmaBxF2yALV59wPc5H9mrnaaNXd0FPYayka
	 PRvPfQVhYzHSZWMsiolu6kqWaqu4/iBCPok4t+Jz4OBDSKbHcOxacStgpFVLST29jL5jz
	 TX8ffCSOXcL93L8N9oHgFLSZj1TZHRRwqG0ziHkJCjBfMJF67DbWP58vhRZtvnn6gKWlX
	 RpGiR5TqEzq83IN3xRvuiEwkqhvxH4XRnZa9QyyjpoJSDSrkpqdvygFUXJdl+DCPUUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534668;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=pf0CmCD0x/LlXde+9saRrNnHTnRw4b/5OxcUH4Nh+LE=;
	b=gQ4xvwuguUI+EE0tsCB4lllhkc/FSHHNZ430v/IIxjqYa7sxCIjK9ZKd23a+LKVbdyv6
	 TO+FXmmNjmhi98azeHZVkZpj2HJyHZlGraBObo3tNm4E6vzjkoBJlq1nL3M9Xp1l8xzd6
	 KUNPpi94zNljcl9Juu9FTjRz7vD0KjZDRWaxCXGfrDh9NjKEIjWDaMZDizYVI0bpTM/Gy
	 plXv0wr3Xb4/OyeaAGoXdGNYHvw2CTg3JS9L2pqrv71rFZ+Xh1T/+GBFQzOiI6Nh4q1VQ
	 7B+Dq/VjZ/QnJwyrkw+amFGwUJ4ln/8kP1VXMFPNrDju5q59z08F4BQl7PIwYc29OXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesp.com.br;
	spf=pass smtp.mailfrom=renesp.com.br;
	dkim=pass header.d=renesp.com.br header.i=@renesp.com.br header.a=rsa-sha256 header.s=2021 header.b=BfxajVHW;
	dkim=fail reason="signature verification failed" header.d=tempos-project.org header.i=@tempos-project.org header.a=rsa-sha256 header.s=dkim header.b=3Thf7+OX;
	dkim=fail reason="signature verification failed" header.d=renesp.com.br header.i=@renesp.com.br header.a=rsa-sha256 header.s=2021 header.b="LxHYzh/x";
	arc=none smtp.remote-ip=45.231.133.222
Received: from mail.renesp.com.br (mail.renesp.com.br [45.231.133.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B75606A686
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B75606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=renesp.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesp.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesp.com.br header.i=@renesp.com.br header.a=rsa-sha256 header.s=2021 header.b=BfxajVHW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=tempos-project.org header.i=@tempos-project.org header.a=rsa-sha256 header.s=dkim header.b=3Thf7+OX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=renesp.com.br header.i=@renesp.com.br header.a=rsa-sha256 header.s=2021 header.b=LxHYzh/x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=renesp.com.br;
	s=2021; t=1795534663;
	bh=VNf1YCXsU2lc0Yniio6DD5hquzwsa6ugL4GkaPD95nE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BfxajVHW3bgT5HzfD6Lwy6Bf7INGOe0yM5OJkF1UDYzq+w+vGy2AvSVIshQXqc8Fq
	 fHDQFEzbYia9Y6uOztRdOagazNhDBWWLRiB/vlajQg55ZcL0yEejUttioiCTFf8FKK
	 lCKAv9ZzQlY1kldyujh17lyj1IyLs3N8acYpBs7Y=
Received: from renesp.vps (renesp.com.br [127.0.0.1])
	by mail.renesp.com.br (Postfix) with ESMTP id 4jYn4l6T8Sz3wvQ
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:37:43 -0300 (-03)
Authentication-Results: renesp.vps (amavis); dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)" header.d=tempos-project.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	tempos-project.org; h=content-transfer-encoding:content-type
	:message-id:user-agent:references:in-reply-to:subject:to:from
	:date:mime-version; s=dkim; t=1795534663; x=1798126664; bh=VNf1Y
	CXsU2lc0Yniio6DD5hquzwsa6ugL4GkaPD95nE=; b=3Thf7+OXbduuQCQkZIJM2
	DPPHBfDhsAX6MovBSq/jcqSCWPhldmMMgHPeOTDtagalDicXIBjgRfhS+0KsIsuI
	0zpsXRZEg7xOw+tJuh/IYLB4eW4FmiiBP2BPyCFb4Sb/YlZD/j/i57zRaAhQJINV
	ygW4sBMoOYKohWXS+7pd7X54H1srT1yX3Q/zxHbkSGSM+/uuVuQb8nF+ht1S6Gs9
	BFZIPrnfWKt/U0CYv5lgH427pU96NPDnpNIcs7/XlPkmx/gyU56SZXAPLpxBX+5q
	iUdQANR8wJAxnETHmO/TP3yS8weGqo8udYo3LfQAR8RTft7f059imrkdkzQqMB9w
	g==
X-Virus-Scanned: Debian amavis at renesp.vps
X-Spam-Flag: NO
X-Spam-Score: 2.21
X-Spam-Level: **
Authentication-Results: renesp.vps (amavis); dkim=fail (1024-bit key)
 reason="fail (body has been altered)" header.d=renesp.com.br
Received: from mail.renesp.com.br ([127.0.0.1])
 by renesp.vps (renesp.vps [127.0.0.1]) (amavis, port 10026) with ESMTP
 id uu2NqhlBR_4z for <linux-arm-msm@vger.kernel.org>;
 Tue, 24 Nov 2026 12:37:43 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=renesp.com.br;
	s=2021; t=1795534652;
	bh=OeuQovqVTmmyTNTCh34NkbNDjZ/iqKBQ4Lgvm2gPQ9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LxHYzh/xQQ7Gj5nEkVc/jgCsMWY0n9JljeuDZZtC6BpX5NJ9h121bqw8ZhwOfJfZr
	 x1QL//WRuhFrIKRFS0XnH8pyfDmM90n6FlXMTdabr6Ji5dD4na3WliJTFd8se7qupD
	 DRv9oe+nd6rWntEoUZCDxgEM2qVlvSxOSD3YZu5M=
Received: from mail.renesp.com.br (renesp.com.br [127.0.0.1])
	by mail.renesp.com.br (Postfix) with ESMTPSA id 4jYn4W6fbbz3wvJ;
	Tue, 24 Nov 2026 12:37:31 -0300 (-03)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 16:37:31 +0100
From: =?UTF-8?Q?Ren=C3=AA?= <rene@renesp.com.br>
To: Murali Krishna <muralikrishna2444b@gmail.com>
Cc: anandu.e@oss.qualcomm.com, srini@kernel.org,
 ekansh.gupta@oss.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 jorge.ramirez@oss.qualcomm.com, srinivas.kandagatla@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 3/3] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
In-Reply-To: <20261124144754.99753-1-muralikrishna2444b@gmail.com>
References: <20261117-interrupted-invoke-v4-v4-3-2320a8a7eda2@oss.qualcomm.com>
 <20261124144754.99753-1-muralikrishna2444b@gmail.com>
User-Agent: Roundcube Webmail
Message-ID: <e6fd92e5bb6605ff3591c7813ac22055@renesp.com.br>
X-Sender: rene@renesp.com.br
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Anandu,

I tested this series on a Qualcomm IQ-8275 EVK (QCS8275), backported to
a 6.18-based kernel. A llama.cpp process using the CDSP was killed
(SIGKILL) with invocations in flight, three times in a row: each time
its ~1.9 GB of DMA buffers were released at close, and the restarted
process got a context bank and loaded the model again without errors.
Without a fix, the buffers stayed attached to the context bank and the
next process failed to map its own.

Tested-by: Ren=C3=AA de Souza Pinto <rene@renesp.com.br>

This also fixes the leak I sent a separate patch ([1], as mentioned by
Murali Krishna), so please consider that one superseded by this series.

[1]=20
https://lore.kernel.org/r/20261124122011.2912030-1-rene@renesp.com.br

Thanks,
Ren=C3=AA


On 2026/11/24 15:47, Murali Krishna wrote:
> On Tue, 17 Nov 2026 15:09:47 +0530, Anandu Krishnan E wrote:
>> The same unreachable-orphan problem exists for a timed-out kernel
>> invoke (-ETIMEDOUT, only possible when kernel=3Dtrue): the bail: path
>> used to unconditionally unlink the context from fl->pending before
>> dropping its reference, even though the DSP may still answer later.
>> Leave it linked on fl->pending in that case instead, so
>> fastrpc_notify_users() can still find and release it if the channel
>> is torn down before that answer arrives.
>=20
> I am new to this driver, so please treat this as an observation rather
> than a review. I applied 1/3 and 2/3 to char-misc-next (917fcbf03) and
> read 3/3 against that tree.
>=20
> The -ETIMEDOUT claim does check out: fastrpc_wait_for_response() only
> returns it from the kernel branch's wait_for_completion_timeout(), the
> user branch uses wait_for_completion_interruptible(), and
> poll_for_remote_response() converts its own timeout into -EIO.
>=20
> My question is what then happens to such a context at fd close.
>=20
> Once 1/3 removes the loop in fastrpc_user_free(), no path drains
> fl->pending any more: fastrpc_notify_users() completes the contexts on
> it but neither unlinks them nor drops a reference, and the drain 3/3
> adds to fastrpc_device_release() covers fl->interrupted only. A
> timed-out kernel invoke therefore keeps its worker reference, stays
> linked on fl->pending, and through the fastrpc_user_get() taken in
> fastrpc_context_alloc() keeps fl alive until an SSR runs
> fastrpc_notify_users(). If no SSR ever arrives, nothing releases it.
>=20
> The reasoning you already apply to fl->interrupted seems to cover this
> case as well: if fastrpc_release_current_dsp_process() succeeded then
> the DSP is done with the whole process, so a context sitting on
> fl->pending should be equally safe to release. Would it make sense to
> use release_err for both lists?
>=20
> What made me look was that fastrpc_release_current_dsp_process() is
> itself a kernel invoke, so it can be the call that times out. In that
> case release_err is non-zero, the fl->interrupted drain deliberately
> keeps the worker references, and that call's own context is also left
> behind on fl->pending -- so fl, its maps and its mmaps all stay
> allocated while fastrpc_session_free() has already marked the session
> reusable.
>=20
> That looks close to the behaviour Ren=C3=AA de Souza Pinto reports on
> QCS8275 after an adsprpcd init failure, in a thread where he has since
> offered to test this series on that board:
>=20
>  =20
> https://lore.kernel.org/linux-arm-msm/20261124141843.3967523-1-rene@ren=
esp.com.br/
>=20
> If that offer stands, an adsprpcd init failure followed by closing the
> fd might be a useful case to try, since it is exactly the path where
> release_err is non-zero.
>=20
> I built 1/3 and 2/3 on char-misc-next with COMPILE_TEST=3Dy under W=3D1
> with no new warnings. I have not applied 3/3 itself, and I have no
> Qualcomm hardware, so none of this is tested -- it is from reading the
> code only.
>=20
> Thanks,
> Murali Krishna
