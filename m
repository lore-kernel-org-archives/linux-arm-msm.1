Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216143;
	b=ELvRQCanY+oEi6sefZVPOQCCu++ZivBQ5dljGUFM69zZRKpKARw43nRI1A0VM3DA9F+e
	 xlSFJF3YTxT7BDbeybvs3d3yTeJQkPSUdot/ozbpUQXx0LzAlHTnWnuwvK/SwSQJEGEWE
	 /FBCWmyujZSoVCDa8OlejWLGBv8XNrAw5dFKDfgqb0EAR5I95lEtRL69tugYmA1bkBL9k
	 OBy/alB3ZR3TvB3TyiQ77JtV5b4BGa2CpU2h01I2MH9JggcasKtb3svGx/htMwlVybmYq
	 06XaBFQ2qnMH57VAMlF/fHAOBEOeUdawC1Hjsapl2dnfASrVq8zw9JIGtTM505gFTZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
	b=T+cwpLrf1vM9oaoQq2GunrsJswaSZYAs+Pj9GFv2GX/G0XM13bQuZ16AIt5acU/dYkFC
	 vgK0Xcy0uyk9VVZ9xLf9Jzb3hl85M/nXxf4A3cxsya/UqM7ADQHmgOvIyNyPEnJHs3na9
	 ZW6r+1Ync4EVeP+dXCUv1pAtnp9fq19dGo8ISX02OZKNHyLKzQEkQVK0040q9pcHxKJ+E
	 JQ2azI02xKgR5RUkZgooNq4+mgmr58ZUxhyoLfi14jgUkshTq+G8tJuip21zpRMksWOkg
	 GtXwxeyQfCX4SVDzu15rTEal4bNnjkwIngc7OH6HYXaLvSprSRJuwfqwL2qbiGwvbZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xhp4Uh8b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J650ASne;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA259606A33E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA259606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xhp4Uh8b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J650ASne
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1am3581094
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=; b=Xhp4Uh8bdhrJRRQV
	uDXW/AmMWvmeOivl596b5kERmWL0fr2ULx3zuE/qKyLBYO9HPvq3q9fGk+iRiOnt
	V4GYv7E06E+n6/fw/j8qticBygQ3Gnu3/0iNqlLveYLDzDNtpxWX/S0jfWhfqZu4
	uGVHmEU1ykDuhMfjANf+rZsjsd9pCmkRoh63ZQVMSOn9pW7wMc1eYVMmrOxL2E7I
	UkzLo+yRvjDCjOSY6pOolDYv8LtXQQxFJf09biu6of3QFvPolBfUkE+nznD5krLd
	ZiOdhoHp2xTBNX3CENrgAy9yi5DxnuE1h18BQnWjaQDKpBXhcgO2x5ofPJCEyCPD
	PdmMaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735k07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:22:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso16260985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216141; x=1794820941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
        b=J650ASneNQOMDbXZ0hPyzJzbBG53wuirbvlRYkLsqdehcE2jZ/H46CEvBesdJQ9PFo
         ghuRpZZDxQaTjm/rYzRbnpVn09yJ7bUqfY0/WdDFkymCjzrrAnj1GKUQ7dvKfHhzJnpV
         8Alm8rIrPaZMIWDrlNCuBaGxXyn5leIp7VVpFWg4qoybDiTw+wywhz5PN8Btdd4yKXmT
         W0RUbOIX/2yL0PuxkafjYwCdLdqLyq2CUCiXH1NTr7URcqP5+WdN0FPUQaklEPsLUZTm
         0YfYSAL2PpoFji5GB83velOl20VKue98C6IAU3TNo97/xfXRqisNe4pmxERa9AdVHwoE
         8KJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216141; x=1794820941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4L+5bPXUhgaVbpYyQ6OhFwBVz50lkDszwNSO+8Wheng=;
        b=f9iNXaMffO6MiYOwOJKMCPfY/rgp5IZfX1aqRhF8ZggO3JA8UE9MZRhlgMjEytEFgP
         9S/yW/IdFAsCpdpWCU6hTXY9vlbaOTguw4lQpfxZkqQQ7pN5w2OIge56RfcYPeSH+ySy
         pLmVTETlTOW3gwjZQ7cN7CimEwvGgBDjEvSNoEwnvI63WzjaLide77d76sKOn5Dg6SYo
         mBSdN+QWYOLzR4hbR0kvPIB5hRZK6nTL3+y/UaeyaoGzl/REgbd/BrJ9/vAKc8VNhqzL
         myNxtmdQf250nlRXU9ORAihn0FV07ixT2lWhKkQUuchwz/w6ltoKtOCFbH0A/TAR6+p8
         RP7g==
