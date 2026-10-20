Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502637;
	b=xm5v3VtbJhd1mAf1aBaDubwfgaVQxJGqm99onjWLMDVRcouuwLPULcb0OyN2ATXWyVVB
	 Dab0ymDSRu9RDOG9DS6RkHy/V57nE/i2PWQmtENHE7lI5GCkTxGRLrK4UqVtvU5HLcI90
	 Br6A9OJqktNVplkWWh20Etnq35H5UiPYOepl4W7IFUcqct25q4uED4RnnJq7Umurmallt
	 ZKLjZEERNcGqH8IIUbO+mz8G7gmkMO4tg1f6mp3tght+pL6WHsvXWdbTF0H98kFC3N5eu
	 RJvyBGcEywTq9iXEYBpqybudRU92qMunxYCqBoXYn1HEpamDru28M+Erx9D9XzKnasw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vOwJdBkJQT2ZZgsV9Tvx4zTJRIWa7XIIOUhJ8h1ztTI=;
	b=h8EZ4QleVsBEJ2HeXqQRAmU+qHyeDRqV1uFPYFh+59RtVIeDLybyb9TCzHpHZuWftm2W
	 ATmgb6CK209zcivgePR81n/bDK/Wz492l8nZC+0LFVLShuHEUhS2mOWGn3Yu7Xp2tKNJ+
	 CFR6/HeCdfNEhjfuuH6w5RAXyXdaDqvBIROFblQhXxSu9N5+cSSGwxUBLKXCHX3JaUZTK
	 IPHfdxxBv3eS063oOiwhmeP6UIufu52JcGDl+LTpT/xpVqpF/Brp2jZeKl7m7vS4VEedS
	 5LHQVbfIkF3HL6SSyqYFaxFXZRujzaHthr0kAKP+2vJZtMfmXDo0KgIQ/LGFGYQWvLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hOqFBXvw;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A4606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hOqFBXvw
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a07078200fso795871b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502637; x=1793107437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOwJdBkJQT2ZZgsV9Tvx4zTJRIWa7XIIOUhJ8h1ztTI=;
        b=hOqFBXvwIqfLxs4G+ZTGW17EGdDcEoatHHgJDFqPnmSt9WtAeYWXTUUwWWl2pcT37u
         NpnQT/lwgz37PVRADHzRQd/qQ91udzQuNswOUANj0LLj/TMwrE/v6Bs++I4N7brqkjpl
         0FBNI1KmNNmgtPLPF57K+IyXhaJFw/SS7ropGRa2lGHjofqxX7ypaOHAdT4SFm72XKNB
         Vn4DpgwHsY9SWKIY4SMaijoNIEmPrDBbFrunchSl/DsuYKVV1DHfbzk1eovQHXLKXqxE
         L/9Ry+U3/pd0bdJqDVfPTdKgpT08ARfWFHooTTv1psuIp1c8io/aJyABc9vp4MRJwfF8
         HGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502637; x=1793107437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOwJdBkJQT2ZZgsV9Tvx4zTJRIWa7XIIOUhJ8h1ztTI=;
        b=hx6pgDLOrhC/h3bHjT41H0sFYWmCTyTdTwrabVRAydttSTJdUWEJ4a3RU8ZycEblAo
         6iUanML2dIBajBgzwAzI34AWfWQOP7Bb9oIzLTZBZZNGJeUYYNQS8ngPYeJKkBqKJBcs
         mDj/jcHMvXgJuJi3TahrUwgM3GFKB6dCc6eFh4pOgKzT8TPZLfyZ6wR3+i9MLUvd4iXG
         6jzKv4tyeQzxImeKPci7vcnndQJgm9bum+SJDy/X2q1aQ1m4CKE8eEo+Ft1RENDhpX8s
         MTKYw6KjAHr339R/O8ED+BLbKlfq7WPqcmolRCOUXurf3QrdlN87vBEeAJnTODLHMPwl
         E0rw==
X-Forwarded-Encrypted: i=1; AKwUvBz7flRpEk9/7E9Vj6VzJqt01SPajdZM6PSM6yAlEEfbwCKjPFgox/D+JIQZkyrwSl7L3R+K5VsBb82g6xdd@vger.kernel.org
X-Gm-Message-State: AFq9FYIBYOjwOpevTN2yIrt+OILCkh7o7UOXOAFtmNJLnRmgRjgZPugy
	biC7ykdZCvTJjTF/Mc6nYjJwayrRY/JvYY9lbV8razYCZ/Wd1zTodRXz
X-Gm-Gg: AYBFou3o334nkHlMlyeQPMYwOGNIdNNeOOD9XHN/yL8Hi1Sif3Jd2pD8ALh0HSsAejP
	naSdmLybhO0NBbiBZ4eivBhtIKAIFRTH32cHfvCxO18OSUvbvs+6bYes9MiT65RATvAf9W0iTHy
	B0B4vxogM+KGzoy9Aw92kFTj8+swNnDGnmj43XJJvgvYIZLySj7F4G5QjfzNLgyg+KxT9CI2t2w
	KJT6n7HLG9uIj3YiHFl3AdPUXeO9AS0dYSHW7cUnhPzwr1g2iQkOBuGlMsq/9C5+BhQXhBtFPZY
	9EkVzlmpsmZhc/O/5boiwa+ZR9x0Q8ExHRWhNXHCgITlAvdSvZE5Wz+nn7TNUv3EIQPuw+4hPAO
	FkRYtx8WkfeWQ+Z4qosolShQ1mC3VKFPUPhkhLRfK4SuXrQdePbyQ4o4VCx4cVVeGcbhIiyZiU4
	t4fmx+vC51VRg+bvHs+9Et+ERapsexTjwrmfUo15UUslSVk55zZzqRDv0RUlxmBI4rs6MBoTCG+
	S5i69yBsqbf7Q==
X-Received: by 2002:a05:6a00:2794:b0:89f:c156:d211 with SMTP id d2e1a72fcca58-8a04caf9590mr8276728b3a.31.1792502636753;
        Tue, 20 Oct 2026 06:23:56 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58208cc3sm4831503b3a.52.2026.10.20.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:23:56 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	sre@kernel.org,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: expose the charge current limit
Date: Tue, 20 Oct 2026 22:23:48 +0900
Message-ID: <20261020132350.953-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <4ec618a6-052b-47de-8418-e0e319af10ce@oss.qualcomm.com>
References: <20261016124806.1789-1-26rote@gmail.com> <20261016124806.1789-2-26rote@gmail.com> <4ec618a6-052b-47de-8418-e0e319af10ce@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joonhoe Kim <26rote@gmail.com>

On 10/20/26 11:55 AM, Konrad Dybcio wrote:
>> +	mutex_lock(&battmgr->lock);
>
> guard(mutex)(&battmgr->lock)

Will do.

>> +	if (!ret) {
>
> LLM suggests to add:
>
> -	if (!ret) {
> +	if (!ret && !battmgr->info.charge_ctrl_limit_max)
> +		ret = -ENODATA;
> +	if (!ret) {
>
> to prevent a possible zero-maximum value coming from the FW
> from messing with us here

Agreed. This firmware reports a maximum of 12.4 A, but a zero maximum
would clamp every write to 0, and a limit of 0 stops charging here until
the end threshold is moved below the capacity and back. Returning
-ENODATA is better than that.

Both in v2. I'll wait until Jingyi has had a chance to check the sign
in 1/2, then resend the two together.

Thanks,
Joonhoe Kim
