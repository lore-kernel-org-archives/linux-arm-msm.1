Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C7F4F68AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 15:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076429; cv=pass; b=OzZB1Dgz6jKLf8jpJQxJzd87Dwl9F95FsQckwXUj+bv6DNp3vUvovgIWtzbzO2lNRSHR6anmSogbOZvoU1TiHx+wxHDcFxDGzR/I0tU4E/d68UqGnnVzz7kdYxGs9Kmh8bPs7D4tWM8Xza8y2jMQKpCw2P9WmMZGVpZ5TKBR3JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076429; c=relaxed/simple;
	bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnClM/cO2DgF15Rs3PNMQbMRV9qILyHcxvXM0rty2AGUXz/OGls5I2qGpAITMfLyNwqE1UYc8nU10teKRxPk/GVlenOoz4ygcRq2doPbileipMTL92586y/VWSsumfFoyS701hCATuvFPyRLaema0s3GlXc1mNYzLplr4gCK+YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0UE3sjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aj7I3o9V; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0UE3sjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aj7I3o9V"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOTP2114149
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 15:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=; b=L0UE3sjhpkGmhWcD
	KoOduoIpJoA5a577JSZoePOLGX7e0v26yx67AbT0UmnzIES/59j8NaNAmujSvo/t
	+RaQhZNWWVMJdzdxjDb9qxZjR5OhXQBs/79pve2O2qFAppZQZC785B9p0VdBTIQX
	brXi7j5V332kv6AMTtCwBzoOVdr5kDUd6VoX7wlPgbSPAO012InaFRBcsEzg4zpE
	CZMoZeKnIr5yvPZzx42HkPVrpSI0wIheotNwc4Mod4TdfJm7roYHOsLgL7VdAxKa
	zwfHVIoJOvXFluitnuDTWiOym2MPWAgGECHEXZdKxD0LmXqVctIjAtfIxnjJjNBL
	gVRiVA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmybn7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 15:00:26 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so6208785d50.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076425; cv=none;
        d=google.com; s=arc-20260327;
        b=j0xFThpr7QuwbVn9EmUVrTNW7jRYb1tWU0VloOurJf1wcP+LED5RNdPQk9bCU+nur8
         NlUFlIyyAsp6To0DU+F1Ozgn6Iw6a2etivgxnT5uZ8vEXkJctBDpclk+/GhCWWiLH+hI
         GDnS+ZNHOZ6Ba+69+zonuS12V5mA3dIS22yYrlY43PYf7kfyNgV5PdOV+dy1lr39HEby
         A/Sl2YAsaNGBN1ZQ29cwerxOibprpQMyuddsFokUWtX7SFTgG0679d6N1emHWeCFFxil
         dmfjmvWy+DoYcrF1uhc6mv1Kvtf7LzVaPEXZLQXIhbnL1XIizMij7qKohGROFK8IMTjn
         F3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        fh=3CwMAC1OwnP52X/BS/gB4uP/9vgpfQyqQkHOgrLhiZI=;
        b=FjS17J5FKsk4ajv1cG6JnGoy5gTNlIPTYEiE5Cj/VZ7OfkKIjDqzUHWdiIqyYlQ7fy
         AiGcnYZQ+xvcDxo0V9GZtK4PQBkZUN31McBiPI/BP5FNUt/5O4Ps7YcstucJCF6Qson3
         GzDMn6H4d1aBfab/tePPvDnfYjnK2fFAnjWjGsVrpd4K/zkR3ebKuy7++ycaF8qHT/WQ
         Rync7jDLixjifqTHyxZOLBWz8WNS7xHSeSdNSwADfmdGl8K4cqKkmNKF6vL5wf6U6i5G
         LPUS+TSC0e2lHYFoCURzA1AFcU8N4oiuRBvyQycozWxF2VEvkaIW0V5zWwbkvmXijl1C
         b9QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792076425; x=1792681225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        b=aj7I3o9Vk4jvllzD2UDEM2pe1ozVBL9izyYvproMKqq42Fl5Oo1wwTU9NYSYtPUP+n
         5/HvQLKU6iPa3NNUVcoM0N+46Wq+FRRvHdAPUHfypuZsNCzKTbu21xREF+9Y+jjZu+w6
         ScpNN2gmKoosssV4iS0v3Lj0nyXNPCAqqeSNuPZqohouCLLiU7qATFTF6c0I3lO46USf
         Yy3/RzCESYHlUEu5jxfIsdYOenzSCvHYyd2wR1JQW8cDXS/SbcYKJh5F73KcY0kxMA7n
         9RayyhRImmpENvkaC1UrW96OfgJzzz580oBdlRAEE1pvCCanmU4keWqrblRofMna+pKG
         u38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076425; x=1792681225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AubrjuTyFtTcB47akR0Z0Pa9zMrPvbyYIyhySwc51k=;
        b=Eo0wRRsmXB+t0REDPXMBX6NcIeHRxj5TNplXSU+q/XDIFIIV0NgxVWGejKfH9zU5Mv
         gQ+NJyVisVKdRdp3m7k3q509ciACt7uy3rl8/pkVylryJYYmZ7o/TSVzGz8EZQ3n5Bxx
         dhRD6vlObCEVxCM9AzHwVLgEYY0f8AJb3eddCZr90nEQ++6uRPv1zWbPLfHuWApCyRJq
         Vl8YgegObfQgvyYB8DQkHdjaIbgN/YqgN+LayVa9SHX27dG0TE0XbeFiFEPnooaMLS3b
         50EjZDMiYWQMeJrtExq9RjiTDF9nU3C5gN7OPxiBE5RtJWElftmnszFtNAND1+LOy1rA
         eOSw==
