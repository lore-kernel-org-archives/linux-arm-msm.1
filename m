Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CD529412
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882557; cv=none; b=b1Y/lPDMF9lBJLxwI61sN13hcqVRcZeTl+bEmPUExx3lgHXvx6epz3F8vOAeQsEhrNyexS6YMlBN+K6gcqNrakPMIN/g9s8WAee7ugEiaKttmd1sRUmRrxTtkSn2BpRP9Ka5QG6ObHl4oT2U4w80+Bg2JWFPLWhWa+Hd/gjIufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882557; c=relaxed/simple;
	bh=oLRRWVQaJunuo2Pn1JyDUPmY5bk9k09Er8msNBqYKr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5L30sGG6FDdEXvrrpsVZIGk6Eeq65l6hovuEqvvNReRou6wWnM62nVSek86GdhuEVVB/niNlWX5vUDEqVXPqzSaWYnQZrMwyWdaC7ZPv5oo2nWhHg4myFi7rTALrjeGQhgO8RBjSvpqPmHLmIjbb+7deq94Vj/ovREfKzuwCWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNWX1qtY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czjfzEr+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNWX1qtY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czjfzEr+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdWhu2737445
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 15:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uL3C6X92i3vnucRFu6eOOeXdI3jvIqfwUfDfb0dF6jE=; b=MNWX1qtY6ooLU0Kz
	yUoaIGny/nQtxaIuLcdFZcplNomrPDveZVAEa2EoAwYpGegeWrC+UDyX8UyqhGru
	yJqv/wlimM3IdBlFPrqHvGr2Ywd1keoyWgSI/6Rkrq5vGBS6NUeyDJgbx86mGypz
	f/1F2sQjjvwkiA+PnQ1cJZie2vKhTku8Fd0rboSF8i+o/BPSUPkPi2Xys2665QMo
	Vu6/wvWNm9SiYCFZyTTHbjlagH/XQs4Jjit8GnXeXelskYQlDFu6RoUGnAdEIIYs
	5V3Le4DH/mparl9K61MzAuq5SBuH3yqFEgLtWTAPD4Jbb74QJBDgTdFREZYv3JK6
	EKOvng==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjjxe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 15:49:14 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cb8d1b032so339798241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788882549; x=1789487349; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uL3C6X92i3vnucRFu6eOOeXdI3jvIqfwUfDfb0dF6jE=;
        b=czjfzEr+JRP2VLTw38wnaVZufdK7UNyZjh19NH38iW2u02rd3B0SYnC3StGgs4qyoF
         CYuJQ3TfhpvGYA/ftjdmNAyDLSD8C9Mm9oBx+3vAnsdW3foaPJ+vpIOSnS8hMLkfJXvS
         J9NPhVPAnyDT86xnp2PI0D7P+SknBkk/kChnUUPUkxWojiYUheVt+tKECijjVMncsxdF
         cs8AW++/1cNaf/+wtCt1qE3e91+y92dx6F7gP8kuUQK7ZKyQaD8fvx4bBKBn7VOLi3Gg
         3n2qA2syV3fJnnKWBvytdO1kyMcRMZ1aK2hVgJ2zqbsxCGQRDsAtbtaFpTFOrx2nBrXq
         oeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882549; x=1789487349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uL3C6X92i3vnucRFu6eOOeXdI3jvIqfwUfDfb0dF6jE=;
        b=OPFfgrkt6EZFd+qhmw5vvBHcWxX7GoMmGMLHegpc5uokjB4vQ8kzH1mg10SKGoNmiv
         J6Xh3wDo+OvlSwIOMfs9BWI3UATFxY08mdiB9yIT0MM8NnVIa5biAnXHXYXhYmJp1zJv
         rZcM6MeLzzoETKxOYdeC33JWpL/lqcr50a6r+3EiEb6BktHY5GWcWSR1tMMGEUwwHwDa
         wkTw9c8YCW5PtfpXYyTh663kKE6ghm0J7wOooBCfh36sczjLm3x1b7Rel98X6jMJr0s1
         H1DgJg8pp/xjgodYgF6b8aDqAOOlE7XZ2IVDm0igvfRcfpAPpUrj6UesrxprLwZhi17n
         0u1g==