X-Gm-Message-State: APuU4Z/CU0hjXaO49m7YKjK09nE9fTM0M/13hA4i8lWn5eTv1e45M+Dn
	y8t36k/X7IHlWzE1zpS5Ix5YCB2inUi19Tg5jmirZ0mznoqvKvV2PKbQNyLIZfANhB7OLanJnkF
	og6CXCIWt1gxUo3/BxPIOcmqxSX1tWcVgvE3utuELEe7bDJ4XcZsEF/QM9n1AXyjHT0EZTh3UhF
	1L
X-Gm-Gg: AYBFou1GYEquQmjD92+NeutWotJMHwf7F9RzjXqlrHOIOYE5SOLSI/E9w2R4CJVfx5R
	fWZ2osi2pd2bl8N2oEL/XtCmW/MNxtJz/N4q5ElnKEvxpTtpaC5sExsWbgQhxcS/GhUvvqehZSg
	6cxzeOdcmX9CsCJ1tJjw77Bf3xXiST85YJVZrERjAJxPL4dv9OKAZOOnpCmosccY4z+uyjgXQ/3
	DGYk7F1dwhmJy2GHDw8QrePIypRQYYggFZOIx7RIk3pWLIEi34ltj3iSI0e4I5SOf4xERiFHYgf
	Ze2wsUwpzAAR1cre8RFeHmVXkiMJVFOiuya67tx7n+8qexMLFLXF4ufXpcSIV4xl7SZ/fd0T+Ga
	IkinPU3sg9s6NfNJN8NEJRn5kzeeJX4qlPeszv7f/Abn4zNekf6yLE1RcqugRQzFwLTnxQg==
X-Received: by 2002:a05:620a:a913:b0:93f:a34:d9fa with SMTP id af79cd13be357-947840f2208mr612806485a.1.1794216141028;
        Mon, 09 Nov 2026 01:22:21 -0800 (PST)
X-Received: by 2002:a05:620a:a913:b0:93f:a34:d9fa with SMTP id af79cd13be357-947840f2208mr612803685a.1.1794216140461;
        Mon, 09 Nov 2026 01:22:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474be5sm136556866b.37.2026.11.09.01.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:22:19 -0800 (PST)
Message-ID: <f32b7d48-62dd-48ad-81bc-9b0aff61b863@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:22:18 +0100
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
Subject: Re: [PATCH 1/2] mfd: qcom-pm8xxx: convert to subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
 <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-mfd-subsys-v1-1-1c3e755d37a6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXzz8ezNKHeThJ
 4dy59qj/Ox/aGTf3pIMqX7VVex3GhaM6UqNl4Mp50aAJjObN4bIvVMg0UF0pEYdfix+BRkPIHML
 yPHgYIR+bhbYPGQPIrEQu3Pd6+faB96LfpYARHtJMvXZGXxg/OJvbniEWWLG9NP3F8a1MYs+eSc
 yM/Bc9BYQml4apJU3zCARLNGFJAv+lD5tTanskHcv9mElYJJ6df+wujozRUUGF4eEMZ4tkz4SGT
 90Amh2rH0ILPqyutKLsBURSlXA60KjxPULYinuo9y64YGSf8MUV3Qnbb/AaDdsPfHoa0wIwmoxk
 7GGc29HRqHtJtWc63wi9if4lK9lqQgt37W42bNQ9isNkiopgZLH6eVB6IOFEfNRR78rv6exsY+D
 mmNxFoPhYIj8A/YiRsHXIYAld6otymDCThl7VuYLeJSWJOrpjEGKWBXf8mrG+KZBxkFZmF+H0OR
 NeWwgqfucrEnWH0sSBA==
X-Proofpoint-ORIG-GUID: m3Rs8rdEnRUnvNcq9JJL-FaESSsS0epJ
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af190ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=2mfksfQnj69i5T-jYpIA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX89U+zXHUfUCv
 1qzmXmzaJa8IQHubffjtuxkro2IrCTFMl8W9/ZwKrwjkCMSzvK6sa+KWyUW+4abNbevaXSWtRb1
 r+Vx/CVnLK66Vdna7GY79246wbZ1x1o=
X-Proofpoint-GUID: m3Rs8rdEnRUnvNcq9JJL-FaESSsS0epJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 11/7/26 1:20 AM, Brian Masney wrote:
> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