X-Forwarded-Encrypted: i=1; AKwUvBxG7hK8hx8nSdrV83Dm/O26hrGCtQXPOQg2NLTJHbGt58AyPqUWOUOj4DCpm5zFlcxT/zE8h8n5KavsQcqz@vger.kernel.org
X-Gm-Message-State: AFq9FYKms2s9tp3OpZTwgqaR139+j3WOw1JLaJX6FFIQAyW3dCTDJjo2
	StWEUJ5B1U3VSr+GNaF4KbkxVk5WCpwhWHPkMxwD5ahQJN7dZF75YzQQ+FV1jolcvq/waDTIiNG
	FfyFy8WmZdXaBuriJJxHE0Vh9RO4M0KesCSqvZ+vzhx5X8ApwwxrMSPwrq2stjrizOYb48iOrbb
	qg7DnHp/BX0wgpJBjK8QKVdp0tIMeCmxqmmGJcB3XaONI=
X-Gm-Gg: AYBFou1PfVaeTwhM09mM9/wOMJO9NQ+vs+hBLcwNUFAwt1fSuz6YNvapuIv1qECN7KR
	5XFEzLcp/X/9f01RCcsmDMS8ZZGAIuVcrO9vmNS5Fgu/G8XCyz14ke+xwKrBz7yTlCD1ukE9WJh
	tr2GF97yWGBOpRqTV/MAQv+MTGzdBsSU4fTbJaInnSoMbHPGvWj4wDzVYWAw==
X-Received: by 2002:a05:690e:e8c:b0:679:a56c:e2d4 with SMTP id 956f58d0204a3-679a56ce9cbmr416681d50.21.1792076425151;
        Thu, 15 Oct 2026 08:00:25 -0700 (PDT)
X-Received: by 2002:a05:690e:e8c:b0:679:a56c:e2d4 with SMTP id
 956f58d0204a3-679a56ce9cbmr416649d50.21.1792076423912; Thu, 15 Oct 2026
 08:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com> <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
 <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com> <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
 <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
