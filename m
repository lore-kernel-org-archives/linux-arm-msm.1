Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110BA3BADAA
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953719; cv=none; b=ZVCUBWtLa98qj+15cf8pW03+pJYQe6g4Pv7ESF6F1wHvcsZ/xmNPr+WhqqJ+YHbmDpjWXkU73amM6K2hbcJdykkv4dsDNEcTKFmpErobI0I2IiyPF7D9rAP2F89wo9HQljlUrUokA2DE3ko/3fmcBbYefwSANNMc2vJa6qkMh6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953719; c=relaxed/simple;
	bh=hl9hTk0/OSmCS0pE49Ew9l9BlzwnvUpA3yEcA+C2aJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmjyhqLDB9BRzC8TeU8+0cs/necGVKD7/Dxrk62oAwI7N81RP5uh7tUjjN+EWmBK3I/9lgCs9ZMmvX5e+x1RLS2JV0F97sBLmQooT5UyGALYLlQ6qAVoiNt89YQkr4KwXgfpQ4HveF5kb7KlUdqvca127Y8lIjPUMOnqZOTNdXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSA7haT7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORh1ROa1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSA7haT7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORh1ROa1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H6tkd4663015
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eq8SMRnl+krHyl5tGUy7vPAIIuXfNAkaAWBYuPBe/EU=; b=WSA7haT7QLcAAVEt
	ONRKNoDofW1w8mN1KBhyv1VtIavVNsAZMGd6TJRH3nOCfCKgOgzvgeaMtyj8qscw
	vN7o/MPqQXOmHKRbcn/WW4nw3NJ+m0mi/2CQIzUefxe9K79ureQNZRJe0Dvw2imq
	Bbks4wdqt+M0oWPU2bd+HfNNz1QLxlmPeUOvThVnVCjFCNYZTtMdWz3f7UG4LJpn
	1oX7x2Bv/3MXghQPecuKhF23mUOlAPpj/28IwdP7m7x2nV7xEJ/WMLSId12AqK/i
	sWUHbwxmPd7Dknd5ikp8Rw/cZTCULcXBI3eln8hs0CNTC5wMZVTu34IAdSu7Y2Jn
	Bbjbng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghnwxus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:01:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d7b3b6aa2so32228851cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953716; x=1787558516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eq8SMRnl+krHyl5tGUy7vPAIIuXfNAkaAWBYuPBe/EU=;
        b=ORh1ROa1xU6671TI1N/ron/zAI1bWCpM68nR+pnQbyIF+cjXhioiHAJ+pJXQ+5UmKZ
         trZGxiIXR42BjBHX7pXgGteDxXvi+8FZcN/brOBoyJdbIqhcoYT6evLnrydt895TOOYc
         4k7gmHXopvFHxdOXk9tOVABICYwvMX9bGIR4UJtH1fTt4F81TQ85jvt3fHbnof1hMpgx
         swCjcwLd7y5AJJql0z5ieCPXJwNuUiEkCCw+dV6qtPKMgq/XeyPVT7bZoVqocJXMjDED
         XvEihjmgDWi32YPVuxu3CRtKTbDF7lscCBnVKEpABfOdKwEZTjjnYB/xuBnRllpAbTXp
         qAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953716; x=1787558516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eq8SMRnl+krHyl5tGUy7vPAIIuXfNAkaAWBYuPBe/EU=;
        b=Wfgb8LejahP9DTiPVYZiik/eatQ7WXpaFSdRFXcpoFsETYXtdIzT/T8SD9QKJk8hQW
         WJ1QIghsoY+oE5WgtQCGUT/LUdeCGF+rl947bkPX4pOuChffKBuAmM06tdWiwL+ZP6yo
         qkJQwudZe/L4UKL6POu2phb33owjnDiQsC/WzjIFVLg7hqPCDSvO0Qv5Cad+utgk583M
         0TLI9Vmxk+aTD9QuR4thNJUK3MD76wL93wb/y8d6g3mEM2iUMJO9kgTALMacnG0d5VJx
         S7aKbPNDzlkjxqzQ4x6pKSPmPeUWlXk1VTEWAvJiVOOhfAEBnKmDRTcrMOj60op/Wfia
         vhWQ==
X-Forwarded-Encrypted: i=1; AHgh+RponbBDDAGmJE9X8jroobHOLbqaH0gUFAvd8J9huUcHq4o99C1QW7zYUkxY14LBhv+NJxegsU3f+eq3YbFh@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKngPBhlF0YpHBYrRI87YmKlYgEs3MFBjsqa35K7dF61hnn4H
	0YVDtH93yvIfK0LuiKtO8BPNtKC8n4gfKhUX1awimIHpti/CcZGBA+O84CXmuzuxznUKcACzJ3s
	DfLev3naxg29zlPGAftcunviVpaN+feDmK0heHryAOsAepcs2d+t7zeSHKy1Ry7c/FMW7
X-Gm-Gg: AR+sD11VfbYamWLt+dsYVh0Lq4/iRFTEv2JOlSEdFPtc5nGYtexu8Ra3jqelxTDFg9W
	0LkXZH4LdJQTsZJABJb8GXRPD9zH7MHwNe/H8HRNjE6kRQ3UW71KB41YVrxWI4mGtzSp6M0E/fB
	FHDX66Sq9AulY+48e1P6vnq8JMVtw/y9Q2mMNudKoKo5GxrSyLXxfknLxyIfk2rzVGn7doy/JW9
	9OtJZYtyMFmxMJs0Dw02r4GsXUTs5M/zbel7iX0og6qotZja3YQPSoFBabF0So+aJu7EzCtMmAD
	vgx7tZ9pXKmYKQCPqWhaaQvxBuHa6cHVocFJH7CybWqM73ica8rX1I3UmqoL8UIsTRpb/wloGup
	aQHlMb0gb8Hgv9PPisVDdmw8F2JLlE2UHRzYjefEh7VrHg4PRvaoYQ7w4KjzM1a0VzA==
