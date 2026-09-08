Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818CD517BAC
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858265; cv=none; b=h6P1BNlSE9GL3EPvGWmCKSbJrT1ntIKAH2gCPYaJ0jy23GuttXszYpXBTAl5EqqVaJZz6LsQrJe/Pe33awI43EY2rSLF56LeLRcZI9r5U/3QQ3VsvC2L/hJbQ7PsWgQpYE/JRcMN+MA1F/svXoNswfmVQOTs5W78lP9GU71j8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858265; c=relaxed/simple;
	bh=FGd4I6N454A4VuhNTdk+Vfvz3/mM0xq0WoXJ40DHEak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SC/iFGSIc3rJkT+df5oRL5nD5cyhhm1dETghafMHLd/gOYKHKs5NVNeRgdU18A8HVWx13Cj7GE2ukCfc1qFeiuS8fripJcLud+T8ApNu/snktzJg75XF2goQhPaRjr9CFZbdP8CPKmyNwfj/IezL6hqXF97kiN+vS9u3VlYvqK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmFZn486; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOzZayf+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmFZn486";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOzZayf+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1vC2712352
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrvR5saH6GOs4h0ngL0nXxpJm3E6wYqtg0huqXOt+w0=; b=LmFZn486WXICePmu
	8VPDrT8OO4QAVN1CdIP4OlKS0F830Hi8u6KoHxbmo7R45Ms/xP5kA1YuDfngK/H1
	pmZ/yYUrUPZ6C0FIcpooxGAGe7T6HanS5RXEypDS43BrrWVTaKGIjn6jNQZpaAI4
	Rzgx6YEyVUpmpgncuWx58U6O18YF8OwbQ7gN7rustfrvfb2ByJMO4fUYq8TQNCy1
	6HAHyYYSqxxkPcL0rWhB7XTfrlndeHC337ygtS3N2XI3EQtmGvwMQbQbwZGAOANn
	RVifMakjkXtTk4s4UMz7IGkknE3fg70rjaiSu5B3BOUKBV4SoQPJb69LpGT+aOxL
	kc+ghw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqmdye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 09:04:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9392788b3f8so81715585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788858256; x=1789463056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrvR5saH6GOs4h0ngL0nXxpJm3E6wYqtg0huqXOt+w0=;
        b=WOzZayf+0Ps4hWqUbasrNAiilyg904mVi/bQzBzhVCPmy6kJYMawI2SC00wHNzFcyH
         CsBZiirVY8duVNpVd9qyMm0u0i5pfSYiRY8ALDagRjPNC7a94lmdwQ6bEbTVCJ8HZtRq
         txaHWE1KzTJnQG97KVxFETpn8MmgOdnyVhlt8wI9iwz/BTCKuTgBZadIJXTfLDV7ohQK
         c73+6GievCWzLp94/biTiFAyL0nL/JFR3C4ICPOvfTNp68INJlqdFdtt422/ygAo7m4m
         A2QHxMQWxLIuVn3aNnV7MFKoBI/kZ8FaWlbiS252mhcjvDgGqifFhQ5FHSPOFBZGjKM8
         RJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858256; x=1789463056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nrvR5saH6GOs4h0ngL0nXxpJm3E6wYqtg0huqXOt+w0=;
        b=Ec+mt6VNyQkzP+hLhjORS1pFxxLF8i8MCv+zEork3tMT5FgwZkvl7xMBpiEumFSkHo
         1Z47ASzgmRlz09X1RwKQaCcyfr5C0+pA+XvmM/0m8xKDeXjzMJ7IvuS9KoPf0fwrG8lK
         DE2Am3pAF2J5s3IXCxkYcqQ3Ez7+/6wah/OHG2zVLmoydxhdnem7Bu8biG1XhN/puM5D
         24UmY5is0iiIos+TqJGxYR2SjuVhR2mh+JxWhco3kf3Dz3HaIPUgpPbF7DKsB6ySrwlW
         r4c0pNEJQhHKnMgiB8X7vAz5iay5hCoEVpkgsCCarCyavMb46zslOkLf0+n5JOUdFSe4
         taeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUTihFgIKNkhJFMxDK745/OM14hj1p4PyqpUUF1LI916Y/kEqCxTAzv1UtcTfOUQifZ04rL+hbzeDVrcEM@vger.kernel.org
X-Gm-Message-State: AFuF++nuEsuYEh14wFreRWFpmo/g51hakQDeee/ks+YUD6xtnnFb/5Ry
	de/z2kJ2kd25Wbj/8CSAvHL2lb3k/Q0ctJ6A0XDn85KPfuX+dpcW9MF7p2sQFkz5M7jAIXMpV1i
	0rmlPrJbPepigVTLFXTrasYu+k13ZqtfRtRuFjPBjdKqMSAyFEY+XSQWSk15XfxdN/+4U
