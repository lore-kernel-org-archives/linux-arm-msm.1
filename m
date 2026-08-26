Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C814351C02
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730515; cv=none; b=pU3Sr9v+tM1wO3+tqMkV3JvtvHzUtcfTfAvzVPHqeadcasuCtcyOKwXTbzYMbic4Tqag1febQiovNSD63pBPoLtW8d+bc0mW5V5jcAwJYMkxB2nNi/p8KE1CeNIaaUCrXQWV+SYYGoQuPtV4iLbHQi4cIFyi1NLgHT7F2RIxM7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730515; c=relaxed/simple;
	bh=xpn22FTdNMtMUbm47XQK9Y9mB+P1ZBvwprRuOFEQb9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTJXQAN5qO+vtSIobmn/eIfQ+4ceNDhDEoc9jIWRKI1TZpJtb3uENSlEbCQfDPzyd3neHqRCEop9TK8g0HZ8uGxArviNR/K8NGGuYEKXSWV2dFz2d6AtQrlkcSonlojZ9PXiHRSWQg3uGqdFtidGjomqnfvzYmozP/VF1trLXAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkX0GdGJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mu0P3GTd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkX0GdGJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mu0P3GTd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RbT9105902
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCVVlm64g9ttdUSzI+YrZMU8ZmRwF/FCIwqoHT7K4tk=; b=NkX0GdGJj+0XNxVL
	2WkX1NQRcYRtbs9JD/a/aNi3dgkasD1zZTYZbSVoyyYsyfSpULnd/gjRJ+O15Ral
	rsY8ZVbKiisVFqtzjAR+QU9y48AKVX4aZtyx6y8j312fLckHKfdtBDUJVTp6cQp7
	oRAwSrvbHzL8b7g3l4gSHT8H+jmP0lAFipikHLAWETo1s+rD44xDbL71OIXQ6pYL
	P0/gR1PwO2jf3LiBMukCae+a2bYoGOKTNLKC3XLfmAl6QMIJ9zZPRpSy/uBmHYCD
	Ig6T21dPz5uhYvqRkc5LB6kdqVokJJ8iR1J2ubMnK+YzjR+Osd9Ntv6shjNLFqZF
	tF3/XA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k10g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1855285a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730513; x=1788335313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCVVlm64g9ttdUSzI+YrZMU8ZmRwF/FCIwqoHT7K4tk=;
        b=Mu0P3GTd9fwBldSXqvRvkLlnc5qBoDMaH5xcvQRyCC3BQaqMELpbo2d8p0sD2/gwxg
         BZqs1n91JSvQcdO82RZA4IGZNgHJ3Y+9/+xdgZuqZQfeMjsVxJDQSoKu8cLLbjGuOkWi
         ymooFFVwMw/MhWiONZcgKm5RC8sW0T16NE7QFEgDIgAxCdpFOtS2o7qcIqKB2XrRLP2v
         qFXl7zCQKWGKHmxY1S246g0kfx3ps3DsT34aRScFiV50ax3GfZf75SxgN7GHiVTaIMtj
         p7BuHYV3kGzP+fSAZwXKMgWkQAgT3/Ksbra3CnxW2uR0C8s99mg6NiVVxhUQsYzw0u8o
         ybAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730513; x=1788335313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCVVlm64g9ttdUSzI+YrZMU8ZmRwF/FCIwqoHT7K4tk=;
        b=F3UkQaS3rT+vDMXNvrKfTod+TVoj7E1yLZniRYWn7bxuqxSZYQjuRAqcw8t99ryiaa
         ka23Y9Fo3mMfhTS/0Okr9+hIE5UyBaVayBL2x4tFIZCVIG78yFOedoIRxdruV7K0hLDI
         R1H0B2UA0HcvxjG8+c21bz4MK6Oxx4K6HVqZ+6DPisS+Mb6a/mZLsOpdNexwUaaC6q/W
         JFiQvOB4CRyhmgz4M8n6sFokVpe7HVaXmUVZjq2KLi4OF9EOIN0OOlYGjbXEhqpsC8MT
         kVNSF1mwcsnndW6/hA81IbjtyeXepZOUASqc/jMCTo+zWliaoC8muqW5BCuDPw0ZAklR
         /gkg==
