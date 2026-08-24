Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3C0413780
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577448; cv=none; b=mCq45gwVOzrSrPxkg2JaDWdcmx1VFR7C+XRoney837RD0Qr5mlHNPslp1UQOoAKq/H9PaU11d333AT8Slm4azZZGBnDnYxm8PO3csrQYz5oLyunMeqmxoDogENmeV1csrRu2ExSxpwqX/xs3EaQrvNDmIyxlFxxYrXiEs2rS490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577448; c=relaxed/simple;
	bh=0sFqc3IUFqEyflaLicdgPilz7QNbaGGF7EcNt2ZorYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnjM+4kPyQZM6LbvLug4lQ6aSX+Rzs62OjfFjRxSjj4aqrO75yeinQ9Up2t9HvLFzCgpECpGfwBKDo70yiMOKNLqXg5Wx2vHBL7KxSNBoon/ulI+RI+GcIQG/yBp/JMkYF6i275q/5USubOhZ0ldhZlbLGI5V792+p241DLHRmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyvUv0+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdWgX0PD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyvUv0+u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdWgX0PD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuqP12479684
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tnp3mVv+VBCQVYi3QP6h/5zemYCms26RoK5XuVNMynM=; b=MyvUv0+uT9xblodW
	inR2ESKXfi2i/MYmnxDGXmaD3+heVXlWTgBUZeHI7tFtAWm7XN4ZI/JR2uMkiP3d
	b0rJRPNuYQrNyonn6A6ZWFyN5/T9MX3s8KV+ct56VBCBA8lBJ7LyDQq1W58W4UDx
	5Shl7HTW3K4NfqUd4iUOj4Z67MPaNRXGPo435us9kTQPybq+T+v2mUVuIhsJlgAa
	ItJcbwMqI1NhkCyFGqDSExToB0D9PzMbgEY/4WvXmSog9Y8Dy1MZ3JWjiB6gffda
	egZ3i3M8yIPotzB2BwPPzwlze2DLNSbWok1s9w50Gfcd+hxUQof7OKNztKnMG7/c
	5bsdnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsgvvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:17:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so50996385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787577446; x=1788182246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tnp3mVv+VBCQVYi3QP6h/5zemYCms26RoK5XuVNMynM=;
        b=SdWgX0PDtvzh0q5h1cBUsuylMqSjjL2hxCp1XurK2joLaZzp+djdSG7ucK32f4kd3k
         uYOyqArEWo/g5MJrtqiIGrWRh/ftyVc+YmjysIHqEI1qHznfHEQw1e2iLGvJi5eTX07T
         sY36zLTwCuDkiwas8FKfo9vKkaNOcHneCEXVeybuZRidunQ0sgtVdMCiWhac8h/aDWZU
         jThxdt6CdW6IU2DaRe5N//3Mqei8/Th+yN1llCxdZyKm98xyBvguPH+ai0if0XU53hUd
         Boj+IUMPcQqzvG/alq2dDZn1gg9D2aR/9munzVrydoyXS/vlEqTJJvhepKnc3i4EBb3G
         faeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577446; x=1788182246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tnp3mVv+VBCQVYi3QP6h/5zemYCms26RoK5XuVNMynM=;
        b=lNu9UiZpAiXqex475yBdtK3eRmeopFBTfdm6kRlYLI/zujJI2yjDnkCZ/dNbElJS7x
         M4fwMrfU2L99k8cghmy/OpXb/T1J+TGAr9hdxkQMQc7fn97VUe6/mBhSEGDfTJUEjP2U
         wdGV7u8lkcSukicwJ5eg+9dGGcbtcckhfY0CDwfObvzxTHV4ezCqtn7Iv+mqdeg5Izq0
         OpoboTpiKq9VCLxkVVMK21jGeHrzAS6IE/8QqYEzgFm5JNX4cWmwyeoCZ2lhNEH860ov
         FGSHuyl9iT2762pjK3leki4WG8pdECveiBlBFWKJiU/gm7unYIucKwSbDI2KJx1pRAKz
         S73g==
X-Gm-Message-State: AFuF++nNF+hXd/V2MuWfcNRqL33H+i7jXcSoF7DC/Tads2XULyNB0I02
	D9On8mxFotIxNzG593M03RFXoqooyKzvhRMPWueUyK6LGOG8W/ukiZYxEGzcfEf0Z9cLG5LNkJ7
	4sFtTEgreULQAr5pT93vRarEpjjXlUYxantrLxlx5rumCoTZ3g/YEuca8aEUwAiC63Yyw
