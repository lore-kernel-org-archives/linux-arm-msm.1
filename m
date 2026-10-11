Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA142C0303
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 19:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746828; cv=pass; b=hzf4pTdj24xsHdudKrmXWoLdAFpLGxTrdl5O/Sizq1QgWvXN3MyAlovM+4ZmOr6MudIjA8PxBgP6fDpQPAzSSvnnsl45EDecMGKAef4LeEk/9K9AxIkgn1ICvslsnk0q/v+pgJ2K/sQXAQyoS+Hq7pU7aX4Kg2MGRO/tBy+078s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746828; c=relaxed/simple;
	bh=dFZm0B429+1EMMBzRGEA+XklVFzouiTDcePnsZisvzw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OLQa8NwMSeGgQ8h/f7v/Ibg15x8yzg+ecnw2iZ4eu1HKi2FvnNhaSivR4SQiky//fs324oI9HnhX0YTggBN+gP7hbMiTgtNj4wnWpxXdME9Qg6JYM/ZrK9mDp6S5/DDxyYV2QIIOnCaXc+y+fNUVvZ8DJ6NCydqMvfs1u2lX4XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZlE9biYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qkxz4W3z; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZlE9biYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qkxz4W3z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69BINJp11121500
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 19:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=hx9WS1z5UPv15wgxUK+UOiFQICa1zaBdNIm
	cKXdKysw=; b=ZlE9biYuN5xQv1O7PtXX3oKV7eg2S4n32z6iFnVNVyk3aCDd13A
	cROZdQoRGaaMq3BIEUYWmZT2WpjEqmZAr1GT7s9BlKvRvxV/TEyOy1sl/7xBDjhe
	7b0ezaAUAJEkDllOBGEa/vM3ldiSUqfZwf+EAC75XAivkhzQfQqAdLmaywgif5rl
	+cOTT0vegg5J6BmueLNCwZfHN7NHtwwsaJBDuSPydvYUTgTVMoCMb2ZZezzqqazD
	V2MuyscdlI4jSzp+Gi5T0wlfpLfYyWWWHBlvAayIxQC7h89c0taaOz9PjqyooGwJ
	AVc5CxgQ/CRBO36/tU47+qC2aefmRiUadoA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fc0hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 19:27:05 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-82274137201so2525596a34.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 12:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791746820; cv=none;
        d=google.com; s=arc-20260327;
        b=cG6JKTd+yPM6eXNbVx63pu8w47zkj05XtqfD8hZjKtEsBhGmA25NNKZLnljYoIJ2RY
         NN15GtqORXPPNqgbuDTbiaosia2rP86XhOIFk7B8nfsXglROThigVzK/OjtrbZuO4SjN
         2g+tq+RKwW7lL+l8DDbFCGd58Bb3hbb26XU/AarxZYpiNAIAoe9Ee7VPvnf+SREwK8M+
         mB6ey901QD+sfH7DpGQJNkxfpGFohLc5rUj62anleGhmoMByHHwB0ONTSG5XLHTSuYRm
         Gz8hVts3UmvDIA1nxq4LHdznA+JW8GOF4VCGTULoxrknivsyUAsw0uMi5d5v/iq+gGGb
         LyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=hx9WS1z5UPv15wgxUK+UOiFQICa1zaBdNImcKXdKysw=;
        fh=QB7Jormn5Mugd1YDH+ws209SBxtHe3CtCMSrolpFoo8=;
        b=rH/RwhmN10uB8+ph3x5rg3wKp+DVEKJDJJXyB5ZlcF7fDm67k3JiodRQDKqbU2l1PX
         CEMpRZjj+8JTAY9YIEx83EJ5OrM2IYkoUV1ciESCQGg6/MBTe5YOaZwI33RR/tAg1Vqy
         skB+MJiKj6WwN2Z3ZQo6XTKEdc6lr4Bjjm3dV9fU3oH6uUHr7NGMrBqEIJAHiN65kajt
         sZBubRnmQ1Rpov4YXI9Z0N/nfbupaM6yvf/I1lYI0chsXq/LQYXoJWoLDb9izMYw1czQ
         USirpUTGo/vwq+OCJPTdecve0gakTSVK/8UBzYnG44KBa05ySFR8vuoFLFUI6LlzPDjz
         nGTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791746820; x=1792351620; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hx9WS1z5UPv15wgxUK+UOiFQICa1zaBdNImcKXdKysw=;
        b=Qkxz4W3zwXnxUfhQdeUa29tn0/HX5+3P38xwRFbfdAYtMK6i3sIWbM2L0aOHCW5fEx
         d6AJSldGhpPdeaXzrp4TUFITrp9FlknhcZgQHhmN7Rg+h7MsOnF6YZFvMMwkz2CAyF2B
         gKw0LJ6Dy5sDRqpDQW4KV9dX+6GkaVg10F01W1uiILY/akaFGDEc9E46nCMsM0KWQCV7
         9qSIxdTSoI6kQlKFGbY92sU8Z16zgUprtBhR0hlehPdWlp23xzSwzHs6VV2mbzq2Y9Xl
         04oyZ4sXB0Xe7GPriqpwQ9iWKoeuzhszjvUiOSYI2hCtVD5oRuOJ/YZtjANHJztSNm/F
         DpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746820; x=1792351620;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hx9WS1z5UPv15wgxUK+UOiFQICa1zaBdNImcKXdKysw=;
        b=0zRmm+/dvWgvZcpSuIpUYjd0E5VMm7jo5hn7YuVw+F1wnhP3mE6yITiBp/GaG6j0ls
         Jmb/Rj3NGaDjWvLBqCLXh9jmpSK+mCozGK46Dkw2Fw8xChILga7FEQdgBGI1keHjR9Zw
         hz0UvlGf7/uO3RzAmgxX6s9qLgOf1r6kFfDu+C/P9yVIpOCWpGDWaVyuzR7yztZ2w1zb
         fyFX/T9FvHwhchYf73DSEbO4JT+sXz0l/CqtE9uhjnA3RlIBug2XqwmTEU4PMS3//Blq
         7YNBvRPeKazbSNk2PxzlGql40tq0BPXlSi0PtO8kvIQy1MyAifD+5LG6O2c+R+bIwgSa
         Tguw==
