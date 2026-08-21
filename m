Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD24611E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304454; cv=none; b=At1XLNDajdw/gb0XxSMPai5ErylBJLZvr6dzNK9xq7h8ZSiQ+wJXhfrlJvDprcOMJpFrJQdu7Z5H9ykUfI40J89qiYZnGP4xNg0jaCbPY6LdhcSto8hjkENA7rAmfwtjkDSpbzl+2RO+HzIPbun73qfbsp9h3OXQCbEzw93B6HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304454; c=relaxed/simple;
	bh=v06ZL+KhnCWNkN9XnTrUDo4RAmgktvgR4PZ+8C7CQM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drxEdYNV+JkTirRnCL7N/OLki0l8T3YevEdhsAMPdD4X/u46b+DmjTTUGyAkJ8TUCeivb+d3Vbj+EGK0QwO+DgcqT8y1/J3lVEhyQTiP+DekxGi/QLhX/4IxQqOSoF+8irm7YsedvAfwjsaxShmdGieE4qVwaHhvkuwkQNdGPm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZy9BAPH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SpOZPnd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZy9BAPH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SpOZPnd+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LtnG1570843
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BDrUQKgKdHEQVLENw0WmZLwq0k67Ge3cu3zKv0ARXc=; b=BZy9BAPHjLbDvU3m
	Qxav+Kvj4Oqxj1Wr70S+yX/kwZx9EMHN73YaIzfQGYBQsZd+HpU4GX94NlMvWhgi
	HiW0FX03Kk196Rq2F4Iv2ftfFsGDWg5fn3asLtgzX4AZHShTQJkOOjpJcQ0nQW71
	v9TsMDkGuYB7s6aSl+doRtlJXQrf6schKQzdEWnnxgMYBib2fBXSH4TaVlEzoHSu
	L7/ihDsPyD8kNjnULYpKXXgunu/UfGOTeWc1MFLU0dBlji4E15ZbJQt4Yyid3YDw
	X6cHykb1iEWglfRY+P8VdXmsPnVgM3r2F1VFBfMPDTT8cjgJTS6lujLXvdGOZRpa
	GiMuqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue0yyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:27:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1816734a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 02:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787304441; x=1787909241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BDrUQKgKdHEQVLENw0WmZLwq0k67Ge3cu3zKv0ARXc=;
        b=SpOZPnd+U/2K7LbqA2FLTo1mnRTpbkFP/P+CnfDe0BbF+hG8QC5LkDJ4maTp2vG+NA
         WnP3AgqxAyXghU2l6S6yTUVKr+4Y3LetF7KoPlJCp+bu2yds6AY0oVsJz4F/2lT/7VRl
         fShc5AnORDc6OxaX254oSCbXoubjmZ15hSEN8kdzoyW0qBilK20NzWFo2XiWs0OTS5ap
         Rkr5trz+Bf7SJkxlse7d9NKIu1haK778WvKt438XqCMC3rK3lRSovGEzXioMm3r0H99z
         2NKFEoH6fzFV4+ZFMb+rCfCYh9OKe3uy24WFPxj0Nl9W1epc7B8477jQmU2g1N2+CNBP
         WIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304441; x=1787909241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BDrUQKgKdHEQVLENw0WmZLwq0k67Ge3cu3zKv0ARXc=;
        b=IZ0m4SSF64/EtTeE0ZW0n9S2ub3ZQ9POtC+JmB2iOQ76LcqZxhWDaPwYwkR50ZROTy
         TqcpYZrOz1zzQ8t23E2lY9BklQn46j35jeo4kfPSlPLfaFDp355XSHn9Sf6CA9IXMwTh
         /Uwea/L87ie/vCVGTOvRNWMPhTroPPz9Zsrr8uul/1BsImfBS/shTf9hkgpn72DEXZuk
         86LptTlwT8vfO/VZ8qy96kiaj51hWgh5XgzltOIE0FLAnWJYJW8bPIfDllDlg4u6FhJz
         NCmHItb6tl29JO78SP758WX8poqZiPQtnOq/Vs/ZCQb7LzfjkDCujROcXnC4/6ADu0P2
         mTZw==
X-Forwarded-Encrypted: i=1; AHgh+RpVHk8gRPb9n1WrDvh60iU98eymaka74d/JrQkHYi6VQsNY50V0TsV9r36FkxRIJWhRdYim0bVJoavuX+F8@vger.kernel.org
X-Gm-Message-State: AFuF++n88VJ8MicZIwGkQU8iVbN/MhgGzw9KUygbejYXjpgQpuiSdIqz
	nIDvFo3VXxIQl23HOBjhU4FYvWHMIVD7TKU4lx8+sJaJuS3ITTAP233uE0SuW2MDdaU90zJcTMK
	vaR8Kydlo0fG6ZnbMDm8CAi18L2lBodTXWSYyM6NUvyychS0O+bi+e1oh1I0ljn2rq2ax
