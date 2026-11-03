Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689925;
	b=RzJ9OmMFVX37D1WNW/LOgnj6yjpfZE1mq2ibj+1w3fSTENTZw0bFhZUlX5s7pf0yDh3E
	 4hul4wJ/IO8epYjp3488KnvzBgJ6/OrM9HGAAX2ljFJ7o5NZHhOGlSQ+jUy6LTMcFkpLv
	 b4GOgOhuE5rOSF5KXSTFJ9j3uMZLlqJTRCPUrbT4Vo3i0ujcECjZOxisaTHdDBilKqYuU
	 jvefJxGeL2Zmzj2u88fBrO6cGnNYr3egrwb5sLESXTWRiwnCggpCaVYOKdaYQakIykP2e
	 b00I19UYCTldoBd+nIyX9j5xjZGmYsCeqW6tw7p3E6c2fRuMgcWoBuOTcDjeMdMmfiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
	b=iJlPlZBy/Cq2yiYwadZ7ZNLcj4CMFWGLmdAesifUR/lpMGfgte8hMf3AkIszTxBUWSj9
	 srcUNFtzZXi/Tybg0/mJhcJog2UUy2O1zYbwAft0J70854anU1lYGUthPJFHwnYfQNT1s
	 1RBY00SStc+3VD+cPTGdiRGSsKyFoZUxwWQLMk9qZ2uf7gGNgWpl6XqdMSwqGzCIWcP0Y
	 UM1nynIEhtzzEW4REFkeNRGaYcT86J8jxXkI0+L58H5pfYJDTXHoxWRQO3lgir/cHLijd
	 hYQ8i2cTopTU5T0RO0Hfmx3LvQt7i+GL5t/h2gSpWT8FPLnrvGINJSOdbB0lPBYBZfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INxS16Gi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmrogpI4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E77F606A329
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 07:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E77F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=INxS16Gi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmrogpI4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32C1Yk2106785
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 07:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=; b=INxS16GihLdD4J9o
	bT7Yu94iDwUURcwfD+2AVZ1tXp6IEprcYRoDsSXVKEE4go1YO+Uiy8Z0BndMZ7Rw
	qYq6zfg4pq9y8PTy+pJsbyD4QSBqHOPpWbpn05EWaJ4WEIqX2KjG1HZ3+6EnV5cP
	/ZJZQeYQyIE61k1RovTU4qiF6aqrTZAwX9BNpHj+WSio1NmYXF6u5D7+xQE35DdQ
	Z2WGcIl/BDK5P7eWWKYgbsO6B5FGfINE7lSlxmobMyRacnkO0Xz1cGEuMjBw62qe
	BVt2FvHk2aIjP1ZDws5p76wqdl4Wb0JFCO+wkZ/hvvAdPIKtn69VoAr0HKi5PnYK
	sVFTAg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m98ysa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 07:12:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c15deb3794so775601137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 23:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793689923; x=1794294723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
        b=CmrogpI4cg7+e3BOufpA/uFcX4RtcGQhkYZzuN4SPOE0iKme/AFcRZ1Hselbyo4fJz
         0nlcnyex2OPVJPF1yeExdzqkhphvclayuFx+eCxQqAlGrpjvsZG9XyvsbNnQ0temrPsP
         SChdfOBwxxbPkxEOcYPoD5W+H3lhVZSLf1Ff5Kj2e90z+xUlSkSnd/2urHpNmULE0EX2
         M10COca5ecLphShFzE+S/Hs7NeLay9kCDyi97l4e1UQ1eOHj45Kx3nViQPsXZ6dlrEqh
         j9U9XVK4Soai491Q/XM5jIP6If0aISDUgz93bSfnPwVQ5aw2QPzWfWcjrfxU5WVHQCTA
         ru7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689923; x=1794294723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bVxGrizvHlWGyxEpUOac+ynB7o3GHBfw8lkl6I6YiI=;
        b=YIalJ6Ja51jmJVOUpF3UQsIZERAhl72sQJprvgOkYd/9RrB2blN3f61myV2o1hiDuh
         j6pdc5qjhS5REYn4l4lRDTovc/AIX/UFU0RdPTjd+jWDhKSZ5MsgmuBZte2C1r4+zqpe
         W7p6F0+YVFCUpMe5tJpMypR9r8xlpw6xRAFSB6wgOdtaW5Fn6e6aqBuwuVhpDwFKHxU6
         DiQ6tAAf9tkQ5J/IIc/cMut9d6idhYDF1xKzKLzkoqYeYk+35laCTKX3bVvKGjidu2zs
         FHFXppqI7KIfzaJo8Uylfyce3xO9ItwtvP3GubSN+DWLSrB5LOAp+nL3t70RVicUKrDF
         beqA==
X-Forwarded-Encrypted: i=1; AKwUvByEtWkiUea/XT6CLbIKNF+bBU7lHR76T5GYTQ8iAi9Wnv8BtTdLP26BT+fU7SF/XLGa5cWom4wAKNt2iJwp@vger.kernel.org
X-Gm-Message-State: APuU4Z9+NC1n6pGG9opWk0jrkorImM88WjPqj+W503qjrcraGzfHVd1W
	gNtOQhjpspPqS5K4suD5fauCOhyHiQSWBI1Ld10Hr4YfMq3FfBc1g+iXM6SPyDDRWZeSjxO+0Dt
	TynjeXD/U5wPb/e9bEewgIy87rq6oG576iLu4xZEFB4GmA2aIdGFjUVpUb9k+9+sdQHJv
