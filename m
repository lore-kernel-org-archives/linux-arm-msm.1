Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386284;
	b=LugRgveL9m+IslTYZ7Jr7KDjwFvuD4YNRFsbBQ2PV3FEgbyKaX889qVO6jEcN+Dh7BhP
	 Fk/3Y3Ym8t+cjX6HcnbL9csuYBdwXaJzSX1bxSHRDmUyttWh2ldYYPphRUWhe4+uZRzOY
	 X6nMc6Ll6aoIf3rl2nWosgM3TnhZx4LBt/wf8ixNtFG1vw36yCdDgAPRbbwYDCQ4jnCKp
	 q18t/T62DiPuJAfAOnnaq1b/4F8vZjeltZsT12LEjzK5b+e9hz2jVjbcGqYJATbq7GCcD
	 QW5pYga+UVLOXL4oS+Le9Up1OJyFAsQB5O3+u/3ayEh6mekflTur41EuFceHrVzYlHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
	b=lCjVEoDzYcy9M/O4Sp69DoZsQ60l2IuIzfg6GVQMUiam4EYrtQI44YWWKUSkCBc3QpLZ
	 y9q0vtVRFFsCsJlxRaLxw9fAxLbHm+nG+tS9hnrFiBU2UhqOCJBBS5LaI9nnUZ22lg6XL
	 Uy5wjZwrJ8U3pt13Xm1nkH16nciBhvRO86IWt8srfcRZKqCcCZEpoyPN+IUJqHYI+0JtP
	 UQLPJZo3C5wZivbqxBMpMgy9nL9EU083qrLKlIibINBhsKUdi2YysTs+0Q/mV3ciPSIlu
	 ps6S2rHQKAUgVyn47ZKFTkM9yb3XL8yw0+ie2UF2FO6yJ8wHL8SMfhnU/b99G5NPEYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="moXvA8H/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hreAjHaY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D96606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moXvA8H/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hreAjHaY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KRuT3959068
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=; b=moXvA8H/k0DpUIk4
	lY9w/LdPlAq7sEgrI3Bg+iQMIbcqWwsIi7En6h0dWGcJ2wgIUmRWR9DqciOLeb9f
	3E4rtwvhCyBMp4XGLLSAtNQQgZj9MBsMVgXZURvzkD9A4dAfy47xPfP05yMHXc6n
	pNBuZngbFXr9ZgcXlLw6Fr6CPZZKS/2SFXNh+zo6L5foTdkrnTHPN6/DDLFB0yaX
	JGzH7c/jq6gDnFcZUzEg3FESgXR0wJlIt7o/5u19B+TNP4qpuxYtchW/DBiRfuqq
	Hk93+AafEtpisLIAsq9N2Mv1TzsxfCv0NK53xgo4ZCm7m4WfLQh7QJjRslA+kTZe
	UASsEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b32ppe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:38:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5870376eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386283; x=1794991083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
        b=hreAjHaY4pmPcE5AD6mScQ9iVhTUFHo7SXGwZTLyU1HJ6dZiyppUHo1vxnVheoiTFe
         qCILmTYu1sZYYbEQFPOm58Jt6y46BJ4N+hGrMEbEl2lFzizn8rhzIThi563lUzUqVWMH
         KkXrqBqMC+OcIlTWee/XeP560zYDs9qRjY5qhdbsStZcu/MXBoPL1+INqNbPB1ABJ3mk
         jlShdpbZZzqEN2f0+LrtUf8uhDWg8HbTpBPjldmGeJMic64npgSm2zLXpkIHBquXalmi
         XKxcexmnnQeX1/OWP05ZkOguWj2cBbEe6wr9/s/dSgEdB1+GahOJkM0/Vu3KN2+zYbSW
         sB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386283; x=1794991083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
        b=wLvDDLfGpNQ+YNecIQf1MK/RkEICEppxdLwpjIkzrqx+cxJHB/fjORRtnvy/lWQ6KL
         U3kyXHH9caJdcFF93+/lSpHn/dE6UhWgbKS/lGVCj5ve3wyi4ac6Sd0Phlv8cdVC4zPn
         sKvoJEtmljFGUCKJpPwl71HhsgZRxgnR0/ETEChkRx2KJV3ySwp2IJyuDDR08qmQSZTs
         VWitP6jS0rgHRVCsugZ9gT9U5BC9JTzliF1tmVqS7Y4TVshjv30sbFcCnMTj/2F8tB6n
         c2gczQXKH+Mma2/p/u0rP3qbaIoAL/mxWLEJUrfjJ/CYLZ2h/BlZiPhR0WSrrHl/U65M
         75Sw==
X-Forwarded-Encrypted: i=1; AL+hErEjVBfg/GqIZEyyj1HYvl7lomLZ4bHwiMn7BISkpQz/LTabggiPJvvueJ5NA/ASC6hrZiMvd8ZBpHcMzXXq@vger.kernel.org
X-Gm-Message-State: APuU4Z+TSbYG6IBZ+6RAEkPPAMYSXbqtVwi2qKPc5dmZu8x9FuBRc9QA
	cy+sUvC7a6g6UzMLHhCBikO+OiX35apbV1qfgQsiQUruC1aTJl/Ffta47O2pkG56yzxmBFfM+UI
	a//mNKviWSXtaEKUZCEiBeIchPKTwLU8Rrh6Ni/nrLaHe4TwW8hLS1r8WnicTAQNuM9Br
