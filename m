Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816329;
	b=i9I6M7ckX01cIRuDw3nCfIWieTS0C9I7yl69jpb1MG+0J4Flqt4RH9S0AmPa5JHGoQpf
	 m4o2ylADZCUqvOmceTMVu+sOJbeNjHrtn4J+D76rdHzjYY0gWtICf6YGJt3CvlnB10r8Y
	 zq8/4aZDfzGxYRE7TzxSeUyfeVVtD9INRGlm+kDyU87rOD7iewgT9vF1L8QX2lfwyBDb1
	 oy/CBOKYbk6337DzWwPKKJXkURkSFgx/EpROVyCQyXQWYkn6zxKRW1w/6v/kevB1JE+JX
	 9WDxP2abRVCqv/xOCOoDWLeTC3vjCkzPmfj7DCYa0TFu36JqgiEWzFAPiFc+e6UmiNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XVFz9C+2CptBLlpcJnnRg89qTX6lg0FjVcFiDt+w7ME=;
	b=bzdk3g/FScxDMYRFDIb01lUaTSiYEjM5UPu/U5a+chvitHW8oC/iQpaYZI7IJvVpY244
	 vvWEB3J0/ZdFyGZRXtrht1yhWeyM9hZ2Guj/66NDcwrJz9sHJji0x9TOz+lpRZ1ccoK3u
	 Quv78ODwQVY+SCd/Qm87P4GVVSQqiaRPyqFy+uPsUVJFVa2PvF4II3CUwWOFX0LQu3JWg
	 WxfK/Epmv9AmcXgfDSDCBvydiyt1tnj+9aHm64Wj8Bj8Kt7jzBuEU2NOcwJQGntwu4pJ0
	 6U86MklOu9a4tEKSZ5i8BCu8BrxfHAPk2TegniBWM37LVHIJHhwQcn1avCuZHg2Y5pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWs12k+x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWCpUx5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E75D606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E75D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWs12k+x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWCpUx5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7erW5903109
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVFz9C+2CptBLlpcJnnRg89qTX6lg0FjVcFiDt+w7ME=; b=MWs12k+xdUeW7raB
	CVJo6RMai7ewpBdgv/jMet087UbbyYTot/c/J7xfEPhRWxz3cAYMnEUsyrdWgl8O
	/LFOBBB96M2CfIPWM98R7IKkWzp1I/j+5PPVnJb1Mwf7bAnzMXjfidGsnjkmwEmz
	DlfgcYD3GH5BMJq8H+pdcQUQbnqFlF5jpHkkm6j0Z9AqPdcAytF5AjqPth+XaxZ5
	wT97p67cU265amV8C/m5LuIpoufE/G3YnwZviu4n7UqYKfdt8Q+eSlcFsCvR6ynb
	ILGtQXTO000c9F5p1EI9FVIR1x5E9Ksk3i+DLc1FbWTH+UjJxXf8/GqmNgnpuois
	d5Rgbw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjwh2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:05:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ee30bf935eso728772e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 00:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794816327; x=1795421127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVFz9C+2CptBLlpcJnnRg89qTX6lg0FjVcFiDt+w7ME=;
        b=SXWCpUx5o+laRSbzd2svgln2riTFNRf/b8S8MLXSQlfX78QXi83fkeg50Upi2Na9De
         wEmbGKWeNb9OY+46FnWSca0ATbzd6ky2e2GdVw3ZI1FPS/hZX7SmB8QS9c2kND4vf0TF
         nfEtmsgkc8+mFoCyWr7EdB0LSL4boHvESKyN96kHvjC7c4KvwrfkG3TgGizpgVZWXhvj
         gkQ4ZcRtSWaBMBA96UaN43NKKvxaufk7/Up4FxGNHUvah233ZDF6w8Xs+6IbRJb1he04
         g+Ds7yWuX8pfELYhK6Nmzs7+o1e61K43eUMZoN6zr0N/7tPHk4l7xE+CBaOv1y+elPFV
         c8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816327; x=1795421127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVFz9C+2CptBLlpcJnnRg89qTX6lg0FjVcFiDt+w7ME=;
        b=jJ7Iktd53bWq4yPMcFwC4GkqqxgaIvXLOoJQQQLtPZ80VehiENA5aLwx4b3+0tm5JW
         lgA39rJzJP5O5jir2GwShWPfrTftK9w8AcLCshM7tG62me/siRsUHhdxG4sjhT/OWHHE
         iRgmQ5BV7uGZJsBOUSzyg4U+/23Wd98gOMCwn1wyBpJWQUi7J1u406/Rd/GukDCABfmH
         CbxEwtpmEthA7qkPSXG3VzORCfXXAWthbQtgf55OIBjv8gZt7qHbeszef2PC39UCF8Hx
         vJ7irWH8VwBq6WlVwxbElthkIlpk9zaUY+hBarhRPCIEcH42FV9mM5nAsvW0H2R7Ineh
         nOFQ==
