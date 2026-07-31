Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C7A44AB72
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 17:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518075; cv=pass; b=CRZ0+4IUEgqDhYobT8xsSqen3+UIkuw+mSUBw5+ANGZ0uw4LibN765pQB8gUFTFZ40+q0tf0uEvdg0ERwP1eruLJ5KaCWyT0Vc8V7dSZt259LqXclIsQDN/ZWruTUb1YCQ0WnO3qCHKBUGOW+D30fzOE5X5QniCXnyu3aKRcQSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518075; c=relaxed/simple;
	bh=ffngbTb7VcDss8OyQZ0TIbyICe29Rhb7o543BGHLugA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mv9xd8xuFF0UHUMyrrl/p/KcfI+LJS3OFhPv5UzKPSqTU+o7Dwt4Qlv2Na3UQrP3lUP7KRKFNO63XkWJBqLAGbqtZK+1pn/IhRtxiomoo0Ezi3gTUSMRYjvuoBShl21rsl1RyUmk4gTJFTabREMcIhe4nYZFGHHy9+/GkNNeVPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fni8KbKl; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fni8KbKl"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69a19eb2e6dso573a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518071; cv=none;
        d=google.com; s=arc-20260327;
        b=JkfxwFII4B/wT5ZSYtn7EwLWUfuCPgTOuPzafDCXk59bx/1QowKCf1Lks0lI6GfsEt
         ykTLiQz9iBFSq3QJ/9zFjZCuiXlvhyiZNhsON/9UnmlAyzanpMqgkLYJYndc4vI6kjaq
         q3NIw1civbwDFExSP/y+NiDazg6phlgHTtoA0/BmKCIT4aDloJF4Y/11zHk9NCELbku+
         4Yjbfkq1ya7xHHofNJ9setpc+8STAdDUe3OeJ4n0KiG5EhczgYp6L0A2GyJ5+GFsEOoU
         iLQRoGiFvjXNdZc3xCYOa2a8U47FAFSe5WMdGy6wCeY1Fenj/Xomc81pKUmd3iBW0J+7
         nO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1IEjvxIxcf25OzZ9XlYmxW3nZw+p1akOleAKSM54hBk=;
        fh=YnbamvRmglnb6QRaVyrY3qMo1slpOEXIctcLA4K6aME=;
        b=WxqKWxMmBLJychbCDE0xTnuwtCeHaPWxechGqxV2vUxM9azGMUxocHNS2XKR87Ftjf
         to1Nk6QnEoWbecxTB6S+dvDRQEoctBflpW0v+2sb6hwGYSf+6bWwdoYVq+JAD8NEPHIC
         7xzZRCg4+Hdz2+XLIbJg4DsdxI8xLGCQgcqCl7FAqTbr9vn4HW5klalKRJrEpT20uSYe
         P/mYk/zLRWDJaNJZDXkWYy1NtberoVC6IDLeYpWNsd6syyOLfCZFT781XTtqtQ32yeuS
         hYrev51eLKcEqeX1GPbtosUNaMhkavnlAJ+KuILN/5Lc1ppYpC1B9yX8+H19OfUs5eK8
         HxXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785518071; x=1786122871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1IEjvxIxcf25OzZ9XlYmxW3nZw+p1akOleAKSM54hBk=;
        b=Fni8KbKlLBw2IOxA0RONt692zF0OCdq2s477p4WMfaM20/wr7HKkohBG8CnJWOlmlF
         GHpxGge9dQIMobk6QOjz6VoiH+lzbBBDz1HGkzFAqaVV8rDW68bUPjR3z8o1QaJpbYNh
         g5vxh7NXHn3dx1/drxTwfzPY6KtNFoFRBA55b1oAfImkqjIJlEeeYZy3IhR/1HUJxpPw
         CSkFyixPaOO01U3Q9Os0MYfbNdzqU2nzg8hRKVCMyPlEqGI0h4LxH8UGaHtejPXpn4so
         Jcihh0paUm4iLm9w83aDyo3csHFs11CCy++2SG8a1eHVXsqY9QobX5qCw2sgNJMyZ42V
         RoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518071; x=1786122871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IEjvxIxcf25OzZ9XlYmxW3nZw+p1akOleAKSM54hBk=;
        b=pPABFSG0g8y5RGeSqQbp5fGw6mkVEgo6QdWUoD0AwUNUqks0Vv7ONvvZVZdSGVNzqg
         TPbuA7ec3IquQxAKdSStrI/kM6XIYq8nX9u9O/lR+MBEcTP1qBH8n78lKD4sqlLpVMaz
         qpp8EtUBB+8+9gGEDhqVViqTUpdoZo9onxwotSkLQe+qMfXfYW/uYnsEse383XJcwRsl
         glh4QfQUrszO+hn0fe8tjjes3uHESWLC3ctuQPRNk4kQ1KQyHW7GOR1xqsvJg3XHg7z5
         KEUN5JRfpXZk4Mkgo/60qCNwcRuH5JlrAiAks2yK4w7u4UL6KXEZHfmtpVeAu86l/ECX
         adIg==
