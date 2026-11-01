Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571876;
	b=dsTnTztuThfdcXSkul2xNCdyhcFONdltL5M+926/v6sObK9sll4NXr1nFIvCX+gT+rmm
	 YkGfQEm+iR1GmtrlRUHFtKDUTycurFHSqb3j/z+dbpfwrJHCIk2z16meFNgW2iXRCYH6K
	 4IRnQcThV3hMqbL3PuW3gNO3pnCDGpM8pFMx0WWzgQFBnotBPrVLqYstevAQDPnB4+bXq
	 V54SVknagOrog91t6JlviX6J/bJnCQYDEqylgxYa9jWRnbkaYOU8bDtEs2sIWmw/+kTcl
	 Nz+uFm+6IKzjmzOSKI8jYydFc5qoGp+n3lg1EeNcbNp+kMhdQbKCrgcjFI4QDLi993Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TTszSOUcL92xgCOH6A/BIOn1y2Ws5XIn84vLBUhI7Hs=;
	b=ILZYq3JuSZb/vQ6kx5NG45GSUgxxz0eWdn8WTkRwoM9vRbi7O8Im/BB9vV6muGFjVViU
	 f0rujP1CFPsTh0GjbPhed++7gwyZcfKWNEoVwuijwbIIl5Co6Bg7DowgWY1eQTh0RSi71
	 zcP1PkstXIPQrX3S0t62A3JRrORSH4AoNz/BXkakUs0U29z7+x48zv2nYP+L4tDW2Mn91
	 MVlr7hiJspAccCwgpgI2TewSXYtigXPEGxrlnYYAwgr19F4g0mIPvEzFOQzaaEbCzqufH
	 RWt2lFqy+9GHt4Rqix7mSwe3nsJpV8N6Q+Lz7qIfu4AwQ1ol8PGJXg75tCIAhdu4ALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DR3HzIQo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TYG/uBKE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF3606A6CF
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 22:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5AF3606A6CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DR3HzIQo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYG/uBKE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KJx531801066
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 22:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTszSOUcL92xgCOH6A/BIOn1y2Ws5XIn84vLBUhI7Hs=; b=DR3HzIQouOOfoe5r
	IBUOhBoN8Vpuz/QW0gjucKvMJ43N8EGZaAWMhAde0KMDKQk+EzPKY5lM8/ibtsUE
	oen98avJK478Q7gQ5004BuMUXvCKIj1GMAGO6fOOyF2O4/AMoI+M2fEyoFbWeTFJ
	+aeKm5+44BuSuk1NHSEQoXUzYDiXEpJ3yVevHNOg6rey/qXDuLldYtHRu4Lt5lWc
	QlEp/R1Cw8UBPkXmK0O5JFNXc0Ku6tN/+lYW6h1bMVPSjKd86NNDtHUykyDo3BFB
	xWRmbj9DQqGTvOoY5bgU1IGB35fH4tIeUFyiYka4DmUlW1jyHkuRsYRAJ6C6QHaM
	45FA3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8duca5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:24:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so10460291eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 14:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571874; x=1794176674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTszSOUcL92xgCOH6A/BIOn1y2Ws5XIn84vLBUhI7Hs=;
        b=TYG/uBKEOXHdMfnhncd7y22OINsDqxyzmJjGGJ0cBqtSHqzy45GcskSNP/wASu4X+h
         b43KQm4lPpp2t3gARHnB9OT89wQxmAe3B4JKmgkb3teV5eGE8fHZ9uMo9MVVncRXb8/g
         T1njQCXczNeIPVhmHvLkQSZl8za77knrPd5GS4yo4Lx9impQBXwkUyaIFiJVh7CsEbit
         ElXCQHutlmrS0y3EYgAMZnBA+1cDqAPd2z9t/BjJQoh1jVYp8J5CZsp9a9LGpfWpAsEL
         BHsB3TwFt91/AqmUnzakTRMUoGONUCHYVClsypThoEf5FgqzrV42fTi4HyX8kDvp+jnP
         m+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571874; x=1794176674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTszSOUcL92xgCOH6A/BIOn1y2Ws5XIn84vLBUhI7Hs=;
        b=IabjUY0FYagiaK6L1ry1HWOoWj3dAZRG9b4XoamXbjxw7gfxp/zIcsGzJoy8c6SL/L
         cdJQZ5ii9RpUlXlhhb3jv6p+owQFUgVYx5LRka9VxsFeIdBHezHhRfB0i92iVUHdLqSB
         w7OUKV3QySYsjg15z4NtI3czknrq2qdG+nCywKCjrSqADvg908YZs5rQWw1l+2Gqz+qE
         VWZqkYaLQvnUeb097dkvwB5xMT6xW18M4nB9Qxi7XyB02+miMcxOH83NLGDARdQ3jJIU
         +tsBCsdUbKz7TNLee4FKr5/J4XOvmcad9OzrfHNt8KRTDrF25KzS/rKHUJfCae88H+wR
         P/gA==
