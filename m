Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022768;
	b=dSDiReyxZiOU7+5Oiyo5eCuEeCEIVZo3utMF2Xhbn4xWhWEYHBxFclIcttfVw9cZDo9x
	 ZKU/4xhpxDKVCTO0C8JF0TsFz4nAmz4SjMAUet6u99eVhC4Bv7PvLlNFj7jopSpgZTGb7
	 6GgGEhTpYPxVWC5+iXCss/OVVa4jekFS8P0KvfLngLOPKR356QmrlSKXDR705dmZYFkXf
	 ZFFyRkxkVQngHJ0f0UPvhqKjZF2Icfu6BP73ypx/XIkHNruyVpNZGqLk4RhSoLdsDiUpr
	 STTS8c52xlfM3EEzqRawS4QTP29FNgermbHZSlcI+V0GkEepsPOwycO+rvsRP8MDxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=94KNfu9LVt3LCR1cr0pC3xESZK/x7V7veAS5OZDnG1k=;
	b=jpufm9/8IoPfj6VBHdzznoSTqOxWPBfQXuw7SaUR5s9OmHEr0OWyTuhFVbW+krhJFGzt
	 zR9osbXPNVfdnUHRn+Wf2RRuIiqWcHeqAV5Iw4N9ry/Pz51Yp10P3zEXFnOda0a+Mnz+1
	 1AFXt/iW9S8S2HYOwKUACMXp4i+nZ9gDytFxO38N8jgIBPn7szJh6vQdJzKsHVqKU1L0p
	 u9lD7bP7HrrjtuCwNEOqSVTEZGINoyOAJO+ESjyhM86Uw0gCi9aKlN+NRTWF/Ep6rsUr5
	 /EpeqhohSTo8Av7oE5ksVbAmx+zPjd4KilaUsRc6H8sgKlwBLhoESkgILtVEueuDlTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i8KnDiiA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTjpnG1R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10193606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10193606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i8KnDiiA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTjpnG1R
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsqZh3033600
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94KNfu9LVt3LCR1cr0pC3xESZK/x7V7veAS5OZDnG1k=; b=i8KnDiiAt5lFGtGz
	Dtp1tdA4BDhzKkIDS2H19PVEWHveTBnj7SkX3QAaQEz4DaJhWm0OZq8sXZBm0Krt
	hN4egXN9G50VI6/eJF1pj8epvsJIRi4bqm2/dqwB+sX7A2jeoHIgQgFI8BRG98zZ
	Yg4rqkSOwzTot7y1bB1YqZJXsD8ChwMLdrNSs0TNBZA0Y8zls24oRM/m2n1HgWM+
	P1qZolrj++3wLaPNMoIHPHPK8daMZi7e7R9vp15qs/dNJO/j88uBDP3kqooA8yJW
	O2pIZS2Iz8/hvbqc3Qb/mFLgCH3tbVEjDxBaQHAfEf1mwLP289P1T9XPq5Rryjby
	DcdSjg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0q3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:52:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9909853d264so136930241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793022766; x=1793627566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94KNfu9LVt3LCR1cr0pC3xESZK/x7V7veAS5OZDnG1k=;
        b=UTjpnG1RoP3fHEIanwu6VaSUW7ALAxJrLDIyezh/PaRem+3M/QFo18eRuvL7pgyTw5
         8MXH/p4dghsx+s/8P9ICGosZdmSjUX6p1YxeZ/X0kgj47iWNgZgk8RsvU20pGwSIWbAl
         wiYQIuOmoXr9ooMwmx1VkTa40ebKMVlJKAWzsFilAT9F5BoVK8MUSgNCaBcQDiXkeZjy
         VsAO5pF2hs4NhSQ6defctdgBLghz4yYvVoiNruebDIYzmQpN/MRGAo4gbS1h/iGUSRoW
         ffhg56gEdj8s2ZNv8eJiV5skPz/MtRiye7JAdAyP1Y8jvuqyXnsoHQFL9Gp0UaAmbQb/
         yg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793022766; x=1793627566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94KNfu9LVt3LCR1cr0pC3xESZK/x7V7veAS5OZDnG1k=;
        b=d/ABYh3RhzIj+WgAcMkCiXRNtbpfwIMkfdsMR7jIOGaRTsDkO7m0u8ATxn7Y4+P/+Y
         B/e3UmzLLjQb3Jgn1CwbyhCy7dHBWTs0qQ+Q9TndWNbjhr3Y7yT2JmyrsVOBsyxwHae8
         4q4j/c0BIhWxi1yyFuVrF6JToBk+8DZiQf0RJ2Dfi6MCb5O4yeTEBPE2AKxtgkH4mgY8
         ustdL0Wi5W/pV20A0DKRmElFOfbQA5ueSvW50Iy+4lMgMt4MQfyC4HpSbV2FUBFrHTxd
         uzQ7VjpqR7mNbHhVu1YWPDDQI1Wh89K1T3xKgHjV7haYt+I6lcDa7b0+ahSKNeCuaCMt
         p8cQ==
