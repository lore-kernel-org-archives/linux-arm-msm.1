Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883691;
	b=hcHeSWa1v0zdye5HJafbNdEg5rjl6ysoqtcJ4SMrk3n/isrRrHBL8+vvCbE0xAvNIScB
	 ajeqa9mhOEmlUuF4niCaiRRaJ8pgPkESYwk/jdf8ajvVrCazabatbkDd1Finb5EENyjd3
	 RBHCbsqgFkUf+pPsVBrccokTlg7m3QOD9fvOAfaK5nGT1KqBKnZz2K6c16xOLSmKECM+V
	 eY3iLM/h+abmBHFcGOr7j5RCSzpzw2gziC9HDE5VsTEoT9A8aT7WTj/h6/qZYX1VypgsS
	 FH9WreDhG5MfViMixfD06pCpcuiJD2a8HKhByg3KlSNYlQmb5O1OyKUmhjA0As+a41A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=;
	b=LaTsY+VM9x8kBiH+lhHZ/Te4ydfxKYhSkUVxHmtWu2+WDFc9lvS6ONM4dmaLPMlRJGGp
	 U66F1jXq/g8yNBJUIff179rwubnic+LPRGs6fKGj6+JdcEPHlsSkh43Xgc6owc3nXXuLm
	 hidD9Q9JNJCwEzE8idahpVc5VfO7kAfx/gcCxnw72K+/Jmglh7E48B4BLpjrNF0FM/olj
	 4wy6s8OY7Fgdo1RrptfFnkQIrhHqMY2EOXANLsV7F9sR3f1KcIXg1+SrljtrAVtHcpC07
	 CQiLSkDbE/VexqUNm0fAvlFhpHwZKee84eeyidpX68DHkmlgHKmYc6YxLW7T6LW4RWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lUEEKPSi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZdpASoD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE285606A32E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 13:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE285606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lUEEKPSi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZdpASoD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tNbr083124
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 13:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=; b=lU
	EEKPSiWqKZWaHU/bW6jGHmPPlsvYPXsSAcneaDK76rvOeY+PHGa8Z5KfZUmwpBtL
	YYUYCZkFrsNTLoOGVPUmKPaWVxtpx9Wcu0RjKppbD2+d6h0hYObfulFBV7ZCoy2k
	OOgmDjWawtHGm9q6nwvWP61zt2x4eymRTYHT32+LtcpsoYSnaqES8nxZ8ql3wpZf
	lxGOHfCte1z60PzfhnWkDnsiP+xjWRnyO9fNibEcJRFRIjs4zokoPcREZ8QLPgnP
	LHhbgBUFYWU21f9CTO94zD736VPYycRCRxqyZIcNWp8CfCugngx1gj/AhZXZL/Sh
	16nThmAjhxP9NTB1XtYg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0vrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:01:29 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46617932071so1473298fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793883688; cv=none;
        d=google.com; s=arc-20260327;
        b=nTUkvpuaao1S79fegZ9rkgipX87agbqHcRNAq28mbiY06ci/e8yKF5373E3ys9G0SS
         /D78sZbD/MaIKqzWFMIQIszX7wmpVj1slgShq1EHBn8SY+yDySQ65/jm0jDDTk2uzpni
         0tdvdySRnJePoSWLu5JaH+iV5xfXPLmB3g+J/rXlKSsF71ngaYYKDMLhuZKcVlti+Y1W
         rNs3X8rJcOvjjJV2W/AF/i5BEXCJJ3hCtw9XJi+A/R6hd6wVZNHFN1FZX/abUUluyUO0
         DdqJnzKPMLo3S7jboiM34F8r+BS+gqD9kHbIujFo42L8srNohJr95ZogOQDvRyONcTkN
         ntIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=;
        fh=ekPWay1BmvEYdYA/DvYkurdKC1RV8/4aNG0xBFWeBrs=;
        b=HacoKI2c+Hd0baYT42liePijhVZB5itEXkPBK2yMociKvoXdLBHHHdioIF5gp1Igfz
         dpWJvBGrhnZpkqq98OD/QGqyXrJSECWhDcWFnXvriCX2id/SgY0rRlZh44GGRWCDUBC2
         MzRq1m+edBgjD21d0nn9KbcuNRfWOaD+XtkeGIn0rgXyXmq0LctoPSdOpLAubl5wO5D4
         aNE+O2Px+J9X28Qvr3yd5Gfipsd7beGCgyjKSxBWimnDYomFDhG2C8u65le6cSBqUmCH
         6F5/ptfImBt+GNexKTkcxJKEna+JN5P6kxYVdGRRmLgiw4tAFq6GOnWNFHsUBqCeb46p
         lhRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793883688; x=1794488488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=;
        b=SZdpASoDYPjFl8mzwEREAPiaKFPp4r3like5o6o0kXfqCUAQmYcoO8y5QTNCwZVQII
         1syTqQap7LLcnBdqZ3V86q0oPaII0MJ46xTFsMRmndtTEfEJEcubpp4H0aWCCWj95y9N
         IPSERczfC1u/JALr4O5NvrMbywY3sckQTEgHBJL+RYoklrZnLEdYT8EAw9tV2gRDc2/f
         zkhutOGx60lD1DLhkRG4wx9rlxe+j3Yh/tSHjDam0aIRUJoI7DZwoAN0GO/FvUSsxr8q
         MXRYT29a2XiWAtWs6FsvmDptdp5fqyzJeiWLg9hvqOBY/Nvqki4Qa/dqFYDP37mWR73E
         LvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883688; x=1794488488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeRy0oEaa43dns1qWHShRBlWSY0H2JNTqzR6NqinL24=;
        b=HLVQN6BS2X51s3QNv3db2M5scdX+G4Q0EnRTr8LIXyA4htMI6dswACOH5HWzb6lCfI
         nhXxkhJjwHcoNfQ29A57116r8MP33Qjvyl8V7oBpKA4DsVIV5qEYVQx2BTtZs7DpQKq9
         kcALMN23B2Y04Wo7e25AEr7F7pkFPdnS40z5vHgC2PzP6EM2nxtvLGjzbciF2r7Z795P
         3XiB/7VmsSIQGv9LtKiPsDJah6syZA+tY/D2WCPcdhQFyZ2ma7llSkfRsspMTB6J2IAn
         ACewEMrf+tSLlxQ93/JiGdINi/XkBGxplq4vsg9ajDhc4nlTcWJvb81onq91EviK6Jyw
         Znmg==
