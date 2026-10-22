Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674602;
	b=KK9sxYP7qe5mQnnjDhSh48eLaf0MKLahwkusDZsgaYL/r7yzZGQTPJY4ZD5BSZEBUBBl
	 yw6vhbQWe5Ek/oJER18k5AksKaL8TFR1JRhwKnc5Rd4eSqsCDSKG4skPsRuX3/7Ci0Cmi
	 ZpJ4XtqCGwL25j3V2n68MFueF5Sk4P0jw23QzLdmjA7K+Hq0dkTg2M9Vmh1XljOnilw18
	 v2SJTR5+H344U+G4NZY1/2zQhltUZi/nZX7sWGXnSMEj9v7iV8xKPZ59vHcyhXEbTsu7b
	 BZuZLzfD5srINYQ8/iW+2LxTTiAIMUZQ6VhPBo2FMUzWhh0+1aLJrmcr8XycEspRmaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674602;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
	b=11sJHwraYmYKEmAm5oN+D9fwix29UVGRtlvcTywTkG8qJ026VJGcW5kkEk1xg/bMstEe
	 51XL729fFxnsabvqXylEuHCYbWMbEcuwSSKGV/89GiJl0kYmbDH3LqGz6rY4hWbqt6Zgs
	 Mx24s+aaLGXDB/iRdUZYszFiM8BTgMgljvr4a6m/BlzP45BuCZGgrcnqULZ5SxyXfdAhy
	 aWLlbj/I3f7jxvbTlhyUalaxI9eNiW8xTGqVc2zwHvpTUjvkUpaXiZj2UNym2GUSIriaa
	 j9V2NutnVyJx+Xt5ne2udcg0rNf1SXhNvRskBYgpFLzbxrik6lJKLa6ntoudLfLPEfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4kWjHHp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XfOBk4kY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE7606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAE7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4kWjHHp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XfOBk4kY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0BLo2918772
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X71VhERMLk9X4yX6oZKoIWZ1
	HUd6drCTkrXIPj5i+40=; b=h4kWjHHp2vQbs7FvHIG3d+zB/9hpThcUAdfi//Kx
	lHQMH9vEM6g/E9b9N2pDrJHNk9G6T90OAYdz8+F60MgY8MuMvPr8nDZhP5eTUl9i
	6oV5tW4+SUoYgUfJuoKQfOHAUv8avm3bVlcT8Z5vH54BGXzunjNOP7P7M9XndaJW
	4R0L6fjgA+khWUgH2DNpSbkAZ2TPpTjXJde1dzqTXIR+wowz5sSREPa7jtRjbkVr
	3wUhdECgFAlstvlduFnVdLXEILlECEh5HeObxXyF7MqoiGvDisCB4QTYknJ0I7l7
	nN9QjCi0F9HwgoaFPKjvmTcdjTU4Z5YuOEl8MS6yteLb1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93abjkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:10:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so400965885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792674600; x=1793279400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
        b=XfOBk4kYZ2mSb5v9FGnXA9+hEhelNQtojd1pHilJYa+tCWkyTl1Xs8FlGe42DtT/9M
         Fu1MPoexSJlA8FHxCODYe8FBRzLj6HqyWcNW1NCbd7csuB0sH9XJbGnd9EYV57spCIA8
         1sHbcd9MLDg6GQTem0tvjs4A0t59/5bkgvoA9mTY9DifPAPHIjRjd+6+ZwpDw/ONsfyX
         l8H1/xfEkUbIbzfqxKgUZyv3HdRvov61Yky9h8+oUn9YHimLMKuAItXbK/KFAs6ocyIQ
         9DklOPsD8cMuWsTzkIIDWChPDVDDFttoscmHmvqolcZqDwU9e5f4Rm8kw+Jm9pMcO0lX
         c8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674600; x=1793279400;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
        b=w5WbM4nZBHI1ni1Owu8yth1XwNKp347N9Dy0VlKauoY1Wyk/4/KEuz/wkBt2MhOC2I
         6iUyV3Ii0p4HLIsQZty2XfzTIYE2e9plyKTRZsQ7Yi+HhoyF+ODHLRVn/2ueGuuUQ4ks
         bSH7HRcD709iXNEIam7otP3D+LyH/zSsAR4jC+5AS013h5wNxxtpHMjhQStcXbLTlGPu
         ecAcKT31VFkspvu8yb+iTc3CE32P1lPn8u+mKrBsP0H35kblOSOF5Iy5mmLEdmNK2E4X
         Juc4bDizCBSulbhzQC9ioH8FPgf02rQN7RgEC7zgyVf13f600ZftKoOsW1xppYGCDTok
         p8fw==
X-Forwarded-Encrypted: i=1; AKwUvBzDwGeuqHrCaeSZ/BCpWGx2kFcvl3zecX0gu6MjP1CLhyUK75fwJI52qPWSb6LbCtKUDSNeUMFcr5pmirp7@vger.kernel.org
X-Gm-Message-State: AFq9FYKdKniEb9YUxVkzxb0VBy/iEBeynri+g8lLpekHANkafxL7zUAX
	nTDsjg0+XJayzgsB0IgpJmcr+5JCAl3bUbmwZcjhWsWLuGQ3W78fKBt/JgetSIAgC32N0oAy7I3
	BTFareN4vBe2OC4qcyy3OW/4W4Ki2dzkvoW+eXnjqec0oDx2y6nPiDGT5ZX6XpG4bqzLa
