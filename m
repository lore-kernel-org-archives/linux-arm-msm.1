Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7452E4D596B
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830333; cv=none; b=u9dGt1BiZM6KXQVTMSpNZ2G74vb3vwNi/L2zGjr0uLNHG/P/AsxilHr4fi2tDfjcfu6EMO4k6L9w3eGLAPB5/DfBQz+w0X7gPBwhOlKKn1s+bfgwmzcvxV1+743wFZ8/7PFN/QQEVHmpOHtQvRocMC/vxhUZhz/WSgaEFmBmqdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830333; c=relaxed/simple;
	bh=LTPnzO4a0gSf8u3gAhmWKv052eh1Qnd6JhIEqHAl4Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+KSCT1Q3zPBMKx4wo+ox9Jl0fBytiWaLcWJDgj3ok/HtHtfy0YA5xmwaCt5mg/AksnGurmQF1zOOMXjgza6fwzXMnx7YXauj+FQBLDlBp3+ICTED2XTiZJjaXjHTN1FpbP2qh4EFy99bnp8oATUp4V+uLQOXZnjGlbcfoO7FCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtVMSz83; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnO9PUuN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtVMSz83";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnO9PUuN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHvNcK2477940
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgRYUW+Bei3Q21MTzmcxk2sT/AX/LHG8dFab1oytdc4=; b=KtVMSz83dFKaiUsR
	UAw/ofTyd9VTRnwAh3AExIWWC99HSrL0W2itiMZCy/ULzSNm8RgUihnUuZ2bKpLl
	9dQQHK9x4i1qB+SCXEYvMU1t+EMsM0bXAfC2dqLCK4Hubl5YAHKuWz7XZrZwESzd
	KdE7FMTNBCO52IPsP+3JslbEDDqktXq6Laxf1mW8YZCr2mEft12uORHZl3I2ZP5T
	IzVZpNJKDxMf1+aLWaMbULYXQpLZsfhfCZokQdkiQFZW5G4quuqZgDW7STL0fDjE
	u5pgVoeaWHhg03jaV59H69YviEzgEs7AvppX+fFTO85ux8pZDgKSJ/eyInjj1qPJ
	6M7XQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc2c6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:38:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35ac5255f1dso4360938eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791830329; x=1792435129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgRYUW+Bei3Q21MTzmcxk2sT/AX/LHG8dFab1oytdc4=;
        b=GnO9PUuNACEmzpGNkrkr+Nije+6SOPB9cCPMrI1/EqLztkm6BdSnkSUUfi80xi/U7U
         z4UoENd6PgOTlv54V8iXRkMqo1Y8rV1cux+TU7mqY1z0YCxhroHFV5264yeFk4pTTIg5
         pPmqIMitvlhfxaKgMhxz+OFb5paqJkkje6CW/5ZY1CGdqawNu0fElyYndJMEaXL1VcL0
         gDSbIz+a0HtAZhz7hrxf9oRT/DY0IAzKrdSW7n2UHR1gW+ExaEP5C9s4u4hWK+UDjCNY
         0w+g5S8mL+A7ehO1yBYuDKiiam8Qp0j4gKRuXBHuByxHpD4Qu/2S1PbCig73Nd1uh9J8
         hO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830329; x=1792435129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgRYUW+Bei3Q21MTzmcxk2sT/AX/LHG8dFab1oytdc4=;
        b=YaB8+DVGJ0YlUTQH84n5IsnkO+ggZMVP6v5N42mBPeeNkwT0GvSU6ALpIRRU0j9Fna
         IRBFJi9ZT0MYQaZgRd20ErYTfzQL9N25ySl8xGjxFRv51qTsDeaV/ym//IgHqXEMDOS3
         Pb0yl7/iOOa/XK8vbofCQiyvohYoMwAELawxTWnFROgBiAerGYO9WMdr6R2XLMF7Ghpp
         zL09pDSyccqn7/K/WaiHV0uvo0tP+S3WjQxod1WenAVwe7fKTkE0QO2hm0T0BMofy/b8
         Ou5zrlby40EDZs213/u5I8TvaTlv7QfO41OoO7uEEAFpetPxHZY2515HseiEAIEc2x/l
         4CoA==
