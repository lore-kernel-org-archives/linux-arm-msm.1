Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C03BCD17
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953728; cv=none; b=Bj2EH/SkcbnIRpi0R1QcLyhYdLQirq5Z5Smoj75wm8VuSu/F/DkjPg4tOzWuIze5E0IONUrqt17cTQD9WTn+6KcrCst4tFAwX7DLpddQ9C59vPQrllxiDtiNiH9qWl19z/1hyK1mlzHyB7ThkxQqE1uQywDSIifBD4Ir3XR16yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953728; c=relaxed/simple;
	bh=DkBZ47lNQUnj1t8fI6/2cc5t1q8Q2osqwBgWRUDZ5p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFbdV5Xo1TnVOXClJm1feFeP5rVmZFocWEcPfGJ2cqdsSGFm3wYZd5koKt5mFqxmnZ9RTR2xzLcLq3cMbDGcsKn/28Ei1fMllnNlQGdwqmCGfGfANma1ROmrL97r7qLO6bD2eKlhJLqcG4Ys8WXjrtEEJ+yO7MIWNRhatcSFG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4gF4Is0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rub9BkzE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4gF4Is0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rub9BkzE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H72PjB4059911
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=; b=M4gF4Is06pSxY56K
	W3KOFtNM5HsHAYjpCFDzpoJ8wMRVNUAmT2p7b3Ribex5cvyTG+ubAFfuKJNMPV1N
	AyyWnFu09qGPCbxSLwSBLZTZmiSPOsuxNXRLNAvvWPdtlSTi+IjWVy3VWYIXPwfQ
	s3cgXIHPxH9ppMlXGOgudH0+gUzaTEJ4lrdVj66mpLEk6/AKr8zucnJmH9YvsVXb
	jYf3fYfEroD61AVJdHht0op+O4V7Rmybt3iBm+z8g82NNK6C8rQdJg+Txf+5jWUF
	TEsLJfeveNsl4UAdW2TQSAe3iGzW257Tk8eRvYFsWO8q2Aoso5mtZsqenJy9NGP+
	2WXRtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7wtk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ce64c41efso55392301cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953726; x=1787558526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=;
        b=Rub9BkzEFVQNTPYDcmMGRBUcSK2uDR0NN5yeWGzSU5sBbuAgCNIjZPGeStOwluJTcJ
         HgGKkyA1+Py8cN2k3sdam8HvbYSDRrpJ5MN1cDgeXG0mOw94mU3nrocVDewl+WYL6yNZ
         0XBZp0pl+7RrDGkPj9xh/tg71PPGSc4W4i5bDrK+QakMTAdX9wB3LD4zWvWF7b4476HC
         5jhyrvhq83SKvXwByHlkhuvz6/9qxRgVRK4Jsk1aBz6oZNJzhjnVz2psyTaazijIWe+5
         qmnZYX8YZThHnG1rIC8ixNuv3pjpupT6Tiog7mo2xNfwWnpXvlW+4ulbhC5DIjvZ55av
         xw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953726; x=1787558526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=;
        b=rYlNFx5IaxehPukXp2L215xu2MxVnpakbclzZaLnCyWBzo7KJ7f84MCgZl5K0gZBzl
         PB6IAxLHjOKpKg9vP8O2xyRrdOPKU2+4VqTF2+MZLyuxvSWD/rRw14iJBcldFLJQry0b
         8sSw4iTQ/0/Xy8gyzCEVUbSPzc5ZdOaJCUUaIGI/IQsId09tJUOQ1XOBgCV67jiPyDgE
         EJxOFAJjx2cco+crZL0B58yJRk3ZdHsEA/23cNPqNUxKWseEDJ9N+PAooZ80HLIsgnPR
         qyvmROYPl8WxBoHuIn1EoI88h8CUU2zgJeLtN20Fs9DGdeerspuUvNI0WEdo4KltBjhM
         CCAw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4ntZtFvyr4KzAJFajcq05Ln8AF6feiJG3g2ZHX85oKC0Ltc+ML9KCs9bM/bS9gQcWcVY5bdx87tnFe+Bl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi8zUnA4QeaHWWHD+iDeu3fROYmpKM6r//G0DZJA9Mfro82rwF
	+6TVvv6Q0EccyJfCcMUzsGk6KdZQ9V4ZMBApXTtBBYEltO8txsEQHt3AQls7Ajxo+jiyTXXCZTM
	H9UBfpZj5B250JNxU6TROgcJgWtbFjR0yemrQXq7SCKEP96q9IkQG1C8ZV99jlPfHFTBg