X-Forwarded-Encrypted: i=1; AKwUvBw2OLu4KbQoGx2zKpFCNASiPz5CE17GgVrGVzw96bXwT8dCofewzUXgfhfS9ASwpgoWYTXQ6kBew1Td8WDj@vger.kernel.org
X-Gm-Message-State: AFq9FYKFp6DlEn0lWVEX0c1gey9iyT8lB91SUCUQ93DdaYQmVIQxdhvG
	fNz3+s/eUUF5NtxxBzt98aDTWrQZVnshoKJKAp3Bw0KrAMrrsxaKwKywNfTBf8J7fzjnynEwWzY
	DRBnJ3o+byM2tt3ewrzhF16bvp1eje2QPB8STJslBXwS5Nl8fNVJp92BEcek5uTlwAo9c
X-Gm-Gg: AYBFou2x/n1e3tYHkt8n2KI7sdJAyQq8aOgGcTlWsimsyY4gMJcmCKLqjXAuoqRFfXu
	mOgyGmYXE+Zpo4IByclE89gtPo3Bwu+QCdYFZyx20p42xi5V93pILHtKGwZo6wrb9H/SXamvImk
	AS4fhGBSKgufu+LWSWAj7G3EOFXiEJzKAyHKga/Wn/dg2eT0xQc3jeexSjdji0eVp39cQleg7YK
	81+zIptVf54zKnlwwiQcdsCyHSuc2KCKuUrOM+H4vA/qZ36z6EyaCviSrS/NvG5TfFIBLiLrSMa
	XIssCsvz5UQVJoDWUbCVrhzMfq1FwJyFYn8LAcYY78R5/DiryK2z+DPQp2MkZoKPnaP46tBoPnn
	o8xnL7thmsQhSLR0c+5c9pJMVrhHoDLCyUWMwYWpPq2a4+vqrcjxtY8O4b2faGTMsdoaFxMj3SE
	THbv2eCA==
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr13321967c88.22.1793571873324;
        Sun, 01 Nov 2026 14:24:33 -0800 (PST)
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr13321942c88.22.1793571872650;
        Sun, 01 Nov 2026 14:24:32 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:24:32 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:30 +0530
