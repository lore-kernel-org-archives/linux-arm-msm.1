Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09A44E02C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232279; cv=pass; b=uZmFQzMwmc4UKlpno1Q1uoxM7LHyurXpoE8cOzn0YijxMUsHxpUntRk5ZfoTHgsRi7rM17kDdHK/4nxuaDZhpbP38nqpQrJfki65Tb712GZXHP1DPk2jVja6NiJVuFGapyy7ZYI1M628nuAv3CaM27mxFznff5vCFAgbp63vRcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232279; c=relaxed/simple;
	bh=vFElHb5Rq3DIoUYIeT1l8rLK3VuMddWieS7V/8mCUiI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=f568CQO5IGgSroH+CZD7zmWcj8nK3RRGpEcQmUdyyjT5kaYSOdaAqkKDv7CmszzNSrLKGIXrUn8dA/wojswd7TC3AnC082rjJzV4S0X13GGpUzggdScfuZRpb1c/1GA4X9bQTNYSelo1gvWUunWAjhdaXtXPZbmYFMpN1z1mxpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+vJvRi8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFQIU/ZP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+vJvRi8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFQIU/ZP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PEeQ2465436
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 13:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=RvpLiPc2wHlGh/SWBZPyn8zXSSvK4L6cVmw
	wpxvtQ34=; b=S+vJvRi8jzCqEZmnnbCfkurgHCL4UMnKc8JEisJFQszWI+pk2uG
	cwB/okdy9MqEKSJTqidBPwJfLevIxi7kIZBZj0qn8qPdhyEAgnRXva/zfo2XfVFA
	AFfxeBzYhThunOtdSfbE4pWHlv44T2poJmmD08CliwxWFi8u8swXBmfCxpdhwXR4
	JDTKapfRu0KtBlRgq5DEsFVRf3uG5PdfWI3dJilczRhpuc/uf9L/MdOCarhfGzBi
	Coi4FVN6D347KhlxU6yHc2G6HY7NpnbAHD39dwYC/NcD3KToww8gJpRe9M3wFBBJ
	tV3Sb0bFpDtfQa6ldmNlCgt2ImXQUmcCk4A==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29h3p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 13:24:35 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-44aeefa1a30so3133757fac.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 06:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787232275; cv=none;
        d=google.com; s=arc-20260327;
        b=lmw5Ix+0AFotmtbYOVGZ361uRm/m4D7oJ15QcmcpjcihI/Fp4uFXKcBuKikj3JwR/k
         nGHQ+a0BtrnnnMsfRSz3lPmL1Zq8lJ6EDcbXX9/bYv4c5JlldHs7J0hxKrykyAIMtocm
         efQGftzRyJ52HlOATsSLDaG/AZRVSeEpRUet7ryGsYVg/OUTlTmUL1Hlr8LahH0Hiy8v
         EDaLDRUaUzH+XtD0FEsK9aIBqxIjiMHmaPYfwFimeL881wKL24UmbSQCH2HPXr6aMzKH
         28PyyJqPdbOimA7iiGW7OzD2rPSBDLwsVi/OFl+caaAdbNL9RiixQ0jKL2cqO3AnDjKw
         oyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=RvpLiPc2wHlGh/SWBZPyn8zXSSvK4L6cVmwwpxvtQ34=;
        fh=cC5ytP8nkF/DXuA3Dd1zxeYT6591jNQpDT793q0GGL0=;
        b=dRPACsSmaRTgVkv/2zu4/FflFHdRHXDHH0J7JwRnW7pu0EKdkzo8mecUADih90qdk9
         v1h0OLOffVh+KiCIz81CU5ODaS1o2HzAU3SDs8SAutoPPkqfXPfg82ZXv9VuLIxMH3pA
         3ppwiPMrOR5TSH1dWam7wYZ0XBWwRGZUpnJNWm67iFEGcD+u3GPBeS4aIgon0TJsQPz4
         t2POd7COECLk5c4GEVe6cJcXPWEDvUq7X/0MT6ZfUqJeR1Di1IG8tsH3Box4EqmQEyAg
         aC4D2ADC1e3Oxe+9SecmdEt1kK/c13iqZjkI+pxEeVh8ddf8P+ZybJrwTxZJ/eT3Hddx
         ChfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787232275; x=1787837075; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvpLiPc2wHlGh/SWBZPyn8zXSSvK4L6cVmwwpxvtQ34=;
        b=YFQIU/ZPDkdaHCbJw9Xl6obukh/k+GEeSwATeD/fKKqmbsy+70q5wph9nTquaV4cDM
         Cw5bm96AeC6ejfp0g4t6Wly1vYfuiPsVINABn0JWFJnjOvOg4b84buT67FuuzK9aUgOM
         vwcei4Xhy1yewFZilySOxts0OgjeMWmcSJzzyUtdayotyQKi5scNqeGosw3r0KZHBQ86
         yitvMyiuL7eDeftaZsOG5w0keAJt9+jBV9nxV8M8wcGW5vp4ru61q+9Et7Vw6UQQtXOE
         GeDv3ZYb6xOd/U9v1kMI7aA3QLzXry95uNfgfLlafwIBYZtqzo4iY4Lh25XgGBSBpw3r
         sVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787232275; x=1787837075;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvpLiPc2wHlGh/SWBZPyn8zXSSvK4L6cVmwwpxvtQ34=;
        b=qldC02ocIqqMFHxzNv9UBXIu1jxZgIcqnbuFVvfQMIILiFLTwvqpQGBubAEZk6P+oM
         fx9vPSd0mCR/74vy/Awpr70gJLl8gK5Yr6oF5oU11eP/M338WiTvqizvoHlfxyaB79hK
         pv6qm31DRVoV7F3aciHLx5cynJNEXtQtjOzHq4h8evtFg0lwB7WthYn0GRtBFZESGPGr
         MDLHD0FkODah63vIj59hu/1ymeao41vvw17yQlux8V4bwaFmS/oY/OEpPfEcQJN2KOOt
         nfpNL7NE9JTKhAOCiDkZLSx+FWUp6FAnWpyNHIZNPnsHxbV40a5bVrVUgCZFNP/fHcYl
         rrxQ==
