Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182401;
	b=aYldinMz87YeVz/njrjVmUQ3bcPXPJqUOo5ZDujxK2Ir6VadKLJkXAnX2rQxwW2UngUp
	 hEJyb4UUQgzYO5msv+rsVam5EmSBN/rlsq4EouCUrQZPlZnK/yELYR51t4fJQTYY0cbid
	 fnM0KGlMxUX+648GQsWKooorAhObjBglpW8mgLMO+036fa05S+kKv0trfcFFK0GxsVk0E
	 5+Xovr1GCkTA7qycFIbL5mdfL+KljRlSuSPjXK31hKE0wh29ROG/A0DtBZvNtu/RIoCS4
	 4DKznZLCMthobEIhCnPXh0AvN7XV3EL7FboP5bC/6ttpBZFYyDpChQMn0cVQm1qANpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4GoiSSZTBci+FWZ8jvsDrk8LVCpVLRNNBYJskL/l8Fo=;
	b=AYzWeOUBeB1mbZbXq5pVHtj3wTv3rT7XYsW9Jw/5BND/I34R66+aiiPfPJE6Hu1Bc9L8
	 vgrkmEy5TKhYlLOozz+kRqIRrHWy7D961GhdSXbwpRQCupCrQr2nP+uHhRFCbWSLP1aVs
	 019cKXbwXCQCYd15m1PrVxb4xeNiEY74h5ZLUypciP1T2HPT64Hb5T96ifrUcaWbVBnmf
	 v+HHGv15i5ameXbPM4z9BeRomh0M9HM8UyvsjX5z1feMU06OuFEXEHi65HS5ifiAam5+6
	 OQM6Za32+GmX+B/VK5J+napfPoMwe9flMAF/pNhpj9graMs/QvMZP3zoVC6sYHSQg2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cVeYb1Zh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kaw8xQpg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB64B606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB64B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cVeYb1Zh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kaw8xQpg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K830253385
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4GoiSSZTBci+FWZ8jvsDrk8L
	VCpVLRNNBYJskL/l8Fo=; b=cVeYb1Zho5kN54poLg09hAt9NXAremIF2oEjcxfJ
	xZPGraeREvqLKSwr9ROKamr9he1IEQ53PM2Y9WV47dzINOuUekdT6PIawSIu6KJi
	OvmrfBET1dUzDId/nPkaf8f6h33UTMnt2F/ZI+CDYURZBcn0onwu9v04UqxCrKP2
	9ku9DMxl/S7c1s+/JfFI8LHhDb6m3qoQUBa5UqGYJrzWeM+5EJEKiuuWcNmHs/iv
	+xOfPL1GFqAeZdqo4RC3PnIFwMK1N8FkB3ORG0PlQA2opBcWhztNjZvWKMyd0yB8
	ZFy82CMvyPKQDx9RJ51+NRHuquLBOq2pjSPdaY2VYQpUqA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be1xfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:13:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so1742799eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182399; x=1793787199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4GoiSSZTBci+FWZ8jvsDrk8LVCpVLRNNBYJskL/l8Fo=;
        b=Kaw8xQpgNq198dq7TyahsEbocmVT6cuKa5aYvzNLerZGLlPa+BXk1u6jhr/hi3qe95
         /TnygKQEHLHjFYwDV4NpZegNGb2SQXuBwcONsWZYdD5zPTRg+BFr+cagND8ilrmywn1O
         mHAEHuNtyS2q3EKnFYRfaEwKeRnNY3VxOa9ftwgcOlFZwprJRrpkzF8FWjLYrjt2+qMz
         edCelqIOirriRp7TeR6KjnCeL/ecTKnoNmLQiwLSIedIl4RaTua4gKAesR9hv3s7PNOC
         2VP19vMtaxjDEg36GbbUylPqgwWYkCdT2wzVe28eZXqiJaN+nSmnyyb/rUsH9ZlkSLCP
         hWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182399; x=1793787199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GoiSSZTBci+FWZ8jvsDrk8LVCpVLRNNBYJskL/l8Fo=;
        b=2rhPwA645XgegGjCzW5cums/8CV1848mCffAsqqohDLsfJPLW7Bw058xR0C+w4dw+R
         C1DteOKsjTAIvQjk+aF4I1+jiuIWz6wW8OVcc3HeD04OnHEGZhGTeZWAkcDWdWLY3FWN
         dG914Vhe8CNsG/oYxYZcIPs+XiCKH2Y5/bvydgYvM/ubhzByz+xfLU+BK4y9JdHYXojb
         stokgntmPcavqRaOHtot3QSuL3VYBYRv33Au7zMoX7BDXwJvwqrJAbU7VqLeVDQddMVS
         nFZ12KK4ZZ1LHk3g8u52B3+28D6TfkiQuFx+oIgSf6Vp8t+DnngVqRgle9/TdsLGkNaS
         qdtQ==
X-Forwarded-Encrypted: i=1; AKwUvByIRPD1qqmV/+AtD2F8DvCTnEXpbL1OMCTz80zsowYqJ13uXke7CUWTpg88HwV3gg8x0IzgP9i4/TcfxZrJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4VFIJqhpbU5ZQ0bgV/fdRKI6oNykAQCyZZbDcRJ+K0DYH9RYp
	TaCTDBw3fHbiJX3OamARwh9d9UgtXA9927HE+EKFGJSskdPAwqLoWXnreaLoxUmvnlGBx5YwoBl
	OXd2Fur0l/+eHiYfJwr6VfxhH0lt+y7rfDd94o6shUZU12aKpXkm1l1MueJYgvBG2MWodduyCXh
	jA
