Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7F51A75C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 16:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798810; cv=pass; b=FnocHAiS/BooY882MncQUKgx3RnVJvggQYhSl+RDQEfIhggdyASIQJr9n9ACddElZzRGSjXGvym7uVyrBG4Doq9wR9tAiQrwE3TcxB0EhYeOcyj3XZJ4OcmKVehuU1HAU+zb9AGUtCGe/vNMJx4dPUgRxSdqMq7vQQX9ZKo6g4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798810; c=relaxed/simple;
	bh=iIEbZ2usgrOkgZj/4GiJE+ETCzoHaCLa3CfZgEncJko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pV4I3uvV+PQyUB51mNe8cH0PwonE8WhTqv1K4I0QyTc/Yzn0FCABFOb5/4Z/Ubxz7Z0DfoIoeqhHBU+laFmquLw3fIe19eT017CGL6W4PKzgVSb/ItdEAHOu91enWnfw+6f22RfsyCWfZCJrbLqcTEB7kZkuNzBduv/+XGO4tO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKwAep2y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqbpYX9v; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKwAep2y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqbpYX9v"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdSlw244179
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 16:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=DRVweJQIoIP40t34svqv3Me3LqPrRQmfXefWUAwDqlM=; b=VK
	wAep2ympu9JT872ZaG9cwfiY7NPDhks1SFhSeoj0aDyOCFORuB7548WWrVoyAoAV
	ZJ/NqYTcEvasN9cA+KUngQeZppvSAgi5WtL+Q5n8wtjOOCW4yoqmjzhYLgdyrYmZ
	9YzAgGFLn/x2zAa6VzQVzu//zvLKPBCWiowuhIPhAiPBn0YOyPA6v+uoBUc7ZUpX
	/SP7fLNdslr7J5Zxkx2Npc598/TxtO4A2GSn74n+iDrF0mY4FyFCqIGIBA1M5Ocm
	n9vmn/0jvT0JmeceqYvRcAH+3muRRFKtpFb/EFUN1qcaOMZYIn4N64RBKJiIC/ws
	9auj7SmN3wwPnVv1WtDA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86t1k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 16:33:27 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46f9dbad956so1482154fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788798807; cv=none;
        d=google.com; s=arc-20260327;
        b=fxvX8x3ZUMr4EmXx7FCCSrzFfOdPKVw06cfuk3lQaKvkfLPH/vy0h74qD8VPvKB6Xs
         DFvrMm61Iel4Fd6rYsmPGB/UGtBLIdVySlZ6UqZM/W/QYv7uE7SaQJNXE+ScLyIQgNMn
         YJyP8GnxhC+aXly3Hnjtb2HmPtnHtmK3Q5ZDQo+RbOHDmarXErrspEuA/yOOolAX4ElZ
         2ZvRfQGk25zoeLfOdSJoxpEeGzqeyAZJyfrygOPed0ZeLShzHTDY7lP4niydiTKKdZoX
         0Cfq8m0c96CIIsa9gKAoqj5dNjunwTIQ373RamXEXqpLFb+CnV4lQi3U0vuf19SKC/8Q
         /FGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=DRVweJQIoIP40t34svqv3Me3LqPrRQmfXefWUAwDqlM=;
        fh=RObsGOUk6xsLb4vr4w6HTHAdeyw96YdXxlTbs0pK+hQ=;
        b=lteqCf1k6tAlQmfAQex2/SdE3YzUA+sJ1qAKW9SaDmuTlPQ/Ejm7WeeuX9jv/42mCJ
         Pl8MO1qC9mqEHHwE+YfRx2h+VFpedtpz83pth7Sydt/97v6LawG86zH9+a6Wldzs7McJ
         Sj704P4OVJA+IToglaxZejQsZM0zPGUBVF9RruFGEE/aaPC0sYEIQ6oafqaiqvEtZS2a
         oVSivzlKStDhKQJDJwE9Ldp/MlAjwRbW0TqeC8NszIIiI2wNrzumOH0TAwEN/r2IWiz/
         BIA/S2dNi923y7RZeNel/IA8gSi0p+s2SaEphAcbaiWL9yN156c0x0QF0yoLEGdOsTaH
         fcwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788798807; x=1789403607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DRVweJQIoIP40t34svqv3Me3LqPrRQmfXefWUAwDqlM=;
        b=ZqbpYX9vgLY7BeP1RI6zmtm2cS7v77Bg268zVmsV5U4Ek+slhZs9Vcdks8jZpqjbn6
         PDgxzlUfwi0/qshZDuQmqpGw6elyWdVhHCbViVJeVJJ0sHkQ2Z27KmAIlSDvdWsFjhYR
         I0jLaYZMNBMrQpf6QRt6WTWtojMeU3Hg9jONCf1tP0FMvnyAgcrLWsSGMqMGpe6mruVv
         cApvGX2Uu1q5gXSRNeqDHCppEl6RQUgdLq0T/Z89w8VjU+4n8ImO9eXWNJO/N/QsfGfa
         tBHZxZjqBgESfNpnrhbIgZ8ClRTaDgocybshcFxY2ZyGs0lngA5V2Do/SqjwdXhV4Arj
         cnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788798807; x=1789403607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRVweJQIoIP40t34svqv3Me3LqPrRQmfXefWUAwDqlM=;
        b=IarPKR/Ap8pC/NUAFevdmgkG19hscCKYgm+lDCG8/jlbd4/XRQAZWeK7tRLEilDL9g
         gjAV+ciaL2JbA1uKlagW7aOPWlx8bahkHxfnFSojkPLH5b9rXSdTUTlBOMag4nLVfcmn
         dobaZY/IFmO8JrhAxzFvtZO/xppet/QHwhNcsxosAWzMkPgrSNeySB6YYg9tF+a4TtRI
         KmEIt5QsLIuYkAmwFzxGa/P1VWlCtEow3E4XgFZXepKKlhwUgjIxi13hjFsUVnIC8QWi
         RURZ9sTwbP0P08XThOLLZnahGqCUp2hbiKWssR8BncuIDBm21MkbNmtMaT0h0JHOOW9A
         ftQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO8AxZ/uDGtbYEDpSgT8mbnCkHwjLdEiIm1k3VHOLPrxlMcqmCsnfU24s5K3JIQrRa1lFvfTYkq9cs8kwm@vger.kernel.org