X-Forwarded-Encrypted: i=1; AHgh+RosPaZ9W7RcnvB5i/VxvWdLiCTbP2Xh8GrfxzEC7BbqYet+ausXc61u19Og1QLo2gVDQdMum8Km/DelwWeg@vger.kernel.org
X-Gm-Message-State: AFuF++na3SEnSFjtVY9A9WgskqHLifw5MKjXDYSMG/AmPg/GYxNj8lCs
	PHwAHiUk9ktQSpUIXb6KXID95PKCT/jTDTmYT6CkLiuTmZIlc67i75UXXVeQOkacu83gJprGtPj
	hHG5NqJFV6KrGdvRYso3j2jHnv1Hy/af6q2JIMLEb3WJ4SPyXUp32MRG5/nZ0R76UGOQ7
X-Gm-Gg: AR+sD12oaqFpAy+pZ9NHZWjI5o9ltEVfHgvxLMsqaX1tWmHWojqOwn+UdkSCZpgP4qn
	+qJwC/xPOlTcoe5XigZmEwC9g0ydbCMimkDuObgDZhSd+N9xAqGym0amBRalFad06VE+tnMOQ8P
	1CDBx4nWxM8W4rgTD6dyQhhX+/l86EiQf1zEZ0AjdR0eIhcIaaOmdyL/47SQNE1Dp9Yo+UIqCbR
	wI+mh2psw/VRrh3uJBbNGesopAWaOqRW9r3FjbSk8aY/5rBHhj4zUfFKRPjqwOdgFCqUNu/7QmV
	4aqaujEw8ouFQFgzubeQNo5TkWoDGI+YE8DIUK8FKuDaRRkVuGXohIwmHdTRmuW+hK4S4kWsRrZ
	SxXcSBxd55U/KoEK/ZvzHGvc2ZSXLvX8vF4Agz2skzg6EXTFBAEmCvsV+hT0naoWvyZfRAnIx
X-Received: by 2002:a17:90b:4b8b:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-3966d402835mr10357193a91.7.1787730512566;
        Wed, 26 Aug 2026 00:48:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8b:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-3966d402835mr10357118a91.7.1787730512146;
        Wed, 26 Aug 2026 00:48:32 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a5832bsm3060969a91.15.2026.08.26.00.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:48:31 -0700 (PDT)
Message-ID: <56ccfd0f-fad1-4d88-8398-71ac6f09a4e2@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:48:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 02/25] drm/msm/dp: introduce max_streams for DP
 controller MST support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-2-2ed6aee1867a@oss.qualcomm.com>
 <anxxmx4qfdil4chif37e2xzk3juuvpnqdoc5mg3jcbdkoaa5rg@obruztrgljpp>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <anxxmx4qfdil4chif37e2xzk3juuvpnqdoc5mg3jcbdkoaa5rg@obruztrgljpp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8e9a51 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kAGuYKAZhE7RxPx42BAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX2qON+KDuz5Wd
 G4HUIlM6/B8MjLmYlMWpIZLma9lBKueuwt9ed4k9kBihadWwwmUwVeULyWwKSN/TKIjzxwYdC4F
 Fye+9iHaBDw9kOgD93p/55KnMT59gCE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX8aRsz4UYshhh
 6YtHyQumuRUB3n7z8hjKgcoMZ0yRXa4yo9UFZl/rfkQeaKZx/LZrWewfKlLwKp+2dvYBjCfFbZg
 W4p3vWveJo5XjvTk9BRcf5Lh//vlpEit1/ZUzwkce8+4ao6clMA/JdUcKyEc1yJxx5dPO1VWjNl
 /UOa3zsodYmbihp5bMfoqmagMAOQiFMEvvdxFp9i4yukBH3FT+F/aAn2VYH2oJnqRIHJKbfki5N
 dklfOGC5iVIDyo+w4oYUCR8u9J8h8hV8x/T7gB2t7UTAqpkOXpult1pMCRTc/ILHaYXJ2amiWo8
 b46n5z6c3huEQor2AHek4TYzEv7kCVbU6CsVendkIFvvhCWWlalryQpbt/EyfvbFx8Wqrvwec4Y
 laQ2jUNmxr1mak5q9fpYaWGoWX3amI6PZrjkBaf7KuhJrdnCWbhnSt1RXAveEXNsi7V0bk6XvpV
 TV4XxTednIfokwlwe+Q==
