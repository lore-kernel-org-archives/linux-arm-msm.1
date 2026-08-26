Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6803B27E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730519; cv=none; b=a0+x/gPB45S4bXzYOIztxjJwlwsHBT62dwP+LSd8CN3/liXyGHbyjgLAU+zlA+JdZzyNE9iaDOmwHwfBAsVv2c5Ovgw76MTPZ1RRwQGMdj7ZYmOop509ZGuuBYX+A4f7kG2eCLq3A33dMSSdj1hHolreCPTzt33iAOVdMHzaz54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730519; c=relaxed/simple;
	bh=x4dTXZ7IqzVF3OV23shxhXdeAfu2FZJhK4q6VMqqO1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMSNMy9II0IjPjfS5nqNP40Rvz6MR+lWjwU6cjMC+YaA2uzcTHPXZyMBwJd4v/SOTNAWLyfzExpcp9psUlrzn7Xwp0Ni7C0TtJnwhg/KgPcOa9Cf4ymBur98gplYdE9781Iw1vuNXVV+KdFPF+GB5vyMPh6OoRo+xq0dhgxQ61g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CT23V0d4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYPPX5Mo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CT23V0d4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYPPX5Mo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rl83683491
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAtoFR5M91EfZJjcnXRp50nEQGEixoE/vi+YmUD955k=; b=CT23V0d4SCSFpGR+
	kGpNmv9UfXO2UmWsgiXcybzdTSAkCRZBoNV2LO7H0CGwooE6VDCWLqaPTnuD9VOH
	41vQqWDdn+KPJ1BdN2fr4FbXBr8ir41dboDktPT9e9YVO9CwWZeIGqzjWukvgSM7
	0iV/PR5qzhS1Ku4LSJ+zFKfe9TMEpI3xWDEGb66+yRYan77y/AFEri+d2/nkN6fx
	p3TWkmL1OCfej3o2utt/n/dkj1sMy7zfK7Zc5yfpE2Bn4+Ng3k1+yrz5CK+JDD14
	1+j/t2RrIZ6csNNJE0+CaUy2whkXR/pB3q9ZLPaFy8BLFxFag9Zl+n+1lTGA20Rg
	5/58Lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxjsgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1359230a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730517; x=1788335317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAtoFR5M91EfZJjcnXRp50nEQGEixoE/vi+YmUD955k=;
        b=fYPPX5MofkO6Rzz1MRA1JteiJ6PMzo/aT4hRVz1G4X1jVJxPdgDdxYyDN4cMXsXAVV
         +bcYi/UoOuGkzeW8a5FS0c5FU+yEO6mlxQi0JVGEM2brWrsHwmm6Zyk0uyOnKY1QGQUG
         5veyjBO1qL40YBVHDHzrauuAeHYtqP/i2PuoD0dWWcW0vbza26409c/0GCMTKXi///m1
         /B8sC1SDSwazR+sGallZl9xRrCUAAYQNbr50axa5y/g1JGkmH1I55GFAPBS0LyehV9O4
         7RS1M+AnIaeRJbFJGAzMU81Bo7evl9TeiTwerAkYdbBV2feXyiKTYLo80qxi+rl2kXY0
         4Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730517; x=1788335317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAtoFR5M91EfZJjcnXRp50nEQGEixoE/vi+YmUD955k=;
        b=HaTIadiv/x+PBgAw54P1WNAYepGARzfOkJ0bKMuOdc66yzZbeCgRN651Tymuzggt1L
         vROGyL5R3SYinTqxfKrNXWIrXvNrS1XULrRSPCBOolUTAILK+Yz2NR9jj33/nEpRznG1
         AfdI+pcxajylKdtRNZMdNcOz1E5wSVMDhiJwgz3GCWiuZy+GDkxCVRBDOlH2cU5nMJA5
         8t06bmSWWheJ2Nx183VdV//MRHuHpAAjRAnOq7c+Jskn+6xCJZgNfINvKDR+ELnXNj4b
         1JE9x+tfZr9i1Se7oxm2PAGI9vze4Q1rs4PpuCs3CJbVbCEmfaw7DBdw6W10joC1BBcI
         2VGw==