X-Gm-Gg: AYBFou2uzz1pEL2nClwhxHvZANvL1v49fcH9dn33pDh0qG/c5dGxr2iYTqkyk9cOyju
	4XkLb9ew0YxnmhIp7LxThqkC/QsjsBYSY7OBrgTDtaeg4U2qLi1wNUTQikcKQ9RVU46rC9d08av
	aDzmGgsTtu9B7FKJoBqRrRFVkR/+gmdY/sRqVg5o3KnT1KmKKhDbGtn8/Rvnf3bBQH8NWql8BPY
	s0o9uOOgOO3YfYPTDl3pzJIqTMOTtfohYGfFcM1duNLwe6/5DR9xq/+cQBwRwts045eZ+QTDFMB
	mkm/UvgWRm0R8hy3Lm6m0TQFTXuRVU/U4HBv+1MNqR0o8L2mQmAvZa6KgkbY+Plg/2NusCp0SsY
	DPiZgNhowFsQm84JnG1x+LHJiDIZXn40NB3tIwZRG9rQ5fnEbs6mm7bO+5p303ZixIi3Kif+Rsc
	UHzA==
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr2252067eec.25.1794386282848;
        Wed, 11 Nov 2026 00:38:02 -0800 (PST)
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr2252038eec.25.1794386282338;
        Wed, 11 Nov 2026 00:38:02 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14512824eec.7.2026.11.11.00.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:38:01 -0800 (PST)
Message-ID: <f915ffa9-e094-4ee8-84f6-ecac642fea1a@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:07:51 +0530
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
Subject: Re: [PATCH v4 16/25] accel/qda: Add DSP process creation and release
 to the legacy shim
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-16-88f2f24a5f0b@qti.qualcomm.com>
 <f030a190-0cd9-4f6d-9a71-ab08dd760a02@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f030a190-0cd9-4f6d-9a71-ab08dd760a02@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4296b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=_9VnGE74eSGUFLHFbeEA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX0GixGOF4DtDT
 KPT0Js5WWTQmKN7c+5iQUaB1CySsdPc2XJTzekNY0Ecb4YRJpXOV65JTQMLhKz8HPH/iJYkMjzZ
 5EREZTPxVmfIRiHZBz/1RIeq7klEecUtGXb5jrnMYkUBS40RRVArVG3QitS27makNmoAXDFcPjt
 qnMG8Cp2Zyn8PSaGVUxWxGlgbB5p5kLuJe1D9X7MzSIvnJUYdYw0Lc5AkkxBCiWup9LkWwVbmTZ
 R6qWPWqmN+2LGbMl1OcKJFTzj86j6EHX/V0j0FiCRMzLsWzFzuew0hplFS1IVIDdpCqeWXj0NMo
 Cte3lQNwvxS4m44vnkjmsXLHnmC9tCC3nJKx/2JWZVwOvMbuBUtAmur0r+9B7Nb4v0/Yp8/XvMA
 jiNszPwnJSrZb/i7E0diY8OGDBYg8bivdhmQ6Y8pXpug0uREEABFPCx/NiFkX4z5uZOhQHHUMlV
 M6X4p0QXlLMMwgq8y9Q==
X-Proofpoint-GUID: 4w9rNBBPcGVejQg1uPBFhfGTGlyReFA7
X-Proofpoint-ORIG-GUID: 4w9rNBBPcGVejQg1uPBFhfGTGlyReFA7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX6X5EJ4qZkcvL
 G9o4jmOLFn/1+Wa+wlUVz4XC5hzHAv+To4JOqyLLd96UBr5pHo66A/SEkoUF7Ud4WRV2UzwYxmJ
 EPNeKMkg42F0cyYquRwdZWTTySa4/sI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:17, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>  	snode->sdev = sdev;
>> +	snode->secure = secure;
>>  	snode->miscdev.minor = MISC_DYNAMIC_MINOR;
>>  	snode->miscdev.name = snode->name;
>>  	snode->miscdev.fops = &qda_shim_fops;
>> @@ -293,8 +346,6 @@ static int qda_shim_probe(struct auxiliary_device *auxdev,
>>  			  const struct auxiliary_device_id *id)
>>  {
>>  	struct qda_dev *qdev = dev_get_platdata(&auxdev->dev);
>> -	bool secure_channel = !of_property_read_bool(qdev->dev->of_node,
>> -						     "qcom,non-secure-domain");
> 
> You just added these lines two patches earlier.
> 
> You are adding COMPLETELY new driver, so adding completely new code and
> then removing it is confusing. It means you added something which was
> not needed.
I'll restructure this properly.

> 
> 
> Best regards,
> Krzysztof

