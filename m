Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736374;
	b=LkEz7+ABU37LHJehaqLsdRYZ0kmAQVVWZHR5/lwLO9Dx5cZD6EnuwrQzBX8NBGu6q5so
	 zLrplfxsNSDU91UY0SUz9VK+RqlrKv3bX1oo53MFbAtegaIbPsXdFOFaSfzLoHttHGMZM
	 dBKoVL2F9m9tsT28bOgZ75xjemkCFRjG34dU4XOIZLtGwT4d8QGcdDt1TYYRnp32hYaNQ
	 JU3juw0FZFkZ0dEYmSlpt+4AHUP9CW+KVVrpJ84GscxqbS0ckVCt3a5TW/M0W/LlmS1iu
	 L3ykYX/8LrTYyl8mAyT5RoUHiKYoqIkGuOVYK0pG5VMkpWIZ1yd+Eggb/bainLZ2p/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
	b=AAsZZmlhGVd4rbP/T4dFCOWt0uq8mBw3OFp6VSD5rLkCC5bC+ZqJk8jAXkjdzgcCXa24
	 22+XQ1F6QBmJ7aIt9hXnlt1cHrfRW1kasqSN0OQryYw79aaE7DSS1lYxMhQbDEoV1Szhy
	 S0fsK5E/FcDmDZg0ZwmHRTjVjsE98IlUsNBKrHGEkVXTFgq9pWZ8p/vUe3SakNuC7aVlk
	 Q2VsfnzZ9GVWXaTsERcJnz4upmYBzXMWDyy7WLVR5WJZNF0GEknYbij84V+tboS5i6GY8
	 er2GppUZlhtB2YfEA4CIPt4nWuEiEebUjZiDHChaUZRyb19tsGLuqobw4zwOGWwTctg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBFK6PR4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Oev7k/iy";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15147606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 20:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15147606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBFK6PR4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oev7k/iy
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ5p02586400
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 20:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=; b=dBFK6PR4CElr6wdP
	K9yjwcnDs3qh91+iaxF2b6AhJtX439vK47QbbEgK2GgAxGTXPY+C0fX+gyRuz1IF
	EGzYSE70cZSiECFVJ01XC0GikdQQ7rgTswroVKr6ONL2QRFIIQJVmyMQUN9Kh6PC
	Lq+/9NoI243AnURaXnVa43o7TsC/XQ/Erhh0zkgbzNTne6mAbv7mS+MpTQ92sj/8
	h0tS1JepSkt6nVLU51QMG5lQeIN9r97oWMkvhhzs+evmjNDB+z327VUg4qBYoqqQ
	HeuUxHUaahDdUcWtB1BiQrumKZnNntEXg8rEvj6Ior3wTgg1G52nGqUyPbr0ZVa7
	W/xBgQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbrf76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 20:06:01 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c73709b84so3350340241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736361; x=1794341161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
        b=Oev7k/iy+FMuoBy4bZd/rVje1xl4CEZxeOp52LVvKziIu0aSpxuQzNqaps5gjmOoOd
         7K1nEAaGeSU0DusT90fs6BQK+D3Dbwpj0hj9X36vYgSwfQu20JYCUVkGcWzJZapew0m1
         9FGNEuNMB40O4/exqpx7jU578P7EyPEOzCT3pSdK703w+SFOrLQxHam+V6i7I6/QWZjm
         ++4riTp79JAUpMKbuv4JqkMgmgj4q7TsgZJatUqrGACyjSTZIlQyvx2Z9Gbe5QkRiFWy
         RTljPcjoi2dy6QnZrUht76gZyaPjBApIA8rRMB73MJNsoj2OEgMj83C30QqkRgtycDV6
         pKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736361; x=1794341161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQCnJ4CNRei6l1u7qB7F+y1q86ACcroiAcDcJoVp/GU=;
        b=yfBOxct8a5kQeBC7o/tj8r2t9P9iCMYukDCJD+cTJssvK6hDfjtVubk6tFjCht/UQt
         fc1kdtZ/CQRCR3msv4/XbCTY8VMff3qgagRXlLUfT3ZPL+YpzfIxu87AfGWZviKSm66S
         n8D7rUpXmaNV46QtUzXzUdTE7xu058AWrPYcI8cQb3oautuJuYnQFMqYQnUk16MzSCdk
         zmkshjFKEo2PJp3u8JJnrwShFwVmQTPLibk8kZrzYhcn7YzXdIhHpdHylLWIuTpyx+aW
         bsGNl5iSVmNFDA4ITzMKOkRfIEhf4Hdjorh1RKHbbKq5p8c3bYN+bDSrDA+sd2qh0gIx
         WGNA==
