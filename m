Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D42E30E0F2
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 22:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066499; cv=none; b=o/GVDXMA2Es8K3fsc6YZ82taMrg4eWmn/AMMVyi0ouRaJo9zn3XFp9PMqyem/KanNh7wZ4IVwW6mU5rdhccLhMiQLwMgZusFUrR5KxBAg10XGoeFSZM68p+YZPGVXKkx68Nf4YpJBedA5Y8XqhrH/ZzMhg+K/a94dhsrJIpkH98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066499; c=relaxed/simple;
	bh=k3pu6UlAByUAsZ1COmnVfKb/1csTnqbAuf3uXtysK5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiSE9rHGO9gwTRQMhdKdYUkQuanAwcVN/i3h6WHJlQKbuSN2oNGagT7qbZr2lDv1Y8XJkaUMHf1h2MqevYfEzn7PhlsDMEgsE8QZ9ZaPHOCXN9tbICulWuQngL9ewmfgz4dq1KMrDFRRempDZQnWTwFWPN3kaYRzRgWiaHeUvVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9jv6JFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdpuPUVd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9jv6JFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdpuPUVd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693KpFdQ1082833
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 22:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOffTPIXfRD8qfa88meVOZsKWaJiiHdOJxpXHsrvcO0=; b=X9jv6JFagqgG8Tcm
	cDdbDven0/uCifZa8j7QD1JtjMcJYKAzhsxd58xn38MCtnLMh8NLXuC+7G7khy1A
	dDNoJjCdifUhuBxBPpWYaBPqkYMSW8Y6ARMxV3vrWsPbOiiUNqxYPE5+QIItnE9m
	LwtjbgBHqt0pfVovtQTytiDTJ32ub8ahfd5eRij5iFdDo7KWTgtfE36M7U55FCn0
	d5eMda3pudCqbFHS7goAIC9oD3v6MH+hXg0cKzz6n0iz+xCoEoa2EmDijpxkB5lL
	Ru8mxmacAaQnO8P0qwavAWCbHzj8MAgyX8b4bIFjsgnG8F20v5uT2KnTbE7epFcN
	nPMBTg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06sxu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 22:28:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf71bbf197so575127137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791066496; x=1791671296; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOffTPIXfRD8qfa88meVOZsKWaJiiHdOJxpXHsrvcO0=;
        b=ZdpuPUVdDtYWnsOvvQ4H29agyUBkOMijobo1zxxYdBqlDBxrMLLQOCaoK4tBgbp2rd
         OGGAghkiuIgc3iYUDbztf1dtG9/8o4YcSQ3er15DPi1hrou2XyJysk3QrnKy8iKMbIqX
         gn5UYJbGFJknzSLoT6vS1NkUtag2M65oUIj513fKDae54IDxI5HBUflHLeNddHBMoQAB
         YxXyWyjJfXybdTXezLpJVpYVnuIrOZxyyAqicNKxRLalxAbP3apbo8fZWPn1ORRLWa+C
         YfgHBdDoHT0f+d/cajWh0HCykjoKXRc3Vm86yoAldRvdIjE2fl2BQfr9QUfhDmP2fP1c
         nDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791066496; x=1791671296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BOffTPIXfRD8qfa88meVOZsKWaJiiHdOJxpXHsrvcO0=;
        b=PLiELpnB6HXI/y5LRpqfg5KGr1ViBzGcyFDeUJ77zJC6M4FmwJq+zWf7a5KRv3cKUx
         Zw7v0pYNPE0c5Ztr0t+dGEFuHKhg0vDBLqQfLk0Lafb69RqtHEB9EDtpqnrE+bQ958zI
         qRQ6zvXsb9NyJn+40WYqNwqccDcfBijiBI8FISUmKORWTsU+COcODQReXIHDdfuK7Kd0
         InN+JvgcVUh1nLZnw9z9oWdOccJhJpSgJQgXDqxByOtllTGYxcF/d/fcYaRr5UB1An5h
         yfjSl3xnLuCeJbPfzFajuSH2ubT58Tc2z8KwqQ3ZQSx6KrgJQ6Snv01hmCLk13oUIpk1
         TErA==
