Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7146C4E06E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648684; cv=none; b=AS/Vv5AhJhFg1xnybFZdIVySsUc1W7qpvKWqyHIJgGug+ep1KAgdLHg1U/3pq/LwDSl9tUnLk/MfRAuosUomGJXpU85b+SUl+NMraXwGwM7PURd2A2xzoPcKWMO1TJBuaejQJfv/OnLmOuKeIzyAcLD8twcuD4gyXjA3rTSZ8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648684; c=relaxed/simple;
	bh=SnMHYeXiWguGfxVXceu+bBQETBsAqvaJWpMi6JFepAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMh+ZkoGoTLIP7XwU0Jaji8w6bcl0+ZXsdMqR29oS8pqnWU+GEvNexA4pKoO7YekYBNOMfyB6fAS8JTfGErNbWJFjtsBnMIWC1kdGcrui1grX09Gl59kXpZay1S9vjqveR3g7SrY5Z6VdFwKdGwci5pPvS3lVvIO5K5SsQDFSjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TUb6sH19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al0pQ+FK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TUb6sH19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="al0pQ+FK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HBp2SM2013739
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OjSRMZDcecv5N4PzfaSL6P3SNko4UxD+X15iRKhspJs=; b=TUb6sH19bLlZlDwy
	Mwo5Lv56rfGtp7Vmhcfe2xXoPNZgfJXpcJjNC8VbYcVVL4Smb6JqSC3AUSPIgGoA
	mxPBZYWKv1cTvHKwGmlEAiw/kh1OFz3PQefDJTJe+Dq6QxmV+/BW133xZcWGdqxV
	rxPRTF7P8eunvg4hYfT4xwf7bwSahkJwxRazLuIZx4BFFu3SQTbABJAd1rgzo+Yp
	xwIJaZkA/C6VLaUcCQ5zGonN2GpOUOIB4cGWbGj+aIwdDfJKxphFWFcAjDi8Ucj7
	tqfSmAeoj/PCvURBsQq9t6kAepbTbXtDIqitLc81aiSzRpjteMN88xL8rxmwtOa9
	e7iygw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppg58r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:37:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91213a1aa68so11153536d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789648670; x=1790253470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OjSRMZDcecv5N4PzfaSL6P3SNko4UxD+X15iRKhspJs=;
        b=al0pQ+FK3kfp2OdVVXBUJ6uIcUbYCv2OFJ66PY9E9mW04S7clBmgBNqShJO5bawNmD
         8myT08Ejx1A1dBudf6RnoYxQB2VMD9lOUfe6j1TjHvJ7YwJCOuxVGElW3tIztPTi2mZ+
         Lb9/mN7eW1yFTZDle58drJAe92cHwyBenpNGTQz7Qn6No+jzmyx/eCKto/FNx3lVbUuT
         +kjU/h3iSE9KmLRSb72KtlYBJRoeoTc/fSrgERv5xEowgSKUjQwDdkVrPllRWavV9DwN
         K7X3NADR5J4Jnt/aVhyxK1Kq4l5kzY/fPXyKcaQJJASH3X/YoUngbEh3/J4Q22vujq3j
         9AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648670; x=1790253470;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjSRMZDcecv5N4PzfaSL6P3SNko4UxD+X15iRKhspJs=;
        b=FuBQ5g9U6yoCkRUMZXT0Dg/9EwVyJZxj1xXFPpegoUW0Tp7PAA8jegB58+mM99NeEl
         SRS0FNncKoC7nysUDabOS56Bmgk3xi7jjNMJARuqERp5ooBhcCRFBpDYuJnCqdPaNEp5
         /5AKHHBX4+X5BB4ANDjk1Bk6wr+pCvX5rgV3n9JcmcBgNU3XiPrab+Amc4qrgYixwXA5
         vjq3+X7P8MbrVUxGq5yylOjfWz6e04BRw1jV7YwSlg2Qy35uYv7uLwtxO/Pn5nGBILVW
         zXcmx0WnsFWPkOc9e8ZDtE9y5jxN6sbEJJI3dSTIL4hERrPQR4EDz0gaySaJNQEouDWK
         HWlw==
X-Forwarded-Encrypted: i=1; AKwUvByl0fucm5C6/rXED9woUERdBBHJTwgHL/wTMDxZHqrngSTW5URe03WBvjhzHHUO1lZuE6nkKhhNhYX4DWjU@vger.kernel.org
X-Gm-Message-State: AFuF++l1zI4XDZHB09O0AltEuZLrOslyGJg3lyNXvYZK1pyNAImTJpRV
	5s8ZucJlirxN6/wz4jPPVVeF2hgBBBaHOv562yyFZCaJlJ0NMaXB2bhSLOH18DzYVzQnXPMMKBF
	iqRZrEOV75X3JTw+3xylZ6G3OB3NuN/IaGeKGe1TbPxdbghlniAMHn3jQK8DBWINgAa3N
