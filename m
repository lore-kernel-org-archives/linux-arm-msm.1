Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500137;
	b=0upXzMZPME8qdyMiVPUcnv6/QTO1L4JJIeKWlc9WhJYOWhPz2DbF8Y2bydlbdoLahJwu
	 DnCxk5fGKi6K1rI2ZGi9J+HXsmpg3IZuHq1s7/On0apLgcPDxqlqNzzRzcs46rbBF756C
	 u8rprXguS/ybROuVy1Hovg3wGdFHvSCTCMZPDgeVS2BIJT4TVj366aNcewrnvF+HdIE5e
	 lHC0x0C/n2XrQCt5eQD9moIqsNIQmU9k/nV5TDDLtbyj8DqE6aj4ICBw9k7PA4n6FyFyE
	 hGCeZfNorTQwlSsdfmFPybw11pl3fb4QPEiOZSnu3vKQ/qupMnRKnwY/C1LJj/JwYpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
	b=C2N0qoocIlLWNrBLslTZC/JfAgVad0kJkPK7VeTbF0+zLX7hOyWa4L6d/r37w1Jz/QWC
	 UVPoxGqU5McIQwrryPU55amZ2jL2iO7QlgLbOd2NPWcd4/Vr74QBhcrAYEJ4UOnJoM+B8
	 KNfcXmIkacExNpHLMEOagSid+gtrLmJbKm0ojURj3rbusy5vJ7jfLYihYVdncuyuQ1ehV
	 9Va1js4bAEzT5hFcCEwrMH4CnBzK9cBSOliE9TTE4xxdBQT7lFk0TdMtBBQZxm2mzS0ZR
	 lzEvguBu3sRLUgHQbO8o2SZaskqBhb9EMpIJZDJuo1ROZoV9ZdbR+lEH5S13ExYq/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Han4b3j1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9i0j2XF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4978A60A2601
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4978A60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Han4b3j1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9i0j2XF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZkgs3181017
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=; b=Han4b3j1QL3ItFZa
	H3qFmKDcFOQ69n7RLBQxuWcIFSoboWfJAl2S2sk+DuQBCQqQygcHsrfKRdneCV6V
	w/V32eqG2JX2X+gv5hPhEdA0dsU+i5yOImLzhihcKIjhBW4YeySA1oW7BidYc5Gh
	elaYhqFZvXjvtBK51BH2BtsU1SMU8P260MGrmYp4R5pjJDccMFSw/cKmwI1UhiS4
	BZBeDgprwqQyn0sPjGJZpAFN7oRR+QJLOCZ1hMRJiiIszcCtZ0FyIYECJ6EtjKk4
	ujh+3SH9m1BCnyyfLaIMoCXDuANxuywY8f+DkhG+Pvq7CTI40BepaiiH7s0kAglJ
	cHAMFw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j1659-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:15:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2d8e6fe02so3090959137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794500136; x=1795104936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=Z9i0j2XFYIk5Iq420DhllFSIMcuKSP4WOAw1XhuM73jbhRbwhkUph+Y92EqKtyThgp
         ufllZMWWom8FI8d6g/8SBnDmX6YrX5DhVy8u27lF2FVehaFu/d0sicSBq/Cor7LJViVt
         UrQ5P2eaXSNhKYr1dCATtPdzxwAyYr1bGsFn4fNzcvIncOkHo6jv0Rzsr9+PWvwRKcx8
         hCoemMY82CBOpEWncdF4XPx3Oj7JLZYjCyN3JSwaH22mFCTeh9DE1tt1kxig+jX4IXC5
         iWUjBA1Iqyz1hBEDyu2WKCX9kgR977CzPBxCMTV4q5Sy3WnlZ4LApmVf0xgKrswabwcz
         xLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500136; x=1795104936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=Ro2WbjqpNxBJR/+NNHqc47YTlkFpyAOqWf/KJ3WBz0fz+YPqXWo/CxAHVeIdd4yuhm
         b2y7TR9XkENxx3h49ODOatamYuJDHPGr+NtVSoOV1lKIyo3y+v75vmIgsyGG+jUHbQVS
         fKlj5SnLPKqr6q98tNevY7anJJiE+EiYo41L7wqPkIKAMLlLzaWh+xP4vvpyLekoYMds
         W3fGQSVEnPeVP0CP5CQ2DILpMvHKQ70fr5b/lq/ws6mTOiNDCXB+iNakZXJCO/QS12Jr
         VWUkFXy7mOIERo4hCIzG04hm0inKAedPgaDRaawWUCC3kn3V0g+zovMB5lHTjPDAsr/F
         CGuw==
X-Forwarded-Encrypted: i=1; AL+hErEDlHnWO2bRuzdipb1R5F1v5LVSaUrKyKBkgRfYkGaFDFsj60G4mMi60PTzAnzKwOLJ++cOCofRwF0Uayz0@vger.kernel.org
X-Gm-Message-State: APuU4Z9NENa/GMAeg9ZxjXY6HETAtsEQORtIGZwnm2F+CjN+nu2bt1dh
	BamLegybDCRMk8t3xjtC5XUY9rbhTHTqdlYOEv+CIOKKbh5UGsQUDqDvdzVCGxbBuqLVHJptxUX
	dqfLNeDG+ummnuGst++DqdQMr0aC/rTdIbs7TXX9ERKXSVsZRV4I+nIirzKhQeBsgkL7R
