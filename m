Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777385;
	b=kdOu5iforWxUWTMrxGi0DkWGXmO/YrecxJP4y0SL3l+rtfaCkMxk5Zm8IHdvFQpKU38M
	 2jWA5BYu0BXlxeN2bNnq8Z87U7AZ8Kk+QG+iV4oqvgMX5rs2aaO6ipdYH/EJ+AsDijdQQ
	 byuBjjRd+lgdZMHZnr1/yP0hyJHR5JWwi4rUM2BJeX8PRgjeG2rZub9VzYByjsS1jbqio
	 R9E8QZimgmekDlgG+gciXAQlLGTAoCqJEB8tT5npEjwMDParQKjwsoQCO1jX56kIOZdVA
	 8yCbQJ7T371W5UWPGglkRnaGidbTUb2hLm6NuJCT2qrQvodTJ7ka/BGAsxQHp3UKFEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iRO4CLOqPr9uH1kpPT2qDteaQ0RfuYPf8MimE0o7IGg=;
	b=m+nqF1zIwWI3Uc+HcU1vjVldVs6eTsFWxH4RCQwg8om+WtJZkActnIHap3uNh1kOd8Wf
	 ovw6uzYyTP6vJYwmhaWmzxyzMbgD4VBGvu9hQ73+ffHTZ09qYrB2n7od3bsvpPg7hC1eE
	 YliJ/QK9LDbwX9S1bs3viXcddG0DZz/TMDrZmUur5+bcAaetqzUSHj8tUQvSKqJ1VpYCp
	 CxYn0WfG5Jso/nGWuWZ8gSrwMdgiK5kDHR18pmUnTdZNOA0LiaIad/hHTNox1eurD9m94
	 qtRlyONo4NA7W9L20HlrLTUseeytStTO4yj487evk3aMhFnSCiUPLT6/KAS0m2KoK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUyNB7La;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9Yhasrh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB356606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB356606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUyNB7La;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9Yhasrh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46jW6Z230919
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 07:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iRO4CLOqPr9uH1kpPT2qDteaQ0RfuYPf8MimE0o7IGg=; b=fUyNB7LaXHHn++Zq
	OXO05Aa+1jRNb/72u+kvt1YTzZTy/0A81MpmdCO6r4gP9C315M8TYoUpSEtTI/Gd
	mOd0jJDQD0RfpAlhdwayQBG4bTrnxoF4m6/3t0BiOrinj2+dA7kWvONTa8kL6ekH
	Ma6wIcfVdhOiBnaB5ArSUiGJ6GyhDwUXCjbB11G3fRdmdGz+zt8Q7jvZgJJIopUa
	6Lj8Be3GTIotUQT9GspOkj76cy2MseRr1rOsx93aLqqZUgUZz8boMKx0xwTfwiGY
	cSXg3c8AwZ6YXsGWCoNKiURC/C1tbCiEj4JcRxdUzvzLdGOzpP0pNXKDhMX1iPxf
	w72Smw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypkrxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 07:29:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5476f5bd009so1243691cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793777383; x=1794382183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRO4CLOqPr9uH1kpPT2qDteaQ0RfuYPf8MimE0o7IGg=;
        b=h9YhasrhFIZARQBS2sErF5o7T6LC8AHyMjKWqE1cfyU4qdQzuN55E87DvDzbC2ECGI
         u0u/6P3hrGoM+88Ss8wBssreB6RmhvCU/AgdYWjh6bZ7d1844Eo+PtX8o86MGTsTuMv6
         +OFX0lF81m906WOzRRZifgP9t0tdO8xn88E9J4rv+rpcmOQuPbv4A4nQtW8407j1gnqv
         VCWo98TgyHOVBufLfFDHGovm8JRcJVpJP6ps1HJmSFutHIZTXVDD+Zu9peWAD5UolfO8
         R650/BLEI8PsKFyT0xohpZsjHiVmIsP5XxRac3mcxa6Pnb3sGJGb/RlgvoDnCBlWU9rn
         p7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777383; x=1794382183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRO4CLOqPr9uH1kpPT2qDteaQ0RfuYPf8MimE0o7IGg=;
        b=sPTUEhpDsc9zuoHT3CS35eGogXhf0wQBgwKqwzjshtk+oENOUUnjU3s+PT44LxIxEq
         wIJYLrCX6hVzBQlnBFyIMAo+aUHCZQJpbEsm4JjRlGtIf/V2+dHBv1nd9PmVK3d4FlnJ
         Xu05b+lYBwWpRS38PDiWTAKsazo6JSdZ0w2qskbIuKqfRWKDRJlsnxkwPl1lrYJnIBHe
         dfzzTErH+rr3xfZLl+AT514x/hT0Pctio5Vl+VjXpVBnZfJlIucXXgG+48N3Z/JVi/JF
         DChrt2ylvqlDzXvXHc3/TtXVj0EqEorIUN/sEZt5l8snEKz4lWMDQneR+Ezcj3ZcOgFs
         OLlA==
