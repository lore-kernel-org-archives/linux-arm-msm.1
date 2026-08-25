Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87E35C181
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640649; cv=none; b=OiwpxPOBnfR+fS+juNekglSpFhQUryLPGhzFbNXWalXBTLOp1jP/NW0kKwbfHneJM7SNV9wfcprBueSlb9srGzn5TLBDLptfHRaLAS8116Zd5+dl1VQAjNCjYdCwtSLeuWfUZ0QSESV21PtePzxdQPifX2Ahqn9WmV06ze3Eymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640649; c=relaxed/simple;
	bh=i8VI9BikSJXa+9bQr2dfakd0o8o9kHnUCSJ5vYXXnEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KujDxlX789rPS2G+2v9Jy77PKxO+bTgq/Mzo5NjnhecHVJHLQXNDEgv5T4PkaBF+N0sKE2PAP+Q0F2B2g8uxGbzVdCZHuhOVTqwZKuLNvZpvVZNmmVMs0FJCj82RckWoWkEkz7OQQAkMan/yGEuKzFx4Eq2kPJNKRdKE/DEqUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCrh+/Qa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SuBoQ3Oe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCrh+/Qa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SuBoQ3Oe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RBMR1633924
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNl++Du6VHiN6HOj1SJl6WWq3CHouNZ3mdv2us/L06Y=; b=QCrh+/QaYsIen1IX
	Ylu5f0lZcPYjGYc9jc3pLFpnsV5uYfU/Ol1HyKXxxHvDo3CrjAXmHitvfVyH1Ey0
	xSuWiHjwE6+ykf02DLkaWp3yuRm0zujPrd7DEvTN8rNPehtMbuhqrjygy26U4K1N
	LsvLXnHYLlWiCXxH/dVAg5fvSXD2FFLrnCid1sqBMgAeclQTzo/GXAcEmW/sUSSE
	6xeYhMGKjtQnPdVrZaLf66M3JBa8QTb7uktUazVoUe5D9PeqwKlco3oEADdFg6Q4
	aLyAyHR4/7mV7a2j0qov37hFqvUFpvWdJpeaHH+E+iRKJ8ISSrZ+GTJ+m4eJyC9L
	PtGiIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swram8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:50:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so53437165ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 23:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787640641; x=1788245441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNl++Du6VHiN6HOj1SJl6WWq3CHouNZ3mdv2us/L06Y=;
        b=SuBoQ3OeZzxNRy3YZ6xEl3ZMtBdmofPnBWvMKvRLDKYohf2RtpUSgvMZ0wfdxaL91+
         6iqx6C7Dj1/eXtTEFqvf4zmGnneV6BLQUfb/On7ajDauS8CgRJ/jV7VQIhvmYEdPYs1U
         zpqfGsK9da+KaobnyCy9Nd9ayaH/ABVhrETtLL/tVQMVZRpvakLuJDom1m0opVnAzKxF
         XhcmAvIq6cf8+r4IKrFJZNwVdH110rXzKj+2roGzfs6h6Pd/1E4Niv8yGmWBPi8LC/eX
         bRtbUJMHuxnqT5MYI+o5tWStmJ9q+nMA23lcWaUL7N5hlDkjTS3zvpaMfMUL8B7HX4/a
         Yxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787640641; x=1788245441;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNl++Du6VHiN6HOj1SJl6WWq3CHouNZ3mdv2us/L06Y=;
        b=NuEzetuiChgseDzIMqh23dGuVidnz6bBI3DWry1oKv52DLAe71GrwOLzPhIirMwreL
         c1AeWM/r3xHi4OnDcK9F6nMHKXTnMgjnHU6LFQhP8b/Tn9qb0DcPJdIJHe9sQGHE/TwP
         hSbzCQJLmkqozxxOWpRYt5t0SGcMyPJRRMhYRKEkpHrcagwaTSVacRPp51ksfwz/l3m0
         3uEGLZglJ7qQIG9g6FVaMoFyT897QWfKt3z0KQQnzXqyRndXf06yGJAAhe1l4e/6vHlC
         jx0NBNGE1DGqQe4DhzgCiIcx+SyWwmijciGzCh4XWSjok0W2k/s3Ndnk7ORvqHwS0beu
         Yqfg==
X-Forwarded-Encrypted: i=1; AHgh+RqfIznA59rnkJ30lZql1GzuKKBBOjGCphuJLVOygmPyCdeihc2aN4hYNmkC1JIE0HmL0R6sreC1ooMsqjgN@vger.kernel.org
X-Gm-Message-State: AFuF++n2asSu7Tm+i6jZut+1dlpsGqQZRjUKO5AN1gFUOKBWXho6+CjN
	D1QgnUAG2Q3fwhEBSWGJRnGS/YEIGHBTQnu2mXwxRwKWejuyvTIO1jHcWnLCf4tYADFEsne66g2
	OBkZosF8PbUt2G5Gg7qqJSEIJacEn/oF+8pWCQg1uUmpJzVZMLZ3PclQcvUtm86OOlgJF
X-Gm-Gg: AR+sD12R2QVxH5mJ+wzWVEw5aU6NYNNd2R9q+0JgHHuHHFRxS0897AbbccN6MDepwzP
	3iohpDgUtROyBbxXNFs+rIZPr9siNMG/RN6B0ZzT7UaJrc92yMoalmTE18n1+YeD8dk6SUjTRQC
	1Pra590oEivJZWkDf7rFlyZyvaNs0XUFXJvabOCOacgIsRCRS2FlZ7eQAXodFtR0wSj08oF6LGt
	2igSFmRikN4cjovtHR5LwMU6nv4RBtHomAaGIKr9GpH18KV7Cm5oFPa4hALevf86iIdllnJX6ub
	6Qt2BKpt+86gVzYoYtl5jMwoeMffUuAdtdid8kqm+ldlMbClscKawi6FDoal57YJ/uUOMU6kGlo
	/wATf2SGhYqhkwsVDsAQf/KZW6xpxhtML6c3H6WEq+02Nbvw8FFK7XAIJ3NUUWhcUH8S4jDZE
