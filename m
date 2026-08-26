Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAEE38F945
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730529; cv=none; b=Ghif8zTAcyB2JkbcAFLar1GZEaIQNX8Q5gYsCbwEn/Zzw2p416Grw7loB2I4L4DbhRoNUKlcJWW3yN1oCzWREydjMl7Rlp+cNBPKWSNk/AbhTY5P8ojZMVWfXb91n99p9gEA8UK96SS6BylXwRuz16pGTOxnpGwcT/SMFwwcF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730529; c=relaxed/simple;
	bh=SBAyNArF1fowJKOkVdWE+whmsxYjDZovwLk7X9mp0ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTysNgTahJcEpXHdzXcfArZvI+dRVxqo2JNs26bSQ1SQ25RDIcZL9ACg4ysVaD7H44YGBKtGS52MGjT3MmPpmQukveI/TwN1JUfKhvX9a4McTJzJwPMTTNZZMSoysUpxxV6q0JXYkjwxdLL0fJ6hJxN2Q7sNtbvGt4+xO9U9Ukg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep9pSq1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RP/AKyIm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep9pSq1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RP/AKyIm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q7UHmQ3272150
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmKwLbnsPZFlUAjDTujAFCfYSP2gE+15xnfduYdECbk=; b=ep9pSq1niM+HWzq0
	zbbLJxG7iOUTsPepj2rkGGTUBzPkdR3XT9/rHMHQmjip8/HLVAbTf1b6UH9Gm1n0
	wqCCjhzQYiCvq5bPx52MGVZKFl2eUcQlcRSlsyZLJbpxqN3yI/5o4Ame33nXUkW5
	RWP0Xi0o/xBIezcay2yT2n0MOrX2YKUa+VQbYZdYB3bhEVqPU5gwnY5fid8gyCLa
	5t0Q441+So7NUz58HaA5cJwi4SPTIrYwnFjnGfI6/14TffheP7BQouDRwJ1AFAGP
	K8662v+Z1kXdcuhxd4jTxFQh9UqqDuPxrul56YVuJeLYXy+fxJ6Vn/CQoB3rqQsM
	oz+43w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthr2m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so24451a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730526; x=1788335326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmKwLbnsPZFlUAjDTujAFCfYSP2gE+15xnfduYdECbk=;
        b=RP/AKyIm5BMjVBgHNzgcIf40k8GMBauUsBHMAQER8nW/JF3qUPQKRuiWI3QAS0smMN
         ZID0FcPm0mr8o42d5B0KYrTNtnYoGC5WpQECMXR3170ytqOp991Pb8qWenSMMddH9cKe
         DztfM0gZqCoQMx/0qonQjiL5xyxGOBWjNjfGAaml2YBiE4kmcgxPxRurTUUYEZL/s6g0
         jjaWnCodENgZ/wXuXKAgkbMmi6YXYCWVdHCtN/Psd5xj5wwubAM1hQe+gz36fzXEW6iN
         b1aWUk8Zl5DBC5roJRG5rYtlMguZNB8Obv7WO4AYcIvY8q+N1IAXTaz75H3ptcG1a5cF
         beJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730526; x=1788335326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmKwLbnsPZFlUAjDTujAFCfYSP2gE+15xnfduYdECbk=;
        b=g5M4mfoZCBRQevv//43WKHPFbV5TOfgo5m4WJB34w6kMCxe77yiDOT3QXxlpw94Y6q
         Qx3BPhbZnZuSExPYy5lQQegFMtuXrDeq1mNVQkLWeYcNDeGntGqV1NMoE3ckAa2PyBD1
         5MPqZ6K9AgM45x09XDz3HCg8Z1K7rPBN0oIsyIXC5g1ZGurE+nCZZQuN1MBjjYyv46C4
         dC/2NuDv4iKDLuUmdypYE3NUAI5eM7Fun3EgXCU8Q48TglWTinZPJEESR2QTAyNmk49t
         cMQaHGxRc/UVY10f8aC1fCgNCXQTvQglJnoZLDaz+rA+Z4Zpkd60CxNLhEOCRiGAqoH0
         /6bQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPPRdkzBbGv1YktkqtD2pbnOLydIumNPj/NQSeEphpUL6G4BYxzrjGGaO+xpsJZ8WzvThS0QEzIJrCJXO5@vger.kernel.org
X-Gm-Message-State: AFuF++mHozZgdk5H+z2rvfydW7h7CHbfCt9GfX4Ds4qlWvmj7IlPHib6
	NaZW1RP09+C+/8vNVbpCNlwPZW/KaaOFwerZ0NaygonUnvkaFwqzdo6HkVZiyVXLXZnoZGgnGu8
	pfhCi7DM8cyK1LFeLgjTe1rJYGTFURXR0Cn+tixaf36IJ7p+TIl+Q/1AzffXsxuiZO3Cu
X-Gm-Gg: AR+sD11AF5X7piXycolSaNBoT34lbzIHL7o4hINudF6tuWqkAfkVzSQXW/2vzOgRE53
	1NABL9b4FVSxePked/W3cnLW7J2dLNL+f+046PKnKyuLPQRou9TMhGw/DFPMY5IPNqGMsZqxHK+
	ZEl9lWuD6D1Vv15loM9n6KBYa8Kk7cO8+yiPVl/nmJxvwbO89F3iWxeClLDXApgD0SNjxWq64cV
	OMQ1hV5MlRXk5tXrZOoRYGGfkzwfNiAXeOk5b02RjmoFTZOu799/IYcQnHRbHvrpEoLvRg5gugA
	JaCik1eqCwxrnMzzz2LGUDgksz/FR+j8hjEIjyjzOD+g/nLwwL1eL8uyp7rdase0Kew/IeCG2rI
	hej5iDcV3yO+WUjBz8zwJFEyW/Nh7HH9dnp4NVHBuQcwGPKvVA7Uzapj4N942gnwoUunKLPiO