X-Gm-Message-State: AFuF++kyEQOa/rzZHmFl2r/tjpuB1px+NXoM7apWO/BsexrvkFfnamVF
	nNzQFUHkvzLrac9nNfufKopWrc/CbdoMy4YIhNEL6Nqwv8LTNKWIKopvR/ytddXwDOs9FMTuLE5
	4JnOKPYFnGT8Fw8iIPBt5ZtqZX0aRaqBhPWrUa575Fruq21uim5khtWdq+yC222CDSEtSR9wfk1
	irhHfYVyG/YS5kaUlR20oyUUIP9ub7/GPlIOs+NBy0EnV6FYel3Nml8g==
X-Gm-Gg: AYBFou10fO1cFjEfeWLEU6Ba2OLp80xn+X7eyP7qmj0KWqVLlM6aUeKghzJCowKawJT
	4zueU/j3tNhqqE/WM8LoRXh6/yrt+rnSYs6ceUfI9JiYKlG6GB5c7AMVxJR6FtIXYcrOm4iFT8y
	Jgig58xIhaATo8/R4uv3MSUuia0irbhqq6vdJSO3PlG1QU+301A8JuwJmb
X-Received: by 2002:a05:6871:553:b0:475:a112:126f with SMTP id 586e51a60fabf-475a1124d24mr12814782fac.28.1788798806916;
        Mon, 07 Sep 2026 09:33:26 -0700 (PDT)
X-Received: by 2002:a05:6871:553:b0:475:a112:126f with SMTP id
 586e51a60fabf-475a1124d24mr12814755fac.28.1788798806458; Mon, 07 Sep 2026
 09:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820154428.1278@ferrisoft.com> <30d4a7b4-1f1b-4589-b132-2115cab98b71@oss.qualcomm.com>
 <20260905085428.reply-a8xx-fmax@ferrisoft.com>
In-Reply-To: <20260905085428.reply-a8xx-fmax@ferrisoft.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:33:13 -0700
X-Gm-Features: AcwNN1WTSdXxqjPurMcfkkuM_h7J6pO-dYWho9XClOHzE3KKLwTxWGQJ-ha6JbY
Message-ID: <CACSVV02JMXbUWYGtAv8Tiq5EoAi00KYyfdBUfDGzuETu=rS9GA@mail.gmail.com>
Subject: Re: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx
 gdsc didn't collapse"); killing the offending client does not stop the loop
