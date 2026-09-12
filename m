Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AAACA6F
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226066; cv=pass; b=R61sg/Tq7B2c4QfVebX6TwRBcyQ+1Je5DsILkRVz37gDrCLbdsmLwl2ZvOAEuDoKVb3P10IkgkD+wH3dRPM2oTplySCRrMw/EQG7jUrQQ3udCQsKSsFfyI+JfwcaE9I7oE51k6h9YHB9oSZtIjowgqA1JMW+PLiObOK2mR2i+SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226066; c=relaxed/simple;
	bh=SBxaJVuzm6EFRqXKd2f5qotDm4zmLwhlTrl3jM0x/A0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYECAI+hDWo+28598Ck+gDHgJuLVJuI8ZTQzg3VJiQL4GfU7CDoaKyP+QCF+BT5EGlC0+YEXsT9pDSjvIcaK8aB8EhyBztSuEGOJVz2RvMyEF/xJJHh3KF5/MuAWcdX2yLCMLwRhJHN505tVSKY6AFKU2ZEuM+/MaQZff9SB4Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mb7hlqui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgSWyEU0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mb7hlqui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgSWyEU0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEeq5S3472961
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=2RE/Ft/l2lAC92ld70vmZ1LagKt55M96AI93rGFYrKo=; b=mb
	7hlqui6mgeogkjoJMJtXHDkMzzXOBazp7dTPY49Ohh63Nx9G7fWJDJeSSGfVhFN+
	/FO/IpAnsqHl9Yw57FNzn4bp8Igs22Fb/ZUDkMHeGPR8QAZ3f/E4Rt9ka1f1XmpB
	+K+BTwVxlAQVdcP+GJl3hRi+e1xxKZVuNXs7QeMnZPX8DMpNSaDSIaOOmTGbtuHm
	qOT61QcarXlhCi/HVRvFB5ZkhG0FAC3UAFd5Xrcp7jXqRMd06/TFFRGWNDoHcT3U
	8XqDoziRO+mCK4Pi3yl2qVL4vJhxWQ30X+DHL9xsZOykZxQrG0ph5RFOqoa7gQjn
	e6xerWR5xjyLvB9xUZag==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c98dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:14:23 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45a07949855so2541615fac.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789226062; cv=none;
        d=google.com; s=arc-20260327;
        b=KCqap/tWTAZ+B9pJYOBgroydziWgviI4CGbpZ1Mfy9D0OsLJB/Ri3NjGZxpNH9CAbM
         PKpXN6QJ4ZWce9MI7ZVnO0+XDIzT1vh1a45LaFHRQDWPM6YeROenPJzq2q8mOUg3O5aT
         CaufcIQDyA848T5PEiluUpXpiXMPaMjVgH0ZClej55Sxep8MRTx3yjNyfVt7ptS6kAoS
         yemhHGvEASuQui7gPcfcrh7rmmyJWKQPT6mDFxDdainJ3PcQUW9UCWyx74gpRA1+BjhV
         MJi1i68KdPVL+s+LrlH6fQASXwPm52ZyPrNimoio3iIseU4CWju2XAJCOEaOVpsqKeKZ
         18Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=2RE/Ft/l2lAC92ld70vmZ1LagKt55M96AI93rGFYrKo=;
        fh=rKRCUHS56UZzmOoJTfJeXSw5B0apM6XldFzDcMf7TKU=;
        b=eDQMFte9VXjODKLNAbk64DHcdB2iTifDyDxOEZ3FuriHwOxjWx10rOkNgTMeGaJk8E
         p2gYB+W6/IJpgbmRksSYlF+HZ+E0SKhrOGup3Z6ZzitbOKTSM9GRnXDLUccRvwbeEXJy
         ZOdoDWbLGSnnX58ip8frV56DOk8vb18en0HepkwGDIr0U2kmZYnchNlHBj4xlduZ7gxc
         eRWHclL19xd+2AE0gwOgAJfevjF98Qf8Iw9J4ErYS8bZR7qmJxxwWiW9aiFJLYtBJ+UJ
         qZ2j9gh7jKeq3yP29f7+kjGRtmlFDktY10kEBXSbObAtHZ/dohNTdZKeaRuM2KmLDx8u
         ArKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789226062; x=1789830862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2RE/Ft/l2lAC92ld70vmZ1LagKt55M96AI93rGFYrKo=;
        b=fgSWyEU0mJ3ZySuRWjneVM9RpAEDDwiuorxv84YJ/2TMwJM8Wg7wNcKbQDHjJgEd7c
         hcGqT4jkvYdHbVow/jfTMxFK3wailhtjBDEQMRs7HzIjGbfvni2LJW/XvrJNrPjSFtGa
         tb3imMHEuCf4yadfJ8B+6q6Vw3I5H1pw9Ski+j+LcXgDuKVtIwJHhXyXiVPmqRdfpNaI
         ouvb70EeQYZcfjiOWa+63YkWcuYBU23a+PSsNp0e1fEqqORZ4LlawWZ1tLSb7iDTEzdn
         cIwpkOU/VdcQLTiffkK6FYGXK12wPhABGXqn5I1OetwExVoOb9g143m8GFO8zCki/RPY
         uqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226062; x=1789830862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RE/Ft/l2lAC92ld70vmZ1LagKt55M96AI93rGFYrKo=;
        b=bQspH9vfeMV+aU/waNcef3sQY8NTbohHQqy34RpbZV7HfILEgaPblR5i278xPxGWY2
         JFJ+GMylzTY7/ZTnbypxlVYhRzaS99B5afmxUQuFkLUrK+oc6zrJyf1uZtxggBJem073
         Q5g7TRLqZUrP5STEp8CauZpMOhoJ9+EzEuJcs8MHUtAy/29zk+WmQE2AjYExXd5k2PLn
         Y0j1pvhdCX+UdezP3p/Zcf9NCV8vE1RNEBI4RGOjzeNIxL0Rfd+5tN+rJ+Psqcyx3C/u
         Ng4sRyE4OcK/Kd4M4gpj5yi56vNhPRxImfHDZ1h5v/IzT9zCCgryOf8TaNdi8pJG3QIV
         joJg==