X-Gm-Message-State: AFq9FYI96G3JuwPjTE+0hhEQJ+yokny8RapG3CsAcAcnidlZd14Oad0C
	Lh2Yt4tbZe0U111fJSJZsLrFIhln0O/f7NXb7ouyLgN0y9DvlZvyl3NywfkI8Fr5EIOY8FgIVXO
	YDVQiHy1kx45Rgfcve7K8smA98rjeVTcLLlra2Kv+KV1qVQsqmKwyoo+kThoUD/hxJFKs4JfGTq
	wU6MOjvFV1H4xX3lxUWSn84jYs95WyAc2vqDshNNRgB4c=
X-Gm-Gg: AYBFou0XKF3VWMKUfix8nblXn0YQUVDv82qGcreFbljuhqr8F15Mk//X2bhcq2KwZWX
	rp0hdt4r26aQsrG7jj9hImgOeFLlf+uPWbWI5Rl1rMrHkJFWgfrJKUZ+5UxljwuKfABbeT1eYBM
	VKidcssVeqFXyLEW3iz8l1L8FAHRg+M2xzsPZ0UtSKmaD0MOP95aMPP3Ha+g==
X-Received: by 2002:a05:6820:a28c:20b0:6f5:6ba1:aeff with SMTP id 006d021491bc7-6f56ba1b18amr655431eaf.37.1791746820006;
        Sun, 11 Oct 2026 12:27:00 -0700 (PDT)
X-Received: by 2002:a05:6820:a28c:20b0:6f5:6ba1:aeff with SMTP id
 006d021491bc7-6f56ba1b18amr655423eaf.37.1791746819486; Sun, 11 Oct 2026
 12:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 12:26:48 -0700
X-Gm-Features: AclHuK-wXtAQszxLAiJzWStuKUtS-jSj0vu8__CELnWePjfHAgcPQ7n0ultvhNY
Message-ID: <CACSVV02V-FOzGj71G0ZL7khkYEKWFW4q4biOZR8B8vyWy20PdQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2026-10-11 for v7.4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3NyBTYWx0ZWRfX9mfYjzxIH6VC
 KXvHzK56ml2q79TRvr+b2NDC79jlRdmYyRywmHw6sbebjEwd6OMZh+t1SrNksnIn+/JL6s8XcAV
 pwfC50dsZgVpfWUB49ZVK3hD/D3V2pQ=
