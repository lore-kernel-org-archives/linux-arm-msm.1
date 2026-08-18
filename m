Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A643CDBB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787028269; cv=none; b=Y5igKK3jYUA+SyrRQdGA6iLea3mDmLHh+pmC48ud+JlyGbPjiAqnrGmhdRPjuCju+adZUEtb27+oFidSXUPrfyQvizezalcy5kY8+kQtJ8rwwHyyDqHVT2Sa3gtJr011DjZndMa/0vVqGzrkh4u77/sXpUBqb8QsoqaU73gSNCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787028269; c=relaxed/simple;
	bh=tnGp3Kb5DzPKO0lPgp+14Gr0e21tr30Rqzq+JOih/a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqfROHaOjqB6ICC9X8ThXepxfmt8NDU/0F3V5VMPyFseU43jrgxpkKV6CfrDo8Qlf0VaLgpGdannwIha6h9WRzpcvczrujiZm+3/0KDpWwT96KIIJ3j1UNvDIyHkg6KSVtnK1q+XGRabBvMxigCEuKuAjDcAIRFB50DI4XcZdFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4g3Sp8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddFEpDvY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4g3Sp8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddFEpDvY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3Fv273833587
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VhAlrPJjjcR4cgApAcBunef
	pIwGteIoKexT12Xm+PQ=; b=d4g3Sp8TrzXwJwOmUupLetOfSkAkAbo3IrH/0X7V
	r3RDpHZbFTvySya4aXBJnQUmP+pBb2cvATh7XjTLYAcWMLpwH9utxAIHDXTmSX41
	oRqtN7i6d+8Ct+J5ZW4/2BtU1Vdh85Q4dvQu741YawaaKupuGuwMY46MC4/I7fMK
	yYqgnIkTuQ5G4+s5I8NIOYtyeRrHm9VhVPkLX+m2C4MPRCYfeUbbJ7umMSrcfxso
	rFX6Yewbr5nyQeNd579dtQ5ECqTmjPflnYD/Odh9PoiNxQLlhmKJKHUVs6UqZgVs
	ZcvkGP4SDFalGkSrYKy3lFXwEGbXpSMVuHtvq6WEAo8nWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba89sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:44:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so41826181cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 21:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787028265; x=1787633065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+VhAlrPJjjcR4cgApAcBunefpIwGteIoKexT12Xm+PQ=;
        b=ddFEpDvYaqIYZdB6d+oLjpr/6CAOxlJQYA2+2CIOS78f1e6Sf4kXs5QoUZi2sms+Mo
         SNy1bQy5Wa24tofwRkDB3YH0GmTaOXzjrndW0IlQGS9xfpYeC3ZCtJRtxxyZDsmJGEGA
         yHic73LI9S9/J+elvsU2t9AfDYWzrP4API0JZ36oABR3JJwg4+A4OabWoIiWDwQAwhgM
         HiJP9iqc86OWElif9B2GAgbU0rrIUAkmMw6RIq9ESnuLnMM9oHeLKTrpHzksHY3bnarp
         MAESxjESFfvJKspKXAlw53SZwpxGqDgWhXA5dTag0wpWS4qK+gu8Ad2H50CSx45E+aKm
         66Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787028265; x=1787633065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VhAlrPJjjcR4cgApAcBunefpIwGteIoKexT12Xm+PQ=;
        b=WuvC4gtGH52YsbmRdkbuf2RGKLgyCxI5U9YLUx3QaSTHQL3vT69JM5ZYBudhKk56jS
         lH/TkY9qr23SMQ6Yp0KG33X3jAWetrBI7lUR2Gil1sYLQ/9zDPmMNCxOSJnTvakRiUAw
         8yp2nYmflFiwJjl/0CMopQzY6UOsCwEFj5lZZEOAvhV6V3oO/E3SlQkDBYgqPHWEkKqx
         f4JWUaiMQEfZIRdttzUh7QIL+U/dgPv/a7eskY1jmrbC93JwvnK28/EXdnjhABvKMvpT
         6y8GBwvwOM9PgF34YOKOZ1bc+lMi/97gwIC3Y9gcC3V1L5XLreEPBWvf9e7B/8UGYCY3
         fB1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoRA2y99VfT/u8VHAS9KCnJKzk1xkFKAmeQD+QSD41FHsAvAuINrp7/dQmb5AWukUSksROkQqmle8L0biep@vger.kernel.org
