Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466AA46C847
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590946; cv=none; b=HIDUwHNMO8O8Di7+NrzpQoS9IAilBXnFlxxwuGVNowXce70rUKn7Y0emMDGpMNqv5fX7krxyv9CyFScl3t/Fs1dR1d9u7qnlWClw4p7iQMRiGxF0JahBsbDr1RAcpaMyqqSBCxjggudseBKS+qxoiWNz+zlaf4Sst7nUE9Pd5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590946; c=relaxed/simple;
	bh=AQoWXsfJHmwnAyLj5EhV03cDbyvTWuaUKTcrQyW8y+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQ2CTxU6SawV3/ZW1fNYFW78sUCHDFI9MydfiGLpkH9hKcSQx1UJhcpmgeLu3E+u5J4Tu1lmjrb70yt8Z+W1io0/9JxNPwSnO4ZLiZRBgKTPnF/MqpWqnfs0L0+lVyoZtwNSNDz0YKHcfXJj4NmYkc6ZJH/K5265IYbLFYYWQuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByBN/BqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVgIjW0F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByBN/BqV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVgIjW0F"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFnC9h3235588
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 17:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=; b=ByBN/BqVIwxSsv7C
	5vePHD+qP1XPRv26tJh1xJpiFcWjFIupOTGGuEA8DnxthAUGC18zZH9r0NikPRN6
	rJfhaYVRAHTyg9RT4OEGiUnReE6SxP0IPOnn9/wq1xBZB/4nAxhFptNLOz+w4jhk
	h90r9/ZlrdfCYk3KFd0MroXEjuk3TXyh1N3Kljw34vKY0paYqhph/cdnGsdsjIzt
	tafxak0YMW4qBZRh7kQQ2b6Ea3KhmBj3NiBivPKXZdYnwkIfoKODPe5k/T2Lok2X
	YQgKuKOlCN9yM7tooAr1Oohc1oKaWPSWbtly6MNEYByj8rNTo4o2gf9FS2mQS8/u
	impz9Q==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqnam0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 17:02:23 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-455cf15f8b5so289112fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787590943; x=1788195743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=;
        b=gVgIjW0FO+RHgBnU15rhb9h0Jwixj0wHVLQngYV5Pve7PphoSzgzZVY6hWW0vftzoj
         oozpZovLPkKp8jB0ZeZCFKH0W1q6KpRps7EGvQ3DVpgafonaT6FR8bVeEzBNTflgwH8n
         dr6RjcJRcjpCsihlwfNAZMoDvwpOGIUAUJ8fOCCjNVRQ1gFM3zafgDch/I7j4ztSZTj/
         N2ZAE5yIW+OERSqHukzd1oUig4nW6Okf/qu8lYwMBBYXhszPiJryjZx22NFaWOKBjPnm
         yXtevnNDgsFjDuKn/7kRSdSRZhLejlC89fm2ZqzniK1KumvRen/a8nABDvE95bXbNAsq
         NbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787590943; x=1788195743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfXILiAwBDaxvqRoSf8xZ7r6Qs2Yw0ErBR+u4/IPE9Q=;
        b=WnvYrpcVjacX1DI3LJkEbHOudpFSzKI33OKlUAC9yjtCmT/flDE95xdeR/8Bf63sE7
         Wr52y91uI2OhZPz2cOM7Bg2YDVoP7JYHpABnpu4ow51XRs12Bdqhrg8+O+7+vahuTRob
         /hl9El+kmnsOcLyTJ4Ykql+PKX4TXfr+t7DW+//m4RYTDS6523neNt2eFfPTC/3DmA9y
         7J959LlZtYbVRK7RqtqekrC90/4IxMTAuJjJgH+s1Sz4BJQpsg6QNE1zmrApo8p4eP+n
         c53FfBiTy59bS1PC3OrGwZU2qIhAXxgswXnln71pFDQInjz1uDR1zgRQuyVqF8y2spU9
         4z2w==
X-Forwarded-Encrypted: i=1; AHgh+Ro7m81MFFrTm1AUjDa4G9i0qW6gl4Zb2E4pLyogYnXE3woSBGfSVbwon7Y0Ia+wufF+fzk0rruLz7lHAG8Y@vger.kernel.org
X-Gm-Message-State: AFuF++nAze1vgoDaKLv0vLjsPbBP/NcawRYq54p2jFIk+wRoTQ4neK2Z
	WWU5YsFgO2jjG7nb0j58mUR3YgulE+IcI2ng04en/JPm9nmSAPC/O8T1/zykDkH9+FTQAva7PkY
	RNVpouWK5+H/KDWjkSuUTWYPfaSXiYVPWjW7tcjEra9HF4XzIeTsraTBzGdcYvm6juXv7
