Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972677;
	b=XSUJP1ziJwPuJKsp2tWheYYnSf7kPE+vxk7YGmb2Oc5Y/EmcGsKGqT/flHc4eS8DJZ/F
	 9SnpYGMLNO9fCx1i4n+w5FyUmksKEX0EjzG5peBWaTnHHPtI08zsTCDxHMvjZezwoVnRc
	 HeqcTB9QGcF0LidJtQVu4LuaCjYAuHnWZ1m/88Hbfpb1zDSVp8MsKOcvN9cOmTgF9xFYz
	 oTVNybu+u88qEHs44mYDWJEPNzx/n8WWtS5BmKBGtaN1Ry5fJMyAGzYc1/T7SV1W1re+0
	 Vk33YvxOLgPcJSVF/Mb1K1Wf2XNK58HlhDUtyuOgnzPFG+cxKphvyHTjcfAL6+aASnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
	b=5jqqZWHh0yltDNquez1bQ7ap5F6SRnzQQz9E8wHo0PumC725WjbpvIJFV6WcReFTw11d
	 3u+TAyAUv5umteRXXOS3aF6+Auz6Drod9JW+5mOO+WnnCF1KJsiZw+X4zeY6G6HiEY2g8
	 CpowsJt4+kICH860904H2EfeaBp2R4mc67lm/d5mbTw+VZ3xZ+PlSOmubinJjqHTR/aQA
	 9EOWLJjHCEWEew8D5G6h4RJRTHZN8Vi10AZbK9APIF2cmlDVxPsP4kEtTBTk2K82QjB3M
	 201sBLUne38WZZB2rLXstRV3pvvdCoYeAI2Hcc9qYoLxy+TcqqGKM8Cu7uobAoo3iVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PDiC4gNg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bfsWcr/x";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226FF606A337
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226FF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PDiC4gNg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bfsWcr/x
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APNmL114833
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=; b=PDiC4gNgTACQ/CD+
	f3uuSfxsKGX0CP4S3fWsaLNPgx3VC3hct/Ihq+YWpmaZISdIHLPTm6kCt2AyQNFZ
	FTw6kUJeVIccsQGq8zVQBnYkpvxS3gwOAH2pvzJ4TGmPtntKjvAdZXafnhzYxnHB
	O8/VPQRf9ofjXZnRRrIlNS9U7ScOzyTcxvK3uM+QND8wTi1nYL8hnbph2jsmaPCQ
	oy3bdZD5YiJjPCveKEZXnnBZiAKI+78Iopg/Ott93E/4U3GRv3W6lMFhpIkbiWiL
	vxAq/3KR83DVmDlK9cGkOYt6Ibr4J82iUbnK1mUw/wbm/IfvReAO/yuL2T2TIIuE
	s8o9pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3patyv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:44:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so152732185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972675; x=1794577475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
        b=bfsWcr/x8IC3is5sDP25dRl8+zAfNdk0bCALKRYtsouB80MBkw+nmV2+5bu9ohbaAO
         p0508vtnOa7a28ZdcdseeilW7JBIuetNTPQ6crdsv0DewdfHqdZLtIglA8ptKMXhfZ92
         NfxsuuuZ/SQzx2cjmarIO6SlLh+yZYHGLa5RBRK8LbGBxslZ78Nx3fDbiCmr+1QlFlw1
         gfw1veTrTsoialWAD2TmNycjK3QhCRiTyqazU2cAZ26HspswIUwZXYke2V2oQO6FBD8o
         fDr/2V32BykPBxhk3s4EikRlOXIgA0RjuFSTMGzuKjXXile6C/6+WcBxs5lj8TEEs2Nk
         IRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972675; x=1794577475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHBwADlwEkzpdYTh3CVC8KuWmqpeEYj9lfAptSkifbA=;
        b=TO8G6BMOPbv8/sBGV9SjVKLT9E+pmXLhqLZ2SNSyoLoBBq7ByiL7it+vkSzKSP39sg
         ytl7HY36wUh5kA3+b0MUha+AlgHp96eq1+15oOhU/iz8oTUXoXymb+V7TnJS7ItSsrJg
         6leo42+9wpElsjZtDydnYKxBzrr5Kj4Wug14DY7YxfT4t1m2ZhYBPe/cXDhQo1QLicZy
         Y3eROPV2qM4Nh4dj2cMDKhLZ1ASoMHNeOfwNOeHdCpNbsDxM+0/07WjlFj3qC1soyCVz
         rRiOkgI8AKa28MINCAUITsjumVU1FGIwdvZMM1zWzz+tFPCCNtz0wYFfOQ71wx2K7CWY
         +p6Q==
X-Gm-Message-State: APuU4Z9Y8WqnnfRVzhlqK4iCYD73UiPeFgkQgZFWquWDFXwzuPapWYzq
	oiAh9ByxLCT/Uavd1MfLN5ztXOREOHOAParsZcFD/8ajoFDfGjkZtmSzqL1EiZX21xikd+fVsCe
	M3p3LXoIEVF0MbMo9CwCUBOWZ2Z+Jdo+53a1MObeZSOaDrUW6TxtfpsCcC2VdLzhVkAks
