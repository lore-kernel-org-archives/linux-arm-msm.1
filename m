Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DC4582E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138625; cv=none; b=hgi43Nt+DkIqfrgKdp/E0Fz3jba69Xc3BaJulQngKglutbmg3Bt6EiRnrtJ/2z5GmX1jNjvCHGyi3shfOnK1AQf6/gTJ0oKRJRhEbZ0VSSV676poUzqUDIJIx3l89nDqmBSt52fGa25C16Rbr28y7nS3H51hKBx4i+hCW9n7D2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138625; c=relaxed/simple;
	bh=9jYq2QOUqVO0jptGzj/ZGiacKARCDAofE/opIhkiADA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbJOmrNNm9lnlK6fWbC3IT89yIEBuUyI6IuuiVVOqMnnF8YIPADkQEJmfbZW3qb/ZLhzPMRLJyffMBtgOWZn84disxPo2ADJZAg47WTGRR0uI9owF+ah2u3cQowy2RhwkDLOlcbnnx1uCTuzuGKec2QN+8VXPqd5dHUqAR02+hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCLK/Hbg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XANhDWTY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCLK/Hbg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XANhDWTY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7bcr3660912
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jYq2QOUqVO0jptGzj/ZGiacKARCDAofE/opIhkiADA=; b=jCLK/HbgkdosKVXY
	8w0nQREHfGx7bIMDkPKncmyL8DkZVRNLfHr6gbGlXrlOAKjFVIDSLAmQHpUPm1di
	xe1TB4vuXxukQbZNvYArOLKV8GumWTeka2jfHu0WzTGvLZ0n+5Tbdvya5Qbz+2ww
	lDZ8GDaaP/Mu+VyZAM91TsdCofPTEq0kaHitF5yCfmIWawQ/gqBzb/ADk+QRzmmN
	TQ+UkLH71PepT8JU8mtyVFaeDmtx3xBZfabo6aSZmhgFddYRQXk7yqjWgxkdOkeQ
	Hv2E1lulc6I3saNizbILMQYxY+KqdMeBJ2X+OQYSDlWxvCgr0+UJSDDK2PdIipoY
	923n0w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkjyaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:23:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso552696a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138623; x=1787743423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jYq2QOUqVO0jptGzj/ZGiacKARCDAofE/opIhkiADA=;
        b=XANhDWTY2URs3Py5hBaqUcKkSQGrtT6lPUzH/RB28a8gVjAwDb0HZtvhIUhHo+vyDf
         fvm3LR7aTibztL+EyhLrmfGJS77lSdK3x1suVm4CUDS4eTnsnFfAd3dyjwhj2W9SKvnc
         74zTnyQoqrY1NiP3oYXW/R64KqK41FWx7xOB2aenxdqN65qUwe6AvWZJ0J33nx9NHJUi
         AQffys8W9oF7qrByTSuTEnVoauDW7X+nfhDqe87klRPxHm6xIbuXBRYY6lcVUkwGaSU7
         O3d6w64WZOx8DTjqgYMBvGZZX3/a5U/iBdb8TcbwgmHVX7wgjMNdEfDyylv5yG2/MiHd
         rwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138623; x=1787743423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jYq2QOUqVO0jptGzj/ZGiacKARCDAofE/opIhkiADA=;
        b=dXza8Ji7eqacWun2vv38xE+89S5oQlsmFwanyJMisapFuxG/KKzhKRRQH7djm5CL4O
         k7MEwdLu5pB4e3QnDpBQnoAb1V9ZD9XwcRXMwiX1xfyxNv0GntsmrgLr6QbVAPtTteVX
         YYa2NalDK0GZJiU9qHcBSe9AFHQ2FFLobquKwzG5qIdNW+NjEwR4o7Rq09TCQxbUIACn
         PiENiFRsOt2olwk9QeWxlGaPoBRldB4P+82wjM7A69oF+r6C0lbqwNR7i6J39R8yFEO6
         YR7waQmdKPLaOlvxtuU1LHum4dGtfGM0GNITKkFbc5JystQ1N/BmnOlf0DjrRIU61lSx
         nlag==
X-Forwarded-Encrypted: i=1; AHgh+RoyKgcDZqU3kVv/YHBDsyUNss8Cm/R+373wIc2Swk6nqIHBDqUJ2GX4NXuuiAlu/Sizhl8gyCbqfADZfnQd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8xqJFNWxhh+zZ6PGdtLHolKv8Z/f6qyp0t0TQkA6UBunfrfLC
	2tv98hVCZPpQn7688pS/V3152mMu4XHyCAItL9QWKUozhTP4PnOnWibD+YRmD3jQIhTCKHDm407
	GYiCeaHttXh5oHRtg1PFhV8DmEIC9bn2u9ZhLRsyrakcgxXQDqCsmH/DTHjpqYirSo6cb
