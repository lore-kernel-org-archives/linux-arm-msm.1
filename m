Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E0C3C3C1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 20:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784148278; cv=pass; b=MQF+Flx86rfwpUNcKl5XjV/tw79IssEXI/rHA513/MOis3m5b94IqZPpCP3EE9nR9piuXPu1zsbxS/ND6tPF4Bu0r41JPPBw/kfhdInZgNTnFZOk1t161lJqKolFSuY9awJwwtYZLwLtbUDamw9fjiKClpT8bNeK8AktC6db7qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784148278; c=relaxed/simple;
	bh=uKutVTY39p0tACln7T4vMquumVH2p1fzakEzXi9+UDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaAlHyv13o0oGLC8bFgwpU9Fd0C3rVVQZAKOYziIc5WrN2YjuLibzNy3UhGwb/AGdFD83oI/i9gbnJect6ovX+T8za9chV8rwXghxo6SXLHpvjey5hWNvqY0AC2WoOzvKnxUgr1cPZco0zHI1d6aVN/h3Q2MAJHh2y9bm2SxIlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vMQbO8si; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vMQbO8si"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so19635e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784148275; cv=none;
        d=google.com; s=arc-20260327;
        b=GjXDZCiIQr9ypNUQSGpYkHg4+blNTolib6m8hbl6bob2yZKvhw6hwAO6LuLz+BMufi
         Lda+W5Ls0daGqis9HzyT1yNpv0GcykKPp5WC1SqnCcbnzq0xC7JTKDaD8REh2UKFX7oN
         mbG0ZWFUd+t3JW/MJtJqbC8bwotOPcIr7o+d4ei4ZLdVmiqAyFWys5otXyvoSg9D+5Qc
         93VW95uSNMO2CDeytevxV/B88XkjufVqazPZ22KsmKJDyslboXIqoWRxV2cX8SnG8yee
         /pg4ppQI5krr754rEohHLeKJ2YQUP9LCX72iRk6G45XUD047APtW99F75t+d6BZJx0wQ
         3K4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hz66rWG1l8090hWA3QPVjjyCjLvMjXWnoSa5qVyf/ME=;
        fh=I0FUgByRaizws4GdXZps5fueSk1VNRcLJ1U9E6Q6vew=;
        b=cQEAgnqCbm+CM/2leM0Fk3S+/JVWwpK/dlvEgMZoMdaHjJErfsOi3auoxiujj9uAwa
         VsnfstFaCfomT1WB/vurHuQJ4c9IRXEiqh8SPL9kth1t6617A31Pw85eTW0gpWjootjK
         7unr4bMEUrP/X5BqGlVon/IZLO3e0PnsenCUK6Q/+96/x3mdJCyC1qvaZgRGrYuUJF5I
         3N8JKbB4SOgTUdS13d0BRHpOsMRVsy8Vx9YMOn23r9m6RQyssVue41r3UfBUQlE7X3Fj
         qpfLTEHydbCqzvPhHhSfMCquSqIyc4akPSVm3MT3mBEGKDRoM1pL+icKF0VkoczRCLxb
         KTuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784148275; x=1784753075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz66rWG1l8090hWA3QPVjjyCjLvMjXWnoSa5qVyf/ME=;
        b=vMQbO8siYryrHz9uC+cIXn12CxECZJgEZWjnlJuaTeu6Tr18uliyzfh60ItZ+q2J4d
         4Gdi4Hd1DTaT6RxOZP81okPwrKohv8TjP0u+Z+5b/9l6ea7bEkZMseugK20DfjMuAx1R
         U5Wyr//dI1kCzzWchMp+dI5n7lbW4EOGG8GcsKblO85JCCwvGoX3a16d8SlfccNB3+Xq
         QXkSDfaM5IQ4+ikCsBWPiP1B7B+U+nJxrE03i3+zrvJE9j8Ug+Pqh+RYF5PENBaJqIsz
         CzblFn8eIy45YVSFOx9sDM84x3wKQcKVesPsEIDi0e+c/vGNde8Nlu7Lgt9EeH2aiAyK
         O5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784148275; x=1784753075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz66rWG1l8090hWA3QPVjjyCjLvMjXWnoSa5qVyf/ME=;
        b=iGNGT45zGu1jCppMBxaFSCfTzpIwFbqKAnlLcJJAokMSlcG+/r/+c6kNmSC+xt6bEh
         si+qk0upPC7/+r+g93CMtzLgh9MRc55xZb6ya/EgAaaZkWH62sLS6wj+BRDlhmN2MKM9
         BTO4jkj8f9BuiGWfpbbLbRW9463hcC89oUbkzG5DzAO0ZEQwvS+ZCe2APZTxikaCUfZa
         Au21hHE2VA4P5bHMdaL/6401pIwIxOAQWIXuTUIM0S7IyzHTs79N7mm6bxanbBJabTkv
         zHIgB280jNqhYMTzQ0gUmqGfU2sic07BfO0u/mcd18sjrTlDJeCZLEEj9DGkCIQmOYXa
         qEeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwHj2qstWONe0wpFFEXaeYCnyC8QPkCvFGRDRs39bfPvux8P5dKF3cS5RscVYxcLS21gTYjxe1+du8ZuW4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/93X39kNJ53Nliqh68Slqfqq3XGPWEX4ftC6Z63GrmNm79GLP
	m9e2bZMoTTWeGOoSgSr9jwRbUlbucEH4Q5W26UTsViWv2TXsJ5/3zNsnTV18vg14f7E7WSw5Ybe
	GuuO0pQ8LgfFlLWW3zW0rsQUBTX0O1PwllXy8cXQ5
