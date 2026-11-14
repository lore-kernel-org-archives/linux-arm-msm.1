Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794668623;
	b=ZVPtW4raVEGbsEa2nMqOJFU06YBmGrHnR7gYiEfHGSvmZmlJUjN1mBpjlU4yohNtrY+K
	 ZREpT6W9fSZAdmyLeU2/EBX/cQSEOGTQwWU9o7IPQofKKQb+Ilyn06KrfxRDaMy3NGekI
	 +bHAhKdldLtCYwXCcpJdsa1oq/AUAcyCOMqwIJLbIWsjAZ4ClkpJADabhlwDbDLeDIMtS
	 zUkceWXia265O9Uz1GOyzCkSKocmnJEwLgowC4LUp2URZzjAu0Ii6eSsMifHgAqVQ2kyE
	 hwtlkTWLqPdWXUlMmanRHd+vq+DegE4uNyA+MuPpe01ywB3/KdB2HASjBFDL8mbc5yQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=;
	b=oa7IvMO4QR1/wcE3Taus+AiH1T6zP9ayOicj4WDR8SQFQLvW1IoWym/pbzdFIswHO0hG
	 CafbLxz060mGC6PtO+91qv8KvQQy/HJKsQV6SGqBbq1dPh76o4BFbTIVfLv4/B7NI9XuR
	 Xs3PDIG3s2PbwV5nJCJhj5RrQLvddwQ/C6Gxtu98QafYFGQOwAP88qzzxKMYYwWaQrBG3
	 uEctqonSqTKxs2Qfri8cMfZKMojkvmiXeihyWdtw5ZCZK5HQeQyScsv6ZyhN4baIdbKuH
	 lxjafrfhJ/8L3R9eNe3Bc+Euj3owSpvwU/OwKPp7EN7HJrExB7Gj69dsaSRd/0gqvQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJo1MP3c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRmdTzyx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2870F606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2870F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJo1MP3c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRmdTzyx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkNLN3844984
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=; b=CJ
	o1MP3cF9U778Fl4UAjeW5R/pFXcIzfxcQ7rXLhxZjZpIMvPmteXIGV1bTl3Q/0uC
	hZwirgGUScYVlk+F5XMDWGUbg6flsUK6Dmk5Ef6/f2K+OeIq6i62seYRD4B42hrV
	VM3e1ZyYM9pkvjEFdZIZ5JMeAW5BA8O8tlVswm5rkbvag0+b+N/EzC4kIM4GOzsk
	zN2PJR6Qga4G0eFO7vLbdVSaIUv6qNSB5atb69gwAzQv9ANqEzxRDX9cz0yPeKsq
	B+opbSDTAGS4DpiAzqpKkD2zoFBA5R31CWGRCWO2jSjthas8be5uQQa2qSc69eUt
	fuUe4FvonoYrntg/UIjQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx128e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:03:41 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-7152379f5bbso1043727eaf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 07:03:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794668621; cv=none;
        d=google.com; s=arc-20260327;
        b=cGtvT2/cj37laM28WUDYprnRAMT2k/qWZdNak6jcH5CCezbWI8GU37/sBLfoeMKctC
         +/rMRvKiQYqoJ1YsXfLqCafA/+Lpj5cAA0jyNNk1fbSAN4ogMTzLY50vRkN4TGcfb0bP
         iX1XDAtwPgoWKjkdKlROBeX658OZqJIyjQaMBUdU0bbVtLJV50lSwVn3GDzLiwA8LT3S
         9SbkEuC+tIs2+tWIKVJrIeOHOnMhmtDqzR5i7tgjmsYqEHDhzME8XPRuv9lB3kFyGWhU
         K8HnsXbMpXt6fREz5THFB1gW4gFOOAk2vP8xK4MGc8HE0R55W7P+35w5Y/kR7iH5dwly
         KDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=;
        fh=7cgj7bGx0xPqeMUNrLp5WBQxXkfGtbPGbCR8xGbIZA8=;
        b=h782jiS1FTymdUEKAgu4ctWIcuftyWgqb12AEYcQicuSgkDE/+GhSGP5yhOks2rZmI
         j5uN4k3ldJ/ingav0zMYPV5/BBiM8T6Jb3ivw3kNFxgtKyGsZVmTubtFNRwqgj97Ybj5
         K+IGswJmRXbkuptmckVAXTe7SHwLTS5KKSAnc2au8eDaoZgc6E4bA4bD0arNoF+1xbbZ
         BLs1MK6+rPjzyiIYyCBX2yAOjHOhq/4++60Tmrxiw8sKHIrbrEVslpLBXWCxjDM3uGOk
         VhXrqfxQkwztEENt6OgF/G2sCgMGg67jZ1Eg1uSnrGChIHa8Pk0HRygjGkGScgpdZKVA
         /lvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794668621; x=1795273421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=;
        b=gRmdTzyxeck1puoWqPpsrthiBIw3Eu1cKf3QHcfnBuqRFpdu1fQtuIpQLW79qiszyk
         jnHFMgRAfVi1SXNBeVi4gr18Uy+4d/aRdpOI0mFAsjElbsEFo76ZlZzxTeNVlCVKfdYL
         czvavHj+z6q0nhvEQX3+PubD4uMxjI9+ssbNcU4xlE9IO+VZz+0FbidXLx7EFX2VrUIv
         hE+60HnxDvjO221tQYXFJcEZ3/Qh+SOqYpzjZOWNwW2iWHTY1QfjK0mWKdesF9nH/vXB
         5yUchoWyEW3EbZdE3ZnG9cp3UJune0eumUCfvwNrBr6hJYPTah8ecwjQbsE7jJ40k8sp
         cXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668621; x=1795273421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDYL/1OD8+rhM9OxoZ603u83LGKRsfSXzfMD1R5tXtc=;
        b=sqlWwnE1ypERhf8EIvcz+5DQba3exRX/+b+CNF4MOT7G4fD2TaHVXXyrCGMIKC3Ftb
         cBEoEmbMIz3qKVBlyjSjLg62fc9y62FdRLveKFOXjlSlRo7sdqZTq4qN5aLs3sXQ7ul+
         nj0XB085BdcCe41FIzAUt+3nERUyJBwYcdgXZA31QX8EPdkvlwmUpcc8Kuy41uOreVwt
         ePxEnFm7n5/Gu959wPXd26M9bElPMtYAPjUk7AmbgYl0enKkhTrEQ+tqwZwBcK07PdUF
         ZZUdmYlu8Mk+5trQqk+TTNEoQYsQMDuC7Y9VbPJWtJtVanQiEynqxDwvy06031VwVnTx
         cuRg==
