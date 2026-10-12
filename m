Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D93255E43
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768763; cv=pass; b=UZHrEFHRoQyCIU4BSopeW52OFp77JVHM/gdPuum7MjK8pR/IwELt1atGYqKmup9zX/xJEW18cNJY4yHWtw3xUiG5EuGYDadcHuBTXWhUTiTBkHj2B6raqFlEgV0DGUDURbdCKJQJyps3iYMEkhwsyabgGEpap7Qk0PM3a1bxHl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768763; c=relaxed/simple;
	bh=iD1e3KEP3AMbX2eRRt7ptL90vcnRYwFR2RyAi738hw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWQTPRLbP/gd+s8i/v8GfTbMwuYRzfJIldU7ytVMsmgoxguEihLbp95o9QMnjnFE8FjiVRxtmVGDJ6YqZShwlWXo/Wgo/NjfvJqS0QPtEMblC6bDXuODVb5mcEZM3pz1QQnB1oRmQQJ/GCqGMoR991lgyOHqFsIr1/XHjVBnLQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIam9170; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIam9170"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-49dfaa16190so2483378fac.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 18:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768761; cv=none;
        d=google.com; s=arc-20260327;
        b=bl1EjHBoTftEsQ8PiAnZUsgYVvVR0UCsUdZYciTzuxvJUcsB7LXKAwfrsn4PosUhXP
         TAH9+E3qAWO1sepFgbalpby/h898PZTcZtkuiT+gw/sYLs4BNWhCz2ySDvSvJocck++m
         m8oW2v2knEYdNjuDrU755VLjdxFqNe8K/DzsCppqIsImw0nm8Z0SJZwpDNHiCWQQMgFE
         pxp6X3SKZ+6S0prLqwFtPG0d675alEg5kwxiEH5eTViRH2NfJAbN+TFlF3Ixn6k1A0ve
         IdArHiI7tb8GuUTVlpRe8vvi39A+y9QTPb8ynTDBvunAHsxKnATkyzY/WoFDA5j1Gmep
         a1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xg5eXxPVCOfP2W1fQuA9+y5+ssRl17yP6bP6c1CGKWE=;
        fh=3ne3SKmJkbIvVpPUg65bqDxbYRtS55//pa829mMUoHo=;
        b=pMfGe+36r6CH/w4ZFylOx+Ku2X9xSt95VLplx6uPYZpZ0w4HdziXr0zAGJXInEEpRf
         YPR2PEc66D9MmfBRWUSp+0Xwr522H3/+U6PiRp5+bj1lK6o7lmSZxKRT6Zv+AkRMhgEe
         EYtYodiXBJ3PMMj0UkeiRwmh6BcMwa2mXQwKI+hoZQdBAKHQ6sx/xNfYN7M4y4uTTFQr
         kdah8xwvsFrtrYFevKIhtdgxkU0ffKA+Cgyiv6Zk9tc//WQc0HVzIkviN4IefVOmFxcu
         mQ0JwWDvrKe5Pp5R3u3FAv7sxoka9VPxG+F7zdQO4Ki9HOjiyoheqOg8G7lDBoiiH9MB
         kETw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768761; x=1792373561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xg5eXxPVCOfP2W1fQuA9+y5+ssRl17yP6bP6c1CGKWE=;
        b=JIam9170K0mpyHgyKbY5oyjDQtW6eOUfZbsYSJh+WizflM10iW62QqinEzHCvWUOPy
         QB5K9SOF6vsaym6QAs3fgbSqiLUTSbwMChsd41OnMj/AeweMsKT5KN8inSE7XQB36DoS
         BNyeMOECGBKLO3ZjcglBIxG1sXjfGaGwDearLZHypl3KoQVD0Z6RbjO2u7atKMj3JWgF
         NB0i6bzuNZa8HNqTMIthjJwMRiQFaGiS8185W46ls19K9o2dxId8SciT+NOxLw7QlPm1
         ZcfpY+37eOE6NGmQEH2biiihRNKoZu/xpr0yzhuaIe4C48PmphAZ9TdLODqBK0d0YlH7
         BTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768761; x=1792373561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xg5eXxPVCOfP2W1fQuA9+y5+ssRl17yP6bP6c1CGKWE=;
        b=ieFl78oo878RLL40Z9pBxXfqvfSfrxc73/ScFONndFky1GiJKpBOKZqo2eeRt3x5l+
         VxOvK4NwiyLpLqK9ru4Fr7/xnxR7ZBABYEYggVDyJTaNG8i7NnE2NYfyZ77wzFrZJaCI
         PWaAFRRFhORPr0KzOWQqzszoA3vuOnsO1eEPtMvIYPRri987ajcTvuwd3T63hpmJTpXA
         +BolVIq+NmYvVxNriAOF/1Qj3zGoO0oLCst0tE/PShnqZJLDgS/W6L2ETKXao7PpSQQr
         NZKtkLwEREwC7mi0xbF0QkD4gbzaeJYn/MDiY1ocXxFeugFoLwzjAaf5SMSaOMz1VLZX
         oJow==