X-Gm-Gg: AYBFou1/zKyEH+olWRuGI6su2jRkSvCAkLuh/rF0MPP7K/XX1r2e94hy5Z/L49JrTZC
	40zD0iWbfABdqiePaf/IR8kcR931Yrqgrg7qhiOpsz0vNR3hzwlyUeJqupdrRQnENuvKaj8twMj
	nCUeoiscWrhRbi2qLtSpHrNQXVBJVbFlsISvb33lV1sOFstNM4XsLUH1XQs3+dmKv9gpisYg0xY
	cEJ5xhZRB55fJDzK0G9wBGaowXFdfLuhiDCdisjTITaobVpRnPg62D8kzYxGwiqk9/bXVP7hovC
	d50T+G7l3ultaO3IthHXIfRVHzbrDtOdpZhb9l/ziiEIBHcLCJ+UE4UtQ5sQo4ZtmL1GmebGUIu
	NAbQlwX3vwI6kTfZpYbfQQvFRhcAknBP2cgoyZ0G7fdFWrV7jicZz6LAydP7pNhyI5el75SF3YX
	oudXTAMe7n9a/D
X-Received: by 2002:a05:620a:2987:b0:93e:6068:7e8d with SMTP id af79cd13be357-93f57e5e1dfmr891283085a.10.1792674600181;
        Thu, 22 Oct 2026 06:10:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:6068:7e8d with SMTP id af79cd13be357-93f57e5e1dfmr891275485a.10.1792674599660;
        Thu, 22 Oct 2026 06:09:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1b94eb2sm1024058e87.45.2026.10.22.06.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:09:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:09:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
Message-ID: <mdmxy4u5vz7xt6e524l3ghcy7b7yx63lirrnk4s7qzs4pm3oti@wucyw3rgooyk>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
 <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
 <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ada0b29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=qswy0Ei35aWKpRDCTP8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: p5WTjwiwbxUmtwu9uNcno-ZvEU4MvtVk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX5rGC5Lx43kIy
 Q9ZykCgX7tlpjnUDMLAUUGV1xS5I61I+WOnfu+YWmzWReKn9JJ4WDUGnqFZV6kXrCxUhFXWHU0X
 LBgZql4YRn25QPMYQ4A6qJjTdS0jmw0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfXxbFSxBOPx9Co
 PdsulNykrxFG5mS1sW9CLStWL/in26OgPba1z+C/siywawyFebo10Mrdn4ZC0PB3E+bBd269sLA
 KGKC/r77O8SsDbrceCzShy05bnz4tf3JIYAQq1vvEEUcdFvRiUK3cwiFp58RL8hWZ7aIJTdHb4T
 yKYSauH5M5Viczd3AItUREOf2zGhbD0DIVMa9MJcAKVRcMZjjKWk5flzZJWTZG7KhbjRdIVtR7Q
 DKKNGmrgnXHyUF6tNGa+X1YfGiE6m1p0chnUvKtEWwwieYXxlHvOR0DXQjq7XHtGHGJ0en74vpm
 43mxKO4jWjrK/C6MEK4bP2nVMPWTNRDSOIH62GdWwgbtIxmXSfeu+InVQrXOQnm4oBCm7k8Iqfl
 SOvHNL6ec8GQkryAfc6SgwmSpe+vlBFLKp47pGAms7stSle0AsC4Ft+EjR/QHz1saDc3rBkV7XZ
 4CgR+6IlnM8jYYmgDSg==
X-Proofpoint-GUID: p5WTjwiwbxUmtwu9uNcno-ZvEU4MvtVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220052

On Mon, Sep 21, 2026 at 09:53:12AM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 9/20/2026 11:01 PM, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> > 
> > Extend drm_connector_funcs::oob_hotplug_event() to pass the
> > notifications about the IRQ_HPD events down to the individual drivers,
> > letting them handle those as required.
> > 
> > Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
> >  drivers/gpu/drm/drm_connector.c                |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
> >  include/drm/drm_connector.h                    |  3 ++-
> >  4 files changed, 15 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 00feb73e63d7..a51567d19550 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -141,7 +141,8 @@ struct drm_bridge_connector {
> >   */
> >  
> >  static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> > -					    enum drm_connector_status status)
> > +					    enum drm_connector_status status,
> > +					    enum drm_connector_dp_event event)
> >  {
> >  	struct drm_bridge_connector *bridge_connector =
> >  		to_drm_bridge_connector(connector);
> > @@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> >  }
> >  
> 
> It looks like you only changed the function signature. 
> Don't the "bridge->funcs->hpd_notify" inside this function need to pass the event?

This is being handled in one of the next patches. Indeed, maybe I should
squash the patch into this one.

> 
> 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
> 		if (bridge->funcs->hpd_notify)
> 			bridge->funcs->hpd_notify(bridge, connector, status);
> 	}
> 
> 

-- 
With best wishes
Dmitry
