Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707A47D936
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078428; cv=none; b=nD+lpoB+gw6DqLCBAv/C1CF9d+Wsbq47cKC+kT8EdiNRrqO/8hulv7eJ6M0GLnOT3IilmKzF+XJ56CGFWqsdNi6tVvy7xVnJ14c4vmPufnwlG8j5eaO1cSqRh511l2IYMkZQW8MlahfT7VZHO7R4ygKRDkRvx8fzJ6+WYrMrGmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078428; c=relaxed/simple;
	bh=IITuGJnyd7hkwpPEYGZaVjoaxUkycDV8iiciOq/U27E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rY1StkQ5CFwhi5d6qswZyxsGEXoYuZA6qr5pxaCAnl8HWZ5JetWk2/F7/4D4YRisROstG3pMOW2gihBPzZlI+/A4k6+8GZ3BzF9iXsa0E35zT3lR8xpwNcUtZHn+p51eMMtcpmU6BexjKSeW4mmRdSLuG56WDxJBdAHxAMpMbOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l34n6EIl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l34n6EIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5101F00893
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790078426;
	bh=6RM4rZOUQ/CGY0vjeyqh4qsEp2qijHYaOlsrJFXq8X4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=l34n6EIlSzaDcoArRgLxUO1ugd3oZesSxiQVHOuHSz92ZcumrXoImnmTCqcDKk+PM
	 kMCywPCY0KFQXXcSNJHmMFJMYriIWR00WI+wNa69Hg73o4PQuPgq7h7fE2zgJP98iP
	 1VDjdoMVnMKqQ6oARzhse8lb0mNend3y9SOeA5Wfum47e5PmsHkn67KBP1I/ofOMcD
	 Klk6KxTPBDZKaZSyvlluITggyiHJ8T1+MfTU/65WpS/dx+ne+tN+pN0rwIJaCsdq8l
	 1xB1bA65pWs2LCgC/k47gIcUigRUue2KUozPDt0dg0olOPOeqDfJowsZkdxnAS/Ukc
	 KrQVDcoGmZBeQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso3733932e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWbnHuLvLA4ZNDwp3W8DzzG08p6PDJcdcF9qBwN6b93Jh+Kin0lqTVphCvhrAGXv8s06qyJy1FByyU25L1@vger.kernel.org
X-Gm-Message-State: AFuF++kwWEOi8vDPEGEj22rwaZ78jodFs7NlGqY/v5IuPUhGdUEsLawd
	j2yyrE3+DU9a/nybKO8kUunx5vQKGHE2zvzS59tsRUYm0erYrmJd1ObAbzU1lG390PhStTJ01jO
	vdocNqxOq26RIfAVGJGLsBu3CJHoY953GuOUUNDPlIw==
X-Received: by 2002:a05:6512:688e:10b0:5b6:e07:8f95 with SMTP id
 2adb3069b0e04-5b8d74fdd5bmr16988e87.24.1790078423599; Tue, 22 Sep 2026
 05:00:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 05:00:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 05:00:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <03e3cd69-0d7a-4494-bc0c-d6a623f37681@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
 <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com> <03e3cd69-0d7a-4494-bc0c-d6a623f37681@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 05:00:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeJtvTW-V2BU-VCVqhs8wWv==Ga7k-8svDCi3LjcbwE_w@mail.gmail.com>
X-Gm-Features: AcwNN1VUJjlhGvAjEhiOxnkoCaI8DflYJv5IiO5T1oY0X2kpNBbh9kbFnSb5MnY
Message-ID: <CAMRc=MeJtvTW-V2BU-VCVqhs8wWv==Ga7k-8svDCi3LjcbwE_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] firmware: qcom_scm: handle empty PAS resource table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 12:42:57 +0200, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> said:
> On 9/21/26 9:56 PM, Mukesh Ojha wrote:
>> The PAS resource-table query may successfully return a zero-sized
>> table. kmemdup() with a zero length returns ZERO_SIZE_PTR,
>> which is stored in rproc->table_ptr. The remoteproc core then
>> dereferences this invalid pointer while processing resources.
>>
>> Treat a zero-sized result as an absent resource table and return
>> NULL after releasing the TrustZone memory buffer. This allows the
>> remoteproc core to skip resource-table processing.
>>
>> Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
>
>> Changes in v2:
>>  - New change.
>>
>>  drivers/firmware/qcom/qcom_scm.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index df20773dd754..b5959f833dd7 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -823,6 +823,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
>>  		goto free_input_rt;
>>  	}
>>
>> +	*output_rt_size = size;
>> +
>> +	/* A zero-sized table means that TrustZone has no resource table. */
>> +	if (!size) {
>> +		tbl_ptr = NULL;
>> +		goto free_output_rt;
>> +	}
>> +
>>  	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
>>  	if (!tbl_ptr) {
>>  		qcom_tzmem_free(output_rt_tzm);
>
> ^ this hunk can additionally be remodeled to jump to this new label
> too
>

This wouldn't be needed if with my series using cleanup.h[1] in this driver.

Just sayin'... :)

Bart

[1] https://lore.kernel.org/all/20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com/