X-Forwarded-Encrypted: i=1; AHgh+RrEGIcAUnfL0k1OCk2B0/x7EiqbTtvkqnpG8KAR1ImVGCOY3q2Hjj3FTmu4/EmDo8oPyLIeEuCSv3qv7KDh@vger.kernel.org
X-Gm-Message-State: AFuF++k94pskrrVgGRUnzNP+O5k1OR0ohYf6HYTEV+CduJHCe+0dRh7x
	CU/b8/wNsDBGTr5/iVhy45h4BSDpn8Lf+xI9kKbKpmFbxWmRjdrwOEZ5j7OabfJq4jrD6PlJWPD
	yetfZgi8qc+sriVG/YsiRloA60/ZOcG3Qic5RLfrViAxzdBj28YmieeaCRoezCNjNB98ibilgAo
	u+uK8=
X-Gm-Gg: AR+sD12qrkFlT/V6u0xS3N27p//3vU1lLqbtXHRVNKL1Wr1gUa4DP9TLDk06hmp8wti
	JBNb6A5CZu5ocbrakjIOf/0HaGJgCySsOvrJfYTX4R4qFDuBshlvWX4ivsTkSxivS8qhFYkVVsu
	z+XLiBrU8UCJmhqOGD9XOXNYRal7fzIZdX9spRDciUE9A6gij0ICJwCPacOqCdofj6+apV5okRQ
	ZdM2rA0ry0tk6I9ZHwUfc+/iVq/WeiEyda0uCvHk8bg66J5gJiD7JEe2FUWK1DkX/ekdOeXwxRa
	jLDmu/WGw+A6ngSDYpU0n8tiAv3lVDpWhBMf9Tj+GwyffEKTMJMQ0s5Zj5AuhHBumT0D9sUSqoZ
	EqTyeCPTVGkUOJlV/9q2y43fV0q02U5nSvWu6cw9uLxNwJarHeyS0pOw4TbxVoiP1ZNRMoUlU
X-Received: by 2002:a17:90b:164b:b0:396:4729:43fa with SMTP id 98e67ed59e1d1-3966ce035d6mr10084690a91.0.1787730516760;
        Wed, 26 Aug 2026 00:48:36 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:396:4729:43fa with SMTP id 98e67ed59e1d1-3966ce035d6mr10084613a91.0.1787730516257;
        Wed, 26 Aug 2026 00:48:36 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a5832bsm3060969a91.15.2026.08.26.00.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:48:35 -0700 (PDT)
Message-ID: <f0a5b6a5-bfac-43ea-86bb-aa8c565d9e02@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:48:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 13/25] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
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
 <20260629-msm-dp-mst-v5-13-2ed6aee1867a@oss.qualcomm.com>
 <mys3u23vp6oi46djrj7lgp2bpmdlzaa6trmcmcprk7ws26ffx2@jzxkindvhuu7>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <mys3u23vp6oi46djrj7lgp2bpmdlzaa6trmcmcprk7ws26ffx2@jzxkindvhuu7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e9a55 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=B0EM0j4ZEun6JshmIZsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qgXdq7PqtywAJhjasdBdmdNJ0uVVAO6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX3mBMCgInZLzV
 kzKz8zx1LPGaZ2Bd8gmrl3DX/4AKB7QkrXsbV0iWzro9FHeQdsSPVXQVXA6M6oU6QX08r43a7VY
 hsuYaJLhdAIEc3tCSyytBhITPWRg4oxOUfNBWm8MrTKWvNjs5XLVP0XYX4miZ6Xx7HwpTiE/04d
 SSRJEym+eQUiQtSfYemOA36MlykRkCga/CC93qEpj6fTMJLS3FQc3AhrcuuSlujmRgxX+waDLBn
 vKGCMgT/VxOVsl94htPz0qo7cHaBfF13FJsvxSoOiaTzkshA8mGAwRG0iXnPPy9IQ1M1S4h2VGt
 AbabSyIOvAdwWovGVU8dXnB1KWAC5GHFW0/DukTlz89a4Z/Ao7N5A7RwTVgmwMkWtijVEx9Bg8b
 /Y6sFbQkZdghHylQeB/i7JCv9DY6djbwcjv0xCFFeTunazFx3dM+yk5vmH/yZmTCx4aRdbLvpF/
 9BG0J4ynO1SYvZQtdNw==
