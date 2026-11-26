Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674264;
	b=yqKkd1QMbcj8lqt3AZis2lhW/u7cNIiAuKdLU5eAJv3pdDQkcjvIKo4+ddVg9o71wnjq
	 uotxg7lNX9NuyV2uWjyMVhOKjVCFwQgnYRxCGYmrwCtgJsBbdvHe7uNh0n2Kl76HdKIVM
	 ejeDv3eyOeaJmRSoQszBdYpj2GAWXQy1hC52JfAzG8S3B8vsUR1nVb/prWsV02eV8IoJG
	 anjlcOkWCrGZxVMkYfZbCba8MkYalqxxkjIqla2VQQhFrC4dxbZ8RKuGEMGoj0ajLLnhX
	 HkK/IqmsFZtcG7hi0M14SVi1WjnZtjzMJcLPhK9o1YsMOBR6jx4v/sM3mW+s/n+PE7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
	b=zkD5Dh549Au/iKxvd82ttOJn4BL3CIisOxoKk+LcqlPVjy/3d4SV6BWl9SMJ4BXwmcdl
	 wP1bWi6hNRKxAQ1s2gQn8gRxgg2sWOSVtHDCWANZUj0L2/OVxUO+KD7xpLUzCpgFBpJ1P
	 DzHw53Z1Z7Mu3maXcjGl+UUxk549mWRVwAE/4gOFFZ0jUxvCS3ESc67QkQrLJqgN57ACT
	 c7xnHv442v9unYtZh76fSB+1Te+ItDcKd7iokhyEMDi+wvBuJdJvCMKqxybYlUf9Y76cC
	 VAKf1lSSm4o4ybcI4gQ8HOyd1fDH1VBnvrFuenjiHo78eIj2VwxHclqAJ97sqSdUckw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdolxAgf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD+zAS98;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE66606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE66606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdolxAgf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD+zAS98
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Fgk1157378
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=; b=OdolxAgfqI2pDZuw
	7lIVRaBaousaXsnNZ+J5PaZizpOz55gw6EmPH8qKWw1Mogj6LTpRSmawjc+FDa4w
	xGb/KApM92k6X1bisxZbLUUwblWajRykzQl9QDwovTGnBYek/nC+5tlDE0uB8QFr
	VltDBQILEM7X0BwghxaLbux1APLBF9b51+7ZPymBtPF3JD66KbXOOfZ2af92J+Ky
	/0Q4xOCGg4WJNrVJYGNj0X5NA9YjU/N4UFPB3092UastC8eGRXFMREH6fxZWHAM2
	p4NQhzQwja3/nr25OdOZnnlL26PD0JJFtzOPSfH95ese/O5gMQdfaWsq0QdtGDED
	OBtP6A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aejqvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:24:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4ca90ed93so2992624a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674263; x=1796279063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
        b=fD+zAS98uZu1mfv1sTxb7hkM9pyfPQHdhSDuKvzli2xMBoO8ZK/TgwppXBB32mNhTz
         qwX0dMGOj6fnRj65WPZTEF9E/6z8v7K0ispSKcuxsfWJqAPK9TzdBixXIJOIArUJFiz0
         lxuCWCM7ety0U8Pmz6dOjqPaTaKxz4q+D5T2yWaQ9vkkASHm+fr4gZ0fQ8Oov+BPZvNk
         RSO5mrHQ2CpXSJppNLMAqL+/dBG5F5NuUKjfn9LXblbfxmW8wZ6rthDXIbFNKnniiSkL
         CrYQZ1ImhCLRAmnbpGJUnTiZBe9ucnDp/cnmu+PzpTVyl3X/MoabfCLyItJh4FlP9SKc
         P6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674263; x=1796279063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
        b=dVD7YxSONAr6aFniMsGT7StZCbDxCeki0yxoNP2feU6ln9dCDTmSvIx/BzYp0C+ctZ
         7IXDU0lBMYZnN2IEAs+AQ2Axt25fnOl5VpVe500tQsOU9A+ln/taLbMYWU99W11LHZhC
         FYXfBDN3eKk3Yg9jw+QR+r2k5edOyQ8slgWLPoL19v+qCO3i7YJtcparvdFrMjyXHmUD
         iwbzP+rKelX1szIkvZ0TXlxAAkvKhOlLttWxKdn7gkIoNMxZDCR52Co0trAjVbc9WEeV
         Vu7R3YNrpVtUFOfxhgVmXdcF4XIybezU89Mtrz6uZ1aie6eE+wZdg4fMscML9KwQCuzK
         EIVA==
