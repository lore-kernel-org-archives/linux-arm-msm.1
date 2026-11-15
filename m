Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758371;
	b=s411BMR/BUc+fTZn5YVJRbyTEc4ABV3KhBqXxD5BKYdAlVkCvavhCE6uGrFfwz1HcLK1
	 w8npP4380X3ZdROxUeFj8IqI1/mJhIygZX+RK0nD4F/0F/R4la0aB3j5oapJHrt5ISu7T
	 qmXDerqvVB9AXbOddjn6JMfd+LUgN1Bh3ABERItyYRtdkssJ1tCqXPWF3/lsYBQsUJdVW
	 GxvluVFR7icKlfRjjsY6s90I6uTNKHHVWuUe8LoFIiiPZ+nQyLgR79io359lnuHTbLBcw
	 yEhMdmq2fBX8S00XGHPrNwrbCAI4ocsfnWz0VnYycr4oKubOi6JoIMQDjcaK3KKVx3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rU0kaOlqF9hCuvhvsgIDlYklK2QFRWqi/dYW1+IFo+I=;
	b=Dc8qXnmE9p28QTPkrH8HeQioXPKOfAdAjbXkKPcCT2MfyH9Cc7ktOFYHoDvODKuTd0mB
	 aFkxQxdbnjjozszBO1eFfnj6FvTJehm1jqtgz405oDHjyh9iToYoBZ/+eD1eB5/vlJIA6
	 z/GLo+wlJSEYPSlz3jm4h9zfYentIxYwm6GvbgNzeKTvxzDCOW9sRiDPmnyQW7AQGvrMn
	 dL0DmCMf6YZomuIXxwUCp2s3TmD6dc2e2XbVBtDGIG7ReVhB9WxspdKbzD4XNyTrm+xkd
	 uBfZaJdFc9XjvPFMeYRD5Rj8HIMVv/aW5F4toErPY5pBthfJDbhvRQ+ltwv5WRk1grg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ixfoMr+z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y//5Sxd+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D38606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 15:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D38606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ixfoMr+z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y//5Sxd+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFFAlbH3020613
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 15:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rU0kaOlqF9hCuvhvsgIDlYklK2QFRWqi/dYW1+IFo+I=; b=ixfoMr+zQPJ5pPB4
	N3Jra/9kLU4Tps7ooXjkJ16KY+CjnGJSpAb6BzhHiRwrfZdu0tIvNABYVeBzikph
	OE1Nco6B9zP2r/yu4zTkFbH3iE1Mc8AqCPBKIFJCnYIV3wA6M6qgTDzYVrs3NW5F
	fBVSL8F6IW8ImljVD5/xCZvixQdLcGvM+Dbo+lW38Mh5CyrvUzCmGAG6lxdgL/LO
	UmiuW1kQqnkCrwq3G+juHFX6+SjLE2shmtFHGc6aWUd7mwbT6u5EPDzixK/fyP/2
	1655qe+dpmL0LrohoCsU4n3IdZt4Ylg00PHln0cVxLXAOKXPAWONk0wcM0cvIwyS
	44s74w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjucb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 15:59:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so537098085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 07:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794758369; x=1795363169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rU0kaOlqF9hCuvhvsgIDlYklK2QFRWqi/dYW1+IFo+I=;
        b=Y//5Sxd+AU9S5rMWaNS28SKRgN5qtLzGzuiO4ZYF8UT6qU+fVXcWAIuz+kaqfGCPZc
         b3jt24nfFxHiAqYRZo+cxcIxH2qOYpOdOTj9lInruUwG+2ItNZwBkMYzdFhclOja9QCA
         hccUIxD6Q2/Cp3LimHL/WgAhDX4ZHdb1JSnhMstqQ+oVtOOenw2DfcRzVAmg4d4/3Rtw
         Rp1UotJrFehNQKAF2GOJFTrUUV1WM8vmK8dW8p03N0krgjo6clnDCCMwLJhr5XxzLBrA
         7Y2qFW2HxUkQtTdExWcBQQz0ObdkH6u+x4pv0IAe5KGgKN1QCD2h9CeDsQeW1RV4eXBU
         yZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758369; x=1795363169;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU0kaOlqF9hCuvhvsgIDlYklK2QFRWqi/dYW1+IFo+I=;
        b=KTgwJp+o0EL/jXlqqcIlotwsp9ZjXXzYpkv+XDhWmGO62pOwDm2UEvJfcpfeUaSxNO
         Rqp4XMiefwCy6zUQ4BDPTJ4rOVa7xr/5O1MJSSY3uykNJEHUH4RZBvbQkiwfFS9s7+er
         SnaQ1+CMmeFoVPIKnScvye0wWFjxvZIcakE3BWcxrFxFdRImABkv45tnScdRY51eVJRL
         42bi2u0B296me6RixgotIyhK/ZXBCxAih8FHMUMow9UWSn/tsWyF6dBDlWSdypoLnw5p
         Aj9n1ulayr2Kn2CMXruLuuyxNGc5hwD2ZpYPiBm7PZDVnqRI3u0PrJdr7Qo/k/HbpaJp
         oVMA==
