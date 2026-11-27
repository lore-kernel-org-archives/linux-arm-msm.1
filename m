Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777534;
	b=SFeQZUFJ0HKcS5G3snuVzrlyC5QJ23XQFcx4X39ltOL9Hc3cm9JBF1aHfPCUQve0nQVn
	 zAsyaUS4QYBXQW198nANnXi4FEN+YRr91+2Ic1JfRLFi6iYZto7IhTeWz6GnLTmOaTGra
	 hFbZzxH2qyJdFlEzVJUS+U4uMqF2V1RTJiR+Oq6zS8KfRIBuv/+2ByzNi1aE2AYA5rgbb
	 fONY6z6HI69F5RcCvG/EACn5r6nFEaXpxkoPALCqNPpQQE6il9HUP+dp9wnIu0h15Sx0Y
	 FCryiLsmdiM/KGlsSgb+ajaMQT7frt0KFAyL61FfO7Cmfc9W1bE3+o6SuSkge7+UPGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NozXVbWGPEdY7gxHDrA4RR7QdJYSBiFThdLGNmJHqSs=;
	b=oYg4FjwwaTW4hpl8sMV5Mbd0j/EpnabzLSVu+zx6RO281TTIdscbDogwxtpa8qVCMe2K
	 qdWqSoNtlfVe3R1mIVxdN8x5t3Z1LB8HoAvg5GFwE/DDyvW+J/6ZP8pX/Jxh2HNoiuVlL
	 M/PZtIJuLv91CQ+u2p8pPN83Mz+s4q7gnvVeHpj365Y9ptcw1yNLQgADQcz2dpOePSeEw
	 fj0yaMg5SjtcLqseA/BkHoXKjRW4dl0gwZEEAZrpK4xHrRUdrqqCo7vd2VF06X5UrJX7N
	 QAOlG7/Qk7MadN+7ue9dlu6tHQqYNDbN45encyJKMQZEaiIEm665WLIwiU9Ki5L55lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O39GFyKj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Of49x8QG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA95606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O39GFyKj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Of49x8QG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApBXQ1377008
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NozXVbWGPEdY7gxHDrA4RR7QdJYSBiFThdLGNmJHqSs=; b=O39GFyKjt6GqYE7+
	bPG3wEAtkP+fq5VkKq1lYvlTzW8q5knyUy3xUYvFoOZXICYA2voBqWiczSJEuNgs
	jKQkIeHsdoVURJVRpbNlQuSgJk9gqFEs4n0o6qtuMnWozTieRz376IQ6JEHnjI9w
	o+bAvIHY2OGbaC2CaNUiRhNlNwI5fLoiFAxSBJ1kX3iD/mto9WrQ+V8xotzq01VF
	GE+JEl4wRx+TBMgfgwMLexyNvgo4l8NemXiX4c2LZhKb881x+6fpMQ5cunLP+5ZG
	fvVk9s/59+D32il3Xm4U/5+mKEqbA6iFf98snlJ5OVpyHmoHhAS9yDYnzOg+e1Ib
	loniLw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru3a7ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:05:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d2d54356fso22323681cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795777532; x=1796382332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NozXVbWGPEdY7gxHDrA4RR7QdJYSBiFThdLGNmJHqSs=;
        b=Of49x8QGVQ7XClZ6t43bAD15h9oT8ziX1Zuv0MJfnn74QeqoiZBiyJeDYZtQjvl+xS
         qb2d+aqSw72YcRKZdFvmRE7vIqW91tFNy8gnqRabD0B6tTaXpS1JFRxlFEB/sjMWeZv3
         JpqeSBXZ/0Y9d2PTeVAb/zFDLFTJPb6iopKuhCXcOZkHfxAPw2ivqo3EMkc5LjMg0gpF
         k56J9/TeBNL0X/x+xzD9NmiVnOQvsJazBJ+MBw8DlbYAmoNvw5e8bR8tHL+PN1skSAon
         JePf8AlN4c98/DbX0yqBITOb9zc2XL0NRhkZT5U4aCMcS5VEeqB5tWMhwBkVAMIYM7R4
         gHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777532; x=1796382332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NozXVbWGPEdY7gxHDrA4RR7QdJYSBiFThdLGNmJHqSs=;
        b=fZL3RFrroyo826nKkiPle3DXfwuxfSz+FdKzpEeSEoSdWalcsRWCqSz7nfX4HnoTPp
         eEGbH/kIYFw/fUkFSLBSupYLLX16afMaBxf6332moI1qDhVpvbRp6bAiPGdRsFzfvwu7
         hg0gvlZ7y3F3+aXHG7R/weO3Upkzfi01t/WLoP5u+up/A17ceW4mwvtUUQxKp1XAzOPe
         Iu6MtGF2peuEWPNCqE4fWKidzL3RCqLnWoY69DsMVBs9CAbnjM6P7rjrxdHGHdixJx4m
         J0U51YRRkzgPWM15TdkjvN5Zs2Z2ElqewzIP/91ubtrmWd50AOzdocSEqa7CXvbf/2w1
         rqxw==
