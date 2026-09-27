Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2093E40EC
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510407; cv=pass; b=mgQGhYlzye2BOj2BxNoN71jcQRT5oEyHAyUbGCYgOvjvRYFM3usy5iY63asYh2C85jiVfSVYnPrZeAzfGEQcB3Hh01O4aWYUvZy6+zfH5lp5wz8kcAmIGY9vCFvCYjnBfDR9Wv8b9aSHddDFzpi6h+yzgbkeRxykagKTY+NaXAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510407; c=relaxed/simple;
	bh=wWNcSGE6xGRVsIq010yU9I1T986KWg6lXCY3oiVpIYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhGI7BS6q0tpLbLExkk7opiE0T6bxxS24uT1+HB6iQh/Wob0nns6Si1BwnxS8v3sBeBfaXzW9YFqMvSijo5zPCWedyO5HThX4tEzLLEYGTVH38RfgHh0ulDmbqmFygZCYoFRMxOWAP3/PMXhdKICCrYsb41X8T7rhB3C/LkMPZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3XiDiAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xr9TvHxh; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3XiDiAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xr9TvHxh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R0SBpH719700
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 12:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=rgW7SfWM+V9aC8/kbQ44Ln2IemFbLeuqMDrQH3Z8rLU=; b=K3
	XiDiAZQ9z3uIgtgbq60/938qY2qw9XW9HY15f5k+AaKdG178G6XTAbfxTp/knxsa
	/smkv8ipppbcrYbot/ty9hctKieF6GOuoAHytGUwEHdxBVgJj2kRccpXxnH4is18
	y6cPEsQz+DjCOVqiyQ4BApdcL9Qz0yEkjUGaUg6ZO3CAZ8w/7UyqMYLz6w9P4YfT
	Q01fFE9lPmUxxxHEXhC+4640Z8gay3HAm9a9Hvutxe1R7w3DxG2WvtAuPcRXfLOk
	PJWji9xkSzL2fS4VbCZIDlKa9E61z1PwXHVWvkmC98lpNVOlObrFnTXDbrrYIOQh
	ZeDK6sZ0UgfpnmFsDakQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6tejsw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 12:00:04 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8056a93e0e3so3987575a34.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 05:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790510403; cv=none;
        d=google.com; s=arc-20260327;
        b=A+JJ+EgStBjCFJ43vp/QoSUh7+j0q6xwwNM4F39d6q7dEa19Q2LbPQ2dY7Bzh29ykB
         r4CiCEyV+VIfX3+RspI4egfXOjr9g0WF20t3QzzXdMXUht/YNIfXxnZW4aqKv/w1Ezi6
         F+TKNgoJu0qJyeC3xwh47HoFsGERuO3pmZ1SknOUEhBI42QMlec42bTWpf5uuwV15hR5
         /DxNJNAYGfsvxSsI/2VAC3CNRqFzj/zDvyL/ahEBLLiYIC0IypFwB+6AC9KU8YoVOLur
         4jFzyGMvDUvI6SsEWlexJCCPK7Py6Jm88mnJzDNYiNSjhRh6dggX4wkZBmWmBqyuYXeG
         +ULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=rgW7SfWM+V9aC8/kbQ44Ln2IemFbLeuqMDrQH3Z8rLU=;
        fh=M7qrWU4DDufvTeznfhktZ8r2pl2oYX/qgZK9dY43RQA=;
        b=dt4m3FCO0WsIJ/F0/m9YY6njjEm7i0KTVArkWQd058+PaphShOSkPuOuMSioZiZYbX
         d1QuTI8M7dZeq6O5bOKoL4KoQz+gVE94kLT7cBFdBiu0FNHydgnkeVu+c0B7D6jLQ/oL
         Fjhom1empllzfhTTrUtTBJ4SY8R4fVH2zkQOh23X6/UhPimsE3+GoGatGquHr9VkeWjC
         8d/ldGd8bwkPb++6vKe5/o6Pi3NAJCW2sab7SR/cYJ/Gs5joTKjSjIpZvoUyfbaLRays
         iYhbVEjB2ikYJb1gQa+QzzSy45Xiknwa+b87k39wjUV5rth7KcawfJ5SGN992EnknJDP
         14aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790510403; x=1791115203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rgW7SfWM+V9aC8/kbQ44Ln2IemFbLeuqMDrQH3Z8rLU=;
        b=Xr9TvHxhEWaCyydh9dfrlje2MwzsnhfxridG1co3dK3mw+Upm4E0KQ+Se65VlXL4Gy
         WRIj6xzf4ZhYJL/xszZyNk+Z0kSiQYLkDwIZAy1bbPpLsf4whFFocU7u+FhZ4aUwAD9Q
         SXoAT1jgRwHDvWT5LbQ8n4x/iUuPB75R12sNiTXozhMaqVS8OiNXHopmWFYdHKLprT41
         FytCtJi8QTVqblyUgd8VHaUnoBTxk/9mnUJOBFxU8zaOiVbmboCSwZQumnfFJPyyA6d8
         TYaWucaFaq1kCt6CP1A+OWKdfsUUGtsMe36HNlLJ4DoPnNeH9yf5/PQ0YRQzsRavFaGV
         6alQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510403; x=1791115203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgW7SfWM+V9aC8/kbQ44Ln2IemFbLeuqMDrQH3Z8rLU=;
        b=Ox/tydFL/inRIir0t+XqxXpBbPPV8Yu7HqQTNYNRX/pwRtz5lnBOHYjjj3bpZOqGr+
         mnyesn5CbXzQnlGkaIzgWPJbR4SliocrVgJM98kqpzy7SM9xytEWa+6+wxrfnOMsampO
         iVonu+kWo0zQeI4fUVxrzPj+byWWnZcoW0UoIqpngi3tW3rSwAVyRgfbjVb6gwa6/o5j
         P7HRXL78uGjJRtd5dErsgLMts8lK5vfhT4ShjYM0ApK0IENJdSid2sJ71BiM+UEuJ3fE
         TPPhgipZRY9SW2EgZVn62E/3ksnxdbabq8IkZ0X/VR0iZ4aXDWxdHb/LQCwIBCi6EwnI
         xCyA==
