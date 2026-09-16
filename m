Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0CF4B8272
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577314; cv=pass; b=L5u3kSNSI3qqDxMk2ouzGx9qsJPudM3B1L/SjSXJjO+KjnaQRa/kNde9zMbIwUZYytla3QxTRMhPY1ftPck0lNfHztx9Y/6ChphpyLDSB9Yi9bpAHrmuBK0nT3Nn/Y1Lox0JoEmoyy+tZNatXrPZQAaYv0QVEIlgYW35TLUpXaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577314; c=relaxed/simple;
	bh=mC/f2N1M0iceYJ9fexSsAREqK6EwqUktA4bBW+fc/iA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GsF40+77MfO2zhYd8+UOoRfxM2Pn7w7xBHH07Ek2I2ojRNZintDAOtkSJ0HgRbmd6tKVaVzdz41SGTaiucpVjaJqoVsYlNcWM7i5xZoc/rDxJMDZAwFgFr/fY/JF/0EyvyZ6FqrKhZhVigVFK17Xbilw+RaM6Hd6C95QUtoEeoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nhw4UNJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtCA2kFG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nhw4UNJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtCA2kFG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeEl93365361
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=ndtfDnMzOItYaqfMXX9EhB8LCDaP/lEclZx
	u5jQm/Do=; b=Nhw4UNJk9MfuvR/7n3Hn2bV+QbhaBXbbBSdhh0EubtD0cyv/ax/
	af+8CrYyALzykkvyHHLJs0LC2kL9gRqPyYFfrp2KxbHXc3wE2j5gSP34MvN5EI3e
	dJA7YBBD61mC2EuG5h5+C9N4uHr6z0gUO00diznoyCOmYmJhg7/RDl+x1pbielTa
	wau7zkVlgH9Kq0GTlwSaD/m6yOGL1milfbuxNc/HKKBrJLSq+LJ1Qh8srQ8T+kTy
	0FiueGfV2C5OxOZeCf1IGfLVFofO1zfK374JtIOwU9MJo74vgVQ5h5SGimJobd13
	bnPxAJMRjKq+XAjyj+srzz7wteSOWBQ7hTg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjckuhvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 16:48:20 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c748676f6cso2729656eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789577300; cv=none;
        d=google.com; s=arc-20260327;
        b=QWrauX0Pg3RCm7tZcXDbcW7+iQaiMaqgetzJT7C47+YVidbkH3vs0kkfF7+4zsz5a3
         SnzJOq5/fAsaSRg/lElHxWveI8qeNXbuUyJ3s0ARB16MbEXRj8y1AaM9667hFkTZI8o4
         JV/LjS3nNBREmh+OrLQ77jzMgC+ojBUpn6rCbwDbboymeT8BuQROKulhVeAZ+8ZZleDW
         +WnILsGM5/pe0hwyzvEBE+jhQKdnkNJo6nt1ViRqXqVHA6/2Z8ZuVbRlZWlPBsuW3raI
         tGpDCogrvWq3O0MTeKTTb+MSdbWmk1TRIL/JTMuXYwjSuzIbn+Cj8qOggVL4wv84E4R6
         dXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=ndtfDnMzOItYaqfMXX9EhB8LCDaP/lEclZxu5jQm/Do=;
        fh=QyOs7Lv8ZtmE0yNnLn+/bBO37x+dgqUcWkIEJW2J1lw=;
        b=Tn35C74/HsbGt6cGBYm42Ac2F7E5+SJev48Ecnac0OriSPdDe210k913iWdRz28A82
         HN8DMLl0L9iPmSFMB1HqA38cj/h5ZSyggSZ5uBvvhgVOrf7YvTS3jbctOXu/pt72Xo8g
         AJjP9YZon/sjlxI1n1rMYecSzV9OQOhCwNFzC0pDI/a9CNBReqnt9az7LrGePXkRb1b5
         FIoXpJNT9RFQAa1DdQMk842OmZYmOqbu3YP2e+DkQ728QbxYbxnc6rn6C1x5Sj59MaNH
         2oowuWiM0d++bvtSbDpKQ5TRfhzkSU2uP1xU07+IbcgP43nRzs7kNaQeWoaGAWznNQ7x
         I1xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789577300; x=1790182100; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndtfDnMzOItYaqfMXX9EhB8LCDaP/lEclZxu5jQm/Do=;
        b=MtCA2kFGzUyJ0NF31FHKp/OYD369qJCBgXUT4B6e37kplnwTjmC/FKiMSc+H8uP3JR
         iuZ+VDeJ13bdmU+I0cq6mrHWzCIGDcgfdkuH5ZeHoHd0+0yIoo7trirKBVwH8QjqGJjD
         DAEKptJ7/+TiAPjjfQW48BwwhSLyNiMp/gf3p1TzBSou8aH1nPOVDgpJB2P5vMd6BK7A
         +XNzQO77bHmwJ1bd2df6l4joo6FJ+216m6mhAqWZzRWKaI7B6KR1+ihpAK/LlxWVj956
         HPALuN53sYoQt1LO62djOvfLxVLf5iHw8sW4iHXECLSn0VQzvI5k6noVbEhBwu7Ad+yx
         G+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577300; x=1790182100;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndtfDnMzOItYaqfMXX9EhB8LCDaP/lEclZxu5jQm/Do=;
        b=Le/OAkYS9CNTzib0SdRjHFDIqw854WbcWNxaXr5f6K4AvI+S9gyiltE8+vRUHsmb6c
         nNIdwAOWQHTycZe3+Y0s7cY1btCeo8Fr+dyJ59rc1N1TsHpH7ksynPbUHk0+nYQ7XfgQ
         kgt7ZqyjaDdGXeAUk8Px1NiYWo4aARDEom3EumSmLkCvGLCFoORrRU7CPOVLuR3JMJTi
         wSocrqlKbO8yFYzma4qtK8msH1YdJHYLsqZHzX017o0Akc4XF3yvs3lxMMvpHa6T3/Rm
         k98fqLMZm6+ElmCdO+WV5w4l6uJrCDTlsmPaAI3lv6alop2qa+5elvGKQA8BcDgBaezV
         Uk8g==
