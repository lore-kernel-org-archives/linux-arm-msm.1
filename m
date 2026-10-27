Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101909;
	b=VJxflUiGk05KE810BGuZ173oCBvxnbnZD0w7pd4BltHOsnnX5uVshrmKPmdt60JAx0jI
	 5Vj79J8wCVCR+SDyMng0NRyWGmnysx0iRcgMuWflzaudLCJUsibCFL/WUe26kTHyngjF7
	 SGwkmDWMGmhKjMmfdFjPF9hIMGeUWwcJaoOt/nqIlQMA7WkTcfzFXscsEwfEAOqoYFr3V
	 yHw4J4DAvQHY4e7bfYbgjSgFqKGdhDdf964PFb/H7q92zryJyQl1EYfqdNAFBB7jkuIXi
	 NTGldSfBHRwlRZbwSVUBNKJFlil1vt7m2CE3Po+Iqzv80OlEAbuyiV7ze7yvYYMKmyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
	b=4KUKGQCPrEaQnpi/kmGYwJQ+dK6GQGaoI3wG4Vt1uZu5ILw4iRdRydIA4DhE2BxU9MAp
	 hcKEqtadB1ulzLTtCwtp3JHVSzoZrCBZMg2Lt171JNw2bFCC/WC8+qfNmETSYfy4qAVz7
	 0NCo5Ed1fI5AHBNQCJ6/aVv/uUObFY89i09Jnq5EcganEgTiGt8WVROqxecKjQ38vTDfI
	 cvKpyVRbNxllap/5jSuC5SHPp/2uZkOe/Jl5tIuKkehTsE1KntNb0V9BqP6ZfBEDjU+gT
	 PxD2j3dxWrIzPmosOJN87ZyNYckeKH63BxiTNr7GHrdeM/dQ/yrlyfKRMPTSR/zJzMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1mfuL7S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODjG4Tp6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14724606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14724606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1mfuL7S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODjG4Tp6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdwSb1061068
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4W3OqlKiBwfz5eOJMTRV/rIc
	RtmzZqXVHzyrSvnxP1E=; b=D1mfuL7SsPPdywV1ReO5FFA7LhAPLjwRRqGIXf5P
	zHtT9DGm5cK7aTPGPks/P9Tp3ff5LKQNkHUi1YVw4uQZDKdHMtxyca9OI4ORMxWA
	M0qHs20gmke7Jm1Ro6H3/CpWT8JkzH30zVEyPPuQ0OswNev4I7RQ381fWXOClVRR
	kQX9ZFhdwY6v6uMd2DyCDn12HCMkp8yv0W+efd9Ulldrq7jkk9bxcvNyyaiHrIm1
	yOCyBIWEwV9qfwg1kOiGI/p/GoLgs/KhI2n87VNnAom40WMY+IqIvknE8yLyux3S
	7OOPInAJcEHMHv+WquBkag64NvySmob2o+UL6KSZatGoeQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9bhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:51:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eab0467c89so5157563e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101907; x=1793706707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
        b=ODjG4Tp6sYiSpQUj1ak18Nww2EFA8xoVf4jLK4DanUOjGarjW17SW9/Bdw4Y/IYMbt
         UTTNizatXJaJs7YM0F3QMpZMTkpby4dHrLUk9ux1xLGeZvMzEZ7ehivcczSpuo8hpNED
         lpLKJZUCA1xJMNnkY+MEBjQFR5TFa0g1gSIWfq0LdmHoWKo1hS3ipCokM0PYhu+yVbmE
         e9LKIUzDl7oQOnBr8BjER4Obe1uPx5xEjmbDXi5mIk8fC7pM/UmJCxyHyzFJ+S/wmZdS
         IY9ssstHX9apHU6RjJisdqGsV0g7PMSFoe0MTCsw1vUP/MRcpl3nFeFx8uYGwc+5RK6+
         7s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101907; x=1793706707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4W3OqlKiBwfz5eOJMTRV/rIcRtmzZqXVHzyrSvnxP1E=;
        b=qjvorIbagiYGQvBVknTFUIA2UqSN8QfmyKy39AUVimG32otHynmVUxA7jhysgZ5OA2
         yX2RrqzXS9G9YhhPtBo+z9VhgYiGfgGIFFGpS5Ef0F5l4nxUOWCTR48oo2bjVe/GsaCl
         saDHUwS00fev1YkA1RBbAhm9S2vFYq1cIZLmiUAPunKUvmN8FiME80b9+DJ+JxCbUZL1
         D3ItJvmTbd5fILQu5nyCcVxvA0pYdbrkFxoBvbL9aZELTkZERU7apmGiklkwLt8skgAq
         ACulO5kuqcTvgfaRR1ZotiGjnNN0NANfmrcUBBi9U+btQzx90ezNe+cvYqw0Vlyv4xOa
         SzpA==