X-Forwarded-Encrypted: i=1; AKwUvBxg0UjxyHy6h+2Z4B+zbI0XpnNVTwzfacfZg2NwQupHFmtkDnF5VydmwrNnBE3EdWVXgx8Y8oIMLPuld7XF@vger.kernel.org
X-Gm-Message-State: AFuF++kHuhthY7l2kNi0LyCzSdi6kXNsJO/YJYY74d8EU8sDZXMYgbIK
	5fbgAy+bm6cjBUAwtGqMbC0lg+pYdwOZmaZDp0vhvW8yYz6QzDlblLYdOzy71TJ+lR9mekDcrSA
	0H0RZ9XaIAgk8MQX5nljNaMkno+cfa7V7Tro0M3psueBEVvuKdufEcTVj5YmiofZ85gxECZAKJt
	RAlapol+OsDrxnnRTldpAYvD5oGH0oUb0KoRWwiP6L/rw=
X-Gm-Gg: AYBFou29PtY/tvyk9ozpm7ErSR3sUqgbnQ/rJohrZTJMwqErL1gkDOCqMfGI95dTl3K
	X4C0X+cRnWgbyFROn4jF+GcjShcsfLLy6KHRhdFmkUx78cgHXSPF+ApG0MA+wAKAjH/kwvdRvLy
	ZCilGJEaZ2TLBJXjBbFgTy4sToAtHhqKe6i5piCWUFyPR1IYSx2+/4t7sZ
X-Received: by 2002:a05:6870:5067:b0:464:ddfb:592 with SMTP id 586e51a60fabf-47f58061ca2mr1788149fac.6.1789226062416;
        Sat, 12 Sep 2026 08:14:22 -0700 (PDT)
X-Received: by 2002:a05:6870:5067:b0:464:ddfb:592 with SMTP id
 586e51a60fabf-47f58061ca2mr1788135fac.6.1789226061991; Sat, 12 Sep 2026
 08:14:21 -0700 (PDT)
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
Date: Sat, 12 Sep 2026 08:14:11 -0700
X-Gm-Features: AcwNN1WdubAYmhy0MrZ_kcHNrPuJ-kRycJWGZKZbOcTIFLmj2AiKYhhlnSLmwqM
Message-ID: <CACSVV00FYe+cSgzE3A0G8-6pE9NEuUDOWCs4w=Y93JZqyWPc1w@mail.gmail.com>
Subject: Re: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx
 gdsc didn't collapse"); killing the offending client does not stop the loop
To: Greg Ociepka <greg@ferrisoft.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa56c4f cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=zXLAmZJP3ypUEzgl:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=a8UEx8NLAAAA:8 a=saP2t_mShj24_FTDOHQA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
 a=-yeuc7zBjbfZT8aiaP-D:22 a=-OPlMFtxszdMq-1ZrUoe:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMSBTYWx0ZWRfX2r4eX1dTGz0N
 XNy1Hgnh0brFwPlpzUGnkiB6UJWeAnNkmRzgzbUn+NDjixw02WQGzwsdyoeSuhVLpfcshOqYoQW
 pnzrI4JP6I0lNFcVGTGAUc1WdhgAbSQ=
X-Proofpoint-ORIG-GUID: 0SitTT7yOIfVR9pFiTRUkCseRfXxoQF-
X-Proofpoint-GUID: 0SitTT7yOIfVR9pFiTRUkCseRfXxoQF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMSBTYWx0ZWRfXywEqhdLZu/Hh
 9EVfcfTE4BqOOxMSiuogAu28O01Gc/qrQ9QhVpfAwBb22hk2zzMdZmBacnHRNo0c2dLG0FOSVXw
 PXBIpVPh/YRsUb/ZVXW9rB4yzxvn0Pe+t+i0cgCQuvd4xbCiCd+zLKWEOXsUOfkXl1L7oy8PFu6
 4/JyiJcKRIrJPlcIkRvWpNf/gk0Bj6UROOPvzTWWOrLTnizncCR8hruCc72Nt42YSd7U3dYgMAM
 C04UCRVISBPVX9wvpbml633KoSHDoel0AnuxZgxVCtTFgdyPlknOAB5INosPXNEuG/Z8FSboqSV
 sdmyaEfty5/DeodMbX0vLsVoWG56n/vfrNZB8YfamzCevE4fGCx4I9A8aHXMfm55PP+q2kBJqT+
 VsrPSJeT4sIgs1IGHZX8fU0+xvJEoRN/ySZuXik2atCbItwVcS9HVPK9b7tu76ZaANx+Ao8LInX
 wOrLHGX0GGJwpeIVFQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120221

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

If the issue you hit starts w/ "GMU firmware initialization timed
out", like the issue I was hitting, the patch I just sent[1] (and CC'd
you on) increases the timeout to a safe value.  Could you please try
this patch?

BR,
-R

[1] https://lore.kernel.org/all/20260912150915.28700-1-robin.clark@oss.qual=
comm.com/