X-Gm-Gg: AYBFou0dYJ8nuAmHWt9xHQTyHtGKx7vub0FoGThsqYPKSpyd9jK24kLahqFQwboTwDV
	lYMeW2yWKDxmpzmTF5pEdKArjwaH1pja2npKcIDXLO8M25W68e+OKCaqLh4GTttuDK8culIRgfS
	O/E5dwDi8VNtodOzWyCICRD/+T5+AvMgVeFN338+oKq6gdSMQIhD/7ZHTqHarveqCHs2lTgbIs1
	zB3yiz/foijoJ7kGWkMSOlGxJ6T1tS+fEmWUBabjF04YnJSL2tu5MGncdAJE9xDY9UlB9M4h1IN
	7ZzGoIwu4T2qjvDM7gWilnfZRdZ2CXEHqouZWBbOtdW+Gp1wKo39rKdXv/mpDRulClLMKYrquVV
	OlxbdyLHE88cOwRnkuib3kgKDrKVeibB+i+IbqcE0+9ow1vhLjPMp+LcuRIzvYQ+soeewsyGCTp
	gRqjA4oIoWZIJk
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr3286583137.29.1793689923242;
        Mon, 02 Nov 2026 23:12:03 -0800 (PST)
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr3286556137.29.1793689917887;
        Mon, 02 Nov 2026 23:11:57 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm26289556f8f.31.2026.11.02.23.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:11:56 -0800 (PST)
Message-ID: <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:11:55 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pNaY0OjYMRAx4dqKwpZbfmI8wWpKsDV3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX5Wz2He1I5BZe
 VUi/BzXFHJxkZXAmp9xG1HMiXNMIcBmpilYr2SqQtiBa8NeWVUw21StNe5oHEzjxI5OCU8wFdGc
 9tCyXyY6QKWPs/ThtC7Dw7XOWprwK24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyOCBTYWx0ZWRfX2IIf1IWegsHM
 Jc/MoqNDKq6v5cPH5WIMsadWLlu5ypa/5xXyEC7h5e5VJ/2sa/a/b6bhGAhPjTRpRoQoIWT62nN
 /TsVg3Co63FlXXHoPOvMV3wMHbS0SLueY4bb6WBXsYamkmEHrWEmrzt/9Aq1ntD/vrr3v2N+85r
 +PMSew1IDB2G8vpMiuuxxT0QIe+G96wLCQFEvZwLGgoXQMBv03oknY3i4Mq1MHmYFjAltB4UEUQ
 xTsz1wyv0aP4SrSDuepw44Jj2zpZ0um3KxRwIYCoktE4TdkRpl+uJtuCD8g+xJnLFdYBY6owMEC
 ZuLdFaUtndTgIPo5oCYkEFjXLmh4vg1tvQc5cph1/POaiq4pBfFW2Ptjfmgw1lf7H6ryYUVezGD
 dhwbohPP9GhT6blpG6UHFATQHCBItDvVQwQsi4zmg2jlb8hzoC+4HMcJLYxgrJpY1LFGykJdP6C
 OVvr/hWNH0YL5Bl91Ag==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae98943 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=Mm-NeIu6uG9qZOItl_EA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pNaY0OjYMRAx4dqKwpZbfmI8wWpKsDV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030028

Hi Bryan,

On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> In order to communicate to user-space CSI2 SOF events we will need to hook
> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> implementations of FRAME_SYNC have CSI decoders which support the event
> always generate it in our case if and only if an atomic user count
> indicates it should be so.
> 
> A flag in the CSID descriptor indicates if frame_sync_en is supported so
> for each SoC that supports it this flag should be true. Since bool is false
> by default no negative enumeration of existing or in-flight CSID is
> required.
> 
> Subsequent patches will enable on a per-CSID basis.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..e9b399fcb9c7a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct csid_device *csid = v4l2_get_subdevdata(sd);
> +	unsigned int i;
>  	int ret;
>  
>  	if (enable) {
> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	if (csid->phy.need_vc_update) {
> +		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +			atomic_set(&csid->sof_seq[i], -1);
> +
>  		csid->res->hw_ops->configure_stream(csid, enable);
>  		csid->phy.need_vc_update = false;
>  	}
> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
>  	return 0;
>  }
>  
> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
> +
> +	atomic_inc(&csid->frame_sync_users[sev->id]);
> +
> +	return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
> +
> +	atomic_dec(&csid->frame_sync_users[sev->id]);
> +}
> +
> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
> +	.add = csid_frame_sync_add,
> +	.del = csid_frame_sync_del,
> +};
> +
> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
> +				struct v4l2_event_subscription *sub)
> +{
> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
> +
> +	if (sub->type != V4L2_EVENT_FRAME_SYNC)
> +		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +
> +	if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
> +		return -EINVAL;
> +
> +	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +	struct v4l2_event event = {
> +		.type = V4L2_EVENT_FRAME_SYNC,
> +		.id = id,
> +		.u.frame_sync.frame_sequence =
> +			atomic_inc_return(&csid->sof_seq[id]),
> +	};

On first look this was looking strange because the id is used for the
control id events not for frame sync. But on second thought it may make 
sense, but the question is how the userspace should interpret those ids?
As of today userspace does not have any info for the VC and csid internal
pipelines (so called lines). So with the current state of the code
the id is VC which makes sense becouse the SOF/EOF packets are recieved
based on VC. So i am thinking of two options:

1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
   and will be well known to userspace for which line is reported.

2. Add and propose extension of videodev2 documentation that
   id of frame_sync event types represents SOF per virtual channel.

Personally i votoe for (1) because it will well fit with stream-api 
support and usespace will have clear understanding of the SOF to which
stream belongs.

Given this in mind it will be good to open discussion with Laurent, Sakari
regarding SOF event with stream api and GMSL cameras.

Regards,
~Gjorgji
 