To: Greg Ociepka <greg@ferrisoft.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fRwMVOc6eoGMVpmPftcbxPOJYI_cpp1X
X-Proofpoint-ORIG-GUID: fRwMVOc6eoGMVpmPftcbxPOJYI_cpp1X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE4MyBTYWx0ZWRfXyiXbn31zxPrA
 3TxtWpI/IpLlYUofDHC3NpOcuhFZBytq/a8u4Z1RZw4YXtUZAcWCNnXEm6587Ve8CvUBM0FobzY
 GDJ1sa2q19wc+CPSpxx7Hs8pr/PsaV4=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9ee757 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=zXLAmZJP3ypUEzgl:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=a8UEx8NLAAAA:8 a=FZWR3zCvmohz_MwBo3EA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22 a=-yeuc7zBjbfZT8aiaP-D:22
 a=-OPlMFtxszdMq-1ZrUoe:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE4MyBTYWx0ZWRfXxuPqKjKu7DLQ
 eV/UV8TyLbAaD5pecQ2Gxz5oLRxvPzHTlFORBfKLVhsg6IXN329/OH1d8sPxOfY6ExcdNh6OYQl
 Miow7KFZZ06p9foL+35OvdDIRB/93FIZMl0mw6g8cc1yNjgxQPW5Bxxpvwua2Hzdblp8Fsz16Ac
 6GqudvjbdWa4yIjE0UlUKv74kvrt0xXBbs7Dcx2y7zusoR+855AZ3vqMpQqjmHByEvUPefbZG0J
 yxUFSxIrVFOYx4ix2+0WTXoiqFEf9iDY0WimjtZHC+8EE/IS+ofpudUBGx5xfU0pPtrJf7cGrwo
 fGBApdjCuHtyba4Fif9dcLUsKe7R9PftXcQzt6zkwTdXvv3ZqxDjzdLfUv+R8nkXPZEreC8zstc
 KLja1LIV6zN4XAGcIEgL6iIagJRyTnvu/tyGxhTVtBX7eCv72tdMI5GaFnLlzj503MJzTuvNjXQ
 z8v+ZraQlLml9KTIisQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070183

On Fri, Sep 4, 2026 at 11:54=E2=80=AFPM Greg Ociepka <greg@ferrisoft.com> w=
rote:
>
> On Fri, 4 Sep 2026 04:29:16 +0530, Akhil P Oommen wrote:
> > On 8/20/2026 7:14 PM, Greg Ociepka wrote:
> [...]
> >> We are happy to test patches, run instrumented builds, and provide
> >> full journals or devcoredumps - the machine reproduces this every
> >> couple of days under normal desktop use.
> >
> > Does your tree have these fixes:
> > https://lore.kernel.org/lkml/06489359-1b96-43ad-a065-bfb9bee51a10@linar=
o.org/t/#u
>
> Yes, all six of them. I checked each patch of that series against
> linux-next (cgit):
>
>   d9108bfdb746 drm/msm/a6xx: Fix stale rpmh votes after suspend
>   b303e1d52811 drm/msm: Recover HW before retire hung submit
>   fc7ccbc6174b drm/msm/a6xx: Fix A663 GPUCC register list for state captu=
re
>   d052d0358fb8 drm/msm/a6xx: Fix A621 GPUCC register list for state captu=
re
>   bc024d325e98 drm/msm/a6xx: Fix IRQ storm during msm_recovery test
>   40b793714ad8 drm/msm: Fix task_struct reference leak in recover_worker
>
> All of them are already in next-20260730, which is the tree the report
> (and the four incidents in it) came from, and they are in
> next-20260831 as well, which this machine has been running since the
> evening of Sep 3 (7.3.0-rc1-next-20260831, with the same local
> platform patches as described in the report, still nothing anywhere
> near the GPU, GMU, GDSC or clock paths, plus one unrelated
> fs/buffer.c fix).
>
> So the loop reproduced with these fixes in place.
>
> For completeness, the timeline since the report:
>
> - After the report I started running thunderbird, the most frequent
>   "offending task" of the earlier incidents, with
>   LIBGL_ALWAYS_SOFTWARE=3D1 (llvmpipe) as a user-space mitigation.
> - The last incident on the next-20260730 tree was on Aug 30, 12:10
>   CEST: 689 "hangcheck recover" cycles in one boot, with a different
>   client as the trigger, so the mitigation did not prevent it.
> - Since the switch to next-20260831 on the evening of Sep 3 there has
>   been no incident, but against a historical rate of one every few
>   days that short a window does not mean anything yet.
>
> > Also, could you try limiting the Fmax to < 1Ghz?
>
> Yes. The OPP table as the kernel sees it here (available_frequencies)
> is 310, 410, 572, 760, 820, 915, 1070, 1185, 1350, 1550, 1700 and
> 1850 MHz, and max_freq is at 1850000000 as I write this, i.e. the
> full range. I will cap it at 915 MHz, the highest step below 1 GHz,
> through devfreq at runtime:
>
>   echo 915000000 > /sys/class/devfreq/3d00000.gpu/max_freq
>
> and keep the machine at that setting under normal use. It is a sysfs
> setting, so there is an uncapped window after every boot until it is
> re-applied; I will log that window per boot and check any incident
> against it, since onset correlated with session restores in the
> earlier incidents. Given the historical rate I would like to give it
> at least two weeks before concluding anything, and I will report
> either way: at the first incident under the cap (with the journal and
> trans_stat, reset when the cap went on, so you can see devfreq never
> asked for anything above it), or after the observation window if it
> stays clean. One caveat: this stacks on top of the kernel bump, so a
> clean run would not tell the two apart on its own; if it stays clean
> I can go back to the full range on next-20260831 to separate them.
>
> On Thu, 3 Sep 2026 13:16:47 +0200, Konrad Dybcio wrote:
> > On 8/21/26 3:35 PM, Rob Clark wrote:
> [...]
> >> Fwiw, the kernel I've been using: [1]..  but that doesn't have the a16
> >> dts. I need to move forward to something newer, hopefully I'll get to
> >> that today.  We'll see if I start seeing this issue.  Or maybe
> >> something x2e vs x2ee is different regarding pmic/supplies?
> >>
> >> My device doesn't have the highest OPP (1.85ghz), which I think your
> >> device does.  We might be still missing some power related features
> >> that are (more?) needed at higher freq's, or maybe I have a more lucky
> >> piece of silicon?  Akhil would know more about this.  You might try
> >> removing the highest OPP in gpu_opp_table (in glymur.dtsi) to see if
> >> that improves stability?  (Repeat until it is stable if you have the
> >> same issues w/ 1.7ghz.)
> >
> > Greg, have you tried this?
>
> Not yet, and sorry for the late answer on this. We have not run the
> machine with the top OPP(s) removed from the DT for any meaningful
> period, so there is no data point from that side; what we did instead
> is the mitigation and the kernel bump described above. Rob's guess is
> right: this is the X2 Elite Extreme part (UX3607OA), it does have the
> 1.85 GHz OPP, and it is currently running with the full range
> (max_freq 1850000000, see above). Mesa here is still 26.1.5, the same
> as in the report, so it has not been a variable in any of this.
>
> Rather than removing OPPs from the DT one at a time, I will start with
> Akhil's Fmax < 1 GHz test via the runtime cap above, which is
> reversible without a rebuild and is also the most direct test of Rob's
> "power related features that are (more?) needed at higher freq's"
> theory. It is not quite the same thing as dropping the OPP (the GMU
> still gets the full table, the GPU just never gets asked for the top
> levels), so if the capped run stays clean, walking the cap back up, or
> dropping just the top OPP from the DT as Rob suggested, is the natural
> next step to find where it starts failing.
>
> On the x2e vs x2ee question: I have no insight into PMIC or supply
> differences between the two parts. If there is anything worth dumping
> from this machine on that front (regulator state, the level table the
> GMU is given, ...), tell me what and I will collect it.
>
> The offer stands: at the next incident I will grab the devcoredump of
> the first crash state in the loop, before it expires, together with
> the full journal of that boot, and I can run instrumented builds or
> debug patches on top of next-20260831.

