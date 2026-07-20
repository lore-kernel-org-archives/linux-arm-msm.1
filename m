Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEB03CB55C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535404; cv=none; b=n7hyoyXp+akMUqo0Gf9ELB9VjRVyk9lPOmOhQk5W/P/Y+yEmcof8JfhlOBJanqZBjX7EXUFF+U2hNYTLoVWCQTwzNjw2KCAYHCw+5mSXofRZcyi5Vp03tUhfCML7xXw0CPX5w8VgEk1YRYjr9wrsrxM05FOtB47sKSZSxicq0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535404; c=relaxed/simple;
	bh=q7+pK/F94rBssKU6SCoBGQTe5tWS4t6gigASWIPaSmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwaLHOLGsQmUkItum/rjN7Wwko/swDBP1iuOsOjoenHsYl/4FJbKIzHBRqtuiLFSae33hLUsspu16gbMeL5HQ7b10yl3jV3fcskTN1ekN248tgY6Bay8NmpQcqjT2fDvfxWkv794/4vZf8rDDcMR6zSE0MgavvsnizjzXkoSeqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXcu351i; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXcu351i"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-697bd21fdc2so8532087a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784535401; x=1785140201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hW9M0UyyBAgaoxgRM13vWPyJ9KUMKcOckCDKMVOqm4w=;
        b=IXcu351iaWEVAfUYMDFD72ht9IZ9xqW94EsvMVgEs7QbTNW7OgYJE8TfXsx2WV4NCC
         eqDb3Y+ETg8Pc5nRloWuMKSVpvtZl6N87WGQnUCbW73oT025ZNA1HWyrp8prpHlMDEDX
         2g3rczCV6BVhwzJFKMEpfjvXOkHNutb0tpqVtpJH7XRB5u+v4qlSLrtr9v5jBO6wsxp4
         rQv9DcZP/xFkfHMvIZ8JiV0mwKVhvHK5l3OoUGpZyYyOm5HROfDP/t6ilmUreAQkVsD1
         1573DkPqjB9TZS66ZU1Mj+7/IQZUcUSEh+uTZtSg2mvaJ72FgvCfe/xvGzqwfB9hmHj1
         c+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535401; x=1785140201;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hW9M0UyyBAgaoxgRM13vWPyJ9KUMKcOckCDKMVOqm4w=;
        b=sAkZ1VdjjQgVbxQ3a3HiTOk4lnu8sq7bqHb+RbtPiX5vfn/P+1m6wQQOZSgcPKltXV
         t7hrkNsW3aRxru2wrzZlYirwBLWPIFWgTO63Dtn83zVhWKudy54uecu2eLyTIqeVV2Zm
         NH2t77EgPZUrGvAa5JZs7wljND1YpQ0SxaUcLycOafQjVlcTSPReL/fReXGqkCVG4dr1
         7q4oyLiNY3rJ4w6MrEfXfEfE0KBMDBHNonbHpIHKYbX/R+uL2pr2qPAKwRgkRZQfkUu7
         cZWC5kEKvGmfVzIwx32JNHGGrQ+AWu5WfZoL800jDejvu7pcQtrzyojvrgaYVSY4AN3g
         aU6w==
X-Forwarded-Encrypted: i=1; AHgh+RqZecrSUH2Puz5rDCsLnd/ztntWGoRruobzbBwcNDCDp4BERqyoesFMGsT8FohRws1dOEevUfJa8ek3zp6H@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhj9EXYTslsa3SB+8KslkgvaaACsMMJC8dLV4mxM0s9ELKvQNs
	d/UAm29+S4AamuQ7f0gd8u0lxWzPgK7H4oKP9L163h+uS1dimZrjVTtu3yP6cYemFag=