X-Gm-Message-State: AOJu0Ywwb3qeuK7DVK13hEFwezpPC76Pbgu1D0tHBhwaXwMHyLw1uS9M
	hKnw63Kj15X1bI7yOIW4IUBttpNeZr8vUUPevybU3gIruIi4cG1+sb0KVvhp1dCTyNmrVJoilBs
	EoOG+1FydH1ENjdq9lkjYbFSKftYtPrJGbVH9gET3YIoEiC3j39bsg5gIowkJpRt9Dli3ruprzs
	z7aJUQ45c1hnulhh54XsUYB0/0tjO/IgMWeRh2PksBXgJP6u1AhFbkzA==
X-Gm-Gg: AR+sD13laPG1gDVQwsqK+2TnO0Gqkfx1bATPdOq7KS4f6KDqy14Ea0olEvpoo/oNYEw
	MR0iQ8NDowFkDWGAF+vYZ7353QSpW88Ved3fAJLfDof74US9Qjhbncyk0t750pkrlC+o9YsgfZY
	DEQXA/4o+5k96bC86CiB3+6J8B58QJtng7t1KhzvdHSXjp2hIFcsxRaLps
X-Received: by 2002:a05:6870:8261:b0:441:f3f6:622b with SMTP id 586e51a60fabf-462f637e5bbmr12743407fac.5.1787232274798;
        Thu, 20 Aug 2026 06:24:34 -0700 (PDT)
X-Received: by 2002:a05:6870:8261:b0:441:f3f6:622b with SMTP id
 586e51a60fabf-462f637e5bbmr12743335fac.5.1787232274218; Thu, 20 Aug 2026
 06:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 06:24:23 -0700
