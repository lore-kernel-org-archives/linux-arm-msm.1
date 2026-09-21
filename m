Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07F445D91F
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981494; cv=none; b=buXCEgte0ML5fo3I1VJb7me9QOz5E0CwDyOwTGUlpExwkHVfKg1i17hwuyuSpGU5X0CGrt6w0Z3lF6FeTvPLiSbLvVElFbguJ+BR89Fr6Wyv3seGAqaA25XYwoWSnI5oc/6jdYsYQniecEnW3uBmybdXpCS7tQqlp4Frv71Wxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981494; c=relaxed/simple;
	bh=jEBYADh6Pm/QgGCjfLduaVA9Ni9fajnnIW9LNWroBjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2df7FIDvi9xy8WcI9+LTeHtcopQ3PvqMhdycI/FMA9AdnqASYce+sio0sfBVlWPvkSiOnE0d9b1Oapiv/rEWyg5RDomTaFQQmafrB49hJdhPmBhaQA2DBH86Xt9ONYqyJcjTSoq6U7NY8abL/xxrQ9O7o0ebh3nGzVYtU7XiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkPtMe/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQQLsGhJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkPtMe/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQQLsGhJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7APCd371186
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUUrFoUQtlt0KsTR6YssW33mXsm3wZKqvH/mh1SHp2M=; b=XkPtMe/d/BiFeryy
	Il9alrrYeU2wH2poyyiJrM1J6Km/mExrhoJgepvenBnFyjgzLdjtyPHH3af1DdR0
	woqDvDDxIs3VC+M4RiCXdrlBcSeggXfDU4aBEw2RVlV+/YrXp9NLe6N8jUInoPXO
	nIOxW+BKOe32boAdTgd7wWpEcqddsEUeHSbLTj5wn1I372XCXf+JoxeWcgAAUjXg
	W3ulbYIBYSp4ymoGzri2i4Z5iMxF9isRJoISg54oN0/1GSIhAphxOYavaqpndDR3
	qQ8OdUul5S3pkHoLcVjrMtUy33rNzPurjuaqVNKyzZLiYHnWWKVGEl1f8CzhSyLi
	JrZ3aw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5h08x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:04:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d04ab694so5343001cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789981491; x=1790586291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUUrFoUQtlt0KsTR6YssW33mXsm3wZKqvH/mh1SHp2M=;
        b=OQQLsGhJpBZpbc47+2aHj1S475Tgy4iJKULjTZnqTEchz/reGsi1PrBU0lWEf1/cMR
         Nr6Yi6tyGlH1x0FjuEVrlk9Y24c1uoDxGA953O/T2XwHrUfDfxXMcdmQPfflOdM1tkC5
         W7zZfuDQwtebVC8ZIJc0rEBAFbg5fGC2PDHNBFirGksryKWKt4yvgatvrXaeCq9LC+o/
         V9Lf7W8eKVk2dNBSSHAjOL4qJOY9u+AXQ/5WhRwD3RLPH72HrKHh15rvPdoPDxlSEwkX
         k5E2/a27dnYsrZ0rysO5ME2Y4QpfR8sNNPnJrQzwOMHnFEOHjLNLK4inwQpICpPc4oi0
         CDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981491; x=1790586291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUUrFoUQtlt0KsTR6YssW33mXsm3wZKqvH/mh1SHp2M=;
        b=yNwn8TEoNFdPMrqaY94tXp2zahODFk5Lqc/KntTMdTQkxqNXdzjxsn5ud2AzT285fF
         1uiS+0rDUFQmRRo790OgFiz3Ci0rZNjEbj/+SJlUJt8VRc6Q+FR535fNi95wy95emSGN
         YdJ2+vwN1AGpdBGAb647TK36655OqvNuROTLaUcANqJPiILA2ovvpnHx7ZN6uJDsUb4e
         o6cp6FtCtEk+WHwpgVZ++MAWG5K++U8B2OxVWtj6w5WNqgEGVXRo7oGJxELfzv4hVayl
         1h7b9m7zUXGUfFTKiAkxoKJ7pkuTRccZf+zcCGWtTT1Yf8brUxJQV1zkxG3fgiMuKjC9
         8VvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIsSZfk/yIxxYcWv397Y1cpFGVE0Iw7BmjDgO+6gqtmninPmEX4HdsugzhsKl1s1ANeprJkmkW2HnM8296@vger.kernel.org
X-Gm-Message-State: AFuF++mm+dnurtO648HjJf1TILUSi/EiZnJlQ2ID+eG9MQC1AnYyZR1z
	EvHxTEGi3I7V8xD7atpSEpD/9JhtG11lo2yB5+7P+57LnvXEjdoU+WiSjLjLkgInqF9lvF3Eo+Y
	gKi/Hft7xaI06E7MMWgfJVxxTmimvgubcLMKJ65RQ+zje4RBS4WMjrKN9KYtn1akQMEcb