X-Forwarded-Encrypted: i=1; AKwUvByWr4Z5Whp/IYYrqUfYribP7UmMGuMd4N7vEGrfU+dWGe0mNaEapEP7l1Z4b0ehn4KQ1acmVqjMuFhq8PCS@vger.kernel.org
X-Gm-Message-State: APuU4Z8l04TlWW6l+6SACC8SvnVhfzv8/Noa9bxPgZ98VyV+rWc6S8Kb
	aCw3IAdJ/zxs8lEzYq85eaLhQ/SjN02eYeJDOjnbQFWUM1sGqnkhGBRVBEuhvXf0RP1BTJYdE1A
	rh6qZaYknNX7L3vz1EkkEPsDILzkuCbSf5JSFjtJQe1tWi8T3KW1NKgnnHxCDOxlpJLZclc2Jk2
	TVXnaxgxvR1YtNuXYZxnUFBKT5MrbPonHpYvT7yDBEyK4=
X-Gm-Gg: AYBFou3gT4At3dPhVvM1x1aqtU+zKH/qnrKxd4QTVSaM0rH5ujDJcMKbX6ouflYut/3
	dxTygHbQHgKC1euRVILKgwboPxqOzWeA31ne4V46CAATT2vecza35IDuIFlV4dWbMe8XPZB33d2
	fT35e7dGWCoRtzbNrkJXhpDN6SfTPQbEFVIGBgajblNoanTIUK79L4lG4EGUbM1aCzkOd8oECSm
	uB/g1q6DsUpd8Wxwn0Ijg==
X-Received: by 2002:a05:687c:8c7:10b0:4ad:76eb:60dc with SMTP id 586e51a60fabf-4ad76ebcb9fmr862234fac.27.1793883688231;
        Thu, 05 Nov 2026 05:01:28 -0800 (PST)
X-Received: by 2002:a05:687c:8c7:10b0:4ad:76eb:60dc with SMTP id
 586e51a60fabf-4ad76ebcb9fmr862182fac.27.1793883687555; Thu, 05 Nov 2026
 05:01:27 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com> <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com>
