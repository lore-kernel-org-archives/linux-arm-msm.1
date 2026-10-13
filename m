Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C9E421245
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885988; cv=none; b=h03qmW8I5/v32xDyoBE811ItzWN5CrJTF/tPWB8AxqzLU7QLIce5QIUXLcwy4p6NHkNNXjDbsM3sgDzQrvLcg8al1bUUd6DGqIOBzpfQjuNDWTJW3oOjHUISGqFiIueO965rHUuPWutALFZ3gNFTyuK+jP2pV07sOHirJbofaNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885988; c=relaxed/simple;
	bh=5J7ZXcMBhy88P4Tb1h53+bKR7D6qYw8eLnQAP0vYU9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDkkh3V9VVBLKrgCnIhjA+6UACiDW7/oIVTQtAwvi/76k6y2Ydt/Pp+xKXRpzpYHCW93Pwuc0RqVVHo5mG5b0Tl44HFfDrkF3TvHdPOLsnghKLMiBthKm4XmC+Cltw9zy01iiOq3zf0HhZNNOX02+nKzSdCBuZaxVxO6zjaHnNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/CX9FFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuY/ZweT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/CX9FFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuY/ZweT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9445e483032
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cc5HyoFkGPJVfeGm4KD7sIDe
	TX94ZStbYHeauo9HSgI=; b=K/CX9FFgg+/BWI4wOBi8hfK07oZj03mKYM4qjJZE
	uoNG1AaIZPwysBcm98YzEmbUPQ/XrFq9PwRx188wfJ1EEyqGulJgrecUtfMpyBNx
	BSuECtEDqbr4bAalXGgxaPR5jcazVbOK0lltueKZFq3NAxmul76MVPJjA4P86l0P
	xT4es64W+nac52AEGshRfapy5hTbYOi5KqegMWSY/FbeQsm4wzEjXzKCS5c7zBn0
	+DwaGiKYivMW+YRFbCMtzSPR+PI37/53ZNkan8wCkPmuYw4KqoWnxfYwh2hXyXGs
	aQVyyrh1AQnMMLJsCaLjz6IcZU+1ybYsnrwuC/25SXwsyA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8913-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:06:26 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso2600279c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885985; x=1792490785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cc5HyoFkGPJVfeGm4KD7sIDeTX94ZStbYHeauo9HSgI=;
        b=JuY/ZweT43V0l5YgMnrNoEjyOGYt60DmL119AkAzJ/Mzjgd/prQ9PF5LdF59DIdhC5
         v9BP8Njpbx3qU0OhQgvHUu/35+Dki9AqvBZxVGs+v0xHKGUPED0GGn9C5Eu87CXFjQN5
         G/OW+VVitHhPryz0qGBhRchgH8h4mk4i1ApXggaPyi7QqvtDIZxKrlrUE8n2jMY2UXtW
         ElWB+37RVyWQN4Zl+8jpbTCKLQ6pz6HeGxJVwL+SSwOTkbtaKeaA2WQVKGVUxfMzgDe0
         6UlskqqwN8omFW9FPIBWJQ7LJzFQVeP2XrZY2cBLzXFQE8PuoCy7xfWVLOIGu7yfSoQN
         VsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885985; x=1792490785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cc5HyoFkGPJVfeGm4KD7sIDeTX94ZStbYHeauo9HSgI=;
        b=toDqsr5cZAS9IJ/5ce94u3/9QKo8HSJVZASwGDrRCaJANnEWmvsWU+682zrtuAbNpp
         ciVv/HZMwqhCmezVc/89xeaxiFCfeXrrsApM9wj4JKxGpVJKhEGFeiirh3EMQrDwAUZa
         vHxQ4qvqgpDowbnVlhsc2fcCMFcCjYj62uC8L7U/BRYfe/LWkdV5nENhAPOgLfAu7i1t
         nuKCIA2dayjRL+bGH/zEd0QppgMecQqByNaiHR+0QTVSr6Cg9ETGYMsQjGT50kQGFWsd
         IJh6JkDdUp3iAv5Bx96JUFvGuqOju5291jm28ttu6G+h39hE/0OM80c8O+0eOCJeIy+x
         rzmw==