X-Forwarded-Encrypted: i=1; AL+hErHqhuux38ARWHq6Dfcb1Ln0oAaYHhabBv37HaOUnzpYSG1t1e1ys9kyNTnJINrIhfWWnXqj1ve5VQh10RLS@vger.kernel.org
X-Gm-Message-State: APuU4Z+xAhxRwGyrbf6bFKtOfEM7qzh3imoY1AiJN0ONxkpJWxqyLifO
	44rJktk6aNBChN4U2i+ugc/gBYWzjHitqhq+buh8gp9FrCpLDu2Joa3q5Cn4P+n6J2v8erRMury
	eVZm/pAchQcjYjx56wWPMyhoBjNCDxXj13g/ZffFIQEfbN297sROWPdZA0JngN3fgV6I1
X-Gm-Gg: AZFdTZeCi8wCV/Cgzrfkq9wVPc6OvVfUFiywJ1QcoY80B1qxhEslFAZH31WCG3fJJfB
	XlpLOSJQD/x1V/wTli/MY1vvRO+DDcWZMwnRGPcLLQCj1H2fpwVttPGItaAta7dctkweDNlVDSY
	wlY1PMK5q0Ezm3MHxykSs5C4j+CsZz3c/t3Mc1An56qMNYyy2K2sRuA2gqdxm1jNjH3yUokPgfD
	9jafwvIFGg5paZkG+RW3cQ8YMkg8VGs8GE1kS2lPQdNsUWs00wVyp+stACNrgtEK0P8YdD2uuNQ
	AMaoQDP0Eue+WP5BfYsHtOjJIOxnWMxOrlrSUDxGbnZCk77Ky0Ti7wl4oX0idsL5Z5MrMqKFfPr
	V2WNC2daJsVh4nD9JnCE24BpnzhiQHZP6CAuYng0UYNFW93g9u5N77sIVM30t1LMqwAyoKsc=
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4341417885a.4.1795777531909;
        Fri, 27 Nov 2026 03:05:31 -0800 (PST)
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4341414685a.4.1795777531467;
        Fri, 27 Nov 2026 03:05:31 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm10414924a12.16.2026.11.27.03.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:05:30 -0800 (PST)
Message-ID: <8184404e-93f9-42c8-b10c-ccd88c7934cd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:05:29 +0100
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
Subject: Re: [PATCH] interconnect: qcom: Don't read back BCMs without an RPMh
 address
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-icc-bcm-readback-v1-1-36b533d66a69@yahoo.com>
 <68573981-f9a0-480c-806a-0980cfbb6242@oss.qualcomm.com>
 <20261125165310.1409251-1-venkat.yadlapati@yahoo.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125165310.1409251-1-venkat.yadlapati@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b0963fc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1c4igp43OoxjrLkunPQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5OAcdW5CPS17C6JIF7pdby1e9hGpasr_
X-Proofpoint-ORIG-GUID: 5OAcdW5CPS17C6JIF7pdby1e9hGpasr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfXxop/RfOBGmnK
 1bFuqI2iJAtMDI9rDgQfZZ+hy6BoBKj1k8+E0BekGQU2TeDa8mIao9jndMtBrOjIqSWfZTqJ/Ul
 jTODYREDfBkX6/dHq4SORvNmXEQ3+pnxUcmObpPRjlIdemUq0pCgIIeo6Cua+GXuMht+mCdWoEe
 28sQ1UPW0Cl7K7/3LMpwRLRhccb9nrnXRennq/P+HlnVwztyeTRajSrEQOxuoaF8+N2ws4HluQW
 Vq0q3VOh6RkHErPSgrxgEbBuU7UUOPQb+v1jULb4nQBpLLzBSK2kbmgt+wQi0PGqadHEofcgp9N
 N4U8bzXIRxc8xF1Ru4++saL9yAYLxA+W0Mj6zM2Nb2t0YrNs60WQ5c/dDesSkn75f0GJ0dtHuo0
 MPtvDRjp2m4KZYhcnhJ20mtRj73qgrXtFCCc2k2sVLGCJX4shOxnYrWDopV+3czX8Dxm3NmIfXB
 bXUNBsgaJEsvt1A8NMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX6uNVxpXN2PIj
 1lHKGcREDK9F/zwh4NFB70bLEZXkhiAVy7u7aJaiVfEUlCmRrxtIeQdhPhtKe9hhJzti0owtbMe
 e+KQYPg3+8UlbQx5FG4EUhStvEsXENU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270043

On 11/25/26 5:53 PM, Venkat Yadlapati wrote:
> On Wed, Nov 25, 2026 at 10:45:29AM +0100, Konrad Dybcio wrote:
>> Fix the driver instead, please.
> 
> You mean a separate Molokai icc driver instead of reusing the
> Kaanapali one? Molokai also lacks QUP4, splits aggre_noc into
> aggre1/aggre2 and has different QoS offsets, so that would be a new
> binding + driver rather than just dropping QPC0.

Well, you made a great case for it being separate!

Konrad