X-Forwarded-Encrypted: i=1; AKwUvBwjDRwMY+K1Wqj0wD7jn6SB7LUSVg0x2z+E/CE1NXhQxOWZSv0kfJKMhTBQAF1CmW7MhBVhKegpG0qsK+Us@vger.kernel.org
X-Gm-Message-State: AFq9FYLHAeqBXYemcrBZqwR+sN//C76tLKe4I5YKzTiM4QN5BIDgObxK
	yMTRtO3hEVwdqTfURLFVk5RQr0UEh/cI9cae4nFxhiLiO7p/EgOYV2auB35xH7JrgsQtkAFAw9d
	fWgCvuB5/VyHDbl/gbQ6DhrrC/m9IrZHGVd+9MnVfwEOiBQHRrHkdMksOko5nfXhpQ5Uby04T4D
	zC
X-Gm-Gg: AYBFou1O3GZPLMfyAzyA1rKuB0BZ6D46uh3QrGYKh8YtbrWRrY9epPbhc67NRhEypCa
	wEYcsKh03OdYPrailt1FgoGxFS2YOBsSL/IYHjvjFm1dTCXvRRcboeIBvWPNw32KZL9rJa34lbS
	LfuliXX1aJc5RL/TM5nFnVUMFAJjtsx6obYlw25cH2uh544PHO06ogdT8ib943HwXDq3QWsfmil
	7uiwNAryJ1v/jFvj71MiLWzY8AIfMFInAuVEVQU/vAojuQrAK9SrohIgcxAQ52lNErs7EvsEk+2
	PaJj0+3kOg4UW75EqBza+akeP5PrMuKJo5P2IcdQDnKOCbd1rETQ+CaDfV2bZ9t4nRMzyweM+i/
	SoyRte2Rj5Ps8ZlsB6QDRxaVbfX6Um8OATTWQB55ar/9CVR/CM8B+0nSBWPSQxcl8aEC2ph+sZS
	vDNT7u4LlczrTE
X-Received: by 2002:a05:6102:148c:b0:7b5:8fd9:27e2 with SMTP id ada2fe7eead31-7c0f3d4ba11mr2024899137.12.1791066496067;
        Sat, 03 Oct 2026 15:28:16 -0700 (PDT)
X-Received: by 2002:a05:6102:148c:b0:7b5:8fd9:27e2 with SMTP id ada2fe7eead31-7c0f3d4ba11mr2024897137.12.1791066495559;
        Sat, 03 Oct 2026 15:28:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a966c4d821sm20369441fa.17.2026.10.03.15.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:28:13 -0700 (PDT)
Date: Sun, 4 Oct 2026 01:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: iris: add support for vbv delay
Message-ID: <zttltt3f5zmajyy2fbhod5vc7x4l7l6htcalu5hpbrpmd2kgze@p675hgd5pwko>
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
 <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s>
 <828e8a38-4d11-4126-8f77-04e05e1a94b9@oss.qualcomm.com>
 <CAO9ioeW_EabUpjDZa6w-60=CbDXVgGw0-N2t4Z5SpJPrrhcrtw@mail.gmail.com>
 <1eeccb79-540f-4a84-987c-77dc2b05fd18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1eeccb79-540f-4a84-987c-77dc2b05fd18@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac18180 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aLSecQpocWsgUSzuDAoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Mbq2I7ly5nct_TfU5jBzrd6HJvckNXLK
