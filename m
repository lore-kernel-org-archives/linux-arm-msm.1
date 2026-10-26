Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008797;
	b=J+bxgwbmP9g7HijSEzrh/fv4rDJGx4QN1FotyeVhTUSoKGA1t8CN3M9Ldq+NdMIJrQ4c
	 5FY+yQ9RTReesz/5JMmB3a3mq7tEbzRdJottiFHQVfCvViVmojcbCKM75IyAoMXFzu9jf
	 srCTYAwEqqSYuQypdI6EF+79dymCRzfW5ONYZQ7QfzEcVx0bAr4l6Iky7bOv7M2THwNdl
	 K1edCnjQcab2+OnuktxMq8/mcf7Y/V6mIBnkUz3ieO5u4owu5sVRiU/UxaDZ+FlRKGzxh
	 B+r2KMdSx6VwGzVt4eM0JW+LYIgtzMO439X/U2XnSC5savwxpb2YlViZf18g/7zrK5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
	b=Xs1Rtewg3p0O4G549UalqigxWo8lB2jrbLP1aWK9ImW7JFh3wBgrwoUT9201PZUNXhsC
	 chgGSqCLS6QtNzzqtY+0e23H/VwzKTTOFRJqY9AQQlZuWO0g7MhP+5SVVe89qEYzBvRT1
	 VPbz9K4sLfS7G2n3Cm+3mV5bHnpV0wTRsUR/VNtw9AJQW06NIkWnHu0aqNFik9Th+aiQU
	 MN7rO21zPIuv8z9F2DIDgIisV603Cx2IAkfwWQ+afjljc34tLKmsCStUsVNqAxDYdojpQ
	 IDqYQeNiHegR0iT4UYxXBtI6hvm6CBu/PbD1ME4RcOZaXyQuEq6f70RqRmJtKy5OClQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duOPPQmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lq4wGaDO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1A606A8EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F1A606A8EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duOPPQmS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lq4wGaDO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b4QZ2806445
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EihPl48XyzquhIbKjuEyAajD
	35LkfbvtwIfgKv80/jQ=; b=duOPPQmSNBtx6zhy2MyD4npHJuJX7Gm6wHBXP8ce
	gso6SBXwNnKeARLD/e0CobapPe+Pf7ies1PCMX8l0Ug5iwRxIVau+SXTqeR4fsTE
	bPqNxK1Bfn5d+FDp8KiVM+Bp+TZkWsYiaO5Dxo3FHoaEt9Yu7ndZYJNRki6RGyau
	e9TqyPtI9Gei8s75Mu/XbJ23qlTZsPaJIRg3qr0eUH6Wvuq+DaaJU5SFPTDHFggF
	7OibQZR51kSYWjQNBxzIW8c0qzGWVc8rErJCz0VI/N1iO4JE5O3EbCK0hg/I3CsL
	BG8uaN7ChjqvVzPqPBbYVSwVAksgA7o7Ey9Rzt7q1IwiOg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xnvv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:59:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so401643137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008794; x=1793613594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
        b=Lq4wGaDOBpVkSPMT650pzVDZ0ZdqcSGrAoZzfFFdM518fJR89ZIGJx6eXL4yL13Xrl
         9oCqAU0R7kUVi1UhMw8akonpcHbyZwFuJSqb2u0tKGPC3YAvtla7H51NOZadFUZSmL2Q
         r16hd6Nxd/2pcqEyFFpl+3UUTK8ynsmIJlWYJhXm4y/6UIroUCCKK5bS4dQlsFUeRuZD
         +7dv+Yy+eyqDqM0WLJ19pWBstqB3OdBiZ+hFQNu63MhCIR9KRwPkVXUIAerjgns2bfb6
         l4jF9umI9ok5cQKWo5grKI3y0p/QZRQ0T53+Wdpe+LNpYXhCZaRkEVf7sKuP/riR2oQH
         rR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008794; x=1793613594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EihPl48XyzquhIbKjuEyAajD35LkfbvtwIfgKv80/jQ=;
        b=0Jhy+jX3Uj1lWHHzxV89xZt2SnexGr+emKbrBbWVzbhoZWphW9qNVFyTvyqOUFZBff
         QhIrkFOh1vogYLWTv5j+/biobChELvkP46dE0Qj/MUCeN1Qw2bjQ1KGA4vesU4WMAwnc
         AGsI/tHI0MWgaN6JIWeakdhz4lktnk+fnmlBJzje27dGamgVlMcRacZSRDVStZEGaX26
         O2Je9X2Jr2xJ5CkD3mImXgdSGOPbFBq8ByD4+xKYOOkjvaApFcypt8ZmG+zajU0wnQiL
         F6ipSRLXv5L1Vz9mH/aEBEpinwnU2rGCqlw5xBF1P+dWYvNbgsNH7LL3Mrm6CHxGUXVY
         Fgqg==
