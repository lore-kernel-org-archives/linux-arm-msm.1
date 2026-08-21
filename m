Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46B3064B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319325; cv=pass; b=hod5+YHWW6wb/QQ/1RgKgIN9FUEEkub0CNDmpalvx6XjCiwD3zsvoyc88u+i7qT+O5w6oQ4zRH4VFNdQcD51Rqhyh+M11Iatk2KZAh0wrOzDm+UdZ0NmuSL+5c7uoEPPM/PzJmEtbFbMnjaI3A6NicOXxxXnYjzos7WG5inYLMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319325; c=relaxed/simple;
	bh=lyDB1xD2gRbv9xigd4MBBtZx3KQKhd83gKkETJ4NfYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVcZvDUb3DMjnbzFUEQ3/JeyOtogylhvb75v0TLAovFHDPQLg8z8FX+gXPSW6Nwba6APauidxSStQzYnEg6oQncM+ETi6B89vvJv7ygoU3E4x9HjapRgAUh15RHdIvRxOVojx2rGh0jmWFEEwtrnx5zmeOXGL2oIoZ9FXSRr65o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBu8b+3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPU8bFbq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBu8b+3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPU8bFbq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCoQMp3489709
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 13:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=EGgQsjjT+EKRdOye7pYxMstrrJ0PX0qzvJBOzzPkvg8=; b=cB
	u8b+3XyTBgp6SlM5EdMs4p+/wwmozMKDNRA33WdUMt/SbYo7O0VitOgUyQ7cBN5x
	gaCovsenEWtmaU4JGEHkO1RbHBhWjc2laf4G/enPgPUOgYvbXCKNKamWm+9u6jKy
	I0k7oQ0tSynRf8vHDcu37nUkU3Zmwow/IWdaaC4NedH09at3alLqfxlb5RsDhKA9
	zkw1kWzOmbrx1Ka47iMigyIJv8El7au+cfThIAY2Fj5mHsPuhqkJ0o/X9R8Og+T9
	fw/95u50awX/RU2c8FwLMfmci4ciyWKoE4AxzcPnRpUnmZ0tMYL8hn8mJsKbAPz0
	RK2ob4Ev35Eo8s20fnXg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9sxf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 13:35:22 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-456ae656699so1623484fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787319322; cv=none;
        d=google.com; s=arc-20260327;
        b=N36EywBMe1FJvu4hYFbqIYxwmx18lm4gGMaPZOmKkkyB7KQ+Ag4ODO0nQX97wIu6dd
         1KuJzaQzHjE9r9EqnUqS7dDPj+FH/aC0a5EQhr7gTBgGRux41/I1djQCJ6X07CJmokfx
         XSivAv7+XQUudzNCTbVBoDSVmF6O3Cd9zuJsfoYPzTwsGctv+Zo8ndOOa3vyfB/7XiHp
         x5pqQSkeM1It0HS0TnbGiOrolDky1HQzJYTgEY2uAPGNIPXHxq5P1jBqzPz4YnkTtZ9l
         Q54fASD3UzlFjopMWGwZSuZ4GICyqzuWE7+efhvahK2zY0hDywxNnvn57GL5hNde8Sgd
         HXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=EGgQsjjT+EKRdOye7pYxMstrrJ0PX0qzvJBOzzPkvg8=;
        fh=RlT3VfklQFivu+LtijRlsM/T5+UgBLRD7zQJZfBqD90=;
        b=EqSEJwYfgycqhxc+BxiN8VJaV5+TYOfAbx+KIZCOWvHhvcYVRDSfIAFRhWUnR1XvtL
         Hw5EkHsk6bp6arBPEobRN5HEtNH/eGEAouJ+fXsbZgFaegJ/cc2LcanyBCKDE4Rac1Ts
         9NB07YyND54nj8AsNvZFULuedTrKwWMyKsIheJsySqFg/dprjV+VviW8lPjKPoit7y6p
         3E9FpJXMZXYYwrue7JUV51IvomyugoeMY8s7FPRSjHo/diWcoQankLxbYvZVLmrbOw9G
         NO0w+5WwMylDV8kTvg03ag7a9r6P+D3725WRudetsOqADKiYI2P2NYyZF3bm2Hep7O/v
         Bv9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787319322; x=1787924122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EGgQsjjT+EKRdOye7pYxMstrrJ0PX0qzvJBOzzPkvg8=;
        b=DPU8bFbqar8/K1UcMPeO3DSHRPB2j05P6NIbLM2PQzVJWVhOhqco7cDGWA2XtURZMW
         mwqUZ7fAtLd8Png7JFmd71mIWgIBQ5QVzwUBp0uWFBtw8fWlF4/QzSmQHrSbCMceOGHu
         2EAfwAJ8OTWyMb8Ldd1hIsSlbUFXeBRL7KQfIqYYO+gNgH6VT8oSrQlfWrmFjzpXYqzX
         9rCl7XBPCF5xoVhPqAcmQ4BHX39V7rtq/6BbNkIBO9Us80oRse2l+B3lvYNNL2pe9eso
         Mk8OkK4ixb+ROGCTjvyoobMKlnGRNwASqDch7lXUUlcLZOOcFQLR2Htnj8d1d3yd10wc
         HnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787319322; x=1787924122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGgQsjjT+EKRdOye7pYxMstrrJ0PX0qzvJBOzzPkvg8=;
        b=LCbB8M2/Px1gHnaldJJHt185xIgq/oOCUEUjRNVjjGjsA7h/HcwaNcjtYyMikjDLLe
         697EwYXdc1NtqeI5L1V2jbhfcPpTQV33LK1/CaU+rEJIiLUlPbg7iy4SHTtD8WD0f6Rc
         qU9QN2b/nKUik56DYkk2HHPWDZlT/Cqm2czJzGPB6JfcRc1k5EOUZ/IyZK7Vv7vRu7mN
         dskTrGnbdQDASJiFXeYwhmSeZJzd+2OrhsR3KPeNhi3uCIxWZ1YcBDOVMeNt4e2Vf6Dq
         wwm7DyodRlnVR/YJ8D677Cx6xGj5vEZjgtRr2r7Wq/WSu5AbSMr+nw8mRRpo7ODcA+yQ
         nJow==
