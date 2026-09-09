Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2DB3D525B
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945833; cv=none; b=EyU8rrVB0eVujvnCqIBYn9TuqC7auyNijrUbv4qIFD626WAlLAyTAisJO/wG03fx7lAAJW/FL96OY1c4HXCHd1PDG/wdjicznKs5os7vr+WaxP7Q3FqJoDCTFSDcnownrFZZIkdBVMdBFCAwPeaIYxF/7cHjqgVmFeaTbugofaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945833; c=relaxed/simple;
	bh=MefwGGus+1Q/IuGojqThe9twVN1fqV7QINFZMvuhCDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrpAyIGbE5PGmDaqmUUb/LYXRCQugVWVL8Yq/xLZD7uldlQx8EW2typiG6hnaJrvHPLhNpkX6Vl2XkIHhN5at11fYoKJzUAYz1XMux6slKQouu/u2M4HFUFaAzqZCUOTQpnAzb2b6gQltX7XRRPdUY8OCV/QgH+jiQK4TrW+1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIHsBrc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDE6ft/v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIHsBrc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDE6ft/v"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896c3Bs045635
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 09:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=; b=SIHsBrc2LY11MYJc
	HPBKaHwKbKAo0/VmYro9lMRr+FAcUXpfbqdCs0I8WbVsbJ9ZP6FfkrErJWYo9Wkb
	mnqRjQHECn8g93u+5+qBxcpoPCjd4qGRjfu1JOW4egFMf3dVJzMuBIxTbVXyt+M6
	51yQjK3FDdWomqcM0C+5xpjRRAGATTvaEG7sPCnuxG+GAi3329KCp5yDhFVBedI6
	B6OzyqNaK0D+zw5g+scUSTWyMzkNQ65P3t9fxVoFt7UMVsZw0/aJPzq7yQI8yqNb
	4wU0HF9OUM2YSNJ9DdPbY57WjZ/AnUy/jRuqNOeqr9fwzpCRLyF/gsBvOjmaaQBr
	Zh0scg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewk75k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 09:23:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso63003185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945830; x=1789550630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=;
        b=NDE6ft/vi+tDjaYSmKSX2ceL8DlkyXWc/x37wHMPnVO7iQni/gss6fYgNyP4eTDO3b
         oDkIJgEFDhD2mUYfdQD8Ew985bTGfQwT2cx9N9rAd5poV3PlQAThuYJ28ldJurgNvkPD
         0ZcbxVTFvHzKA/tW0KwbIrb/CEnagkA5qE9zwZoOBHn18QGC6bYcPGrVWz/4fxm6BFa1
         /wHVOHhK/bjR/vUpPFNXtwio4pd4p88dnwViraWEEaoagCAnc2BnCfpYj1cl9tL38MPn
         P0S2Vcr+mQ9+jaA+VWVX2C/S/2NzZipsgC2aM7tEd33zY/5YVdn0vtfO7noIktk/lrye
         TzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945830; x=1789550630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWyEGgxT4E7X9KltLLkSGf6POqbL5iNCiSRb74gc82E=;
        b=qWeUYVu2SNOjaiIhgVB8IUiGCWvJgUg7xwqGH7ql+8ruoFvDKl2Fn1vuLVArF5pUU+
         hmJO6sVTKeLE2EBF8qngqelW/3BnMR9uglG5Rivf5YrC24bFCX7Cj1txx/tAcWsKUqts
         0REvL3Wnrw2wTRNhDE+Tse3tqMxJxgC34/P1q6ZZLkhT2qtgUGBMSAhfp9PREvKFNdVL
         ZAIs9RGdEQ35zLZPjkP5ruOODUeXHeaBMLAHJrpweEL1BpPjWKPu++PUbqPjLDN5NBgw
         KDriDBEUTjCE4hNRVnzxti311C3i8NStTfzfVneoud9wp6gR0aNINLhstyXqYfoIqISr
         vp3A==
X-Gm-Message-State: AFuF++kL/for7MS38A1zIGOXIJ4cuwkY5NDMG0q2EugC8sh22PmPUjFk
	qiXgUZEIa9W14gmnA+LG7CoQ0CLqaxICOMUPnrZ4ubsSB8vuc2KE9w0sA1gbo2lzUdD2L0FHgI1
	L9UUh0y34fJXZDF4l74Z1hSShMq5+/tpZE52ADDf6IIP+jp883FFB+UqnYilw+2Lqir/dTo9Z9l
	vi