X-Forwarded-Encrypted: i=1; AKwUvBwkfefiGvKFB4Wlt1NM/i2bpkLyV/oDgSzWOHStkqoL3usDgN7DColvqwm12jwZS7oRAZQg20ex8EOwlwM9@vger.kernel.org
X-Gm-Message-State: AFuF++mHvb378Fmf+Um+P9exW0UGS2kESHNjiEp2HERLP6lKUsAnSAvm
	Tr/PuHhRbnXY+Jhe9vzJx0kCFkz3xLfYDrG5PzIuzKXwBT75f6+wGNDMDwF6gdfMQZeeuJ3RwOw
	44iBlf6cpXA+WsSE1oN2VPiJUMPVuu5xbX7YVTXhELaSP1zGZPJiGMkq5qGemqm+kjdG/rIb1qC
	Oq/ydDYh3aRB5ioG7TjaYCMe/Oql95BZYMaYVNKmcFT6SaezXUPMxvQQ==
X-Gm-Gg: AYBFou1fb2sjMucLgxRZZD9Fk8iKEJQ4v3L1MF+6GOT45/4cIsNJbLNCDj9U4MupEze
	WAqhqXRj7meTCUO4Mz/9kqld5SP/lo2q2khstutytpRbha29jk4ZbXiDELr56glmbY/f/Ruk/sE
	aBXn/JPBsPe4J5e4FmuerofL9/gFMFJFCG7BkmY9Zj/bpj0SFoHaYDGFvt
X-Received: by 2002:a05:6820:2918:b0:6bd:7732:adc6 with SMTP id 006d021491bc7-6c7d1ad0f1fmr3608884eaf.17.1789577299457;
        Wed, 16 Sep 2026 09:48:19 -0700 (PDT)
X-Received: by 2002:a05:6820:2918:b0:6bd:7732:adc6 with SMTP id
 006d021491bc7-6c7d1ad0f1fmr3608859eaf.17.1789577298933; Wed, 16 Sep 2026
 09:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:48:08 -0700
