Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885709;
	b=IDNgvg8H2tFr2cFr+nl6Fyy0S3mVohEce8937gZkEU4pEJNeqr6/koFaGCw9PkczZPt4
	 RJ/c6/iiZ8xzWkQxDPQwJMAa8FVl3n/K7rfMrA6IPAB71BqP8u8HXbbLnBUJCYRdfpiU3
	 wlPxAkSwJIbmNYRQbrxKsrqLQhOxyB2YD5Y77+6LC0DV3rqo+T8Ns/YG9K1NKv2i9XMFi
	 zJq6p9w5kd2ZdGp8p8pKlVq/57Ex8CG3QtRn5BDKyG20JFkmW/C2X0LApay0LgjgXtbyk
	 n8a1JFiZ9C9NQSav7Z3S2d2KIDNATIlwn2E+IwKXit6h/LBMmduYnZsPennQqyeaCpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
	b=URWjB0+HptwdPnC4wyt6Q7yI89U64ngo8HHIYZEMjYpZT5OQ0PzBeEMyHYiQPu1NNBSl
	 OqO+mggTeIxjTTBlKJ9VjZ3saex7ShySmP1BcW1ar76B8f0YStzMpwQEENvd8w+/+rkZg
	 sjDKx7bUVKmv3qVH+anLwJmBNML0F4cBvX9wFmTkmBg7qNABWkb7Twzt8YOSxIx7zQttN
	 uK1uVEbgrP1LPRrdfQNt7UrepdEP8IaUMl/6RqKJH1hZWXPf7sna95HjrGmKTF7pwBRui
	 KeEFt9nBpSwrQGKx1bQuYoe+pSMdmJBfbWXmmaGbymUTHZOkFML1GXFkKUpxsUHXoYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sff8DYwC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D3F606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 13:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D3F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sff8DYwC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tB2n3684328
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C6les2P6C3VYvsc8kD6y8hS8
	7HftniHxNnR9mHrsnsE=; b=fzfhnCGS61R5KeLTKzhUcDeAl/a29wFH1O5NR8ZL
	Iw6z2btcm6+JaEDnK9eSRH8JWClTBhbiW1AFYg/luuhSwwunNo2lkKeM8EYe8rvZ
	TV7x7CaQX3OrmcH16RuJqyNZaCGDINouoX1PTlszEStB77ayp7XVqjs4moIZ4Xso
	E6/GKvXrqnzlh6tuy2aaE4RkQ/asZV+KBiDYP4qK9qy4XiIAloPmt7N3Uj5FTN0f
	HCbfzWU/oCCQ7Jmpz8VKhvc9YoBR8esCIXqkfvzL9IGE8Mvw/QTBa0j286UPKh9Y
	aM/5s7PwOIzIj6WL90/6ma44jvKpdaijgodIthb/ysITBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43jat6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:35:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so370351385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885708; x=1794490508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=Sff8DYwCXaZESHDiWF/DLcsetFFHsRTXHO++rGe2bQH3aAzGd/mMmU6E1g3KwYiqTm
         GXWfnoB+DaoQW+v5QYiI7hCgKkpCzOZBaT3mq+7rLFZj5ljiRgGpuFM3bj87xOckKt+S
         o1wpar/lkJRRpcOfTHwi3R3CWrUE06ylpytjBBcn4cEhLRF6QuMLQ56vDWA5PeL7oS4o
         /GUfYoNGB0yxN8qUtSh/TMH9rDHWDRTMIOqni2VQ06leZN5mn2CTryO9TyZ/XdrzCrqL
         AOK6qcKNKgURH4ARn269kP/RZwBS7FACAW9PmNmwAzI4ObqR3miNdEKupjM+zxBKKlYI
         BnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885708; x=1794490508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=EMJmlsoR3vU828077whZcPvucMYv4Mv3CgOS7LaurEaFpJVTtKHt+3r276m7lhw5KK
         PSMD/BbXPI4lDeFojWcItalCsSqKppZkUFgUuAHealPG7CkmzvFsrZYA3AMiZ6Wu0GgC
         e57OPTR+v6T/bqICXOpgofYA/1Rape+4L115/1n0Nt4WW4Jxr3Tg8a1z+1Y2SnY8qbrm
         nKRXdx8R2QzY6Fflbb3hoKcBFXKp5MsGvC5dbJh1t1K435IhT/+TWNMlNDDHbi5hxfSv
         T4dO6GRTHyxxzaEG8MOkWK4MY1EDbLq3CPi9yJ3qLRNnjsAuPHzmGkXfwSnwiZ4t/xT+
         vodw==