X-Forwarded-Encrypted: i=1; AKwUvBzLpT5RyhC8hOZynjF4a4EER+6NalKnbW02r8vQGhPz9HFHY75bgXjOHUUQDsQi8tM3qYWJBAxCoca0BSnw@vger.kernel.org
X-Gm-Message-State: AFq9FYIvfR5d4jOFEfNRaikU4IwXQk2wMh1IAXw8nf9DUTLb8692CPeh
	fXDc1EM2GkAa2u1UWXI+CWfcXkNouM1aSpEliEW+lnMyVp5ElDrkMXEsTVoQB7p7opP/Gi//zOU
	HCT4K+RM4ONikJOOi71sh1y4ZkmuE2vhwWlKC+Vg4U08bSwg4c51QAQGQ/pYs1xI8x7TY
X-Gm-Gg: AYBFou3oWBMvQm+MUpyiBq4VxBSSZ+HLzoEkeuUmaM/cml/RJxGZbjmNrRvz5pQ+34r
	Ovdp6qnP5V5A58IJbFvWau5ptsFeDWwcIMDu9jOOYcf6/VZyTob5SuISjcSz2jeJMx51oGvyEBr
	Md+u2JgGayVm4+a9Yb5865q1k3FFZaOYQBo/FdiWDswUgHqiETSXLUiTA/7Z+GABAxKbTMJkB6v
	RCYb/kM5b9fnwRRa1ZHE808HW3uvZjijvBs9fzbylOuVgT1919wt0RzwKjr2lTZugoj1FRzWGj5
	/n+2GVl0MTwB4ekrVdsspMJ76R2XctR+t1cqCY/d/Wi/WvZu8nYZRdW+qfOt3SUsWxFHKrjN3eJ
	+begXXeZ04pAtai54hDq8RJcPO84WbvOFHnPJj9B7HzlhYvYig7nsXpW+mcWKqim04ZyfTm9G2+
	Oig/XkiFlJG00Y
X-Received: by 2002:a05:6102:511e:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7ce5cd65a0fmr1586650137.17.1793008793929;
        Mon, 26 Oct 2026 02:59:53 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7ce5cd65a0fmr1586636137.17.1793008793315;
        Mon, 26 Oct 2026 02:59:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d0606sm16973671fa.14.2026.10.26.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:59:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:59:50 +0200
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
Subject: Re: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
Message-ID: <lisaligvjmnnib7gm6klab77jfzyagn5cx5pix3isodu2cjvrr@o6efvpyte5yg>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-GUID: b4890Vmteyy7QwsbSFWcyOOGsTIEMeon
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adf249a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dTofmrguFlo4DCddnn8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX/L15n7TwGjvv
 vye7yXAphnBrRVoO7/5jWjT2AB1w9ZanDoWKhocC81TT7MGCEo/bRouGvMMx+Wt6S3tsV4WXKQx
 +2nYc1CN4A4U9UerkH0vXfmmrXzFBoE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXyOWl2noSpgqL
 s/U1YxrSd/40FdRDZVQ51Pm5F2pD4lrUdl6SMFwluNMW5GcsuTwnutVgvuVuw61f40xyIk8wwbv
 Y7A6xPnhwoec9uBKAf/O9u6XDXpqUkQMZGqrUkGA9e2161Z3IQC3P2Hy5652IQIu435Qg2ek0jk
 AZp7j+TP1cPubHE1EDeiTf35XtAwBdRf1V1IU2T9wttaMGjENPDfQ1gLltsjnTAMCJU/95VImlj
 ahEgwMDY0QgEJTnhyMB3njdT7AEhcQdqw+0yGaG6yRcCuQKgDUsTjv/oiD7y6nHPiy8A5qO3Vu1
 lN45I6EWRTiEsB+o/xTmhx1OCo8e24239CRPeWkCRA9mnQT9Ej8kZ4dvO0ciu57Ye5CseL5eEYf
 bYbVKXFIn0hpnPHUnzE1aWHRbQGlSN9zh4Ff8M/A+14s9P5ooy35gCSbqFSXBhTrvmO6Zx/gUDo
 afIgcbJ3bG6KbNelM0A==
X-Proofpoint-ORIG-GUID: b4890Vmteyy7QwsbSFWcyOOGsTIEMeon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On Mon, Oct 26, 2026 at 11:51:28AM +0530, Jayant Shekhar wrote:
> The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed

Can it be anything other than the DCP? If so, how would you identify it
on the Linux side?

> as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
> common VirtIO ID header so transport and function drivers use the
> shared identifier.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..6c6f283733b1 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
>  
>  /*
>   * Virtio Transitional IDs
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
