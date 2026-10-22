Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658567;
	b=nZXjpI9rqWV5XscoBcrudQQke+4HirIKwVyuTpvIXbRul3tlXWoQTPM5roQwOp1rfrCz
	 sTLCA4IrdvPehGWjqkySKWtSoOhUB2fkwVnZrfTmclujmcO3A5Vks9tZcHRhbQx+2pUGq
	 e4Tp7pKKqxuS89poH4yUTvHTg5EeYn5EWUxDCip7R47Ktm6PsqfoZBm7GjYWbuFs02L0X
	 sRVhTH3fOsfkAghPD7lUIudK4a+xWsXSFxBb0vC0Fz/TBHGtXB5u1aR1SDvTpuHrT1fFn
	 aPtxfQvaUNF77+MpsCwDchLhXgx1LzUTASwALhVjG09LwCuBZ37cWNh/rRq7h1tQ0nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
	b=gjoKr3xL64i7E69aojAnxPXZo17uM7ndKkLP7/SFFuj1snpqF5Z1t2Bji8/0ZIjxf0zX
	 Hw11qOYrDfdOGAlK4X2RWX9OuWtxkKJjJh4aPM3A3XCSRkompU+RI3FN4BH148TMzDcle
	 IHs+L9cRbWmIKFU4Tsrjd8keGuGa/TmRQWKQYAP29jk0fXna4X8wE4su/gpJJgyHFyZPE
	 2U1Ojpdyy5gHZgjZW3WqvngBqkW0mWhxbQRya5boAaa50Sb719FiFeZUzXvPDbuWYSaIo
	 j1wNa/1SI2S6nFPA8VR99tsHE/PZ74Db4c/4170ArdO9BWKDsidwhvEetVpXSbXrCAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgagUyde;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2DkRrVj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC96C606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC96C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgagUyde;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2DkRrVj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7we4L3720893
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=; b=mgagUydebMG5Fzsr
	22bhGLvPM9MswVbY217xWPN6M/TTO7kNlOEh6Ti29k8WxCGeC7NUzmWJhl8qj6N7
	Lxv9lHLMPLjalrwwznZPzKkPjMhuv63agr2xXVMES6rrS6toDNRA74WqjTI1BJga
	DddMqposK0D3Kz1ESA3Y4GcbUllpezHoXpq+MFpSup7mWi62s3xpG6cRfPwhJyxt
	9Va5pQEn4xSlIQR41HU/f1+ms87Uz3gO6MD/iv1aQzwkCKnjy6yRtG8CzHsmh4lI
	8IkutG/UGk6JDTAHpROFRjVvI3IkUE4uJDVpU7Uq4sl9PFENqb541tkwqOJcnWxY
	8n7QyA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9f3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:42:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so2452892b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658565; x=1793263365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
        b=D2DkRrVj5p9YG/Az2q5npu3imVacFCXNfzmbFsxrrZlCLchenJpRu7A0AqpScw3VIa
         EJEbmlNU8wrtbPRUrQHXrzVkBclaX4EKGXU6gk+g7bj+Rt3n24hiImwtcYyBsUWiiqKO
         V98Us/Z9Cpg1V065C8w6h/5jRxbddblbjd15QDDb0PoiRQcmAH6lQzQZaHW2blJVv2XH
         M6mljeuNLDxRrIb7/HKbIzleXl8z1XAQt/D07FueoA/KNpHeJsgjevcRLDw5KKszyt9S
         X9P8G2IpZ77JzWMXvX+cDst9kD4ACdlhVOnUDUbj9Gy3+pPHgN7sVQDw/OItyDSz2q+X
         +W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658565; x=1793263365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ia6LN6WREwHmv3zdel5zGUo7HEDYQPcun0fgWMYDdRs=;
        b=xW8soLTGGa/Uer/ljSlLuYVgws02HK8HB6lQl6g7vdPFbaJlOfvEsSZp6wMCzKPLUn
         CZeC+rY7oj+Eetmku3WSlTrSF2Cj3Uh5bPcyODGngyF45MXiJVTvtFaxdW7ZuuDimstb
         98Os7nkjEZ3pl8dVZBWs/hV88u+PZXXS5Gc2DYC/i9Bow87iSN91RY8UmtseLcSzAUYD
         MIlwbl1DoDhODpVa+tSw5KBmk31jfTePDaUBTqfEJAlndTd68IqynU2oZLygrNjZw47U
         BDOpXrQykF8rfQLFztN2x61gB2VEDCb/oVY3Ga8vbl/8xk1RSIbnQMN4wNcD+ag8juQJ
         815Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbf9D2JOOvDr8dkaK6oy11MKegyzc7kbtaMyz1eK1IWtqdoXHBEACGf1oGAvFSF7oQdyXfXqmV/FGEsyLX@vger.kernel.org