X-Forwarded-Encrypted: i=1; AKwUvBxxqfz3cm44tUUSGCJ27Cs5GHjK663kFw7qOVE63T1M7DpVXa6iqRGO2Pn3iUY400m2h2LYWwKZta/foZHg@vger.kernel.org
X-Gm-Message-State: AFq9FYKl2W4XFr7tSll4NIbw94nJUkQwD8V+NYk8bq1fckZIjrkTJK4K
	BvUsZwCfSiiXySc0o4oQxLp12U5KidXB4aCbVzsb71WUERvFh7C+LTHn3xc5D6hyv8zngnU4uVJ
	cRWScPT+d+9sXSaxq7qOlZEPmQpfVBgME93VLUJvoWYcQSvydmJf+/Gyl/oeFKFJ8VC5r
X-Gm-Gg: AYBFou3E7//emG6b7idTvJcAfWqPaoqaguoroKd8D78poyr9qWAoqrxNuVCtT5DJt9W
	ElAXkDF3Xwr6YxX9go8zxmDc1ZgTW0eSuSvp3Dr73k8yKoB+U9+Usedyr1zJ/0VpRg82mt8E3pd
	BEOhhYvL23pxtKSBtWvHLRkDQLJnhsXOI694C8qq5eGiqEj5qFPbTGQyvpemj0KTN6/V45cpSBR
	HO45I0N97POcyvU0PR0L66wA7xffAdgSOZD08y22r/LbKLuv7qxg3tAHBWpUcnOG0Vxf8Zg1BlC
	0aVUtgln7+Vvpaf3e0sOf4xsLeclyjvVd2JGx2927bQcQy4bu5KYdxRbJisaF0NliEPS53VoJxc
	hHVcPTNstH4xyqGhmO8QkQnX7GGpVEZq8g0ELSdmOc6WLzyG4516ey61ub7OlfiqqMtJFb4gUMs
	8L5Ie2YBZ+sOTc
X-Received: by 2002:a05:6122:6990:b0:5ea:e324:7c15 with SMTP id 71dfb90a1353d-5ec232ae080mr3936896e0c.15.1793101907198;
        Tue, 27 Oct 2026 04:51:47 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5ea:e324:7c15 with SMTP id 71dfb90a1353d-5ec232ae080mr3936868e0c.15.1793101906693;
        Tue, 27 Oct 2026 04:51:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm24077941fa.9.2026.10.27.04.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:51:45 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:51:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 04/13] drm/msm/dcp: Add IPCC power notification
Message-ID: <t3vxg46g7jac5th3hrrs3zchss6lzmgm2ga5qkro4cepr3qmnb@ddosuavblhuy>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-4-48aad0fe4f72@oss.qualcomm.com>
 <u7pcn75yh435vuuwqezml37bqfzdztvrywggbmkydkilwe5yzp@myijo4wd2bob>
 <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
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
In-Reply-To: <db88a83c-29e6-4fb9-a874-15c0f186e14d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae09054 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=75pfyCq1Idx6z_e0LXYA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: DCO-vbLrpabhDaR4j02HTglokmW7o9H-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX4dhFiKgm8C5+
 t6PsdnV3J4gU6BiUEHcggAl9TlJAsChVLAKAWiWLBFs9v7VnrRmVSl79zhOZk7DMWyMb1J23YqR
 3Rw2XgaedHDICWOtohmdFWaxNrndl0g=