X-Gm-Gg: AYBFou1+QAQBZon27mnZBomW+VkPRbMfPTL1zc2cjER7m/6FPTXZ6wvgEifKFZS8oMj
	ExZ1QMk/tfi9+psn+iiMDrBcADbUhgPBFjYcy0jzb5hqmFKsBh4llyromRGz7Nohgpo0z0ofEFd
	ilXVVmVUJCp1rIC5F7sIxYATdk3cp/LFAPt0EySMrXSBzfs0n1F1zSoNqgYXdeYsLZ48CoQu3pV
	KzC7N+nj/92dQn7OhN7ouFX783tLWbpfd9hUKCZ9wRwkvOXcnWMj+2VpWhps3JbWrsmFqhcYnnU
	8zjCc4k842aDsTtks2YolsJTnXudVWQOO8eqy4pI0H0SB4whjSD/WEKJ0tvPbtVKSQMC5Ur8q+l
	rDBsmwVs1NMASw9u9E1z74g==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1758635285a.2.1788858256333;
        Tue, 08 Sep 2026 02:04:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr1758631585a.2.1788858255922;
        Tue, 08 Sep 2026 02:04:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26263cb042sm447308466b.47.2026.09.08.02.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:04:15 -0700 (PDT)
Message-ID: <c8275581-7c02-4064-9824-aa77a5091d0b@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 11:04:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: don't gate eDP on DP_SINK_COUNT
To: 092vk <vk092kumar@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
References: <20260908090146.3100787-1-vk092kumar@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908090146.3100787-1-vk092kumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5NCBTYWx0ZWRfXwzMSmVtrHK7D
 wLOLaV1SLyQ9wZswPwLpZUjLy1qq7rvYayRdevhTo6cFkSpoQKNgC0e5BG6ZMrMLSnY90v2lGRJ
 z0+YwgcAVEqL89NXonSNe65+R2/oSBnkG7yTohcYAHldcfGPAWyOqqz2DL/obeihD5huh3AqZER
 yGkBGHtA7BPkPL9jTax8E2mW9CtQ0S7VsSUJS5iIUZornLsU0c2JCF6y9qjLUoIAX6CP9XyPzGE
 tAhpq9W/FinNBiHagjeAv3xagQVKTplrLLlrJz3ZBGzN3KIP7Nxy9d7s5xNyB2zKODGlWOlTROH
 IQiF8V6Y7zPThWne/+u0jO7dFdqttevV524MXRbW3KfmcYk34dzpF+XmNuRfMZownUB1+Y2yWcC
 n7VUcnjWb1Fch2Mio2VEn8h2rihavhhYiP2EYA3omtmVLinyA2pnWsMbmhRR6fHavUrGYlYHT1s
 jIV6ezoP3KpDKr7qNoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5NCBTYWx0ZWRfX4CuSfvqMZWMu
 7uCUjcvchvl2koBGT77nitjeDZLH5cfchwSrxKCvChe8v02IaBEoX0WFMpEqkEGyyafrtYgHL4m
 LXfCL8u5IMtE3CRUJNXrQzeh25n9fAc=
X-Proofpoint-ORIG-GUID: T0QPiIUUpnWptaWtQt8idr4ot3aUySXh
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fcf91 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tHtyKFz_FhAUe0nsBNoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: T0QPiIUUpnWptaWtQt8idr4ot3aUySXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080094

On 9/8/26 11:01 AM, 092vk wrote:
> msm_dp_display_prepare_link(), msm_dp_display_disable(), and
> msm_dp_hpd_unplug_handle() all treat dp->link->sink_count == 0 as
> "nothing is connected", and in msm_dp_display_prepare_link() this
> causes probe/enable to fail outright with -ENOTCONN.
> 
> This is correct for external DisplayPort, where a compliant sink is
> required to report a valid DP_SINK_COUNT over the AUX channel. It is
> not correct for eDP: some eDP sinks -- particularly fixed-format
> eDP-to-HDMI bridge chips with no downstream AUX-capable panel
> behind them -- never populate DP_SINK_COUNT with a nonzero value,
> even while otherwise participating normally in DPCD capability
> exchange and link training.
> 
> drm_dp_read_sink_count_cap() already accounts for this by excluding
> eDP connectors from the sink-count requirement for other DPCD-derived
> checks (msm_dp_bridge_detect() takes care). Apply the same exemption
> to the raw sink_count reads in this file via a small shared
> helper, so eDP outputs with a non-AUX-capable downstream sink are
> not treated as permanently disconnected.
> 
> Tested on a Qualcomm QCS6490-based board driving a fixed-format
> eDP-to-HDMI bridge IC (chrontel,ch7218a) with no negotiable
> DPCD-capable panel behind it; without this fix,
> msm_dp_display_prepare_link() unconditionally returns -ENOTCONN
> and the display never comes up.
> 
> Fixes: ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two parts")
> 
> Signed-off-by: 092vk <vk092kumar@gmail.com>
> ---

Hi, please use a known identity

https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Konrad
