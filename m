Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F11413799
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340946; cv=none; b=fHKiuz3JDIRp0dihmImxP5C+yPixVmnmKNOiniF4f6KtfPd2olcJEzfUds2CJuMLmX04PyLSB1k9PVkW0KcW6Vk2XebP7fxmjiHUyjiRoy8Mk1KlVaclATkrzVagaCibqnXdUQejXztVes0rZTuKCK02B9h+Y7FG6zTbDLGGxYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340946; c=relaxed/simple;
	bh=Ix9gy4iNaJC6TKz8JfDA7ApKhF58oPVDVuveegmoPss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCEfj0/Sa27F5hJfCN+hYz1wrcIHbD337g+eGMzgR1uY6hlpdAWQsL+d7yaFNzj2CaE8NqQAS/R7BWQukyz/s7bThcGcBH2HZ05f5kmSZ5IBKP4MJT0waGzrbCBY/5RS/6EKlZt3msdvFQsdWXGJ/E3A85YTU6L2M0VxBwgfSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hz8QZcL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8Hx+JGg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hz8QZcL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8Hx+JGg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VXFX758557
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 09:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2B9311cIh3QhjI7jQVcMJXJqQDtRI7MudWJkahg+Q9M=; b=hz8QZcL1gUEAjyF4
	ifjO6XomZtCApAIVtzyZN5VGc/KBHr0C4BFQZGNxDWd/gjAePmX/FvTl1ac4XmCv
	JPaYtInDdPtRyXuAJ908ypIDApb9Dhhm40y80KMJiN5oSF8+YhwUkpHxp2UkbdPp
	IsuH1N6XJBOZCN4RnWMIyUqbFGwQfoEeOQkjqBNSbd6V2mabEUI++EJT6pE6EI/V
	fVmAC5tf5XmdF0ZH4fwMOzbjcCHiTKR3tq3ALApU5yHiQfsGTQ1ooRZMHo8wkO+c
	MdictcwhoVU42e5IceF9an6Vsq+1yehbhZmIfn1A5XwhMUk11r7Byr9bBoD6VgEB
	rKA67w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j34v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:22:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso1699571a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788340944; x=1788945744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B9311cIh3QhjI7jQVcMJXJqQDtRI7MudWJkahg+Q9M=;
        b=T8Hx+JGg7PkM1pJa9AaKbi4+FsM7X4kXfWKv3EDXlkKMLW2duuiE8MFpmSIve3e9sb
         5yo3B7GsaA0ryVrqtKyaQnaW0WMIgbHSboq8Pz/9RzCPV/jtIQ5Ww1ZRmzDQSbCBPuDv
         7KHvpbJeOPeOUgWZwvFMaRrRKcPEglJpZ5wmTKmYclFdI8Pg/QIPUKZWaE+YfgeKocpC
         OlCsmH/3Fk9cNkKAU2cWWIWuX6p8rVuxLu2HqpMJJO4L7M1X8IihAStFS1J4fRTPWUbv
         vkvyS98dHCP7I9zU87KvsMnoM+Elc6KijyINEZsFJPIyY+hoHloffl4m7ZW+7zKkXN7J
         PRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340944; x=1788945744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2B9311cIh3QhjI7jQVcMJXJqQDtRI7MudWJkahg+Q9M=;
        b=EZal/HskO1X/11smNmIYn4+dSB1nQL5oL4mwDvWm90f37Kg8OzN8OqxpgRKki1pxXW
         emkhfJ/phUIx54mwgJ3HSchEWNvxGCSeFhXvG1edDGkasCXytdSngyq0aeipA+aBX1jd
         5cyapGDsapyEPfcV/IvUxKHHx+tfzdhe0+KpYw9RI0Rt4RjEgTrIAYEW15KZLhSWeSoh
         uwlFiMvrhKzwOAESrWtKZ0rlgCaTMPhd/uQNDVQd+1CPPrqMP5VigXuqu222zAnG8Eyl
         T2e4xNjEIoBZSjTQTOmiIFcixYpyp0aU7lbCd2OM/o5rzSYsZj34ew9ptSVlqUTzjJAM
         yY/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxAnSDazpwFGdRQB/9RfSY+Ovc4QNP+m64vcT4heQU4YdENxEBP38OT/uMl9yM5n82BgS9JTmwHgV2fLRB6@vger.kernel.org