X-Forwarded-Encrypted: i=1; AKwUvBz+UknH4XrfMdTGhZ6Bcy/yt1p18MtsY/VpcwYm9388BlfBio7U+yPQdyABFinYVQ8iqSSzodmIPU43ozbO@vger.kernel.org
X-Gm-Message-State: AFq9FYIDEFPqPJHXja+dlUo2hhqoxqDgJ911E6dCAnsXHax0i/b4GrgU
	OWPcoJ96mKn5aaEQHv12nH/CBhhifxUCfonVSgukpWkFEDyeQ8lUqaZh+4bYJdwJOZMzf05n+pz
	K5aKFoG4aNQs7fD2iok5N3rJ5iplBCKNSFjQKHIyu35jhUGnRl4f7Aff/ZQ3i3Gqn6V3p
X-Gm-Gg: AYBFou3BRl4+DmrxWMD2njx8K1LHX7VA9YLUqt0LNkEkioTv3CUKjGpmf82bX1MyyFL
	YU29+P6kKJVnzJ2Q6s81nGo3hiLK4y9GJPj4pGhGjVZeDHPGB0v0sraOuN7sPbgt4Cd/pzOBZhR
	FINAw/BalJS0Xqw1U1X/1sv1f2fxMdmz1ibCccTVJ3xNNEBfyj89aittpZ/kwgYRSkr2MARqz+T
	tLsgFWUellnKqNo1iSNgKinM/cBH7SXwns3/txgvj8sK7y5QVx3CVay1i4X1s67/Js9IoqbdYL4
	ZtphJa+MXgCMx4MrquABzvDGlciOnLZtE6Q8NDIMFl0ShDvfJMVmqIewoONjT2u5uLoFbkuOqgB
	pS0bzIyOMA79yGNmIlSzdSmOFdl0=
X-Received: by 2002:a05:7022:f512:b0:16e:4723:5f86 with SMTP id a92af1059eb24-16e472365c0mr11218768c88.29.1791885984746;
        Tue, 13 Oct 2026 03:06:24 -0700 (PDT)
X-Received: by 2002:a05:7022:f512:b0:16e:4723:5f86 with SMTP id a92af1059eb24-16e472365c0mr11218754c88.29.1791885983981;
        Tue, 13 Oct 2026 03:06:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm57824909c88.18.2026.10.13.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:06:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:36:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
Message-ID: <20261013100617.5dh2lw2wngqvbbdl@hu-mojha-hyd.qualcomm.com>
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
 <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
 <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
 <20261006100344.piyiffp6rwvt3w2s@hu-mojha-hyd.qualcomm.com>
 <asogqMMvsGTTmHr1@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asogqMMvsGTTmHr1@sumit-xelite>
X-Proofpoint-GUID: BlUuJdqF0NeU5Ma2blnGsVwFAJSIXv_d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX3vkCDsqIvbKK
 AwVPuClzumuCpJbN5BuZHnEf5AcpNy6/bvMtJm6dM+IGiRUPOKy+tNrfOMcN/aFaORQSfgHOoHU
 ClZteLVMPqsQM8QQLzsCwV99LabsnWE=
X-Proofpoint-ORIG-GUID: BlUuJdqF0NeU5Ma2blnGsVwFAJSIXv_d
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace02a2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RZYooTeZZn4JW5UmQ-YA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX0jvk8W+ZckJM
 lwFUfcNSsOixvKf0iI0pmOAlSafIW+RBdUd2DzI41v//m50KHD9jH4c1Np8/+y1deGgadyO4WL/
 TLwBuxZUwJ4Og9ItLyxBC19i/cqf8XRcKZuLQBDcN/KyxQZw0salE3CQorFDyfyQLTj63F8rBi/
 WVq8IOjjlNJSCjJte7W06uolbenGoLyJUC9zZntjjUsM/Dr93uDCaP8c3KHKHom5YF3dPQMW7s4
 Cw35GLXdfLGFjQQ+0vLq/r4L+05VggaoDhSlQ0Mvy0tdMxnv5+ZlNPV3+9VJ3/BwmUIbG3axxBM
 ywmgCWn55luHubX4sI25ug1TGHThC80fA2azx9ajLpyO3bS2kOwN36cibvNB325x3RCvPivjY+B
 olUaJ+CrX4AbCxvfQxlR0A4I41l2a04PpWx5wm/MyfGJdcLvPZ5tlcdbc3w4UBEoLcprDqFLbCn
 8hgtJK5Ng+frKcYpnQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130040