X-Gm-Message-State: AOJu0YytssiqoZgHMNcdd4rA60YTj5gE7rq6W2Pljd+KGPOKbeRNM46p
	soiZ3HzOHJdEiILOdN54iQWR6k9mL7ODs0Bw2GvGrmn1sAZ8CHdsAzMi6gdeKcVUfp/I4jGPUpV
	TmZ3HVMvevy0n02xFFknG1fedncCAjpaos921gInHid+R+crO+TIxKgBBKaYBdsdj7u9C
X-Gm-Gg: AR+sD10R4+3OTQF9hl1VY/cONcAMFnqVvUyV6jsPaRcjNxYKO23ApQf2K7HDIAi5gOW
	Sn60oGNXHKSBbVv+Ye9ma1rdKOMErwz1APqdQtJiC9HV0nh1ULnXyzIBWgeXhBBmtQFtuVRSewv
	JFQ+RZTfis3YjzeYnMoLD3pDTQ+te/GcRckp84HfOxJSh56iBitbvmnfOwaya5RzwU0K6l5wmNe
	CCHzTs4JMoIucfWXPlsygdFSa0H4t0Q3pJH1zQmpQl1sqWADJ69b6ts9kb5wpwM4X66zdsMvVqR
	/+tNvXIM8t0ZtL2Kjw7iHZHasd09hlPbokDN7wTzivptXYfVTjj/C854sXGwoSQlLo4UyTtouL2
	luM/cjZXUyij15x/MCwRkUjy0Z2yy+M8TxoD5aL3fPnolaUdm9NrbZiTSZz90cZUR5q/f3Leav+
	gEtHjg0z9mAAIf
X-Received: by 2002:ac8:58c5:0:b0:52d:771a:23f1 with SMTP id d75a77b69052e-52d853cb033mr315816171cf.14.1787028265555;
        Mon, 17 Aug 2026 21:44:25 -0700 (PDT)
X-Received: by 2002:ac8:58c5:0:b0:52d:771a:23f1 with SMTP id d75a77b69052e-52d853cb033mr315815811cf.14.1787028264997;
        Mon, 17 Aug 2026 21:44:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d01a74dsm880330e87.73.2026.08.17.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 21:44:23 -0700 (PDT)
Date: Tue, 18 Aug 2026 07:44:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 07/15] accel/qda: Add memory manager for CB devices
Message-ID: <phiwowaf74wgykqrvkvu2s3ya6eln72jolngpstadjb4vbbdrb@p7j7j2kc33su>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-7-69a02e9090d4@oss.qualcomm.com>
 <wt2pdo3m3nlhvyofuvbsqnvggywx75ucs65vjt3dzrxkrpgztz@xwwlhq2iuiun>
 <c4820424-eff0-4c28-ba77-5b595ed09a4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4820424-eff0-4c28-ba77-5b595ed09a4e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfX5HVliq35FFts
 hc4/wC6unSLvQJADeCT0kcC9kA+ysI+hlrv++mhdOtHX1xVpZQrLPMbJMBlBZRDKYG5xGPA5/rZ
 5al9Zpv0Eowm6xFijGkQIyt+wX6gbpE=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a83e32a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kDtCMvKoDeDWkizO3CQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bAFH_rx2PTPAJypxxOwJAdZZMeOTa3cT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfXwNP11+DT5Fln
 xm4r1v2dgkyyw5m6jm2QeKFY6tzy7gWPWroweSG4H+olGcn0DOf8GqmUV8hkxqjk5NcEqIcH41d
 7kUnH+Z0pYh+m4WFYrXV/oXzWvTPc6a9vZOyYD/aIcNphMkj43P3lajDG4lqgHvqw9XllJwGeCz
 EPWKlk+J4c7qcfWB1Z3MuavejcCjd23dzx3Al5LrOiqHzO373CXqbwzMgA8Kj90dIi7Dvw9ZC67
 k7FOgIBAyqTOZrlWp5/bf2EQz52A4CZHbpwjCg4jgRnK1/QAVXckcv6gHa/Skw9vXDaaAPnDOIC
 ZQlzbgLFL5WkQvALm2wEjwd3xwZW1d8TtD8Pwk3jnvTXwLUR3VbvUhlTVAXq4JwVMmBtF9cgGxC
 dNG430kZ2gradLf2ZvyCCACu04cRn6h2iznoAWX/J+6Or8G1cComHAKwPbB0NQ1vlxzeqvOPRKf
 oL2DPFfYz3B0xpNIBsw==
