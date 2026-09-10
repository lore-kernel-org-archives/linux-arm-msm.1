Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D45F3D9526
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031980; cv=none; b=qc+Jw6oYaiS1vEq9FmkFRC+oe7nLWw2z6iG+eQY0dix4Iyi8bxD+rJeCCVDb6z0p0rOKAKTtiLDIiQ6baylpAM4wspN61sCkha94g5SdrKtTKmlTsuN23+RoImon3SQZyXiXQ0hD4p1kz988x65SEH0rmmLpTmPStr96SpcmlnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031980; c=relaxed/simple;
	bh=ESXLYzb3JTJ09wZ1b2tTlT3LLVkVF6VqP9DwTjEEhjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GX9fH4x8gCL62QKJjEi6bwCVfyhb10ZDXFpFtTD/CtV0m/iBjgN0y8p82VuB55RSfLqUGSBOr2BOAKlNj/EljWYMEId/cgE+TW519Exp7/89GEj2qVjSx/0GMyEXmUvtQlTHjiRx7f8/RQc9oriJKrHYX7L19jjtA0hbcp042yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHhhVjrN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpzQ527J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHhhVjrN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpzQ527J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8poBV340809
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=; b=jHhhVjrNUw1iOuwP
	yx9xHNU68EVXImp3wcBTnlUMPowCBALxxLu6a29zK+eRU2e5Rm6255/lU/M2YnMh
	0dtkZXQ5iLZozDI0a9TZC225Hip/C5slJdg3c+j+EYKVntEDA10rtL/D6smDpSgC
	C2xD+0wdCfiXGEKsE5rMXEgdb2sMKzhE1/YUs98HO1PAdpY1htoxjElG4uMnYFua
	SsO9aV8pGlm6/3twZ2PG1Wvua9e6x4iMwF3ySvg4FqXj8WYqhhAqtmHUZuu9uKXm
	1QSyhq4CRUf+dYbJ4aHu/80efzlJxWWvLCgG/DQmOWCjtCkrJHp/0oHcg77SnbH1
	MnrA0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak8cwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:19:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so112005885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 02:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031973; x=1789636773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=;
        b=BpzQ527J9stfrRoG0DvKFlrtnnAPmE2MQiGbBKdg+5Tt07+C7bQlpUsTIAmvWvfUXM
         RWwsFq8nEm/9BOPiyBP4xjADjLMNwsrPELv/YOS/RAYk1yb2/7OhIu89ENzg9vDOBd2n
         RysS0mZpkSv2wRR0b7bbKWANV2RjQkWVO4/T0v2xqw2T9NsX7W4hx/hqjfy20Dszr5Dq
         /lAiIwVKqD6IfuMkfQvboHaUx7whR6gzMDX99d7Xgb5c8sXNEXAjga/YdKAstZc6rF9k
         cYodwNsaKFVttIanI8fHlk52P+J8K4AD4wPoPmK/QJHEHzBuHXa2WSqkm1tGtXoNpT94
         jmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031973; x=1789636773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=;
        b=Q2F8vx0bqHLXcU2hd8l1algJasSyDCyJRiTgEklfN7lcZ+6HLrW/xUikJA7LgLSa+W
         /POSa5sTKO92TdoiY3Iv/oSjZnDzTQTB6QyE1jXpWb/4kY1AmaprOMeXn8p+gvwwFwKC
         z36NWHKpJCoJ09pByIRsLFLJb5oAzUC/UGd8wt+maWlHoAnb12FMAtsPZl6FVEW/7VHS
         QnbuL7DzdWpAIBE8NLBROKRJGaz1I/ok3PcUFcCwnNHKU9Cwm0tCodF6ywBzertXeSZm
         uFg2dHPb1/WVnlXAFsad534na3TRmLx3tT1o0NUBGBIHvDx1F35Mbg4QBm3cYBxNdCqh
         3Xpw==
X-Forwarded-Encrypted: i=1; AKwUvBylHp1e+9tpkcRqCNvJvryWq2APWJSaIsIEtd7SLn5GPO9hhoq0OgT2oN7B2tFIvHuLTSpXVLgQAc6VHD5P@vger.kernel.org
X-Gm-Message-State: AFuF++m+pTd3iY2fk4FV9HhwrN1aZfmsf1484A3dk242SJawN/FDKf+W
	+7EuTac904JTxJe6ZtM3K55p7eJJO3enPOLEZcri6L/ayOO5JFQ5wN1nbuBoZCJA86GZS1yBjUS
	5i8+jGePGbsx6EmSYgHeIpcuqWsv/oUWmrNbM8eg7WeQ4zo8lwVFNSjbhP8R7z7O9qxpE