X-Forwarded-Encrypted: i=1; AKwUvBxc+GlWl6QF7+74QXjzej5h8N4IWKhEK43/fB8OjqCuQXjqgpeGoXG5vRH0whlzO3pv0b/zw4NtmEDrtiIi@vger.kernel.org
X-Gm-Message-State: AFuF++ny0wZ5bChq16q4Foiv6bK+Hxrys0/Y9KQkqMtFeAqjVR+/Cy9T
	KtLVyCmOFkfsug5DGrhdYSbM+LLmzadlX6qYSVpz2TJTQsHiUHGZ0T06u58OGKbTp0OIHi2XDdT
	AzcGfj7M9/svnWgt1xBaEoLBbcFRUyNWiAdg9lgMd2XmJ2+++LQxt8bZgGqzQst6ET/F7
X-Gm-Gg: AYBFou3C6okxBDHKLn+gPwzJ872BSJsoq71IizP5BSde9eyNNweM1S9se7i/v4LqyKg
	D+ku51EvwP8Qsh9fyLrf3DVbMm/tjDQCm8wwLyPFS9zV+dKSU//Dj5dTv+LPfG1JJpJr/iYQPbC
	s8ky47STa3Os7n4Oz6C2hMHqTOuLjK4E2FmQGQHongNVRSPRi9swnDCwRjgMh4JGVAJEnpLmly9
	lBbMZr7AKEWrGSfduJzDPIlcfjU23z18WiHNbxvxwgWoOhFdkCFnaGTt+b62UnuA6BMgQybkGey
	L7XB9Ltkxy02Qp/cBrx6TX23ZDSAP5yWsZxOXWtlgFLyXxNfFuZhocsP8g7ggL4A+865tTPAu2P
	n5orX+Ia32i1QAcraa80FNCQX6qTBZy9P+aYMiPuKIUWKTcRz5GXRaHBCQ1pgqTWtGWJQlcSvVO
	NpaT6+PHaybnjo
X-Received: by 2002:a05:6102:8697:10b0:784:5883:9cc4 with SMTP id ada2fe7eead31-78f75e026b4mr32264137.11.1788882548607;
        Tue, 08 Sep 2026 08:49:08 -0700 (PDT)
X-Received: by 2002:a05:6102:8697:10b0:784:5883:9cc4 with SMTP id ada2fe7eead31-78f75e026b4mr32251137.11.1788882548074;
        Tue, 08 Sep 2026 08:49:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74cbfdfd7sm2648080e87.75.2026.09.08.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:49:06 -0700 (PDT)
Date: Tue, 8 Sep 2026 18:49:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
Message-ID: <6s7mwjzglv5slukj73glmshe4gwfyh6cvimxyeyn6l4r46lkpv@74mpfroj23xi>
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
 <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
 <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
 <CACu1E7H9KsUU=dV+iwQPOOX62+V8S5xstFf2LXhzeE7oSb3V4A@mail.gmail.com>
 <xq2q6jazk2a5atfthzwktn7qhrinxg4duhdxg22qrutgdycbwb@47nosxhcqloz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xq2q6jazk2a5atfthzwktn7qhrinxg4duhdxg22qrutgdycbwb@47nosxhcqloz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX5DludxCY6rgE
 QqGM7ae8TtGjx836GnxjMtTBSwvU5VYNBQbunQAik10d9JPuUBlI/NkOVWJUWHgfdLvPgqWh+Nc
 H3N2I9gR1XtnkRsvPp1Cf8C98si/2Kc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX3mKSnQeZ3lNG
 GA62PyRTBHVq8wIOywTiNf1plGRXWdA8vKn+52a+6+IEvhx7dSrylYLjYkD6dWwDZ+aQPAam7nn
 NvAP/Wxuhj12PTX8WD7O0DoYgNTIe4iaKRDj9C1f0h3dVn1BaouvCb0HBxGBiOY2UFxQxJ6sNOJ
 6+faT2V9gJSo4Qrr9wgMMk4btdhxEfzt4y6db5M6HeOtvgk/fBQ1fNLbRkO+lrfg67PZ4jep3Br
 E1dtsFU0LqfaHaS/02aUqTDovWbh+10YMkL0t2eXRNLNJQwmHK/n3/nRN0Eabs57d9jy4yR5uvy
 E19zxlGCoH/WXAgr/JXDl0nhPBjh1PYZRnaUf5mjUXvJPYNTavgBfg5X0w01xbYgL7NEEptJcYS
 PlaawrjHpvTM2/vNeip6+Unbz8IeiXqIbCIq+6HGEbMUHZ0XiZpp0zuZHPAO/K8ycpZWpupMjAt
 a20xLhURbcZAPsygMfw==