X-Gm-Features: AcwNN1U20ZuM0i8qBrFIYpMXIcV1fWkS0CwyIDx4euntVqWYn83XRIbIP5C_tZE
Message-ID: <CACSVV02Kp=J+w_RjEJbBbQnBYRb+SWdwMvVbCaAL70bq9EBagQ@mail.gmail.com>
Subject: [RESEND pull] drm/msm: drm-msm-next-2026-08-01 for v7.3
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: nkOcvFZ7RvH7Ynuok3LcRi2dj_YLzGJn
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a870013 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8 a=ghuELz35WMKWYDI3F1sA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwMCBTYWx0ZWRfXzwtkhGHqLhV2
 9lY5fT9C02jo4d2Hu30J29GGvvs2USIrAc1HJbSFQ5/n0usDON31WIw3pX8E3GHC9pAkrFSuWQ8
 a/RxltnewnfSJOjzlljhM95yPh9BfppP9sDJea/4xEDcinU9LAq0kzM2huLepPHqBrDr9aj2oZX
 uxvU+txfGnIYKHsTM5hT2zG7xsK/Si3FNv73Xm8Z5ChJcx8dv0XRxwSVqyQ54Nqx2eclX6zRRxT
 ZbewUSbDKhGwaMKRIQyF8+EeHhtGB4s0edJ9e3MSHgn2ApZpl2JsU8YcQZOUjDqoXuzobVMyrPu
 U2K7baqa8EnDtaGa6hWEsHGcWx8jQuiHXkgqEan5oD9ZOeNcO4uiGzR8cPcGBIxmnObZ+AG7Fni
 oINPF6FfZjqabjTQU9TDvJIBluszOvc7BCiRXQf1EtXtXj7Ot7WuXFv5l10nSOo36vexZwfrLnE
 kObK21rxAwOk8laMHlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwMCBTYWx0ZWRfX5BuMNH1v1NxC
 diPPpL8HGZkXOauVJIZkt9cG9MAv+/SA32QKsPSoKCErXBJrudCtLKEy5Um7woNUCIXAn5U9cT/
 wDpbVAkxRKKj8ELWl922I9WgGn/rfZI=
X-Proofpoint-GUID: nkOcvFZ7RvH7Ynuok3LcRi2dj_YLzGJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200100

Hi Dave, Simona,

Somehow my pull req for 7.3 disappeared into the either so resending.

Pull for v7.3 as described below.

The following changes since commit a1c81cb05273077219fa809424330fdaa4346d5b:

  Merge tag 'drm-intel-gt-next-2026-07-16' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2026-07-17 11:48:25 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2026-08-01

for you to fetch changes up to 140b13475302601368c0cf4e193e66126a49feb3:

  drm/msm: detach the ARM DMA mapping before attaching our own domain
(2026-07-31 17:08:01 +0300)

----------------------------------------------------------------
Changes for v7.3

Bindings:
- Added Shikra support
- Document a840, a704, a722

Core:
- Use drm_client buffers for fbdev emulation
- teardown fixes
- ARM32 DMA fixup
- Remove objects from evict list when re-validated
- Bunch of corner case and error path fixes

DPU:
- Dropped dev_pm_opp_set_rate(0) preventing burnout
- Fixed SSPP offsets of Kaanapali

DP:
- Dropped dev_pm_opp_set_rate(0) preventing burnout
- Cleaned up core code in preparation for MST support
- Fixed prepare() to let Pipewire continue in case of the unplugged cable

GPU:
- Add support for a704
- Add support for a722

HDMI:
- Simplifed register access

----------------------------------------------------------------
Abhinav Kumar (5):
      drm/msm/dp: break up dp_display_enable into two parts
      drm/msm/dp: re-arrange dp_display_disable() into functional parts
      drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
      drm/msm/dp: split dp_ctrl_off() into stream and link parts
      drm/msm/dp: make bridge helpers use dp_display to allow re-use

Aditya Sherawat (2):
      drm/msm/adreno: Add support for A704 GPU
      dt-bindings: display/msm/gpu: Add support for A704 GPU

Akhil P Oommen (3):
      dt-bindings: display/msm: gpu: Document Adreno 840
      drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant register
      dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC

Alexandre MINETTE (1):
      drm/msm/a3xx: Drain VBIF before GPU suspend

Anna Maniscalco (1):
      drm/msm: remove objects from evit list after pinning them

Bibek Kumar Patro (1):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC

Dan Carpenter (1):
      drm/msm/adreno: fix use after free on error path in a6xx_gpu_init()

Dmitry Baryshkov (5):
      Revert "drm/msm: dsi: fix PLL init in bonded mode"
      drm/msm: don't tear down KMS twice when KMS init fails
      drm/msm/dp: reject YUV420-only modes without VSC SDP support
      drm/msm/dp: do not reject wide-bus modes while a YUV420 mode is active
      drm/msm: detach the ARM DMA mapping before attaching our own domain

Hans de Goede (1):
      drm/msm: Fix stale comments in uapi/drm/msm_drm.h

Jens Glathe (1):
      drm/msm/dp: add missing drm_edid_connector_update() before
add_modes on cached EDID

Jie Zhang (5):
      drm/msm: Recover HW before retire hung submit
      drm/msm/a6xx: Fix A663 GPUCC register list for state capture
      drm/msm/a6xx: Fix A621 GPUCC register list for state capture
      drm/msm/a6xx: Fix IRQ storm during msm_recovery test
      drm/msm: Fix task_struct reference leak in recover_worker