X-Forwarded-Encrypted: i=1; AL+hErF7A8R4snvfNvjKtu8eNAoTCF8oYJV9akFdI07o5csVm52Eefe7DYq8clMCN3eYTt2DZzvOgv9y8fHsPTpZ@vger.kernel.org
X-Gm-Message-State: APuU4Z89VCtSjRmlGdd3CdF265At/8CG0Y+9dFew4r5pxfUXh9sSImzs
	9oV6hLc4E92bfd+F8DzKYNeuz3wwC+3Ja5Linb17yAYRqOIR0RkWZL3ePXKeHZabpjung5Hg4Ge
	yQJh0/HtNpQIeDhO88o7wN1R5pL84LnDi905VDkcuEpe/q+6W5axESUv4Hv77W84ODoe38i6hL7
	2V25ljYkitKKNkgj9+GJmyeTvmF47i8MXqdhCbcs4NXJw=
X-Gm-Gg: AYBFou3jOEJg5ZTaiyYL8UuEQHJaZHKBfZtmwfv5j6nGEA+HNBHOtauwj/AvJlDIjpH
	kyutZ6j2A57cTxLSgLX6vx+JnAla9N+JKCCleUMXEVAJ6fVPS6xicRR00VVKutQglKPd509RYGK
	Mpz0+HIOaMVsFXyaxvlyE6ZHcg31YokWJzjyG+So9mqiO4QpsBcaQ7LalZ/IebUt2A27nB9vtcZ
	2fg0AK7lShNPJBjd5OWgg==
X-Received: by 2002:a05:6820:c0d4:10b0:712:c3fb:b4dd with SMTP id 006d021491bc7-71ab5101a6emr2292838eaf.58.1794668621223;
        Sat, 14 Nov 2026 07:03:41 -0800 (PST)
X-Received: by 2002:a05:6820:c0d4:10b0:712:c3fb:b4dd with SMTP id
 006d021491bc7-71ab5101a6emr2292808eaf.58.1794668620683; Sat, 14 Nov 2026
 07:03:40 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114081902.1669-1-arpe1618@gmail.com>