On Sat, Oct 10, 2026 at 04:55:28PM +0530, Sumit Garg wrote:
> Hey Mukesh,
> 
> On Tue, 06 Oct 2026 at 15:33:44 +0530, Mukesh Ojha wrote:
> > On Mon, Oct 05, 2026 at 11:01:24PM +0200, Jorge Ramirez wrote:
> > > On 05/10/26 21:42:24, Mukesh Ojha wrote:
> > > > On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
> > > > > The firmware resource table is passed to the PAS backend even when the
> > > > > firmware carries none. This only works on the first boot, while the
> > > > > cached pointer and its size are both zero.
> > > > >
> > > > > Stopping the remote processor, or failing to start it, frees the cached
> > > > > table and clears the pointer but leaves the size set. The next start
> > > > > then pairs a NULL table with a non-zero size.
> > > > >
> > > > > The SCM backend substitutes an empty table and hides the problem. The
> > > > > TEE backend copies from the NULL pointer:
> > > > >
> > > > >   remoteproc remoteproc2: powering up cdsp
> > > > >   pc : __pi_memcpy_generic+0x110/0x22c
> > > > >   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
> > > > >   Call trace:
> > > > >    __pi_memcpy_generic+0x110/0x22c (P)
> > > > >    qcom_pas_get_rsc_table+0x38/0x60
> > > > >    qcom_pas_parse_firmware+0xa0/0x100
> > > > >    rproc_boot+0x2d4/0x380
> > > > >    state_store+0x40/0x100
> > > > >
> > > > > Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> > > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
> > > > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > index a005546c265d..e871e03ba794 100644
> > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> > > > >  	struct resource_table *table = NULL;
> > > > >  	size_t output_rt_size;
> > > > >  	void *output_rt;
> > > > > -	size_t table_sz;
> > > > > +	size_t table_sz = 0;
> > > > >  	int ret;
> > > > >
> > > > >  	ret = qcom_register_dump_segments(rproc, fw);
> > > > > @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> > > > >  		return 0;
> > > > >
> > > > >  	ret = rproc_elf_load_rsc_table(rproc, fw);
> > > > > -	if (ret)
> > > > > +	if (ret) {
> > > > >  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
> > > > > -
> > > > > -	table = rproc->table_ptr;
> > > > > -	table_sz = rproc->table_sz;
> > > > > +	} else {
> > > > > +		table = rproc->table_ptr;
> > > > > +		table_sz = rproc->table_sz;
> > > > > +	}
> > > >
> > > >
> > > > Earlier code was intentional please read the comment below.. /**...*/
> > > >
> > > 
> > > AFAICS the comments say that the call might pass NULL and zero as input
> > > resources. And this patch does exactly that - it doesnt allow NULL and
> > > non-zero.
> > > 
> > > did I miss something?
> > 
> > No, you did not miss anything.. I just wanted to highlight that I
> > did not keep else statement in my initial implementation
> > intentionally and relied table_ptr and size will be NULL on
> > failure of rproc_elf_load_rsc_table()..
> 
> Looks like you still haven't understood the problem this patch is trying
> to solve. It's the PIL restart sequence where the table_ptr is NULL and
> size being passed as non-zero which is incorrect from caller point of
> view.

As per my understanding, you will only see this issue when you do a start,
shutdown, and then a fresh start again.  Normal remoteproc recovery is not
broken?

If it is indeed an issue during rproc_shutdown() where table_ptr is NULLed
while table_sz is not NULLed, should that not be fixed in
rproc_shutdown itself ?

-- 
-Mukesh Ojha