X-Forwarded-Encrypted: i=1; AKwUvByDN0964OlYaC22MvDE1PIUVKUube207w8KEgXBkJE9Rzo71+gmGaidPQ9Fx2ItFN9Mti8zSBsgzNs8BOIW@vger.kernel.org
X-Gm-Message-State: AFuF++mxTAdUHFtA0DJB4RM1yHM0ljGOwr2iEPMhJaga1h2RGE6OxATH
	lQaAEAieurFUO8y1Jr8CiI+uKoo3wK9XjVVZAc6Wuutq/YHDCJDep8Pko52z+/owkKtLxQfzMQo
	ht6eO8sX93OEuKYvKzC4JCbR5CSfIwWH5Dx6xv2s8WNOPrc7IEuZVIK910cWymW+59R//XS4Iyp
	jo4i/72bY1FEusIhZKrq5GLk2DAyRpjCm9p5qNKoyf2Fo=
X-Gm-Gg: AYBFou3HGotf9g4sRKE54j8BD1Uh1cD6yyEkA5AL5Zg5CzepOmT0quqvEet7/NkVgg7
	cd3q/V5U1Z3b0b8P27N52OwtAwDPK2+HFhldk/sWG6dH+GBQAZQq/Z/vZ01Jg247kIrWHhaj55f
	YXdrVO0Ea2i7hAkgA+3XL8MZC3W306WyJnPI3dlTN4rsC8TIaGRwbm40WU
X-Received: by 2002:a05:6820:1515:b0:6cd:3fdc:6007 with SMTP id 006d021491bc7-6d441c7b872mr9885808eaf.88.1790510403166;
        Sun, 27 Sep 2026 05:00:03 -0700 (PDT)