X-Forwarded-Encrypted: i=1; AKwUvBzidcEi1gpQ8Grbj8KcMDNtLlqwP9YCo0+YCWu1BXdDDRi5iAr5KwwAyQQQBeNcJhaVhYsTOAaiSLS1vras@vger.kernel.org
X-Gm-Message-State: AFq9FYLl0behJWxtOCfDlow6hKB+3uGE9nXi6+h+t6K3pKWHlG2052GE
	ifmQr5d0LTiG7vuqCHg/502X80P5eFrahChRBDK7UVnSPuzIGP7tWORpDTyPZwM0Jx/ieEjf2hD
	t8BF2qqJf2iQ+uypDRWaemK38V7Y8eng=
X-Gm-Gg: AYBFou1zv3yBX+OiLMOUrEu57mzU+3JaNyYSYUKpMiyPupPxCnXpAxP/doVoicDfNyC
	qd5QChVhbPZyQTOtgU5GzQbg5dlMd7lgw8P12mXdAZ6jl83OBA3pU3bekKgg9XAzqqkmQtaEO6g
	5vlaX/W/WpWFQ9994Yqc3FW6BI7t34RHn/Jmvs0/z2Og2o9vfnK3CP7BucEFLQOM0isJbrGl+Hb
	j1k7VrX5YevjodirUF3whGzPf2HeHQ37SCKzgDx6kd4YZQ6xWlwllVilKwooo6p0orVsy3fz/2/
	2SCnwsxiy3G+sxhtmE3M/fOkmZ6LJ0dzw0HlmgqoX6auzaEMfGOvU9k=
X-Received: by 2002:a05:6871:3841:b0:49e:404f:5f21 with SMTP id
 586e51a60fabf-4a2a89d1db1mr5274092fac.12.1791768761487; Sun, 11 Oct 2026
 18:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:32:29 -0500
X-Gm-Features: AclHuK9TFyJC0nw2fQpH9Y6YLn7Y_Y3tLTVWgLwXQneH_ywV-6sddXTE5ZUfZT8
Message-ID: <CABb+yY0G=ubsGQ2_AzM=5LAZW7xSucVMZbt8xd0GMELG7xQDGw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mailbox: Remove redundant mbox_controller_unregister()
 on probe failure
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Huang Yiwei <quic_hyiwei@quicinc.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 5:59=E2=80=AFAM Anup Vishwakarma
<anup.vishwakarma@oss.qualcomm.com> wrote:
>
> Changes in v2:
> - Remove now-empty err_req_irq: label in qcom-ipcc.c (patch 1/2)
> - Restore original alignment of devm_request_threaded_irq() arguments
>   in arm_mhu_db.c (patch 2/2)
>
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20261006-b4-mbox_double_unregister=
_fix-v1-0-9011ca208d36@oss.qualcomm.com
>
> To: Manivannan Sadhasivam <mani@kernel.org>
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Huang Yiwei <quic_hyiwei@quicinc.com>
> To: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: Jassi Brar <jaswinder.singh@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Anup Vishwakarma (2):
>       mailbox: qcom-ipcc: Remove redundant mbox_controller_unregister() o=
n probe failure
>       mailbox: arm_mhu_db: Remove redundant mbox_controller_unregister() =
on probe failure
>
>  drivers/mailbox/arm_mhu_db.c | 4 +---
>  drivers/mailbox/qcom-ipcc.c  | 5 +----
>  2 files changed, 2 insertions(+), 7 deletions(-)
> ---
> base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
> change-id: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5
>
> Best regards,
> --
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
