Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101029;
	b=RVOfhz/UZKSeRFb2NFxAJCOtqp+B/WhVZU6l2+h3LdquSw++ijHtUgCYOVKSs3h1PxSk
	 7JRI9cnpuc/xUCeyQcA8oozWB8tSMpLkclYvV0IZo04+oAfQo1rC4S6PGU5Oxf3lYFiE/
	 xsTB+MCJhwzT7kD4vibatIJ/K1pea0V00jtuWV0GMEAKrJz+m68t5VOVpDvxVbzpvYgqH
	 7JKbJUfnbLVNxWo6CHdNeBVR0VRfv/CWJespZD0Pi3fnjqKBkXHEj8TzY8ZpQ4Ke8U+lH
	 q0/WrYHMfTceZBve85ms3b0Pmwpo8nE2fLxmjcSyisC2rMc0LaQfrsnFHN7vrM5UQVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
	b=D68wVtv1QQAfBdJeeE0qjnvVhykhD2wPSXvshp8+l1xTcyy5MNT1D11/07i8e15Imfq1
	 dhRqW6GK/HCgzfUHxfpNyAcfEDrRl+pkp2txuhgh+ScTfwDREklBy7PwgvF0F/JiJdCxj
	 wu7aAl4e3g7sDS7TqLxdOe/rexbVrgqvPLaWA22dAzU1HprpJmAAYOw0k1XMfJ3OZEwP3
	 McSQwkp58z7I3Ko6p59meLhyHm46Gy07PX1ctvg/BY5uwxADqsz0ceyrxAZYo6IwD3i14
	 YmaCUD9aJQ2ZiWf++4iShn2CGNGw1JvjJVKxt+5APNf5r8F6flo7BzcgBeXp7FjC43g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BYkqWIL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYiB3GTb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DAB606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18DAB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BYkqWIL/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYiB3GTb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeQbj3013052
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d9Gksr16Ym7a6rQh3BsSgLKt
	bW1PN6uAQD1PHStu3Cg=; b=BYkqWIL/vT76gUwo2BPV8+qHrr6gTQHtEF/qsZzV
	t9k7/HNQeqhwS+OHKqnDsMIWulbLG2pqkKIwvCy+qUpRSxC99/XxZBrYFP4cxZ7l
	/Q5YOmpG3L271QH2G5vKyPoPM1U+Mq8rSMuRfxu5hdQR1Oyw80YcKP/fbSWdHayk
	T1s4ECD6OiTjnRcPlz4xyWeEWk5/6k+IM1aG5CEfYWk//wv8JxvDfs9IpI340eXV
	4UYya+dCPcGYNtZp5Y0LWnfYkoc75+7VeOWSCho+8Jf88hndccM3tEwzSWSew6Ic
	bV2hVKl418/lToGDeg8NuPuK+BK//WEAdS2VFXbsnHzZsw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dat3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:37:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec3e192929so219015e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101027; x=1793705827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
        b=MYiB3GTb5L7ix1BI1N8Jpyt+VCP3d8sLmnAczb+NA8WC2GmILuLKf9Cgx0SCAHmdms
         zX9H8/n1Et56I4rbUf8cCbhHU+hT2nrEf7Tq4uIdSInkvP0hTEJ62mMXnG1mxQl9B1qO
         dSVnoP+GA/AziQHhuNimf7gTmptyGjzMhu/WV9btYfCUmjI3J/J6bBDDydotEi2jxtq7
         zuQZG7kteIBHc2p3eZyKWgel5d0xnDFON7kqPb3Wy/ePe5k8YgYzvrJWljU20Qlz5Pyd
         z6SybKf11ShDACw7I9Vfq0bc/1n/VXB8GFQV0AVdpgRc2eRq4tm2QQoNskU1y8ov27AP
         ylow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101027; x=1793705827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9Gksr16Ym7a6rQh3BsSgLKtbW1PN6uAQD1PHStu3Cg=;
        b=MUrP2bFgxMwY940C1N1U4fa6wsGEuMNQEXQLh/nC1Cqb88DPiVRWMRyS08C1yPT8Sw
         gcMxplGpCQcWNPaqR6dOjTzxPTPKSV/wsMyO+0dh837ywSWQrys8ulYbPNn0AOlcQ9Pn
         OBHp0EcrHbCBhK4zKOX0UPp/RNqZwF+atZp2btIhOogz5HhAekXtHKFCHrLTNH6A7efo
         RINrlEJ5okoO2QNF4BlhWGNxefVZacde9EjHnsF6+GugBdA5FWe9Ix1fTZTM8RgW3qRi
         qIiZcw8HHwcDm9p0rR3ypXDuRgQ6uNQNK2lD8Pl/2Pax40eVClHHpdYoMVhily+tGyOM
         euug==