X-Received: by 2002:a05:6820:1515:b0:6cd:3fdc:6007 with SMTP id
 006d021491bc7-6d441c7b872mr9885784eaf.88.1790510402601; Sun, 27 Sep 2026
 05:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BY5PR02MB6866E35A2B4241CF3A728A99D3D22@BY5PR02MB6866.namprd02.prod.outlook.com>
 <5f90bb35-994e-48bd-bf49-3001dcefa2ee@amd.com>
In-Reply-To: <5f90bb35-994e-48bd-bf49-3001dcefa2ee@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 04:59:51 -0700
X-Gm-Features: AclHuK8rcs-qn2ZpLt0jVNsqHetW2nhbpradp0Cqnes4b71suV9Y7FFS9Jo-lt8
Message-ID: <CACSVV00oBPN=rw1yVBjNm2TMHuQ+3iv84jKP4djQcnKRxcvWCQ@mail.gmail.com>
Subject: Re: Synx : global synchronization framework
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Pravin Kumar Ravi <pravinku@quicinc.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Faith Ekstrand <faith@gfxstrand.net>, Simona Vetter <simona@ffwll.ch>,
        "linux-accel@vger.kernel.org" <linux-accel@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
        Rajesh Sastrula <vrajesh@qti.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA0NyBTYWx0ZWRfX2I7sIaxi1WCl
 f9Vc855wfBL0LnzWe7YdJoXSY50Gzrvrv/xLejslE6QYkUYqPGdJzrPWlZcWeGgu7H3vTTYVtvc
 HguQeokkAix1ZjgOobAroQYe99j7vi2ZMpFPMX1Xc9GoEFSMpcodGxQFV0wBB29S/VyiEjfwCQU
 p4NQ4cIv+xBSsxv/8hpLvLRxv0jL6vuVX0+euu8bdHHNykZRgLeCZjZlkS9874yY3ssGctuIJG7
 DDS4gRtsnejuVCdNke49AfBy8kOLGnLEGCbBKptvYbmnMMjeEWuzWnD//NI79gV0AbBdIwoNHag
 kfRRsPBI0BciUUUkSX/GR3PLkTW9gHSA2OUZWwClt29XgSJeeaCrRnpFqWv0mN/U2MwEKQynf9u
 mN4DGO/Ow44tBNgj7XuvMzrCbFErx2NDTF1XM1ayFZezI/KJqagXSt0ERB/7r5RckWBu8xy7BM0
 L9gs/bxJ+zslOkYEObw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA0NyBTYWx0ZWRfX5ZcWS8Ub9KEU
 8owMB5R4KTlXDzaLVqCbd2I+p/ahSiCRicX/jI1vq/64JorLQommVGxGIBbj9K6Ln3YOKVWAjQB
 FxESBS29ZLrWi2bo9lIBHhHktdhG+8g=
X-Proofpoint-ORIG-GUID: ThT4Q6kFQ0MqTeQYvAnsq46HP4ndEuy7
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab90544 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=zd2uoN0lAAAA:8 a=pYcsTS5lAcjY3ai0WdIA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: ThT4Q6kFQ0MqTeQYvAnsq46HP4ndEuy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270047

On Thu, Aug 6, 2026 at 4:52=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Oh, well history repeats itself.
>
> On 8/6/26 06:30, Pravin Kumar Ravi wrote:
> > Hi all,
> > This RFC is intended to start a design discussion around Synx, a SoC-wi=
de synchronization framework used to coordinate fences between Linux-hosted=
 clients and non-Linux execution environments such as remote processors and=
 firmware.
