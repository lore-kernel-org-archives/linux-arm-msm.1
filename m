Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218314;
	b=t24Fp/HCQ2F3xXuUbpmYHHRJx0bAQaYhVULQjfd5LWFQG5Uibw9f09s7HiMtLWyWsf9X
	 Efq0LAoQb0l6YGMqQe/du+HLTpbjrhsFxtfdKRKcMTGgpcAizH4ip+Ix2E9jKixkemH6o
	 rROufrzShmOU+Qasp2D5K+ZywndOK3z/fGrwTYsEHbfcttnj48+PwTfhm07GxsrNyDap/
	 c7KobeFjEoQDhB8A30VPe4DmyRq2XGySEKqDerjv4SUF/BHmNjVHObShG7kgjPa3pWarW
	 Fj3xhe3FukT6HNH9vkiRO4FRqv+1pgrkIsWHQ1KjE+3sRz6Xncs0H5AlpGVQRcCnzpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4xSyU6EJ+T1zz5ShxMW3u6/dSlAPbOtpJKNFH9TQlEA=;
	b=e5cA8h/TORYUkBifKHP2USjAD/oorSm5Cbh+3gkgRPFNcBIjge7d/xwu3gpCr/WtV5Uu
	 fB0tpNNxVK2bwQGabHBTPBTvnwqmO9SLy1XabO1vTm4EFswPm6C/WPVHwI9JLjqoZvjYY
	 5kfgM3TjbKLL0YIuJvamBx0z+7kB/jxBoaSaALIjjSSeQ0gIpZov8bQ2IKZUGxQjrLPd6
	 a0SkuphQvH3mt4cd4NFZRtfsvlDHvgNCQtaVUO11cysGRCzcRd21WftMVkT9XeFnZL+OT
	 6iXRxV35kER6bQMQYnG9h1Fa9yS0v/XuPuqgLzr/aoxYypEsyAAREXu4xbOVn4AZG2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwKTFDAC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JQB/QXYJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC10606A6BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC10606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwKTFDAC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQB/QXYJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHPurF2044123
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4xSyU6EJ+T1zz5ShxMW3u6
	/dSlAPbOtpJKNFH9TQlEA=; b=lwKTFDACLwzsupeiPPRJSmcrg7v2QAKjq8q4xy
	CbdlRt2Uuk/j+6hS8UGwAGE+CuhYLgMHzNK8niCK/1qGdtcMNYxHsNFxvlD64T64
	b3DqsBj5eMTc4da26u3ZxqsFKhZ5p3/GCkQa2lgG9qjc+p0058G9xes7rSth6CXN
	J3UYZM77/lr0IL4PyD9/vQAsJLdXUY8tFLV5Tn9zjHRSbCqQ8GeYG9VGxJQhSzGp
	idkbEzajhcJsPYZ2jExuwsDLTXOzKZRLjH0rLiBKIHaRFfCTvbvG8BJTwztvFO5p
	zsnAZ/U5dV4SP9tVuuimxS5Zb6ZjYWatWmt7NsOzFdargVVw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2tkn9a5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 23:45:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c58d35c0aso222687eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218307; x=1795823107; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4xSyU6EJ+T1zz5ShxMW3u6/dSlAPbOtpJKNFH9TQlEA=;
        b=JQB/QXYJxZ3WuyD4IVRUe9ofFmZ1jVvZ+5PF2Ub0aeq7BLh5F42mi24UcEQjNWIX70
         9bIU3UoArIYnOCIMRxGK6ql3kT+euqfyJgrqj1Xf8cfKXsOHHI6z4R4QUEy83wjtLyOj
         cSC4RlLjR5qYL8H2hoKRLu3nQ/OvLALLzP3aLaF0UpHlwgSlDtsrvigzYVDBlzzpeAju
         /cmyhgI0QhKrdN0s71X4wVXnA3hjc02QqWrzC8QrHG6Sd0evyk3sF+SYfjA4Z/bHhO75
         fSMVOc+ibCDL4/fpLs9Cr9skJIoOQUbRoazITXWaq4B3vj98IanQv7EacWHjfKWCvxAF
         bPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218307; x=1795823107;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4xSyU6EJ+T1zz5ShxMW3u6/dSlAPbOtpJKNFH9TQlEA=;
        b=Nmfy8jMUC30td5DprOUDFjgxR21Rn1UApWdOnrH9pbWdayQcGuLdie2zEK0c0kv50d
         qiYLyazi2B4ZasoWQy8NHpIUvLGBqX/UWWnE4XCFYwxNLFa0HGxyoFRoNT8UzYc1BqQM
         BLG1n0RtSUUgA8efrgb8ekY+cnI5Fgl6f3rvxTKY75FELPTXEZTjbUYwJx7Bjnm9s/5J
         OSjtxO9vKcoqbUbyLalK9NUON1TZW/HaJ0tV6ZPCuBOtuxbpLbzuWsMpeCiPaeK5Evui
         doUtQAzh+T3ysmFu4Bi9DsyTlFiWuf3YlWR84GD+iq9i5Vcc5rrAPU/bsWWD08Q2dO+F
         e88A==
X-Forwarded-Encrypted: i=1; AL+hErGDFZ/1VCgBeE76MB8MAo0QSOsSfxti+TVilXOUtz5YG/eyYHCtIlf61zJ515LadYP0sxp/eF38EzAuyc7v@vger.kernel.org
X-Gm-Message-State: APuU4Z8B9DWgHCKyAvPw+Ln7XAw85Vid09Gnp2uPNa76m/blWrmsBTOQ
	4NlOFph8CpRf0kZW0fyZteyI4UyJRRe6SYa2VXqAa/11WLh1RYpnlv6pwzxOAxaWXcP8OgJDf6g
	uwYUjQL96IXamjcAui8KzVyVtg304yA5qumoLBVYX11Q4l1/5zcfsktj4g5Zje3FQ/PSTwYTJFo
	Bf
