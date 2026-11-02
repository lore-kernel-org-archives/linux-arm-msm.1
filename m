Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634967;
	b=ppbJGgWAyxFwAxoO2az1dnYUcw9z4+nobcsnYzsvGBcS0hr1iFpdzykuInPxmYXY9Hjd
	 NRG1uiGIaNPg4dc9pVHKIrJt026oyhPfPgVIl1dbySGkCN8Rk2K9ucLEtaKO9E8tQ1CPK
	 g5OGm3Kv+zKbmGoueeE1m50Krq2zEVXAge5ocIMuxHJr703SQGbQ4MAoKjhwqubs18dlJ
	 1+FhOkpsmRdgjCUIx+qNlJ04imYglkImo9uyCJbH+5bR/VYVEozvCXf1cOOqDEu1WwKkk
	 2GYTYwRz25NszowUbjSikQixQPwRyPqFb3acqoSTIPNaTUk+u1u5NxZ1VwNwhkuyrHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tYqCyrgOLHcS2PoZCZThkyVwoRz4NupYbKjbttodPvk=;
	b=No4KivI0szLBZMTMYaekjakqxhU0+PF77xqkmzxgyNNf3kT3Rr1TdEBHhpj+0uZz7s9N
	 D8mqZEsv/tu8RdCYn9oJ1I0V2InMhW9pkUFAw3YdX9S7cDrDouuS5nbJf4RXBptdA28wX
	 9qfE2UvXZCdxEizfGJTD4GRo3cYNSrgntmukMkJYKKe97wZoFrTqsNljUN9L4Sh2PW6lr
	 VWiqNmbk7q/IwlsL2Qzl8jzmimz8zdMnl68BrOyNcThMJ1Rr1bGcO2fg83RjNpzJwa7Qo
	 LyN2jGA1cZq4QiPZWTB5VOiDmngo2MMW2pg9EPtncdw8kkAVknN8OdkTf2mjaqBVUDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSBwzCge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL6DujIh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B86606EE89
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B86606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSBwzCge;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL6DujIh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpiLl3102949
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYqCyrgOLHcS2PoZCZThkyVwoRz4NupYbKjbttodPvk=; b=iSBwzCge8h1I9C/2
	mrtF1j3oXAafP4JBKC5JOzQQ+ebIiG0L+/LKUQs3DTTjht6AWWhk2AuTicTvJTnx
	BDdrj5Jig4ei+KTBtDyQVXFppbmW4hpiZ1DROxFsrZjesEOqY6vaj8V9AetMWXrR
	E8zTgPLuS4ZYy0aDvL/pjzrKh75cXhpJl4vgKXhrIlYbsDe3CNMdcFhM7Sf18bb6
	bwIN5o2/vr5+bNpWlXbzQYxrhh1lrh90zcfdYzBGxUH+zCtqj0aaM5rg1K5k8hlm
	BiqU02wWV/ya+dhLKvwIwj83JBg98Rg4dK04A9L1n1wTTN/rJ8SI22/FfrxDybSN
	Ovti6w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjpsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:56:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso86781e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634965; x=1794239765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYqCyrgOLHcS2PoZCZThkyVwoRz4NupYbKjbttodPvk=;
        b=iL6DujIh4EUQvimIA2xb2KNqfzPir7gWfElq0Vw3zDhXzU3aXzQcZ+//DaKpkLbK88
         U3K8KE87uv0B4W9CTo0M8UO9CaxgOXmqPjOKkBV27xNAYJvtqWOQIPgb6QrC9A5B3pgx
         arDPQmm209KkXdcLt5OQvQVLIMyHrxEyEWiE0Z8cTXfM3mOWr/5RrK/+BtjYx4wgua7q
         nVcGgSNFMn1Fw0X3lWWTSpl1Er5ZIGECFdSLM8/YVUwPb1Yl5L151HSglGyUAtHseMaL
         2pdBddM/VSbAEVG0a8hguNsalO22jajkck5KTlaMn18FYOpNe2EoThFoYCVXpvwthJUm
         /lSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634965; x=1794239765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYqCyrgOLHcS2PoZCZThkyVwoRz4NupYbKjbttodPvk=;
        b=ImkhlxgfcUDnzTIBOL+kEfkqBXU24GRrFu2lZOBDATtjN4KtIZ0RpdRk/QKJcxx+ym
         bI8AE9SSf0dc+7QtIjyZg9BWg0MqjrvKiiFcoY/gzeRZQwNUZE6pl6fnSu9zmXFF2mPH
         U9qLE9PZ608DsfjPkox1O7dTkOGXjvB1IpdnKxhgFG1rPqT9NXZQVLiq+48ChaQxXQoH
         XAPx6hWgUquXF+mEvKTgJpB80cKX59ve6J2/Q0wp2GARR/iDxyD20xCKyuXRf2FkFfc6
         saEQ3iwzXeu5nCv+uv8+H522PpGEWIokCp++zcg8D3oYPozfwj4LmFdtoceMH9Kmz9RN
         JcYw==
X-Forwarded-Encrypted: i=1; AKwUvBxSUqb5i1oXyUwDVCoUwv6P1fbV5Jp9mh00nVS1KaS6BY8mBLBGYIgHWltQg/UMgQZDpquDKUfRDd0LAJ/j@vger.kernel.org
X-Gm-Message-State: APuU4Z9tweOAfyAsiom5HSvwXzYfZepWCwHJjP1g6J86M8OR1VqckkOQ
	NJXqxMQ8MTrqXg8t/4iHx9oNbA2sR3oV2POczla+ct9num75UITzAKGVs9W6232tfXAwWqkub4Y
	47sNuE+FtSNff78hVk0uZ9TihGaBjPseJthSPL0EXD5tl060KjzTcKt0b5tsKovT+rGdX