X-Proofpoint-GUID: l4weusC_F8dDhIfol0zuDpm7eOZHjAGT
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acbe30a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8 a=gcM9zsgL9M5nzF_IVqQA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3NyBTYWx0ZWRfXyRFZmqzX6daV
 G0taNwevhuZETnd/zjcVo6XFOtDymYt35mLRoUNFrMHCDAUz8WV6jl2qHubsjoP6MABqvKx/F+d
 NXzNWbmdbXXU0k54vlyLETFPi6qqIEpZRCOOuloyXYC/MylDKAnbUJW0svHIx+L5kfmw5Byu2TJ
 yCle6kjP5HJrY6oS3p9qUi/yQe7mTxCWC6S3GFYxe5UA3b79Qs+VPDVB2LDXGEQ8uJocRY7OwWr
 ySUXzFnJraniaxnQ9vCUSYvSAAia0pc+CB8s4nw2OQf2m1g93prrLGL06ZHuxv7wbiodg0idteu
 N1gVU6IuJbo0iCeWNaShpzj+9YJRruZP7brBcMx8nMiRzpl+TSVm2rZ584ovrMP2hFS1XeJmwLx
 Zy/zIM9dgj1bBjlPswvcNZp0UudcIslTTMR7VjH20gFAr13/XFkCpt3W8dOsXoflPeToaN40IkE
 KX4ooNcF8eUqQrgH+rw==
X-Proofpoint-ORIG-GUID: l4weusC_F8dDhIfol0zuDpm7eOZHjAGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110077

Hi Dave, Simona,

Pull request for v7.4, as described below.

The following changes since commit d33622598496c8994c35ba0a8a913de064dfc1a4:

  Merge tag 'qcom-drivers-for-7.4' into