X-Forwarded-Encrypted: i=1; AKwUvByyWEoOUyXbhJd2T1R89cSYw+/qtXuFMBCSufy7vaaugRdLdVbeRkB1aN+Ff12KI1pj0P0WK4f6yJkpmdEe@vger.kernel.org
X-Gm-Message-State: AFq9FYKnnZHUh5k9lQ70SqQWoYO8lXon6fuAVqI3H6bmJrto7JyDbnc4
	/+SQZyVKbILSNL/cpB8fgHJZcrSBRYLZwiFp0cKjkMxdrZKOf9ION1nKPBTUXKEo8D/ocTQ0G9h
	TfN6tMAw5V+XSSVeoTUzb5gzdeVeTPSewX6C/US/ddQId8obNsQYd6HL2fHNNb799HbC0
X-Gm-Gg: AYBFou0qY3hbGMpPR3F0vvT8hK3zu7sDdULs46gyvAfeF8BDNvRBgjBxGTTT/hvmvSB
	SQnsSgRwAhVtYtxYaKSSiR4WMN8Fy5azxAt6avotR45XSvrjBNRMdT5FcmJ4HM7JWpy8o3hSDys
	ApFb+sFONsdd6P5OrFhIiQ+HItUOX/XXImvcZG7DDCv+IHck5TXc2WSQwX9XmzsS2Ia9iMH4O7m
	CLA3HdFys+7B5uvv8pl8YrEXDCS/C6rlidCXXDI8KPKlDgdVNByVkvy1oVh+auO2ANKz7oAWguH
	tHpuoGkraBKRdoGWbOny/oF9xU8t0TmStzInZWtMi37BawHCZyFstjG22E3g3Wgk/GY3XgcAKlo
	mPDlOR7WG9x9kGRh6FSVLrFxJ+ehnFd0I3uSyKpvWJR3WQF3YYugRW86w7LTMsEp40AZYxm8GpZ
	cLrh7b6592E+R4
X-Received: by 2002:a05:6102:644a:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7ce5ccaae68mr2852923137.7.1793101026946;
        Tue, 27 Oct 2026 04:37:06 -0700 (PDT)
X-Received: by 2002:a05:6102:644a:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7ce5ccaae68mr2852880137.7.1793101026222;
        Tue, 27 Oct 2026 04:37:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a8930dsm2093206e87.46.2026.10.27.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:37:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:37:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 21/23] drm/msm: Support KMS backends without a display
 IRQ
Message-ID: <jmsh74ugfivd6ffwiqvofwnkkxnu5z67hqdei7jarhrftvkgac@hq2e5s2aj7fr>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfXypk8WSMmP+uL
 SsyB4tKIDP0pPkxTzaDSkL28nqaXRJdUyUuB+nju1JB2mr3QgE8M9KryDpisfkCWoZzt+zVxj43
 Hhl8auHEIENXrrSINQOBcwzPxk0hx1g=
X-Proofpoint-GUID: uuVZbRRMU-wkV3nIFzR6PwByK-vI0leW
X-Proofpoint-ORIG-GUID: uuVZbRRMU-wkV3nIFzR6PwByK-vI0leW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX/P4TnXuKBWPp
 6OqiJsdlEyi+LaplTDQUy11wzuw6GpBG2z+iH8COEbP1xIQVZ6UA+M2cYzNhADmBJlDR7ywmplZ
 51gAZajHnaxLzw38c6Se5ksocRokFA2GYLyIA6M25wFX97B0FC+GtkqQL9PjcO4JSQNWsjpcerH
 JD9f0VaAMWYU8gvQV6j15OsE+Wo6Q6PNTazhoJKYb9V88MfrfjOfl12wuZTMNAbHa9qEJ7MSZoC
 xdr1Ru4cYkdB9ZkuLXgXw2CRuBA/ZMsbqty9skbXQGwoqNMFNv8E/ffmVDFQ9sjltKqti7k68Ha
 mhlxGmUq8AJ0phu1n8umG9c0kK4UFYkdvXiDmDmypgaDNGPF1ipM7yhmNvjD/NI85rWxpZCYdPp
 UhOe3CWgX/yJ+w0hxCyFr8o+UpD52LA41k+CwrVJj+fDFdlKcHiZTBP4NKz86uCxIWTKmEr4DcJ
 12hyYdw1B5ZLGDdEf2A==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08ce4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=auR94sGctrba0TjZuGkA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:31AM +0530, Jayant Shekhar wrote:
> Some MSM KMS backends receive display events through firmware or

Which ones?

> another transport and therefore have no host-visible display interrupt.
> Rejecting such a backend during common KMS initialization prevents
> it from using the MSM DRM framework.
> 
> Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
> frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
> interrupt is reserved for power-notify acknowledgments. Existing
> IRQ-backed KMS implementations retain their current request and
> teardown flow.

With the commit message fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