X-Gm-Gg: AYBFou2uOHm3YVb1E0GHsLYgafGtyzTHuiCRXQDfffuKbugoDuuqVBOn7wdCMYWms2C
	nwWH1BVG985lEm/xeWS37rlCz/lZNAxkfy5PBWiBzKRceh2dUayWJZR/8XV7S8lbA/tW5WltP3z
	WfoDuRKboe69GiF1mllFGwBjxfNK466Cvcxsrhw+XN3nUnt7vVVjfRkxaX5rO2WeEWdVacXXLnu
	BUiSwZcS4+PGkwR3C69vwnQrZcx5n/JvouczTQIOgxhu1eXRh/PfrL/JB1oQldy7H5uuSVVzo3g
	M0vSX8Njny279/XA9Bo9j+FFCcpc4Ubhqut3+nYVGi/CfQTjgugFMu6XtEfbww5lyFkFUZwrSzx
	/6adqT9L5oW1MpGxoTmODi+YuvB1ZgsrQiVFqtG6ytOGYOpvicy5osQJoLOf8Mb4=
X-Received: by 2002:ad4:5ec9:0:b0:90c:5947:7e64 with SMTP id 6a1803df08f44-9123d703456mr137305396d6.3.1789648670396;
        Thu, 17 Sep 2026 05:37:50 -0700 (PDT)
X-Received: by 2002:ad4:5ec9:0:b0:90c:5947:7e64 with SMTP id 6a1803df08f44-9123d703456mr137304136d6.3.1789648669428;
        Thu, 17 Sep 2026 05:37:49 -0700 (PDT)
Received: from [10.38.246.218] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be5fcb5sm49155906d6.11.2026.09.17.05.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:37:48 -0700 (PDT)
Message-ID: <d89a7376-ffab-405a-a3b6-d3633cddd063@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 20:37:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for qcom,nord-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
 <20260917-active-strong-emu-bf8fbd@quoll>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260917-active-strong-emu-bf8fbd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v81_VtKtPuu8-u3EqvrB4lKjPpskQ0K2
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabdf1f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=yKxla6SPEuOvPVJYePEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: v81_VtKtPuu8-u3EqvrB4lKjPpskQ0K2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NiBTYWx0ZWRfX19pr+ydLaPKY
 w8Qp67M7R8zo1GazXGqkv1q4CaBnNoJ294z30LqfTm3hA6F6nexDe+Es/XFTt12YTXf6WMEORji
 6/vID4O3qkxahH91HOZk71B/s9iSf5YaO4r+QWUHDALjhoOHYclZa8UXIia82Xu+paF0yOi6ze+
 chyLzRjDbMGEh7vod4E1euDl5gxVowUzZaK/TtCwn8taNVGUkyAZpQAgReP+k88l6vyNjxCLcyD
 yGzYc4PocxmjS6H9+SFL2Jp7gCMIpQ69lsNqXT9PpFLBPfN2bm8MZcflLZRc6rlao8OYwMNM4lD
 LtBTlMTH4dZKPZpHyfXGr1EjoPPMapUtFLfFx6Z/5XaaOnnPTvnwVCjVh61eI8ff+rL+eZpwhby
 PhX1ZeCx6VQgZX0VyHuOuUrQ5/x5VGAyYTdahD8eKDf2DOpZ9etTCe8WUjsEi+QQT18oHy7Yts1
 FOKhBuCjPrPd+IaLKOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NiBTYWx0ZWRfX9v3n9ax02TV4
 YeF4fu1vQ4S+k4Rw0NqaSvGYKTGhQ4y7geD49rv3fPs+Eoyyepp6RPmARTON7qKiH+49XCS3F3C
 KXBlSJq4moumodJWMAHBM8+4iG2AXu4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170176

Hi Krzysztof,

On 9/17/2026 6:13 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 05:34:11PM +0800, Wenmeng Liu wrote:
>> Add bindings for the camera subsystem (CAMSS) on the Qualcomm Nord
>> platform.
>>
>> The Nord platform provides:
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 10 x CSID Lite
>> - 3 x VFE (Video Front End)
>> - 10 x VFE Lite
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 +++++++++++++++++++++
>>   1 file changed, 393 insertions(+)
> 
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
ACK

> ...
> 
>> +        description:
>> +          Input port for receiving CSI data.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - data-lanes
>> +
> 
> Missing supplies, altough maybe this is related to some other ongoing
> work, so would be useful to see explanation in commit msg.

At the moment, the Nord platform only supports TPG. Perhaps I should 
remove this part of the change for now and reintroduce it later when 
CSIPHY support is available, once the EVK board is ready.

Anyway, I will explanation in commit msg next version.

Thanks,
Wenmeng