X-Gm-Gg: AZFdTZeh+6TpkQX3N1HN6KHD2MMfLgAv3rTiQSBcGAkTCNZfkn37HtwLHrqxFGgOK1n
	SwmQkp5CHtyBr2sRjNbqtjuF2qH6f2nVYOP9SnmYqeblVIES7xljxdmnVHrTRGPpghJgfqSqy2o
	gaYNhlHvJ+7OVwmClbZmVEFoSdl7FUsBvMB3HbE11+vOOmT7nvfO1lf1TiJ52upVSarp/lyvRBL
	VrzkmitTssk0ouBdLXlVzW4AortRD4LSGWgXMDYkCJwffR4u6MaRrswXNXCq711kdhtkhSTEitz
	C746GwUqRxsMowlg+ce5DW8T0TUU6rOV9ODgTQKCeT2h6x73sgJ53z7JSHUFHqrJ0xKuqyt1sqx
	l7Lonc8GdvcxV5PaLh0yrEs+S0WFdyFSdWHllpl53NMEJ2njbNg7+7LhOcBDMfyxb1OLJoRDgqp
	gvdeCx4IIR3ERUFs1YLpXebyqj3z9QRFEl4Q==
X-Received: by 2002:a05:693c:26cb:b0:381:6297:8f99 with SMTP id 5a478bee46e88-3856e748babmr6295632eec.2.1795218306385;
        Fri, 20 Nov 2026 15:45:06 -0800 (PST)
X-Received: by 2002:a05:693c:26cb:b0:381:6297:8f99 with SMTP id 5a478bee46e88-3856e748babmr6295591eec.2.1795218305794;
        Fri, 20 Nov 2026 15:45:05 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:05 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v11 0/5] Implement Region of Interest(ROI) support
Date: Fri, 20 Nov 2026 15:45:01 -0800
Message-Id: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3bAGsC/3XSzWrDMAwA4FcpPi/Ftvy7095jjGLL8hpoky3Zw
 kbpu8/pYQ24vhgk8GdJ1oXNNPU0s+fdhU209HM/DiUQ4mnH8BiGd+r6VBJMcmm4EaajAQ/T2B9
 oCPFEnUrgNCrrIBArlz4myv3PTXx9K/Gxn7/G6ff2wCLWbJNaRMe7TBlRkTUZ4GWc5/3ndzjhe
 D7vy8FWcZF3xQpVKbIoBoyD7FNEyg0F7orjtQJFIQ7RSBlkUq6hqI0iRKWoogj0FKTiOsaWore
 KrhRdlETJK5V5RtvqyNwV/0AxRZE+JYUuIuaWYjeKrOdi1+nmYJWAkCVgQ3EbBXiluLUW9Nxl4
 ORN66f9vyI4rzvyRXEgUJZiNEbRUATfMI/Wjhcnoo4JbCx7Rw+c6/X6B0qaPRksAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=7510;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=vuvbM02Jw397PqVJCFo6HMCpDsTVFguB5riWZWCmN8k=;
 b=ySOp/VmfIJQVbybVM75RIyvjMJ/GePe6DCqs9GsA17tgrJ6K6zpVCRSMdxyG+s8UWt9pVVcJ0
 /cQguObGoq4BIcwrzSAMTQ7XxxjrHSFXqjvjGXwjp18bquDCTlZfaOO
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: xyd-Avd0bTRe3Qy9pPjXqWGXDOyH7LxC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfXziVG5jtNVRhm
 OCABP9wS9GsMChbs6Wi9hVPP3fYVVKAnBt/VKor4vVz5a+CoBvFBz2QywskbQRuFcf2g9EoSjyI
 WoX9IngNvL+YN5uJg7Rxu/Xr2ur21t9Wwrls+F94mFxrIV7aZasd0dlWxVgxX5VMe5HJ2/JrpCu
 y9pPe/cT8LVZV1VK+IL/hade8pJVwaMgbfiEVckmAbVCeKVxZm0J2qQEPwdiIJx1iFqPrDOViXm
 p/3n/5I2ghC0QwC/L3W6GN4WusqNwqp8xrq24TnTWysyBN2sR2WdsEIOy/1BlVjzFbxzHZzx0sV
 +qrJ+ZVU7409/swNMxCY3eu7k5JouUzIGGS531pFDoykcdzKDg/uj6ESh7QTeHiPmQLwoM8giPz
 B+saZfDunqjGBYyyvothMPtTYIp3cwViW4ZcVbdtqAZ7LEjZQxUF2if+uxFRcw5YowtQJOB/1eX
 gGaFnWgG6Rm2onnGukw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX2CnxbFJFeT2e
 cb9a6p//JHRtQ4sad+A35Gl6e8/fVg+8lAKjs1zlUQEnuEi+7RQ7eksqMTq/NXlS63up92RsWOx
 MlymDxuglJo66mPDOS3KLGUIWiENMdM=
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6b00db83 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=l3oWgaDpQndWrbxot-sA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: xyd-Avd0bTRe3Qy9pPjXqWGXDOyH7LxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200094

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
Changes in v11:
- Fix kernel test robot or Media CI issue.
- Rebase onto media-committers next
- Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202610182259.q2CvO4TK-lkp@intel.com/
- Link to v10: https://lore.kernel.org/r/20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com

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
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 ++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 114 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 ++++++++++++
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
 24 files changed, 452 insertions(+), 4 deletions(-)
---
base-commit: ccf78740d63813c452c035b57d17a650492562fa
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