X-Gm-Message-State: AFuF++naq82uISrRaUYBtfftLOwzoQKeHW/kHV1WOHVCy2NfST+C5Lj9
	TjIBPWl+H7YxfQ5gFI+FlX6O8vDl0NsyHJvgATe1Jk4rs8ZCUDAV1TMqfyZRWX7Rgccc+JP8tqs
	SOt2OtJnBRX+aGZl6WLMZcij8L9TiGbcD+rkQsDj5kqm+N+fZ5aZk7/pEraA+4HxFCTHDQQr0vR
	7NWwgwa8MLE+5F4SCv2bE4mkL+S/xsxe4ed2zSfx5/CJI=
X-Gm-Gg: AR+sD13OKch8n01Af5cmdx7WbVTvSCGgcKwShlNmFD/wF0xdq9PYYy65l+mYy74+ZIS
	0oeoZiNWjh0Tn30GzQIpBTfvDyPpvvBDmb1vB4yctWO2ue5hCJSfaXhfGJhxK/XX6C1sp/2UDls
	aSaVeULUfauow5ukj9BenPbIssRUTkmDoVWgcuPpiEsoz5t4Zz/AhhlhMN
X-Received: by 2002:a05:6870:1d15:b0:456:c9f7:787c with SMTP id 586e51a60fabf-46351473502mr6812846fac.17.1787319321712;
        Fri, 21 Aug 2026 06:35:21 -0700 (PDT)
X-Received: by 2002:a05:6870:1d15:b0:456:c9f7:787c with SMTP id
 586e51a60fabf-46351473502mr6812772fac.17.1787319321277; Fri, 21 Aug 2026
 06:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820154428.1278@ferrisoft.com>
In-Reply-To: <20260820154428.1278@ferrisoft.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 06:35:10 -0700
X-Gm-Features: AcwNN1UiaeiwmovB3MnAFVEjAMtoAugtRp3z9oZpPE4thN2uzL1MwSpJhcy6nHc
Message-ID: <CACSVV003bOJo4OJGvwHAda3h+KoiVJnzOqjwAVfjNG=V-V+RAA@mail.gmail.com>
Subject: Re: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx
 gdsc didn't collapse"); killing the offending client does not stop the loop
To: Greg Ociepka <greg@ferrisoft.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwNCBTYWx0ZWRfXzM1dklVg2x/Q
 Mo+kY6sVicPYeA0CuSIMwozOhb9cYTUvsp8jp+kNUv3uCgy3mzsdukOwvaq/ZiAsg7HhyKzYi+h
 SIPP50rhI1F+ACRj7Eno+3UgMgV57ShbHcRvTscXjQYBb8NbBEFDnqciSt5YisdgeO8QdGoAlva
 ctU0htB33Etz+4J54xEMYzM9OMpN99daqwfnXVrZWNoMNtkZqRqJTHpRCaET1G8z3I/I9ApyeHL
 hpONz3a++2XiUfyBt2Zr18+kSkWWonMx84Y7i6lQWlsxLIzMBlvg1X5Fe+GL20FL8me1bpPLo3D
 c/ucWkl+JIuM5oPC3jQcLCprdsHFGT5wcLfysFGN4USjKlUZmCqcAIIpDMhguMYfQrl3RrjHZQD
 SSW93Ea3K5c1qFylRI9RHsJQ+4SInH93w2JWLJO7J6FaCrgTHNpiqHC0cYKfQ4QEm+Sf1WZKsQ/
 sJjrnQ6bvhy6+mIfKTw==
X-Proofpoint-ORIG-GUID: PbiejMrmvDL54ZAMZn-ZeUjFRmcdI2JR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwNCBTYWx0ZWRfX1f7ovpTD5PGV
 vjjY1gRwqEHzPRRqTbI0w1j4EoyR9hlB/jslQGGc+qjcVRfoO4GH465m3svHGEJWTqBg8NO5FSv
 vI/3RVKep/SSmV4nvVLRYYjIPhYS514=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a88541a cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=zXLAmZJP3ypUEzgl:21 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=a8UEx8NLAAAA:8 a=hKCgGfK2mU0xOqVuEwwA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=Vxmtnl_E_bksehYqCbjh:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-GUID: PbiejMrmvDL54ZAMZn-ZeUjFRmcdI2JR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210104

