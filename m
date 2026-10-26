Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995895;
	b=ewjwqJcUvpeMB9TJz79V7t04dQaZB64s59zKaYj7BiasuKdz3HVKhYwoNKsKIyn/cQJN
	 ms50Pz92Y+U9Sa1vpF9yQleHsImVKvDMy2/3zRe9GzBZFp0DHq6rDr2ZXJGU3m4cdNNR9
	 /FnNRS/lR9ZneXTkzZPZt/r2RrFiwwYIZvhMNmI6L0JswcOPbKubISORukP0m7+SoFjAQ
	 giOCgw6Gyd0H85BHXRXxuv+RV39xLmxjlYRzjL0K4FyVvvoVuhoYD3OPZU0RbYZYAQIPO
	 uPQkU+pPTQhAGM82XycDlI1uOAPSDa8fSxx2LGpZWHMthzvrei5LOnPi/zO4Pq67xiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
	b=fy05HsVlsmpHJ9FmQC9xTefG4XZ0LwGdLsiCShM2HRVXVVUFotjbUoZRIsGruQ6EXA73
	 Q6482mwmr/Hp4AQu1+yeqBx6JbwNTYuytDzgIPjZM++eeNX41Tty2GiQgMTkSQw44ro0t
	 AhP0ZSN0ezQ1l4jXMcYUr5NxDsMOuVeZETDKmH/OwytrKGPrD8ihTME+6qvve/O1fD66K
	 A2YIDi3slICzc1PFO43zvBUI8KUBobohRiRpCbcinVXH6eWf6egnYp8j5tXBAUhldZ79m
	 /oeGoYQ3Kw5dmSAOkA35/Mj8wNZL4QzN16JYw1tqXyiJp+KUwajGUrcyDoaegsQsXqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfO+XRp4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmraj0p3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046D606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5046D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfO+XRp4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmraj0p3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSKk2222559
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=; b=RfO+XRp4pjYRM/xe
	mG9DK22XFlQQwhgLDBfJpX33NFBxj96FU7sl8qDGu+Plw5ex5UktXN2OLXZEcPB3
	lug8o00Xm0AzYhEad9Za2pih0Tbw5exLhKuoCnzPprxIuijvxz4zLfEKcFBfYNBD
	f5+Tb9YCPNgaxfkrq7X4qHuv8gdHeoQw+OyffCNvt95dE6s1lAH7r/ILD/USzVUm
	nwszRM9GZvSc0tqFQRJWBBDN6XG+UW+fGRSaExZ5Y1kMG3hd6Sy/gqDES2f0V+mA
	xysdEC50+zKS6USAkgaQint/7kg0MWwL/gfkLauR2rgrEFrK2k/1zcZdMguReItg
	yLnhew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd8u0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:24:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9501034c4so50082675ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995892; x=1793600692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
        b=Pmraj0p3jc+XiKtQWDf6kGCYzkt+NN1PgXCH1bwT2RHr2fJCk0bvHCoMxljqS1Mh1b
         gRnnjLQ2lSJqfdThDi/IPKnoj+Mytx44S4S9i/3DpQyImieFeVAg87pmKucofPl6eCmf
         mIvG9Bh5gdHMPtTfwD+g65xWUte1ZNZU+lyc3vo3rBtGDpAvzdTez1Se6NwXAsd7MH2s
         DH4Rwrv1uTiHwGbxTi33dHs+NiHQEYdzkPve1eH6QUeNCDXDsqMktzPHh2QN7syNP6WB
         W3daK7/EDZrbwovBrZyGeypexIAPXzxZj7MNxdVOqdQlsN4o/GbqhbRrIwb/BqDC05hO
         w8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995892; x=1793600692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
        b=r0uT/4L3zxokG/TCV1wvT/+mnK8wTQZB0/GhQSb2ObMCHDFP5InlZZxcTQydWuqUgB
         GO/C+QUM21rAu5JqBAluKn/69frqk2lPjOJQp+g+/fDwC68IZfrLPHVGvu9wttNJrchL
         QnPgulnfBTcDqn9jx7EZrxMMPSN+PfoUItKISGAgzVuCQuqzvOIoTNrtgCxVOo/TvQH/
         rcgxzZA1E8093N+/yLtWS6VhAOXo7ZbNb5mCUZ9AHamtFgfTDnq0fHSFofg4l9/JI3dZ
         6IjluLPeEV/l/5+DQ+hsCm7jwtCp39MkkuyA3fI6VFgohkoAdoaMTK4WRDLGt2RfzWW8
         wX1w==