In-Reply-To: <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 20:30:12 +0530
X-Gm-Features: AclHuK8demruQYQ8n8tHl0BDAgZY3hGCZO81qTxG4GuyJEws54lZr76wmzOWfEI
Message-ID: <CAGptzHN1-x+9aoccmes7PSOZfT=SDQK8e2yJc2AQhhQuc5+BZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: wU_KuET19TWiUHYeLCV8yj-1W8UrnPr8
X-Proofpoint-ORIG-GUID: wU_KuET19TWiUHYeLCV8yj-1W8UrnPr8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OSBTYWx0ZWRfXyQGOAJAC5blv
 265A9GdxJupTBvfPdtGnMKe5bz5ZUtwjplnk1uP60rQgDY/8jzMVaLHt4GuGUbYmLspEB5c/qa2
 Ex+WL8VEhyQH5onE+PbfksAhZMrZuac=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0ea8a cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=b45o4kL6AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aQIlNds9TXYcn2LlkrsA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OSBTYWx0ZWRfX89b9YZiLesad
 WOpqLuZ9+vs8STcHXuNa5NKmgvKQgKYldqQ6sQVe7hP7ekK5fbCGNkmGMcHYOFFfdk7U/q9g7g3
 zMhnl59VjmgsNwp9b2/jl5/jleJv1tx7w6l6kiwQTb+8ROv2OuVROddsstrCWP1u4D42i9lzOq6
 ug5VVUHDxIASrcHnrC2tgKYgSTt6oqLrStQnmR/98tmE6W6oPlwFRSMKMRW51V5e97uNTFLWhAb
 8ZaZRo9hesREtk1ieQjb5jhLs49i17GiaYh+JecACFM4WtKu7FfFuzSXv+Cexk+3W03KcrFLJEq
 wAmqYf5KTHJb4UtHCYwDTJRQeyO3LGiNlb8HkFMq3Re9M5Dw+sVvO/fhfSTvdDAsL8EbbohCw2X
 GIBW6NLvypGcHdqoHvg7BcCsHY5g72dMDZdRKDu6K7/Fdz/2YvLYM1a82+CmBnBC9D51eKC+DgW
 dCR26xtBAlAsadRW+ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150059

On Thu, Oct 15, 2026 at 3:13=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/18/26 1:10 PM, Sumit Garg wrote:
> > Hey Vikash,
> >
> > On Thu, Sep 17, 2026 at 5:11=E2=80=AFPM Vikash Garodia
> > <vikash.garodia@oss.qualcomm.com> wrote:
> >>
> >> Hi Sumit,
> >>
> >> On 9/14/2026 11:44 AM, Sumit Garg wrote:
> >>> Hey Konrad,
>
> [...]
>
> > The main disadvantage is that we don't want to carry these custom SCM
> > ABIs per kernel subsystem with the open source TF-A/OP-TEE boot stack.
> > ABIs always come with maintenance burdens, especially the custom ones
> > we have in this case.
> >
> > Since we started from scratch for the open source boot stack, the
> > motivation is to keep the TZ ABI minimal and that too with
> > discoverable OP-TEE services like the PAS service.
>
> Okay, I can symphatize with that.
>
> Let's think of another solution though, as a strcmp over the provider
> name is 10x worse.

Okay, I can rather stub these APIs via the generic PAS layer except the
SCM backend, that can reuse the existing abstraction.

Although I find these APIs not related to PIL/PAS, it will be
just overkill to have another abstraction layer for it.

>
> What is the planned replacement on the open boot stack side?

In the case of video subsystems, OP-TEE pseudo TA already holds platform
specific info so we can directly add this info there which is being
passed by the kernel in SCM calls.

> FF-A lend?

FF-A surely is already enabled and tested with the open boot stack.
See TF-A PR for Lemans as an example here [1]. However for FF-A lend to
work in real terms when kernel running in EL2 (KVM mode), we need
capability to be able to unmap buffers from kernel linear map.

See this proposal from Google where discussions are leading towards
making the generic CMA pool capable to unmap buffers on arm64 here [1]. It
will actually unlock FF-A lend use-cases in the kernel.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/54873
[2] https://lore.kernel.org/all/as4ATqhp0bPI03PA@sumit-xelite/

-Sumit