msm-next-merge-qcom-drivers-for-7.4 (2026-09-26 07:53:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2026-10-11

for you to fetch changes up to d024361c631b3f020a26c07d683e5103404b0fbf:

  drm/msm/a6xx: Split out a7xx/a8xx device tables (2026-10-10 15:00:45 -0700)

----------------------------------------------------------------
Changes for v7.4

CI:
- Dropped sc7180 trogdor lazor from the CI

Core:
- Fixed msm_ioremap for resources without a name
- Changed msm.separate_gpu_kms to default to auto selection

GPU:
- Enable CLX (Current Limit eXtension) for gen8 to avoid
  exceeding limits on CX/GX rails
- New GPUs: a830 (Pakala), a845 (Maili), a850 (Hawi),
  x2-85 (Mahua)
- Fix VBIF halt mask on a306, which was preventing runpm
  suspend
- Enable THP support for GEM buffers
- Add modparam to disable waiting on fences in shrinker
- Drop use of drm_prime_sg_to_page_array()
- a5xx: don't read the GPMU registers on GPUs without a GPMU
- a2xx/a3xx/a5xx: hangcheck progress detection
- a6xx: gmuwrapper runpm fix
- Calculate reported GMEM size based on active slices
- Split a6xx/a7xx/a8xx catalog

DP:
- Picked up some preparation patches for the MST support
- Fixed reported status of the link training

DPU:
- Fixed CRTC bandwidth computation
- Fixed DSC programming
- Fixed encoder disablement path

DSI:
- Fixed VM leak in error path
- Indention fix

MDP5:
- Added MSM8952 configuration
- Dropped incorrect cursor pipe on MSM8976/56

HDMI:
- Small fixes

Notes:
- Merged qcom-drivers-for-7.4 to pick up UBWC_7_0 support
  (needed for Hawi/Maili) which in turn depended on
  qcom-arm64-for-7.4

----------------------------------------------------------------
Abhinav Kumar (3):
      drm/msm/dp: move link-level teardown from display_disable to
display_unprepare
      drm/msm/dp: introduce stream_id for each DP panel
      drm/msm/dp: add support for programming p1/p2/p3 register blocks

Akhil P Oommen (12):
      drm/msm/a6xx: Add HFI support for CLX feature
      drm/msm/a6xx: Enable CLX feature on A840
      drm/msm/a8xx: Enable CLX feature on Adreno X2-85
      drm/msm/a6xx: Honor perfmode_bw threshold on A8x
      drm/msm/a6xx: Fix secondary rail vote in ARC votes
      drm/msm/a6xx: Fix RPMH dependency votes
      drm/msm/a6xx: Factor out RPMh arc-vote helpers
      drm/msm/a6xx: Add BX rail support to GMU dependency votes
      drm/msm/a6xx: Clamp MX dependency vote
      drm/msm/a8xx: Add Adreno 850 support
      drm/msm/a6xx: Send THINMEM config to GMU for A850
      dt-bindings: display/msm: Document A850 GPU and GMU

Bhaskar Reddy Valluru (2):
      drm/msm/a8xx: Add Adreno 845 support
      dt-bindings: display/msm: Document A845 GPU and GMU

Dmitry Baryshkov (5):
      drm/msm/mdp5: drop cursor pipe for msm8x76
      drm/msm/a5xx: don't read the GPMU registers on GPUs without a GPMU
      drm/msm/a2xx: Add hangcheck progress detection
      drm/msm/a3xx: Add hangcheck progress detection
      drm/msm/a5xx: Add hangcheck progress detection

Jie Zhang (5):
      drm/msm/a8xx: Add support for Adreno 830 GPU
      dt-bindings: display/msm: Document Adreno 830 GPU/GMU
      dt-bindings: display/msm/gmu: Fix Glymur's compatible
      drm/msm/a8xx: Add Mahua GPU support
      dt-bindings: display/msm: gpu: Document Mahua GPU/GMU

Joonhoe Kim (3):
      drm/msm/dpu: disable the slave encoder before the master
      drm/msm/dpu: compute the CRTC bandwidth from the state being checked
      drm/msm/dpu: round up the compressed INTF width

Krzysztof Kozlowski (7):
      drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
      drm/msm/hdmi: Handle msm_hdmi_power_on() errors during
.atomic_pre_enable()
      drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable
      drm/msm/hdmi_bridge: Drop redundant initialization in
msm_hdmi_bridge_init()
      drm/msm: Properly handle msm_ioremap() without name
      drm/msm/dsi: Fix indentation of if block in dsi_mgr_bridge_mode_valid()
      dt-bindings: display/msm: hdmi: Correct name of disallowed supplies

Mahadevan P (1):
      drm/msm: default separate_gpu_kms to auto selection

Muzaffer Kadir (2):
      dt-bindings: display/msm: qcom, mdp5: Add MSM8952 compatible
      drm: msm: mdp5: Add MDP5 configuration for MSM8952

Oleg Keri (1):
      drm/msm/dp: don't report link training success after a reinit

Rahul Pon (1):
      drm/msm/a8xx: report the GMEM size of the active slices

Rob Clark (14):
      drm/msm: Enable THP for GEM buffers
      drm/msm/gem: Add modparam to disable shrinker blocking
      drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
      drm/msm: Sync registers from mesa
      drm/msm/gem: Add helper to check if resident
      drm/msm/gem: Mmap imported dma-bufs via the exporter
      drm/msm/gem: Use get_pages() directly in vmap path
      drm/msm/gem: Stop exposing a page array
      drm/msm/gem: Stop calling get_pages() for imported dma-bufs
      drm/msm/gem: Drop use of drm_prime_sg_to_page_array()
      Revert "dt-bindings: display/msm: Document A845 GPU and GMU"
      Revert "dt-bindings: display/msm: Document A850 GPU and GMU"
      drm/msm/a6xx: Move a702/a704 to a6xx list
      drm/msm/a6xx: Split out a7xx/a8xx device tables

Roman Demidov (2):
      drm/msm/a6xx: fix use-after-free of OPP in a6xx_pm_resume
      drm/msm/a6xx: check pm_runtime_resume_and_get during resume

Sam Day (1):
      drm/msm/a3xx: fix VBIF halt mask for A306/A306A

Vignesh Raman (1):
      drm/ci: Remove sc7180-trogdor-lazor-limozeen job

Wentao Liang (2):
      drm/msm: Fix vm_bo use-after-free in with_vm_locks()
      drm/msm/dsi: Fix VM leak in dsi_tx_buf_alloc_6g()

Xilin Wu (2):
      drm/msm/dp: Serialize HPD state updates
      drm/msm/dp: Initialize the debugfs connector pointer

Yongxing Mou (4):
      drm/msm/dp: Pass panel to msm_dp_ctrl_config_msa()
      drm/msm/dp: drop redundant config_ctrl_link() from msm_dp_ctrl_on_stream()
      drm/msm/dp: add MST stream register definitions
      drm/msm/dp: add stream-aware link register accessors

 .../devicetree/bindings/display/msm/gmu.yaml       |    8 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |    3 +
 .../devicetree/bindings/display/msm/hdmi.yaml      |    4 +-
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |    1 +
 drivers/gpu/drm/ci/build.sh                        |    1 -
 drivers/gpu/drm/ci/test.yml                        |   10 -
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   22 -
 .../msm-sc7180-trogdor-lazor-limozeen-flakes.txt   |   20 -
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |   30 -
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   18 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   30 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   76 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 1440 +--------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  231 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   42 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   17 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   96 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |    1 +
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c          |  502 ++++++
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c          | 1846 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   21 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   14 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   81 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  164 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    8 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                  |    1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  115 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  193 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   17 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   56 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    2 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   34 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   16 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   89 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    6 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  107 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   10 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |    9 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |    9 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |    8 +-
 drivers/gpu/drm/msm/msm_io_utils.c                 |    6 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   15 +
 drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |   25 +-
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |   17 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   89 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |   41 +-
 57 files changed, 3771 insertions(+), 1864 deletions(-)
 delete mode 100644
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
 delete mode 100644
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
 delete mode 100644
drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_catalog.c
