Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564603;
	b=nRBqkp6VyO76WVl/SeQ7sgY9lGN16mCHsrjmKAYUoiPwTIIPkdqwn4NUcJ4oqLPzc1sQ
	 Z006pvsXvCIDkZuZSdLxfg1cb/2St4aXpnLS3tHf4fglFGQtjsZUK9z5xx4vh9zZgD0uq
	 C3TUTGdfveBQKr9VW0pcfyU2NQIoK+Rm4GHtcSR53sTBK9TVx+iQU5aOeTyzqeJwzKVjc
	 BxZlqvLJUAwMmyNzDYmQdS/XxSLbz608vS0wyzj0tWvp/3jRAZGNVeP5hMgZKBCSXepxH
	 SXspjjnxlnjMeWNak5nmsNxV9MDNS5CpEXpJWUYjKWDafKfPfudbkyfLYS3cwdV+yKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
	b=CoT49qRM9V/rfxhGKOCPOHGdnvoepGeWjXOsBvUApxxXNAu5xItPQjERm00oGuzFxOkq
	 mEuY01lGMNrNh/cQfuXMouKBC4wh22zCTUl40mZ7fS8ewXd/n/5m9ghV5HsgkMu61NRJw
	 Vxc9Yg2YAVZE+nHtZZAhngi/uS7b9mSDtomvZCrT5yu1mQwjjRJ4z7q7gZG3F8y1zofcG
	 BCvU2mZ/yzxPv9Ijpl0cmMP01tLhnDaY4zYPD7uOa8wrvfJUJYkoySX0R426h7tMp8+MK
	 PEapDwVuXcFuNv/AxWiCi6icB/q0oFeWtLlKmv3j0Zp+PAwsU4YqzCk6E5cDdhQgDLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqZYt9N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5Xf4tgj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E1606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqZYt9N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5Xf4tgj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jLhO2848640
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=; b=eXqZYt9NHbMWx11B
	mEbZHXnQxoqS+81N9BkQhN3YP9ctwTfcUQRFpL4mlOp5wa0/YkdDYZD/cqoJF5o6
	HDkNSAOMUZp/0ky0maFWcd4wWZGk7Q0K8nhHD0U8yTFYWRJrFq0YzTSiMmkCUo1F
	+m3ydB5fVyDdkmwo3CqvQm/DJ4Q46hQuPRJsiwSgBik4VM46prhiq/BaEXZt7UCj
	8CuGn8rE9AXZlaVTpcWjgC2GhE2/Z9A5Zu4bkRfnKn9uXqRrg9d7BVrl560ocD5c
	8nwGk5g8TXgL7CETA392fDYl+YDun9f5DGXgjLvPWnHDaJHlBIuHQAmaIhzaiu0p
	ej9fgA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9a54m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:36:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso646358eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564601; x=1793169401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
        b=j5Xf4tgjg6MmEay67YJtTEv4Xz93x8IVm11M9TjomtTRVwCglACm2+eiKt/jvPCSkk
         lMg9q38hpCgn3NDDr8qzr9j/OhRNxNoRyHMQmZCGMND5txh/Q+kzvBZdHx6pBor9Lz8z
         vkR/clACkQzY29HdfU9tmO1egH340bswMRR9NDuypPQ5qSU50D74CZPcVzA+bNamOhmj
         wAUSeV3vysyNsqRPQaopJ5hzuDJ/8rv2v3tqpyw1y7Z07zRqNsqMsvfopIPhD/GzZ4Wu
         dItNXJyiXCCBO5t+2qka2ixFUfiQn5y5Vi+uacq83rDykgi6bjAoVbc4bcVFoN5/+YyS
         Rk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564601; x=1793169401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
        b=EMg5ojRQQajikbKr49o5U/TyD8EbGdo2V/9z9WM9B0srtzlgo6xC4Kp/CtNKFOTnfb
         ChSLH14vwWxbro+SBmuZE9fWoAgjoobQ9Sb4eSpbEVJybCjbWTS+kBGcHI+RvCSzFZ40
         1Aw79bQTZL2gCJldojP9qvZv3GvDqQqaNARZW6bYs9ACXmcUBlnE4AW8kaje7/JCKEgq
         sRhim63ztw+zDr2JhDFAY17gbP1pt1RJ05nFhOpBApVo7VV3nCrJlTJ7wdnlgislm3f/
         z2meQpMjK/b3HWAiz2kVeqxGHCJnWt4oxbdU2oYUIK1fB2zzDahWYgysX/6QK3mYuevo
         qLmA==