X-Forwarded-Encrypted: i=1; AKwUvBxYNw1ahK4hiZ/eETdrjceIhwqQ22qLM2PCx3KPO5LEYi88LUks1j30EmZiUJyDwxjHoJYiIUfL0hy2sbQv@vger.kernel.org
X-Gm-Message-State: AFq9FYJADwAuL+lu+E8an1kKkEjGzaepuULKm1hBWauPWP51f0N6oM6E
	usCmX5Gwvu/TBrLlzjav0kYZvjdoTKQdGKBkFbp7IwHrgoGvP0LRjy6Q8Wo3QKHbUCa5xj12gyO
	Q9eZwCoK+8loDqVanb6rzzid64mis2yL8isosNoNTsi4eOa1R0WMdSMnB+ciyskUxH5Iv
X-Gm-Gg: AYBFou0z8mnmzSBQ894Ob3BGXH+89Wlh7oZmnv1ab9S2GwHEN6HjVXmarp/+0UfNiFc
	UNjsrNSHhmlHVmcfUTnf8QJbNMmYBhDwr6ccgIPn0oP2Y+oLj1VMM+y1w3HvJHmMwsJvpaEq26Y
	QUKhYsxBroxprNfSPcBs6zsPKx+nyuzQOQbXeda+JxpnH9Feeju9xVoetq8yJgK2KAEp4we7m6f
	Dt8pMBTrQOpFpxDmvcZl7Ddtfd6y2abKALiNHC/NG2YWVbHwhL4L62/TdahspF7NO4hVPoxI4ID
	rxU18gkrDOsYvJDQeIHzTdy7djNU0oC7QO1pt07wI0STquoEezXYvQ081stCRARVD/4TzqSNfCN
	Vcmyk+OGt52Q8tWWRS42zW7hFI266Aw==
X-Received: by 2002:a05:701b:450a:10b0:151:bbe4:b6ab with SMTP id a92af1059eb24-16a5ed3d9bcmr13695588c88.17.1791830328530;
        Mon, 12 Oct 2026 11:38:48 -0700 (PDT)
X-Received: by 2002:a05:701b:450a:10b0:151:bbe4:b6ab with SMTP id a92af1059eb24-16a5ed3d9bcmr13695537c88.17.1791830327520;
        Mon, 12 Oct 2026 11:38:47 -0700 (PDT)
