Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4EE4BEE49
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281348; cv=none; b=P5dP0OAKu1lYjfOsmuFtPTLTpSQKSl1AUL1Vcyoz92T8E8PntdU8bCjafpu5m/fS/sF5IvQTppAnzD70ZMTme24SdUR4Cqw7ehU/ezzWj8h1vxc4prjr91BEGnQgCvO6pWPYZtdtkysu5uZP6dohbBxiuqnAT9GXB7Y+2tfWquE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281348; c=relaxed/simple;
	bh=N2Z+HZuv6woGxKY6m2S5v9+oHAubeSHVW+LqkzilpMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQsG8KvSO2ULawye/uUeYMGRmhV6+VbnDpY5sDwkT3ineEEXCOe3Ah8Q+5hOOtGvPpC0WTVsQORlo4nFWZet1jVjd/h5NkE/P0UyQeBs9eiSTd1VLBgKr33XTBKaJ0Pa55kb5fxVMjmFqLQ9bovlByKrantZfc1KyicgvRU4tv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYgDD5st; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYgDD5st"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso1128045e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281343; x=1790886143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoRk7hkxlClLhVAjR4I+46m1/R/QptxYusNAx1ISo9s=;
        b=IYgDD5stHR+vrYlVg1GwyeD3UvjbXuBmKVOCUSmeRotQWwnO6vtmwCn7zTvhjAzAbO
         6a64ELioGpPBnumMZ6H9Pe+lu8ZKIKeY8hrWJsb1uPM9N342yQtTsGmzQ4JAp2c7cRXe
         RV+AZUzianNB2I7kuTmlu/C1BR2N/dAvzRxuUHZNMs+PHu3E2M47l5gQ7ruzTyGXmnKq
         0ov1zBsovDHAahD/PQXQLFYASZJEpfUKS/nU0OCNFEB9aXhAQUE5hfb4KPjTgpKkqMcL
         06Xy51g4QjYe/q/FWjL7Wf5ZqH1HPgPwcgXtzOuNkdPtGj4Lyn0uAHRh5tXkl2wbL9M2
         JNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281343; x=1790886143;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoRk7hkxlClLhVAjR4I+46m1/R/QptxYusNAx1ISo9s=;
        b=j+zhvRctOUy2TVreBfZYW+/FCqsVzHnS1MISn1okYdPnFQiLxZ1APJoD53fC3urdN4
         EmO5Qd2fV09nsSsSCd+Bv9rgG/GFj82Fw92Fx0omUCHb1/BSU+cuRBosqMBmKAFYPO0V
         HTMn8jG5KhSPFFhIS+KiDlCspXWX6oaKeVzsu+bLbp4HcpeGJGdMRYzITnNT2fhGEhHE
         uYEFBtKbdm/PJOX/tROH+WCspW7dBxIo2btQkHwzutsSXn3H9NcSqF8uDafkmk2TQ2/h
         nBQT3PXNTTTqJmFJkJBIix5wH/gypnOnJ2O4nzHzrTlTHEOrwhN7FSk9iLweLuZ/Xtjb
         2YQg==
X-Forwarded-Encrypted: i=1; AKwUvBw7iD8eAsP7xjy7zauMHOg/AK+5F1hpT1N3UXELJ1QW+XP+LF4VZaFFUYh2AlZUP3K1MSoLFt3lZANtVHfS@vger.kernel.org
X-Gm-Message-State: AFuF++n5cqzPqe8bVs0g0iqKJYfoflxov1R4ws2nYLI33+DkmLnM6NXA
	z5wNbbMfXmitEFpFIddj6JkEgkKcCDa6TI58J8/1fkWUTHV5Z5CaV2Mt
X-Gm-Gg: AYBFou0XjQHnWInZo1L5afEcmTzBWRByVXmPkY/4+qAwLj6PICGiwx38adhMtYrxY4g
	9Aexw8n6qfXW0LuGzOfb7MFSAcXVyTFvaeGnhGRF4yv18isz4OwI33Tna4nWEcVlKPb0NTuwivf
	3tJeTGMA1iv7MiNE89/YDN1RDQdEzCGYJS6t0kLcjiF9B13itztiUFDRmGfOWsU2OUNEo6cUfOW
	a2JfsVurPnXCJJzDVkWjpaQXSZRzBkHqAj04Qt9dFT17NkVXfb3buAAOzIC06k36cZBPXeIcPFe
	F6ia+ruLfE+4IJ7pIQg5B1efTRiY/EbIrprfGz5AhgOIC88sI0nYJYSFZa2CwuS3ca37GP8QBo1
	rO7/KER7ObCABEb6k1TPYuRjafSo1bsz0C2amU/yXiNeqICSKpVuq+gq08w6WqQRnj1gRUw6flV
	0HrAGGqqRruwnlQDEiPu8eFhfGyvmpKHFAGj6HsPfENTqSPbuydVZabJXkletxqB1sEtPx2SVZb
	kciV0SlG6xeVHGM6SJJp5iJJLanisEmVxzLGQ==
X-Received: by 2002:a05:600d:486:20b0:49f:e941:e26 with SMTP id 5b1f17b1804b1-49ff06b2f01mr1636645e9.4.1790281342890;
        Thu, 24 Sep 2026 13:22:22 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b6108sm3413815e9.8.2026.09.24.13.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 13:22:22 -0700 (PDT)
Message-ID: <bebf5c3e-74c9-4355-b4da-294a87549d38@gmail.com>
Date: Thu, 24 Sep 2026 22:22:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: make check_flash_errors() more
 generic
Content-Language: hu
To: sashiko-reviews@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-1-f3012199b161@gmail.com>
 <20260924200931.6ED351F00893@smtp.kernel.org>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20260924200931.6ED351F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 09. 24. 22:09 keltezéssel, sashiko-bot@kernel.org írta:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mtd: rawnand: qcom: mismatch between commit message and function prefix
> --
> 
> commit a83607e63ec53429dc425262093eef9dee3bfd4e
> Author: Gabor Juhos <j4g8y7@gmail.com>
> 
> mtd: rawnand: qcom: make check_flash_errors() more generic
> 
> The function gets a qcom_nand_host pointer as a parameter but it is
> only used to extract the nand controller's private structure from that.
> In order to make the function more generic, change the declaration to
> get a qcom_nandc_controller pointer directly, and update the callers
> accordingly.
> 
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
>> index d7642db2e2df1..12bfb14cd9a37 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -449,10 +449,9 @@ struct read_stats {
>>  };
>>  
>>  /* reads back FLASH_STATUS register set by the controller */
>> -static int check_flash_errors(struct qcom_nand_host *host, int cw_cnt)
>> +static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
>> +					 int cw_cnt)
>>  {
> 
> [Severity: Medium]
> This isn't a bug, but there is a mismatch between the commit message and
> the actual function renaming.
> 
> The commit message states the function will use the "qpic_nandc" prefix:
> "While at it, also change the function name to use a 'qpic_nandc' prefix."
> 
> However, the code changes the name to qcom_nandc_check_flash_errors, using
> the "qcom_nandc" prefix instead.
> 
> Could the commit message be updated to match the code, or should the
> function be named qpic_nandc_check_flash_errors?
> 

May bad, the commit message is wrong of course. I will fix it in the next
version, also in the the other patches.

-Gabor