X-Gm-Gg: AR+sD13xe+BB40ArfrcTSz7UvbbGVl8fIKuj3N/xWOy/s6p6m4Xd/X+AkHTixJJMBkr
	s/eLhHwspjiKkg0bUo0yQGIms4DDNDMVbRYNB6ZstttDEfRjJFwZTASjQXCgtoLwaLsj7w5q8Zn
	HSNOINb2sGNjhS6FDDQ0i2UPrUQmbLiAgDhUtbt8zXzFLwQ8wsjITjQG7Q86MXxLpax/LcrS7gT
	xHXFqfuwYquedq6wZApsTozeN0BuxMCiVU509FFJRXFEoVx0kBNo7zWp7BMzsYniWJl4sfjy3Vh
	Tz8am/QNa53I88wrce+22f7CgNL0FjFsqXp/21Y84JUvi5vnXmGpnVaHvekU+df2sE4kU9jlc/5
	FKYQFtAH4CURw376JwpRPS4+B
X-Received: by 2002:a05:620a:2806:b0:92e:6485:f640 with SMTP id af79cd13be357-937395ae7ecmr1681796085a.4.1787577445647;
        Mon, 24 Aug 2026 06:17:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:92e:6485:f640 with SMTP id af79cd13be357-937395ae7ecmr1681791585a.4.1787577445186;
        Mon, 24 Aug 2026 06:17:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce294a8sm1757332e87.81.2026.08.24.06.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:17:24 -0700 (PDT)
Message-ID: <2b1e73f4-a476-4dc8-83f2-42be1008c1fc@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:17:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dp: clear force_link_train flag when link
 training succeeds
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-2-2825e5bf8a96@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-2-2825e5bf8a96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExMSBTYWx0ZWRfX3Gz+SQWhzM6k
 coTfNz9fqZwvCqFpXj97zY2NbZLBWut58mSBOqGZOJ8CtVARZkms0jyDkz+YufuDayWdISqZTPk
 5S9Y09Gwpytz6EuH7IPHuFWsGMQwFeI=
X-Proofpoint-ORIG-GUID: c0oQSuoO7aWe-beRGXEgQU6gZh3lfT6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExMSBTYWx0ZWRfX3bIxX6hz08ah
 Krvshic5UoT1BC6mfENRtF36IS6cxCmBt/t4oCKoiEO0kTrxX5u5hOd2MbmF/g6td7At7mbH35E
 LSdNLnqNgOLPLxZXs1RtQCT6Fig2fVO1ETgyo9sBWyNbdRhjAG06fHHMdZKIPUXDGMJE6WBBV5a
 5cIQj99Q7pnKFDjq8DuFFM9Oz6gJH7JldS5N1qAw1vjq6XFTEczarCsW0wYqs6XEk6v0CCQCbxB
 P6bKVGMUdmlAfJA0F8fWQcFSSZHHmUBpooRdorR2EFlADscGHnKz4F+24Dv5rRlv6gdSvyEaQ7l
 G3gsKlU5vtqOFOpmsHnWpiA+dfOMUM4Jqe6EoLIA7SAlaaTkfvTgytqSwEY8BWzyuXxwZG5v+p0
 u4V90QyDUel0WVyRxorcDustkPTMvIkKzFFnH75DJkQ8vEjeX/L0MCHCsEGHm6DiTVzbbYYUZN2
 DqUhWbqrLRueFqsZpdw==
X-Proofpoint-GUID: c0oQSuoO7aWe-beRGXEgQU6gZh3lfT6D
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c4466 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NP0x2mC5TxarURSXHOEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240111

On 8/24/26 1:28 PM, Saurabh Anand wrote:
> msm_dp_display_prepare_link() sets force_link_train = true before calling
> msm_dp_ctrl_on_link(). On success the flag was never cleared, so
> msm_dp_ctrl_prepare_stream_on() would unconditionally trigger a second
> link retrain even though the link was already trained.
> 
> Clear force_link_train on the success path so that
> msm_dp_ctrl_prepare_stream_on() only retrains when the channel EQ check
> fails, as intended.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bc646d172abe..40e19d506a45 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -649,6 +649,8 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
>  		return rc;
>  	}
>  
> +	force_link_train = false;
> +
>  	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);

This makes the argument of this function useless

Konrad