> >
> > The intent of Synx is not to replace dma-fence for existing in-kernel G=
PU/display style synchronization. Rather, provide a global synchronization =
mechanism spanning multiple subsystems and processors, while still integrat=
ing with existing Linux primitives such as dma-fence and sync_file where ap=
propriate. The solution has shown significant power and performance benefit=
s in the last few generations of Qualcomm mobile and XR chipsets, and is ga=
thering more use cases. Also, the solution is SoC-agnostic, so other vendor=
s can adopt it in the future if interested.
> >
> >
> > *Motivation*
> > Many multimedia and accelerator pipelines on modern SoCs are no longer =
strictly host-centric. Work may be produced, consumed, waited on, or signal=
ed by multiple execution environments, including Linux drivers, userspace c=
omponents, DSPs, ISPs, NPUs, video firmware, camera firmware, or other remo=
te processors.
> >
> > dma-fence is a good fit when the fence state, callback list, and lifeti=
me are owned and progressed by Linux kernel participants. However, for cros=
s-processor use cases, a synchronization object must satisfy properties tha=
t dma-fence does not currently provide:
> >
> >  1.
> >     *Cross-subsystem visibility*: A fence created by one subsystem must=
 be importable, waitable, and signalable by other subsystems, including non=
-Linux processors. struct dma_fence is local Linux kernel state and is not =
directly visible to remote processors or firmware.
> >
> >
> >  2.
> >     *Point-to-point remote signaling*: One subsystem should be able to =
signal another subsystem without interrupting the Linux host CPU every time=
 in the signaling path. Since dma-fence maintains all waiters in the Linux,=
 remote-to-remote synchronization has to unnecessarily interrupt or involve=
 the Linux host.
> >
> >
> >  3.
> >     *Distributed lifetime management*: References may be held by Linux =
and non-Linux participants. Any subsystem must have authority to create and=
 clean up fences. This requires lifetime state to be tracked in a shared/gl=
obal table, rather than being owned solely by a local Linux object. dma-fen=
ce lifetime is centered around Linux references, which does not naturally m=
odel references held and released independently by remote processors.
> >
> >
> >  4.
> >     *Race-free global synchronization*: Registering a waiter and observ=
ing signal state must be atomic across participating subsystems to avoid mi=
ssed wakeups/signals. Atomicity between remote waiter registration and remo=
te signaling needs a protocol-level guarantee, not just local callback hand=
ling.
> >
> >
> >  5.
> >     *Subsystem restart recovery*: If a remote processor or firmware sub=
system restarts, references held by the crashed subsystem must be released,=
 and waiters that depend on that subsystem must be completed or failed in a=
 well-defined way. Subsystem restart cleanup is outside the dma-fence model=
.
> >
> >
> >  6.
> >     *Global composition*: It should be possible to compose fences that =
were created by different subsystems or processors into a single aggregate =
synchronization object. dma_fence_array can compose Linux dma_fence objects=
, but it does not by itself solve the composition of globally visible synch=
ronization handles created by different processors.
> >
> >
> >  7.
> >     *Transport abstraction*: Remote signaling should be independent of =
the underlying transport, for example rpmsg, mailbox, GLink or another SoC =
transport.
> >
> >
> >  8.
> >     *Linux integration*: Linux clients should be able to interoperate w=
ith dma-fence and sync_file where that is the right ABI or in-kernel interf=
ace.
> >
> >
> >
> > *Proposed model*
> > Synx introduces a globally unique synchronization handle. The handle in=
dexes an entry in a global synchronization table that is accessible to all =
participating subsystems. Each entry tracks: a global handle ID, current fe=
nce state, the set of waiting and subscribed cores or subsystems to allow p=
oint-to-point remote signaling, a distributed reference count, and parent/c=
hild relationships for composed fences.
> >
> > The design is organized around four components:
> >
> >  1.
> >     *Handle and session management*: Any subsystem, Linux or remote, ma=
y create or import a Synx handle and hold a reference counted against the g=
lobal table. Handles are destroyed by the subsystem which releases the last=
 reference, regardless of which subsystem it is.