X-Gm-Gg: AYBFou2qLi2x3Sb3Ssd5Y0/yNqMOjdO2CBsV8c7GezTrGud9Aq6T/bSLhNVhAz1xDze
	YQOINSLMHqb3YqPKvN9yHKFSgK106aFZ/AXgQeAqgEORBLGQbzoOUxv8fFfRlRzvY645kG3GPTL
	a99lHuZ1azvzbI0PD4gozTCJ5BJpEUGfFMMD9134Q80Qnvdp8IZtu1M/EDTiqMPZ7ortfh9vz7E
	jUXbGTc/XwU+hnFl9VbnlpUWc9PSDGOZXawDyz197hdOH3Euw8NxAA++xwNo4XrEAail9WN36KW
	oivzArAP2uQAq7NduO+5xtBaa415wKRbQZgmwQ0kZe9wY/Za9vCyX7d3YkVtWGkbEHu6Hr1ojTR
	IJV3r8p7cGifJXNjZ6Pa86A==
X-Received: by 2002:a05:620a:2815:b0:939:7e96:d296 with SMTP id af79cd13be357-939d828e0c7mr425484085a.1.1789031972859;
        Thu, 10 Sep 2026 02:19:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:939:7e96:d296 with SMTP id af79cd13be357-939d828e0c7mr425479885a.1.1789031972468;
        Thu, 10 Sep 2026 02:19:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98505ec28sm2830486a12.16.2026.09.10.02.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:19:31 -0700 (PDT)
Message-ID: <6435193a-caaf-49e0-b219-ba91230014d8@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:19:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt
 line
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <178887481187.4612.2819576206036967152@gmail.com>
 <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwMyBTYWx0ZWRfX9Ze/sFiQ4JYU
 kKcPZWOIY1IEp20UGbMwvvNFg8Je+OfTGmv5C7bBn2JZG7c38nrL+1eh9PQxFedg/fJC3SAGnDw
 ulVYfi0+yyjA4tIFrKxJZi+IFQHK7yE=
X-Proofpoint-GUID: krZkTSCDfsmXQrVXKq6i5B4HLkFKSNjj
X-Proofpoint-ORIG-GUID: krZkTSCDfsmXQrVXKq6i5B4HLkFKSNjj
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa27625 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=oIgkIcNInMogrUYK5KIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwMyBTYWx0ZWRfX9AXs0xsR/yRK
 Oj5wLsYin8Ys5GhNzdb9KCZigJKuLlPB+umWr/kNTNV7ZddpdQe9oqQwNNl4Sgu4zMpAEbgWmBv
 sUdP29gPZsH+RbLQbyuruui3OuxZnW0xmPVZ4OwIYN4jfl1aaJzzXbhDhWgNLiHXcoS3M7DtKOl
 IbX1aen4yngSUlJmf8X/H+t/ZBj/77Z8l8u5WREQp6wX6QzN5axQHwPXyiGx/KyszThCC/+jzfs
 ZJmvYikDfPF/vcjmV/vSU95mBwPHNXKz0IsZPtFLE+Xso/5IrXu4jt1sMSXRbxW6oWIw1gHbqOx
 zw6JK6Sybgpy16pM8gSADldCEJZpAAltVij3LFFbRlqCMZRmky27AJOxLFoCezQFvj7yIB94Y17
 ammqeY7CgqYcThCVUJjlbI+kUz9XWsjg+oQ6hb5B3jv+gIGmDU4n3+eR4MZlSiMlJsjYpO7+z94
 j/3y0kPjwHXHjmzQ9sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100103

On 9/10/26 11:10 AM, Jishnu Prakash wrote:
> Hi Oleg,
> 
> On 9/8/2026 7:10 PM, Oleg Keri wrote:
>> Please drop this series.
>>
>> It duplicates, as a strict subset, work that was already on the list a day
>> before I posted:

[...]

>> The camera works on my board today despite this, which I would treat as
>> luck rather than evidence that it is harmless. It does mean your series
>> fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,
> 
> Just asking, have you noticed any boards doing this currently ?

Not upstream, I don't think:

$ rg qcom,pm8008 arch -l                                                                                                                                                               
arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts

Konrad