X-Forwarded-Encrypted: i=1; AKwUvBy5XaC+hR6PsKxZje9ggK/G5SCPe9WFDxankMx2AqiyubaA5964URlWN/WhLlg12sI0picib2X7Qh2RkbAv@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ou6ZWxfF9nMzpW2GKvjNKR/TYiF44IqzAEkXqTq7lMHkiK8+4
	YpvdvUaqwSNxU3KCtNt2yLN6zu3GJdfd6tkWqunWcvyXLhX96U4oyS5fzadPJy61wl23cyLooFs
	gJzERSQQjQ05xhIdaY96170uuBe1DcSAyPg/iUo1ehOT7ANYxrcpysOVWQOj+azwDhNuW
X-Gm-Gg: AYBFou2gQRrsCi2MGYvc6yfUfHwBZADcwUyu2J8z5N2iVzaQ12AZUxTp0Dv01q2GFq5
	+jooJD59BEnk7g/fwpYdFc4TGlG8YuFY25qpPPuQVipsXo466YFhdpbj0w9lc3mb6drCbBvt59A
	QiLQ/YLgBeu1NUZsvNdUwZMpFMTD/JLtJKNOjwmMeXI891Pey05gfSCF6TZeveIGLCn+cHu78JQ
	btuxjC2jpS6iYHERZzaBVwds9gePorNeKhi+CyZ8Dgvu01BizEJ3mD0WQPUKs28Y0gmjO978W2o
	tJNYLfEa21CvqwNkRxg9TVs5ma3lgpCLa0UQTwIQr0q58G/j+PQtIexvyqZTOZ1K6lKLowYKA3d
	GIjxKPOb2T46b/Lso5CslZK9cGyiJRJfqNfwp8Yaab82n/Jx6LJ3QNOBbFs+r1A+vToxw
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr2474381385a.6.1793777382999;
        Tue, 03 Nov 2026 23:29:42 -0800 (PST)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr2474379085a.6.1793777382531;
        Tue, 03 Nov 2026 23:29:42 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48b3b7sm40379466b.66.2026.11.03.23.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:29:41 -0800 (PST)
Message-ID: <a56ef682-c28b-42f4-b23e-25bf7d7879c2@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 08:29:40 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
 <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
 <179189473286.2132802.7434637844183959510.b4-reply@b4>
 <d4c11aa2-637f-4936-91d5-81b9d00aff0f@oss.qualcomm.com>
 <179377342626.494575.14471451763190105361.b4-reply@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179377342626.494575.14471451763190105361.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOSBTYWx0ZWRfX6Nk6k/W8kINc
 TwERNCg3eOo5EjP/4PoGKsyc85RSZYiVAiAYdEQK72HuesHncjXqqp4y6jent07qI1PcnHWxZUQ
 bwd7j+HUriQF6dVMFC3JzAg3q8DyRIM=
