Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912427;
	b=e6d1cYgDmz1YNpiTXVt8gIHQr/MY9aRsLwuNM31Klq3wtvUlBb24NlbDxJYqwpZyQhuU
	 w24g22T9xEGES4vqr9YuzxyXeQgbrNwJvrwSnXgNShFGXC6DsNbvlxHm2zcECFY7kGk/I
	 xp6+eMecQDR6IX5yjCifzMdZhR+hTMwHmdS/1WIhE+fmCpGTjKLr6zWkSh4fyxUiC4Zgw
	 EjswVdbt7Pmc7Tl08wZBUjUhaywRFTiDO3L4kQXRbQp+eyHbSIH3VFiDMGij2M94e6O28
	 h4umDAVyAoIAiJH4UUwps16riXHCjBtqjyJ6jruj9UtgJsQt0Ub5uIEEM6WYys7ZFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
	b=zNlT5FXUWcuVv16VthorSyJmP/4iaP3VvgxQ49+W9F6C1XnqNB2/iIY6ArF6PsxY4Mxy
	 C+8cNFLR2NVk62s5ch/EE/XEkLpj+pcY+Tf1kY5wWVrGntRihm/hkjlSzknBC2m8hftRr
	 PIP2CdWQPQC9/B7c8qHBQlSDV8JPCEEvjUthPtCXGayGbXw9rVMbkozm+DKM5BwdEQKaI
	 XKnIyfHqcR92zLhnVD6796OdHu8LaETCdH6Q1Pg/8eKumT+8ixwieT2EdTm7cva+/EwIU
	 xWPNNuZJacSeRwBihioDivgxnRLGpBdeyyQ5OL1tY91p68KG+sUxsrHGZISwmVeWksA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfdiHtmI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMTUUIjV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E48606A8A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E48606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfdiHtmI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMTUUIjV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHA56bt2791754
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=; b=VfdiHtmIg6Db1BiO
	mrffSkLDi36r8Fi1hVhk55DQ03HmiuecR8GeeFPhxhwT+wl8PP/8VGV+kadhpsY8
	WExf1/+tRp8evBFfTWYQX9NgsgBHvlWxG6XxP889MPPIH7/hSPSE3F7efB14+nOn
	MOldFl1O5sUgwmBqNVithNiNRUHmnbxqdKsdmS1BqXs/Q47pxA8o3Fjrf/bRHfoy
	x6yD6Eksjl4YJa95QEyZrLP6GODX1eiJQXS5S+/2ezf1llAGeYcpYGYPjkFcgxXI
	FVsb5miAYbhQLZ2NbD7cKMthUBa/c4weczYTY4YyyNPufVB00ayT0yPnmyq3psQq
	jnqqHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv105ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:47:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so147351285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912425; x=1795517225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=jMTUUIjV4Q6R38fGmxmWHFsGU9jRh99nJFc90Bryns3X4ynDI8PN8d6wTrdkB57ie5
         h/vlNfo5gJ4C7QYy8bItk/AJwRzTAyaC6jv3EA1315T6oXtA2bJYrX9frgyrVb9NiRJN
         OKes3WCbzmVzen6/WbRM4ywHIHa8rwmlygQpOGWx/UmuTca+1pCo/WHWHRDY7hlwUe5/
         TXI9rR4RH8DMwjHn8oUjlSJfGcEYuhEPBHP0asYzdFZasdOQRxmfJXwXGpkXpbR9gNcf
         fo/SqUhptAvlilDU4U8pbqxytz935RiZ6+VrLqwdcke1BQVD//9br1E94eerYagNjkJ6
         5n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912425; x=1795517225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPN1A3LUSMVaEF+VRfUDGDxoK9kSV5PnJynpLd7uipI=;
        b=yyrWgEvj1SHq+FTR+NpNYerfYC6izuKm6AH4/J1bHpChQboRBTMlDYpSduHP+tUcqc
         ykYtRdU+/kNoSPCF2PTKGSN7l9lZpm8ZsDThUCj9g9Ww1fhCITwZy3gmJDH0wYN5Noj4
         PjcUaB+BgEOxHl7Wf3lDEPc2nnjyoBZ9AkBaRCKqT6DwvtBRboEU55GZuk7bSQ1EbZ9x
         /q15Jrw9TWS1adszi3B+UOIb1YVRxTy16G6tI0+zQ6RvRv35SiGa2WJ2TczexBdKdJJT
         tq3AqMKy2EaahA4u8ZOK2D5xTUklqcLIDk0z3YpZdtXC1gi2+Pu3LabsoJMpbRLE9tqo
         CFng==