X-Forwarded-Encrypted: i=1; AKwUvBwew8Iv4EoZtsbb/sFQjNRaEz2DnZZ8INwtYvm+Fn7nhCKxiqxwP0kM2BLr6AN38XZAgi2mPXERw7oPdaRN@vger.kernel.org
X-Gm-Message-State: APuU4Z/RA2UCFOhF+EIJTASFoLp7xRVAzEt30fedDAhEdHOtJSOMd+vq
	gRDmWsj2560qi3o0SCHK3pIZ4e4Ao0H50RciMsMY0sf3oL1WSNrDWbHXzlMOXLYprCAvlZY1Qm8
	2CwVeaxLGXF0rKnoHpsexl5apq02NLmcHUAgmksevjqkDYffssG6/+xqRelujjLvzmZYJ
X-Gm-Gg: AYBFou39xzty4soRns9eX2mophZ4jtKma8ewJyqSdf6wU/P+HrztCOMckUBFI7v3Efm
	9wUxNA3H330fjS/VYxry/EU2mvokWr7BuxlkVDMaefaExXJT+GpR662A7rkkzkd/SZPoI0z87qu
	arX+DhA46vKvSLlaJDUh7Fda2kke9ZGUN4TWmyd/bfTGi5rIF4pl9R+NzE0VOIL9enpvrTpXbsL
	3o13pIgZUj9r4Jn1pamOHLBt/NI5CefjCGAD57kbUZ7JEIBcxU266ZHFkI0mx3GOavtGtrvsGw/
	iTZovNwD+dwnMs5a5eYaUyDj5/futY9P/zlZXyhbPYmjj8JKl7CMGGWxp1sfju7Cjddb+PVFgi0
	VIceOz/t8aQlwjGmU4csIk3pDIeAmREUqX791DCG1eyzCZnTn7eK9Uglwa+POy1Zv8UIbCCIV95
	1DWDrvi2MGZcGW3GlucyRQGiAA7nyDWAE15GI4rC/gKC4PN9nt917vZ0JOocN8jXfBMy0Vy7ffb
	SLTEvf0SLp8ZRrKja1i2AcChE1h
X-Received: by 2002:a05:6102:149c:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d072247aa7mr6264115137.5.1793736361080;
        Tue, 03 Nov 2026 12:06:01 -0800 (PST)
X-Received: by 2002:a05:6102:149c:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d072247aa7mr6264086137.5.1793736360431;
        Tue, 03 Nov 2026 12:06:00 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:59 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:49 +0100
