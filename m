Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010136;
	b=NkDpx2XLmAeZ5pVNHyYJz1KAuxmEfBCSrFOavYPow/nFuhFwvnQLEA/z9Xw7F+tPo3lH
	 04lxNMt1U49pXgJmlKJzqshYYCOuEEw0LUxJ9Aame/Ce4mXADT9Vfkmc3WzEovR0zQDEd
	 w6rZ29PmxP8qKNq4YkxWv9FaUXHmXA2PK2cOpKY4jO6M7aE5j3kUU0h05Ze42JkD3GUwU
	 Fiy7x+uRRPERuZ+M3oTTlcNPd8bopPTrd4TQt+1cKwj5P+j8IdR5OCpQUFcZgoSEV9UhV
	 hgd5aK6UieCWFQ4B608og7mcANdDtxWkG6oPj6BoAptqwA9laXcRTwHd1DOZtPRjqnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
	b=JNFrpQRcQEq1faE+yE8YDUDTK0glGe8/U7LLYXQ2gd03nAg8yofFJQyzBRVza+1jw3Ux
	 lfKS38umIpVFo0hAH6M4zm3J0ELBHb64X3Oi0RCDP3nXr1zNWfbDDSvJglIbOhxeLs7c/
	 gs2iwj82XhyHn3eFCVTQifM0crZDIVzK73YsGKm17uevRKqsQV8mb1k07tQLdDuAjqLxd
	 sZqJBrIh/BnsYyH+3gfy/iaaSZVZyfWwxV+T5NQORBVvnWPT8c5VoR/95G+1uKNVwYqUh
	 AsJyKfxSwDyy/hyWjT7ju5I1eM3wtD4NWKsHS3amJ5xVOBYUAGR0fY3DLfyQ4EZSxIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzghUXN3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJK1w1kf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261A606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7261A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzghUXN3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OJK1w1kf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSSc1708639
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=; b=DzghUXN3GTriIoQo
	uVKgpHKJuKi2N+Uxol72TGifH6HJfclAUE27lq7LK+SiKWdF5BDiybBP6PaNCyao
	75JN3do5HIGuGXpP36SEc0/JhsOceDOA5od4cqpVX0RY8iF/zZMnHvKoC03XejAZ
	saR6NQAfwO+CavhgH1S3C0H+3flrzrG1XmEZLyvxeCJMX3+0+UwWUd9Re5itBGD2
	W4UxjqyodaKDeTL9yNScNt/YynzCv/AfJmS92TqJQHTK1T2lUgoo9kASCHnf7O0X
	KV7ha4iPcf5OwVVCuw4kFn+SMzY5KuRDoSs2H3yWohI045L/e0TrqFk5LjfFItax
	HjipPA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9yvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 10:22:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc48fbca26so410531137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010135; cv=none;
        d=google.com; s=arc-20260327;
        b=H7t0riQipQn4zmxX6GXn9p1gmVwHi23UX5ADK8QPj/nECw5tquXkSUNhjXV8QlecKC
         mQeR2ZSj6GKlPZblj3IaEyfL+NvdVhepSO8f23egVpIEvx4OSSXrwHnoQHHFH0aWJ+og
         k7EjfpBRF4he4OY2sLBY8QVacw3r9TdLAEWrrBPwVbIhOPNWfyVZ19fmJq33NNU/mEVy
         r4a3zsvzwfW2VXVd+ZjdHDQ+pmHy9eRpGad71SogqDHAz5s57wqxkmg7rxNgOhmVJkb5
         Ux+SGGyBzuLiyyOraIjxh6IVFamFPbk4opEqOi6gzY1H/nSkzsUq5wP6htGJ/rnx7FVc
         ZlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        fh=C4e+6uV7BrgWpcNjyvLviaHdR5SpA5jroqhuFY6k4fk=;
        b=oYRvpiFrfva9gmemqgRajd6zFISxj7xcGqmvdnrcq93mHJcaQBOCHYvdtpDHVw8qAk
         TsqUpod1EEae6Z6Wy0jvrhY+wn7iSV1qOU6PFWu6B/NQem2CEk6qm0XsPfAiWhpdyBRm
         Sm2yqSrAd5348jwaYp3rWdgat1aaOMKuXZgHRPJICrQc2J3ScA2pVuOJgxyooxQSV5v1
         rJgbwRsKTEUUTBJpe39JfHMHZIjDkaHwQPqL67L80ysIgQS0pBZ7JipRx3hgggqEtjBx
         1K/naMxGwsJ8NjoQI5m3Qit00TLAKLGys4UBuBa3pwiV0gvmICoiuxni8lBYPU3ox9Aa
         jH6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010135; x=1793614935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        b=OJK1w1kfj6ZT/c8pmUQgUMX2Q93wUv94Bm0pKloZ6krZR5m1jb7hnjh6y0WRZJCl/g
         SO/piwXIW0Z1VpWvh7IfVeBd53LrV9ffdClTZoJUxjdxqk+K2CD7+yz/8cc3LDBbR2Ut
         gGumlQtAHa5MpsdhLAdd1CFzN52Q0c/VB4pJSgjcgZ2OENMTmQ91wZuO4pzOHZ6PsyBH
         FJqwG/74bO2rIwApQ50Z2u9Xs09HxW5ObIUgKgbTxegNlWfQJ3/s6IMvMe4KgA7h1rQI
         R0KsK73BpNGVWM3R+YZM4gNBeQEEFjkEUi2cTr4cp0ycxuQ8qYpAR4vINOluvnb5vjVc
         exkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010135; x=1793614935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        b=gfHaQihYxSHRTWC9NPl5Ev/Izk1/yXpf9/VLKgo2TXOKi/WqibPbpeeTjhyzRYFbPA
         H/eXe8yRyTiGhNfvhF0iFBQ932yWimYb5upp+ihxJOSQ/iT3iZVDLQvDpWP82wNn0x80
         Uh9n7fdBT8c0nmNwiGtzs+AR+93zo4Q211g4W1nuoXUbUgil1u7K/j6QAn2eWXEwVYtH
         GHXKL62xvuNeTfYgAH0z/FpBr0w4igYoGKgL8bKEocpAe4AuFD+rOoZ2ikETAbMrIvDO
         iU8e5pyRNJp9JFgCY3emKnKFI40K5131rxa1DBR3GOWgO8ubChwDzSZWlLdnlX/9P0DH
         QYKw==