In-Reply-To: <20261114081902.1669-1-arpe1618@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:03:29 -0800
X-Gm-Features: AclHuK8KPquTQTMdHPjuGHN_Vjcpb4fNt0tQaGS8PVmX6JLmxM8xgl-PL0FADhg
Message-ID: <CACSVV02fCwbFXVjE+XHCo68xMxYUHovJ9ZHRYd98L74N1T14Hw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
To: Jiwoo Kim <arpe1618@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX9mwAU/XLeWNx
 9y4fWSSePEBjEXRrN6uFcHr6QX+tuNjTWCuTn85ArcrkV1Viwt1mYsMXqr+ytyS00HNFCexgFRc
 J7g0xZBAcGCCdiN0M+ugouWeFaSiZlJnHfT6PqciabsnKFs22jcC37hKMIL9hc51js0flskG2XT
 174WmPwPfpVFH+fDXTgWrMtcQ/71o7AJTlRrtbqL82KXKakA9OiU1hrDxLOixySzLGxmmqYcSDq
 KDCQeQAQZLUhg6rG75CM2h0b2mnY11CDpsTobxPClBLD3mDsIPFPr3JwLoDwEgTiCq6Xhajjih5
 4rpAxd26XljLVf8IMTOXfPZgoGR6lNzBd+GZGBZEXicZlfi1XTr12NwvhAwL5rrYZlhQEioXk/k
 E6lx/u4pbbApa2ZEQwLjTKlJxA874L7lTXPcgjuR9E4XKptXLX4DBYqzcdBRGB3wvEiaJ/R4SbI
 /Pt06l7AWVznoM5Nxbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX7c15YDFIqtTp
 KkuEqXiYEAEYcSIyD5/VJ2U+6u52DPB7HrYpMQDiGPVj7RzWSoCYeFQKkCDwvNbBSRMULMjhFEU
 fFnoxZanep0CTYLyr9XJO7ziMw57OqQ=
X-Proofpoint-ORIG-GUID: H_KWxqXVngtxrNXFnCcs2hnHORbMdJKq
X-Proofpoint-GUID: H_KWxqXVngtxrNXFnCcs2hnHORbMdJKq
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af8784d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EtCpCjh61Ki2hOajGtoA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On Sat, Nov 14, 2026 at 12:19=E2=80=AFAM Jiwoo Kim <arpe1618@gmail.com> wro=
te:
>
> These fix what happens to VM_BIND jobs, queues and entities when the
> file or a VM_BIND queue is closed while jobs are still pending.
>
> Patch 1 makes a VM_BIND job that is freed without having run apply its
> queued unmaps before it drops the references that keep the unmapped
> pages alive, release its BO pins, and mark the VM unusable, as the VM
> no longer matches its pgtables. Patch 2 destroys the VM_BIND entity
> when its queue is closed, instead of on the final put, which can come
> after the VM's scheduler has been torn down. Patch 3 puts the queue
> last in msm_vma_job_free(), as the queue may hold the last reference to
> the VM.

msm_gem_vm_close() waits on vm->last_fence which will be signaled
after msm_vma_job_run() returns.

My expectation is that if thread A is in midst of a VM_BIND ioctl,
perhaps not having created/updated last_fence yet, while thread B is
racing it closing the device fd, that file_operations::release will be
called after thread A's ioctl call returns.  Is this not the case?

BR,
-R

> Changes in v2:
> - New patch 1, for an issue that Sashiko reported on v1 patch 1, which
>   that patch makes easier to hit.
> - Patch 2: changelog refers to patch 1.
>
> v1: https://lore.kernel.org/r/20261114062541.2001-1-arpe1618@gmail.com
>
> Jiwoo Kim (3):
>   drm/msm: Release the pins and ops of a VM_BIND job that never ran
>   drm/msm: Destroy the VM_BIND entity when its queue is closed
>   drm/msm: Put the VM_BIND queue last in msm_vma_job_free()
>
>  drivers/gpu/drm/msm/msm_gem_vma.c     | 77 +++++++++++++++++++++------
>  drivers/gpu/drm/msm/msm_gpu.h         |  6 +++
>  drivers/gpu/drm/msm/msm_submitqueue.c | 50 ++++++++++++-----
>  3 files changed, 102 insertions(+), 31 deletions(-)
>
>
> base-commit: 1e59855738454b14021b64115f0090eafc7526ae
> --
> 2.43.0
>