Received: from [192.168.29.225] ([49.37.144.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3581f594a41sm26956693eec.23.2026.10.12.11.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:38:46 -0700 (PDT)
Message-ID: <a91f5f24-7371-4d65-8409-e9fa9a4eb2cb@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 00:08:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <20261008-lm_fixes_final-v4-3-fa986071c3c1@oss.qualcomm.com>
 <2mut637ssnnyf7spywezdkx5fpoc4virkr3zuqzj3klwd3ijfr@xk46zya3hgak>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <2mut637ssnnyf7spywezdkx5fpoc4virkr3zuqzj3klwd3ijfr@xk46zya3hgak>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3NCBTYWx0ZWRfX9+qBGVB0ucuo
 r/WkVTVZ4mJ580eEgPo8ajVv9IvbzzKYF5TVxZdBzBt+2RrhFqW+9w+tsfNsuoWaS+HP9ol+LsP
 TdFCb0mbjSsTLNuNxbk3TfDe4I3Wx9Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3NCBTYWx0ZWRfXzNmy4jmJYHiu
 xPK4yZ9D+wGgj/yaWeHniDTX8n4SGtqfOOa5rOWLS71wfXzmtfJdwDTTFjv99nxXGnYN5SOWpQ3
 SPYmnNFvGFX3HCa4wD+D2G2XyaJwS5H5+TgyFbJx1AROIx4HsYuZj4lB1vDwIf8PO95QjI9IocF
 FooO+ZGaWz24+9kj1YQNlM4bwr9gFP5f6KzG7Ugr9Qrf/puWmviisUKNQWfecIgnkQeC6Nzn7mn
 HHfRYmc7hX3xrd+1imKQoJ9tHz9lHyCyVkU3Rx0aD4K6ANGJ9LCQ6XujwOHD+0zXRljCoeyIEGm
 BktZlRh7IVFYGS0CK61+P/5TiSnM1VHtZ7E/wEm/HxcEPANuYwvTv5LN4O5Ed8Bh35HF4bKfUDJ
 5h0O27anIA8ozrE8ylhSstI9PmHcFvMlcvzcluCFzf5OwHWTLOiCWLI8V5gciyBiy5+KN973uH6
 vU83nR/v0HVIrtgnvMA==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acd2939 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=20alU+YIu2uqf8Hyrg49Cw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=k6m01o0hih_xGdVfLsEA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: wr0ckfXEkC3iqyPSBBW84SFOhbJuyttC
X-Proofpoint-GUID: wr0ckfXEkC3iqyPSBBW84SFOhbJuyttC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120074


On 10/12/2026 5:44 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 08, 2026 at 10:53:49PM +0530, Mahadevan P wrote:
>> From: Jessica Zhang <jesszhan0024@gmail.com>
>>
>> LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
>> encoders). As such, don't use ephemeral max_mixer_width and
>> MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
>> buffer widths.
>>
>> While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
>> there is some additional logic that needs to be added to the resource
>> manager to specifically try and reserve PINGPONG_0 for modes that are
>> greater than 5k.
>>
>> The layer-mixer count for a merge-capable, non-DSC mode is chosen by
>> dpu_crtc_num_lm_for_mode(); feed the PINGPONG/DSC derived width to it as
>> the split threshold in place of the removed MAX_HDISPLAY_SPLIT, so the
>> pixel-rate floor added earlier keeps high-refresh modes that now fit
>> within a single PINGPONG buffer split across two mixers.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
>> [DB: reworked to drop catalog changes, updated commit message]
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> [MP: rebased on msm-next; fed PINGPONG/DSC width into
>>   dpu_crtc_num_lm_for_mode() instead of open-coding the width test]
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 54 +++++++++++++++++++++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  7 ++++
>>   2 files changed, 51 insertions(+), 10 deletions(-)
>>
>> @@ -765,13 +781,14 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   	struct drm_display_mode *adj_mode = &state->adjusted_mode;
>>   	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
>>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>> +	int max_pingpong_width = msm_display_get_max_pingpong_width(dpu_kms);
>>   	int i;
>>   
>>   	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
>>   	 * before even checking the width after the split
>>   	 */
>>   	if (!dpu_kms->catalog->caps->has_3d_merge &&
>> -	    adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>> +	    adj_mode->hdisplay > max_pingpong_width)
>>   		return -E2BIG;
> I guess Sashiko is correct here, we need to check DSC width.
Agreed, the PINGPONG bounds check alone does not enforce the DSC encoder 
width. The next revision validates the width per selected DSC encoder 
before resource reservation.
>
>>   
>>   	for (i = 0; i < cstate->num_mixers; i++) {
>> @@ -783,7 +800,7 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   
>>   		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
>>   
>> -		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
>> +		if (drm_rect_width(r) > max_pingpong_width)
>>   			return -E2BIG;
>>   	}
>>   
>> @@ -1374,17 +1391,17 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
>>   }
>>   
>>   #define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
>> -#define MAX_HDISPLAY_SPLIT 1080
>>   
>>   static u32 dpu_crtc_num_lm_for_mode(struct dpu_kms *dpu_kms,
>> -				    const struct drm_display_mode *mode)
>> +				    const struct drm_display_mode *mode,
>> +				    u32 max_hdisplay_split)
>>   {
>>   	u64 mode_clk;
>>   
>>   	if (!dpu_kms->catalog->caps->has_3d_merge)
>>   		return 1;
>>   
>> -	if (mode->hdisplay > MAX_HDISPLAY_SPLIT)
>> +	if (mode->hdisplay > max_hdisplay_split)
>>   		return 2;
>>   
>>   	mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
>> @@ -1403,6 +1420,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>>   	struct msm_display_topology topology = {0};
>>   	struct drm_encoder *drm_enc;
>> +	u32 max_hdisplay_split;
>>   
>>   	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
>>   		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>> @@ -1410,6 +1428,19 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>   
>>   	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
>>   
>> +	max_hdisplay_split = msm_display_get_max_pingpong_width(dpu_kms);
>> +
>> +	if (topology.num_dsc > 0) {
>> +		u32 max_dsc_encoder_width;
>> +
>> +		if (dpu_kms->catalog->mdss_ver->core_major_ver < 6)
>> +			max_dsc_encoder_width = DPU_1_x_MAX_DSC_ENCODER_WIDTH;
>> +		else
>> +			max_dsc_encoder_width = DPU_8_x_MAX_DSC_ENCODER_WIDTH;
>> +
>> +		max_hdisplay_split = min(max_hdisplay_split, max_dsc_encoder_width);
> Should this be min() rather than max()?
The code already uses min() here, as the width must fit both the 
PINGPONG and DSC encoder limits. If the variable name is unclear, I can 
rename it to "single_lm_width".
>
>> +	}
>> +
>>   	/*
>>   	 * Datapath topology selection
>>   	 *
Thanks,
Mahadevan
