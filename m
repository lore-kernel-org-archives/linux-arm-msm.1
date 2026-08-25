Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AFE3C3449
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787639395; cv=none; b=EF4vFwMR4U/3N8Af+OEzOd2gy5KvVPV3yoMG0+E4CLmNDPKuYy7v/6h8+20OyCdH/stj/QIwrTv37HElzUqA4+lZaWF/erxobHSCTfH+kxcuYsBY5PsCYm7Vf043Jd2TdG5JFqf835CGbwLMSauoQ0KH1aqHeTAJQ77avj5qC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787639395; c=relaxed/simple;
	bh=g5KNmUjdc/dY83W5RHZ9vnL8Ovt41VDidkCfKkSrXow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Su7w0lPmNE3bb7tWOwKk1LuQkLu0do0yWHOg1Lh1ebOJ26ZFvcoLee0wkl6aBfrkxqSOKZr/9peWnIE/pl/LQha2yqCpEeXMDTtGc2Owhq8NYxmq7JfZSv7YovaX/e3LWXkEyvo3snrBIcKp0J21YI+m7kNhz4JP77ndlll0GBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eu+NysLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiLB1XPp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eu+NysLV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiLB1XPp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R4YH120411
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVD1sEVc+eyZK4puuHJzolBf51INQuu/GiSfxhT8Fxw=; b=eu+NysLVghY9JBeD
	iboqW0lFxAjuIouMxYOzDMp1wC0M+AhdWorbqNtew1ZsAigIHXOF8Igsk4BazBpR
	NtztMejLTUEV3kpmMBIvDm7WnP+KU1wSomg5Hgr4kkkJmf0OtGb6pvhkJBukBOXy
	FoCVHiCfD+ujWqDpIokZgSPmenIiVQVijiVyIkIBpeXQCAkxt2aK/RkB0+Q/ajEb
	V4KKvKGJdc8KB1PI25jfiXMfMJ1fWN4t0ZUOCcteFuhoMZDcYuvArWBtjzYpPdCZ
	oB1ULO4brrymOsEa5yXCKfUpiQ8MRqlNZ5Ejvbt7Xax+3vJGuNJEE28E0iS0ZFmr
	MNA1lA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3dtfje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:29:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso4208774a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787639391; x=1788244191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVD1sEVc+eyZK4puuHJzolBf51INQuu/GiSfxhT8Fxw=;
        b=jiLB1XPpzzeTU3SEb6IxkHLTJyRW3E0SupeDTyFdaYm9B0t/WPBkJRolSacDy0vCoU
         5URgWZbRlo0lT6d6n4EleisKUAIU4+mpDzY31EH4ey5vCxXCv8Z6d09hSTIVU3/rKrxO
         IKQZWwRsplF2gvfsPB7aaLFo68elltTXOboMDJBpzPS+rankFx6/aMmZ7mWh3csV21LQ
         bPIo2W7lzeLsvJmzPfWyLPCnAV6nnVXdaWLIemRmrs7ObjEoI3c3+oquMo7yFBh+aTWO
         K8LZ7DGESMwQgyPmlhAxYpIrpDAGUsU1u6hOJiwCKMWibttSvn/Omz6Kk4hw3Jj0ACsg
         tAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787639391; x=1788244191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVD1sEVc+eyZK4puuHJzolBf51INQuu/GiSfxhT8Fxw=;
        b=nbgglUsVfV5yWfak02jcNdFcMoCbm8HAdDu8aCctKOkgXx09plC/FFVuHQo7EQezjF
         tg0jf49ZVlyAGrKS2KjraDBcFbSyW5gIXD7Wp1xAd825XKAhRmBP2LW/ghm2aUZQJcoe
         WNupBszJbrg8Vq5jyS0G0e3jrYAnFJhSC36oLR4FdhD9+saJLj0mV90So4dLQXl+JFak
         avRkNLWroOHyBji9y6KpLDAfV2qGQh1zJPK7bPT21kVShhpAlzw9IPqDI/ExZElnacqK
         0FiexTe/90xqPXvyoIJppVbDtnkbTnemfh/0/k3mGimUnB4TbuML+Na8NN/WwCoeufDR
         7aTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8/a578ArWHyVGjyOu4YDk4oyv0oicHUTDyxSzPVCf2YAz52YEKu6+09Nl0PwzFheviX+YFCxgbUXhMt1e@vger.kernel.org