X-Proofpoint-ORIG-GUID: 2Qux7s_XjC6I78J1M7ghNzPfEIkysbFV
X-Proofpoint-GUID: 2Qux7s_XjC6I78J1M7ghNzPfEIkysbFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/12/2026 7:17 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:23PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> DP controllers across different SoCs vary in the number of concurrent
>> MST streams they can support. Rather than hardcoding per-platform
>> values, the number of available pixel clocks in DT serves as a natural
>> indicator since each stream requires a dedicated pixel clock.
>>
>> Introduce max_stream to capture this at initialization time and expose
>> it for the MST module to use during setup.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 13 +++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
>>   drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   4 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index a475e787656e..68fb4facb056 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -127,6 +127,7 @@ struct msm_dp_ctrl_private {
>>   	struct clk_bulk_data *link_clks;
>>   
>>   	struct clk *pixel_clk[DP_STREAM_MAX];
>> +	unsigned int num_pixel_clks;
> 
> Squash num_pixel_clks to the previous patch.
> 
Got it.
>>   
>>   	union phy_configure_opts phy_opts;
>>   
>> @@ -2754,6 +2755,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	if (rc)
>>   		return rc;
>>   
>> +	ctrl->num_pixel_clks = 0;
>>   	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
>>   		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
>>   
>> @@ -2766,11 +2768,22 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>>   			DRM_DEBUG_DP("stream %d pixel clock not found", i);
>>   			break;
>>   		}
>> +
>> +		ctrl->num_pixel_clks++;
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> +int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
>> +{
>> +	struct msm_dp_ctrl_private *ctrl;
>> +
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +
>> +	return ctrl->num_pixel_clks;
>> +}
>> +
>>   struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
>>   			struct drm_dp_aux *aux,
>>   			struct phy *phy,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index be0d89d60914..305add3dcd93 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -55,4 +55,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>>   
>>   void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>> +int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
>>   #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index bb243ab09e66..9cd243411e44 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -87,6 +87,8 @@ struct msm_dp_display_private {
>>   
>>   	void __iomem *p0_base;
>>   	size_t p0_len;
>> +
>> +	int max_stream;
>>   };
>>   
>>   struct msm_dp_desc {
>> @@ -578,6 +580,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   		dp->ctrl = NULL;
>>   		goto error_link;
>>   	}
>> +	dp->max_stream = msm_dp_ctrl_get_stream_cnt(dp->ctrl);
>>   
>>   	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
>>   	if (IS_ERR(dp->audio)) {
>> @@ -1178,6 +1181,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   	return 0;
>>   }
>>   
>> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
>> +{
>> +	struct msm_dp_display_private *dp;
>> +
>> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>> +
>> +	return dp->max_stream;
> 
> Anything stopping the driver from returning
> msm_dp_ctrl_get_stream_cnt(dp->ctrl) here? Why do we need to cache it?
> 
Got it. Will move it next patchset.
>> +}
>> +
>>   static int msm_dp_display_probe(struct platform_device *pdev)
>>   {
>>   	int rc = 0;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 43ed79093e24..d3d4ab98089d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -26,6 +26,7 @@ struct msm_dp {
>>   	bool psr_supported;
>>   };
>>   
>> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>>   int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>>   bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>>   int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
>>
>> -- 
>> 2.43.0
>>
> 