X-Gm-Message-State: AFuF++mv4DD9MEwrFsB4BTMYkWUooeITW8FWig2F4vsmcFuA+4PXj+yt
	rtwYproFGjCugUyqE6PGhfMqOJJARFttHH0TkxuWHlDZ4HIlktJLauZgUFhOKn6ImGkuK/jKv/1
	OnoDKQIkql9HklnpQa0cETtHVSOGiIKccD4DZn8XzOfKhzFakzO//V3TKT7h9z6+K2qhM
X-Gm-Gg: AYBFou1V/2DJBbmg9dNMNyxEBaBB1Pn065q6VDmJsygSqudfmfSebrQyudd28hKqjT5
	dj6ltkusiKQZ64KV6cN5aLDZ+ZQEAdoTr2zKo76E1yj02hJrSV/78AnyUnGWmN8nPj/r+s+ntN3
	rDb2AoXR5bCkPz4SRG5zYM1/FjnxQMFgh33FA3Jr40jNleewYDBq04amkiZpMUy6Q7Yplp/qKPR
	Rxj4btZroeLVF5ipFDL3mxu+n9rpENEhufmKpKKtG3lyh+u3wuSICo5GDrMdR5/pFyrzwr5xDiY
	43QrJOdiecYKzEjsxVJJ9djjvrSpoHfJEjAspgo+jpeCikG8BciW9GPNbAhYiih/h7uAbnT8a/j
	glf03pne9+bPFyPn9QhzAe9+xsAFJgfo=
X-Received: by 2002:a17:90b:54c3:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39aee26286emr5767770a91.22.1788340943838;
        Wed, 02 Sep 2026 02:22:23 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39aee26286emr5767708a91.22.1788340943425;
        Wed, 02 Sep 2026 02:22:23 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f7d77sm4998797eec.12.2026.09.02.02.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:22:23 -0700 (PDT)
Message-ID: <38984608-4b5c-4355-ad85-8c5a1fb78cb2@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:52:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: tpm: Introduce tpm-qcom driver
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
 <20260831-tpm_qcom_driver-v1-2-6f16fa6924fa@oss.qualcomm.com>
 <apbXKZrjFdK1vrny@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <apbXKZrjFdK1vrny@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WHZ9RZfV_ihcdy6hx-lWdGJLHQk82Hcg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA4MSBTYWx0ZWRfXzrdTVTcy4CcF
 aG1WkHkXVfbXhS8/uHc6awywUqOA2ZnTxFy8vD/DBZ8C9aLw5mFl2+2hmgOWi8PtqL7WSwzhEI3
 rdFT2nVuCkwuysojGEGdzYkJEsUyamU=
X-Proofpoint-ORIG-GUID: WHZ9RZfV_ihcdy6hx-lWdGJLHQk82Hcg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA4MSBTYWx0ZWRfX/NsK09BdSAfp
 yO/Btb7Xsq6Tf6BKnCxfwjO7Zoo3Pxxe9mt+aKhtkRloT/alB75z/jOnwDnixDJAxbsI82/X88v
 RCEzKHNY4VQNL7FKW1gqA+Abv7y1VZIu9j5clI58g3v0E18R0+o7M+RcWjj38yM3Pm3pkUuTU3v
 h9f1LnhA/Ef0rXwZoHLUGxGVFsT4yJKi8fC372azU48laiPvB1QqfjiFT3ZEHCPpLy4BuGzyh8x
 WzgL0Q959Gqf92vk6iYwRZVDlGxNpobP92aENlVTykl0VVqvd8P8xKoU960ayPLEz02+RRZtmMa
 ZbCcbUapx90S/irrcCkPQeGaoOR0zrfXNcCvLzZogiMlqcuOEWJLlYcUgeXB5EmN5giWMgGH6kY
 hISWrfTqHzSpAEA4gQ+pR0Nb/VAHJAa48+FJaKIicmcaUTMcJdG7evMBfHEnuiZCOt3rvVQ744m
 RJ04bbZhr+qCDQdcn6w==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a97ead0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OCHYf-eeibxfj-F0XOcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020081