X-Gm-Gg: AR+sD120fh1d9LWreKqAVJUti4GuX3LIacU4RKqNFNnICq2+zCdH2ju1ueqfWIeLyRn
	3TfH3l8xkKz1Tc0Kyw1zBtXnI47Q/qZ/4nvvdMqC5eEiIXTY4YR4/A3KB3MufPhcA0zgB4GWgnd
	CDjeYwp8VXHHhYU+hg9tEodiuBBZU2wYfcqofS5ab5OObE6a5i6Na42xROSxI3s+YL93PSG3utj
	7G6vdZzVLm09hBJK9R++iszaeo62mDcUJdZehlADYQDRC62j1pwgDaBWPx+Uj2cJo5uv1xEGr5I
	ml5e6mxZDMqe1fLE+LV75f4qTcoCGDvElfBq/x/6h54IxkfSgvPrUbyGx7S0DcbbaQ2/WEn98L3
	wlTdGH4sg8OPZJESHO3YWX2Xsu0qcRFcFXg==
X-Received: by 2002:a05:6a21:6e88:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cd016b15bdmr8241843637.3.1787138622964;
        Wed, 19 Aug 2026 04:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e88:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cd016b15bdmr8241752637.3.1787138622509;
        Wed, 19 Aug 2026 04:23:42 -0700 (PDT)
Received: from [10.217.222.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm10823348eec.14.2026.08.19.04.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:23:42 -0700 (PDT)
Message-ID: <b523b910-c645-44b1-9e76-1d25fac16468@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:53:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com>
 <20260814-modest-rose-salmon-7bb60b@quoll>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260814-modest-rose-salmon-7bb60b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a85923f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=xR3Y2up12dx3HEdxvAEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SV0OESK1VC8QEjhnwVG457gmKVOrJvrq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4OCBTYWx0ZWRfX/I3jCtkLl8L6
 rizgybutKAiqeiu25zalkgrdj1GoDoMhCsP9Oc3zeAQAP/Bx3n7Hmf0rp9b6O30bO8B4V+RresV
 sHRwXsFKO8j2y+j+gKsIJn+Puom1q6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4OCBTYWx0ZWRfX3mBFVOt7ezyO
 fBOpMAWnAurs1OzpL8qiqu1SmHYuAFhMSl4E3oHwL09hV44irh4yaD6gM/dxtsclfc+muU06z8s
 jQ3EzNfeQJEIzjFq9V3svr9YuUwpOYQ0y5k/YgbFebDuWZVrsodsaDc0aKwvxLafbt9VqwDnxf/
 d2HI5SpxHHyXyX/7Hgl96tPDIPaDdUMH6chSlX7LwOV+BTcA8CZrSvW/Wbu/nC5f0Y3oP1vgl9A
 pgLJ6GChNvr3i0qkWBjg7Sqg2+20a9kFtyyIwyOlL5P45kCs8rj983fGFqFNR9UIjSINzLjDeUU
 NrATZHixSmcPghLFZaJN6X9st4feJnZnimil7BkjcwM5bfPt+3GSfOjARBXv7YImPcFvaiuIG8G
 lSlFufpSp2g32I8LLyA56t2zqVZErc79zTkWt++tnE4UJBRkNbE3Lgnru5CGVAeo20SORiQ47RY
 kecFaydA2DaJC/9uGcg==
X-Proofpoint-GUID: SV0OESK1VC8QEjhnwVG457gmKVOrJvrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190088


On 14-08-2026 02:35 pm, Krzysztof Kozlowski wrote:
> On Thu, Aug 13, 2026 at 04:55:54PM +0530, Vishnu Santhosh wrote:
>> Allow an optional bam-dmux subnode under qcom,shikra-mpss-pas by
>> referencing qcom,bam-dmux.yaml.
> I still miss the answer why. Last time you said in present tense that
> this node exists there, which I objected. The answer to my objections is
> to provide proper reason why you are adding this, why you are doing it.
> Answer almost never is: repeat what the diff is doing.
>
> You change something in the bindings because something exists in the
> hardware and it was missed in initial submission, and you explain the
> impact of that "missing".
>
> Best regards,
> Krzysztof

Understood. The reason is not that there is already an in-tree DTS that
fails validation today. Rather, it is driven by the intended Shikra MPSS
topology.

In the earlier Shikra BAM-DMUX DTS posting, the bam-dmux node was initially
placed outside the modem remoteproc node. Based on review feedback from
Stephan [1], it was requested that bam-dmux be moved under the modem remoteproc
node instead. The rationale was that placing the bam-dmux node at the top level
makes it impossible for userspace to associate it with a remoteproc instance
(in this case, the modem). This binding change therefore exists to describe
the intended Shikra MPSS child-node topology.

The DTS user of this binding has not been merged yet. Its next revision is being
held until a separate discussion regarding an XPU violation is concluded. Our
intention is to get the required binding changes merged first so that the DT patch
can be sent once those discussions are complete.

Please let me know if adding the above context to the commit message is what you
are expecting.

[1] https://lore.kernel.org/all/airpBYZ2pRdNaE1v@linaro.org/

Thanks,
Vishnu

>