Subject: [PATCH v4 17/25] accel/qda: Add remote memory mapping to the DSP
 address space
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
Message-Id: <20261102-v4-v4-17-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=17614;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=IY8YP1W87/PSOoOD1olmTGLDaQ/HCpg3z9eht05ezIY=;
 b=n4Z3LYR1RSpuI1/T/wnDcSRFsqZ7ci5nEp71N9Rd+L8KQ+c8QxhNnm2+4jE0ASlg94hRq29FX
 2idyv70a+A0Cnpln14IiLgbOIchczjkkXzAldDXnr3QBwnnfKZRiRbF
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae7bc22 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-75RLJru0wMfK1LY92EA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: EQyaAAHWodVhkGBcGTVtZHaMFyTjKnGb
X-Proofpoint-GUID: EQyaAAHWodVhkGBcGTVtZHaMFyTjKnGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXxTsyVGJnw2Kd
 //jJ18hN/lqEIZXWPUYezccUX5COXeAF/M9MAf0oRt6/dZyWXzA1j+RgKNTyvkOfXVKk36ZVC0z
 GUDW+HPaaUyGJQ8+3uNRg8up+XLhMfO4TIML9UHrwfDIPz2DefXqIAcMWh88yve9vLpiK/WcMYQ
 JwldXHAfUh5EBFf3mf+FBIGXECPQLMMZwU8kKn+BPwn8CAAGBDyQyH0unbvhWF2I4Ii80GeMbf1
 QOjWD078wnB1ossxBF9wmPPc2lcHCYLtQcbyv4H94JMYKy7H2YlOygoCH//UWdIACc/R52l9HEz
 f0V/HqK3sPYtTEPUKrm8kjyr2Te+LlTkG93a2DgDlAdYuJv0mHj7KTjGM8ePDTPi23AtSBud8Qe
 lZZ191RdAj/r/KA1gVy6QZfxjU9nnr6xHStBVqCPabry+gZAji5gehuYt6dtFJ35vnWpTpkRb/m
 hXpPrgcYbUTYfYli7Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX+IcPbYn29nGM
 +b/AWTh2yywJJKLQQkeFcoV4Rz4S2IGmoUR2Fl2hV05PnnFhEDZzqIa44zQ54xp/0H8YYyViZbt
 /vVnSIhG7f2ppWiOBQzMi2FuUZ1KBuE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

The DSP can only touch memory it has been told about, so user space
needs a way to make a buffer visible to it ahead of time rather than
only per call.

Add an ioctl that maps a buffer, named by handle, into the DSP's address
space of the calling session and returns the address the DSP will use.
There are two flavours, selected by the request: a plain mapping of the
whole buffer, optionally at an address the caller suggests, and a
mapping of a region of it with caller-chosen attributes and a buffer
identifier the DSP tracks.

The length of the mapping is checked against the size of the buffer, so
a mapping cannot be described as larger than what backs it. Buffers are
looked up in the calling session's own handle table.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |   1 +
 drivers/accel/qda/qda_fastrpc.c | 190 +++++++++++++++++++++++++++++++++++++++-
 drivers/accel/qda/qda_fastrpc.h |  51 +++++++++++
 drivers/accel/qda/qda_ioctl.c   |  25 ++++++
 drivers/accel/qda/qda_ioctl.h   |   1 +
 include/uapi/drm/qda_accel.h    |  36 ++++++++
 6 files changed, 303 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 983c6a3dcfb4..7f19380701d9 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -125,6 +125,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MMAP, qda_ioctl_mmap, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 35ce60f3de2e..744d7317cbe1 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -3,6 +3,7 @@
 #include <linux/bitfield.h>
 #include <linux/capability.h>
 #include <linux/dma-mapping.h>
+#include <linux/limits.h>
 #include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -251,6 +252,9 @@ void qda_fastrpc_context_free(struct kref *ref)
 	if (ctx->init_mem_gem_obj)
 		drm_gem_object_put(&ctx->init_mem_gem_obj->base);
 
+	if (ctx->map_obj)
+		drm_gem_object_put(ctx->map_obj);
+
 	if (ctx->session)
 		qda_session_put(ctx->session);
 
@@ -326,7 +330,10 @@ static struct qda_gem_obj *alloc_kernel_gem(struct qda_fastrpc_invoke_ctx *ctx,
 	return to_qda_gem_obj(gem_obj);
 }
 