Subject: [PATCH v13 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
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
Message-Id: <20261103-camss-isp-ope-v13-5-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: P70miw9akjXHnd_4dbielBQOlDCAQUQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX+LBBfoJpaFMt
 aou5gdXRiWNKjXv3xNURnZKmTVvJS7PCHsESojEbOkaMfqmXaF5dAT68jfKUA++3o9BVLFpqSy7
 Ujf3ooBvDrKBH8xQxD9l46Yi1uo1bCQDad8Ak/uBZhjYSUNIIinX9tY3qsdURvQEpfhD3lGmvS0
 DezGk0Z4ROGt191jCvAMS89EJZsZSKj7iO2S5LErKPM2QRry0tfAEnNL3AqfuHymTee60XVlvD4
 lyQ/gylQc5e7vra9XzOa5Oy03cs0S/6kq0Ah/ADwjdG8ucwvwsLZfIsmCMCDzlTd+TFNM0LjG7G
 RM/o9V60mXP5HmeMhfnxEwVMhcAhQTyANlh1fjz0HS9zxvoOcrBhYWM6ntv0UwChjbIebfXJbkq
 ejD5hM4LF+wLnG6es/kvdsAAzYSyZO+I3+n0Pj6WjnfeY59DCzEY7kSsQrisZs6BcpHJ35BfGfs
 mk3MNk1u3uPeKJAHoIw==
X-Proofpoint-ORIG-GUID: P70miw9akjXHnd_4dbielBQOlDCAQUQT
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea3ea9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Nff7jVtaK1xTle8F27sA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX1ipiENjVHWEy
 cPTg7pESM5gyHYhDwaEWK36as/92BOl+23mxar6gr/H+CmBL5/oMPqQ/GatnvwVjNY2dNXMrhhz
 F/fuzqwMbQt9DFRhZ5gKgLtPoeunyko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

Add documentation for the Qualcomm CAMSS ISP parameters metadata format
(V4L2_META_FMT_QCOM_ISP_PARAMS). The format is built on the V4L2
extensible ISP parameters system, with per-block structs defined in the
qcom-camss-config.h uAPI header, and is designed to be shared by any
CAMSS ISP engine exposing a parameters metadata output video node. The
Offline Processing Engine (OPE) ope_params node is the first consumer,
with additional engines expected to add their own parameter blocks in
the future.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   | 147 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 149 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index b5455229837e707c24e134438d5e2fd12cb3bf37..25b46af4d9f7faab37000076c530e9aad5b4a076 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -20,6 +20,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-intel-ipu3
     metafmt-pisp-be
     metafmt-pisp-fe
+    metafmt-qcom-isp
     metafmt-rkisp1
     metafmt-rppx1
     metafmt-uvc
diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..da0dd9b0884ea8b3c5fba7b5aa2eb1af80418cae
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
+
+.. _v4l2-meta-fmt-qcom-isp-params:
+
+**************************************
+V4L2_META_FMT_QCOM_ISP_PARAMS ('QCIP')
+**************************************
+
+Configuration Parameters
+========================
+
+The ``V4L2_META_FMT_QCOM_ISP_PARAMS`` format carries image processing
+configuration for the ISP engines found in the Qualcomm Camera Subsystem
+(CAMSS). It is passed to a metadata output video node using the
+:c:type:`v4l2_meta_format` interface.
+
+Rather than a single struct containing sub-structs for each configurable area
+of the ISP, parameters use the :ref:`v4l2-isp` parameters system, through which
+groups of parameters are defined as distinct structs or "blocks" which may be
+added to the data member of :c:type:`v4l2_isp_buffer`. Userspace is
+responsible for populating the data member with the blocks that need to be
+configured by the driver. Each block-specific struct embeds
+:c:type:`v4l2_isp_block_header` as its first member and userspace must
+populate the type member with a value from :c:type:`camss_params_block_type`.
+Populated blocks must be placed consecutively in the data member, and the
+combined size of all populated blocks must be set in the data_size member of
+:c:type:`v4l2_isp_buffer`.
+
+The set of supported blocks depends on the CAMSS engine consuming the buffer.
+The block definitions themselves are shared across CAMSS ISPs; currently the
+Offline Processing Engine (OPE) is the only engine consuming them, through its
+``ope_params`` metadata output video node. Additional engines and blocks may be
+added to this format in the future.
+
+A block carrying ``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE`` bypasses the
+corresponding hardware module. Any other block updates the module's
+configuration and leaves it enabled. Blocks omitted from a buffer keep their
+previously programmed configuration and enable state; until userspace submits
+a block for a given module, the driver's default configuration applies.
+
+OPE processing pipeline
+=======================
+
+The OPE is a memory-to-memory engine that reads a Bayer RAW frame from its
+``ope_input`` node and writes a YUV frame to its ``ope_disp_output`` node. The
+parameter blocks configure fixed-function hardware modules that the frame data
+passes through, in the following order:
+
+.. code-block:: none
+
+	 Bayer RAW in            RGB domain                      YUV domain      YUV out
+	 (8/10-bit)   +------+   +------+   +------+   +------+   +------+   +------+   (NV12/NV16/
+	  ----------> |  WB  |-->| DEMO |-->|  CC  |-->| GLUT |-->|CHROMA|-->| DSC  |----------->
+	              +------+   +------+   +------+   +------+   |ENHAN |   +------+    NV24/GREY)
+	                                                         +------+
+
+The stages, and the parameter block that configures each one, are:
+
+.. flat-table:: OPE pipeline stages
+    :header-rows: 1
+    :stub-columns: 0
+
+    * - Stage
+      - Module
+      - Parameter block
+      - Function
+    * - WB
+      - CLC_WB
+      - :c:type:`camss_params_wb_gain`
+      - Per-channel white balance gains and black-level / pedestal offsets,
+        applied to the raw Bayer data.
+    * - DEMO
+      - CLC_DEMO
+      - *(none)*
+      - Demosaic: reconstructs a full-resolution RGB image from the Bayer
+        mosaic. Always enabled; not configurable through this format.
+    * - CC
+      - CLC_CC
+      - :c:type:`camss_params_color_correct`
+      - Color correction matrix applied in the RGB domain.
+    * - GLUT
+      - CLC_GLUT
+      - :c:type:`camss_params_gamma`
+      - Per-channel gamma correction curves (256-entry LUTs).
+    * - CHROMA_ENHAN
+      - CLC_CHROMA_ENHAN
+      - :c:type:`camss_params_chroma_enhan`
+      - RGB to YUV color transfer matrix.
+    * - DSC
+      - Downscaler
+      - *(none)*
+      - Chroma (and, when required, luma) downscaling to produce the requested
+        YUV subsampling, e.g. YUV 4:4:4 to 4:2:2 (NV16) or 4:2:0 (NV12).
+
+The input node accepts 8-bit and 10-bit packed Bayer RAW formats (for example
+``V4L2_PIX_FMT_SRGGB8`` and ``V4L2_PIX_FMT_SRGGB10P``). The output node
+produces semi-planar YUV (``V4L2_PIX_FMT_NV12`` / ``NV21`` / ``NV16`` /
+``NV61`` / ``NV24`` / ``NV42``) or luma-only ``V4L2_PIX_FMT_GREY``. A
+configurable stage is bypassed while its block carries
+``V4L2_ISP_PARAMS_FL_BLOCK_DISABLE``.
+
+The following example populates an OPE parameters buffer with a white balance
+and a gamma correction block:
+
+.. code-block:: c
+
+	struct v4l2_isp_buffer *params =
+		(struct v4l2_isp_buffer *)buffer;
+
+	params->version = V4L2_ISP_VERSION_V1;
+	params->data_size = sizeof(struct camss_params_wb_gain) +
+			    sizeof(struct camss_params_gamma);
+
+	__u8 *data = params->data;
+
+	struct camss_params_wb_gain *wb =
+		(struct camss_params_wb_gain *)data;
+
+	memset(wb, 0, sizeof(*wb));
+	wb->header.type = CAMSS_PARAMS_WB_GAIN;
+	wb->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	wb->header.size = sizeof(struct camss_params_wb_gain);
+
+	/* Unity gain on all three channels (15uQ10, 1024 = 1.0) */
+	wb->g_gain = 1024;
+	wb->b_gain = 1024;
+	wb->r_gain = 1024;
+
+	data += sizeof(struct camss_params_wb_gain);
+
+	struct camss_params_gamma *gamma =
+		(struct camss_params_gamma *)data;
+
+	memset(gamma, 0, sizeof(*gamma));
+	gamma->header.type = CAMSS_PARAMS_GAMMA;
+	gamma->header.flags = V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	gamma->header.size = sizeof(struct camss_params_gamma);
+
+	/* Identity curve (pass-through, gamma 1.0) */
+	for (unsigned int i = 0; i < CAMSS_GAMMA_LUT_SIZE; i++)
+		gamma->glut[i] = gamma->blut[i] = gamma->rlut[i] = i;
+
+Qualcomm CAMSS ISP uAPI data types
+==================================
+
+.. kernel-doc:: include/uapi/linux/qcom-camss-config.h
diff --git a/MAINTAINERS b/MAINTAINERS
index e4ca41cdd8729625fe2f731cd443bdd4da527dca..234c4c69dec7e7264763f1970438c22d0cec11a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22908,6 +22908,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
 F:	Documentation/devicetree/bindings/media/qcom,*camss*
+F:	Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS

-- 
2.34.1

