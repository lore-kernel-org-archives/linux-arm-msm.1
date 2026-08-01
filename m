Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6FD30566C
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785608479; cv=pass; b=WUuUFy3lywLhd/mggHjCKH9qaDPM09LF0tnhm1XYvXVtkxugiRqe1zmprYhS92ZbjookMv38+lwUPoxZXaE7op5K01+c2ipPrUelUdTi0WAKwaXUl0heXGW1a5/zcIG8Y1qYJPv+UsI5RoXdLs7JVB9neSkp8o3QyUBaEoJbX40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785608479; c=relaxed/simple;
	bh=strnjG2xA0ojFF/9kz3VPhy3PfO/jquMpDnbDkY7bf8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CIjJjNXmQCtI7diR5I04L9euXLIfZJyJ0DVm/sRYZ48qqutVFY47K+JnHnQ3U4dz5NWIsAIvG403+/+5FWvwdid//OrzoZZUDM6T/UHnjGp/GcmuWWLRcbQzMN1L3loVgY54qityQUAxWWWJWQW8yOrrPz71HO1gunQS+2QPtbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBbJuUWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKU7t6UG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBbJuUWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKU7t6UG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671Fawao3317351
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 18:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=quM45oRV1E0D0EZHxomja/jcIXyUYHi8Tfm
	52Stde1Q=; b=CBbJuUWuqBwPEViutLwXjqZweygrBwEzPvMME1Gno78FDS5Oe8F
	BIyW5UFnMmdS3gkWpfZZ1fyDk52gpLDK1jX7URyaD9NwFp5kT3+RuUIhJg+zEFLX
	+0GnxHuQ9qWckORBdpsnFbku85yivoPpyjv2BYWdYjt2Pp9+4TFYofgWlj3eir//
	t3r5tiUob42/gthKmfok7g/zoYUpe1YVVXSVZ90z+I19LAOs0JPpE8pV1q+xA972
	8Mq/YgAh5PvI2ftdgcdBPEsZzdVOLEAyMdcaPKbK4URgJQHJizNu7CvDOZFkqlMr
	4AJSuNeDnICOmCo0e+I37L21hwKEqtc47Rg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u99fd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 18:21:16 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448d5182870so2419346fac.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 11:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785608476; cv=none;
        d=google.com; s=arc-20260327;
        b=KFVQagO5PECOfewEVprxtL3ym9OUMe8Q5UAfF4flGBORsBCB+PSCTOKJFfmVD8N/Gn
         6be7DLU/KPWjvB6wz7PVNCO8YYsQIGAm8RpeibKEXIftZiyzRnaCU5CK4XAyYNxh0Fse
         C85RNWNvo1wuY1Zvzw/OvXKvatuo/NhKi+9HANVtw58slSwhi4shas8iiIvCmpXPybmq
         RN5knx5iJcurgiJ5zd2hDfSr9gfzfiJKoMEHjPErw+86dSEfpClReJnP3/sDWP02/2tP
         NZutJPgTlXiRlnvlb7cHcu14Ig1KTaqT2QbteTU4WPLUlSxAAiSQeMlrCGoLOE/NFuwZ
         ISNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=quM45oRV1E0D0EZHxomja/jcIXyUYHi8Tfm52Stde1Q=;
        fh=rWzlJZQANRlF5hJcQHUlHL/B7gjRk8Qj30j91WDrBPw=;
        b=ODirnm3jRkS0BtslSTCMoPtAjhhPT/kgBtIOZt7QlLEIfiUB47a3sbYFv9zFFOorrP
         ZZ189FahCFic5SYgN0NtK6hdyst+k4uT4WJxJ8t4tREktzCqxi16agZHnQWOEORnOoXD
         oaMk+I8Gr5r0fFL+SAGlSJvLoawt1ZzOsoQawhGv5drLXUihK47vlq2slcvcoTzm1FXj
         eK2p4WD2x2hjAoEHoNiFzpSplo5VzehPgphKJiKp/HJQFCddsB/rBE557xuEclkG+4t8
         oBiVOL5QEBtYMJWzwJUQky4XZqcvwSHgyTXjNILGfzxru8LmSIj422XDIeBrfkigg+IV
         +R6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785608476; x=1786213276; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quM45oRV1E0D0EZHxomja/jcIXyUYHi8Tfm52Stde1Q=;
        b=BKU7t6UGNazVTB5NaNGqOQ4hD1UFXIwT8DEaXDLyf7c5xdLvx3OKv4BVXJrzRcHbEF
         zHIVN4svuRgxgguVWTuo1V0NLYTZV0ZOCyDeTAbpXPC6YTsk6c1tpLbnR9wmWLHj//6c
         yNUCc7PV4cb2K+j1Brxl4/X0K1XMrgiT9c+O9zG31411LTI230/TttWJxxmk4I25lG6K
         BrDQ5hDWLJK+Z4Jpy66vbw0ukNYCH5XyKawUV4M2uVnzbEkgjU0u4Oq5nbN1JhokdBDf
         A+02iKb++8Hr9BDIh+I5XEnBNHmtkbcZOxn52yd5VPvaSnTDfDPEC7evahxEK+pw2dvc
         YRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785608476; x=1786213276;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quM45oRV1E0D0EZHxomja/jcIXyUYHi8Tfm52Stde1Q=;
        b=T1M5qwa61zzNc5/eKOIwi0rNOAsNZm9iU5JL69X5bRb4QugWk7BdM4Jv9IlJPrLI5R
         49+5TLyn12QMsIqUYnv08w8F1bR3GgKOpQvTcpGEvkVLgSosbqaLdI6qbYT5M8AYboEo
         RSIkhu5TDOdeDV2PZfp3NNWtI/6VWhTVwm5IvwS5oywfMyszqhwcfyhyRiHjQNQNFv1/
         ARIEUJxOKDncGMu47gxiOKNBA93jNcVaT/G4YZHmEVFSDKMpZkf0KMipQY6HD6viMhol
         pZEGhrakJQ03Tk7b8Qx60dfrjhEdDdT+1LXNQR+dc+uSJmlfpj2eikBlHJhBJIZr74Xm
         ASsg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2dSPZCK0qNHQW2m89TNw02ixBBpq+GUknneGM6dDNshv8d2mYRIbvQWz84Sk3bxT0XDVcMj0mBOmfSp6p@vger.kernel.org