X-Forwarded-Encrypted: i=1; AL+hErFZJJxBt+B6/gIJNF4VjANSp25WLXvgnOODHRDEgyLtqPJb0iAMNXgvBuiG8Ds8KDyCOHymulLqPJ2rmBvq@vger.kernel.org
X-Gm-Message-State: APuU4Z/fZTASQaFjBBzZvw/5S8m42aruAVhw5mDtuqR2YJxt7uoQHNcG
	umB9qnG7GpczMDKTMfO/aLkrM/KFIskb+I29uwi8euuwreJQYh/Gh2x0/X1tlI3qmZgMCPlLOfB
	NVgoNel5LGT2gQs1iOtnl1bePBlouZflRxHwpkOAbDsmAY1COfR3SRSAVjt3DFE3I3ivhABTMUG
	rJ
X-Gm-Gg: AYBFou0/U6kKOx7XZWEd/aDwRIrEFgw0rsGUcCjV+yriyslfYQdtLsMbuDpDDtRgAm1
	IgcdqvgxUGK87dD2te0Mx4bXLLAoK2yADhkaYKDZf9TW43gz0D8WdXn8dHZK9BowuVnYZEkrdku
	d149E91TMjx4ZAw8jT09im7lYjsmzFRGnKit2BpzP4JyFtlbIe2lvyEy3GXML3T1zQ3VtUgmg1t
	szR2CCW4yblHlRET4kVYRgMlf9zvO92A4OSu61m9zXaqru1klgkyBFwvVNgReJzuEPCmZh8OoUj
	GTfCePi8jb24XDJwQd5hzTswVJBUjl2lzdp1ZuACRN3etMaWelcND5WQvPL2J033KyIFkfzrBFf
	XyjPM4maKcKtAXhDWr78R0NA6YWVp1aDgQabaiJYkG4Vr+uFMRrXvUqaQ3KUzuVAxIN7KPKIkwn
	q/GJx76Ev5YgEckw==
X-Received: by 2002:a05:6102:54a3:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d64d12f547mr2599469137.0.1794816326993;
        Mon, 16 Nov 2026 00:05:26 -0800 (PST)
X-Received: by 2002:a05:6102:54a3:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d64d12f547mr2599460137.0.1794816326493;
        Mon, 16 Nov 2026 00:05:26 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm136597195e9.4.2026.11.16.00.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:05:25 -0800 (PST)