X-Gm-Gg: AR+sD10F0QWv0lU36JY4Td3ZFPlp/fee41gsqGLeG9Bq5CUpTvGxRvDnyZUCwnkaB7F
	0exekv0NYaDgIfrD+jYfPbIB3l594glikkWyIhosV3KYvAdg7aZ1OaHJIzmA6PDPxrCnYJDrUkw
	CTpTbrRqiACojT74i7NCmGm5xhjx/W1iG3ZWFQRHPZNn/wXybzuyykUJn6iD+pi/V6A/kwWMD2a
	kYwZ3sWCJ/5guR5uKA+hpEC3yVwXpEOgGf0GU0iN41URHIoXbD532CzeiYB7UAiRaWfdOS7y8G3
	sJdaqkYwP27JWEAVfRLOvRBM+uI5fS//vljvk+DAZpvFH9VD4VWvwNEZei7/ShCXWMmK4t0fKo7
	jYP/NYrZr9c1IoNZihk2F4oScPtD36A==
X-Received: by 2002:a05:6a20:431e:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3cd8f294ee1mr683419637.9.1787590525671;
        Mon, 24 Aug 2026 09:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:431e:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3cd8f294ee1mr683336637.9.1787590525072;
        Mon, 24 Aug 2026 09:55:25 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.106.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199daeccbsm1253160a12.7.2026.08.24.09.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 09:55:24 -0700 (PDT)
Message-ID: <e47bea2c-ddf5-4568-9a2d-a30a31793352@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 22:25:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
 <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfXwefJFgFaB4ea
 0JaWSLngSoYOGs25cLC71R1XJhgax4n8uZ6w9fqYoqyDzijuikp1NOi6ce8BinIYvdsSZbG9Hir
 iuehlB0y4H2M0sT0rgRen46fd7ZP9zk=
X-Proofpoint-GUID: EiL4dH-sy60IwJS2Ppn-MlMdsWeqh1-w
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c791f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=3DKySdf3VQHjbkfL60kt6A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=rko7XVifj6BEHbDbj-IA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfXxPzmo3/YMm4E
 9D4mdFx4y0FZemprBOvipYpDqNieLxvjP8cgQMK270MbXbj6dhsTPB8CGfQsuaUkx2M4kbVwtPj
 /D3AE/NgX2zGyPr8TxY8jQF1Onc3V8kYi/MOt8k3Gr0it5zWOpLIFQ3mPU++a+bikLs9pjRUYRO
 2+j4n8KjviCC3N68X3uli3IaVDQT0PfSUAWLxT28q3MKL8C26Z+miJ6bTFG7Hsd8PahA87O+07W
 OL9iCO/+Q4mzPizLhpVNakpS+GIAcJrFJULVxBg8hi+0eNnNRNzIdBdUWGwwZBUvuhpTikxlAob
 TjhIgOC/D+ZS5g2XC0rBbeT8RuUXJY7EBkxnCxTfzdDJU0PG3DINXxwd8tB+bXtbjYxqH/zfPPH
 byk9bU+G7VWGcjuL4hLpW/NJndE37OSo4fx3JbsW3m9wz6uxkq2SZ2yCqT8Gj4GeNidTLnAmZnU
 MrdOfowj9etUaz+bDmQ==
X-Proofpoint-ORIG-GUID: EiL4dH-sy60IwJS2Ppn-MlMdsWeqh1-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240143

HI Konrad,

On 24-08-2026 20:26, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> Currently, on the SA8255P platform, protocol drivers attached via
>> geni_se_domain_attach() treat each OPP on the perf domain as directly
>> corresponding to a protocol value such as a baudrate or requested
>> frequency, and simply request that OPP via
> [...]
>
>> @@ -1175,6 +1181,29 @@ int geni_se_domain_attach(struct geni_se *se)
>>   	else if (ret < 0)
>>   		return ret;
>>   
>> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
>> +	if (num_opps <= 0)
>> +		return num_opps < 0 ? num_opps : -ENODEV;
> if (num_opps < 0)
> 	return num_opps;
> if (num_opps == 0)
> 	return -ENODEV;
Sure, will update in next patch.
>
>> +
>> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
>> +					sizeof(*se->clk_perf_tbl),
>> +					GFP_KERNEL);
>> +	if (!se->clk_perf_tbl)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0, level = 0; i < num_opps; i++, level++) {
> One iterator is sufficient here

Will review and update.


Thanks,

Praveen Talari

>
> Konrad