X-Forwarded-Encrypted: i=1; AL+hErGhlF3WaI/0yvFDO5QZHuoIf623K5Ne3/PvE2rWQK4talbicirvknl6Ti3FNGRaQ63aJ256XnO8ZqrjYSkj@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sqp7xPAa8IOZoQU0Eo6+yCyAZTix45Oog/2NCoYsbzkCkMzE0
	u3/w65wWBMfpEcvgj0lpPa2HQWdIaTa3tHbgM2TI9MCOjbNs3GHX708yRfammlvtfo3yjBhxiMa
	/N1bq+xuMibfqKNz9KSqsjS4vR0r+XZd5QF0qEkyT/HPp4m+PIu/LuGlTHfu6KWNpOnG+
X-Gm-Gg: AYBFou2XaDVlPHVQCAwQDNo4hnclQu8mxIJSdA7MgRdMJbSqRqU2zbPZRdubwIddbl2
	iQAekxhTcSkntrvcy4rGLZtLJ/HPy1Yl8NyBIBIlPQJKJMlZwkJWczkdGEWZ2NFrZmCasEZvbZ6
	nBbZ148HFb8DA0XmlY/dVCvrtu2xxC7B55Ey3i3C3jYT1OMmbwm+9vgVz3IXBjMmCJeVI29mS4j
	RvVQkWgt2TorkPkswcK9KC9mm9YF0czs+MQNw6l37gMWqhxo0sp/HRZ7VP3qHJB75D+wGIcvffH
	ZEAcj8mgXlEZjBSHtMsVkjEmaP/77pv7Tpo6VdI0oAWCpxVTanEUaul1z+6sKtmmz1xAvL0UV2p
	GUDN0HXLzNzqDR9A0IYd5j5O8mwif3/x/3GaIfsiaDD9uucfu+gGcqSALtFhubj9HJ9XmeHq0OQ
	Th2fXQe4OmGljTz/c1XMpNzm025KaKg4xmFOupr7xhnQd/kARmYIKi0LKq4tJVRU8zfTaqqbq+M
	k4UpOSStVeKzH7FRW3m1frFL/g=
X-Received: by 2002:a05:620a:6884:b0:949:589e:4bd5 with SMTP id af79cd13be357-9498b8ef60dmr332824985a.23.1794912425390;
        Tue, 17 Nov 2026 02:47:05 -0800 (PST)
X-Received: by 2002:a05:620a:6884:b0:949:589e:4bd5 with SMTP id af79cd13be357-9498b8ef60dmr332821285a.23.1794912424899;
        Tue, 17 Nov 2026 02:47:04 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm119178335e9.5.2026.11.17.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:47:04 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:46:55 +0100
Subject: [PATCH v2 3/3] media: qcom: iris: venc: reject encoder crop
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
Message-Id: <20261117-iris-fixes-v2-3-0b21201ab137@oss.qualcomm.com>
References: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
In-Reply-To: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
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
X-Proofpoint-GUID: 99I6pEoPB6KnnIvta1_ZxAdAwvq5Gj8G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX8JWvtNxUDYF+
 /FpqY1XvrjhOKJ9kN7jgaCPIdEZ6p6L958ONVH+nEu4eaS6ZtuBDTdoSi27RR85q2NvoPgCHxTj
 x+QmfeRZS8kDos1bF/kPwiQQduMmXxM=
X-Proofpoint-ORIG-GUID: 99I6pEoPB6KnnIvta1_ZxAdAwvq5Gj8G
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc30aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3rA8L1DBDF8j2ObvkVYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX+ZPIMGrdPj8c
 JANt0WaveUt4A+x9DvCz16JP7nygJ7itNMYhLmLVk3JxsJ7EWm4bt/WT8l+UIEzyr5tColtxLLS
 8i6XnIwD42Org/f+OqL5fHmJeh0wmejC/j1jvI1UmOlLfsqgUIuZoiHVsyJ2avWqxEp+4QYlfxn
 wmdSah7epLR+eFk56XWYJAVoDfJXSmgk5FPXMjjyxUjcC0arpmolwDRWcTRWRaDdzkngdYUBAdn
 PTSQ9FeKN6gMkDC9RR0Sqnk7CUTj0SJuQEez5LvbzVLlzLRKDmfF+IhmNotafvOtLJX7bYJDTMU
 10q2b3vfPyYXo9jCyc7eqNVKSrCxOpdoP28ABgbFYBZSChPL6kXCuk/5cMrsI4HvgLkwx0Iyey5
 m8TZtM4KlHA1rObGqgpAi7C49wVV4ULQTViLr6DTPEfMiedt9ybiqgnop+eRyXzqTcIU1x8D5wT
 BU4f6h9nPmjSqTm8JAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

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

