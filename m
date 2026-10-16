Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9208F30CD81
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792191645; cv=none; b=UvsEVPOcIe3DfMnwpqxsQXZTGikvvnJAsTNwF+3kjPV1Rz7NyaQR118v6SENvCb4ALLHLg/tH79W1/+72liGqOe9ZJ52Ilqr1Lk4GoUQDbrMSQ+Nc35MZzGTOmGAh/jNaxElfclGBZPOBsRMK4EGas3C08EF3KZ5CFoibVFn40g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792191645; c=relaxed/simple;
	bh=cfl8DEpfKwiPMHiak1H8w4YF33RiK1XxSavFRvzYmfs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MK2/VByiyYdOcW6Ov2cPQJxw+fK6WUKmoIjH6D/6iihwH7MXZFraadN+8TrpWMCSya504lam6umbOwQmoAYcLV21UIympYfGbGZ8nYAXe9mJmoIAHNhJ34OeVJTIg5/XYraXhE5EoWOIlYBirNf5xYuDj4Attc2C67ItasuU24k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTtD13xV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KY0kw677; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTtD13xV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KY0kw677"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJeWX92873501
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FLeIGjWZXKNkhRdy0r9pd/
	w8jjv3SA/UcLOzlrw6Eec=; b=TTtD13xVw5W73cNrI5WsDeio8PmtdY2Hyb3FC4
	L/2vtWr6618pnZP3PJTgHUqjWrQqoyY5hXXWqTXnz/vU2jyOF3HFY/mz9u2j9AUe
	QPCO6KikGwVkEprnUqfDNrntrvGB0Q+HeNg0jMknc7UFTnWlu6ChVq9fSkHsgtPo
	C7zeegRH+TWJZbiQRqGphozNg585HukQ4zRfHOFGdEVxJcfefq6JgZ3voEb5GQHC
	MFu+T0KiHvuITk/8L1OYGCnqpbtChiQfSngAlbe/uDVsFWQfUAyojGo/gP3RRTRZ
	9H6HOXlkQz3ksQ/ThfUGHLLymiMkaHuAGFPepoDiNc2EbToQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumtnk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:00:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35179e7f081so34602eec.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 16:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792191641; x=1792796441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FLeIGjWZXKNkhRdy0r9pd/w8jjv3SA/UcLOzlrw6Eec=;
        b=KY0kw677nWL15FSR31i/pHY4rd0VuNtuZXYW79yzZmMZmR1Idf13HWlgG2UVrVD4V9
         /0lv79BEpS0+gu23AYUMK/VoumgdOtn3evUPsJ3xJmoTlTSePhHKPNG9MSURZqoluH3W
         mFWooTlwEfIyrijADPY/yb49I7YJhb2lrDsgSXg5+F3/nXkEsoxMkiyqAnaRF2Qa817L
         SW0xliD4b+f5PQDk5bkxyejhIinl5qNO39nsM6dl5oxUW3MNSiIDjUxlVNoUBbW/AoJ8
         8/7zCqoi1yg7I/Jp0zAjsJRwLmUrzO9kU/Bcm2hdrd9gv/kEZxEOOPqRXG3reGYalSxd
         f1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792191641; x=1792796441;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FLeIGjWZXKNkhRdy0r9pd/w8jjv3SA/UcLOzlrw6Eec=;
        b=p7itogprgF0AXAQklJqVz4awpVYYVDrTT5u+YKjFcyMt24WvfSBRQkh/3uH8aHlBkN
         8OfRFrD37En4RxCtijmUGL6Bo2dKw6tIV1JFk1XzOTl95gqhJODaspDQJPTGQe48QNFX
         bQtwnPNQ5j5V9Bjr2w6g+ev54edpxzTbQefUj9BHiGl80fEvKV757CV00UVNB5gcy391
         pO4CQELhSRhtxM4PZFvLfpjABDVBwMgpkpy3zNWr8vxXAybvEwOppsMclL6PoHUOr1Yy
         B3L7XZ80m0edcJf8shxVPpmGhekznoHCXJ0sWJVL0pwhNUMxW2LtJfI7ue8D9Ry+c/yF
         6gDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfR0M3a60JxKybKHC5+ep6X9LAf0Dfw4FlDrtu2caQS0eObOnaeqRXh/HUYduSSsI/D4YJVPQuGfxvFera@vger.kernel.org