-/* The context releases whatever has been allocated here if a later step fails */
+/*
+ * The context releases whatever has been allocated here if a later step
+ * fails, which needs @nscalars to cover every slot that may hold a reference.
+ */
 static int alloc_kernel_args(struct qda_fastrpc_invoke_ctx *ctx, u32 nargs)
 {
 	ctx->args = kzalloc_objs(*ctx->args, nargs);
@@ -337,6 +344,8 @@ static int alloc_kernel_args(struct qda_fastrpc_invoke_ctx *ctx, u32 nargs)
 	if (!ctx->gem_objs)
 		return -ENOMEM;
 
+	ctx->nscalars = nargs;
+
 	return 0;
 }
 
@@ -613,6 +622,37 @@ void qda_fastrpc_flush_pending(struct qda_dev *qdev)
 	}
 }
 
+/**
+ * qda_fastrpc_return_result() - Copy what a request returns into the ioctl data
+ * @ctx: Invocation that completed successfully
+ * @argp: Kernel-side ioctl argument buffer owned by the DRM core
+ *
+ * Buffer arguments are written by the DSP straight into memory the caller can
+ * see, so only the mapping requests have a value to surface, which the DSP
+ * wrote into the response slot the driver built for it.
+ */
+void qda_fastrpc_return_result(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_map *margs = argp;
+	struct qda_fastrpc_map_rsp_msg *rsp;
+	int idx;
+
+	switch (ctx->type) {
+	case QDA_FASTRPC_RMID_INIT_MMAP:
+		idx = 2;
+		break;
+	case QDA_FASTRPC_RMID_INIT_MEM_MAP:
+		idx = 3;
+		break;
+	default:
+		return;
+	}
+
+	rsp = (struct qda_fastrpc_map_rsp_msg *)
+	      ((u8 *)to_qda_gem_obj(ctx->gem_objs[idx])->virt + ctx->args[idx].offset);
+	margs->vaddrout = rsp->vaddrout;
+}
+
 /**
  * qda_fastrpc_invoke_common() - Shared tail of a FastRPC invocation
  * @qdev: Device to invoke on
@@ -890,6 +930,148 @@ static int qda_fastrpc_prepare_args_init_create(struct qda_fastrpc_invoke_ctx *c
 	return err;
 }
 
+/*
+ * Find the buffer a mapping request names and describe it to the DSP. The
+ * buffer is held by the context until the request is done, so that closing its
+ * handle meanwhile cannot free memory the DSP is being told to map. The
+ * region must fit in the buffer, as the DSP would otherwise map past its end.
+ */
+static int setup_mmap_pages(struct qda_fastrpc_invoke_ctx *ctx, struct drm_qda_mem_map *margs,
+			    struct qda_phy_page *pages)
+{
+	struct qda_gem_obj *qda_gem_obj;
+	int err;
+
+	if (!margs->handle)
+		return -EINVAL;
+
+	err = get_gem_obj_from_handle(ctx, margs->handle, &ctx->map_obj);
+	if (err)
+		return err;
+
+	qda_gem_obj = to_qda_gem_obj(ctx->map_obj);
+	if (margs->size > qda_gem_obj->size)
+		return -EINVAL;
+
+	pages->addr = qda_gem_obj->dma_addr;
+	pages->size = margs->size ? margs->size : qda_gem_obj->size;
+
+	return 0;
+}
+
+/*
+ * INIT_MMAP packed layout:
+ *   [0] req	sizeof(qda_fastrpc_map_req_msg)		IN
+ *   [1] pages	sizeof(qda_phy_page)			IN
+ *   [2] rsp	sizeof(qda_fastrpc_map_rsp_msg)		OUT
+ */
+static int qda_fastrpc_prepare_args_map(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_map *margs = argp;
+	struct qda_fastrpc_map_req_msg *req;
+	struct qda_gem_obj *kernel_gem;
+	u8 *gv;
+	int err;
+
+	const size_t off_req = 0;
+	const size_t off_pages = off_req + sizeof(*req);
+	const size_t off_rsp = off_pages + sizeof(struct qda_phy_page);
+	const size_t total_size = off_rsp + sizeof(struct qda_fastrpc_map_rsp_msg);
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_MMAP, 2, 1);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 3);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, total_size);
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+	gv = kernel_gem->virt;
+
+	req = (struct qda_fastrpc_map_req_msg *)(gv + off_req);
+	req->remote_session_id = ctx->session->remote_session_id;
+	req->flags = margs->flags;
+	req->vaddr = margs->vaddrin;
+	req->num = sizeof(struct qda_phy_page);
+
+	err = setup_mmap_pages(ctx, margs, (struct qda_phy_page *)(gv + off_pages));
+	if (err)
+		goto out_put;
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, gv + off_req, sizeof(*req));
+	assign_kernel_gem_arg(ctx, 1, kernel_gem, gv + off_pages, sizeof(struct qda_phy_page));
+	assign_kernel_gem_arg(ctx, 2, kernel_gem, gv + off_rsp,
+			      sizeof(struct qda_fastrpc_map_rsp_msg));
+
+out_put:
+	drm_gem_object_put(&kernel_gem->base);
+
+	return err;
+}
+
+/*
+ * INIT_MEM_MAP packed layout:
+ *   [0] req	sizeof(qda_fastrpc_mem_map_req_msg)	IN
+ *   [1] pages	sizeof(qda_phy_page)			IN
+ *   [2] empty	0 bytes, which the DSP requires		IN
+ *   [3] rsp	sizeof(qda_fastrpc_map_rsp_msg)		OUT
+ */
+static int qda_fastrpc_prepare_args_mem_map(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_map *margs = argp;
+	struct qda_fastrpc_mem_map_req_msg *req;
+	struct qda_gem_obj *kernel_gem;
+	u8 *gv;
+	int err;
+
+	const size_t off_req = 0;
+	const size_t off_pages = off_req + sizeof(*req);
+	const size_t off_rsp = off_pages + sizeof(struct qda_phy_page);
+	const size_t total_size = off_rsp + sizeof(struct qda_fastrpc_map_rsp_msg);
+
+	/* The wire field is signed */
+	if (margs->offset > INT_MAX)
+		return -EINVAL;
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 4);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, total_size);
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+	gv = kernel_gem->virt;
+
+	req = (struct qda_fastrpc_mem_map_req_msg *)(gv + off_req);
+	req->remote_session_id = ctx->session->remote_session_id;
+	req->handle = margs->dsp_handle;
+	req->offset = margs->offset;
+	req->flags = margs->flags;
+	req->vaddrin = margs->vaddrin;
+	req->num = sizeof(struct qda_phy_page);
+	req->data_len = 0;
+
+	err = setup_mmap_pages(ctx, margs, (struct qda_phy_page *)(gv + off_pages));
+	if (err)
+		goto out_put;
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, gv + off_req, sizeof(*req));
+	assign_kernel_gem_arg(ctx, 1, kernel_gem, gv + off_pages, sizeof(struct qda_phy_page));
+	assign_kernel_gem_arg(ctx, 2, kernel_gem, gv + off_pages, 0);
+	assign_kernel_gem_arg(ctx, 3, kernel_gem, gv + off_rsp,
+			      sizeof(struct qda_fastrpc_map_rsp_msg));
+
+out_put:
+	drm_gem_object_put(&kernel_gem->base);
+
+	return err;
+}
+
 /*
  * INVOKE_DYNAMIC: the argument descriptors are supplied by user space, which
  * is also responsible for having imported every buffer to a GEM handle.
@@ -953,6 +1135,12 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 		ctx->pd = QDA_USER_PD;
 		err = qda_fastrpc_prepare_args_init_create(ctx, argp);
 		break;
+	case QDA_FASTRPC_RMID_INIT_MMAP:
+		err = qda_fastrpc_prepare_args_map(ctx, argp);
+		break;
+	case QDA_FASTRPC_RMID_INIT_MEM_MAP:
+		err = qda_fastrpc_prepare_args_mem_map(ctx, argp);
+		break;
 	case QDA_FASTRPC_RMID_INVOKE_DYNAMIC:
 		err = qda_fastrpc_prepare_args_invoke(ctx, argp);
 		break;
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index a5bd7661c26c..1bd696baa95c 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -45,8 +45,10 @@ struct qda_session;
 
 /* Methods of the initialisation handle */
 #define QDA_FASTRPC_RMID_INIT_RELEASE		1