X-Proofpoint-ORIG-GUID: QQv3Q0-gPBp_2R3r7eLF70F8YIZ58p_J
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa02e7a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=hDB9YrpZ_UtSDjAhP4kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: QQv3Q0-gPBp_2R3r7eLF70F8YIZ58p_J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080170

On Tue, Sep 08, 2026 at 06:26:22PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 08, 2026 at 11:09:17AM -0400, Connor Abbott wrote:
> > On Tue, Sep 8, 2026 at 10:51 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > >
> > > On Tue, Sep 8, 2026 at 4:41 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > > > > On Thu, Aug 27, 2026 at 9:07 PM Connor Abbott <cwabbott0@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Aug 27, 2026 at 7:13 PM Dmitry Baryshkov
> > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > >
> > > > > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > > > > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > > > > > > zero whenever the GPU is powered up again and the timestamp reported to
> > > > > > > userspace jumps backwards. On an a702 six reads three seconds apart all
> > > > > > > land in the 500..1200 tick range, stepping backwards twice, and on an
> > > > > > > a530 the OpenCL device timer conformance test fails because
> > > > > > > clGetDeviceAndHostTimer() returns an end time below the start time.
> > > > > > >
> > > > > > > Save the counter in the suspend path of the affected generations, while
> > > > > > > the GPU is still powered, and add the accumulated ticks to the value
> > > > > > > reported to userspace.
> > > > > >
> > > > > > This is useless because the entire point of clGetDeviceAndHostTimer()
> > > > > > (and the similar thing in Vulkan) is to match what the GPU itself
> > > > > > returns, and now you've broken that by adding an offset.
> > > > >
> > > > > Just to clarify, the timestamp needs to match what UMD reads directly
> > > > > from hw in various different ways (timestamp queries, shader_clock,
> > > > > etc)..
> > > > >
> > > > > If we can _restore_ the value (ie. write the hw reg) on resume, that
> > > > > would be ok.. but it doesn't look possible.
> > > >
> > > > Yes, a quick check shows that all relevant registers are write-ignore.
> > > >
> > > > > Otherwise I guess we need
> > > > > some scheme where an offset value is stored in memory somewhere, and
> > > > > some coordination with userspace to add the offset in various
> > > > > different paths.  But the kernel shouldn't be adding the offset to
> > > > > what it returns to userspace itself.
> > > >
> > > > Ack, thanks for the explanation. I tried to match what kgsl was doing.
> > > > It reads the GPU timers directly from the GPU, but for the CPU timers it
> > > > reads the value from KGSL driver which accumulates the offset.
> > > >
> > > > If I understand you correctly, we need to export the offset to the
> > > > userspace via some extra page (like vdso) and let Mesa read it. Correct?
> > >
> > > Yeah, it doesn't look like there is an existing GPU_READONLY && !APRIV
> > > BO we could re-use, so I think we need to create a new global (TTBR1)
> > > "vdso" BO which is read-only to the GPU but otherwise accessible to
> > > IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this BO.
> > > (And update msm_mapping test in igt to validate that it is read-only.)
> > >
> > > (I'm not married to the name "vdso" but not creative enough this
> > > morning to think of something better)
> > >
> > > I'm a bit curious if kgsl handles this differently.. maybe there is
> > > something I'm missing.  But somehow timestamps need to agree between
> > > what is read on the GPU and what is read on CPU.
> > >
> > > BR,
> > > -R
> > 
> > I think the kgsl timestamp offset stuff was only added for the new
> > A750+ CX GMU counter which is not read-only. We do need to port that
> > over to drm/msm. If the offset is applied for older GPUs, it's
> > probably another case of kgsl not bothering to keep support for older
> > GPUs in newer branches.
> 
> I've been looking at the kgsl drivers from msm-3.18 / 4.4 as those
> kernels targeted MSM8996/98.

If I understand correctly, for those GPUs glGetInteger64v(GL_TIMESTAMP)
reads the ALWAYSON perf counter through IOCTL_KGSL_PERFCOUNTER_READ. The
perfcounters are all saved on suspend and summed towards the current
value read from HW.

-- 
With best wishes
Dmitry