X-Proofpoint-ORIG-GUID: DCO-vbLrpabhDaR4j02HTglokmW7o9H-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX18Ms0hoc4iEW
 zogiOe2BepVkIh2eHXBvxnaUCBnoc+RBUO6UUpyk2lE4NMsz0kjoKs4Af7baeNwvUEobnugnkrQ
 MoI8EH60Rlz16XO+MW+Jcl97k/sbBwK3BAC1G56bxhywD11/qLY6bMz0gjC2ZKw4eHN/d2wCgL9
 eHcmq0OhlVT9z1AbwSiju44Y97M2IboGCes3fxLHzkGDnU1nCkRc2enKJPOekGpQ2Im0zR1q4jI
 AR3YqhtvydDi7av19LNmyIED5iMBmA90Gl05UM5lWHNr+ksCA88bcexP5z7hbSyAWP7JvtB7sGu
 0t5dxpHxCPK5pSBYMuy/4APIp+TMkltzK0eyB3oFm8yCFgsWWvgzQWmH07QlZRayo03brEelF3y
 4d71J9hSE2/ESEI0fmVwKIEkz+q3UuvT3L7RUr+eSIKyZPAlZQYBvYw/KoCaDxoO2qp321S6/hI
 4dSO01vfwPyU5wqg5zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On Fri, Oct 23, 2026 at 12:37:30PM +0530, Jayant Shekhar wrote:
> 
> On 15-10-2026 18:12, Dmitry Baryshkov wrote:
> > On Thu, Oct 15, 2026 at 01:08:24PM +0530, Jayant Shekhar wrote:
> > > DCP may be power-collapsed while the VirtIO transport remains available.
> > > The host therefore needs the platform IPCC channel to wake the firmware and
> > > to receive notification that it can service HFI queues.
> > Is it allowed per the VirtIO spec?
> > 
> 
> As we discussed, its not compatible, will address in v2.
> 
> 
> > > Add the IPCC mailbox client and power-notify interrupt handling. Wake DCP
> > > before VirtIO queue activity, wait for the firmware acknowledgment, and
> > > notify the response queue when the IPCC receive path completes.
> > Don't describe patch contents. Describe your design decisions. The
> > reasons for the flags, init/deinit functions, etc.
> > 
> > > Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> > > Assisted-by: LLM
> > > ---
> > >   drivers/gpu/drm/msm/Makefile       |   1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
> > >   drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 212 +++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  56 ++++++++++
> > >   4 files changed, 270 insertions(+)
> > > 
> > > +
> > > +/**
> > > + * struct dcp_ipcc - DCP IPCC power-notification state
> > > + * @client: Mailbox client used for APSS-to-DCP notifications.
> > > + * @power_chan: Mailbox channel carrying power notifications.
> > > + * @resp_vq: VirtIO response queue notified by the IPCC receive path.
> > > + * @power_notify_done: Completion for the firmware acknowledgment.
> > > + * @power_notify_lock: Serializes power notifications and teardown.
> > > + * @power_notify_pending: Indicates an outstanding acknowledgment.
> > > + * @state_lock: Protects shutdown state and response queue access.
> > > + * @shutting_down: Prevents callbacks from accessing teardown state.
> > What is going to access it during teardown? Can we shutdown in a logical
> > way, so that there are no accessors after starting the teardown?
> > 
> 
> The access can come from dcp_ipcc_handle_rx(), which is invoked by either
> the power-notify IRQ handler or the mailbox RX callback. An RX callback may
> already be running when teardown begins. Without protection, it could
> complete power_notify_done or notify resp_vq after the queue has been
> detached.

THat's what I called correct sequencing. Make sure that events are
properly ordered. That is, disable / mask hardware event reporting, make
sure that the events are processed and completed, then teardown. See how
IRQs are being freed.

> 
> 
> > > + * @power_notify_irq_wake: Whether IRQ wake was enabled.
> > > + * @power_notify_irq: Power-notify acknowledgment IRQ number.
> > > + */
> > > +struct dcp_ipcc {
> > > +	struct mbox_client client;
> > > +	struct mbox_chan *power_chan;
> > > +	struct virtqueue *resp_vq;
> > > +	struct completion power_notify_done;
> > > +	/* Serializes power notifications and teardown. */
> > > +	struct mutex power_notify_lock;
> > > +	atomic_t power_notify_pending;
> > > +	/* Protects shutdown state and response queue access. */
> > > +	spinlock_t state_lock;
> > > +	bool shutting_down;
> > > +	bool power_notify_irq_wake;
> > > +	int power_notify_irq;
> > > +};
> > > +
> > > +int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev);
> > > +void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
> > > +void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
> > > +int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
> > > +
> > > +#endif /* __DCP_IPCC_H__ */
> > > 
> > > -- 
> > > 2.43.0
> > > 

-- 
With best wishes
Dmitry
