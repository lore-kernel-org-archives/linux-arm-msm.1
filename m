Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475020;
	b=imYZEu7yihFiciMjp6wFJGMa9joWGrwIvia0Ipk6XI+d6xKQQMTBbCU2J7V8JhssAVWB
	 G+hfrZAZeKWWwv3KtQ9uTXeCF7b6iOOaB4hSWoqsFVjYQnu+iVMHFr8CTA+QCX4XJAGbf
	 YlGXcVn5q0LVtdaV7VbKShm8GgvBh4fE48yYODBw7U/g9WFDmBTjNs5FadJaK/mT9PkBE
	 OuPZdGTFZUPLBlODikNXaN3T2Nq1OYKuu2onzJMiybW6sTR0dyO/43YEBhmURpUQURIGo
	 3RWSA77vevmj2UNkDWm667s61pqXvKpdVon8zYul8cJe8n7n9/oK+QOZoG4aaenAUBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N2P6nDd9tifAxlLFJmiQ99UaxUAK1441F1X72vcKcaA=;
	b=XsfNQtpRYydMPggkt2tv3t8dIi+NZxrx7nglctQGmGpZ8x4NKlRBzXZVehOprpl5/0Bo
	 e9H3gW8Z1vAig7f+NXGS9K9rVx5Ks64kLXR3nAqzHI6IYkpDLAu7mrye2uhzIdbBJXUSe
	 9a2NVWEgcoLP6q/mzi/Gl7oZtAksKzOlKKvvj6ElPPR7reBjn9BfqAqXB3UskgPbrN7Gt
	 DNLaw/UdqIYTTe5MFJ5YDsCLxEmF49x09+iGtlTmSP8gJ2YwXLK0H7gAyPwFvenluQYaJ
	 INMzLrw5rYil9CZx5FShjzsBPtXHqmq5jkeHaTGPbkwOMXmBUJ+pP3veSpaX9b5oX8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VM83kiH7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eD7TcdD1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC14606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC14606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VM83kiH7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eD7TcdD1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC91I5l4149283
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2P6nDd9tifAxlLFJmiQ99UaxUAK1441F1X72vcKcaA=; b=VM83kiH7iyLX/Hbk
	yxYV/l/fERM25JjD0j6/Xgd9GGvK++07mWI8dPt5k91y7Ygw1O/FRD4CzEPq5ikn
	yKLpFuodDY/Vh4pMIP2JNB7Fm7Y06jdOBCrzqKXWaYsvZr3D+RV2m7eWGn9tOxJ2
	464MA5QDr6z0cDzH/Xa9pSoryt2FT3C6NqpQdeWle+Bi6WZY47EmKPyzYKBhoueV
	wtHut9adM6PBB75/XE5MkqTz8qfIrhQ3o+cQahjhk8l3pWVsSc/oFQLswV1MrItX
	aZkxxR4ggvfVhyh++jn/3FQINAYft2x1o0djkYCTs1AuIDw5YKYGCgKoxAABGcID
	luWqYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62qjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:16:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53389750985so4092201cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475017; x=1795079817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2P6nDd9tifAxlLFJmiQ99UaxUAK1441F1X72vcKcaA=;
        b=eD7TcdD1kg1QOoX1/QkrDDn+r2r/+h4IdcQg7uDm8yRM8xMF1+HjkUyPxaAf7b459B
         NZP9Yo6PJmr3oinAHW5+CaFusfcv7ZbE9hQT8I5MgZcrMgqUdZJ7RUiOOeVOH9dwB4iz
         aNbRFXyz/UCOEzA0Tz+2CltUon5UYEGUzg0XWqjPxuIYKzDshtlqTDl9beHG05gPj4Vm
         SL+7wpgaeXP3eYa24uK7r8CjYccWAPcK4Bi92JIk5eiI/1Hlt/qNfypEylKGt5pSupxG
         qhDdAIpwzfEB6lxHLJz/lZYS/eDwDvfLCf7FFkkeTD7W11hVHi4K9rxgCcQdUNYPh9li
         TeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475017; x=1795079817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2P6nDd9tifAxlLFJmiQ99UaxUAK1441F1X72vcKcaA=;
        b=Sr7PtCXRDqkwzOXsXPz3Omb1WNwarDQ59gtkNAh4igKK2g9ODuwNtWwSDE0Y+yC5E0
         umcW4l1W6uFjgume2FDDaTcu81s01DgKWZ37VJCXfuPu58bSRKrxewVq6F2Yf/Qgn2ki
         lUZ1rdnbQuz9HEnkg6eVdZ2Z/vwo4EQegWSGmkRaZrgNlIDBj4HaoY5EreR4MLW1gOwr
         lvCr4DQXX9JzsIhj9b3OL62I/k3q2VAMib2tGOvkxXJxCu9uU5IDYms27JkxNnhgtY4M
         G+SRtIy0+mwVrQ7Kbp/yKUGfKMbraWrXrmOixbtmuwzeRKl+O5b5l+JRCETwp94GPUF5
         Sn8Q==