X-Gm-Gg: AYBFou2PP+Xm2fKpEiHZUEn/ELEE6N9e8KvrYsTTW+EkCnT2K+wnbO2NeYPWFFa7k4N
	e8OH2KOGe3ZkoLQNsMnv/v//s6rQleXz69IQW3BJhDAr11lwKPLouF93Wsy0jvQZk8Sh8dK1Dt/
	TwMCpkBTfxuEPmqPzz3N3JBUHC6kUCq0ZOxJiZamFrFrmmIa2x+rtxllFJzB/ieGyCRwQa1bHUS
	HRZFFOuz1NbAzkKOWmYhTI1ziSDKizlbbP20raEZAy8yf/YOPCRGlM4LH2qbVruKiu6xWwVBmiE
	AlsTtj5x62e1mXgk8fCO3cbAiYeoRhazqK/NsaTD+1qfX+rd8Ya34O0Qc+PHOAaB8smCO+rRhFn
	2I6M5DwQtPGemNxn22Sg8BQi2uS5lLZevUd7Fo0mFanFhmkLeFtfupVS+27AKftIKsnU8EMuaGx
	W3JG0SZR6mbwRszq8=
X-Received: by 2002:a05:693c:240e:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-36a204049b5mr2973419eec.40.1793182398566;
        Wed, 28 Oct 2026 03:13:18 -0700 (PDT)
X-Received: by 2002:a05:693c:240e:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-36a204049b5mr2973376eec.40.1793182397948;
        Wed, 28 Oct 2026 03:13:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bc445sm4865357eec.1.2026.10.28.03.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:13:17 -0700 (PDT)
Date: Wed, 28 Oct 2026 18:13:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans: make the emac compatible
 specific to the embedded variant
Message-ID: <auHKt_hdMPaolIR8@QCOM-aGQu4IUr3Y>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
 <20261023-sa8255p-emac-dts-v1-2-a34d778ce9ac@oss.qualcomm.com>
 <at8Q9umfE2AP24lI@QCOM-aGQu4IUr3Y>
 <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
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
In-Reply-To: <CAMRc=McYTWmV6iAbm97C-xs1vh9Atvy-LivQBW10iHQh5+rPzQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: Mn61vfQfRWuyRa9evnMIkQihN4q02bIn
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1cabf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=d-OPr4wEzgqMDXe8fBoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MCBTYWx0ZWRfX/+AZJPra93fJ
 4lWY6Uymf5pWFwAfRv9dBES6kx//vW40Fg42xPf5MyC+Wihu+Ta5XqcMVtnlQLLVGfXn4sh/jtM
 sci4XvLn1Xu62h/k2zpTCdFfvlHRIB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MCBTYWx0ZWRfX/C/fXMfgBikw
 B2KQYiliCkzkxbPdKwbih2fQzVskM0knCETB2ZBpNBfncRHxKlGNKJKNvj9mKj7IY4KPiOJpftl
 B2tC6oZpXZlVZKpmo4A1mrckM7OUz3ZolMRykl/yJRi5RvidE8u1+jc5TyL89yXhhtVOS65XfuE
 MC4vFC8GtTxr2mPuETmvaGgLlWtPBW+XWt/R/oJ+klhdcHz83ZPqVBi6svy7eUEtDPSY2db8OJi
 kR8+aMgz2eDXpxXzFvAeEY5hMjGQvMlYzkjcWtPi9p9gXYM6eARt0anrtFzvQBq1mKCQmq/xC6G
 ai8BDZZUaGa/LNDo7WKpwfF4SXqr2BS/RSNtEW8o1vVWH0xweb/ldS+Sd36R+Smc5XQdDT4HOn5
 Ac6MDtPde5nNpOphflMPMNikY887g7M6dbkWRyMxFRfywRaMysNLS7KOscS6aOGyE5MPdKxgSJh
 rBKoq8d8IZS4AmQQIDg==
X-Proofpoint-GUID: Mn61vfQfRWuyRa9evnMIkQihN4q02bIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280040

On Wed, Oct 28, 2026 at 01:25:34AM -0700, Bartosz Golaszewski wrote:
> On Mon, 26 Oct 2026 09:36:06 +0100, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > On Fri, Oct 23, 2026 at 11:02:23AM +0200, Bartosz Golaszewski wrote:
> >> The embedded and gearvm variants of the ethernet MAC use different
> >> compatibles so move the one for sa8775p into lemans-embedded.dtsi and
> >> make place for the gearvm variant to be placed in lemans-gearvm.dtsi.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> > Do we run into any problem if lemans-gearvm.dtsi simply overwrites
> > the compatible without this patch?
> >
> 
> Technically no, but then lemans.dtsi is incorrect as the MAC compatible depends
> on the firmware variant. I'd move it if you're already touching the files
> anyway.

This will be inconsistent to what we generally do today for both
Lemans and Nord, i.e. we are defaulting compatible to Embedded variant
in <soc>.dtsi and overwriting it as needed in <soc>-gearvm.dtsi.

Shawn