X-Forwarded-Encrypted: i=1; AL+hErHx+YgyZ17tMfcGGOV3qV4rk0uDzuVVPvgiOIB302g7H5v9+f8PG7fGJNEfq8qNGMlrEnWzRzeXYJ4H1kSb@vger.kernel.org
X-Gm-Message-State: APuU4Z9VCMJxUA1HIx3vPN3YCTknaZsKgziZHYI+fUWXJoD5mcT3xhGh
	V0zrbL0SW0h5tBTo6jwelmxi/MAS5PCkDahYm6OcYsd2sVQ+USMPP5AxZ2GoK7pbOw8wDvYoEx/
	ZwWIKLj7OZjEj3EznuW0I7iy1Iu+ulnj2JzjuJH1TE6JUQPlYVFB+eGNAO1JAhje86YXt
X-Gm-Gg: AYBFou2/t7zr3RkCdvdB5BilhslRZiu2/rfBRcQZ4crrTpgy1FpcHHK3X+rLlSP/kYn
	qoFL4TnB5sQvyGQBeVZLX1e+hD4FckJU2oa72XcOaCRff9hv5cfwwTl9ofdMhA8xppHbICkVzLS
	1DCv20C44dODErTS/BaXzbOnW4KA9UF33upy7uT6oWJ13Yxa8TXhLUe/EceS0TaRNvrpcFo1WNB
	SDszz2/pVdWXxDJV1MMDPmEGtPRXwa7G9JxjKh4Ul7M3vKGh0EIYIdGwhOzBDRBv2Ress+DcN0q
	fVe7CzUiwNVdCbNicmvycTzxx9l6zZcGf5BD+IDIQw4s5xL/F4bJffUCJlDKIo7U60ckMRg3uYc
	TDcMd4q5qBlMUkbyT1S28+O+PBjwRgzGX8HCal9dESFc1uyIrUk9kkgsHlcw+L/eNr6BCjGuDl/
	Mst62YLYt+SqP67O4G+Fa9V/UlaufvdTZBvM/AgxeuJBj5g0kJdSshi/vPDvClPTkuYlqbgV1Lf
	uYxVvf+oVitsiL+5FHyVDO5Xcfb5a6Ip6BcutRi/xnm
X-Received: by 2002:a05:620a:bcb:b0:93e:c12c:4402 with SMTP id af79cd13be357-9494bcb40d5mr1383888585a.79.1794758368699;
        Sun, 15 Nov 2026 07:59:28 -0800 (PST)
X-Received: by 2002:a05:620a:bcb:b0:93e:c12c:4402 with SMTP id af79cd13be357-9494bcb40d5mr1383885485a.79.1794758368150;
        Sun, 15 Nov 2026 07:59:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611bdsm3439393a12.8.2026.11.15.07.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 07:59:26 -0800 (PST)