X-Gm-Message-State: AFuF++mXETf3BrfYGjDH58fneOQf67HKj6mvE72CbvVH9YpftxitPRj8
	bvsDCQtSffXK81s4Ol4PktSgceaGgLTOYUjhqAnkVcUL1wk8d9S6V2Nu6EsIeCPMsTAaCl4efVO
	XdCQhrAHoP31BTQ2OtY2PlURDwfo5iiwRM640zqzFuSsKo6uujWCmaKnzAN+DsYl8fB+j
X-Gm-Gg: AR+sD1066U2SC2c4dIkv9XZQb2Opkcng9nKGDdKaNblFkelXVQOSyhuG3zBRMbzFC4r
	ZzwChb82vd0mA9bfS2fR9IJz7SqRx9KAOYG4IVHVHDzriMIFlCcYF4Io4Xv5XsSZm1W9CROhyHQ
	/w43WfBs/9LtDOMHYpg6wzom9gxbPORUyCOhM7Xuz3oz+LZayTIT5v/tESKQUEZAb3jUcXQzC3g
	21dO1yMYoG5gv5T21wLOIuql4oN/XiiaFEXJpVq65XDlbWgZUS44AN7rH+hbM8Ub5rwkClZnvP/
	cTKThisfg5b8MNMJyb3RmdArK9svj6V79CUSDY4SUlBs237wbQ7h3oS1JO1lXaMr1hYFRcvpMiz
	E+cwCiKJESCwa5rZqAYTVoF20RzxpeXvTRB+WQ3PbXJFVP0rI+6HBIW1NDUKTOJRSR6qmxCn7
X-Received: by 2002:a05:6a00:9515:b0:84e:f90e:492f with SMTP id d2e1a72fcca58-8523c83193fmr7577922b3a.7.1787639391288;
        Mon, 24 Aug 2026 23:29:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:9515:b0:84e:f90e:492f with SMTP id d2e1a72fcca58-8523c83193fmr7577832b3a.7.1787639390814;
        Mon, 24 Aug 2026 23:29:50 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149af7sm2638922b3a.40.2026.08.24.23.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 23:29:50 -0700 (PDT)
Message-ID: <40a10b78-c35a-4738-9cb3-93237c151522@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 14:29:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 24/25] drm/msm/dp: add connector abstraction for
 DP MST
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
 <20260629-msm-dp-mst-v5-24-2ed6aee1867a@oss.qualcomm.com>
 <4ui4ztzjmyyg42azitguvxqcu7zs2xb5xc7cidckyugsfvv7ps@tdybmvmozukk>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <4ui4ztzjmyyg42azitguvxqcu7zs2xb5xc7cidckyugsfvv7ps@tdybmvmozukk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pRY_wLllOvNrjoM9Mc8cUe3QIDlrfDO0
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d3660 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xRxkaW14WWuRBMw0ZnMA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pRY_wLllOvNrjoM9Mc8cUe3QIDlrfDO0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1MyBTYWx0ZWRfX4jdwIhONvH10
 vahlIpvlX+7vxM31hejrz4EZpr3KH6FhiIfS3rU1vCUUaQRahcI/vpUcTIZIJcikB+G4lU0COT0
 PCAF3nbl+dAq7hgwvCKRWhr7A60MQyI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1MyBTYWx0ZWRfX2s6QLrHXgsYk
 He3RzOnuDqB/XybK+VwUe9R1V2/kEv9mlTfsSXtWk8OlLLdCP+fzzqigG6tk7sM4blEGed4gvtU
 uSfLKf1DgXN4cdbCQrCf4w63SXsnOuAcmfsOMlz9OzYGqxJVmE7q/jD4Ch/KArtdnwycLaPugIP
 5lbqkNExP/iinLgZ4UFsjd4pJ8ccztYVTSqak2mf/GOPoAYy8YkFJdgLyurNH411qCQtxbAgxc8
 OcVLN9AinZlz199/r98CgCXwoph/kjzetbdHr/8zL8EMAa/VIHRRAbOANCfJEVpoBDyl7kw2Zt+
 CpGzXu/0SJDnGtXTYvYyInN0yXMVOAYMC/uqPxxwPkNqOD4nQPZbxPJf7kmDB11NC1IGhi4Atcx
 VshiCwuLmejMQH+aF0R27EDyp+4FXJtAIbLQEpnCweMm88tkcwn6oYlvwL6bZr4wEAXqTHRi8+Y
 LitjabLX2VMHBeHH+Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250053