X-Gm-Gg: AR+sD10w95rPRUhyisLjpxspz/IUEjsik4qnmffXxiBew2uV+rFpkfJ3Wm4rDuOybgH
	8W9Vi/zsfzs2zvI4pP2v/AqjUfYA86wTCs5mOfaOS8VnLXl0aha8+l0VEpgpX2kzUK120n+l/zw
	cjESqGfoflhatIjza7JWttHo9VAOyTu084qMBq/iV5VI7V8dm3TMR+3DTrcCFEKzR1fziSjowRm
	OPowemlYfM23qOki3hQLu9gxs4R3j2tHd56CjjEf7Z9YGVRgbaPWuBxSt1JTuuINt1NucLJIqcT
	V8DOgxRCxFgWYNKgtB84BNEYcj25dWkr2Y7DPPxVlsrrmG/RnSHTDrgRDxHtjXyoe46zpWTqpsi
	ApMiYpb6NprqHAPVvFsCY59xrLH/fnSvVlH9rGzFCC62CPaoVDP/z5Yk5aG/4rRdst5WZg54=
X-Received: by 2002:a17:90b:1c03:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-395c3a017d9mr8566292a91.12.1787304440624;
        Fri, 21 Aug 2026 02:27:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1c03:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-395c3a017d9mr8566185a91.12.1787304440127;
        Fri, 21 Aug 2026 02:27:20 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4be44fdsm2509958a91.12.2026.08.21.02.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 02:27:19 -0700 (PDT)
Message-ID: <ddbb42cf-ca4c-45ef-94f1-d7c8c7bb53a6@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 17:27:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 03/25] drm/msm/dp: Add support for programming
 p1/p2/p3 register blocks
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
 <20260629-msm-dp-mst-v5-3-2ed6aee1867a@oss.qualcomm.com>
 <fvbqltre4qqdf3ss6huv3wz2exd6lin46pykp7ualvr6att4og@4ti6htrtcnlm>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <fvbqltre4qqdf3ss6huv3wz2exd6lin46pykp7ualvr6att4og@4ti6htrtcnlm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA2OSBTYWx0ZWRfXyKOMO3t4CKco
 BLKq0ccVdoHzxKfb+d43PISvyhNQURDmo96D88/tR6Ehl7JVD1GoMzAtsqnGh3V5Iv91DXKNHRe
 NxUhB3zWzMemdZgU+iHooZvVB7HHqqE=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a8819f9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kZxiwz9scTa994qyGCgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5Ky6Bzo_3Sl6G2quKVM5NAvBr5auqo2U
X-Proofpoint-ORIG-GUID: 5Ky6Bzo_3Sl6G2quKVM5NAvBr5auqo2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA2OSBTYWx0ZWRfXxyheQDoFkqet
 J7hlANtqaDrgKSrmk0xCNrrOn2D1VQBicmrD7KwFXg9a6qv/G1r7SEUwH8kzD5HN2QVhGky3FAz
 I3dxoAEUJpf9Jeadw0X5+GxEqyb3pLurPLBgcen3QtDwzKhzyxtWZMWIeOyQwIRdInTn0svD91Y
 ejOae6xhQDOCEGIcA/HLM1vjWC6CM6XbE5U0tZA5wuwYPA0kNLqpuyEVJycsZlMCvtvrrQ/AIQ5
 Pmey2Krt911XruilzCcrlN2u00vNgXKw8te+gRjgsLXTRPjnQSNE4TVlVHawLkttVAZ9GWCjMs4
 UR9qr4n0b5bGjNAu1KDRvftV7bXYDtEgIWcdPVjHHAhvp8RYlCj306eOIIRAxdFqU3E9p7I5/kB
 msl/8zKi8/E8Pafumz/SRa5v4nQ1d42A0u9WyzbMLdLOIfCcqrNPeS1qp83SZatsc7QvlEJv1/M
 VYOg4VgNFvLidNg0Wjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210069



