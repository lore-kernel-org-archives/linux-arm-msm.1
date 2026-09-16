Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA24D0CCF
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577603; cv=none; b=cIG5IQ/o49R015M7nlWbYlYVuC2A+aIRO7dKvxjM0X07PCjgrd5uCIIuXLSMoILQx3t9wvoepAus0OY8dd6jn0k+h9zqAzAGidVv0pBQeNNEaXWottAHpL9UQgA4TzwNZXHn6UplaZYkiSxF1BeOK4N5I2E24CFjZfjITHlKz9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577603; c=relaxed/simple;
	bh=YkK6RJEJPunD8g8tcyzACJifZmbP0xrMRJxM/ELtzTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkOGP1u7BSj9rtfMYl4cm9VC9UlMkijDy7XdBzGhoFW20c8+h/simbC68YC9kc3jIWTxQuEhWn972ybuHrgu5tmNEm1O2V/V5e07tO1r1r59I1JgPxhlMfkit/FhHttyWBZBZfqFFcycM873gAzuS8gpjvFMZXif5f4UfxRrk0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBhNrtoV; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBhNrtoV"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so1044815a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577585; x=1790182385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyqlA1K0vb4/rd48mxGs7fCQDs5HffhajRXLz681a30=;
        b=gBhNrtoVx8lRC7+z4PbrlBJCws988YibryeVyWl+ZnuXKEJk+0/PfLMZJW+DnH9mwI
         W/cYmYik0ifMZyt8Xz5zWT5ktIXpkR9xEJg/0L837pyxDluDYb7+qUN4Co50i0luf3ul
         fRDevmfutC3d9kYBSfJb+8+zr+VMMikihb+vFQ4hNCx6Kxi3eYk0PDqsNGCAc8vQE9A2
         39UbBhljcq6tvjxPOV5rC07IDODjYdyUYlLxM0IbzjJF3ZhuREC2jT/4SyCeBhFHGkLV
         enSR8LUTt4EOXUyJTbXyyRvBJOeErUFkO6qBtWRx/1ThntF+bRjKHIEh8wMF2y33yEuM
         5r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577585; x=1790182385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyqlA1K0vb4/rd48mxGs7fCQDs5HffhajRXLz681a30=;
        b=K9UCp7mLhpR9XlWNkGwq3vUgDzfmCJ5mp9NZCPDIOtO820LSltDFQUE4sIVs6JGUq2
         PYSbCNQEJnZf4spHIPnnUeO3HhS8vDN/8dkYPVuAgvXn7B5nYf4cwQLBKB8+a7uMVr6r
         hytu52YwMQlYA9TJ00ywddyneuz8aoPPEYEzw0eNLz0Q6VCnpvatdPmPwUTzxXCjoEYq
         MidoGdsBgOp1XorWIK2cO7XhEDdh5iqoKcYtfH4mIdheDaQEcjW1RwL2zBCO82y9DxPF
         ltuqZ03W3AyZkEFQfD1Vxdbm2kA7+rjABcwgb39/ZnPZRxY3wtJGi/D0IEKqnQOB6Twl
         N/nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMRrBkNye2Zqzdgxk67xRlQFQdid5DOu8JGz0KS+6ok91fsbCiNT6arMUA2AxE9mxraHXjQ2nP7nLiL/4A@vger.kernel.org
X-Gm-Message-State: AFuF++lB2R1ZSoMx6UglmhNN6ca8fDv2VsU4FCuPgIey9oTxehSLRjpe
	3dBu/TU1RO3wpYvGANIneO0YrEZaWcHsa67IoksLSgFwlTn6zmnNFCsn
X-Gm-Gg: AYBFou2JqCQIcHgRYj/ck8uNZ5x+0rMkbAtaWUpBLlOP8XW6iCm/FwlIMbRYtOh6JJr
	Q93mcFNBNR2dx8bzUOWWJq8vwkkE2hFVvwVgi0hLbqyyDZaAey7vhOMyD06O8kwhctLLlBUv8RK
	KZVhCV4cnPpFTsH7EQaF3wU2F+o3AryKGOLpFJ5BuLsj9cGPFSwILB2DG7Nqp60rgi5CrPwX9MP
	4a0ibdOvtOAX0vz/lJly6hSgw/iEaxk5OAG0Vh2aloZiGvcQXY3pKmsquuGbE3uA3XeMbC+4IPj
	/ZJhMNZpl0EMvUBkCVi9ZO6oX4ivapcCes9l31sK1h4yD0Y/jvXkYfLrkowOSa9vNEgPtCvpoWs
	Vqc07CtHf+CqngKNiqBvH56lhLzna6mquvdQ9P0TF8OINXi3bw+Pm6pwUKyFMQtQCkMDEwiHcHy
	Vn6MakwRDC66gGArHQ4XjkSEkpBRG8g3WiIsYXS+RgD9z6ehDhFjtEydjQD46OFUnUqmrRvk/dS
	9LvGmWEp0xqXKTwW81z7w/LwSkYQtDwhECDl+Z+Wm4m78YoAxbmn3GrIkdY
X-Received: by 2002:a17:90b:5866:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e1e25a32fmr7684849a91.3.1789577584902;
        Wed, 16 Sep 2026 09:53:04 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:ad72:fda5:83e8:be95? ([2406:7400:56:e503:ad72:fda5:83e8:be95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c2c5d86sm2168471a91.4.2026.09.16.09.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:53:04 -0700 (PDT)
Message-ID: <7d7f33ee-1f07-4170-9d0b-cf5d986ab19b@gmail.com>
Date: Wed, 16 Sep 2026 22:22:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] cpuidle: psci: Move initialization a bit earlier
 in the boot sequence
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
 <20260914150146.187622-6-ulf.hansson@oss.qualcomm.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260914150146.187622-6-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14-09-2026 20:31, Ulf Hansson wrote:
> When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
> it's of great benefit to attach the CPU devices to their CPU PM domains as
> soon as possible, as other non-CPU devices sharing the same PM domains
> depends on it to allow their devices to be probed.
> 
> Let's therefore move to a subsys_initcall, which should be soon enough
> after the cpuidle-psci-domain have initialized the PM domain topology.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> ---


Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

> 
> Changes in v4:
> 	- None.
> Changes in v3:
> 	- None.
> Changes in v2:
> 	- New patch.
> 
> ---
>  drivers/cpuidle/cpuidle-psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index b250d0dde760..0187d6a9096a 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
>  
>  	return 0;
>  }
> -device_initcall(psci_idle_init);
> +subsys_initcall(psci_idle_init);

