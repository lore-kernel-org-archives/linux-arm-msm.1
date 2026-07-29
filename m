Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39671A9F91
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284736; cv=pass; b=JpNSEZaH2s17Rk/hOsM97SZIZ1YD6LwVOT55aVFSD4uMrwNamc/FSvtvbs6cy+VIeYfnxSxcUSLdsuibva2xnn+ktO1NTAu84wO+taSAhoxfPxL1PqQDfC70rb7TgxYNQDIzqjz/afIhR7c1zZasApVV2BzyuRdc9OxcwvzAvV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284736; c=relaxed/simple;
	bh=urfn2gV2+IIAGKF7lAE/sJC63e/zI4c1xP0NE++iaSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5JJ4tj+8GFaPax9eNbS/QMA+SaBtreukcZ4KReGqqnYAioGNGL1ZiCvX6E4YjwnvzCmUMIi9qXhkXD6oT5RPSKAV0cZG6apFuCZPcbBm94Ofw+PseIAXCft2KY8UhzC0IjTNhX4oYtn0jpB+0OT/v/fwBaYbAhneF01NH/ax9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rySOSGYP; arc=pass smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rySOSGYP"
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4961058e787so48700b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785284734; cv=none;
        d=google.com; s=arc-20260327;
        b=RLZ89btoNMdnzTKHuCpkwzpxIV2d3eXf2Qz615AKjLF8ryl0ixWvQpMVW1BFrPLY/t
         XDoEYcxNL8bKOEfnIHzxb4ghm4ETunG1SrqGq4NgDORtcDUHOSEe7t4dlNHFMYZIxRE8
         U/iAKZkMZ15GJ2V3i3lyYRbxbupx2qEcDTp99nHqN8/UOjh7cdNbcUwRG9iSf9QXGoy5
         D/qLv8r3FJULRmIqPIuSmwA7en9Kv/GWion893jBn1E/Fr8tI+C3jXU6VD1KkshmYRbM
         W2s+ie7Mdy08Il1nzRRo1r+HpkrmMtXnSSD1uv/vmoIH65jUqPqKPO+1WXx+MdBFsVCp
         QjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kPAqqOFRZVA56/B05RB3BhG1EgEuPcvqnYLmXO5rUdc=;
        fh=NW3a0ZNW5ST1mSJXQDUhgjMyN+Zka7OkWBRSBg7EuZI=;
        b=NGTTnd+gCKWh/Av9FTvxc0QyOKa71dAeagjwx5PEf73A0UhV/RLhUovM6IV9jQNOzQ
         gEw5P5x+St9sBnvzNypeNMFfMnUBhrLyRVhr7ozd5XZv7O76+T/bDwmClyBOGP/pYbBH
         V5boMUcwOARo4wNhnXVeLCXOksf4QAyTXTU8hez6dUc3vUvmH6/SIBz6bJBeZbj4V2aF
         27NOklB65fTGAH1exqIDn+4Up7ClVailH5ylHUsIW4Q/a7sk7wBVcY37VQ3C1Prcx2IM
         Wgb9wFRnLWm44FNwWG1Zp30w0Iogx3+gKV6v222XLnzMY90JJX+OkBqWoliXSiY21g2l
         RYgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785284734; x=1785889534; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPAqqOFRZVA56/B05RB3BhG1EgEuPcvqnYLmXO5rUdc=;
        b=rySOSGYPi0+zVsmqyNa+If5/iA5Q7eywPEIybHYJOl31pNAphWb3h0yQi/+6ZNYA3n
         mpi8lefqalimp9TRoOrtfB9tiyaarS8clZzVcENeh+ppWmQKNh+G6gyhY3AvUIvZBNSH
         /C0m16OvEMQcSxxioKjLk1YzBVbQ/kUh2b9d10cNacVfZ0H37BQF5QFJyde6PG835Q5T
         lBfFKY3UmpuKhMoWrAgf0E7Z+UoI3UByKi2xURbahQdlbxLkjUnMaq3oG4GPDdXPxIyy
         sh9McrnU3RdTyoLyqVn3W3yVkMQ11hJR00cCZRSlhasKoN9L0bq9076jn7WHyCjxkP+q
         CsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785284734; x=1785889534;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPAqqOFRZVA56/B05RB3BhG1EgEuPcvqnYLmXO5rUdc=;
        b=L0/S6atSWQvCbwVqFTHm8Rf65ScsVSC+7Vl5MZORblfFpRZrTNYpONDfKYppGm7vEN
         JVe/W10Zqh+VGEivzPBIq8V8GSIzcQLVa7BOryoyQmYPV/Yw47PUjqlouCUoRUxyAONF
         nL8m3m9KXQjqSSWH5J9z+nKRbORog7X1r+zwhE6dRohaK6lB/JmhYxVaXmeeGMqXIn7F
         0FGe4d7SBQdipgptBhjrIoS1lLvaGngIfgCL8AULqA1MoAJ55QTsDUV+SBRSZtj9TkUq
         MxoO3ETv/HOyB0gANsiVDnvfXXxssWG23crdIlgqezzPRhhzDnIpDdbru75avo64e4gv
         EaUw==