X-Forwarded-Encrypted: i=1; AKwUvByheTBz4LgxvhNklm4dgui3e3MtbFRpy6GAdwO1Ephyh+8REngFe54zbCKZqd+X6ZnAXfWOibjxjDIlspu0@vger.kernel.org
X-Gm-Message-State: AFq9FYIo96l4XbcpvtZTUjYIG6f2VwXj9zGJmTiLCbfndbD4nt+N+rVk
	CTsB5VjcwkCaU/H2b5A8HnOhgEqFCyhSynOyomXR+XFQKhiu1YcoYIX+/C2fo9N7PJNwH7l2ZOY
	z5aIeSPCwhtXvoJW5iLuuVznqL4ewTChIq4okx+7fSJxVyqC729aycxWtIJXmzm9X26Hk
X-Gm-Gg: AYBFou27vWCdbr7GgcB9NOqyrsb1iQx9q0QL42iEpFf8pyfUPy/2wTcC7uwOPBkrGnS
	/GWjiv4zGr9wSUsnYfJn6tJSt6ycM0UTBZMJIUUgJ9HtM8NJQydbvhQz3mKPteGVO6PDD+SGpjb
	lgZFMijCZp9xpQYUv+MFGrldjhBYzL6zm9ea4d0cCcgL2Dh++mkwUGKShxqaEJFQMf9ELvnibAI
	BlSUDPnLopEeb8xG1hMEb5C7myuWFf4ZrSxfLMxaZmN9KEcoB8diQYw3UrMSViORYQao5bJZMNH
	4WzrXlc+7dosf2Vco9EBVnpr/C/8pwiPZ5jJe48O7M5e0Th9BUUc2wtDru1eauIhBsibiFwdkwc
	17g0H0hZYhxhtuzr98zjOKg==
X-Received: by 2002:a05:6102:8511:20b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7ce5c6b9010mr1574500137.0.1793022765915;
        Mon, 26 Oct 2026 06:52:45 -0700 (PDT)
X-Received: by 2002:a05:6102:8511:20b0:7c3:99a3:314e with SMTP id ada2fe7eead31-7ce5c6b9010mr1574481137.0.1793022765434;
        Mon, 26 Oct 2026 06:52:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45f7e6256sm2150535a12.31.2026.10.26.06.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:52:43 -0700 (PDT)