Message-ID: <04db2c7c-b9ad-4c10-a7c5-117e1a2db414@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:05:25 +0200
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
Subject: Re: [PATCH v6 0/4] media: qcom: camss: rebase fixes and SC7280
 enablement for the streams API
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ravi@ebytelogic.com
References: <20261021134959.2599575-1-hitesh@ebytelogic.com>
 <20261116054402.234004-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261116054402.234004-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMSBTYWx0ZWRfX9vqIINxPahAU
 t4Wwq+hIilX0q4gYylo0c8wOc7nD+pst9xUIXggbd/uHOCbA8LEHCHvDgoVArTZ1Qbc9FehJBV4
 SV4/oqNGAgjpQYlgjzEYTSUYpRmrLN+sJuBsh8ViyyWSPEXoIecUQjXGdDMi2U88hP0sh2tH66j
 DWQ6QnGTBk6O6rF7bZK9XZmI6kGXWpJW9M59QWuqv2WI44RUhhs/KgPZbKlz/dBZ11z/WIneWRB
 jSCvmRKEBeATgCwY0E7Khn4ayzmrzdAwTlWCxoKjffG8OPOBxoOl7QN7Lhf6ldGeDx8F/tV9zfS
 EMrh82pB0JzyW2mAYnMZ1d7NYJ9UfxpNVOVjm6L0OuDUDmYwWWOYjlNR1MaVKAF8CB8laF5ErZ/
 5F1St0aLDYOG0rmrSCzhFjCNdITNfl3/oCLUZ0J/4xmkwfjO1FkoBn8PqeP32QoRc0XiW4cz9vf
 cVOonbzvchX+OLvFGvQ==
X-Proofpoint-ORIG-GUID: Jvfj-CYWf7ac_fbswPigE9GBRn3z1eIr
X-Proofpoint-GUID: Jvfj-CYWf7ac_fbswPigE9GBRn3z1eIr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMSBTYWx0ZWRfX6d+mIJU3uRtb
 /JERZSyuz/uUIMRpG/RrB8qGRbRoAgU2HkJMXK/DjUsnQw98vfvSh05ikKKqA1Bby1jqTpt42Fa
 Jy2GOgi19YijAfsAhV6XpQvux5B6Gws=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afab948 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GYxySZPKsXQMR3QF6vMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160031

Hi Hitesh,

On 11/16/2026 7:44 AM, Hitesh Patel wrote:
> Hi Gjorgji,
> 
> Just back from the Diwali break and catching up on everything that
> went quiet while I was away, so apologies for the gap on this one.
> 
> Back in October you said you would try to include these four patches in
> your next series:
> 
>   > Thanks i will try to include your changes in my next series,
>   > it will need verification from your side as well.
> 
> Is a v2 of
> 
>   [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
>   https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com
> 
> still on your list? No pressure either way - I am asking because I have
> been assuming these four would reach the tree through it, and that has
> left them sitting where nobody can build them.

I am working on v2 sorry for the delay. I am almost done and this week
latest they will be posted, i hope this will remove the need of posting
re-based series. Note that the patches will based on top of Bryan changes
for the SOF event support.

~Gjorgji

> 
> The practical problem is that my series cannot be applied by anyone but
> me. The CI gets six of your eight patches from the list by
> patch-id and then stops, because my copy of
> 
>   [PATCH 1/8] media: qcom: camss: Add streams API support for CSIPHY
>   [PATCH 2/8] media: qcom: camss: Add streams API hw_ops to CSID interface
> 
> carries the CSIPHY rebase we discussed, so its patch-id no longer
> matches what was posted and prerequisite-patch-id cannot find it. The
> result is an apply failure in camss-csiphy.c that looks like my bug but
> is really just a missing dependency.
> 
> Three ways out, whichever suits you:
> 
> 1. You post v2 with these folded in. Still my preference - it is your
>    series, and I will test and send Tested-by as before.
> 
> 2. If you would rather not carry it, I can post the whole thing as one
>    series, your eight patches with your authorship and Signed-off-by
>    intact plus my four, so that it is self-contained and the CI can
>    build it. I would not do that without your agreement.
> 
> 3. I post my four alone against media-committers next with the CSIPHY
>    amendment included explicitly. That unblocks the CI but leaves 1/8
>    amended in my series rather than fixed in yours, which seems wrong.
> 
> For what it is worth I have your eight rebased onto media-committers
> next and they apply cleanly there, so whichever route you pick the
> rebase work is already done and I am happy to hand it over.
> 
> One thing worth watching: camss has had a lot of traffic in the last few
> weeks, including Vladimir's CSIPHY device-name change, so the longer
> this sits the more rebasing it will need.
> 
> Thanks,
> Hitesh