Fwiw, I've started to see something similar, which seems to start with:

Sep 07 09:19:07 shady kernel: platform 3d6c000.gmu:
[drm:a6xx_gmu_start [msm]] *ERROR* GMU firmware initialization timed
out
Sep 07 09:19:07 shady kernel: platform 3d6c000.gmu:
[drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set
GPU_SET: 0x8000
Sep 07 09:19:07 shady kernel: platform 3d6c000.gmu:
[drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set
GPU_SET: 0x8000
Sep 07 09:19:07 shady kernel: platform 3d6c000.gmu:
[drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set
GPU_SET: 0x8000
Sep 07 09:19:10 shady audit[236335]: AUDIT1123 pid=3D236335 uid=3D1000
auid=3D1000 ses=3D3
subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
msg=3D'cwd=3D"/home/robclark/Downloads/deleteme/darktable-bench"
cmd=3D"true" exe=3D"/usr/bin/sudo" terminal=3Dpts/3 res=3Dfailed'
Sep 07 09:19:10 shady sudo[236335]: robclark : a password is required
; TTY=3Dpts/3 ; PWD=3D/home/robclark/Downloads/deleteme/darktable-bench ;
USER=3Droot ; COMMAND=3D/usr/sbin/true
Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
[drm:hangcheck_handler [msm]] *ERROR* 44070041: hangcheck detected gpu
lockup rb 0!
Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
[drm:hangcheck_handler [msm]] *ERROR* 44070041:     completed fence:
581164
Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
[drm:hangcheck_handler [msm]] *ERROR* 44070041:     submitted fence:
581167
Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
[drm:recover_worker [msm]] *ERROR* 44070041: hangcheck recover!
Sep 07 09:19:12 shady kernel: msm_dpu ae01000.display-controller:
[drm:recover_worker [msm]] *ERROR* 44070041: offending task:
gnome-shell (/usr/bin/gnome-shell --mode=3Duser)

In particular, "GMU firmware initialization timed out"

I _think_ the main change on my end is switching to release kernel
config (from one that had lockdep and other debug stuff enabled),
since I was doing some benchmarking.

BR,
-R