X-Gm-Gg: AR+sD10fWO4YTNAPyaeW0jTes1l5gsS6W5MG1/kko7iBLHzTsQcvzqWYLTYHFiP4Can
	zVGP6R7XDA3hu7D1X48dHCXbL3hw/NeXLzMjEunMb8ZYRubDU22OAL3i8WaPca9h6jrqsDS78cl
	ld18joQ8G0ZAEUCAeJijCthP48xw1tOHDyUz9K0dv5jK0zLbR9QCTn15DJrSu8etlGkWBbyuDYt
	rOwW+ZD9JlZrD/hK8FbLsY+pnJd3z22I2xmltHCNEtkLQY4Qhm/RSaMnkcrbvbVe/fLN3LkSSDN
	K3GmBGO+Do6HoNZk4WQSkWFGO246AdpHI1V/CwIJTkGi3varjnwSLNlFsTytzMWaTa/QUBhZGQA
	U42YkhGkitmZErYTbA6eB18oadh0AlgT2gCoWiNIgHZXI0mjK6UUUbKoHlqlFRy6XSQ==
X-Received: by 2002:a05:622a:1488:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52d85380e96mr249900951cf.19.1786953725646;
        Mon, 17 Aug 2026 01:02:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1488:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52d85380e96mr249900321cf.19.1786953725258;
        Mon, 17 Aug 2026 01:02:05 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm8319271cf.11.2026.08.17.01.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:02:04 -0700 (PDT)
Message-ID: <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:01:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
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
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX7WkMre5YlZWe
 ROgQJxcCC/ly6m2ZSU9wmSQFSbgylwTYvlmIaSjjv2VADbSFB3PRQ9cWNV7qgljxuS7jKAaPx4I
 qq8axfB9Ri1ghSB4kubbVtsIXaQ/Nxixzn7x7WO8RZ/gP5p0zgfCQg7+uMTLDwfcQ5M8oQQNZfM
 lNzR2+F4+9537gBzGqBWguZXVzgU9yK2VZM3MwYLDZPpZp+I1TOpa8gp8oaa7MhnKqwmsZnE99u
 t5/x18svSjqgaH51rVR+yDr0T9+xQTBxhvtbIKk98A/Ctbnm/fRhF3fNc/HXwcmYky3/JJLT+Yg
 xRIJtpmYtdPa3ofjzCa61+o0hMQdsOecY3EknWU8K7ViXaB0aI5po8L/oKlg0Y+re+DclCrwCSq
 DifqjOR8vhv3wwk6ooPSMk8l+XpBxB+HcLKiGfKDNMjoUUCMIMq3jiTvqWiL5pLi3MbRev150jK
 NpjWSQ+fzrsFd0RMcVQ==
X-Proofpoint-GUID: 3PH1IgP3jo8-Is_V2lEKiwe1guS-Q1tY
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a82bffe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EPiK6WrKEJDDbvHRsiMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3PH1IgP3jo8-Is_V2lEKiwe1guS-Q1tY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX3obt10Po5qn3
 Mqfknf5t5abHRkqlZ8M0wMZ01HrIG2LCc0qAGHJ15T+VdiFg5+g/ksdCIro0sHNCn39P2ZSHM3u
 VhScDqQFPkYaBkFS3ecJ6GL9Kj0XQ/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059



On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>> The bridge connector framework currently invokes all bridge
>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>> event afterwards.
>>
>> However, not every HPD notification requires a userspace hotplug event.
>>
>> In particular, DP MST bridges may use hpd_notify() to propagate HPD and
>> IRQ notifications through the bridge chain while the actual hotplug
>> handling is performed by the DRM DP MST core. Connector creation,
>> removal and userspace hotplug events are already managed by the MST
>> topology framework.
>>
>> Allow hpd_notify() implementations to suppress the bridge connector
>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>> can clear this flag when HPD processing should not result in a
>> connector hotplug notification.
> 
> Why? Worst case the kernel receives another hotplug notification which
> gets ignored by the driver.
> 
Hi, thanks for reviwing those patches.
Let me try to explain the motivation.

Semantically, IRQ_HPD is just an IRQ notification, not a connection state
transition, and shouldn't be turned into a userspace hotplug in the first
place. However, drm_bridge_connector_handle_hpd() currently calls
drm_kms_helper_connector_hotplug_event() unconditionally after processing
the event, so every IRQ_HPD ends up reported as a hotplug.

Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
cleared, the IRQ keeps firing repeatedly, and MST bring-up (link training
/ MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
not about "one extra hotplug", but about a burst of them within a short
window.

Every one of those hotplugs is delivered to userspace via udev and
prompts the compositor to re-probe the connector. In the window before
mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
and performs aux/DPCD accesses, racing with the MST enable flow.

The amplification also isn't limited to a single connector: on Hamoa
there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
any one connector causes the compositor to re-query all 4. So this burst
of spurious IRQ_HPDs during MST enable ends up amplified across the
whole card.

>>
>> A NULL pointer indicates that hotplug suppression is not supported by
>> the caller, such as the connector detect polling path.
> 
> And nothing in this patch makes any use of it. I'd say, it's
> questionable addition. Let me check other patches...
> 
You are right, I will reorganize the patches in next patchset.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>   drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>   drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>   include/drm/drm_bridge.h                       |  3 ++-
>>   7 files changed, 21 insertions(+), 12 deletions(-)
> 

