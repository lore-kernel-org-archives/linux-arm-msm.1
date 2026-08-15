Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D9B30C16F
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821756; cv=none; b=Z6UQrM2mifp0dIK17uo+a/TKf9OA9tiHe87QLY2DUJgTfc/yfNqw/fiM7FpxJ8yaZu/sx+sVhSrumT0s+rIQMaH+FsyUbzb/4InIUY0LF8cpyWuu5bsnlUVrJwiCGEBqplrzJcna2yPfaJriVSmiUo1vCuixiG57RMJibShtcjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821756; c=relaxed/simple;
	bh=LlHRON7btqFAtPuKHSTR8JrkNDy+lbQmkH9xpUVdnUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VEBFjVjv4TMhBZwS/y1CO7nxIMWi6SBHYosefiIaw2CoWNm16onJLlxk9j7SVW/3KR6cX3Q7MToox40Hkf8qcOwlEuYdD1wP7cdA5qPtu20t5BCwy0eKLZn52YBPzzfpa+rkTKo/jiBRdqaXPAh+66lhMru+sjUYKmwx5299XkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmAMASZu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyUueS70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmAMASZu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyUueS70"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FGTN0K1046061
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 19:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TEDK05Mkthy/zNDYEL+7Nk
	XQpdGl+GL7PLnpV0EYHT4=; b=mmAMASZul1bE2KBs+eEkMUdcWqyN9rEj3vKJdM
	QIT24qDqIjz3oOJQsTTcD1vEHcoIqvIpy6XNDLVLzlWwYcJkVFkqYJWtTY40FHy/
	H88hVq+te1WJZqU5tutD6fZC2vHonSNRvuV5HZgRxYy+PKRULlWhJMafVD0iKDvV
	ja+TxApmGn7Hn4Qsups5RuQae9pDKGeHqnUtcehQdwqFcOL2c+O/ofqR1KZJOzFJ
	19iQO24tNY5RjstxKRWUgoorwDn6NrEL9zkq9j/czMxO6SA/J5mgz8C5Go960sQl
	jFc8KaxwRKD00Ut65YULy3djWJxnZMb1n7SpL1Xk0jUVh4Yw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghehuqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 19:22:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811d5ecf66so651589a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Aug 2026 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786821751; x=1787426551; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TEDK05Mkthy/zNDYEL+7NkXQpdGl+GL7PLnpV0EYHT4=;
        b=hyUueS70kSP4TTfMVmgHWKTcx8QsR8VID2X3P2HN6mQWlGgKA7DfuHSCRZZm8oDMeW
         NpmDM9CcgZwn68xMpGmXxZ+X3/8gENR72CCSrFqs48MYZkYrZ6Di04KQZR+geJp+u3qS
         sqpci4bn2PBqZ6btVJHxpY6CvqhhwcZ47EIe+kXshVhDohZTnmIU4DTph9sI60hXTIsO
         dyP5PW6mPSfMGmUS6XFfsp9PUSu09i8Bf9vVcy8yOgqPlclFxE/P/mfXKrEDOHqixjHO
         15+g1DAn9GCNNaWuNy5YymZ/g+X4CvWhziboHHtYwfkCC1taDXgFoz8EDrI5h41MF2Uj
         wyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786821751; x=1787426551;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TEDK05Mkthy/zNDYEL+7NkXQpdGl+GL7PLnpV0EYHT4=;
        b=WP1WI4HMlg/JBAF7Pn1u/4YMU2Mco0ssHhcPLCqvSrSFSkCr96KpaWADqR2rpl7tSQ
         5FmgPgqpBpWkPN8IEhId5sECD6j+KTAu1gTlV+aASpvp41FFPwsILghxLhV6tqLjrrgN
         lr6w9iH+YT4q0GzQBKcNiGH/Z/kGxURywWLnAq6Ng3TGZ3GO3j4K71NxC5uOWtq5TDBz
         2F/ZqsVi6MP4o/v1WAbwAu6B0omWGGSuvxqDoYECxsfO8mI8rfUP1vD6PKHhMDMcwPhF
         lL13d6C6KwL74ChCe0iltzMv4DUTdqkZXIb5UnkYk94eyD3qJ7szg+AZ+y7W/nyOdXTo
         RaVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqweKlEXP6zh1TpeI1X8E185xXXc2UOBh682TlJ4jnqT12xADOajxH19NcabQ5kEhDtOlJC6fysy9Wt2mF4@vger.kernel.org
X-Gm-Message-State: AOJu0YynVeqpD0z2jFv6OHFf/gelcUMlwd9puXkr99eZOB8eg6YkHtGc
	pxrDjbDTRuTWZuZCR2+Of3eh1bx1Cd9MRCHlhsw7F/Xyh3nyhewtnCGbHVLp4GyZmA/o5Kgvl15
	hu8eS8JT1+ElZ3xVXtfjKrYjxBSGov5Ya1CJg+VaPJlvphw0Bfe7fwVUHMbQuRFu1PQ8k
X-Gm-Gg: AR+sD10FOpwLiBg6cwI0yyO7K2f0tN9GjlUwdTKzMSE/JvjsBaV+5Sy3PdRxuxXSEuM
	xVsSzJJlSjYnrPC5WAVFlkjfWsvyeA86h1AL/m6ig8Wiv6QafyDaKVSPFCdTNR+CIrK+/IeNlwv
	lWFjbfRZt201X4BPSIXtCBSAN0zXZymxMGngPE20LSYDTK6M7Av11qQZIsc5onGMS3jJlrlw9yW
	qcZFF8AcTCmOS+uZ22S+IdUJ1xFp9E7XiOjT8oKhSwM2GNPzjY9Vori/KuYU36QX/n/4Lp30W1Y
	Dbb1HONVpbtyyxKR6LtSqv/UWf5QPbkrRIM6DHoqOswPedufV9R/v4jAQHg7lBV7KRRC+QJ3zph
	mH4YwnxlB7VIfURKUYe2ySuY/pAageBD/7Ct71bgaNVA9OpMGzXFLXp7EQnYu