On 01-09-2026 19:16, Jarkko Sakkinen wrote:
> Short summary has a different driver name that is implemented i.e.,
> it should has "tpm_qcom", not "tpm-qcom".

True, let me make more generic like "Introduce Qualcomm TPM driver"
instead of having driver filename in commit title for any confusion.

>>  MAINTAINERS                 |   7 +
>>  drivers/char/tpm/Kconfig    |   9 ++
>>  drivers/char/tpm/Makefile   |   1 +
>>  drivers/char/tpm/tpm_qcom.c | 371 ++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/char/tpm/tpm_qcom.h |  82 ++++++++++
> 
> Rename it as tpm_qcom_tee just to be aligned on how Microsoft's fTPM
> driver is named.

I'd say firstly microsoft ftpm driver should be renamed.
For example, MS ftpm is based on optee(session based context) whereas
Qcom tpm driver is based on qcomtee(part of same TEE subsystem but uses
completely different mink-ipc based sharing mechanism).
So, it's completely different driver compared to MS.

My suggestions:
 - Rename MS driver i.e tpm_ftpm_tee.c -> tpm_microsoft.c
 - Rename Qcom driver i.e tpm_qcom.c -> tpm_qcom.c

I see pattern like tpm_{loongson/atmel/ibm} etc. so better to follow
this convention?

If ever need optee/qtee to specify, more namings can be tpm_ftpm_optee.c
and tpm_qcom_qtee.c?
Personally, I don't prefer tpm_ftpm_tee.c as it's all generic name with
no optee specification.
 >
>>  5 files changed, 470 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 47b04968e79a..cfa5b66823c7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22636,6 +22636,13 @@ S:	Maintained
>>  F:	Documentation/tee/qtee.rst
>>  F:	drivers/tee/qcomtee/
>>  
>> +QUALCOMM TPM DRIVER
>> +M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/char/tpm/tpm_qcom.c
>> +F:	drivers/char/tpm/tpm_qcom.h
>> +
>>  QUALCOMM TRUST ZONE MEMORY ALLOCATOR
>>  M:	Bartosz Golaszewski <brgl@kernel.org>
>>  L:	linux-arm-msm@vger.kernel.org
> 
> this change should be a separate patch.

Ok, let me make MAINTAINERS entry as separate patch.
Also, i noticed none of other driver are being even compiled as 'M' like
atmel, ibm etc.
Any obvious reason behind this?
Should i enable tpm_qcom as Module in this patch only.

>> +	print_hex_dump_debug("tpm_qcom req: ", DUMP_PREFIX_OFFSET,
>> +			     16, 1, req, req_len, true);
> 
> Please don't do this. It can put production systems at risk.

Ok. I want to dump some contents on failures which makes debug easier.
Instead of dumping entire req/rsp buffer, dump tag, reqlen, rsplen etc?
>> +static struct tee_client_driver tpm_qcom_driver = {
>> +	.id_table	= tpm_qcom_id_table,
>> +	.probe		= tpm_qcom_probe,
>> +	.remove		= tpm_qcom_remove,
>> +	.driver		= {
>> +		.name	= "tpm-qcom",

Whatever naming we'll decide, I'll update same here too.

>> +
>> +/* dTPM SPI transfer optimization:
> 
> Block comments AFAIK should be
> 
> /*
>  * <TEXT>
> 

Let me fix it.

-- 
Regards
Kuldeep