+#define QDA_FASTRPC_RMID_INIT_MMAP		4
 #define QDA_FASTRPC_RMID_INIT_CREATE		6
 #define QDA_FASTRPC_RMID_INIT_CREATE_ATTR	7
+#define QDA_FASTRPC_RMID_INIT_MEM_MAP		10
 #define QDA_FASTRPC_RMID_INVOKE_DYNAMIC		0xFFFFFFFFU
 
 /* Handle the initialisation methods are addressed to */
@@ -149,6 +151,52 @@ struct qda_fastrpc_create_process_inbuf {
 	u32 siglen;
 };
 
+/**
+ * struct qda_fastrpc_map_req_msg - Request to map a whole buffer
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_map_req_msg {
+	/** @remote_session_id: Session the mapping belongs to */
+	s32 remote_session_id;
+	/** @flags: Mapping flags (cache attributes, permissions) */
+	u32 flags;
+	/** @vaddr: Address the DSP should map the buffer at, if it can */
+	u64 vaddr;
+	/** @num: Size of the physical page descriptor in bytes */
+	s32 num;
+};
+
+/**
+ * struct qda_fastrpc_mem_map_req_msg - Request to map a region with attributes
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_mem_map_req_msg {
+	/** @remote_session_id: Session the mapping belongs to */
+	s32 remote_session_id;
+	/** @handle: Identifier the DSP tracks the buffer by */
+	s32 handle;
+	/** @offset: Offset within the buffer */
+	s32 offset;
+	/** @flags: Mapping flags (cache attributes, permissions) */
+	u32 flags;
+	/** @vaddrin: Address the DSP should map the buffer at, if it can */
+	u64 vaddrin;
+	/** @num: Size of the physical page descriptor in bytes */
+	s32 num;
+	/** @data_len: Length of additional inline data */
+	s32 data_len;
+};
+
+/**
+ * struct qda_fastrpc_map_rsp_msg - The DSP's answer to a map request
+ */
+struct qda_fastrpc_map_rsp_msg {
+	/** @vaddrout: Address the DSP mapped the buffer at */
+	u64 vaddrout;
+};
+
 /**
  * struct qda_fastrpc_msg - FastRPC wire message for remote invocations
  *
@@ -226,6 +274,8 @@ struct qda_fastrpc_invoke_ctx {
 	struct qda_gem_obj *msg_gem_obj;
 	/** @init_mem_gem_obj: Memory the DSP loads a new process into */
 	struct qda_gem_obj *init_mem_gem_obj;