X-Gm-Message-State: AFq9FYIa+EOpTZBZu5OALkIvgcfu5Na6wgMXtBdOAUpupInP+vBX5ivn
	PHjm3wZCfVQmphkz1i8nyf/YulJHrOlZW+37+jnvOB+HwNyrfDP9hcXNWzb1T0f1lbahn53GAiB
	kvxnIPSW2FPHmIoyJRaTkCWdePh7aDW2wN5jwd7u1vYm6oOpTbvPag3YXdBcm3xcAAtvO
X-Gm-Gg: AYBFou0zN9X7w6Ti6xxAhUnoq8kGaxD2MkLhlAZeWFM4YM0cjsnKZ6HC5RBte3U8MF1
	WiuPRdEwUNcN8s/xbLDPM30qyCfSXtLzHaESt82ikIzCkQ6+NpKU99VNAJNFdTzYNOa7doosoF1
	cTrqX1hsFkxh9WKUwD/bXEFXJR54i/LXaSn+wNbJZg4FLDJfxOy2OhNvkkPWSDzXjg296XrEsMm
	l3bq5F1bZ+VQZqJucKtQuiu1aJ67NlK9YdJtlOqJEZlgKzNOBsjLaKKG9ZKkDWLRGK58snd+gS4
	Hei98THqLudETE+cl+Xw4jbHJAsH9U2YlAMa+uUIO8uN7l+MXCCHNrD4irCFyeIuIs4DXW2EjgO
	UGH5LA44N1Kl69MtLT/b2ujCHTcpe
X-Received: by 2002:a05:6a00:ac8a:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a089dfa561mr3281526b3a.34.1792658564550;
        Thu, 22 Oct 2026 01:42:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a089dfa561mr3281500b3a.34.1792658564102;
        Thu, 22 Oct 2026 01:42:44 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a274135f0bsm297617b3a.4.2026.10.22.01.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:42:43 -0700 (PDT)
Message-ID: <cc00f347-4008-4746-91ae-c2b583914cac@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:12:37 +0530
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
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura
 <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta
 <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXHa8ZhwEaVUlGa@gurudas.dev>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <atXHa8ZhwEaVUlGa@gurudas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfXxbH/RUwSpI5R
 u4MMCea9vfiyJNzdVcebzjtH7cgvgyJ5xR/nPcNwQSZu01rcd3hRLQ8MeMP77NiE5bjeyYyV+zj
 dXtshc5gyjADtqnDnJxlF1BerShbhfA=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9cc85 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: doTSxTUwa90SktnkTvH3OQZM4BoLeeHq
X-Proofpoint-ORIG-GUID: doTSxTUwa90SktnkTvH3OQZM4BoLeeHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX5UdbBXSYBL1U
 X5iV99w7HNCzgw2luaShBsL9oEOeicEwDtOip4DoEcRW9SjH7u+kLK1PNDDIYPjQGR9sWlzW69R
 MRZCaVaSUJTGBcmRlj4Ovp8AGPDwS6JwhUUMHIZEx7JGYDlkgAOT3oLIbSIX+zuDic2wQAF6v7f
 6F5j3q7vt9vuxKU4/F6DG/uZEVF/0etwne3Nw2KW8TFtQeAHQoJt79JcV01wPHsdBphxCBvYhpX
 yZfLHTlOiSxXCIX3VOiVgaV34qoE5PZO6HShOkdSdcCEtLVJhofto64yO8A/DEX3C/6ImBQ4yLA
 E86laDKp1fse2V/nVLLooHhTTa1Owx5KqEKyr8p05ZSe3VEPdgN2gs2bKbP63v5mnRkoa4wiDwT
 I7rz2YRxPfsC57KEV22a0PgChUpzigtwMfDyYh/jueu9vop98GoHyunX/kAjSaj8s2ixoR3iGeb
 76qYBDSNBJhSCOSa10Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034

Hi Guru,

On 10/19/2026 1:01 PM, Guru Das Srinagesh wrote:
> On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---

....

>>  
>>  	id = platform_get_device_id(pdev);
>> @@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
>>  	if (!regmap)
>>  		return -EINVAL;
>>  
>> +	is_pm8010 = of_device_is_compatible(dev->parent->of_node,
>> +					    "qcom,pm8010-i2c");
> 
> Patch 2 adds a new `driver_data` match data struct for PM8010. Could this is_pm8010
> variable be avoided by stashing the regulator ops in the match data for each
> variant and using that instead?

Yes, I can make this change in the next patch version.

Thanks,
Jishnu

> 
>> +
>>  	for (i = 0; i < match_data->num_regulators; i++) {
>>  		data = &match_data->regulator_data[i];
>>  