X-Forwarded-Encrypted: i=1; AKwUvByVRi4V64mSJEDIr4wxlUvq/ku2QQpY8b7YjaEydfrobQce5mJvOX/TtNkXiGOQ3RO34z1+aPpi8I6+/DVj@vger.kernel.org
X-Gm-Message-State: AFq9FYK6Dxy/SwUsqBdtTmr14rjkH8PxNc6UIA2DVUDJZ2zZ0XVp0+OR
	XB3u2OUxexqA1D4Xp3xBFX1VpKxOf6bPDN+fvuJkaB9r1J6SXkFPxQcAEsTpSL87v5e0fKABy7o
	BzhpT+LF+RSGhM//L2FvPlTfOlDsHB1tjClKC+g5hNrjZ4z3ceHcxXbn2+8eltWXayjubY1SxZc
	PFNtmRhZdSot8NGY+z/3VKLsobhRBiCnKkDXW6AdV98Zw=
X-Gm-Gg: AYBFou1q8SaEck8e46mcHPvluP5W3ZLVWngshaw393dcb92MKT6xDSMYDBY541kn/Cu
	1m4l1edSi6UgZAsg/WLCIS69tJsQSSkpIzOB53OuQGLHIL6Lejd1nKxuLUz7XM0X6fRLVr7nYZu
	FZls2hcXEalJjSqf8ST6sUZE5tH8Pt34iqhiIRBssvNlZT/bKJpacYg2nQ9kseM2Ps1pRXT9pcz
	h8mVxdsnX8l/WxflA==
X-Received: by 2002:a05:6102:148e:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7ce5ccddaf8mr1532816137.12.1793010134520;
        Mon, 26 Oct 2026 03:22:14 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7ce5ccddaf8mr1532813137.12.1793010134104; Mon, 26 Oct 2026
 03:22:14 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-9-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
In-Reply-To: <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:22:02 +0800
X-Gm-Features: AclHuK_xlm6aQdEz-Css4rzUDVJF4QbmrIMsutgXwCB88U0Xqwpq1be9I71U3vE
Message-ID: <CACbMrhrJTacHvdJ7eext9ucxwo4=XEDnnxxtL+DSpYzw+ozKxQ@mail.gmail.com>
Subject: Re: [PATCH v22 09/14] media: qcom: camss: vfe: Add support for VFE 1080
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: cGwXzAEC9C6aozRWZ7ZBrmh5OCOzKfvc
X-Proofpoint-GUID: cGwXzAEC9C6aozRWZ7ZBrmh5OCOzKfvc
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf29d7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=q1ahQF__i1vN_A3V8cEA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfXz7CqBEZ5K0NI
 VRxwieyevAH7vhApnnlKmqg/5iX8PzTrG3ZoSm+lPKz0bAPGt/KV1y00hjaDyNTKL9cAYB8rP4A
 KjuXRSdAT1I1MXtYplfJFucmg3jyd7A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX/o92nK5MaIva
 a7ep6ey6DaZcG/s281NBHRFH673NohUA7X1Zz/pHt5Hn16ZH3NqZGWldzOR54oDZnkz4DRhiZxE
 bhbNJoB/wDkmwzl9iIVzGt47SFUK4fRV1gzYuFJV3bp+f+mKaafymfGRrrG5Kes/RkH9zOd62ui
 G+gSU+W1mMlS5JJf9+sk2350RFDdjjRtdoGLoQKvcEN9K6YPjyTXG5zUOp0w6K6rtnk/JFKPJLG
 kAqaQzEgwdsSbm0o+PlartKdKwMwVQF2XpTKGAydqiQ/WSHf8BTy/BFjsWBYqgHXv17B4j5VJQW
 gTNzTJqXbK9eCVRvbDXqEAAr3z6XQU28du2E7ls0QFPqf2g3b9RRHau0NqMja9ng2fQRZEzVY9/
 IzaJkGUWL7IGzecHLRdwloHwGDAKBknScpzdGLctAfrgG6GgSogkfOIrjR25/9QP99CwsH5AzR1
 Uid+TYJc56xQioCekGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On 10/26/2026 6:00 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
>>
[...]
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/p=
latform/qcom/camss/camss.c
>> index 7acace363fc2..beca4b827b32 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -156,6 +156,152 @@ static const struct camss_subdev_resources csid_re=
s_kaanapali[] =3D {
>>          }
>>   };
>>
>> +/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
>> + * to operate on any TFE Full.
>> + */
>> +static const struct camss_subdev_resources vfe_res_kaanapali[] =3D {
>> +       /* VFE0 - TFE Full */
>> +       {
>> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +                          "vfe0_fast_ahb", "vfe0",
>> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
>> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debu=
g_xo" },
>
> Now that we have pm_clk in the main camss_resources structure, it
> would make sense to move common/top-level clocks, such as the AHB
> clocks, to it. That would avoid having to duplicate them across each
> individual sub-block.
>

Thanks for pointing this out. I double-checked it, and this makes
perfect sense. I'll move the common/top-level clocks to pm_clk.

---
Best Regards,
Hangxiang