X-Forwarded-Encrypted: i=1; AKwUvBy5uKNBWkg421ptNmI29T7HrCyNJpxP6TG6c0asr5PdqlxONIUE0RYwVOV8h6VjsCuju27PzndMZKFZM9FR@vger.kernel.org
X-Gm-Message-State: AFq9FYJ764kUJI9bK/f4nddhL5hjQHqNGADITTGHieSSDUY9rHR8UJSE
	f9zDOawLwZ2K532iOa+pi3983SBiRoFvgcjixVDJ+NbtI3PSlBASXC8wQXATNm3Gfx9U547M75j
	soppF0rMiShsuTqgsMfaVFsjiq/I/Cl1np73z7vrzhH9yh1b9Yw2li2FDE8SQ2ahO3HQu
X-Gm-Gg: AYBFou1cvg4CdXb1HZbkb1culzxNSHJFWfnIMa+Rfz7ELrphpYd4CUPBcyfUh6JFTrQ
	WiWh3E+K6xsN247YBcyGF4M3OXZLYt6BRANc3GileOS4f/JlOrrfGNRFTvUjtvV8UNFLTjrwHcR
	zZN9kihkXKLflRj4gEnFSLUIY9Qf42NbTjTyC/BRCFFevVWFKkwLN6t9pBpM6zUDK6ZHekbiy0x
	Qd/BgV2MN823RQTQE5MI4k7bh/tIADe6DHzTjRmCJQvEsAavFX46gdczpZ7pBC4kMKOM3wonpqm
	MT9ZIYWG8RGC04aFEnVyu5R62xMebM43HbLs1Oaxw/ve6OSUFS3pGjj5/wJPL00JQjVRsLhRkdp
	ywyhLucOL1VSX4cbL4SIW
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr2050303c88.2.1792564600666;
        Tue, 20 Oct 2026 23:36:40 -0700 (PDT)
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr2050272c88.2.1792564600108;
        Tue, 20 Oct 2026 23:36:40 -0700 (PDT)
Received: from [10.216.19.242] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm5544025c88.12.2026.10.20.23.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:36:39 -0700 (PDT)
Message-ID: <cf08ef44-54e5-4354-a553-9c51f628f864@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:06:34 +0530
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
Subject: Re: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
 <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX3/9SMeQ4SaCj
 LiM6cz9EiMSMd4kscq4gTiYViydJcw+7VI0k+gNliW7p01R1tzWUcmPInfEud+L6UqtICcl1suH
 la0SFX3H6MAFRLjLEUW3JbS0TOHl2Mo=
X-Proofpoint-GUID: v8QxPKsvCugHTTqbwgBC2zVKvuODwN4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX+HanYEfXBmoR
 VgmJ1yUZWZNTj5aBMG20WCzfHk5ueC5b9ZJmn0nG3ypb6G7KdhAt0FoGy/mKrSK2NUw4Qhnqnt/
 rt1uYeQWQtBkC2keoKkmwbf8IvxMIC6LCViGoCW1e0+N4PgZuInp5iEy8MBQnOUMuyPjOC4QCI2
 pb275JCgIuWPpXAc+Q65Y+1y84Z/VlCXMMKilfyejGzKg76nLa/NRP6DsbK4+TMtqz+Cmc6IoIS
 43ebyrsuDJHznSOWkPx5IQF08RCeWisGy0yxsXGyDFfwym1I8eH1A6RCZlyBDmtDnqQiu/WjMpi
 JHCxxvojTh7gsbLQhWygOgFUnJiMuyqB9+0LyAUDbZLTC3ADJr4OgsCI0ph9gnVpdWYQ7cd+q65
 IwuCtan497d6pKx71NhNpMHQVCWUjAOxq7KN+Lc/xf0SS0jW6k7YZuiLki721EJj/+1q6MJlCX6
 k1A/RfEtNIrhIRnXlHg==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad85d79 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=j2EAsdPlCOniiROzf4oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: v8QxPKsvCugHTTqbwgBC2zVKvuODwN4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026



On 10/18/2026 6:19 PM, Shawn Guo wrote:
> On Sun, Oct 18, 2026 at 12:46:47PM +0530, Anurag Pateriya wrote:
>> Add the SoCCP remoteproc node with its firmware path on the Nord
>> RRD board.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> index 47978df0af92..89f8d36ed812 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> @@ -434,6 +434,10 @@ &spi16 {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_soccp {
> 
> In alphabetical order, I think it should go right after remoteproc_cdsp3
> rather than spi16.
> 
> Shawn

Yes. Will fix it in next version.

Anurag

> 
>> +	firmware-name = "qcom/nord/soccp.mbn";
>> +};
>> +
>>   &uart4 {
>>   	status = "okay";
>>   };
>>
>> -- 
>> 2.43.0
>>

