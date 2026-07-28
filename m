Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2C31B7910
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198346; cv=none; b=YRJUy9VhGbSOrKcxs2+Rp3DJqCHBbUkTC3h9s8twGh/UWINgDmuN8Ry4FDZxDcijh3FWi1bW92LAN14ye0MYKyZLZRz2Ewepuv2TxG9diDnc1e/bhCr5NOI69npnpBGfSvcp7EBRGgskXOUTITaOM5zcZXbJJcCWGi1oUvJ6s/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198346; c=relaxed/simple;
	bh=JXtzyZbPdKYunneaFIecOBMZxaTfcF91zRrVJogtLIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jH7Mnf48XYmZ7egHqP/Ee6LLTxc9kIhNv/w8allI/DQdKyqrEJ6paUl7FE5ACTYirpX8CtuiLbCVov3Q2SzbeedgrjSS69beCH4w95TSs3Ho5IcV+gFwzsY55H4enOcH8uKiQtoe9t8QmQKuQwZvqs3b/WdcvEWHUD6IPL4mkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNJFaIpK; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNJFaIpK"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so282336a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198344; x=1785803144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=as53GHjZpbLbIzF+K9Jx+5/hmvo3LdjCnw1qaLvpW0Q=;
        b=ZNJFaIpKzs21RaUNfDzCHspb6ETYAHDbRd/6tX9urC6HPupDL2DzV950f65MA+cisn
         OHdY5vr77EHu4T1thxoP/todYh3lhhYyORAiVjFapHijugY6RtRRi9bk6hFpS0fGQdfF
         WArhBfDlRR/lRDFk0lz0mCra9v9BZsitv14PWnhoSy0/w0LjqFcjiAn08NRPhi56M/rS
         5MbDOOMvuT/K/v5ZGrA+0CBgKcIdBzAzuk/POPDA525Pp4F/JPVAb05+Jiwyq/UwYt3z
         8CG1PDxa1wYtrBgkXCZqObsPW+JeW5TLsnh+a2fIVIkFmx/y4RocD+WtsIk5jfmJrGnP
         XgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198344; x=1785803144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=as53GHjZpbLbIzF+K9Jx+5/hmvo3LdjCnw1qaLvpW0Q=;
        b=GRLHK8habmRqksAFBVWNzeEWvsp9cEBcePSQP+7Tl73V6s4oyJ4yYRCaWCkhV7LzBt
         D1rtzWlzeFViBtYIlv9vPVci65pN67+H3Hp3leGA+bhx+8aKD04I/IEGugEVTk9Xbg6L
         2bqdj1kQJ+B/DhV1qHPRMrRpID7AyIldf9GQONlmuwnwNht479+PctpUuwIRPhRWFeYT
         s3dtnGL0l7cT15s/JnVsz8YWOxXEXBD+30l5hWjmME6tcTsqUz0RVXSoNnzz47b309tg
         ppIvxUHl+CHig/C2++Q937VvhcWGnLfPrwfeZcDTNXc3pYGyWCRDqtYKcUwr8my9G4cC
         swNA==
X-Forwarded-Encrypted: i=1; AHgh+RqDU7jAa9xMe0s3paoibj8nOG6wjyKI7HUm9y9/HN42g7VgqOF4RlRDFvjNfOta5yv1n4TnRYtHEBB9RJZh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ubCF8iawHJRVbyD3yR8LUnCo3aMnYpnwujOrNisJN4IR0Sf8
	cF8Ohd5cRarVrjy5Hw/8uthQOk8IPcUmlnoc6yN5GLyfmKpa8WyC3Peh
X-Gm-Gg: AR+sD10rpqS1kJsJSK3Lw+9cRW03xNy7KgOA30rByQkxvZNKmmsp6PYykZHVoYTXR5W
	Ohv6VXLY31i2d/JloksMnsT4r80US8xFC+nWzVL5xm5XRMRECuZf4SbrEf4dp8r71ejAt85+9rm
	AoSzItfplz5FSU1NomKJgvbhEQaZFTu4i8/ryMScVxNhHmyPUj1QwKbY+/HTpVR4g2kWAHJIs7U
	vOT8h/HuM/+hWxsOmjVIl6O2K8U8+AYIxVN6V3XeHMCN90kGNXXlOmlHBm1HmhWWZMYIfTZCEKU
	7wRPxR2yS68uOgcz2Tpve/2G3iBW/r0AVp2FkknMzEANwL4aIhBQkwFv69EXqkCsv/vJ8KRB90u
	lsjIZqy5++yI1BgvgfW+t7y4C+vi3+PLQDDts1Yh8vmLep/UFjLS/0sIxz3YO5PwSBDpc3w6wXK
	7G47shzfgVLAA99PsScuYnPLpAHL/Bl1bHiXoWx9zt9DjXLCH6SgG5J7HUqo9dLkl0jKpwcZPzk
	a/WcT2KZgc/pIhrZEE=
X-Received: by 2002:a17:90b:5864:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38f6a324937mr107418a91.1.1785198343326;
        Mon, 27 Jul 2026 17:25:43 -0700 (PDT)
Received: from FAIZEL-KB ([2001:569:5b64:e100:37da:2f8a:5b33:6b68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f64111441sm482942a91.1.2026.07.27.17.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:25:42 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:25:40 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Bin Du <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>, 
	Sultan Alsawaf <sultan@kerneltoast.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Abylay Ospan <aospan@amazon.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/9] media: vimc: Ensure that pixel_rate fits in 32 bits
Message-ID: <2vz75korzgv3s32ekl2fsgs45erst3s4wd3yxsh6uxyxxn7ddy@2ynykg6ary52>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
 <20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org>
 <qrcq3ntszxswpk2wbeb7uq4gq3mncegwtoncyplkhdhrslzghs@dhkvpb6n5jsf>
 <CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com>

On Mon, Jul 27, 2026 at 12:15:35AM +0200, Ricardo Ribalda wrote:
>Hi Faizel
>
>I was not on cc on
>https://lore.kernel.org/lkml/CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com/
>so I was unaware of that proposal
>
>I agree, something like this looks cleaner and removes the sanity check.
>
>My patch has already landed in media-committers/next so you need to
>send a patch on top of it.
>

Thank you. Its done
Link: https://lore.kernel.org/lkml/20260728001545.331638-1-faizel.kb@gmail.com/ 

Regards
Faizel
