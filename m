Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26175478875
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157882; cv=none; b=bQvB6nFn7JjmsTLUeGxa20wvLQNk/PdZhQSvzeV+Zotp/uuPuSWLxx93kjrN9y9749TvLKQKDfmEInnVmK+kbDshq0qo/Ul20IJ/xpFC0SGGZCL/B+0noLLvxqMjYRkQvlmXJu/du8GCiYe3ZtcEqn7SlOoyOjkZekQY8kW4VbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157882; c=relaxed/simple;
	bh=FcAC2kL5ib53ysCba7eguY2e0KmUYIG4Q4SdHWnMupc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iq+93od1vyarlTaa+/eG7r8zZyeb2z3edk6KdaqBSMo++IldbC3l4o/xEle8cxDO3K94/dquXdCPBBq4A6wxFL4gnMaH1RtyXnDlqdrhCtt7FGvjM+z/g1pVZr+BIKOIj/nOlQUuA7z/x+h+6X7/jLzoTfFLbPLE87wP5DJPtUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSPNKGEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BP5uNvXM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSPNKGEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BP5uNvXM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2eHA2821210
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=; b=YSPNKGEiQizfoukY
	R2LU2Ai+RmE3DNItr0XCdVGKUL3jv6CXJKcn+1Qk6OY3BM/MXdTBBiRfJTWIEXUO
	xayVR1qrISBnzNlANEMqG164nCrAnLFL/ebbdnAbiTJuWOPE/UzWQDO4sucIlOZn
	/XN6QhQcvMwW0jZEP1+IS/SkYrOEZ4ZiA/WFSF/LuPwrjo3JKp4Lemto9kbFpd41
	Vm5CN8Njq0BhcbS8tW+GaVWQzeLxycQ5n7qtM7tfJCAU0rVDrffQ3HPoqsxth85X
	kxGRE40s9UHSwXMgu7q7ZqbI+v9cJpUEGjX36Q3PzMs35RC8aj0HGX54SJgONMzr
	eFNhmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwar7xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:04:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530e0def61aso2197051cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790157876; x=1790762676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=;
        b=BP5uNvXMYpEKSD3oNHgNlBBMcpP2ChCh5lVHh++f5cVeLWNTS8nY8mlKcEod7cbxfd
         qi4TownxJQjWIGNavfGg8a+mqJg1NMmhKVESP9EuhWZTwWu46EWcJBiDzju4PsPpntbH
         /GwyzsvTzFbkcAsdZNuqfOZJ/2uxxlMRO4rVFWm0pa0bTzvSPRkFlFQVf+rYsOXnx2Z4
         AVDveQmi8ttixAcv8O4cewXJd8UVuYWBQtppOQPvkkFPjFDI+VPMH1i3jK1/ov4zKrjP
         v5KLwZlfSIlEsrKFRqtBB51IOfXuDwTaQRXc0eG5/8k9mhOQEwL4ArFCUttCLCRcRa3B
         oasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157876; x=1790762676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=;
        b=1lF4BmtjNsTjpwGuJ5jF5mbjkQsDaQrZBU9xPYpg84MVy6JRig4bSHRV4/8LMhYz3J
         mZkmtd+BT/rik+8eM+yIwdiAb2sDXdu7IBVZkngBU+IijR6SuIwTO+IjZeVfsIr5fx09
         JJmOweBdHnlBzCkaL5Vm1PZCuFDSjj1D0UwdxRHyGXObrtVHymKHMVlXO2AzL+tg4hq2
         mPdA3NbDnEomVVNB0JEtBFsCkiz96VHfBYMG3OVbbuLLnjE7RuQrhVe/jDo7+j/i5Rje
         g5jX8kSDa3Si9+da/K4VTqA7uwy+BwwzCWtqH9EYfsWFwqb7FRynmVJhmbvuOPFBcOKS
         M6ZQ==
X-Forwarded-Encrypted: i=1; AKwUvByC80MS5ScGjQddByygQfRX57C8YLlI7QNo+aYp3B5lsCUN8OOeoHDUOWEXpG6cwSIqFaElIzUKD6Nu+MaV@vger.kernel.org
X-Gm-Message-State: AFuF++l+eKdiLCF8+6QtuEKww7B5MXs067UfbhyzAJOOaA7zBA7EsdDj
	3PDt35qc2KQstHG/ZZYoah1WbD/aUgMxjsTg2+fREC7ixBSQVUZHydWld0ndRNsom4EzkJEPKkc
	y45N1w7piGy789Pk06MyuXk47JvzQPtle59b7qp370kEmGsIHWBABUYcvxVHK0jV9lJ3g