X-Gm-Gg: AYBFou2a8LgLGtBtZOhX049Ohio5k9HKNE6PLCxefEWclQTp+RItt28jDjhfrJqlezg
	eRQ6yXA8WrFEM4lldADQA+db7R4m80PuGVIFTXMWBiumca5wXeTmYzqZrYZm9urS2mMw5tnA3w1
	lRVVvRaaM4Z/S+H/KGy5U1SgEhy/5C4akKG1HqIlT/M4NwqX81Kdc2HluJD0l2B5gkIspy7vlvH
	PWlKuAfjYZ6xjXftR/K0jqRsDp2Aj4e61ZcnD0q+0hupAiOtbyVqOT5cfHpPQVxsCcLsLyWDbDA
	RL8kbU/rdemHUiUHQrV1o82HIglJsRXYdcBv2rDOt9v7XK0NCrjUmkomFmzdo8OONhZ3M8C18me
	uLVW3VFX8lhTKQ1fM7vig4Jtkep1BhhZBZxugtOEwpzMYwAVvOa/culCn3kcPvd2QPfIBjTOr8V
	3NQwprWK1pzSHsvwFWoAxsGe8Yfll1Frl7JO3OFGx9e0LkdAYG4+14TOQIom/gng==
X-Received: by 2002:a05:620a:4505:b0:939:fde0:a71b with SMTP id af79cd13be357-945f3083a8dmr383436385a.0.1793972675386;
        Fri, 06 Nov 2026 05:44:35 -0800 (PST)
X-Received: by 2002:a05:620a:4505:b0:939:fde0:a71b with SMTP id af79cd13be357-945f3083a8dmr383430385a.0.1793972674705;
        Fri, 06 Nov 2026 05:44:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:07 +0200
Subject: [PATCH v2 1/8] drm/msm/dpu: fix the comment on the RGB UBWC plane
 count
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
Message-Id: <20261106-ubwc-format-docs-v2-1-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0CAHkr5CD33DFJQjC5hRRncFTgq+EH4OMdHJOIvKkuI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9bbm+u31IRcrVrNKNJqtGaz6SLp9phvTb8z3hYdeC209
 o5mk65yJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwt7G/t/tSJYm/8LJ5kX9
 id71W+ebyB+zmaHiP3H17nien3X3Ejhb2zfMi2ieabxH+UjZJjEpCZ3Gm7689oWbu2T8M/T+tSf
 8++bNdbZ8/XG5VZv28H98fJfVfWaqkMg1EdMYu1yll7+itxU3HfFvfD5Z8cUh3qvf2LnXZ0lWC6
 umqAd18Mtt5Ny9ovsYXz+vcYXHX4V9xx9VfDdkvFP59YrNHpf8vUyWYWlb8zZrivcxRE6JFSs9E
 fHGOrK9PDc66f0qwag/yhqHnho5na1gWCZ9K1jEvTR2ugG78oFpxnnzr/Q9SjyhMFmsdK7zBaVZ
 Gq3W3nLLP3LWagowdnm7/K3tk1jn3JLNza1tzyT9xgAA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX45cJE46jmjth
 8u54DPSZ9pVe5CYXQwCGYYNGCYhJRFLC/SCL6t21cRys5tA+gMZHQrUSftQPgmqS6T0GX49Qytm
 NZq0LrGHDghGP35PBMFqmEz20YZX6sxLKx9PppGVflVkXk/cJ6elxXSuXUg8AtaIW1itqPIFD+/
 QwiqDDzUKJe4vHPoWDArE/3zBkFCKwuR1yXOtPrhdInq4bN1/5gddBRyFRJ9iBUq7ek0PingGsJ
 ufh6pwFx/yfpBh4z0k6PuolhH1yXm+e6mEjCYslHioi4v6Zw9F/5OEu88IeFB9rcE681BgppZB8
 Yg/V3bvlkXiL1FtC7kxix9WQ0mO85dFJHtdL3mkdIHPeiEZJblSOgw1NQ5sIqhvRCnwyaIjW3zq
 kK1BoJYL0vRMnLyIzymhP1c6Qo+rzT38NhTul8WBOFtwpj6aJvCK/RICIP0FuTNMg/f7koYV2uS
 aYaqJUI+za0a+YIXKGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX5VLjrOxJpk3H
 uxymz1GkhmZ3RDdca10Bo3Cl12rAPc0RHHVLb7RxMaSP/yPt510HTqjnrFeVRfEMd8BCfwHMqU1
 UCyJdiXol6RYOWMNebliXCca5JsvtpU=
X-Proofpoint-GUID: 64pJ5QfTOkf5vZiX99Jwpk4WDvt161LD
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aedd9c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=53nbmNL_gIBj0mvaGlgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 64pJ5QfTOkf5vZiX99Jwpk4WDvt161LD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060054

The comment above the num_planes adjustment for RGB UBWC formats says
that the uAPI leaves plane[1] empty, but the uAPI has nothing to do with
it: an RGB UBWC framebuffer has a single plane, with the metadata in
front of the data. The empty slot is in the DPU layout, which follows
the SSPP SRC0-3 address registers. The RGB metadata is fetched through
SRC2 and SRC1 is not used, so num_planes has to cover slot 2. Say so.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 590922c4f69b..a8e9a69834af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -126,7 +126,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		/* RGB metadata is fetched through SRC2, SRC1 stays unused */
 		layout->num_planes += 1;
 
 		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);

-- 
2.47.3