X-Received: by 2002:a17:903:26cc:b0:2d6:f9e2:af7f with SMTP id d9443c01a7336-2d6f9e2b022mr3980765ad.1.1787640641293;
        Mon, 24 Aug 2026 23:50:41 -0700 (PDT)
X-Received: by 2002:a17:903:26cc:b0:2d6:f9e2:af7f with SMTP id d9443c01a7336-2d6f9e2b022mr3979575ad.1.1787640640848;
        Mon, 24 Aug 2026 23:50:40 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d67cbde1fasm23573815ad.56.2026.08.24.23.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 23:50:40 -0700 (PDT)
Message-ID: <c423ed30-1168-40b3-8b00-6b2f0339b466@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 14:50:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 11/25] drm/msm/dp: move link-level teardown from
 display_disable to display_unprepare
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
 <20260629-msm-dp-mst-v5-11-2ed6aee1867a@oss.qualcomm.com>
 <4las62mpvcuud6m6yo2mz6hiijv73zt27hnha4tlaejubt25x5@gxralblac3m4>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <4las62mpvcuud6m6yo2mz6hiijv73zt27hnha4tlaejubt25x5@gxralblac3m4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pgYMFrwAPnqzde0Y8h_5BBgI6g0KX3pd
X-Proofpoint-GUID: pgYMFrwAPnqzde0Y8h_5BBgI6g0KX3pd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1NiBTYWx0ZWRfX1O5RMPqP78EQ
 bcUbe4yx5Qn7/yt4loWVe+ar1xBU84bOFNE7abBJWwsevL0/6HpZKopU96FjQwMcf4mv2t04SLT
 XYpk4TbzCogFSk5pmlO2aQxJsa8EXNA=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8d3b46 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3ssPzueCi6W0KKmKcc8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1NiBTYWx0ZWRfX+4e1C3JMbDb2
 vFd+NHClhqwmYjREhLEBpgmsWSZBpbpfaOF7h4ZwTlVXdyxnT/7sVy2Qmpey15Kq9YqeJbYpCsb
 Y/t3IDSssM8Ac5mvmXxhNV4XuYOSx+QFCJvem19oS65YlaImObgrBqIQ6YWkrAkh/WcxVbPr+g8
 BcKne6b1mVAW8JFpyXz8m7OIiQ4SgJfmLCFC1JbC0PKdsUX3rMo5IhLAZXD1qaHJFF/+oIntnqB
 /ngXzF2pa7dQgEPJEaQSM0DJpxH3pyDr8RFDNMHY43nohY1GnSnt+fMkuORNAH4KPD0ry9xGdPC
 J28eZ5SEsModE2rU/zKHoQIMchaqHBmRiKTL7hzTS+gzfCIA/CYS7h7OjqcHZtrcRFXRL8LbCcP
 jDP6+wsbynd0q/NA1zdTRpZBTq+Trjn3oYhhThVN5T2iaUXHAQKYQnGQ4+dsqe8IgFTliYoVyiU
 FfODxzx5GWxLlUk/qOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250056



On 7/13/2026 2:20 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:32PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> msm_dp_display_disable() currently mixes stream-level shutdown
>> (disable VSC SDP, off pixel clk, clear power_on) with link-level
>> teardown (PSM config when sink_count==0, off_link, PHY re-init or
>> host PHY exit).
>>
>> For DP MST the same link is shared across multiple streams, so
>> disabling one stream must not tear down the link. Move the
>> link-level steps into msm_dp_display_unprepare() so that
>> display_disable() handles only the per-stream sequence, mirroring
>> the split already present on the prepare path
>> (display_prepare_link vs display_set_mode / display_enable).
>>
>> SST behaviour is unchanged: atomic_post_disable() still calls
>> display_disable() followed by display_unprepare() in the same
>> order, and the cached dp->panel used inside unprepare is the same
>> panel that was previously passed in.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++------------
>>   1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 1af56c84b82e..1680a67284a7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -731,18 +731,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>>   
>>   	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>>   
>> -	/* dongle is still connected but sinks are disconnected */
>> -	if (dp->link->sink_count == 0)
>> -		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
>> -
>> -	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
>> -
>> -	if (dp->link->sink_count == 0)
>> -		/* re-init the PHY so that we can listen to Dongle disconnect */
>> -		msm_dp_ctrl_reinit_phy(dp->ctrl);
>> -	else
>> -		msm_dp_display_host_phy_exit(dp);
>> -
>>   	msm_dp_display->power_on = false;
> 
> The list is no longer powred on at this point. So, this is wrong.
> 
Got it, here should also move to msm_dp_display_unprepare().
>>   
>>   	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
>> @@ -1533,6 +1521,18 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>>   {
>>   	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>> +	/* dongle is still connected but sinks are disconnected */
>> +	if (dp->link->sink_count == 0)
>> +		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
>> +
>> +	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
>> +
>> +	if (dp->link->sink_count == 0)
>> +		/* re-init the PHY so that we can listen to Dongle disconnect */
>> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
>> +	else
>> +		msm_dp_display_host_phy_exit(dp);
>> +
>>   	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>>   
>>   	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
>>
>> -- 
>> 2.43.0
>>
> 

