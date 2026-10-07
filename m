Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A00472782
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367062; cv=none; b=YfyLoXK1Dbfnd/v+P0SOXIwtbH/zKZ6QmYw866+SREN4kD1VLZBzoYVfe1BOCkJ7lH/E2tkFEwnMgmjKaCWT8jqe1n+efp1Gu7M8NTErGTEc6qKhVuKTrPpNlczmLCwSmTRDCHnEvxd2G4+BIPFMPea0M0J6MviIe0JOX1hZkHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367062; c=relaxed/simple;
	bh=G0D7fnoSmrBtX9XsPaG3Vf/7Fv5FbcC6uSXd9+bMZdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuPe6VyYjIhGBYmp/522sFFBvXL+vpooLY1CxmiFYdv5TUtP1GpPPdGisbYbypwA3BBhRG3R8PSEYc0Xuq73pArBJlI8uzE3mzT0k/xuOg7sd2gH32l5iHlddrlyQHhpZk9LZ/hpuy/IfA2aTo0g1G/llibbjw4loguF/y88zCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaM0xPUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+qovThl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaM0xPUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+qovThl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnMQ2711452
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=; b=OaM0xPUIr/C2LT88
	EhKj303oqBT4P7VR+QFoXkgtBg6WuWvT4iGJqKAWlZ21/WFmiORHbpHSPi1DrFdB
	eFpUHcDuEzTyhBojLjRacmwrNhhuR5kx11wN3hWeqIX2i2hz60sT1F1LXqD7XnUq
	nXmIY4hGsrj93CzFXipvv+inU5IDM4YvPFevwIqBXzzsCeQYbc8LneI8K+ictUyb
	ox2+WNV57VN8s72AXuPXsW00RftniTzhw6qt124ynhpXHVjWEHRo5xkWk1gNw/2d
	A/8FkxKDow966SfDAcRNA7ijrxwTGWTPlw6o3ZeOHX/OETHD2mROTT5P0irf/1qh
	UlqkQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1ka8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:57:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1050124985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367052; x=1791971852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=;
        b=X+qovThlw1qtU1oSLkZP6m+XTqn/x0S4A+aOVvC9o0huFYGiyrt1iFih2A/UJsFfhL
         XOnGb4OjDuQrranA1i32CQD5EppvqxofTh7pS5IGoxrLjGQpO0yd0m6asI+l/id+XHJa
         A08S4wiqIrz+xkgCKb3ZyVKQYkUDAgjLJlfQXNw7y3O8OQeWZg3UUGvtuJQlfFCBEtvN
         SIijp47Lt+BqBVI/smCeIbUVtWotAyQ7BstQrGp9085Jl9rm6SiKhVuwIV2+RvgMkZZh
         7oxJIcAzjkG73otPdHMoO/uvtkD+Yhfa3c6uBz3/UsElGWxEMw3XCTjMryB67w+A8bhM
         aIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367052; x=1791971852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7hS9sHZ4oab9Nfvb0VRSOm/VlHYex5ygAHSC860spc=;
        b=AO0OI4a+WUDEBki5r2T8zWNJkCjhgNkd28Qk5xvcMWbSWbZn3R8J2xRLkGXT7r4vcE
         n66uuplSRTlF438kD2v/DurNxRzy2gQ6LG0CYLK7dsDEbLcfLkXP95teCV8gxtOXmVms
         t0lPrfiFJwSL+I1F4t5h0atxx7fHVoonTNA85IuruB9HjyhCjN4rLUUG3akH5/AwQlPg
         I390djOQf46AT0rHXl/xuIzzSZgiX4I1yijcTSidpBgZodNHqQZVvEeGnjcM/2+bLtPY
         +itgyoDoxQD20ZjiNEZSbF6snlB/LooXAZsISGZlef/b7e5GQrkta3oJp8m4Qxo5YsOk
         gUfg==
X-Forwarded-Encrypted: i=1; AKwUvBwmqT0s12H8GgZc+JJyjeVlNUQTiT77omvyGEJf558wIpoW5hVrAM1iChzSM8/i97MfnfPdKl/889vBPa5P@vger.kernel.org
X-Gm-Message-State: AFuF++kwhJTY3pwgu9OPGPwfA5z8uVtum+7grBHFxieao7O/+3Nj2Db1
	EVuFeS7yQxJed5p8lS9Ft5giaIdcKZ0MOPI72sIe8Zfct7VCuvl0of11kOuQdDEgubQE6Oi/W17
	FFwQb3sUdwiuV2PL09uScyOc5khoT9WDvKWPkQ44cvjVjvCFgX2O04ILJRL49/aE5jJK6
