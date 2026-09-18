Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A6A390CBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723601; cv=none; b=ejy3/ut2PEcY1Yfb+sSgHATAXBdFhe6RUC7nWnlY8pRO2sWEXi7TZOJcoUIx7UyVTApCPOzM+6O1wv2vdwEWbLvmi8EZo3dl8i3g6Xm1nx7PUoZz4qB4nX1VmSheVKpH14/lf2mtoP+bXVK80prYNuucOzghgjSc4ci8mUJicTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723601; c=relaxed/simple;
	bh=gIL6hDWa60lnccTvkEgMeuR8E1aTzwkmdxPpMKIZ8xQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FAkSnrEBdJYmaDBou/hrQvH4RV7hu/08vdjywjbBh814PgBREKbby1dSu8eY7hsX3xVWKudCIWHnU5x5l1QwN/3GUHjtP09VQ7uyJrmSnnjV6N/AYIzOoapAitPMyLYJ0z+/+6v4nikqUBXVNgXd7QQMi4R9zz7JUD51U00B+cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTdV6ECt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqrk4zUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTdV6ECt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqrk4zUA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I8kYWK132191
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=; b=KTdV6ECtGkqjFMIM
	WXoXqJ/mkAnnVOVsr77WygbTheTO6/QOhdENm1trWkudebiTEuMbDGp9MKdVk7qR
	2gJ1jcv/8/zxAYi3iakUmPWQlKid00VAFCYbaKCg4worn0wrOnk5s1eQ56xSWnhi
	HU1i99bJU0CBq8RNI6P5SVxtfkIPEWVhhHIlq7EiozcJKp3ko08ChTNG8/Jgu262
	/29CrT8U3Kq+Za1iFZkgGqUnN4YoNLd4ggMe8SC3YgbdPz6eLV5IjMqpLnvaxT5g
	vYCMVFtkp2nJHTNIcXz90ayR1h8Lp8NIp5aWQscHW2zLCRSO1iEKlo4L4gxGUv4r
	k+OOiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23905kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:26:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso73932785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723598; x=1790328398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=;
        b=fqrk4zUAvx3DZKHyzALVosv7fdo3fIfekWIDdIav7SW6Fs4XPV0DliSZvsHG0frBWL
         pvp8YTTVHSx44t/LWKFbPf/wSrRYDalPSJWJq2jIEjsRVd+ayk2wgP5SvcKeFtJVxyX+
         nSMwVYrYn7IyO0A/zEqrva7s9JfWNQMz+cV/e0vMPlT2EufWiKLIfJ7Z6/xtovtC8rkW
         JJwhhy+LhzPFrWiF1bl4rocZaMC/0HWlWl0xNhAtcri22a5YAZuOh8jWJZvGRrJJGX6n
         0SQAwTaQ6InR4QX7/CE6Y/oci+YszZoKcAYzHjFDhLjRIDsmyd7p75uT+S8pZHh3Hwnb
         I8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723598; x=1790328398;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCfArd1fgKC44I5JZ5GUogTe93k25uI8hDyLvcW7e3U=;
        b=bE8ABarRZR3cMlzjeqgjvDMxyNpwC+IFH73CpBl1RM12Dmfsagqs66CaA2K2TRSEag
         uXO+EkkBG8+uOo68Q2Zw2XM+KKmZ/5Vrp4H8oV/mXC3Bi2QBa0+KfO5uG4nCp6idf6qm
         00hTfqA72h+T1QcBBQ4dd011HJzWDCLU0Zn3VyGqtHcL+wn4DB9Ai/8QDaBzZc5CHfCW
         hJPhM7jzQcS0O6LdbYYv57NurQ/YTSSEf07p1K5byBTr84vBvS1U8g6M/+CV8k/itgLA
         uellnoQsUzbsjuV6W7qTL93yIyOYDXi7P9d/YPdXzDFntlgfT3W+USuLeM17L6rvZOHh
         KwaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJGvutW8IdK22ZDdOu8WNTcdJvj973oPw7Ab+bOBdkr7SDygPexs8MUeDzuCYkiZY+8gzq8pEOTNobUS6X@vger.kernel.org
X-Gm-Message-State: AFuF++mhdulsPwE5ZDdavYbdDUMz2ZRQQ7lMGPvaP0VM7kkC8SU8d3Sy
	Me8Dw8Y5KY0w5Z68d4l7I1bQEjPqpqG8UbKOjIBlNP2Ze8vG/4oBenbNpKmrZmcQ5V1aIsDNvsf
	/5hCn+Xoy7WLehyp/gCYkAborJeDBy3chZNtsv3vobJMUfHNNje2Yi1yVTjWrCocMuKtLS5+4Zt
	c2