X-Received: by 2002:ac8:6104:0:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d854ce987mr241475951cf.26.1786953716252;
        Mon, 17 Aug 2026 01:01:56 -0700 (PDT)
X-Received: by 2002:ac8:6104:0:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d854ce987mr241474961cf.26.1786953715521;
        Mon, 17 Aug 2026 01:01:55 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm8319271cf.11.2026.08.17.01.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:01:55 -0700 (PDT)
Message-ID: <d4e96255-814e-4fb5-8d97-50126a61c20b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:01:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dp: suppress bridge hotplug events during MST
 operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
 <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX5p6XWSX044mi
 ezGqXn9Et7kExJuBsRs01LVfzTHr41fILOEjo8RJPYype7ELQwrry053ZckFSsYrMvaQZ2SbGH7
 oHl5fK6Of7ugc3yjz83qPEtB6Lkv2InCtN3HRkazjup6uoggXp1uAZqPju8j/KF9a7uEm1QAFNC
 UaGMrDDQB+b4hnoGp6HR1ZCUWR43bEdbNRqYes8mV5fKFJosvhI7v/Lf95fzKcL0kS/TDooQFHA
 +4HHLg/ZkuYok1ddbwlTeLUnn/LJLFUXE+VzQcde459FCesSFGvSVrNeLPfyaUUqaidJpmukSza
 uN4D5sMmlALxlOdiY6kNzJjRHLTTzK42b2pDv8aMJhYlPU5+qS7tFA8U4NF4M19lKv90JyuUEeX
 GRTv8jhtzGI1RJPWDlxAVzvcnvbie4R6rtJXNcTx/gUM+9tDrL+4kI5lk5KLWe71iSbaKQs22jc
 fePdlP5QxcUCcPpwDdQ==
X-Proofpoint-ORIG-GUID: yfTIIM8ZbBIBqOBbFwAmntj-qS4VsMgq
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a82bff4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4e0XemQSoReXIs4U_p4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfXx3QVWmjHbs6A
 84U/p/wShmNbyIA1PHce7/2QojYhMRkslEq/Zf/PjW/x1H9c5Rwp251pLPShnfMzFrTEFpT8nqk
 XlVt6Ysb2ET0l4LlV8rtsDf5E/02f9o=
X-Proofpoint-GUID: yfTIIM8ZbBIBqOBbFwAmntj-qS4VsMgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059



On 7/12/2026 6:44 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:05PM +0800, Yongxing Mou wrote:
>> The DP MST framework already generates the required hotplug events for
>> MST topology changes.
>>
>> Suppress connector hotplug event generation from the bridge connector
>> path while MST is active, and continue propagating HPD notifications to
>> the DP driver.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
>>   drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-
> 
> No, it can't go as this. The drm_bridge_connector part should have been
> a part of the first patch.
> 
Got it.
>>   2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index 7334d6677604..82ed0dc450ab 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>>   {
>>   	struct drm_connector *connector = &drm_bridge_connector->base;
>>   	struct drm_device *dev = connector->dev;
>> +	bool send_hotplug = true;
>>   
>>   	/*
>>   	 * IRQ-only notification: extra_status carries the event but
>> @@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>>   	connector->status = status;
>>   	mutex_unlock(&dev->mode_config.mutex);
>>   
>> -	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
>> +	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
>>   
>> -	drm_kms_helper_connector_hotplug_event(connector);
>> +	if (send_hotplug)
>> +		drm_kms_helper_connector_hotplug_event(connector);
> 
> But now I can also see that the idea seems to be incorrect. You are
> preventing the kernel from sending the events, but it doesn't really
> matter. If connection status oscillates, then other components might
> notice it even without the event being sent.
> 
Here our original intent behind suppressing the hotplug was
that, under MST, hotplugs should be sent independently by the MST
framework, rather than being emitted along the IRQ handling path.

Following the extra_status approach you introduced, would it make sense
to let the bridge_connector layer distinguish between long pulses (HPD)
and short pulses (IRQ_HPD) -- a short pulse would not update
connector->status and would not emit a hotplug, only forwarding the
event to the bridge driver. Does this direction sound reasonable to
you?
> 
>>   }
>>   
>>   static void drm_bridge_connector_hpd_cb(void *cb_data,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 6835c68fe510..bc93b566fbca 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>   			msm_dp_hpd_plug_handle(dp);
>>   		} else {
>>   			msm_dp_hpd_plug_handle(dp);
>> +			/* mst_active is set in plug_handle; suppress SST hotplug */
>> +			if (send_hotplug && msm_dp_display->mst_active)
>> +				*send_hotplug = false;
>>   		}
>>   	} else {
>> -		if (hpd_link_status == ISR_DISCONNECTED)
>> +		if (!msm_dp_display->mst_active) {
>>   			msm_dp_hpd_unplug_handle(dp);
>> +		} else if (send_hotplug) {
>> +			msm_dp_hpd_unplug_handle(dp);
>> +			*send_hotplug = false;
> 
> Why? Disconnected events definitely should be reported further.
> 
In MST case, MST DRM framework will send the discconnected hotplug by 
msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);.
>> +		}
>>   	}
>>   
>>   	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>>
>> -- 
>> 2.43.0
>>
> 