X-Gm-Gg: AYBFou3w/zux3+N5vWpdP4e7yo+gJYbZXSrtJhH6w4Rn0h2IbD1forCXH0HQCyb6Ghe
	6iubg6EBFQoyRCWDxWOyZriRC48xrCiAHqNtEw46lUO/zmN0CMZ4RFrUhuOrwmkeHdjSs3/Ciuz
	m1e+wWnPxw045ztMUxzgOAJOpNfvPA6kOpq3l0mEvQnPqG5bkj9OW1drSdpoBkQ3nDFmGS6cFJ9
	BLeNmw2L4hI2G4jatXJYB9xhvZl20qCHkaE9lwr0lminQuetgSvoG/1nQGP+UtYuK7D1FPJt9HV
	uuDcUsIsc3U1Y508ENHxiS5D+/q5rzAilZoXDb2Tzn1faQdwa+2Iex8tHD/9GkiwZNaSwDOpQUf
	nZvjXJszxyBypFInSyN0jAkgnRt+9HJDCF38ZDb4kaNN+K234yrPXaQce7OfEJR63tsguLw==
X-Received: by 2002:a05:6122:520f:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec6828c42bmr5181671e0c.0.1793634965110;
        Mon, 02 Nov 2026 07:56:05 -0800 (PST)
X-Received: by 2002:a05:6122:520f:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec6828c42bmr5181659e0c.0.1793634964356;
        Mon, 02 Nov 2026 07:56:04 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefcdfasm3479566b.36.2026.11.02.07.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:56:03 -0800 (PST)
Message-ID: <d4c11aa2-637f-4936-91d5-81b9d00aff0f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:56:01 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179189473286.2132802.7434637844183959510.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TuW1CezqZFDXv07p3MdP0NTR91P9MuZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX5kbz9bsWATMH
 SmZ9J/6WQFwJutIItkkK3XGLsGO08fpSR/F0vuB+54qIW64jUpeSxLzcVz68SIJlxfhYFLNyiK+
 pL4O9YBHAT8iOiNG1+eMxywP7UWE/3BPn68FZqEHGuEh9SU1ea29n+5KYJ694GexUiIeLcrXJES
 FzojHQxnqXx9etTdi5Xns3XmSipyI+5Ob1n33e8ZyxR3FWtxllqVWMWRkIJ5jvPxUIR/+uR/TV2
 iWauHAmv+aezGJ55Lg9/bET5Tb55OdhkrMgPUxIq+SqyRGlMqbM3uKPQ4ssy/9Ikkjb82IHvcay
 FEbFUHZnmdHsOqVKI3fE2BFFgVvZ8Mf9Z/0TqwKZJcLxGhRUNOmj3zAV08acD1tLh2J7htzdccS
 aNfL9Wy+DmHHZ3weyZ6PGiOK0x1BdWDDMtBZSbH9IVByUYxL/+d85iBWhwWq9idO7HRmKCU2NMH
 QVtXlFgkGLLZk2q2ZGQ==
X-Proofpoint-GUID: TuW1CezqZFDXv07p3MdP0NTR91P9MuZx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX1C5KdFxghD/H
 4tFOPRsryY1eNR6JYhpI6A83UAsvEEI6LM88Q2lSecRZ6KyFhpk2UsDzoJ0Q8c1m+8Fz7RbXnHB
 4mp2//bbV+YVASAcBTCPQ3en2SysHsU=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8b296 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ydoro5LrJAMts5ZGCqMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

On 10/13/26 2:32 PM, Sivansh Gupta wrote:
> On 2026-09-30 11:55 +0200, Konrad Dybcio wrote:
>> On 9/28/26 7:29 AM, Sivansh Gupta wrote:
>>> Mailbox hardware registers are 64 bit wide, but the interrupt handler
>>> currently reads only 32 bits with readl() at offset 0x4 (upper 32
>>> bits). This returns an incorrect value, while reading using readq()
>>> returns the expected value.
>>>
>>> Use readq() to access the 64 bit register and pass the expected value
>>> to the mailbox client.
>>>
>>> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
>>> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
>>> ---
>>> v3:
>>> - Removed references to an out of tree driver to focus on the incorrect
>>>   value returned by readl()
>>>   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
>>>
>>> v2:
>>> - Expanded the commit message to explain why this change is required.
>>>
>>>  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
>>> index 862e45e8fbd5..0b584d9aad6c 100644
>>> --- a/drivers/mailbox/qcom-cpucp-mbox.c
>>> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
>>> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>>>  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>>>  
>>>  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
>>> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
>>
>> This still retains the writel() later on
> 
> This is intentional, currently the existing mbox client(s) assume 32 bits
> writes instead of 64 bits, changing to 64 bits here would require all
> mbox clients to be updated to send 64 bits.
> Currently there is only 1 upstream client (arm_scmi).
> 
>>> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
>>
>> This will alter the indices of the mailbox channels, but it's ""fine""
>> because it's always zero for the existing platforms..
>>
>> Konrad
> 
> I am unsure what you mean here. The channel registers are spaced 8 bytes
> apart. In the old code, we used to read each channel's upper 32 bits
> (channel base + 4 bytes), in the new code we will be reading the entire
> 8 bytes.
> If this is not what you meant, please let me know!

You're right, please remove the leftover define

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