+	/** @map_obj: Buffer being mapped into the DSP, held until the request is done */
+	struct drm_gem_object *map_obj;
 	/** @pages: Array of physical page descriptors inside the payload */
 	struct qda_phy_page *pages;
 	/** @work: Completed once the DSP has answered */
@@ -285,6 +335,7 @@ void qda_session_msg_buf_pool_destroy(struct qda_session *session);
 int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 			     struct qda_session *session, void *argp);
 int qda_fastrpc_invoke_pack(struct qda_fastrpc_invoke_ctx *ctx, struct qda_msg *msg);
+void qda_fastrpc_return_result(struct qda_fastrpc_invoke_ctx *ctx, void *argp);
 int qda_fastrpc_invoke_common(struct qda_dev *qdev, struct qda_fastrpc_invoke_ctx *ctx);
 void qda_fastrpc_flush_pending(struct qda_dev *qdev);
 int qda_fastrpc_invoke_legacy(struct qda_dev *qdev, struct qda_session *session,
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 99b8a2517726..cd3cea72f50e 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -110,6 +110,8 @@ static int qda_fastrpc_invoke(u32 type, void *data, struct qda_session *session)
 	if (err)
 		goto out_put;
 
+	qda_fastrpc_return_result(ctx, data);
+
 	/*
 	 * The session only changes once the DSP has accepted the request, so a
 	 * failed create leaves the previous process, if any, as it was. The
@@ -172,6 +174,29 @@ int qda_release_dsp_process(struct qda_dev *qdev, struct qda_session *session)
 	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_RELEASE, NULL, session);
 }
 
+/**
+ * qda_ioctl_mmap() - Map a buffer into the DSP's address space
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_mem_map)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_mem_map *map_req = data;
+
+	switch (map_req->request) {
+	case QDA_REQUEST_MMAP:
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_MMAP, data, file_priv->driver_priv);
+	case QDA_REQUEST_MEM_MAP:
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_MEM_MAP, data,
+					  file_priv->driver_priv);
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * qda_ioctl_invoke() - Run a method on the DSP
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index b2c7bd25b138..afb3ed0e132e 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -15,6 +15,7 @@ int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *fi
 int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 75e67c5f5923..bd2d0f4308b1 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -17,6 +17,7 @@ extern "C" {
 #define DRM_QDA_GEM_MMAP_OFFSET		0x02
 #define DRM_QDA_REMOTE_INVOKE		0x03
 #define DRM_QDA_REMOTE_SESSION_CREATE	0x04
+#define DRM_QDA_REMOTE_MMAP		0x05
 
 #define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
 					 struct drm_qda_query)
@@ -29,6 +30,12 @@ extern "C" {
 #define DRM_IOCTL_QDA_REMOTE_SESSION_CREATE					\
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_SESSION_CREATE,		\
 		 struct drm_qda_init_create)
+#define DRM_IOCTL_QDA_REMOTE_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MMAP, \
+					 struct drm_qda_mem_map)
+
+/* Request types for drm_qda_mem_map.request */
+#define QDA_REQUEST_MMAP	1	/* Map a whole buffer */
+#define QDA_REQUEST_MEM_MAP	2	/* Map a region of a buffer, with attributes */
 
 /* Query type definitions for drm_qda_query */
 #define QDA_QUERY_DSP_NAME		1
@@ -137,6 +144,35 @@ struct drm_qda_init_create {
 	__u64 file;
 };
 
+/**
+ * struct drm_qda_mem_map - Parameters for mapping a buffer into the DSP
+ * @request: QDA_REQUEST_MMAP or QDA_REQUEST_MEM_MAP
+ * @flags: Mapping flags for the DSP (cache attributes, permissions)
+ * @handle: Handle of the buffer to map
+ * @attrs: Mapping attributes (QDA_REQUEST_MEM_MAP)
+ * @offset: Offset within the buffer (QDA_REQUEST_MEM_MAP), at most INT_MAX
+ * @dsp_handle: Identifier the DSP tracks the buffer by (QDA_REQUEST_MEM_MAP)
+ * @vaddrin: Address the DSP should map the buffer at, if it can (input)
+ * @size: Length of the region to map in bytes, or 0 for the whole buffer
+ * @vaddrout: Address the DSP mapped the buffer at (output)
+ *
+ * Makes a buffer visible to the DSP of this file ahead of the calls that use
+ * it. QDA_REQUEST_MMAP maps a whole buffer and uses @handle, @flags,
+ * @vaddrin, @size and @vaddrout. QDA_REQUEST_MEM_MAP maps a region of it with
+ * caller-chosen attributes and uses every field.
+ */
+struct drm_qda_mem_map {
+	__u32 request;
+	__u32 flags;
+	__u32 handle;
+	__u32 attrs;
+	__u32 offset;
+	__s32 dsp_handle;
+	__u64 vaddrin;
+	__u64 size;
+	__u64 vaddrout;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