X-Proofpoint-ORIG-GUID: zvU3RdVGqeoCvj3R7NXFmVDbd4uvs3sh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOSBTYWx0ZWRfX4goW7XWdSihA
 z+r6QgjmFD6TjIV6Dlun2aNraTbBAsmZAMb7ka7UJBW3JZEgxGMjky1/5AxwgfTOH2AgDH681fc
 3UZw7d4HzJsV4nwQcF3uMiUIlCp+TGkionDLWzbNsEpPUtNcdYoWzL56Vqoh9A/qFLGAR3qJtXA
 SG6QQ0kK8W+ig7oqejzwSbam1vHs7UXFmgSbrgH24fv4AHlqKhvgOdACm/cjdaa9YX7CSbtwq/p
 94LTLEEqFeCAEjFGQCUcMKNViF7SpiOXNtj10LVCpYhmPDCCnCHUNzyJtj1JVjs6LxN1KkbSH7K
 m9cbW3/id4nL43FK4VygZesZYePlu+WPC4sdJ5+zSl3eKFfS5S3h88wyi6Mm60LSnOeK8aq6FjN
 EK73N/H3eFMIIajNNbVeyDgX9SQitova6PrCbsVsKRaHhssdLQaf/3JM+TqekstSAyfMnXNMOou
 AS7nME3tB86zymwOhBg==
X-Proofpoint-GUID: zvU3RdVGqeoCvj3R7NXFmVDbd4uvs3sh
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeadee7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bXuMI6HEHXQEcPHf8MwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040029

On 11/4/26 7:23 AM, Sivansh Gupta wrote:
> On 2026-11-02 16:56 +0100, Konrad Dybcio wrote:
>> On 10/13/26 2:32 PM, Sivansh Gupta wrote:
>>> On 2026-09-30 11:55 +0200, Konrad Dybcio wrote:
>>>> On 9/28/26 7:29 AM, Sivansh Gupta wrote:
>>>>> Mailbox hardware registers are 64 bit wide, but the interrupt handler
>>>>> currently reads only 32 bits with readl() at offset 0x4 (upper 32
>>>>> bits). This returns an incorrect value, while reading using readq()
>>>>> returns the expected value.
>>>>>
>>>>> Use readq() to access the 64 bit register and pass the expected value
>>>>> to the mailbox client.
>>>>>
>>>>> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
>>>>> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
>>>>> ---
>>>>> v3:
>>>>> - Removed references to an out of tree driver to focus on the incorrect
>>>>>   value returned by readl()
>>>>>   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
>>>>>
>>>>> v2:
>>>>> - Expanded the commit message to explain why this change is required.
>>>>>
>>>>>  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
>>>>> index 862e45e8fbd5..0b584d9aad6c 100644
>>>>> --- a/drivers/mailbox/qcom-cpucp-mbox.c
>>>>> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
>>>>> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>>>>>  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>>>>>  
>>>>>  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
>>>>> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
>>>>
>>>> This still retains the writel() later on
>>>
>>> This is intentional, currently the existing mbox client(s) assume 32 bits
>>> writes instead of 64 bits, changing to 64 bits here would require all
>>> mbox clients to be updated to send 64 bits.
>>> Currently there is only 1 upstream client (arm_scmi).
>>>
>>>>> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
>>>>
>>>> This will alter the indices of the mailbox channels, but it's ""fine""
>>>> because it's always zero for the existing platforms..
>>>>
>>>> Konrad
>>>
>>> I am unsure what you mean here. The channel registers are spaced 8 bytes
>>> apart. In the old code, we used to read each channel's upper 32 bits
>>> (channel base + 4 bytes), in the new code we will be reading the entire
>>> 8 bytes.
>>> If this is not what you meant, please let me know!
>>
>> You're right, please remove the leftover define
> 
> Hey, APSS_CPUCP_MBOX_CMD_OFF is intentionally used in 
> qcom_cpucp_mbox_send_data  as it is still using writel instead of writeq, 
> as we discussed.
> 
> Also, I have since learned that this patch has already been picked up!
> 
> Cheers, Sivansh

Ok, all is well that ends well

Konrad