In-Reply-To: <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 05:01:16 -0800
X-Gm-Features: AclHuK_FTfX1bhtgOB5smy8jkMhXcHjbMGJa7VVWz-rbBqyySfj6RR5zIBt9uVM
Message-ID: <CACSVV01ZhTxeJV6qUGXvM0cu9tkriu_cnDJ1zn83WjXQb6ABbA@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Robert Mader <robert.mader@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec7e29 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=xAgDbal6OUhFU9-prukA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXyYOlO0H69iwQ
 2UnN+CTHkWpF2V700xV3szSRY5lpuTuDmt1MVHAa5ieKJPKRweRfLbHgcGhxJusujN+PAR+RcAw
 KtmcT8bwuTttggxdw7526s1P75GJbj+VNsbdKyjbrxlkqrXkhfKwOxN1RDLYbV9VCqH51DamHdD
 zyTZdmgoo9kUII+awGZh6jHQbCAIkWN0SkgWOE96nhEtnx3YWigAsENprz/WREAyb3fVI0SvaPK
 w5b8tK1MvjfpyOQOGb59tdD8yfG3a3oQprpvoKpk7laxyh1qEWgFCLm9q2aH+bSU5DXyR9J0rYf
 zXagT3CKTRbomcM7cPdTXVTOjX0LX8Ggz6GeQTOiWRmXuGv1cEaTkl3+zDfi6jTV+ascTG8vCId
 SLhUZoGfF1JhX9Agpe9MF94L6PcglQZMMiCPu7L6Mha2FbeLY1Ky6IWi8Z82XU+705oRA/BgJ23
 aRfXx52b4vrt/Dr7K6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX7ZM//Ek21r6J
 JSbUcNg0SWR2TX9LB5jfHcoznCUssgheKjTlXjnDcjngltKi15+ZgoTFe8LAITTB4ZAiUpUv90U
 bXYlvsiwnHrMnKhxx2Y1pASJI9O7+No=
X-Proofpoint-ORIG-GUID: FsXVQBQw19AB5TBzK7K7yzPGLStu6B5d
X-Proofpoint-GUID: FsXVQBQw19AB5TBzK7K7yzPGLStu6B5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051

On Thu, Nov 5, 2026 at 4:35=E2=80=AFAM Robert Mader <robert.mader@collabora=
.com> wrote:
>
> On 04.11.26 23:11, Rob Clark wrote:
> > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.mader@coll=
abora.com> wrote:
> >> Nice, very happy to see the series!
> >>
> >> On 04.11.26 17:36, Dmitry Baryshkov wrote:
> >>> The comment describing the QC10C buffer layout calls it a compressed
> >>> P010. It is not:
> >> If I'm not mistaken the display engine / the DRM side (including Mesa)
> >> describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> >> Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> >> P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire th=
at
> >> up everywhere etc. OTOH if we want to keep the DRM side as is, then th=
e
> >> comment should reflect that, IMO.
> > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > as distinct formats, both with and without UBWC.  I'm not sure if the
> > same is true on video side but P010+UBWC was never exposed, or if it
> > truely only supports linear P010 and UBWC TP10.
>
> Oh, do I understand you correctly that the P010+UBWC implementation is
> not compatible with QC10C, meaning on the GPU side (Mesa and display) we
> don't yet have any support for QC10C exposed to userspace? If that's so
> then we don't have a choice but to introduce DRM_FORMAT_TP10 I guess?

Yes, TP10+UBWC is different from P010+UBWC, just like linear TP10 is
different from P010.

In all the cases including planar YUV, there is a single plane per
"logical" plane, ie NV12 with or without UBWC is 2 planes, etc.  When
UBWC is involved, the UBWC meta/flag data and pixel/color data is part
of a single plane.

In slightly more detail, in some cases we program the hw w/ a separate
UBWC address.  But in particular for planar YUV descriptors we just
have one address per plane (up to 3) which gets programmed with the
UBWC flag/meta address and the pixel/color data must be at the correct
offset from that.. at an API level it is easiest to ignore that and
just treat meta/flag + pixel/color as a single plane everywhere.

BR,
-R

> On the plus side - this would allow us to make the format single plane,
> matching what we get on the V4L2 side.
>
> >
> > BR,
> > -R
> >
> >> Best regards,
> >>
> >> Robert
> >>
> >> 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests=
/8195
> >>
> >>> P010 stores each sample in 16 bits, QC10C packs three
> >>> 10-bit samples in each 32-bit word, which is what the stride computed
> >>> below (width * 4 / 3) assumes. Name the format correctly.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers=
/media/platform/qcom/iris/iris_buffer.c
> >>> index eb8de60c1177..ec2bf2a2d953 100644
> >>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> >>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> >>> @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris=
_inst *inst)
> >>>
> >>>    /*
> >>>     * QC10C:
> >>> - * UBWC-compressed format for P010.
> >>> + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed =
in 32 bits.
> >>>     * Contains 4 planes in the following order -
> >>>     * (A) Y_Meta_Plane
> >>>     * (B) Y_UBWC_Plane
> >>>
> --
> Robert Mader
> Consultant Software Developer
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718
>