On 7/12/2026 7:23 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:24PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add support for additional pixel register blocks (p1, p2, p3) to enable
>> 4‑stream MST pixel clocks. Introduce the helper functions msm_dp_read_pn
>> and msm_dp_write_pn for pixel register programming. All pixel clocks
>> share the same register layout but use different base addresses.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 40 +++++++++++++-----
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 82 ++++++++++++++++++-------------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
>>   3 files changed, 71 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 9cd243411e44..74f481a18164 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -85,8 +85,8 @@ struct msm_dp_display_private {
>>   	void __iomem *link_base;
>>   	size_t link_len;
>>   
>> -	void __iomem *p0_base;
>> -	size_t p0_len;
>> +	void __iomem *pixel_base[DP_STREAM_MAX];
>> +	size_t pixel_len;
>>   
>>   	int max_stream;
>>   };
>> @@ -564,7 +564,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   		goto error_link;
>>   	}
>>   
>> -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
>> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
>>   	if (IS_ERR(dp->panel)) {
>>   		rc = PTR_ERR(dp->panel);
>>   		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
>> @@ -850,8 +850,14 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   				    msm_dp_display->aux_base, "dp_aux");
>>   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
>>   				    msm_dp_display->link_base, "dp_link");
>> -	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
>> -				    msm_dp_display->p0_base, "dp_p0");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[0], "dp_p0");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[1], "dp_p1");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[2], "dp_p2");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[3], "dp_p3");
> 
> It should be:
>    for int i = 0; i < DP_STREAM_MAX; i++)
> 
> Also, you've just added a NULL pointer exception in the crash handler.
> Check for the address being non-zero before adding it to the snapshots.
> 
Sure. here we should check NULL pointer and also check pixel_clk[i] 
status. Will fix it.
>>   }
>>   
>>   void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
>> @@ -1131,6 +1137,7 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
>>   static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   {
>>   	struct platform_device *pdev = display->msm_dp_display.pdev;
>> +	int i;
>>   
>>   	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
>>   	if (IS_ERR(display->ahb_base))
>> @@ -1160,8 +1167,8 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   		display->aux_len = DP_DEFAULT_AUX_SIZE;
>>   		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
>>   		display->link_len = DP_DEFAULT_LINK_SIZE;
>> -		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
>> -		display->p0_len = DP_DEFAULT_P0_SIZE;
>> +		display->pixel_base[0] = display->ahb_base + DP_DEFAULT_P0_OFFSET;
>> +		display->pixel_len = DP_DEFAULT_P0_SIZE;
>>   
>>   		return 0;
>>   	}
>> @@ -1172,10 +1179,21 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   		return PTR_ERR(display->link_base);
>>   	}
>>   
>> -	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
>> -	if (IS_ERR(display->p0_base)) {
>> -		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
>> -		return PTR_ERR(display->p0_base);
>> +	display->pixel_base[0] = msm_dp_ioremap(pdev, 3, &display->pixel_len);
>> +	if (IS_ERR(display->pixel_base[0])) {
>> +		DRM_ERROR("unable to remap p0 region: %pe\n", display->pixel_base[0]);
>> +		return PTR_ERR(display->pixel_base[0]);
>> +	}
>> +
>> +	for (i = DP_STREAM_1; i < DP_STREAM_MAX; i++) {
>> +		/* pixels clk reg index start from 3*/
>> +		display->pixel_base[i] = msm_dp_ioremap(pdev, i + 3, &display->pixel_len);
>> +		if (IS_ERR(display->pixel_base[i])) {
>> +			DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
>> +				     display->pixel_base[i]);
>> +			display->pixel_base[i] = NULL;
>> +			break;
> 
> Here we should differentiate between the address being not present in
> DT (which should be ignored) and any other errors.
> 
Thanks, got it.
>> +		}
>>   	}
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 745ee6976897..238920c45261 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -25,7 +25,7 @@ struct msm_dp_panel_private {
>>   	struct drm_dp_aux *aux;
>>   	struct msm_dp_link *link;
>>   	void __iomem *link_base;
>> -	void __iomem *p0_base;
>> +	void __iomem *pixel_base;
>>   	bool panel_on;
>>   };
>>   
>> @@ -44,24 +44,24 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
>>   	writel(data, panel->link_base + offset);
>>   }
>>   
>> -static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
>> -			       u32 offset, u32 data)
>> +static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
>> +				   u32 offset, u32 data)
>>   {
>>   	/*
>>   	 * To make sure interface reg writes happens before any other operation,
>>   	 * this function uses writel() instread of writel_relaxed()
>>   	 */
>> -	writel(data, panel->p0_base + offset);
>> +	writel(data, panel->pixel_base + offset);
>>   }
>>   
>> -static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
>> -			       u32 offset)
>> +static inline u32 msm_dp_read_pn(struct msm_dp_panel_private *panel,
>> +				 u32 offset)
>>   {
>>   	/*
>>   	 * To make sure interface reg writes happens before any other operation,
>>   	 * this function uses writel() instread of writel_relaxed()
> 
> Hmm, so the comment talks about writel(_relaxed), but the code is readl.
> Is the comment wrong? Or is it not applcable and we should be using
> readl() here?
> 
The existing comments no longer match what the code is actually doing. 
We can fix them in this patch. How about this?
	/*
	 * Only reads a configuration register: no DMA or memory ordering is
	 * required, so readl_relaxed() is sufficient.
	 */
>>   	 */
>> -	return readl_relaxed(panel->p0_base + offset);
>> +	return readl_relaxed(panel->pixel_base + offset);
>>   }
>>   
> 

