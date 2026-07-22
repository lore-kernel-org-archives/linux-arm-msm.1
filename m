Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25581478870
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708936; cv=none; b=kwJWOLdYwoUOgytcFXsqWGZteYOxCuujoHownoFnmOkEemvOhTeqwZ56U0QGmGLPkSBn+AQk8KyhQtKZXvbADPW5TTr/koeInY6zCD1iP6Nku9gLvDhVrFN8uvX0CpJyRK8arClT6hJjR8JCE63GlaiNLaVG0UM/Dj7dDO566DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708936; c=relaxed/simple;
	bh=VXLOYoIu9cW1rO4KaZ5lyF/7fGBCarE6lL8wvk8ur7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0SQGaZVzodj33CsvH9dSoZFsmM5KMA9YeVzeZAY3GX9ESb02Qeaf0nQiB1K//a2Ttsj/Tto9casJFZ4CumnirT+aA3WdkaIfPS2MGovl9Y2Pez6sD85WLSqaPk1lSUfyynBqONS9/18Xoo5ong0P/cGenDDDecY4bc9/3PTAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c94ZCudb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aby9Y/iz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c94ZCudb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aby9Y/iz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53w4T3996358
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c35aE6SryBwwnRq+0zitu2jQz4nwEm16NKKTzjM8rNY=; b=c94ZCudby5RuWodR
	kbZmsCOP6sPfirYDCFmWAV7LcFQKZoeq9J85PBg8O3Fhv98z5NRbJKtLigtAco6r
	LZSpWyDYZrJMUCGlbPB0e9byvdDf4q871mnwCgyOuQYZNiZH0Q/qOxWGTIubMIj1
	zDSDrgjLOpwY0UiTDH6Ta8XaqNzqW2T6HZm9km6i7d1+fRpQvmhn/W6PVznjxMlX
	A0aJj6AU4eJu4NLq0NEmEWisTaSGu9EPFrAwS3ppVKkDV4PXmvNR5U+FbJYcQNnY
	awbFYnM7UQG3QMe/8er41yjCw8LYrJoq3Il/rsuQNHdp40ivxv4og6xI8W1GjLFt
	eKS7eA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d32m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:28:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so25537041cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708928; x=1785313728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c35aE6SryBwwnRq+0zitu2jQz4nwEm16NKKTzjM8rNY=;
        b=aby9Y/izYlgcISaC8LkKQ9OZXbt71QEo7HJLcQuAQOsQmmsC+hZuINl/wnhdEBJUHl
         oOzWMbM11NvaQvxr7IrA+TWu88fiNxEcdVXIPq79KCv7kdDst0ZyBKcOs3bDawHpQjGS
         br0Yt+wDmWnaC+flvLroeezdYfUpQdmv02P9TWSYMWlF0hlFBs0GOqa6hASY2J1LDVPB
         9VqjKgVVy7x2WFjnBjSfPxO+OSILYuEfvvqTBi3SagfPkNyVhWtPPBgUjSKWP8jLbjuI
         FmhtSwlyA9mg2o6AxcShNS+n+qynLKnWSRS8OUiP3TQbOk8FlxCy1N3AoWZep6GA0k+c
         2gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708928; x=1785313728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c35aE6SryBwwnRq+0zitu2jQz4nwEm16NKKTzjM8rNY=;
        b=mUwL2Z+dTIIuW4beXuBnQHZYwbA0i0oX4mQDEKga3MSa+lx6p7swzqbrA06m/czXUV
         IaFVrt7jOdFHo0Q8mux8q7rf44fTQ6OGH9T8seBqVid0v4oUqU90dxIwiUdS6GKRU0ls
         1Fc4oVAT+4e7Nvdu8SkawXaWj70O/wvoUxvNQZ43aP0QR1uGDIXnsVV3LmoJ+2mFodG6
         9OX/q2LcIOjOpqmMKih0V5dS8cj97sFBblJAZeDwPEYnEYek9RKKjWbBucR9k3SMz14R
         ZsF/KgvEGsumPf/h4eEmkwtD6CvzCjlJIH853PV8kIBCqSzJL8TtH7H3Tog4pCW68Qsi
         jFWQ==
X-Forwarded-Encrypted: i=1; AHgh+RplCnK+Lxz4WGQvrlZiXClteODaagungmZ5QPYciPoeELGMCYJ7sDaKT8zKAkBsuLzKcgH7eGfaewRmow0Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9OqCdKKaVzqfzHF8S8aRsxqLatdtzlSbluX6e65pwUmbRmupF
	IeSO1ms0Zkq1Nuz9SLjbmybU6ztuGIhe+CJNgyN7958RP6Gq/mJ0eWdcUWoWtw8HegJyyR0Tq3s
	E6ezrF2mRRjKM/i5cORTZ5QItGWxdbhVsOdXNKpSU6UKkL52T7pB5KXCiINFMzA26Mo0V
