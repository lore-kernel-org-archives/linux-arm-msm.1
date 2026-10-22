Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653757;
	b=Dacwvs+z9m82f7Au0GB4MSBy4BxkcF4wpJVU3bBKBNQWmeGWKJwFZ+rFEYsBVIr9lINk
	 JOUV0j+YD1CeQP+hvyHCdOSRYaBjjaL82inn2oo1TCs/171L3rsGmNXDuoWHNSmlJ3gQ7
	 YdI/a40ROVsLrbZE3R/f6pMOAutn854RRixjdjzldMfpisqrs7oiJRqmCcw87AXUNFJLP
	 GtakJa8nQyrHewnjsemL67ZTpRvG9EuVx/WJlVNfumUKzu9+RFk/aJLZEPpaD6agHh+BB
	 Y9eF7ht+Qss7zQFOWccghjlW1X0PBOV2XgpHsnmJJnEQQlXolYnrsSjWu7XWuJAHoVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
	b=NgDnoJLEp6POoDgQQDBXImNTQdKjSEQRh7XatC6CT92mbrnfdn9frZ70HkKZHYXjRh05
	 i5bTGsAFPRaJVkytxsOafPdQAfkT5NE0E+KmaZzSQzxzGbXU+RecsyLHULbGoGFloh2uJ
	 JEiDLhqCFUr2r+ktZDeQJvEO/OlITB4TGi/qrNKOcmVCS63c11wPOzYKsFVaJH30GzGte
	 4EXtey39Tr9nE21uU/fqdNCX7VK32ybrMn2HtzDRgQg5KOcd5DY5vTwjvNEof0cmvLZdx
	 NGPw4RiEy5GP+cU5ZiOqNkSeifn+G6EJB2PwI1DLNuDvzvkk9eJ8JGenDDVd3SusAug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ihgv/q3G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPubOZCR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FEE606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FEE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ihgv/q3G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPubOZCR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70EuD1562004
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=; b=Ihgv/q3G57uNVXCw
	80iLuQi0Sg1ExxGXzcaxYUxHWIj4JYmi/3xXoDzfYN0VxU7u1hxeKtNkVWvpwsOV
	ynM2+Q7N0zEjljMGsMg1L0Co3OmZp93hQayYb2snGv8sqHnoXT4ZmQ0ceGjuX8Kj
	J/zPd3fYkZaCk6CbCygkxzpnzE2HRDgmkDKHb8F31TKU56gWvFteFr/vyJuRPmOS
	2wJ7VAFbLzGJo2YjqdFfA8rywdG5wCJnRrWgC3IZhs8mpdGz0MhkHf9lVdsBLauO
	UJx+Gog8qKH53Fbut9RaZr4pN2Ufe/OCKcGjZYu6XjUBrcB/hmQrAW3aPoZnWzZ6
	qsIjbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ah7sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:22:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so28932085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792653750; x=1793258550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
        b=UPubOZCRJPF+Ck6OVbeQJrQkMXKWKRmOZhC8zyJrVxmvj9DEUd0AXpXeLj2AZshleJ
         9IrZG7xuQv1XrYltIt8/xiKcP2q7VTAmI4zPZ9ZvoKNNqr76igDZMLyzqTc4RnOtWJVJ
         72xgwZpjnbqHHNhEH0NLcN9GiQsFpeGEvRsxOkI7KVQM2vnXOsKvYxUK+BKUYqV1iBXx
         h1ATerG+iqRgVe4ItLbixZOm/ukzMk42zAFCa3SpQmlJhFkhCFmAcqrYVpspySw9ElKd
         3eJEjTPXW0KlOCCOoC786VKnqW/ULg3kOhMAeyuutMC39IYBmBo0QXEap8VnxvQvcat8
         JnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653750; x=1793258550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
        b=p365ihCjY0VmJAhA2jxfBVclBbFDM6sJ60DL5dd4lgb4Q7W0/QkQS/0COePcWSX4b9
         S4aqb0uTRZPWnWau3rWNYoBdFw1PAzjBYFMHZsgDwXWj5xJ4aROwOzXoZbHn3oR29W2i
         V52yAfargfvOiyUnyFajU73bTxKCGG01lZe1+rcDRVyMYY8HwNpJ9Qt4K/RGbYzQ05O1
         x2afUGF31HzFcmOk0xrdIfsGwbCJl5H0cp2zxQR6mQ8SVvJNe7oSzAbVWueNNWmiKeFi
         UmRt08y1jMSSxIVaszBeVic42rZuWCmTZBRJibhpW6ZKm+k8hm6XSluy1KXqyThOE1H2
         Ndxg==
X-Forwarded-Encrypted: i=1; AKwUvBwMvzEOaO3relx11/PU0fYANmao1dHYVS5H2/A/i8wzBtGsCRKp4743LTNPfc5K6FACGyYjJDIpUK7ZYov8@vger.kernel.org
X-Gm-Message-State: AFq9FYLsatQb2RGOpEmm3QJhz3JvQDcx6hIfAtEZ9NUL3qPcTkJpGKs3
	hgCevzP0KhlUHQw+mixtJJD7l1i3i4HdTD9pR363X+n0QC6xqons2q9AlzyinrBhHCqcZ9VGhIU
	inSKkHEyStTBruNqCjP6Q9f3HgZzax52Jebl6FdDSr8FABXcM9elXBylGdh2tZLltvhnl