X-Proofpoint-GUID: qgXdq7PqtywAJhjasdBdmdNJ0uVVAO6D
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX4P2/29DsqbQS
 LgxYGjd//TR1YrR+g3iWQ8REmdqVWqwt/l2YOq4m3VZvhh9SXdHdjZEeKA3xc44iYMCWVlWEw8B
 EYAMzq1UXisMmVGTb589yYsKBPyWcT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/13/2026 2:51 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:34PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> For DP MST, the link clock and power domain resources stay on until
>> both streams have been disabled OR we receive hotplug. Introduce an
>> active_stream_cnt to track the number of active streams and necessary
>> state handling. Replace the power_on variable with active_stream_cnt
>> as power_on boolean works only for a single stream.
> 
> Last two phrases are redundat. Drop the "Introduce..." one.
> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++++-----------
>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>>   3 files changed, 19 insertions(+), 13 deletions(-)
>>
>> @@ -670,14 +670,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>>   	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>>   	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>> -	if (msm_dp_display->power_on) {
>> -		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
>> -		return 0;
>> -	}
>>   
>>   	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
>> -	if (!rc)
>> -		msm_dp_display->power_on = true;
>> +
>> +	msm_dp_display->active_stream_cnt++;
> 
> Current power_on prevents from calling msm_dp_ctrl_on_stream() several
> times. How is it prevented after the change?
> 
I think we don't need to prevent it. It call drom .atomic_enable() and 
it should not call twice in SST case.
>>   
>>   	return rc;
>>   }
>> @@ -726,14 +722,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>>   {
>>   	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>> -	if (!msm_dp_display->power_on)
>> +	if (!msm_dp_display->active_stream_cnt)
>>   		return 0;
>>   
>>   	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>>   
>>   	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>>   
>> -	msm_dp_display->power_on = false;
>> +	msm_dp_display->active_stream_cnt--;
>>   
>>   	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
>>   	return 0;
>> @@ -850,10 +846,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   	 * if we are reading registers we need the link clocks to be on
>>   	 * however till DP cable is connected this will not happen as we
>>   	 * do not know the resolution to power up with. Hence check the
>> -	 * power_on status before dumping DP registers to avoid crash due
>> +	 * active_stream_cnt status before dumping DP registers to avoid crash due
>>   	 * to unclocked access
>>   	 */
>> -	if (!dp->power_on)
>> +	if (!dp->active_stream_cnt)
>>   		return;
>>   
>>   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
>> @@ -1535,6 +1531,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> +	if (!msm_dp_display->active_stream_cnt) {
>> +		drm_dbg_dp(dp->drm_dev, "no active streams\n");
>> +		return;
>> +	}
> 
> If you get here, there was at least one active stream, wasn't it?
> 
Emm yes..
>> +
>>   	msm_dp_ctrl_push_vcpf(dp->ctrl, msm_dp_panel);
>>   	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
>>   	msm_dp_ctrl_mst_send_act(dp->ctrl, msm_dp_panel);
>> @@ -1555,6 +1556,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> +	if (msm_dp_display->active_stream_cnt) {
>> +		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
>> +		return;
> 
> Why?
> 
Here, unprepare is only called when the last active stream is also being 
disabled.
> General comment. You are not just replacing power_on with
> active_stream_cnt. You are also introducing sequence changes, but it is
> not covered in the cover letter. It's not clear, why those changes are
> legitimage or why they are required.
> 
Got it. Will modify the commit message.. thanks~
>> +	}
>> +
>>   	/* dongle is still connected but sinks are disconnected */
>>   	if (dp->link->sink_count == 0)
>>   		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 55ffa22bb233..75dc40261723 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -18,7 +18,7 @@ struct msm_dp {
>>   	struct drm_bridge *next_bridge;
>>   	struct drm_bridge *bridge;
>>   	bool audio_enabled;
>> -	bool power_on;
>> +	u32 active_stream_cnt;
>>   	bool mst_active;
>>   	unsigned int connector_type;
>>   	bool is_edp;
>>
>> -- 
>> 2.43.0
>>
> 