X-Gm-Message-State: AFq9FYLOzVaqeIliC8N7TjsJzvX1+3hmO2W29VRxJIBvKSrUaorFMoS8
	+HYuusFl6x0GyFppkTM+jV3V7uE0UrSt0GCEUYyCPha/CUWWYOxu+vq8mgaZcXjdT/IlPKBbRW4
	rYjxK1V2RaIERCmX8gLyfFhnz/pLxWM9a3y/IwcY1G6qfm9miuoNBn9K2bDs4BM9sZKoS0UPrZ9
	Vo
X-Gm-Gg: AYBFou2hJ9IYGcRGIZsW/XHMk2hUk+JV/34sEwI9YAe2INfiat33bOwGIQ3azPzmshc
	ELrl2SWBEQ/xxRFbUD1ZkErqf9zqfKhiKXP3fyBzaKxDErqPOBMdIAFFGTTriSB9DVooUuhaSAa
	tljZlHI9OdRuQkG3h7rS6sVDzBl74ugBwv/NgtFjgdT5CAaI4N/fUmPKc33gOyP3fPW+4wvV+bk
	IdlQ+yCB+Zevrla82R7nElbsZ98rOdVmfRSkGvyYGEk4+vfBDFy1BqSPopSUzLwIBdMcuUYv++4
	SGWIAN/ycKXy7CzJrMGizMYpBbprgPzXY/K0AKoVeCozeC+g0f7llVcuDC3HwVstSO5GGp5325t
	AucLqSpRJDUCUc1t6flh1s9L4zk9SOdK0EwYFigPHd9iDCablnXz/RZQqIvQ=
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id 5a478bee46e88-3619b212ef3mr2456382eec.0.1792191641023;
        Fri, 16 Oct 2026 16:00:41 -0700 (PDT)
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id 5a478bee46e88-3619b212ef3mr2456277eec.0.1792191640155;
        Fri, 16 Oct 2026 16:00:40 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm9379101eec.18.2026.10.16.16.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:00:39 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v10 0/5] Implement Region of Interest(ROI) support
Date: Fri, 16 Oct 2026 16:00:31 -0700
Message-Id: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+s0moC/3XRzWrDMAwA4FcpPi/Fthz/7LT3GKPYsrwa2mRLt
 rBR+u5zelgDri8CCfzpxxc205RpZs+7C5toyXMeh5II/rRjePTDO3U5lgKTXGquhe5owMM05gM
 NPpyoUxFsj8pY8MTKo4+JUv65ia9vJT/m+Wucfm8NFrFWm9QiOt4lSoiKjE4AL+M87z+//QnH8
 3lfAlvFRd4VI1SlyKJo0BaSiwEpNRS4K5bXChSFOAQtpZdR2YaiNooQlaKKItCRl4r3IbSUfqv
 0ldIXJVJ0SiWe0LQ20nfFPVB0UaSLUaENiKmlmI0i67uY9brJGyXAJwnYUOxGAV4pdp0FHbcJO
 Dnd+mn3rwjO641cUSwIlGWYHoN4oFyv1z+L263D5AIAAA==
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792191637; l=7170;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=cfl8DEpfKwiPMHiak1H8w4YF33RiK1XxSavFRvzYmfs=;
 b=ZPGdAXZq+b4ir+dVkDI3Ah55q2Vi4iZP3dnqEv3h4PHXMzAMxKLR73VR1jKC34NUWp3Cnp3cF
 +18CQQ7icvRBaIvnNhM2mJBYPFzYBx3dwHm1NYqKNolxdeX/OdXTLJB
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX0T5JCisPAPlb
 o/BmCCsFuwH/srqyauqU+8TH/vSTkeDGZraoytJrtOCr9azjQ/ghq3lODQXnpCMkt5xzD90PzJx
 AZ30cofw3oQul10ymhLLkMLla8U9EW8=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad2ac9a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=l3oWgaDpQndWrbxot-sA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: hrlk7ap3wVoos_KOL-pJ6kyKUK9xhKNd