X-Forwarded-Encrypted: i=1; AHgh+RrXQ0Ad7qx/hz+E21y0tIAcyIMKCQhCztJ/v9JqLcdwWyeQS+rKawROas1fEzdftw0gxIlI0Z7AKjdUOb6d@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0bEX/lkaeSEfSB7y6PT7qMemugrWFPtXlq7jMHOBr1B0grt2
	e7jalG5NG8SKvV8WHfJam7gL+cPTQMi+sgalTWLjJEjP6b9Rqh4kGcoB1F8cSQX/5Rz+anKXI3O
	ZMY190knV1MtFhBbT5KNhFjn+6jlTyR8=
X-Gm-Gg: AR+sD107KCx4CnW0jZaofiXFsTkqJKeHaUW8uKnhps5Kste7WdQD5E6vWb85dBiJXLd
	0ZY/yK5FK63GvZF9qlW3MEamkOe61VUbU54JPlo6/V/t9AA/pu7D9PGLsbWYRF1Af/bBlT5Z7KI
	j67cQA3G5X5+hAzMGi+93M56yNbyvLEyeNy+qd0mn6/W4sH1ppvNVQX6Z7rebvevybj4Njb3DHf
	Dm/2Rr3p3X3hEFu4+qrtnArAQo0zWFwN/0Lg5DHNtikvfYkzgrLNeS0HGcpoqwGdjds1XnYLtR6
	cDV3tdbtH01kILEoSbdjBFjkXWPDEkeiuyYuCQ+eADZ6
X-Received: by 2002:a05:6808:181e:b0:496:10b0:20f0 with SMTP id
 5614622812f47-4ad5beba457mr2296969b6e.42.1785284734582; Tue, 28 Jul 2026
 17:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604051814.41738-1-dennylin0707@gmail.com> <59e9c722-f58f-498f-833a-41eed573c23e@oss.qualcomm.com>
In-Reply-To: <59e9c722-f58f-498f-833a-41eed573c23e@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 28 Jul 2026 17:25:23 -0700
X-Gm-Features: AUfX_mzvGqEs9OEc5qsrnpcXTAS_F1jnl7BhCJ2N0FihZr-toiiTR3QLOhcUJLM
Message-ID: <CAGEkeHc2JNfL7SfPk7Ad1kOTftnBhBtdLk7PcURZ-0iWwTL4oA@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: iris: rollback OPP vote on PM resume failure
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: vikash.garodia@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org, 
	abhinav.kumar@linux.dev, stefan.schmidt@linaro.org, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> opp_set_rate(0) would only drop the performance vote but keep the
> clock ticking (without ensuring power). If the device's power state
> remains disabled, the OPP vote will be kept disabled too. I don't
> think we need it at all. The clock may possibly need to be disabled
> instead. Or maybe not, if it's hw-controlled (which I'm not sure if
> it is)
Thanks for the review.

After tracing the call flow further, I found that the maximum OPP
belongs to the complete VPU power-on transaction:

    iris_vpu_power_on()
    |-- iris_set_icc_bw()
    |-- iris_opp_set_rate(..., ULONG_MAX)
    |-- power_on_controller()
    |   `-- iris_enable_power_domains(...)
    `-- power_on_hw()
        `-- iris_enable_power_domains(...)

The power-domain helper only manages one functional domain, so it
should not own the transaction-wide OPP state. I will move the OPP
lifetime and error cleanup to iris_vpu_power_on() and send the update
as v7 after validation.

Also, sorry for the versioning confusion. The previous unversioned
posting was intended to be v6.

Thanks,
Hungyu Lin