X-Gm-Message-State: APuU4Z+R6esKB4TGDzXArKzD45/2IoZkeWNZUTanCdkbgyO5FcXSpGeo
	nLeZegz6AewbKsYUiwm4JybYnG/GNeQ+xFmRRY2opj0taflGyUVG0OhYVKBD5PK5TdyAjUp8lPA
	T5lj0znxKJoOGkQt2DRndn59VBxHzn3u1++8SzmKn1FyxPr04XZOrqv6l+pOBl9Rvb9Av
X-Gm-Gg: AZFdTZdYq1mhKsW7haJuUyM5RjoHWjHL9PhdOGyYVc81oa5V55ZAfZ8HXRhFKfYSsmk
	4LZFG88c+zIZ4goq+DYMDLl0NgY+OMjFD4QVnFr1Kt1mpBLXLXl7pLn4KIk1I3/kD58G5CM+28q
	aS6jrdF7pkt8R1dJh52abg5Eca0gjzQe0a2BqsRflfIFVArq4zpTGzmcXfVN4a/HyLhms/o9A1w
	dW95nJuTwLlA1ZM1109p7FFotEQsRh/gSvCUMcM99DLgFamp+iGEJyhKhadounHUtKBvZJvJy2q
	+MoD/qNVTjTzV/KJ2obnhRuyOi+hpJ6e9FDMXwzqoBCPzbyemXLufPZLIIJfmC9H6KuuW+8iXBt
	N7hbyqJgJ4nnzZgnGAXA2vm1u+nyREiBNGi/DdSB4HGHFIRmKUo8ZCx1thZiG9fBqwm0apzZpjo
	a6mDv/3xRr
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr19232481a91.65.1795674262883;
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr19232454a91.65.1795674262406;
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm14988015a91.1.2026.11.25.22.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:54:00 +0530
Subject: [PATCH 2/3] virtio: Add vendor-specific device ID
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
Message-Id: <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674248; l=1122;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=GarfczuQMc+vTCQFOwF20nMoLmGibGyTdxH8fgzaj4Y=;
 b=xLVT2dFjo27JP30KZLWo89YMNzpxh6pFxM2QaR2byRBSxWn8dA4BXKdb8GXuJjoxbEQrnxjmq
 O96QgrXg7C/B94GfmaYJ7hOthasfXBM8g50jzhTiloiGHkGBoG18Kl4
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX5N39t6qFIeT7
 LzpiHobBmxEfVB6EyO6PfljGU8YjBDFSgcP2BMvV8YDYdHJx3ADNdfbNFe2b9ISb+4WXeyju2lD
 4BXS2QfHj0zzqIGBS2zVeibYiqaPLnAAC0IqHZgtY0P6fhwxrWl3ea03I9dnJciE8H+u3N+5OG5
 lm0pK6l/865/bmMyf6vRKV5U3HmDdw7NVW22MfPluhsZUeZeXT9ssFvtue3ze8oC6Vegb/OMiwo
 145YuanG3JJu7wo7QwwcrhiASksKowWfQNTLq76dlXqlyi2gV1DIXbepgKydTZU9cT8hklDd/pm
 6/oqQ+y+GNXCO0tm6AM/qQQIM8cbQL6g4UfEDWuOOdDZYMJqZANerOdgjVeHGqCzi5cZCwY4E2a
 OUjFx7UQIoLM0bFSIkMw5J3AL2MHmOz0JUDHB5ZyKr5MXR53NbJ9pvy4YIlMG4KeEfdZACoJppw
 1GFORFTrkfAl0mtj0aw==
X-Proofpoint-GUID: 3HU308L42xShq_DpoV2y-6GxTjOc9HvX
X-Proofpoint-ORIG-GUID: 3HU308L42xShq_DpoV2y-6GxTjOc9HvX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXx5BmY5fW+LiU
 fhYjPYtU0XDv99+teA2Q9oJX4dzaM347zWsJxCXnf3RDT31KddQnZo9O/aXe+lGniW2WAOaY1nw
 FdAZWS76cTNpucCYyEPXKqOGRRV/eH0=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07d097 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Gva-buRrl8eeyeTSwpAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Define VIRTIO_ID_VENDOR with the proposed device ID value 52 for generic
vendor-specific VirtIO devices. This allows vendor-specific functions to
share one VirtIO device ID and be distinguished using their vendor ID and
platform description.

The value is proposed for VirtIO TC allocation and must not be merged
until the ID is formally allocated. The DCP function driver should match
the generic device ID together with Qualcomm vendor identification and
the DT-described transport.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index f9056af0c622..9a8b6a6a03a4 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -70,6 +70,7 @@
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
 #define VIRTIO_ID_SPI			45 /* virtio spi */
 #define VIRTIO_ID_MEDIA			48 /* virtio media */
+#define VIRTIO_ID_VENDOR		52 /* virtio vendor-specific device */
 
 /*
  * Virtio Transitional IDs

-- 
2.43.0