X-Forwarded-Encrypted: i=1; AKwUvBzsRF8XGTqs/qQxbywpji0LeraOaC0elskNJGDpGfDFhmDr5/TL1+YzxudsbXosFN+Ia6GhjPEr27afciqr@vger.kernel.org
X-Gm-Message-State: AFq9FYLmq5gUVqZXFxunDTnYN6i/mL+zDuXr7w2jzQU7T8BlWQxAKqcO
	haWN7AzQlSXS3sbzl2Jc3R9fUHYRUful82weia2qznIgxy4LBT7gwpCc0wKPGNXCIZU3UqXFryh
	HTgg1ekoD4tvzmA1YtXXQGcvaREMUEGWVSXYlXzzgdCad5EsEUKEGQZnnKR84Qv0sH/WD
X-Gm-Gg: AYBFou3V0yApuJjh3PyocHVZEGYHgliza6buRDQxAH/pQQ6OtNyzT6wp+JmfXx4yTwZ
	iCjwjmCGrI6Y/RBeL/1pNoFMM/3BhED502+Zav7zRnbImXtE5jAydEhbi8mCP91NxIKlmw4Hv9U
	tmp7auMrrmiJxBiBISjxPqr1A13RvFc+MqnuqbXjuwjMg6YSH7WLiAH6tWZm2+0NEKdX2mFRRAT
	yklMRQMZE4+wjh9XfLZjvsX7nNadVdihzzrrMiKlMn472oqds0HpdQY7J59Um8/DRfG2WjiKGie
	UJsTEl1EwDB4o+iXZ51HSv/nf82wX0siR63E4HuH+gGQ7obNYceALMGZqry9qYmMO6WEOeRPCMv
	0mEO24cI1FVYKQA0xPNiCYpSyNTX4yV8/TA==
X-Received: by 2002:a17:902:d4c9:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2ea9c8ebd4cmr50093165ad.51.1792995892294;
        Sun, 25 Oct 2026 23:24:52 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2ea9c8ebd4cmr50092955ad.51.1792995891873;
        Sun, 25 Oct 2026 23:24:51 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:51 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:28 +0530
Subject: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=888;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=OlbpUMWfalcU4LvUc4XxjyJ0N4RsG6REGtg5lYpZB2g=;
 b=hqaldRzU9Cfrh8WAe0bLtlXt2+O+xAhC8XiFVF+11GcI+fP7EIgtkw/lV0bwk/zrXWsIWG3i6
 OCdlUUwhFkECpl0mDzYq/rh+5qzmVsGCw0XRLE0D382TWK/dkx/0epo
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: n0ikxFMsAFYK-0axPxDz-alSlKvd63Ec
X-Proofpoint-GUID: n0ikxFMsAFYK-0axPxDz-alSlKvd63Ec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX6aQfK1VuniY9
 IR1csOiGV9oq4l8S27hXXDEPS10ePPHU5BG8nCHimFpfq4UXqzppJ8pe13tJtE34g+0z82bafYJ
 J2dNk6+t+eRyceL5kB+qXyeGjW6lZlxTbS0HEio+EMhKDhOgWXq+iwamoSVHYLBjKTDWmOsnYHL
 XzGLu+YhTn5RlbugIshUINpL8a0WmduZes6PTOLY+PANyc36fROPNofl1nidc1SOPZ4NpJnL2n4
 5dU54BLonQSzMvow1VKxN9ny8JbJHJk3098MAOmjEVX972KN5+d+Zi+V4eDKLKSWer5c7SptVXn
 of/mSIgbpkHVTh3D26RPHG4DjkjyMjQFB9FT7JOCNraakc4UD9oRz8nm3XYAtZYCcUuJVh4kf5Q
 DWd69+6qDTYoEOBw8tQXAQU8Ymz2YWEOHKw7zDQjqjVXWk7NfvQuZ2bZr+WQ18imUsseVkw28iV
 ptWZ4s0rjusF/TY+GVg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adef235 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WCyPByqoPTdveakBLZ4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX1icQM6Pd6AOr
 p4J+Qfol9aAt4jME4iEkN6mv4gLhCrY3AbhNsaL9HNs4bOiMP6cr0MIOF0e6A69ov+R5WPoQgkx
 mXjjpCJ+miw1mk/3u4W0UshGRCnIE4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed
as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
common VirtIO ID header so transport and function drivers use the
shared identifier.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index f9056af0c622..6c6f283733b1 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -70,6 +70,7 @@
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
 #define VIRTIO_ID_SPI			45 /* virtio spi */
 #define VIRTIO_ID_MEDIA			48 /* virtio media */
+#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
 
 /*
  * Virtio Transitional IDs

-- 
2.43.0