X-Gm-Gg: AYBFou0xD2yXjQs+REEKUenthBtv0Vck+bpQtFUYxt1u9LQj9zNz9u2rsj6UtkRHXLG
	LZfStFj1/ZIwVveAO8HrqLI8/DC25TUgTDbC7m7pWhIlXV/mSSvl4D6qcGhpoevO+rBQDz0VzNJ
	XhPGky7LiqHBnFLYqELuwvMogjURdOF7gehqlGhQSFNIJFYjuKSMAgCNVdp5NsY8+M87hOl1nyj
	G0oYFiizE74JuzL3M1zryc9WGnD06ZtmTTtiX/bMQEpBtDCuxoIZk71TpUsqtOnDei0kYk6hkFG
	67wsukKp1fhcPzYSl6qKdmK8SqOtj3B+k3SG9EoljquKs9J6RmCIpSaARwoeZxJagk5ZDPe4DxN
	K87Z4Fiv1e33B2bzUuqRnEd5G1+ZnhOiUkBM2iKiA
X-Received: by 2002:a05:620a:469e:b0:93e:76a8:af2d with SMTP id af79cd13be357-93e9b72e5bcmr320212585a.28.1791367051826;
        Wed, 07 Oct 2026 02:57:31 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:93e:76a8:af2d with SMTP id af79cd13be357-93e9b72e5bcmr320208385a.28.1791367051241;
        Wed, 07 Oct 2026 02:57:31 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178a175aesm178374325e9.2.2026.10.07.02.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:57:30 -0700 (PDT)
Message-ID: <0d72dd03-8500-48de-a78e-6b99a4c6fe32@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:57:28 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel
 path variant
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
 <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h7VZZECaq_W_BlsasMcHtlZ2uYRohkA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXxnKnyQfeAqNx
 RFC+XK3RWzW6BOoWmafrS6Jv1yk5Wkr9rAbjwkO/y1Z4RhMVrz6X2R1prUZ2fjZeOQKzhV5UBAl
 KuYOm2JtwmZsmh3Lg1MpHy2CbvecC0w/XoNH1iNQFtRUp6mHVdsqVK8cFBoTG1ZVZ5tweu8UJn5
 E0aTuMi30SdDx526PgtkHt38NlIdVkldzP18TJWHsQcSrAlsNa5MPvDJjmhi/QGpSEqPyd10DSu
 hLWLz3FSPM4uLNCBD1DjtlC4p4X5soXJBkwnVORJR0k71+WJA3iUPRV8dQOdGSrBnhdwWY4Gq7k
 Mn4ITJzZqSoman6J4YybafXGDZmLc8JefXPBwmoCJ7xaM7ybSdBZLk/PdGii5zUNBPLcIMXqxTs
 48lVWYgFbNIODUACT1wu8ZZi1/fKxZ42LsSEWHCXyuXJxSTkfJQhq1oFvRzWtYR2+Z4feLOrwth
 S1t1qLQDHLi6jnTVmoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfXxlHEzWVt++rC
 5BGJ6llDMiXa+V/ItxBSTKKTLzTQ46IvFNSzMHzwc+gBzartz9v+o+ZWKa0+QezTHSCtqi89hgY
 As0ah8eqFrTIhJCSUwdIHd8Hcfqhmyw=
X-Proofpoint-GUID: h7VZZECaq_W_BlsasMcHtlZ2uYRohkA0
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac6178c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rnyNrMEuC2Fy3nUAs0EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039

Hi Bryan,

On 10/7/2026 12:49 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
>> pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> index 48f280e99809..9206c7cfe197 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> @@ -14,7 +14,9 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sa8775p-camss
>> +    enum:
>> +      - qcom,sa8775p-camss-pix
>> +      - qcom,sa8775p-camss
>>   
>>     reg:
>>       maxItems: 22
> 
> I don't get why a new compat is required.
> 
> Please look at my RFC - there's no DT depends at all in that.
> 
> The existing CAMSS node has been designed around the IFE SID - not by 
> accident - I've been pushing this for months - to prepare the ground for 
> not needing DT churn to enable IFE.
> 
> Sorry NAK to this.

Yes i have expected NAK. And it was mention in cover letter that
this option may not be accepted, but it is convenient to test new
topology. Anyway as answered we will wait for your new series.

BTW just from curiosity do you run parallel streaming on pix and rdi?
Does the functionality for all streams to output in parallel along with the
statistics working?

~Gjorgji

> 
> ---
> bod