X-Gm-Gg: AYBFou0/JAKFpWXWPFGWamL8TfOQZOqoAaoUaCkVG87ebh+LOuF8/TnpndYOJYAusnM
	7FwftNP1Eda60EJisYE6wM7nGfNHHuzeI7s6FteKZDI4waKHSS/9LEXXf2wy/iwtXIZFeTzDaOv
	uyUxsFUqIcgDiRRH8q/MJn225Gh8qzBq/Qcyl43NqWhMHPKI/tYvKH8Xrkbk9pjCMxKx7e60TQf
	58upfNzLVrg90WyjE4DpVYQtVHkiqqdLod5NpZB0HSIlCwvEPrSoVloYaES5GXz+VOI2qozui/b
	d8tyzpIjy9neTiIJ6pXMDd7u6n5xBP66zY3YOKjhGTfNrR4kPPbTtXmiea132OyUxKAgYwIVc8l
	tGU4UDuqzF93eCx7ZnW+nURIpMFHo/7B2Jm7TKrrTwMBeRbtjSchkhLUHbS6Xl6gyQteqSpnAEe
	gKWpay0x7hUq1qQS2tXSCIfjFTcZbTaebgOww9FZahKDAXW5wo0nqspJS31ti3QpozAmM=
X-Received: by 2002:a05:620a:29c5:b0:93b:d7b4:bbf with SMTP id af79cd13be357-93bdca5ed54mr202483585a.76.1789723598298;
        Fri, 18 Sep 2026 02:26:38 -0700 (PDT)
X-Received: by 2002:a05:620a:29c5:b0:93b:d7b4:bbf with SMTP id af79cd13be357-93bdca5ed54mr202480685a.76.1789723597628;
        Fri, 18 Sep 2026 02:26:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb0715esm35946966b.20.2026.09.18.02.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:26:36 -0700 (PDT)
Message-ID: <6d103565-42aa-4f02-91b8-bc7598830c8c@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:26:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] firmware: arm_scmi: Fix
 scmi_protocol_device_unrequest() race
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
 <20260915-messy-imposing-frog-ea9338@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260915-messy-imposing-frog-ea9338@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfXy66kmG4I1VMQ
 ZxoYz9YgHnmINfS7yI7Y3S8I0iFX4/Yoa4GWDzkxpI2cZRPFLkImYG9OrNsibiWUZnYo4DzqmYY
 vvz/lEujKsKDYkKJTNcjZrXoox09AcI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfXx7roNdKvSYHL
 aj3gFvRniDedhd60qLlllxQvJZZkDvFXHAopenNMUrx7TbO46VYG9FPqwyZVDHVLxpULAjqbuyY
 TmP3eC5c9Aj53eJZ8NWQL3+ES4bAFJRsHxHCNWDivt6pYSV3HbVywWCh1K8wlTDUjuh9IOcaDX6
 p3zmxHbbxRvMaAmOz7m/coSxp0vI7Y8fYA4mOrwe3DuIx5YAHeLRYlgqZecdxqD+/GXDzdQ94GD
 qvu85JWPJpg5bXSOeI/vzpUvlGt2tqZmqS4CxMHU33c1NtIK3JXrpVBOiHH0LpT/74UnAsJ6ruE
 wdhJIuAjgW89aDEb5AHZK/NZDKomHbt3Xqlft7wsb6G3LS3YGGGJ7TyPQP7nA/FGQHNHTn4SSXw
 FLNRY822xMFGGq3H6Y47nigUW6xBhbdJRknFZR7hg1ol6gKqbncvgKNYk2cM0ojLfQEiQGINwcn
 izBwyEOCfqjV2kmyXdw==
X-Proofpoint-ORIG-GUID: PZL4yTsHommrhirqZSK9voXPr7pZO9me
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad03ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=U7ZbcBUnRWPs88qqOtMA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PZL4yTsHommrhirqZSK9voXPr7pZO9me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180130

Hi,

On 15-Sep-26 16:21, Sudeep Holla wrote:
> On Fri, Sep 11, 2026 at 05:23:28PM +0200, Hans de Goede wrote:
>> scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
>> the notifier call. During this window phead might have been deleted by
>> another racing scmi_protocol_device_unrequest().
>>
>> Re-acquire phead before cleaning it up to avoid this potential double
>> free problem.
>>
> 
> Does the below address this issue already ?
> Commit 2c4097e6c4ae ("firmware: arm_scmi: Fix requested device removal race")

Yes, the v6 series was based on v7.2 which did not have this yet.

I'll drop this for the upcoming v7.

Regards,

Hans


