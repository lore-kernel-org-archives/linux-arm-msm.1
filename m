Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862E93DBD49
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540527; cv=none; b=ZS+olM/Q0HV3naHgf+bjhHZ9pSVqI31dOmPqn2ykT8tPMBXPr/s7wp309w/Td4MFEkmB6BMmOfTEE90eWqCKU/Hkh2V7Grh7I40l5S0DUu/N18sD+X6qBad0qsC4Zo5IxcMZ2FVcozqkrEeHrjc/u5jnwRh2RM0GFyz/5zT1DaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540527; c=relaxed/simple;
	bh=cdSHai9jLv/4HxW7mLiNCmQe/mk8KBtt5BbXAgO7Ky0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFlOaKx9zQKcTjwtEWGe1jbP3FtxD/0OBM8XVhytnnS/YPOqPJYVf50MjLwYK4jKNuvNWYy7mszWkr9nEaP4+020kC38uJQj3rjMQns5W6NeuDDCMlMltYZri6f0oJDBiH+FDXIiSEA9TCzy2aFB1a9rMVRZvzLcwrdTjFtAWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+nN9/ek; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+nN9/ek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9971F00A3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784540521;
	bh=i2FAuja+iD4bf8uTMjY94rmQCaZe0DcJizI/mQ2EdHA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g+nN9/ekI21BG5tpqZ18Wp7ihyqa0KgtuVYAhlQh/j4W7bTIu4ijusrp03XioOcqZ
	 ZY9+5k3nVTlW9RjeIhUnNnuAKch1xZwpGhwRYG40ncs90W8We5k8iaJjC5Q2oPvhLB
	 LcEq6ItkcoXKxNTOsgN+SssbdMStsf9ZKsA+ekyudIiEoDFJ6797Ojf0Ezzllhzkhu
	 Zs0VOE5JuolB4Tg94hMU1Dh2EHg97wk6uiJZwQtulU5ZBtXCPTnFCDlcuPyKpYI7yZ
	 og9b5WFQbEiNE8n86vaWR7ejJbHujxl+q6jUOwLaqIOKos5oL8VKbB5gIm+YiRnj8R
	 uFQ2AznwU1+vw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so74814781fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp2H6xHM2WeqIXWbvY9QAO84mfoYcsLssuxqQvwbcZPsoelnsr6bciRwPfyQx6NXl1JfejxdoOQ2jHc0ALG@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgzXIDGwv7f58zE4urSuBBkt/vZp9JUFIqZleyI19AWyGQ5y2
	BZHcraWdJKa7CWW878RzZL1Xgmo1wXc6rqwXugq1OTWj4sx5EIGWtFz9Ow02D1280e/Vf66tEZl
	PEHXi1SIVhtc/xAJrFRKlZYrX8Fw0lv2kj+Bsf9hc+Q==
X-Received: by 2002:a05:6512:1543:20b0:5b0:1433:13b9 with SMTP id
 2adb3069b0e04-5b28f880702mr1820033e87.25.1784540519853; Mon, 20 Jul 2026
 02:41:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 09:41:56 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 09:41:56 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260717-fix_vendor-v1-1-f22263c1175b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-fix_vendor-v1-0-f22263c1175b@oss.qualcomm.com> <20260717-fix_vendor-v1-1-f22263c1175b@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 09:41:56 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfxahgQJJr-9KW1cbRuE4RY2nUP623FhvPqEeHgzHQrcg@mail.gmail.com>
X-Gm-Features: AUfX_mw8qA2l6pq5MCOrr5SLPWlkhmKKcuyat-QX8j10xZuSC3L_eKGNN74WaoI
Message-ID: <CAMRc=MfxahgQJJr-9KW1cbRuE4RY2nUP623FhvPqEeHgzHQrcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Bluetooth: hci_qca: Replace HCI_VENDOR_PKT usage with HCI_EV_VENDOR
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Jul 2026 00:08:53 +0200, Zijun Hu <zijun.hu@oss.qualcomm.com> said:
> The macros below have different meanings even though they share the
> same value 0xff:
>
>   HCI_VENDOR_PKT: HCI packet indicator or type
>   HCI_EV_VENDOR:  event code of a VSE
>
> This usage of HCI_VENDOR_PKT is wrongly checking an event code.
>
> Fix by using HCI_EV_VENDOR for event code.
> Also fix warning "CHECK: Unnecessary parentheses around comparison"
> given by checkpatch.pl.
>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index bd29d422c209..f978087612ee 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1240,8 +1240,8 @@ static int qca_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
>  	 * received we store dump into a file before closing hci. This
>  	 * dump will help in triaging the issues.
>  	 */
> -	if ((skb->data[0] == HCI_VENDOR_PKT) &&
> -	    (get_unaligned_be16(skb->data + 2) == QCA_SSR_DUMP_HANDLE))
> +	if (skb->data[0] == HCI_EV_VENDOR &&
> +	    get_unaligned_be16(skb->data + 2) == QCA_SSR_DUMP_HANDLE)
>  		return qca_controller_memdump_event(hdev, skb);
>
>  	return hci_recv_frame(hdev, skb);
>
> --
> 2.34.1
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