X-Received: by 2002:a17:90b:448c:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-3933b4f801dmr10969540a91.0.1786821751479;
        Sat, 15 Aug 2026 12:22:31 -0700 (PDT)
X-Received: by 2002:a17:90b:448c:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-3933b4f801dmr10969521a91.0.1786821750937;
        Sat, 15 Aug 2026 12:22:30 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm15889350eec.8.2026.08.15.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:22:30 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Implement Region of Interest(ROI) support
Date: Sat, 15 Aug 2026 12:22:23 -0700
Message-Id: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+8gGoC/3XM0QrCIBTG8VcJrzPU45x11XtEhLpjCTVLaxSxd
 892s2Dt5sD/wPd7k4wpYCabxZsk7EIOsS1RLRfEnUx7RBqa0kQwoZjiimLrDimGA7bGnpHKBnT
 lZK3BICmja0IfngO425c+hXyP6TX4Hf9+Z6mOU0Y9euck1soDbGPOq9vDnF28XFblkK/YiVGpu
 ZwooigKlAa/bqxDP6PAqGg2VaAoyMAqIYxopJ5R5I/C+USRReFujUZIVln7T+n7/gMqwFWDhQE
 AAA==
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786821749; l=5654;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=LlHRON7btqFAtPuKHSTR8JrkNDy+lbQmkH9xpUVdnUM=;
 b=wO4SEsQOMuzza5VVQTj9lJiXgdEohC6kFSVT8U3SHyxZCUH92sUp9aYkJPgb3fxWkFcxoL8U2
 uLtOgIjBoyCBm3I8L0KOk0KAA2C5x7dtdBHftaJK6RqfQTg01Obuenn
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a80bc78 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=M65a8TQjgKWshqU4mUkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfX79XCL3NwyxYc
 qzYmdERZuw9xLlIsNrA5JBBqkdmru5LxTW2MQYKKbfZRwrqAD8uqr3/Bj2cjYP615/rZii1NP+8
 +9yuFyjc7Eaq8SkD1uyRmn6uvLYrefc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfX6xIwnK0bvjTz
 wj4GUJhWcGVHRPQi4uTsKFj2J7Re1vkUamg87uASjfI9oNevKu5+z1Gj8g/YEhCyQWE8L8VR2fm
 AS5nFc2VHwlthS6sZfebBRIp5irGOIbN362w9owe7iOiooLcU59tq7Wqlp6Z5pkamhYy0/GOPee
 El3pIBFv7JX/3GImwXzguHEg6P8FDt/4FtMxqPsq1B5n7eIGpGCqHSPqVSCl4i/MFWScqmybXX0
 HXbL4scMcyZGk3kBvfQwziya6POJb1RyEUclefVRSgrg9QrACwoVQVkVyN63Jz43ZGcNBK4vsSD
 GUvOh8/GdxCD+pfqHyjsEpw+OW50VVC8qX55O6XK83RPwPfMifhc2MmfWDBZKAGuAJG069ho1PR
 tav+2Ox9ImUclVjrSyB2DuPP15xHMzN9Gy9wpUH/7l2vGwRr9tlYNhV68y+JhHkfCvWWzD2RqN2
 BwFkpHRfIcJy91NVJYg==
X-Proofpoint-GUID: XXQQuYT70IalJ8xz2Dh3Ag54iZTs2PmP
X-Proofpoint-ORIG-GUID: XXQQuYT70IalJ8xz2Dh3Ag54iZTs2PmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150146

Hi all,

This patch set implements region of interest(ROI) support for
video encoder to be configured as a MB based delta_qp for
the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this. 
Corresponding support is added in iris encoder to implement this
feature.

This submission and design is based on the feedback received
from community for the RFC[1] series posted earlier. 
Initial testing is done by adding support to v4l2-ctl[2] to test this
control setting and its functionality.

[1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com
[2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com

Results:

v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload

v4l2-compliance -d /dev/video1
...
Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10

Validated on SM8550 MTP.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara
<deepa.madivalara@oss.qualcomm.com>

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v5:
- Fix Media CI errors.
- Rebase onto media-committers next.
- Link to v4: https://lore.kernel.org/r/20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com

Changes in v4:

- Updated Documentaion, clean stray lines (Bryan)
- Use BIT(16) for header version (Bryan)
- Split patch3 in the series to reflect enumeration of
  the platform and adding metadata support and implementation (Bryan)
- Link to v3: https://lore.kernel.org/r/20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com

Changes in v3:
- Updated Documentation (Hans) 
- Reuse ROUND_TO_RANGE_RANGE for p_s8 (Hans)
- Rebase onto media-committers next.
- Link to v2: https://lore.kernel.org/r/20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com

Changes in v2:
- Fix issues detected by Media CI robot and kernel test robot.
  Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202606171554.03yt9utn-lkp@intel.com/
- Rebase onto media-committers next.
- Update to handle p_s8 in std_validate_elem correctly. 
- Link to v1: https://lore.kernel.org/r/20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (5):
      media: uapi: Introduce new control for video encoder ROI
      media: v4l2-core: Add support for video encoder ROI control
      media: iris: Add ROI delta QP control support for HFI Gen2 encoders
      media: iris: Add HFI metadata buffer delivery support for Gen2 encoders
      media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  19 ++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 ++
 drivers/media/platform/qcom/iris/iris_buffer.c     |  98 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 104 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 +++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  23 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 25 files changed, 423 insertions(+), 5 deletions(-)
---
base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