X-Proofpoint-GUID: Mbq2I7ly5nct_TfU5jBzrd6HJvckNXLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA4OSBTYWx0ZWRfX3rX3/VA8VHeP
 2gFfXOjkSSJAD07gzdE16pHmEq/io0DQg3+YfbNGGZk6YgNwv0pau+mHpK6eQRixrBwJRW9RuE6
 XhVKUMVqjkskH4Gw47uqB93/raJtl/scgz37PF0jPyn0IqzJtJOV/qrO/2agPFp+JRjqMD/tQDq
 VCAqIglNLK7WepK0Uz7OmkBq1GbjhsEcrd7hN9zs9KERzKMl82om1zAWLRbhEO4KNVoeY4ARu6F
 N/FFApggwUpCfFdd44WrGd9uD3pgmqHbkEr5YWR9m3c8GtedKJVyTZABehbSNzVlSKmc+NfLpU9
 o9duxvc0LoPogUQIZcbZBVNfmF4c4TbvFo+vcHPEu093Umt7J+nVMXlsW8U2ZllX/fNpm1HZplp
 bZXtdTyklWHy/cMhRY09E/NyIpka/1nQTKSTl4vqBiIDaH9o7HmrKjQOmVqLCxFe+uFX4xD4l8M
 gny6+9z/Ci7aQxxYDUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA4OSBTYWx0ZWRfX9bKPWPn27OeX
 0wZXnVBFJyfMns2fzAJNSlnRzg8KzAeJSLpg+ay+Ukf9evcoRMACPCTleVGkiQchMPW/JcuB9bj
 jW2XH3lMCTOG4b/zOIrGSeGI3zcE/yg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030089

On Tue, Sep 29, 2026 at 09:37:38PM +0530, Sachin Kumar Garg wrote:
> 
> 
> On 9/29/2026 8:35 PM, Dmitry Baryshkov wrote:
> > On Tue, 29 Sept 2026 at 14:54, Sachin Kumar Garg
> > <sachin.garg@oss.qualcomm.com> wrote:
> > > 
> > > 
> > > 
> > > On 9/27/2026 11:55 PM, Dmitry Baryshkov wrote:
> > > > On Sun, Sep 27, 2026 at 09:27:46AM +0530, Sachin Kumar Garg wrote:
> > > > > Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> > > > > exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> > > > > HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> > > > > is only meaningful for CBR rate-control modes.
> > > > > 
> > > > > Low VBV delay values (34-100 ms) require the encoder to run
> > > > > with a single video pipe, so extend iris_set_pipe() to force
> > > > > work_route to 1 whenever the configured VBV_DELAY falls in that
> > > > > range.
> > > > > 
> > > > > Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > > > Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
> > > > >    drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
> > > > >    drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
> > > > >    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
> > > > >    .../platform/qcom/iris/iris_platform_common.h      |  1 +
> > > > >    5 files changed, 50 insertions(+), 2 deletions(-)
> > > > > 
> > > > > @@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
> > > > >    int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> > > > >    {
> > > > >       const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> > > > > -    u32 work_route = inst->fw_caps[PIPE].value;
> > > > > +    u32 work_route = inst->fw_caps[PIPE].max;
> > > > 
> > > > Why is being set to the max value instead of using the .value?
> > > > 
> > > 
> > > fw_caps[PIPE].min/.max/.value are all seeded from the same platform
> > > constant (num_vpp_pipe) at init, so .max and .value were interchangeable
> > > before this patch. This patch now writes the applied pipe count back
> > > into .value (used elsewhere for power/cycle estimation), which makes
> > > .value stateful. Since iris_set_pipe() is re-invoked on every resolution
> > > change while streaming, seeding work_route from .value would let a
> > > previous single-pipe override persist as the new baseline on the next
> > > call, even after the VBV-delay/CBR condition no longer applies. Reading
> > > from .max instead keeps the default pipe count stable and re-evaluates
> > > the workaround fresh on every call.
> > 
> > With the .value being written, does it need a lock protection?
> > 
> No — inst->lock already serializes this. iris_set_pipe()'s write to
> fw_caps[PIPE].value only happens inside start_streaming
> (iris_venc/vdec_streamon_output(), both the iris_set_properties() cap loop
> and the DRC re-apply path), and start_streaming takes inst->lock before
> reaching either. The only reader outside that same call chain is the
> power/clock-scaling code (iris_vpu3x_vpu4x_calculate_frequency()), which is
> only invoked via iris_scale_power(), itself called from start_streaming and
> buf_queue — both of which also hold inst->lock. So writer and readers
> already can't run concurrently; adding a lock here would just be redundant
> with the existing vb2-op locking, and no other .set() callback in this file
> takes one either.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