On 7/13/2026 8:52 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:45PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Introduce an MST connector abstraction for DP MST, with each MST
>> connector associated with a DP panel and connected through a DRM bridge
>> to an MST encoder.
>>
>> The connector is only used for MST helper callbacks, such as detect,
>> get_modes, and get_encoder. Display enable/disable, hotplug handling,
>> and modeset sequencing continue to be handled by the bridge path.
> 
> If it is so generic, can it be completely generic? Can we move it to the
> drm/display/* helper code? Or, at least, leverage significant parts of
> it there, providing necessary callbacks from the MSM code? It feels that
> only the connector -> encoder part is not generic enough.
> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 232 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 232 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> index 6a77fdef85e9..12b47a413793 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> @@ -7,6 +7,7 @@
>>   #include <drm/drm_fixed.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/display/drm_dp_mst_helper.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "dp_mst_drm.h"
>>   #include "dp_panel.h"
>> @@ -50,6 +51,18 @@ static struct msm_dp_panel *msm_dp_mst_panel_from_encoder(struct msm_dp_mst *mst
>>   	return NULL;
>>   }
>>   
>> +static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
>> +					struct drm_encoder *enc)
>> +{
>> +	int i;
>> +
> Ca> +	for (i = 0; i < mst->max_streams; i++) {
I think your comment got truncated. Could you please resend it?

>> +		if (mst->mst_encoders[i].enc == enc)
>> +			return mst->mst_encoders[i].stream_id;
>> +	}
>> +	return -1;
>> +}
>> +
>>   static void msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
>>   					struct msm_dp_panel *panel,
>>   					struct drm_dp_mst_atomic_payload *payload)
>> @@ -275,6 +288,224 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
>>   	return rc;
>>   }
>>   
>> +/* DP MST Connector OPs */
>> +static int
>> +msm_dp_mst_connector_detect(struct drm_connector *connector,
>> +			    struct drm_modeset_acquire_ctx *ctx,
>> +			    bool force)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
>> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
>> +	struct msm_dp *dp_display = mst->msm_dp;
>> +	struct device *dev = dp_display->drm_dev->dev;
>> +	enum drm_connector_status status = connector_status_disconnected;
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0)
>> +		return status;
>> +
>> +	if (dp_display->mst_active)
> 
> Can it be inactive here?
> 
Yes, when we unplug, here mst_active is false.
>> +		status = drm_dp_mst_detect_port(connector,
>> +						ctx, &mst->mst_mgr, mst_conn->mst_port);
>> +
>> +	pm_runtime_put_autosuspend(dev);
>> +
>> +	return status;
>> +}
>> +
>> +static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
>> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
>> +	const struct drm_edid *drm_edid;
>> +	int rc;
>> +
>> +	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +
>> +	rc = drm_edid_connector_add_modes(connector);
>> +
>> +	drm_edid_free(drm_edid);
>> +
>> +	return rc;
>> +}
>> +
>> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
>> +							    const struct drm_display_mode *mode)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn;
>> +	struct drm_dp_mst_port *mst_port;
>> +	struct msm_dp *dp_display;
>> +	int required_pbn;
>> +
>> +	if (drm_connector_is_unregistered(connector))
>> +		return 0;
>> +
>> +	mst_conn = to_dp_mst_connector(connector);
>> +	mst_port = mst_conn->mst_port;
>> +	dp_display = mst_conn->dp_mst->msm_dp;
>> +
>> +	/* FIXME: use negotiated bpp (DSC, YUV 4:2:0, etc.); for now use
> 
> You can't use negotiated bpp, because it well might be that the
> negoation didn't happen. Anyway, mode_valid should be returning the
> modes which are even theoretically not possible to be set.
> 
>> +	 * 18bpp (6bpc) as a conservative lower bound like i915/nouveau.
>> +	 */
>> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);
>> +
>> +	if (required_pbn > mst_port->full_pbn) {
>> +		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
>> +		return MODE_CLOCK_HIGH;
>> +	}
>> +
>> +	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
>> +}
>> +
>> +static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs;
>> +
>> +static struct drm_encoder *
>> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
>> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
>> +	struct drm_connector_state *conn_state;
>> +	struct drm_connector *iter;
>> +	struct drm_connector_list_iter conn_iter;
>> +	u32 stream_mask = 0;
>> +	u32 i;
>> +
>> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>> +	if (!conn_state)
>> +		return NULL;
>> +
>> +	if (conn_state->best_encoder)
>> +		return conn_state->best_encoder;
>> +
>> +	drm_connector_list_iter_begin(connector->dev, &conn_iter);
>> +	drm_for_each_connector_iter(iter, &conn_iter) {
>> +		struct drm_connector_state *peer_state;
>> +		int stream_id;
>> +
>> +		if (iter == connector ||
>> +		    iter->funcs != &msm_dp_drm_mst_connector_funcs ||
>> +		    to_dp_mst_connector(iter)->dp_mst != mst)
>> +			continue;
>> +
>> +		peer_state = drm_atomic_get_new_connector_state(state, iter) ?: iter->state;
>> +		if (!peer_state || !peer_state->crtc || !peer_state->best_encoder)
>> +			continue;
>> +
>> +		stream_id = msm_dp_mst_encoder_stream_id(mst, peer_state->best_encoder);
>> +		if (stream_id >= 0 && stream_id < mst->max_streams)
>> +			stream_mask |= BIT(stream_id);
>> +	}
>> +	drm_connector_list_iter_end(&conn_iter);
>> +
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		if (!(stream_mask & BIT(i))) {
>> +			conn_state->best_encoder = mst->mst_encoders[i].enc;
>> +			return mst->mst_encoders[i].enc;
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
>> +					     struct drm_atomic_commit *state)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
>> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
>> +
>> +	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
> 
> Why is it being called here? Don't we need to perform slot allocation
> too?
> 
See here: 
https://elixir.bootlin.com/linux/v7.2-rc7/source/drivers/gpu/drm/display/drm_dp_mst_topology.c#L4511