X-Gm-Message-State: AOJu0YxpxQksi+hBOjQN8kfxblYQjscZ1/FsOAb+/Xx74OH8W88VH7b9
	FtTc4+3N2uzpyWLfHooOzcaWNrJ5fPusahhLjQ/O2ekKdBW7flg0YkTDF8jmI9ddhSZwiN/7bY0
	zab6fDlxGisKZVPG2Jdu8GoEyiCRuoRn9JpROXAeL5tIVOWQySNV1iL8nLwOiknpMsqiRDCoFic
	7zyp9ABYJF9SKcSQBGWE5+K2Pkpw7pQbypvohZFCWqdvL6OdJ2ikFnMg==
X-Gm-Gg: AR+sD12DkRBsevYsHqkRqCUREullTpLJ87iWZHs5iOJUh9t9q1hxMqMibNWW4J5biIn
	EN1IHpOb4op+D/34ZNOnb8C9B/lyjJZdd/CHmwYaxMH61NjKcOV6se6Rk7jQGSJNJK5K5Z9x7Lh
	7oXuDyky1gLLRKq26ukkGHwz0m3qxKlPD90fK7LMc/9kcWaqTvb/UqSAnL
X-Received: by 2002:a05:6871:289:b0:448:c1f5:90f7 with SMTP id 586e51a60fabf-45905d8a225mr7766338fac.19.1785608475789;
        Sat, 01 Aug 2026 11:21:15 -0700 (PDT)
X-Received: by 2002:a05:6871:289:b0:448:c1f5:90f7 with SMTP id
 586e51a60fabf-45905d8a225mr7766321fac.19.1785608475263; Sat, 01 Aug 2026
 11:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 11:21:04 -0700
X-Gm-Features: AUfX_mxTQiCLwp1y0wPs9jZKarneeilUr564IQmRuzBYnYufSwg8tO68YnIKdrU
Message-ID: <CACSVV00Qo3Ercwm5NOcDtifB8JV36No7zQnShNZSj=OBfW=9cg@mail.gmail.com>
Subject: drm/msm: drm-msm-next-2026-08-01 for v7.3
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 5vWFgR5h-upf_pzRrNTtxrEKwBmggClq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0OCBTYWx0ZWRfXyG2xUKU2+TDH
 hIV6izoKV97koyuey6Giji2aV4A+bgnbeuA8m9NRpymBmFSnlZf9fbxe0l77r1YRf04MOFrtjU+
 VMTOdQzhP+yMLATSSlunHubk3tMrPRFQCJxdusDjomD6L8z0RKxSAh+AgPf4pZUr5PREijSWLTz
 XophqUTA6KWWhLNf8BDTkZ8PBojjZ7aY03Cw7MrMeoKBOVDR4Emm0imWMQSCz56C4uzvjUMI3R/
 gRgr1+q64qYGlA83WdU3eWOe2RWE4woOY9M+zOvJIu6o4xBqfvWm/vRb13G1OcZKRGGx0/QteGE
 o2TYlo7z/wB3FLSYmawqJfSjWeyVemx9/Qx2seVfz9kOoWVl3aKFxe9b+601YciapfkLC/Eu1lY
 sGPNLmC0a+L1ZjEu3uOQsurS2jQyERY4nktYtfLq67mneBtqFiFLz133UvM1YFcDNr/SGKd8IZS
 3gqd+MkQknNV3h0KHMA==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6e391c cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8 a=ghuELz35WMKWYDI3F1sA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0OCBTYWx0ZWRfXyocqs8Nxasig
 X7LKYMvmJ9gdnolzhDwfGTvNzYzh2dWER8AjrfgHK1ZCX9OGPp6yqpvm5f1VjamMQiPxcohN4F0
 f3GrQTmQWRdwqSvEFdojKmffWwzxUOE=
X-Proofpoint-ORIG-GUID: 5vWFgR5h-upf_pzRrNTtxrEKwBmggClq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010148

Hi Dave, Simona,

Pull for v7.3, as described below.

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