X-Gm-Gg: AfdE7cm/YYPtJS7p3/7eAbzQzXrOYupBkTrMmEiS2XV6u/bB2YqVXeEchQxNafyvRZv
	tPVhTbvyMNJaoOxLZfOKAImWo6DcDgbLCLns3F7oka37pdJB2MpfpXkh3OYzWalUW4lX413v5Bz
	w6lST0ZNRvYddZtyjiLJqI9ClyxDG1/uRvpYwaQMYekt0BiiFFMX1U7sZQMTsx/60SaawS6pOC9
	HvFi3UD0jq1VAbNHxlRbrtYSyn66nZ++Ha51X7lFms+M/EhbXaplAkRzLBtVJwHcAZ7Dvx9I8qK
	782QkoJvk75ctSyDWyIbTKk+nUlZvVCg0ejS5a6R53elS5ZtEgh3UT0f3w8=
X-Received: by 2002:a05:600d:8494:20b0:493:aca0:32e2 with SMTP id
 5b1f17b1804b1-49541e54d4amr246495e9.4.1784148274578; Wed, 15 Jul 2026
 13:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
 <20260714114654.3885457-1-shoubaineng@gmail.com> <20260714114654.3885457-3-shoubaineng@gmail.com>
In-Reply-To: <20260714114654.3885457-3-shoubaineng@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 15 Jul 2026 13:44:20 -0700
X-Gm-Features: AUfX_myDNkkGbyCVobnhwftgr4bKDJQunXmKkyEYSc1ZZ6YoWywnkOQfYn032aQ
Message-ID: <CABdmKX2Uqw5nr3-nrSAVHGt7Nij23Mt503DBhbhKT9suN_vm+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] misc: fastrpc: don't publish fd before
 copy_to_user() succeeds
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
	"Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, stable@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:47=E2=80=AFAM Baineng Shou <shoubaineng@gmail.com=
> wrote:
>
> fastrpc_ioctl_alloc_dmabuf() calls dma_buf_fd() which installs the fd
> into the caller's fd table before copy_to_user() copies the fd number
> back to userspace.  If copy_to_user() fails, the fd is already visible
> to other threads in the same process but the ioctl returns -EFAULT.
> The existing comment in the code even acknowledges the problem:
>
>   "The usercopy failed, but we can't do much about it, as dma_buf_fd()
>    already called fd_install()..."
>
> Now that dma_buf_fd_install() is available (introduced to fix the same
> issue in dma-heap), apply the same pattern here: reserve the fd with
> get_unused_fd_flags(), attempt copy_to_user(), and only on success call
> dma_buf_fd_install() to publish it atomically with the tracepoint.  On
> copy_to_user() failure, put_unused_fd() and dma_buf_put() cleanly
> unwind without any user-visible side effects.
>
> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