X-Gm-Gg: AYBFou0X4ZIACnCPSeXZBkZO0wbmOhRp34VmJdjvXm/u/YO6kjaIz/DBoNwnslCQeic
	onqWh2vNqiZaFB6dM+J1ydx+fD5ggDotX2ljPeXJlFaayuGpPN036wxZHDS055V17GDDCFkfzgh
	UcKhVSBDuIANio95hL9S4p1Gvcs+yl8L16xBn4p56rnR5U7RM7mkWc55E/iGCOP5akDRT7RlYTa
	B3qCmc3MOq09Sev3voKvELw6mOBTX++xappgAeo/U1hzYiyFl0iZ7ZMLUX2twABI7zRHabYZPfl
	tF/5NS0K8cSObrKuYv3oUxRxuStGWyikyVXJgte5eGVPWoSKNKDQNjo8bHvnRKbFrlT79KRsalU
	H2JOtNaCTqeg28DM01YNuIA==
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr27443106d6.3.1790157876181;
        Wed, 23 Sep 2026 03:04:36 -0700 (PDT)
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr27442796d6.3.1790157875672;
        Wed, 23 Sep 2026 03:04:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33fd11sm84954966b.7.2026.09.23.03.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:04:34 -0700 (PDT)
Message-ID: <8c9777c5-f323-406d-a996-17bd1a5b8946@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:04:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
 <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX8mcVerbO5bqp
 WV6hZOwsL3CqcGcJ1ogarZsxOtxHTI2fOSL6xeW6WoMIk4BNO9fhMYfzVK2q0y9j9YPWh8QFkTc
 a4vwpJ3bDWvSSSVB7TyMWO4FRlRQ7EvYUDBcdWHS9PCqOb+rzb1aRlnOqhsc++k0Dy6V0UkKopL
 z8w5gbOpNdzS3zc95vl6xsPEXQ27+F9bLRhE2me5U/g36GzCgg0TW9lf4mIjUVcgxk/4h/A2VV1
 x8m0iAETLx3ywZygZPYPYuEOV0ooU+Hx/hlncIpz8ftKCjyo4SpkDaMWPc6uOrKsiwI8dtnqdTm
 vAxD+UmsIvjZggezilu5GJ8bdIFW0HiCS82o+HGLi/L5bb7ggn3uGBVrkoyqLfY2B3UyDl+wBBy
 KkcpUtkmhNBYce4kI+AnmP77qhG6lYpYLWku2N5Ypmd8WNxdOggiu0U/0PTF5dt9+NGYd+FAfxC
 yXtBF/lNrurNwJ6c7zA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3a434 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SILNe5Qj54eFSe9Pf8QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hp1gj3U1ptJwDiZamoEiuptGlMd3h5Xh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX0tfIunwlXxK9
 V98mkkI4lgrUbaWkhfoWhS9AKCaTjkL0CQxCnzYsn8XdH/BzjfXXc+jqWXL1hQLklYag7c2nBF+
 MQe9yvz8xTTSFQ90GUlebuZKixbe4u8=
X-Proofpoint-ORIG-GUID: hp1gj3U1ptJwDiZamoEiuptGlMd3h5Xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230040

On 9/22/26 10:31 PM, Abel Vesa wrote:
> On 26-09-22 11:33:38, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Glymur-based Zenbook A16 features an Embedded Controller running
>> custom ASUS firmware (which is loosely based on the reference Qualcomm
>> Hamoa EC one with a lot of modifications). It provides keyboard
>> backlight control, additional temperature sensor readouts, fan speed
>> monitoring and a number of miscellaneous functions.
>>
>> Describe it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> index 40433dc2d6cf..d3356fcd25f0 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> @@ -670,8 +670,19 @@ &i2c9 {
>>  
>>  	status = "okay";
>>  
>> -	/* EC subdevice @ 0x5b */
> 
> So what is on this address then ?

The driver spawns a secondary i2c device there to service some
of the EC communication

Konrad