Message-ID: <e88b5617-2463-4639-af85-0d2d5e3df6ec@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:52:41 +0100
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
Subject: Re: Tips on tracing bwmon?
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: krzk@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org
References: <atd6TRv4HQApcPvY@gallifrey>
 <87e38bda-7ec2-4b7f-84c9-29a837696572@oss.qualcomm.com>
 <atn3FAF-3GHPgvad@gallifrey>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atn3FAF-3GHPgvad@gallifrey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NSBTYWx0ZWRfX/vkRP5HPpl6X
 twDYq8QJszi24BF5tun7fsPbjeykrB/2BYEF0YuP0R+fuvEb51BAwi8pFiZ0RT685FykT4yH+Ds
 aPQec7f77Nd0dE9qbb4o2ikcsK1cO30=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf5b2e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C2zwhFw-0oNfBbuX2ToA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=_Cyqi_Il7Mi3aeVNCMp4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NSBTYWx0ZWRfX1pRkaP4B94eV
 8BXg4bPrtp4BQIwUNC7cPUS5+zFc8wFP7ksw2bH2CMYjPx+LVOAT3Ui44Y14L5GJNYTjhysZdkP
 +okY47/8bSOHqnEYEJN6FbbvKCIRv12HLbEda13Di9smk0K1P1uRvmJjJDvi4+WQ1NSZD36D8n9
 /pAWw2/e5LVQmWGHNOV4xVKc0Cln0J3hwwt446xf0iJHUbKVqZIqMaYPahae3yY9t00mpcwm8BA
 aizucNYGptkmtsBuF+aTZ6LB6SefVElsHjNoKiv+8Fix6V1NwoBBuImpikBqgwtSBZE6KLL17NV
 VCV26scIJfBJV8rV/H2TMQGi3/S3GUQeahW35CexJK2HPChUN9Y4TOb04TVofCqvdjVpgYioVH1
 T9iXat89p5W0DBsmyikbwd00cBQDc/Gple7LVkyYp2rpczAQXeTcfCFiZehbh4+bErR5mrdqMuE
 AuSOwdvWDsNbjbtiOdA==
X-Proofpoint-GUID: qnRe9CUsaMeuLJ54QQA9K9MwMMiDZojD
X-Proofpoint-ORIG-GUID: qnRe9CUsaMeuLJ54QQA9K9MwMMiDZojD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260055

On 10/22/26 1:44 PM, Dr. David Alan Gilbert wrote:
> * Konrad Dybcio (konrad.dybcio@oss.qualcomm.com) wrote:
>> On 10/20/26 4:27 PM, Dr. David Alan Gilbert wrote:
>>> Hi all,
>>>   I was looking for some tips on if I can use bwmon to see what interconnect
>>> bandwidth is going through the dwc3 usb controllers on my x1 based Asus Zenbook A14.
>>>
>>>   I've got usb-ncm gadget wired between a pair of them and I'd
>>> like to see what stats are available;
>>> (See details of my gadget stuff setup in
>>>  https://lore.kernel.org/linux-arm-msm/atJn2jfI_cZy3UMo@gallifrey/T/#u )
>>> And that's struggling to get much over 4Gbit/s over the network interface.
>>>
>>> One reason I'm curious is because the dwc3-qcom glue sets an average
>>> and a peak icc limit, and I wanted to know what the difference was and
>>> what the type of timescales were for how long it allowed a peak.
>>>
>>> Are there any docs I should look at?
>>>
>>> I did:
>>>    trace-cmd stream -e icc_bwmon:qcom_bwmon_update > log
>>> on both machines and during the run I'm seeing events on exactly 3 of the
>>> monitors;
>>> 24091000.pmu, 240b5400.pmu, 240b6400.pmu
>>>
>>> (In the numbers below I've grepped for that monitor and sed'ed out
>>> upto the 'measu_kbps=' part so I can then sort on the meas_kbps)
>>>
>>> My reading of the interconnects_summary is these PMUs are
>>> somewhere under the llcc_mc@interconnect-1, and in some
>>> cases under both chm_apps@  and qns_llcc
>>
>> These BWMONs only monitor the CPU-DRAM paths
> 
> Thanks for the reply and explanation.
> 
> Are there other BWMONs that should show the USB path bandwidth,
> and if so how would I watch them?

Unfortunately there aren't.

Konrad