Message-ID: <42350f50-d20b-4141-9ff5-bbfad5fec2a7@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 16:59:24 +0100
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
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before
 sync_state
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Oleg Keri
 <okerixx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20261021080517.2161-1-okerixx@gmail.com>
 <CAPx+jO8N4yLD8pZ2vr9_3MD9==FFMdvQG+=1JjDoe2kG7DR1iA@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAPx+jO8N4yLD8pZ2vr9_3MD9==FFMdvQG+=1JjDoe2kG7DR1iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA2MyBTYWx0ZWRfX0U8KwfzZjyfR
 vAi0tyGKx5DXdoQzMQ3smtb06MLxvxGsr+XkHBnI7Ubb07MfHV0ZmjYORE3Ic255OvqXHItTbza
 hhy/AoOPIo4Yuualn9/LL9e5acXsMFbzascI4yE4qZuPCDTreu+rsFz+NiaIKMDMFMMDAuD9OqI
 5XPlXhKtLlnBxcx8UsJwvr06LoBUdRqtJ4KnWCeSz7Vk+7JHMhUxfl0/CENHehtT+VjYEBNf/uE
 NymziHLF3xeUKNN8oFQIOjqo1HmgxXijONFhZgCMdNpeFGy/57UP4h4uFvg5QxqoVZLuikRHcur
 /wcNDru9poFmSvDlNNG9/QKHJp/Q1mnOGmgAM7bybhDjzemJllhVE75jdAaagBuvFVeU2LGLs43
 cNsbkpk4KGrsQKXA8todKw0eP3bOjSXJokCl+lcn2CXCG9bQ0IT9oTaSXPecK4zyq4M2zm0FXEy
 QYqJQPuc+pKrIHSugHw==
X-Proofpoint-ORIG-GUID: Ls2yxlxN0AkpLfl3zMSwF267CjdRsFPH
X-Proofpoint-GUID: Ls2yxlxN0AkpLfl3zMSwF267CjdRsFPH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA2MyBTYWx0ZWRfXxEYEyioXmCbU
 uvtkGwlZjkVGVocyNGrYfE1ODBkmitFIL7Qu2H4f2ThTP6TlQtL0cTmj2tj1hKp2nO//IIIqLbg
 iC5UqNvDz+TTvfv8uSquMA4vuWEypNE=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af9d6e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6R6alxyDzFe-mgSiMmgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150063

Hi Ulf,

On 13-Nov-26 18:48, Ulf Hansson wrote:
> On Wed, Oct 21, 2026 at 10:05 AM Oleg Keri <okerixx@gmail.com> wrote:
>>
>> Until rpmhpd's sync_state every vote is clamped to the highest corner,
>> so that hardware the bootloader left running keeps the rail level it
>> needs until its driver takes over.  Nothing the bootloader leaves behind
>> runs on the GPU rails, but the clamp hits them anyway: the GPU clock
>> controller's probe runtime-resumes and suspends its GFX and GMXC
>> domains, and from then on both rails are pinned at their highest corner
>> until sync_state.
>>
>> On Glymur gfx.lvl has 14 levels and the clamp holds the rail at the top
>> one, 0x1d0, while the GMU's own performance table ends at level 11,
>> 0x1c4.  With the GPU driver and firmware built in, the GMU boots long
>> before sync_state, and its CLX DCVS calibration does not survive a gfx
>> rail held that high: the firmware gives up with HFI_F2H_MSG_ERROR
>> 0x007306c7 (ResMgrCalibrateDcvsLvl), the first HFI_H2F_MSG_GX_BW_PERF_VOTE
>> times out and the first GPU init fails.  On the Lenovo Yoga Slim 7x
>> Gen 11 this means the compositor cannot start at first login.  Pinning
>> gfx at level 11 or 12 instead fails the same way, level 10 and below
>> boot fine, and pinning gmxc alone has no effect.
>>
>> Leave gfx and gmxc out of the clamp: they have no bootloader-configured
>> consumer to protect, and the GMU votes them through its own RSC.
>>
>> Fixes: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")
>> Link: https://lore.kernel.org/r/179248663855.32151.9955864156939592299@gmail.com
>> Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> 
> Applied for fixes and by adding a stable tag, thanks!

Nice, thank you.

Talking about regression fixes, any chance you can take a look at
this MMC fix, which as the cover letter explains also is sorta
a regression fix (the root cause is not a regression but other
7.4 changes make it easier to trigger):

https://lore.kernel.org/linux-mmc/20261112124430.110629-1-johannes.goede@oss.qualcomm.com/

and if your happy with the fix can you queue this up for
7/4-rc# merging?

Regards,

Hans