X-Proofpoint-ORIG-GUID: hrlk7ap3wVoos_KOL-pJ6kyKUK9xhKNd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfXxCJmM0ToQegv
 JCDzyLx6Lueeo9X2x2Z61uDUVnwTSI+DpI4hWnFP1p2IbBF+ZPiCD0C+uKQ79pu4DPDPKhxDT8g
 PFpf2aiV6tB5QX7GlahCo4a+o0VxcZQg7IF9YTLuZIlzpuj12M75Q31tI+EIVNBzyI3OuGunb5L
 rzOellvyPZ5G0M/EOsH1cZzVDF41Mgm7AxIRVbrdLjhN2ZaqqDTM+/hGo0WZW3WqKOSnIX6E+qr
 DY1fM5tbrHAUnYDbfJRW5aEkKPV3UZgYiuY3f1aePTCO8QB1Nd+t0/dA9viV8yr1qioAqtw7Js7
 938WdY2hut7HZnGQ8OwLYdw8MFsobRKqWoQOSEGcRpSRsHmyd78eLb24HDdEQQvpYlad3nj8o3j
 NOF3F9qfyd6ooc1/aypiev5alqHSQXYb4FExkfgUhVTVdrbfCu97LjyrKRE92LoLlw6cG/te4Xu
 iw4jaCXHu1G5jgKZUkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160091

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
Changes in v10:
- Do not enable ROI subscription for unsupported platforms (Bryan)
- Address comments to use BIT, DIV_ROUND_UP, ALIGN and others for clarity (Bryan)
- Link to v9: https://lore.kernel.org/r/20261005-enc_roi_enable-v9-0-831c24135cb1@oss.qualcomm.com

Changes in v9:
- Fix Media CI error.
- Rebase onto media-committers next
- Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202610051710.bnOqLkUl-lkp@intel.com/
- Link to v8:
  https://lore.kernel.org/r/20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com

Changes in v8:
- Moved p_s8 below p_u8 (Hans)
- Update Documentation for V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (Nicolas)
- Update returns to a sngle line (Vishnu)
- Update n_shift calculation logic to ilog2 (Vishnu)
- Link to v7: https://lore.kernel.org/r/20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com

Changes in v7:
- Add V4L2_CTRL_TYPE_S8 to v4l2_ctrl_type_op_validate and check_range (Hans)
- Rebased onto media-committers next.
- Link to v6: https://lore.kernel.org/r/20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com

Changes in v6:
- Update documentation from custom to array, __s8 to __s8 array (Hans)
- Update documentation and handling for non MB Size aligned frame resolution (Hans)
- Rework patch 1 and 2 to add V4L2_CTRL_TYPE_S8 type first followed by ROI control (Hans)
- Simplify handling for V4L2_CTRL_TYPE_S8 in v4l2-ctrls-core.c (Hans)  
- Link to v5: https://lore.kernel.org/r/20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com

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
      media: v4l2-core: add new control type V4L2_CTRL_TYPE_S8
      media: uapi: Introduce new control for video encoder ROI
      media: iris: Add ROI delta QP control support for HFI Gen2 encoders
      media: iris: Add HFI metadata buffer delivery support for Gen2 encoders
      media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  27 +++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 ++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 115 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 ++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 114 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  19 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 24 files changed, 453 insertions(+), 4 deletions(-)
---
base-commit: 64f76d5d9fd17a5661d7e5eab2aa99218db60d0b
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