X-Received: by 2002:a17:90b:3ecd:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-3966d21497amr8103127a91.8.1787730525682;
        Wed, 26 Aug 2026 00:48:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3ecd:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-3966d21497amr8103047a91.8.1787730525193;
        Wed, 26 Aug 2026 00:48:45 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a5832bsm3060969a91.15.2026.08.26.00.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:48:44 -0700 (PDT)
Message-ID: <96bc9f2d-a0a4-40f5-8281-55c6f9982559@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:48:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 15/25] drm/msm/dp: add an API to initialize MST
 on sink side
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
 <20260629-msm-dp-mst-v5-15-2ed6aee1867a@oss.qualcomm.com>
 <esaigelvp2o7hw3z32mmtlmy4jzvb6v2uofmsvububwbn5oybt@hymmfbamhlki>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <esaigelvp2o7hw3z32mmtlmy4jzvb6v2uofmsvububwbn5oybt@hymmfbamhlki>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8e9a5e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=tepjUtBTXmVVZiRr_ggA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8IJY_Io75wDV-hPza9so_QPL4yV-iCJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX7At52pv5YSUC
 xOWVz+I2kPqcYPQK4pw/w5rT2JD2yL8E0F7KbVn61hI8uOuPBVzs4qvtC+c+D3Tc10+L6jZbnf/
 rp1XGbxLFR894KAR7vAr+V5hFB2M6K7LzT5rsL2QL0zWJ0iENyU2W/LSCwfjrhTGiL95905CZWn
 GucrH3urUva7dVldlxAkvFR8g7zUsDK35j2Ir8iCrsrCXE/4bcf3M2blb95jldThipYSmqq2DDY
 JKW90w8MLJk+rNl04kynAJqBPAacIAdMEHw+b7KY+QmSjktplKPynYYbqgnziPEK9lpZFNQaAt1
 5HGvgEhhl+hyvTaQ3u2szmTP/J94WEqptVu7V0w6qFmNSUCiwn0kOOXScmSUBChr0W4S5lrc9QM
 z3sLXetOkOWa1FsiuIH2STgmnJ8zCfxZFuD1YR8E8YGc3L8UcvyjAvX7auHQZZ0IBSsFgImeV1p
 io0HmpM2crkqsRbLHfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX5QhzXr/hclfq
 /vGQH7NTySoxpWUCHNq0PNPiUwTDS7X1+TaF5lwAyoeLnSn6vdBqKMDdGBsxh4LCUn8PhD9ZHGO
 /3U5GQNMt432wudIm5CBMxZwRSbOhQo=
X-Proofpoint-GUID: 8IJY_Io75wDV-hPza9so_QPL4yV-iCJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/13/2026 5:35 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:36PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> If the DP controller is capable of supporting multiple streams
>> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
>> DPCD register to enable MST mode.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++++++------
>>   1 file changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 5786e598a406..c3be656f10ee 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/string_choices.h>
>>   #include <drm/display/drm_dp_aux_bus.h>
>>   #include <drm/display/drm_hdmi_audio_helper.h>
>> +#include <drm/display/drm_dp_mst_helper.h>
>>   #include <drm/drm_edid.h>
>>   
>>   #include "msm_drv.h"
>> @@ -270,6 +271,31 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>>   	return lttpr_count;
>>   }
>>   
>> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
>> +{
>> +	u8 old_mstm_ctrl;
>> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
>> +	int ret;
>> +
>> +	/* clear sink MST state */
>> +	drm_dp_dpcd_read_byte(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
>> +
>> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
>> +	if (ret < 0) {
>> +		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
>> +		return;
>> +	}
> 
> Is it not enough to write the new value? Please add a small comment,
> why (reference DP standard in the commit message, please).
> 
Got it.
>> +
>> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
>> +				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
>> +	if (ret < 0) {
>> +		DRM_ERROR("sink MST enablement failed\n");
>> +		return;
>> +	}
>> +
>> +	msm_dp->mst_active = true;
>> +}
>> +
>>   static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   {
>>   	struct drm_connector *connector = dp->msm_dp_display.connector;
>> @@ -288,14 +314,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	if (rc)
>>   		goto end;
>>   
>> -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
>> -	drm_edid_connector_update(connector, drm_edid);
>> +	if (!(dp->max_stream > 1) || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
>> +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
>> +		drm_edid_connector_update(connector, drm_edid);
>>   
>> -	if (!drm_edid) {
>> -		DRM_ERROR("panel edid read failed\n");
>> -		/* check edid read fail is due to unplug */
>> -		if (!msm_dp_aux_is_link_connected(dp->aux))
>> -			return -ETIMEDOUT;
>> +		if (!drm_edid) {
>> +			DRM_ERROR("panel edid read failed\n");
>> +			/* check edid read fail is due to unplug */
>> +			if (!msm_dp_aux_is_link_connected(dp->aux))
>> +				return -ETIMEDOUT;
>> +		}
>> +
>> +		if (rc)
>> +			goto end;
> 
> This also is going to break DP. If you are using dp->max_streams as a
> determining factor, rearrange commits so that max_streams are parseed
> and set only after the rest of the commits are in place (and the driver
> is ready for DP MST).
> 
Sorry, that was an oversight. Those two lines shouldn't be there. The 
patch wasn't clean enough, and I'll remove them in the next revision.
>>   	}
>>   
>>   	msm_dp_link_process_request(dp->link);
>> @@ -317,6 +348,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	 */
>>   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>   
>> +	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>> +		msm_dp_display_mst_init(dp);
>> +
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>>   
>>   end:
>>
>> -- 
>> 2.43.0
>>
> 