Kavan Smith (1):
      drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value

Konrad Dybcio (3):
      drm/msm/dpu: Drop sneaky dev_pm_opp_set_rate(0)
      drm/msm/dp: Drop dev_pm_opp_set_rate(0)
      drm/msm/dsi: Drop dev_pm_opp_set_rate(0)

Krzysztof Kozlowski (2):
      drm/msm/hdmi_bridge: Simplify register bit updates
      drm/msm/hdmi_hdcp: Simplify register bit updates

Kumar Anurag (1):
      drm/msm/dp: return 0 from audio_prepare when cable is disconnected

Nabige Aala (1):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS

Puranam V G Tejaswi (3):
      drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in a730_hwcg
      drm/msm/a6xx: Add Adreno 722 support
      dt-bindings: display/msm: Document Adreno 722 GPU and GMU

Rob Clark (18):
      Merge remote-tracking branch 'drm/drm-next' into msm-next-backmerge
      drm/msm: Fix barriers accessing ctx vm
      drm/msm: Rework queuelock
      drm/msm: Synchronize VM creation on ctxlock
      drm/msm: Synchronize set_sysprof on ctxlock
      drm/msm: Move nr_cmds initialization
      drm/msm: Remove redundant SIZE_MAX check
      drm/msm/a6xx: Access VM directly in submit path
      drm/msm: Add helper to check for per-process pgtables VM
      drm/msm/gem: Fix dma_buf import error paths
      drm/msm/gem: Remove useless locking in GEM import
      drm/msm/gem: Extract bookkeeping init helper
      drm/msm/gem: Set resv before exposing obj
      drm/msm/gem: Validate lazy VM in GEM_NEW
      drm/msm: Allow lazy VM creation to fail
      drm/msm: Don't fallback to shared VM for VM_BIND
      drm/msm: Fix per-process-pgtables check
      drm/msm: Fixup invalid overflow check

Rosen Penev (1):
      drm/msm/dpu: fix parameter name in
dpu_core_perf_adjusted_mode_clk kernel-doc

Ruoyu Wang (1):
      drm/msm: Only fini scheduler after successful init

Shivam Rawat (1):
      drm/msm/a6xx: Fix stale rpmh votes after suspend

Thomas Zimmermann (6):
      drm/msm: Do not declare msm_framebuffer_init() as static
      drm/msm: fbdev: Inline msm_alloc_stolen_fb()
      drm/msm: fbdev: Fix error reporting
      drm/msm: fbdev: Calculate buffer geometry with format helpers
      drm/msm: fbdev: Use a DRM client buffer
      drm/msm: Make msm_framebuffer_init() an internal interface again

Yongxing Mou (10):
      drm/msm/dpu: Fix DMA SSPP REC block offsets on DPU v13
      drm/msm/dp: remove cached drm_edid from panel
      drm/msm/dp: drop deprecated .mode_set() and use .atomic_pre_enable
      drm/msm/dp: move mode setup into msm_dp_panel_init_panel_info()
      drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and
stream parts
      drm/msm/dp: extract MISC1_MISC0 configuration into a separate function
      drm/msm/dp: split link setup from source params
      drm/msm/dp: move the pixel clock control to its own API
      drm/msm/dp: simplify link and clock disable sequence
      drm/msm/dp: pass panel to display enable/disable helpers

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |   6 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |  19 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   4 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  36 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   5 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  40 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  24 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  14 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  86 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   7 +-
 .../gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h | 428 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  17 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  12 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  24 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  11 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |   4 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 395 ++++++++++---------
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  30 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 311 +++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h                |   9 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  52 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |  12 -
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  75 +---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  17 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  18 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  19 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  98 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c               |  85 ++--
 drivers/gpu/drm/msm/msm_drv.c                      |  26 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  17 -
 drivers/gpu/drm/msm/msm_fb.c                       |  98 ++---
 drivers/gpu/drm/msm/msm_fbdev.c                    |  86 +++--
 drivers/gpu/drm/msm/msm_gem.c                      |  94 +++--
 drivers/gpu/drm/msm/msm_gem.h                      |   5 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  31 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  14 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  10 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   4 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |  22 ++
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   7 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   1 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |  24 +-
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |   2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   2 +-
 include/uapi/drm/msm_drm.h                         |   6 +-
 57 files changed, 1553 insertions(+), 825 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h