X-Gm-Gg: AR+sD12u386Tq6mO/ArAp4BYuZ1ASogGK0ycQ9TNCwJMwa+x9OUrL4USlbrH1ALPnzc
	uVzar28p9jsapseCQ/hjjpZZeHpPLAtLqDR3glZsg5xAMWeHQTEa9GDQmp5yv771HRiKNPKettd
	pkJqmdeN7TMpIZ+cAnADdYVOJ5myaHFHt2exGA8qCEnkkKAjYGq3S+vFEU2TZBx2w4tHTRiwoiX
	mJH1TernIxfV5ZtFj4M6XY2fuy/UhXI4rMlEqnQaB2EVN7gYSnFGAf/6faA61EkHX54Cfhxrm3H
	ylWa/aecfErBH2xMHlQuAxNuuB25jbcA9JyBpm1bJYbgF2gUKkcucofB7015SqXaL7NAaXxtDoN
	4nPQDo+THelpD3yMpc9rIENBe
X-Received: by 2002:a05:620a:708d:b0:92e:601b:8d43 with SMTP id af79cd13be357-930e6f6360amr573883785a.1.1784708928096;
        Wed, 22 Jul 2026 01:28:48 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:92e:601b:8d43 with SMTP id af79cd13be357-930e6f6360amr573882085a.1.1784708927732;
        Wed, 22 Jul 2026 01:28:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32eb8036sm64553366b.45.2026.07.22.01.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:28:46 -0700 (PDT)
Message-ID: <a60daeec-7cc6-466e-aa51-a6f4aebc8a3b@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
 <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
 <ljec46njfs4j44x7xcmzs7lxrxwz6pm6fymnkrvvki3oxy33p5@pqewduuy3l7f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ljec46njfs4j44x7xcmzs7lxrxwz6pm6fymnkrvvki3oxy33p5@pqewduuy3l7f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZR9ArWVf1ceiE1wGvAkXofNcLz01EPlt
X-Proofpoint-ORIG-GUID: ZR9ArWVf1ceiE1wGvAkXofNcLz01EPlt
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a607f40 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PXQd0foFr0YPLMgI0CsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX0VfQegw8xHc+
 Qsf9HXIjFhiSCX3imKhVP+tNwCj0tm8oxZ7s3AzikAU4yXOroTAs4f0srx5q4HqnoORKSM0ACH/
 TayCezQp7hgHvm1qJrsDZanjonkVb/aFUSnUdli8HQce0Vl4YMLEM2EvGyqaLe/Ltvs0jqHDpSe
 TR69vLqskX93y3E0tiveFY6j6Ggry5a7mJRjA99LV0XFPnUevmEsWME52eGODtg4L5UJRCyW1PZ
 lYO3vIs8Lzz7RkJ6M0Guxf+445wR56kQ2DrLXMfVXKzIuf0iZWhfNMEsc2sY5GEekHoCYZbOjFc
 ULGJFbdwX9bRYhZ+uaYPdTQ4p33K11b33EqYzyeMsOpRLW9Gv2/MyIgX88Otafq+kZABtinyHV0
 SZIrQDjHfh3raXgLILpPXx6SNYVgfAyQvAyxn4w64CgwQNeazrnJl5AnbBS4fNeIjC61sHpGD5T
 i2TPdSkBuY52HuB9YTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfXz6SV+Ag/kjtS
 baRsXzfCgOJvh1j/e6wIdKqa/h0jEcWuFdUp2HzH/gc09IPxERni1AFtqbpBWQIx9XpP+JoIXtI
 7NvDcITxXR1X+XcGx5mTI02lVf0XA5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220078

On 7/22/26 12:22 AM, Dmitry Baryshkov wrote:
> On Wed, Jul 15, 2026 at 12:01:42PM +0200, Konrad Dybcio wrote:
>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>> Do not mark MPM device as power domain since it leads to idle-states init
>>> failure because of probe dependencies.
>>>
>>> CPU cluster power domain node is kept disabled and hence CPU cluster will
>>> never power collapse. Do not register MPM under it in this case.
>>
>> This is only the case on the RB1. How about we fix the issue instead?
> 
> I guess it will be fixed by the MPM timer being programmed correctly.

That's patch 4. Can we test it out?

Konrad