X-Proofpoint-GUID: bAFH_rx2PTPAJypxxOwJAdZZMeOTa3cT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180032

On Tue, Aug 18, 2026 at 10:03:56AM +0530, Ekansh Gupta wrote:
> On 17-08-2026 12:22, Dmitry Baryshkov wrote:
> > On Mon, Aug 17, 2026 at 10:17:42AM +0530, Ekansh Gupta wrote:
> >> Introduce the QDA memory manager (qda_memory_manager) to track the
> >> IOMMU devices that back each compute context bank (CB).
> >>
> >> Each CB device registered on the qda-compute-cb bus is wrapped in a
> >> qda_iommu_device descriptor recording the device pointer and its stream
> >> ID, and stored in the memory manager's registry. Later patches use this
> >> registry to resolve the IOMMU device a session should allocate from.
> >>
> >> The registry is a plain array sized to the number of
> >> "qcom,fastrpc-compute-cb" nodes present in the device tree: the RPMsg
> >> probe counts those nodes and passes the count to qda_init_device(),
> >> which allocates the array in qda_memory_manager_init(). The memory
> >> manager is created before CB devices are populated and destroyed after
> >> they are torn down, so no dangling descriptors remain.
> >>
> >> qda_cb_setup_device() is called immediately after a CB device is
> >> registered on the bus: it allocates the descriptor, registers it with
> >> the memory manager, and stores it as the CB device's driver data so
> >> that qda_destroy_cb_device() can unregister and free it during teardown.
> >>
> >> Assisted-by: Claude:claude-sonnet-5
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >> Changes in v2:
> >> - Replace the XArray with a plain array sized to the device tree's CB
> >>   node count instead of a fixed 16-entry table (Dmitry Baryshkov)
> >> - Fold the init_memory_manager()/cleanup_memory_manager() wrappers into
> >>   qda_init_device()/qda_deinit_device() (Dmitry Baryshkov)
> >> - Drop the pr_debug() calls (Dmitry Baryshkov)
> >> - Use goto labels to unwind probe failures instead of open-coding the
> >>   cleanup at each error site (Dmitry Baryshkov)
> >> ---
> >>  drivers/accel/qda/Makefile             |  1 +
> >>  drivers/accel/qda/qda_cb.c             | 39 ++++++++++++++
> >>  drivers/accel/qda/qda_drv.c            | 26 +++++++++
> >>  drivers/accel/qda/qda_drv.h            |  5 ++
> >>  drivers/accel/qda/qda_memory_manager.c | 98 ++++++++++++++++++++++++++++++++++
> >>  drivers/accel/qda/qda_memory_manager.h | 55 +++++++++++++++++++
> >>  drivers/accel/qda/qda_rpmsg.c          | 23 +++++++-
> >>  7 files changed, 246 insertions(+), 1 deletion(-)
> >>
> >> +
> >> +/**
> >> + * struct qda_memory_manager - Central memory management coordinator
> >> + *
> >> + * Coordinates memory management across multiple IOMMU devices. Maintains
> >> + * a registry of devices in an array sized to the number of context banks
> >> + * described in the device tree.
> >> + */
> >> +struct qda_memory_manager {
> >> +	/** @devices: Array storing registered IOMMU devices */
> >> +	struct qda_iommu_device **devices;
> >> +	/** @num_devices: Number of registered IOMMU devices */
> >> +	int num_devices;
> > 
> > What for? Is devices array to be looped up to num_devices or
> > max_devices?
> num_devices is to trace device registry with manager, it grows on
> register operation. I'll improve the comment.

If it's a loop counter during device registration, make it a loop
counter. Don't store useless data.


-- 
With best wishes
Dmitry