X-Gm-Gg: AYBFou3DabujGbwBArRPDXVwtwXJNNrszDjVgRMJEOy9QavfUtIadQ9Sor2MlXZ8lwn
	JqqnHUdcr5N1M7iNfLskrPpMe9vyTi0invJ+dwGz7AcFTJYAzwcYMsV0HtCbO5nr8q6X19+kK/r
	1Ek+tIyevR86UYSL/qj9gyKpE+atSTyLB22TW6MBZq1dDkereRJcE9EBxgqf/+KQs/I/T/0hDAT
	2Oryfyox9fIA+1HVLE/OS6or1WI3+RNpj5vjX7vqAK9X+5rH3BC/nfdi3QymUBQ+XLquNfqxh+L
	IdAY2hewJH8z0VtSeS/3X59bDv14m+sMyFuGNKPyZdSL1Wv4NWs3FFuBOa6hjIIfzjWgeidwuS6
	mRfETMC9mFICKYwuNV+5ql0NsblXaHcaX/i5f6ujg+eL8D0yUL3tdwpfGvmrsMzJIyo0cYMIwVm
	DaGugCugI2sTmYICxidydwu27AD+WtdHWFlpg1BjZ6rm/Jd0s7CsxpjGrCJuNCJ9UE8GbVrFAFD
	GAB56Fz/+gNSL58X2KToeMAwqg=
X-Received: by 2002:a05:6102:3709:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d50617d6f3mr2905697137.28.1794500135448;
        Thu, 12 Nov 2026 08:15:35 -0800 (PST)
X-Received: by 2002:a05:6102:3709:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d50617d6f3mr2905646137.28.1794500134460;
        Thu, 12 Nov 2026 08:15:34 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm125874045e9.1.2026.11.12.08.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:15:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:15:29 +0100
Subject: [PATCH 2/2] media: qcom: iris: venc: reject encoder crop
 rectangles larger than the source
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
Message-Id: <20261112-iris-fixes-v1-2-22b759c3c285@oss.qualcomm.com>
References: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
In-Reply-To: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfX/L26Uf4Zln1Z
 hJg2pECFFWAoFh8Y5Vabf9hCt8qw3lZeqtgrpMYanYGO8EZJjp6pcIeYDhkf97CUbLMq0yE87jo
 Q31Im0y4H2DRU9PEuSDnE6HygAOfI2M=
X-Proofpoint-ORIG-GUID: 57nBuFouDXeRO3hJSC7DRiR7vVExGGqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NCBTYWx0ZWRfXwRaaj5Wle34J
 IuAptrFbH6GwOHOiSw/2fZYHW7n5SBL9NerLBgQ4Ir5bFUR+jxLUlNMHJmU/VZjq37LSN+6g1BK
 j+SSZMI3vo8iiRqPu0CEH+RCOYxR6iERPqVjJR9o9/hRLcO9k284+gqQ63/j04xQjQA3HB/CWuO
 36UiPWam6NXBDilVeI5AUz/+2DhiBWzXHpmER8jc2aODJsqC8CphooFhAHdxc797C329I/qycmA
 hW//f6g2onezKLjZnmoyOp4EV4+TBc4eal/SEWdd096V+U7NevrfUjWCjPrnQOWvsGjU6fZiFZE
 BZW+h57Sm+h8JWv8cyOgtpqIpb7QMWCh9BPml46oCpTjakD6H/UYOgzSthWwUkkUtbQ0js38Bxp
 LjgVU76f4m/P8CS0Qoa5zmGBSo/7J6jAri7fTgt39Na1gWH9HAjqr8U3NkAPqjmU7kwIiGjZOld
 JLcn9iNVbtj0n+o3LGA==
X-Proofpoint-GUID: 57nBuFouDXeRO3hJSC7DRiR7vVExGGqV
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5e628 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3rA8L1DBDF8j2ObvkVYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120064

iris_venc_s_selection() bounded the V4L2_SEL_TGT_CROP rectangle by
inst->fmt_src, the padded buffer geometry, instead of the visible
resolution in enc_raw_width and enc_raw_height. fmt_src is rounded up, so
userspace could set a crop larger than the frame it submits.

iris_hfi_gen2_set_crop_offsets() then underflows

	bottom_offset = inst->enc_raw_height - inst->crop.height;

and the encode fails silently. All ioctls succeed and the EOS event is
delivered, but the encoder produces no data and nothing is logged.

Bound the rectangle by enc_raw_* instead.

  v4l2-ctl -d /dev/video1 \
      --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
      --set-selection-output=target=crop,width=1280,height=730 \
      --stream-mmap --stream-out-mmap --stream-count=30 \
      --stream-to=out.h264

Before, 1280x730 is accepted because fmt_src is 1280x736, and out.h264 is
0 bytes. After:

  VIDIOC_S_SELECTION: failed: Invalid argument

Rectangles within the source, like 1280x704 and 640x360, are still
accepted.

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index b367367ac2ccf874a00606b8b1352fed37b37a57..1af692d10bcf77060fa95c6c3906e9067d167d84 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -380,8 +380,8 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
 		s->r.left = 0;
 		s->r.top = 0;
 
-		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
-		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
+		if (s->r.width > inst->enc_raw_width ||
+		    s->r.height > inst->enc_raw_height)
 			return -EINVAL;
 
 		inst->crop.left = s->r.left;

-- 
2.34.1