drm_dp_atomic_find_time_slots called in msm_dp_mst_stream_atomic_check().
>> +}
>> +
>> +static void dp_mst_connector_destroy(struct drm_connector *connector)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
>> +
>> +	drm_connector_cleanup(connector);
>> +	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
>> +	kfree(mst_conn);
>> +}
>> +
>> +/* DRM MST callbacks */
>> +static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
>> +	.get_modes =    msm_dp_mst_connector_get_modes,
>> +	.detect_ctx =   msm_dp_mst_connector_detect,
>> +	.mode_valid =   msm_dp_mst_connector_mode_valid,
>> +	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
>> +	.atomic_check = msm_dp_mst_connector_atomic_check,
>> +};
>> +
>> +static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
>> +	.reset = drm_atomic_helper_connector_reset,
>> +	.destroy = dp_mst_connector_destroy,
>> +	.fill_modes = drm_helper_probe_single_connector_modes,
>> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +static struct drm_connector *
>> +msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>> +			 struct drm_dp_mst_port *port, const char *pathprop)
>> +{
>> +	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
>> +	struct drm_device *dev = mst->msm_dp->drm_dev;
>> +	struct msm_dp_mst_connector *mst_conn;
>> +	struct drm_connector *connector;
>> +	int rc, i;
>> +
>> +	mst_conn = kzalloc_obj(*mst_conn);
>> +	if (!mst_conn)
>> +		return NULL;
>> +
>> +	connector = &mst_conn->connector;
>> +	rc = drm_connector_dynamic_init(dev, connector,
>> +					&msm_dp_drm_mst_connector_funcs,
>> +					DRM_MODE_CONNECTOR_DisplayPort, NULL);
>> +	if (rc)
>> +		goto err_free;
>> +
>> +	mst_conn->dp_mst = mst;
>> +
>> +	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
>> +	connector->funcs->reset(connector);
>> +
>> +	/* add all encoders as possible encoders */
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		rc = drm_connector_attach_encoder(connector, mst->mst_encoders[i].enc);
>> +		if (rc) {
>> +			drm_err(dev, "[MST] failed to attach encoder:%u to conn:%d rc:%d\n",
>> +				mst->mst_encoders[i].enc->base.id,
>> +				connector->base.id, rc);
>> +			goto err_connector;
>> +		}
>> +	}
>> +
>> +	mst_conn->mst_port = port;
>> +	drm_dp_mst_get_port_malloc(port);
>> +
>> +	drm_object_attach_property(&connector->base,
>> +				   dev->mode_config.path_property, 0);
>> +	drm_object_attach_property(&connector->base,
>> +				   dev->mode_config.tile_property, 0);
>> +	drm_connector_set_path_property(connector, pathprop);
>> +
>> +	drm_dbg_kms(dev, "[MST] add_connector done conn:%d max_streams:%u\n",
>> +		    connector->base.id, mst->max_streams);
>> +
>> +	return connector;
>> +
>> +err_connector:
>> +	drm_connector_cleanup(connector);
>> +err_free:
>> +	kfree(mst_conn);
>> +	return NULL;
>> +}
>> +
>> +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
>> +	.add_connector = msm_dp_mst_add_connector,
>> +};
>> +
>>   int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
>>   {
>>   	struct drm_device *dev = dp_display->drm_dev;
>> @@ -285,6 +516,7 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
>>   	if (!mst)
>>   		return -ENOMEM;
>>   
>> +	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
>>   	mst->msm_dp = dp_display;
>>   	mst->max_streams = max_streams;
>>   	mst->dp_aux = drm_aux;
>>
>> -- 
>> 2.43.0
>>
> 