> >
> >
> >  2.
> >     *Transport abstraction*: Remote wait and signal messages are delive=
red through a pluggable transport layer. The synchronization core is not ti=
ed to any specific backend (rpmsg, mailbox, GLink, etc.), enabling point-to=
-point remote signaling without involving the Linux host CPU when both prod=
ucer and consumer are outside Linux.
> >
> >
> >  3.
> >     *Linux interoperability*: A Synx handle may be associated with a dm=
a_fence or exported as a sync_file, allowing Linux kernel drivers and users=
pace to interact with Synx objects through existing interfaces.
> >
> >
> >  4.
> >     *Fence composition*: Aggregate fences are modeled as parent/child r=
elationships between global handles. A composed fence can span handles crea=
ted by different subsystems or processors, and its completion state is deri=
ved from the states of its children in the global table.
> >
> >
> >  5.
> >     *Subsystem restart recovery*: When a remote processor restarts, the=
 global table is walked to drop all references held by that subsystem and t=
o complete or fail any affected waiters according to the configured recover=
y policy.
> >
> >
> >
> > *Possible initial patch structure*
> > If the overall direction is acceptable, an initial RFC series could be =
split as follows:
> >
> >   *
> >     Documentation describing the cross-subsystem synchronization proble=
m and the Synx object model.
> >   *
> >     Code to manage Synx sessions and handle lifetime. And synchronizati=
on using wait and signal
> >   *
> >     dma_fence and sync_file interoperability layer.
> >   *
> >     Fence composition support.
> >   *
> >     Transport abstraction for remote wait/signal messages.
> >   *
> >     SSR/restart cleanup hooks for remote processors.
> >   *
> >     A minimal Qualcomm SoC integration backend and example client.
> >
> >
> > At this stage, feedback on the model and layering would be more useful =
than detailed code review. In particular, we would appreciate guidance on w=
hether this should be pursued as a Qualcomm SoC-specific driver first, or w=
hether the cross-processor synchronization pieces are generic enough to jus=
tify a common framework.
>
> Well to make a longer story short what you describe here was the original=
 dma_fence proposal from >10 years ago. We fortunately rejected it already =
back then.
>
> By now I think most people in the Linux community who have worked on dma_=
fences agree that stuff like that is an extremely bad idea.
>
> First of all some of the stuff you suggest here go strictly against docum=
ented dma_fence restrictions, especially no point to point remote signaling=
! dma_fences have a huge interaction with Linux core memory management whic=
h makes stuff like that impossible.
>
>
> What you can do is to do this in userspace with DMA-buf and user space fe=
nces, signaling points etc... Take a look at how user space waits in XE wor=
k, how eventfd works and ROCm events work for an overview and maybe some st=
arting ideas.
>
> We could certainly build a framework around that, especially eventfd soun=
ds like a common ground to most drivers already, but please stay away from =
dma_fences when you want to do something like that.
>

So I'm just starting to think a bit about this, since it will be
potentially relevant when we implement fwsched for adreno..

Do we really need anything more than some sort of dma_fence signaling
extension?  Ie. signaling on the CPU remains exactly the same as
today, anything waiting on the CPU would see no change.  But if both
exporter and importer support the same extension, that can be used to
extract extra information to pass to fw.

The fw might observe the fence getting signaled with lower latency,
but that's fine, there isn't really any guarantee (other than timeline
ordering) about the order that multiple waiters observe that the fence
is signaled.  We've just pushed one of the waiters down to firmware,
that is all.  Ie. something like

   rcu_read_lock();
   if (fence->ops->signaling_ext &&
do_I_understand_this(fence->ops->signaling_ext)) {
      fence->ops->get_magic_signaling_foo(fence, &magic);
      ... pass magic to fw ...
   } else {
      ... same as before ...
   }
   rcu_read_unlock();

If either the importer or exporter don't understand the same signaling
extension, everything works as before.  For ex, external eGPU/dGPU
sharing with say the on-chip ISP.  But if both do support it, the
signaling extension provides a way to extract whatever magic thing is
needed to do the wait in fw.

BR,
-R