X-Forwarded-Encrypted: i=1; AKwUvBxmJPSjxRTjgUSsnvuBp6LrGjSsT2YgWOF0v4LwtdJPUAD3/nPIe3fmMq8YHAtIIfIRLMeZ09NpI18q1hDD@vger.kernel.org
X-Gm-Message-State: APuU4Z/CCcL2gJsNaT74wOACuZt99d4A+0/4j5sC28HdIJVnzVPO8Nwo
	9lJ99i9G0c2qoPvkyXue+9BSAfZNW+aEW10uGeXAfhQskNk0lT3Kdl3jGtld7X6dgnLngD5Ag2v
	QoiIHoAcuMncs3wdS41GRiPeRmRLeJF1FiZmy+ggHK1DYA+a8Id8r/i0qQpbXavhrceOL
X-Gm-Gg: AYBFou34jZuFNwtoK0Xi0Q7DoClvoE0nORYIAw9OnFMSyXK1AKnua9V+3bKEckNYLzn
	uzYZRib1CGQQAK+TFWLGUta2ch9LjcrR8RjOySjLlB1wiFGITqZAuUDBSZDR452diQndjqgDWqe
	kHvdpywL0pCpnF1qr2TWsqvUq9+1mTETS6NzSlZIucW4od4jQ25uh8Dpt6+dfP8dlm6uTG5JkN0
	aeah4MbMhzBAzMohPvjmfxdqGgbCzSe8ecUiQcmccJHgEQe8c7Z3SIj5cH4LE7jt3fGIM7mR8rU
	ffHYVN5DgeTTSnlUlUqMbkvFzzl3jyTQXJ/WJeAlaRO7XZMgPvgciH1PTatVgNc/8430rvh5UDZ
	30hlctOiOlKJ9F0/zryl3MjVUkWuy1tuzxrA7ivHJYF7MIeboLmo8H6rTjZzTu2V2fYO6/VCPSt
	eC7gz/Ccm61siAL3XlEk1iNya8GPN93etpBDtLfrgc4ntebgJl0YeqZtK/8exu
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578451285a.20.1793885707695;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578445985a.20.1793885707078;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e07fdsm10695471fa.28.2026.11.05.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:35:05 -0800 (PST)
Date: Thu, 5 Nov 2026 15:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Message-ID: <6x7dtyvhbk22ri6nnpuo5jpk2ijphaebgbbchoramc4fhnvgjl@slhivetxacte>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
 <179387924494.1025980.3024349339803589757.b4-review@b4>
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
In-Reply-To: <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Proofpoint-ORIG-GUID: kNmZjSjNzsbqdVV0OGPIszLjgIg5nVOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX1qQ9GaNDxy3V
 n0Pjk9sc3BhWmBtTJoiyPLOiQVOIv4abgbqFwm4pgxtX2K25K4sSY/7c2NG+iahVrxjh/OxPzu9
 aOLyQu17qLFKDzl5IgoKvaefzW3pDCZGCKtY6FW4urCqnIyr2tm6/8QFzMLJb4O4jA9iywPLtHl
 ogflOFP+aF67IE9kxlbuuLqmZGyfy65jw8zzwXTdk9r8nVKiAfJZng6C1W0IL84jLm6sj2smdfI
 b+wXwqf7P4JCgX11wURUAINFmiw3Sm0o02AnmHhtDNp+nCLiu/INuQRzygQlFB7nxPwJTa+UqRQ
 EwOMqjE7x/ZRodN0chatORzIoihAxKjiRIZkSyjqn9HaDilUt/HzJRYWZikFwBtwQJidET6fqTv
 ZPsYQAhtmCqFmvBtYjSxBdtub+59tpfwrwI3UpCtP54fz2L9cApV3uD3xv7zpt805WOYP8LBK/F
 jbrgId/ZeBjvaJpcR9A==
X-Proofpoint-GUID: kNmZjSjNzsbqdVV0OGPIszLjgIg5nVOQ
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec860c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P-IC7800AAAA:8
 a=oSBH3dYeosbuySqTTykA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfXzLddCbdZR1h8
 SAPlhZYHwfrTYF/rbE3RJnT0iLVlg0vL7I9syei8N9iaFjH0oeiuNqTEBpfkXXi38688FnXSDYs
 Gbn1JJxUdU0o5/TEniL2EIZJhlB1YXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050054

On Thu, Nov 05, 2026 at 12:47:24PM +0100, Luca Ceresoli wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> >
> > Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> > events to the DisplayPort drivers.
> >
> > The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> > preventing extra cross-tree merges. It will be removed once all
> > drivers are converted. The drm_bridge_hpd_notify() function is kept for
> > the drivers which only care about the connector status and will always
> > pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
> 
> Do you have a plan to later convert all drm_bridge_hpd_notify() to the new
> _extra() variant, then remove drm_bridge_hpd_notify() and eventually rename
> drm_bridge_hpd_notify_extra() to drm_bridge_hpd_notify()?

I'd say, only if they require the extra status. Otherwise, it's just a
noise which is perfectly handled by the wrapper.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
With best wishes
Dmitry