X-Gm-Features: AcwNN1Xs2qsK7N5X5y4rnsKq3hyloIUXdh_jq5FWdCG-lVMbMqzchSg9OgBCCag
Message-ID: <CACSVV021rZsjmiPEyR_LR7L=k7=DRV0QdsA50BF_Gd0s2DXaCw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-09-16 for v7.3-rc4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyOSBTYWx0ZWRfX9ztUEsf/qnE8
 XpZpvjL/yF+X4ZTrGBFi0hSm2fJRflTtEUXwws0uzWYVjfpe9vBzV23cHND78QbhNLhYrcFPLzs
 qJAHn+w23+aVZEuH4BTYJU+V0hvew88=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaac854 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8 a=8FDDF9oY24P6SjVuP7IA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 1zsMSpKUqGlPxVBQasybzi19goYmKJzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyOSBTYWx0ZWRfX998IgM4H5/ai
 AdncBNH0PnkOPJ2NhmMA+E7DOg7UJ2dUn2GEQ8s5gMlPm1sAqiUNK+zo4+qnelTIp2FUv5xXajj
 S3N6bUrxAtuFU0dHWfTmQZ9iddp6QQzZZzkZkd5zrXdzQf2aLQFYETZyghkkjsl8LtUV74sz77v
 Gzv0JuYr62GWydXO2xaTGBqrowE+N4ofnLqOp/kZevZn9JnU1zbRj8dk+lKsBNIkf3Kw1QNaJ6r
 muJ72GAZ3KAM4gonfuU3scWGfIr9imKwPt/GmF2D2VnTba8Q/uaT4jCvX71815KUy5HT58sSaIu
 jEQshm8yDT1kjn77XGdKDfVGoUM42hquYPak1P5R1NKRlQKkbYxos0QBstvS3x8fAoGn7Q/UQkB
 CJRX1CCmrpWsT4VvOukY0lSwui4bOgaFDRcG6LGmf/EdCFDzqesTpzlamzbfPC/EcQx5s+eoxY4
 m0bLSMbzRREXHaxJudg==
X-Proofpoint-GUID: 1zsMSpKUqGlPxVBQasybzi19goYmKJzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160229

Hi Dave, Simona,

Fixes for v7.3 as described below.

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-09-16

for you to fetch changes up to a15fac810c76397ec9f62a6fc26c4d7ab6e238a7:

  dt-bindings: display/msm: Use consistent indentation in the example
(2026-09-15 02:09:28 +0300)

----------------------------------------------------------------
Fixes for v7.3-rc4:

DT:
- Corrected indentation

Core:
- Marked fbdev as system memory

GPU:
- Fixed autosuspend cleanup on teardown
- a750: fix timestamps
- Increase GMU fw init timeout
- Misc fixes/cleanups

DPU:
- Fixed clock rounding, unbreaking newest platforms
- Cleared pending flush state

DP:
- Skip PUSH_IDLE when link was never enabled
- Fixed bandwidth checks

HDMI:
- Fixed runtime PM cleanup on probe failure

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm: mark the fbdev framebuffer as system memory
      drm/msm/dsi: round the byte clock rate after reparenting to the PHY PLL

George Emmanuel Thomas (1):
      drm/msm: remove stale perf counter XML TODO

Guangshuo Li (2):
      drm/msm/adreno: fix autosuspend cleanup during teardown
      drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure

Jesse Casco (1):
      drm/msm/dp: skip PUSH_IDLE when the link was never enabled

Jonghyuk Kim(MalHyuk) (1):
      drm/msm: RCU-free the scheduler-containing ring and VM objects

Karl Mehltretter (2):
      drm/msm: Fix the separate_gpu_kms parameter description
      drm/msm/adreno: Fix the skip_gpu parameter description

Krzysztof Kozlowski (1):
      dt-bindings: display/msm: Use consistent indentation in the example

Neil Armstrong (2):
      drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
      drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs

Paul Hollinsky (1):
      drm/msm/adreno: Only check for PAS when a zap shader is present

Rob Clark (2):
      drm/ci: Update xfails for kms_cursor_legacy regression
      drm/msm/a6xx+: Increase GMU FW init timeout

Saim Shujah (1):
      drm/msm/dpu: clear pending peripheral flush state

William Bright (1):
      drm/msm/dp: fix link bandwidth check when wide bus is enabled

 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    |  6 +-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  4 +-
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      | 14 ++---
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |  2 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 68 +++++++++++-----------
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |  7 +++
 drivers/gpu/drm/msm/Makefile                       |  1 -
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 12 +++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 15 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c                | 21 ++++++-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 36 ++++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |  8 ++-
 drivers/gpu/drm/msm/msm_drv.c                      |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |  1 +
 drivers/gpu/drm/msm/msm_gem.h                      |  3 +
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |  1 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  2 +
 22 files changed, 128 insertions(+), 84 deletions(-)