X-Gm-Gg: AYBFou2aVNtafJl0XkCT0iBaRpfr4ySYhNcc2lXUYtL6+Q9NmPieKCx55i5zgb5Ksht
	UohZHOpSNNi9jEitiRATr+c9n3PXr1kVZOLdjnHM64g6de+wcyZSD1fpcAyxSEXxtwaVm6q/4kj
	QQUYyqxfOZNYw7Q7uqsIVz09d5rwYL0vqOx7c6kQUPXxZDu39LX+7XCTnKnHDDFfd1u0lqd8bxK
	3VVcgTNoVnx2TP7qd+yT+bl+A6ip32UVsy/hZKw/0l9qKAmwq0PWoQoGzYQ2tdh/wY/nzErGiXa
	q/+s92KR3g5zUkNE1B4QBLKMVxP3UMiD081Qv1SevdHGPki0jT0CyWgewzHKxj4O8q6XLkiAVUr
	6FgrRgteCtSM6Ke6AHbLLxA==
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr2213615285a.0.1788945829822;
        Wed, 09 Sep 2026 02:23:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr2213612185a.0.1788945829338;
        Wed, 09 Sep 2026 02:23:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c42c2sm6520490a12.14.2026.09.09.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:23:48 -0700 (PDT)
Message-ID: <387b1aa6-f168-4fb8-95d1-895f74805767@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:23:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
To: Shujath Mohd <shujath@outlook.in>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <5enkadptjkxm5mmjjwtqehm4futxejzwewevoewlpeedjhszbb@dsfsfewasuiu>
 <TYZPR01MB513102932A34B982696E2AD2C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYZPR01MB513102932A34B982696E2AD2C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa125a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WY477xrWUYgG2yMJyFQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: clQ_9VThMEu_lVi7RnnscNccSdilXVZ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNCBTYWx0ZWRfXwKLtcnsdAoTL
 q5yve00VCLeSsAWqorK3kmQcPZXo3yh9KMgJu309DhhRWmVklBPqY5+rasTcptcQj+t8Ir+CQ6R
 ILdrzT9ZNMpIxaRhwubxszjyWtKzv5Wth+lRFmkmoxNNUMtKZRYOiGJrIT542aklD+gYAsbzzDX
 vJHaDGCXhtzouejVQe4do2UgyZ+vdB99RC3+Q2oVrFGpLv5HNx6WZyYkAdw+yrQz7yWxcGszIMC
 N7OWP5rKfufKvlLiWBGYFY7k3C0E75ymNI3O9ANyBq8YexAAdxYHjXa1j5XAgWsq1IEsX36FkIL
 ZfOsIo05jYbKozIp36vjwXxzf7adZLLsUc7934xoJ++VpieB7bCv8Ocro0D3H//CZuZi0QdQmrr
 5j3tKdOIgtqLGpRJmek0FoLQmdCOYnedQpbKOydJ0PQ2A/po6vpzsx4twIktvth1y/JokHsmB9U
 U+tBhDX77K8pbMVuHxQ==
X-Proofpoint-ORIG-GUID: clQ_9VThMEu_lVi7RnnscNccSdilXVZ_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNCBTYWx0ZWRfX5boXVzTgux5Z
 DMqFaSfInrvGZPbGik1tuyQod6LNZKS/36gV5MSroYoWCN+iSJJ7uqUa/eQs+PEu4CDwGqfQDNN
 onXC/sJ4fXn9x6lq+3MdI+0cvnFx4PM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090104

On 9/8/26 9:56 AM, Shujath Mohd wrote:
> Just the commit message, nothing in files
> 
> On 8 September 2026 12:49:24 pm IST, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>> On 26-09-07 21:33:08, Shujath Mohd wrote:
>>> Add simple-battery nodes describing the design capacity and voltage
>>> limits of the Xperia TAMA batteries.
>>>
>>> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
>>> battery voltage and 4.245 V as the fully charged voltage.
>>>
>>> Signed-off-by: Shujath Mohd <shujath@outlook.in>
>>
>> So what changed since v1 ?


For context, everyone is expected to provide a brief changelog between
revisions

There's a pretty in-depth piece of documentation regarding all the
(well, probably "most") such expectations:

https://docs.kernel.org/process/submitting-patches.html

And the b4 tool was created to take care of most of the annoying ones:

https://b4.docs.kernel.org/en/latest/ 

which everyone (contributors and maintainers alike) is encouraged to use

Konrad