X-Forwarded-Encrypted: i=1; AHgh+RrWJA9TeOQQpisPbe3uDGz3qMv6FigBuoPe20MM5LL8RUtnRuBybnz7Q4TqtTnopstFLbPgcHUDpUT3tu/R@vger.kernel.org
X-Gm-Message-State: AOJu0YzT2KwGUPQVfVVQk5xXgnDaKDSEz3TbOphkzTmEOw6V7sKPpFyH
	vSvTiI2ur+9Jn+4euZjslmnxjL5z516/UnIWtyMYXiqWTQc/PJvhtbd1Aa9c7RqtP27UV3K+6MJ
	UgWEA3SKHLJ1jmSqeMOKMY0tzbAWcw24e7OFkUY+j
X-Gm-Gg: AR+sD134m/igYlCUai3fj6w276DJuXCix2yfMY8VAtklvTcJq/uPdwSvqygpC8B/icC
	/f6415aYwiVziuyXeyCwhSGBivWLirbsMBhARvwP48Cy9AmoQWySmeHnNAUyu4Ehyp+MfGkUQP0
	GlpFCTndUr0YaE0VjtpYDu5EAOPVQYciXzLPhiaw4D/MsSVR7lic1KpuvcnR7jFJX008hl/wgk8
	aRzx+lBh4TzNgmnpKWkTajx4S6a1hHodtT/QwP6L8XpPonCdtsmxw18DQ+beXhyexsymSuPO1ct
	cU2veuRXwTnCWF2GZYapKohNR+5kKqSBxFut9nJUuK2mhkIuR1ORx/VWK2oL6N7zM15fIDzHhkw
	=
X-Received: by 2002:a05:6402:29a:b0:69f:d9cd:ec41 with SMTP id
 4fb4d7f45d1cf-6a0a84fb211mr2629a12.6.1785518070065; Fri, 31 Jul 2026 10:14:30
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO_48GGxJj6AU6vsu-Y18WKtL_9RT=zsXWp3L+ifZdLM7CgGtw@mail.gmail.com>
 <20260730062645.233148-1-shoubaineng@gmail.com> <20260730062645.233148-4-shoubaineng@gmail.com>
In-Reply-To: <20260730062645.233148-4-shoubaineng@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 31 Jul 2026 10:14:17 -0700
X-Gm-Features: AUfX_mzp9OFlht_i5txZ0xvAxi8mLSvD5KWIdtBZewXay8clz2l69cTX7T1s68U
Message-ID: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] drm/prime: use dma_buf_fd_install() to preserve
 export tracing
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
	"Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:27=E2=80=AFPM Baineng Shou <shoubaineng@gmail.co=
m> wrote:
>
> drm_gem_prime_handle_to_fd() open-codes fd reservation and install
> using get_unused_fd_flags() + fd_install() directly.  This bypasses
> the DMA_BUF_TRACE() call that dma_buf_fd() emits, so observability
> tools relying on the trace_dma_buf_fd tracepoint silently miss all
> DRM PRIME exports.
>
> Replace the bare fd_install() with dma_buf_fd_install(), which wraps
> fd_install() together with DMA_BUF_TRACE(), restoring full tracepoint
> coverage.  No functional change; the fd lifecycle (get_unused_fd_flags
> =E2=86=92 work =E2=86=92 install) is already correct.
>
> Note: this patch depends on dma_buf_fd_install() introduced in
> "dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds"
> [1].
>
> [1] https://lore.kernel.org/dri-devel/20260714114654.3885457-2-shoubainen=
g@gmail.com/
>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
>  drivers/gpu/drm/drm_prime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 9b44c78cd77f..fe3436d1235d 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -524,7 +524,7 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev=
,
>                 return PTR_ERR(dmabuf);
>         }
>
> -       fd_install(fd, dmabuf->file);
> +       dma_buf_fd_install(dmabuf, fd);
>         *prime_fd =3D fd;
>         return 0;
>  }
> --
> 2.34.1
>