X-Gm-Gg: AYBFou2Th3j0Z3S+lC8f7zmp1fxYqDg85HdKci/YMhkULbI6IBFs6mXtVKv5IZNWsO9
	agyACZYJsZYdL1Fkpr5lYQiTt6/XloE4v6keoniT+o+9cdKPBoV+W0eENaAcBrqyPTTdfqZ2eWb
	2MksqQi+CD0su6f6rcsL3ygZpl5jB/9aIYKO5dSyMVLp85h1kndDsabA5TRSABooJiPxo7puUCP
	JxyILVXkD/NvBcHlJz0YJHkwZ6Hthxa2/z3yXS0/9jbb9gGr6VqhfBDtUZEm+gE5DcgnSW0Wz9+
	DnSqcTHe2kZnT2sXk1B6TnZlWmOsnimvAxEcSfqiHNfzfkWELaz9QB24KRDzSHq2s2ebPSvwp7h
	b/+lpAeon6lX0wuAZxcXmyQ==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr923297385a.2.1792653749703;
        Thu, 22 Oct 2026 00:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr923292885a.2.1792653749300;
        Thu, 22 Oct 2026 00:22:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f29aesm77548366b.11.2026.10.22.00.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:22:26 -0700 (PDT)
Message-ID: <11d992ca-f666-4a4b-a511-ec12335e6960@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:22:23 +0200
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
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
 <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
 <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyOSBTYWx0ZWRfX6fNohsesy0RY
 XnY+O+mOMmXtQ1YiIjlZcvCbZk+kxU98zsYlMd9Jqu+2oojBAFOA71Sj2wu38RhRhHj0jN+QkNr
 1DRsr1kfkEqHSHk1lEd/V6FKFVuiDpvZhUvD4MpLHrnNFdxI6pGY13n8E0ERLd7/LlToNHfpHZC
 cw8IsLx4rJwFR85vW3SN+FL/Lu8E7XbotOFoSy/Vj9EO6Ac513dOiomnTapOIVHz7ehPkINvlKT
 0zc5LyhTve6ZArxIgo5Zq9/THvNks5TLBbfBt/isZ7xnRHW0hn02iXBONfYgOS+vUEtnQ61W/r0
 hcP1EpUgTgHiXUh/5AfDJUmlmjEbHDU9EOeMyIQMmouw9j2gD7vWpE3UlEMKKK/wI7T1DcSDrnj
 pJ/krOhVqid0h2QtIX0LjG6vBQwBJDgHfeBOVQWIkSdt8I/6/iJQDOLHGu7CXxi1czl+V9cslvr
 /9QM71ojsbdtV/KyDFQ==
X-Proofpoint-GUID: 1u3qXRAVEx5UmviGjkkt8gVHb8ZGWNtF
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9b9b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NNcpZA-_c-qG0gzoYGoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1u3qXRAVEx5UmviGjkkt8gVHb8ZGWNtF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyOSBTYWx0ZWRfX51pMqaoFIKDf
 RzTAwq9bv1KOR3E71j0EZE7ode+uewHtjxhq+dYrw9/QHvPJuHVwoiT7HoHVTaYSDepYCcx/Sd0
 +emmMBXkdydI5saad4eRDCQ2DCp2Kfg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220029

On 10/14/26 6:32 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 06:14:43PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> A failed OPP transition need not leave the clock at the last successful
>>>> OPP's frequency. If hardware changed before the error, the default
>>>> single-clock path can subsequently skip a necessary retry because its
>>>
>>> What is a necessary retry? Shouldn't it be: try, rollback if it fails?
>>
>> The failure scenario is:
>>
>> opp-table {
>> 	opp-400000000 {
>> 		// low
>> 	};
>>
>> 	opp-1000000000 {
>> 		// high
>> 	};
>> }';
>>
>> 1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
>> 2. A driver requests High.
>> - OPP raises the voltage to 0.95 V.
>> - clk_set_rate(..., 1 GHz) changes the clock, but returns an error
> 
> I thought that your previous patches actively target this. I.e. if there
> is an error, CCF should retract the changes for as much as it can
> (assuming that there is no extra error on the reverting of the clocks).

Right, that's at the CCF layer. OPP also has the same problem and
needs a similar solution. Perhaps once all consumers are migrated
to clk-dvfs this won't be a problem anymore, but that's Qualcomm
only.


>> - Assume clk_get_rate() can report the resulting 1 GHz rate.
>> 3. The transition returns an error, so current_opp still points to Low.
>> 4. The caller tries to recover by requesting Low again.
>>
>> Perhaps I should have included that in the commit message.
> 
> I think, if something changes the state, but returns an error, it's more
> or less... an error. Or a bug.

As we've chatted offline.. you can try to unroll.. but if you error
out while unrolling you have to unroll the unroll. And if you error
out during unrolling of the unrolling...

Konrad