X-Forwarded-Encrypted: i=1; AL+hErFwxIsNImGLw7I0x/+c8vlRqc2jJnQJi5HUTdsRiG0ucEbSpD0SFmwDF7zVEz/c8ULGpByo9HkCqA/WQU1j@vger.kernel.org
X-Gm-Message-State: APuU4Z/DU34HDkkKBcRzttlt0ICoNGDmha6RrOMUsp+Mh8ehOr17hVru
	7UVIYu7d9KblFx6OupURRCObIVmqEBdv5Ov7tFC18ACAtIfZJihO6an1HazOKs22QokBV4fYP1W
	eKOWlyrw/04uF0JSgEitimrXq7tigQ6PjaMcUP1KLl4k2Z25HHZllJyp/1xoZkA95+Eui
X-Gm-Gg: AYBFou2+JqX8FqLP2hXLdx4/z84DhDQWA9Yrv7u5W6z4yVXD9P1rxJ2ulrnwj0tUt7F
	L1IpFAa+kklQ2gKOAZYaUT2HznVp/TdShrTkIVTtZC6NZI77I5gFOjTv7huKr5UeEQgSCAKtre2
	FbmzDiOluAKX7uM6lS3qT3nqMmZYtjQ1TR4mfy86g/WtK275S4B1Fx/trtCzcJH9kcL5mWzNnQh
	/VLeFedeKXF7MksbcbPOnp7yfBI8wDx3sTAz8IzOepx/oTOWvhuB0dr8IMUcXx6SsY4TC3qW00U
	PbtAHNJieGKIq8LmlpV1wopwUz4DSFP4zvqZg/WNzbTduB8+8xbuEDNd2rDlJisQq+x4XWaUE3A
	OeF8Wx4tUECSpzP9TtAkwkzOqI/IVlVXMVsIiEp23k6kHwOUDEWCkWJcoLcbM6UnKMpdfBS0=
X-Received: by 2002:a05:622a:e48a:10b0:54d:42f2:78cd with SMTP id d75a77b69052e-556bade17afmr78818481cf.0.1794475017583;
        Thu, 12 Nov 2026 01:16:57 -0800 (PST)
X-Received: by 2002:a05:622a:e48a:10b0:54d:42f2:78cd with SMTP id d75a77b69052e-556bade17afmr78818331cf.0.1794475017160;
        Thu, 12 Nov 2026 01:16:57 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a693e82sm318371066b.83.2026.11.12.01.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:16:56 -0800 (PST)
Message-ID: <897d7742-fc16-466a-8a3d-985292431fb5@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:16:53 +0100
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
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: nord: Add USB support
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <avDL8IzfY1AcDjzY@zenbook>
 <o6t6le343ifmu5w33z55ik473xfynt6urv465xe3bn7hyhmncn@7atsac6o5bwo>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <o6t6le343ifmu5w33z55ik473xfynt6urv465xe3bn7hyhmncn@7atsac6o5bwo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sx3bNWO0TArvqssXM4RoUXulXfbktrTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX2ShueEBLNkmO
 SMJNHTH3CjO2Jbe2aDOp+Q2OnieOk7S09Ij+fR5hXZ45JY+Xsdwgw58exbJMEA67Q4KzvBucrAn
 SdFyQkJKkq0851HU0wO/xh9L8I6Suw/flfwzTV0zhkwW7Pf7mExQcJgOVAkq841yuYOPgLskl2G
 vYUSTL4K0rNI171OfCfMMFDC++aRxpW0wrDm2H5ILlGSqpIzR+JWMsrvo5vdjwB5Dm4n5+mebOy
 ssfKw/HnCq4bEmlG0qIcEx9EAL6M9/Zft14JBxjZrgJDhg93VTdjuyllkHSOPvb4a/EnOH0Il2O
 KdqmuDMyqYb9xBEh3MlyqvNPtxav7fXCZQ619mUw7LlcQhYU9uiIxs0ngHu9gWyCxsRQcV9Eqsd
 QC6mnvPzB8FjZWAYFf6mIdCj9RXY+ceB1kTcDwhuwznfY1qcgBLH4TosGrCh3zWpEYuaNjq+E/X
 FC5N/W9gyOmhM3NsuTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX4F2NYVzMYRF0
 LeUZHYPWUSrxSLawBVA9ZAVvgkGG3mOlsRr8QW726TEoGttb1hCxI23kX+rT3/FPsQn7gCc8Dgb
 igOy9yy77p8lBYgoNYDk2AnULkDdnq0=
X-Proofpoint-GUID: sx3bNWO0TArvqssXM4RoUXulXfbktrTg
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5840a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TCVveBvLx2__rFtw55MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036

On 11/12/26 10:15 AM, Bartosz Golaszewski wrote:
> On Sun, Nov 08, 2026 at 01:23:18PM -0600, Bjorn Andersson wrote:
>> On Tue, Oct 13, 2026 at 01:34:45PM +0200, Bartosz Golaszewski wrote:
>>> Note: This is v7.4 material and depends on several patches that are
>>> still not in linux-next. Sending it out to solicit reviews.

[...]

>>> Dependencies:
>>> - PMIC DTS: https://lore.kernel.org/all/20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com/
>>> - FUSB15201: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/
>>> - USB PHY clock fix: https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/
>>>
>>
>> Figured you resubmitted this because the external dependencies was
>> settled. Apparently not, so I had to back this out again after applying
>> it.
>>
>> Please resubmit once the dependencies are in linux-next.
>>
> 
> The only thing left is the FUSB15201 series and it's only a run-time and
> dtbs_check-time dependency. Can we proceed with this or do the repeater
> bindings need to go first?

We could pick it like that, but Krzysztof would reject the arm-soc PR.

Konrad