On Thu, Aug 20, 2026 at 6:44=E2=80=AFAM Greg Ociepka <greg@ferrisoft.com> w=
rote:
>
> Hi,
>
> On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme "Glymur", A=
dreno GPU, chip id 0x44070041) we are hitting an unrecoverable GPU recovery=
 loop that, once triggered, can only be cleared by a full reboot.
>
> Environment:
> - kernel: linux-next next-20260730, plus a handful of local patches for t=
his laptop (USB wakeup-source/dma-coherent DTS, CPU thermal trips, an eDP l=
ink-training retry tweak and a DP debug-print ratelimit); none of them touc=
h the GPU, GMU, GDSC or GPU clock paths
> - Mesa 26.1.5 (freedreno, a8xx)
> - GMU firmware v5.2.38 (qcom/gen80100_gmu.bin) and gen80100_sqe.fw from l=
inux-firmware
> - niri (smithay-based Wayland compositor), ordinary desktop clients
>
> Symptom: a regular client (rotating across sessions: chromium, firefox, X=
wayland, thunderbird) eventually triggers a GPU fault. From that point reco=
very loops at roughly 1 Hz; every iteration logs:
>
>   adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* gpu fault ring 2 fence=
 28f9c status 00880005 gfx_status 00880004
>   adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* BR: status 00880004 rb=
 0002/0078 ib1 0000000000000000/0000 ib2 0000000000000000/0000 ib3 00000000=
00000000/0000
>   adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* BV: status 00880004 rb=
 0000/0078 ib1 0000000000000000/0000 ib2 0000000000000000/0000 ib3 00000000=
00000000/0000
>   msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* =
44070041: hangcheck recover!
>   msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* =
44070041: offending task: <client>
>   adreno 3d00000.gpu: [drm:a8xx_recover [msm]] *ERROR* cx gdsc didn't col=
lapse
>
> Observations across four separate incidents (2026-08-09 to 2026-08-20; lo=
ngest 60+ minutes; worst measured rate 161 recover cycles in 5 minutes):
>
> 1. The reported offending client differs between incidents and can change=
 within a single incident.
> 2. Killing the offending client does not stop the loop. We verified this =
explicitly: after SIGTERM-ing the reported victim the loop continued at an =
unchanged rate within seconds, and the next client that submitted work beca=
me the new "offending task". The corrupted state evidently survives in hard=
ware/firmware rather than in the client.
> 3. The loop never converges on its own; only a full reboot restores the G=
PU. While it runs, the victim's surface stays black and the whole desktop d=
egrades, since every recovery stalls the GPU.
> 4. Onset correlates with many clients creating GPU contexts in parallel, =
e.g. right after a session restore spawns half a dozen applications at once=
.
>
> Since every iteration reports "cx gdsc didn't collapse", the recovery pat=
h apparently never succeeds in power-cycling the GPU, which would explain w=
hy the fault state persists across recovery attempts. Two questions this ra=
ises:
>
> - Is the CX GDSC on Glymur shared with, or kept up by, other consumers (t=
he display path, for instance) so that it cannot collapse while the panel i=
s active - which would make this recovery flow structurally ineffective on =
this SoC?
> - Or does gen8/GMU require a different stop/reset sequence before the col=
lapse is attempted?

Hmm, I've not seen this on glymur slim7x, and I've crashed the GPU
plenty while burning down the remaining clcts/glcts/vkcts issues.  And
certainly not any GPU hangs/crashes in normal desktop usage.  (Vanilla
gnome-shell / fedora f44 here.)

System mesa is 26.1.6, but for testing/debug it has been newer ToT
mesa.  I kinda suspect that the mesa version does not matter, this
sounds more like a power issue.

Fwiw, the kernel I've been using: [1]..  but that doesn't have the a16
dts. I need to move forward to something newer, hopefully I'll get to
that today.  We'll see if I start seeing this issue.  Or maybe
something x2e vs x2ee is different regarding pmic/supplies?

My device doesn't have the highest OPP (1.85ghz), which I think your
device does.  We might be still missing some power related features
that are (more?) needed at higher freq's, or maybe I have a more lucky
piece of silicon?  Akhil would know more about this.  You might try
removing the highest OPP in gpu_opp_table (in glymur.dtsi) to see if
that improves stability?  (Repeat until it is stable if you have the
same issues w/ 1.7ghz.)

BR,
-R

[1] https://gitlab.freedesktop.org/robclark/msm/-/commits/glymur-next?ref_t=
ype=3Dheads

>
> We are happy to test patches, run instrumented builds, and provide full j=
ournals or devcoredumps - the machine reproduces this every couple of days =
under normal desktop use.
>
> Thanks,
> Greg Ociepka
>