X-Gm-Gg: AfdE7ckk2I+kS5W+Qz1buLpTBlDlNgl1Bzy/TSq4GjhnfkoAieuFg1G/MWNnY88w7qc
	Vod61qFBRcxucOzQkOk8oZsqJa3hzFolzDtRXG8OhQZ1/C/mir/UuA2jfJm8M7yPzJ2V+JxTZnb
	flkTthifd5TaOZKBpO50AbSLeTJ99f8/3Wo6aQ/FQfuS2uzm+sQMWPOGjOJh8TK/5Q4qA3+dO7s
	Hm34cgxMcnziWQh2uI0euDHk9QKbNBJyNYCrKVioCYrI945oomfMLN4Lbzuq1xWXNEj5VMNzcXP
	FEjylfvy9PjQTFnUu93NGn9KprTF96xUFoXMd4jKt5WMVzCAiA6Qkr46XTcsEoqOqejVIjpydcd
	pfchLEVNWLgzQkohKdzwtGYCvdJRM0ADNyRGMo1PQWa1R15n4bENRy7tgHRuXYTn/5S5k7RBzS1
	oJMYd7P5wt4urWMQ==
X-Received: by 2002:a05:6402:234f:b0:69a:1932:7807 with SMTP id 4fb4d7f45d1cf-69e65310df9mr4828148a12.37.1784535401346;
        Mon, 20 Jul 2026 01:16:41 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.26.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fff537csm4185342a12.25.2026.07.20.01.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:16:40 -0700 (PDT)
Message-ID: <bc691d15-1e28-4f84-bbeb-463c69b239c1@linaro.org>
Date: Mon, 20 Jul 2026 09:16:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Program CSIPHY common control
 registers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jigarkumar.zala@oss.qualcomm.com,
 gjorgji.rosikopulos@oss.qualcomm.com
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
 <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
 <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/07/2026 08:56, Loic Poulain wrote:
> On Sat, Jul 18, 2026 at 1:13 AM Anusha Arun Nandi
> <anusha.nandi@oss.qualcomm.com> wrote:
>>
>> From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>>
>> Program the CSIPHY common-control registers during lane enable so
>> SA8775P uses the required 3-phase 1.5 Gsps reset-release values for
>> both C-PHY and D-PHY. Keep the existing reset-release value for the
>> other CAMSS variants.
>>
>> Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> ---
>>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 36 ++++++++++++++++---
>>   1 file changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index 25a3554ef201..11b7a236e607 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -1031,8 +1031,6 @@ static void csiphy_reset(struct csiphy_device *csiphy)
>>          writel_relaxed(0x1, csiphy->base +
>>                        CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>>          usleep_range(5000, 8000);
>> -       writel_relaxed(0x0, csiphy->base +
>> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>>   }
>>
>>   static irqreturn_t csiphy_isr(int irq, void *dev)
>> @@ -1343,9 +1341,37 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>          writel_relaxed(val, csiphy->base +
>>                         CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>>
>> -       val = 0x02;
>> -       writel_relaxed(val, csiphy->base +
>> -                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +       switch (csiphy->camss->res->version) {
>> +       case CAMSS_8300:
>> +       case CAMSS_8775P:
>> +               if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
>> +                       val = 0x5A;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +                       val = 0xE;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               } else {
>> +                       val = 0x02;
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +                       writel_relaxed(val, csiphy->base +
>> +                                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               }
>> +               break;
>> +       case CAMSS_7280:
>> +       case CAMSS_8250:
>> +       case CAMSS_8280XP:
>> +       case CAMSS_845:
>> +       default:
>> +               val = 0x02;
>> +               writel_relaxed(val, csiphy->base +
>> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +               val = 0x0;
>> +               writel_relaxed(val, csiphy->base +
>> +                              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 0));
>> +               break;
>> +       }
> 
> I don't really like this big camss-version switch case with magic,
> which also introduces more magic values. Maybe we should have a
> different version of csiphy_lanes_enable, based on the phy compatible
> or revision.
No.

Just move all of this logic into the new CSIPHY driver. I won't be 
merging more technical debt here.

---
bod