X-Gm-Gg: AYBFou3JBrmkh4F12ocUL0QHc29su4l5wF+2YZzrpxtpITwmdcEYNim8GpTdFJfnmMB
	QbZ9+KvAC1EXu7pKzvrOmZJHDmiBmHueBwP6JPdZmY1dB+kNV56IovH7Z8IoU19KI0aqXk83zBq
	iHmRGw0FlV3kfz/6T5SZfheVqvmARKqMhzhLjMpmvWHbGgt60WiL5V9llUw8qxKHiUEbi2rsv62
	ZpvZ4F2VgzEKE7nyy+7Lvp+YYuMg6CEXxvfFZ4zGRewAK8Y9mC3z5ZB6Y/RAH8TSJBm/Cr/lRHK
	oRgCtqsMnoymR1v2a/m9vV9J7ce0JcGQNJXGMX4pRe4Pvx6bKE/sj2vZxu2SB64og6YMspDYFU1
	UZtg0eYrOJuBZBp2zCpHJrw==
X-Received: by 2002:a05:6214:43c9:b0:910:2f02:8c4a with SMTP id 6a1803df08f44-9129152c8fbmr111423376d6.0.1789981490935;
        Mon, 21 Sep 2026 02:04:50 -0700 (PDT)
X-Received: by 2002:a05:6214:43c9:b0:910:2f02:8c4a with SMTP id 6a1803df08f44-9129152c8fbmr111422786d6.0.1789981490390;
        Mon, 21 Sep 2026 02:04:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355eab75sm273091266b.14.2026.09.21.02.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:04:49 -0700 (PDT)
Message-ID: <4fdb234f-4c8a-4719-ae11-96da45d1fdb4@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix runtime PM imbalance in
 iris_enable_power_domains()
To: Wentao Liang <vulab@iscas.ac.cn>, abhinav.kumar@linux.dev
Cc: bod@kernel.org, dikshita.agarwal@oss.qualcomm.com, hverkuil@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        stefan.schmidt@linaro.org, vikash.garodia@oss.qualcomm.com,
        stable@vger.kernel.org
References: <20260917095741.2145688-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917095741.2145688-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0f333 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=JcJ8pZWeGoTqregMEaQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: E_M3ntncx2qMIlOOL5Ojx_4qisxR5QkI
X-Proofpoint-ORIG-GUID: E_M3ntncx2qMIlOOL5Ojx_4qisxR5QkI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMCBTYWx0ZWRfX2Bxu9YC8u3Yv
 bkb5gsDZ27NwZrKiDzAinU2uF8fYo7Gvq4zzDEGK5kgo+U8iEgt1pBpfh6ykdc+peaSSjjgwASC
 dQCup0efDo9GSkZvGUlgQ2ALC8YAwu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMCBTYWx0ZWRfXwG2tBejowB+Q
 cxEIwLwQU7ntiDyn/9VFCRztqXwmuXI0BIpTZy+3hE0voZCoEscNq/mD7t/rWqpJoBhKVOmM4H9
 R+Ym5VBtIa/r5EltOIHcZG29ocouAOS3Ii3ZbZUbHgxu8wjbZbdHw2GjCOYHaIdgETXhBeR3yGb
 /2XDLq8l1KdZha5ojxRE8MjHGAxJzsIplmwWUWo2axYPD7lRkOK+jZHXaP3ffzvK62X0BAM2j8m
 /aaravs+Wsrv3theOmRST6XVpo/mXDuVf5hmf+7JfEAE54mB/MC9YCxYSCkdJE7F/t5GfvoesC3
 Yy+3EJ4TTHoob6PE68xziFFhwT7F7PijNYDLF7fvmZRZY7Eg5ueA8MlgsVVnWG3jYSVIWPE9wnR
 TjYgiAIXMKrnTMiHcT5GptUocqw7IdYXuOLeo0p4StyocKCNw+c9HjRwtcblcc+Kgb8bbt18pvR
 ATAJvQgGjEg+JtZ/SOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210130

On 9/17/26 11:57 AM, Wentao Liang wrote:
> pm_runtime_get_sync() leaves the runtime PM usage count of pd_dev
> incremented even when resuming the device fails, and
> iris_enable_power_domains() returns immediately in that case, so
> the reference is never dropped.
> 
> Roll the usage count back with pm_runtime_put_noidle() on the error
> path.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---

Already fixed in:

f87d7eda07fc ("media: qcom: iris: fix runtime PM reference leaks")

Konrad
