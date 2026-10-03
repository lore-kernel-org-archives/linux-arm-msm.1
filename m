Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0231C5D72
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791066039; cv=none; b=tFmaZxK77GLMgBm2+v+K62QkRtN7YJ2lIw05Q9HmUJ5mJY54Re2EmW4cQ4CQxUbxRTfSuu4XndB2TryM+gZumpJ9gCYy94DDVfPbujurBbXOY/GORNmuMdLpwo34Q7IDIBsH3o8LqHi1e5X47YS1QKaCD/yYo6pOFdUC/CoxcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791066039; c=relaxed/simple;
	bh=kOE+PvxI+4yBG0TNtYvk0ZajJYnO90dr8q6q825hdlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7MnGENQrM0RC1BtyYs8aM8rN7A5pXcvPLHOlI4GGGBZrmjPqRwCQJ02SYBI6J0aBOKyAX9r5Qx9wFjsAZUUr/kP7OwIUBhHGdDD3xFDLrZvv0rGFNZHiFkw8GhZTQ4ynFGwutmVAfiSBEmw01UF0ThGsLRsbzIRYgdbFTQvD/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQ4mZEd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mf4WVqkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ4mZEd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mf4WVqkf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693KoeUK1288350
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 22:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZDUY4/VeGKFBMA4JwOSyOd7J
	xyUkDkfT0gF/JVIGPn4=; b=NQ4mZEd3FAsW2dkl8OqrjjtKWfP8wtAPIpaVmGly
	Yp5EhqD8FO2JGnZmIzuwX6gvBFFohxXfxZMBD6fD75OF2U1q+LD0GTz1G8Ber3ek
	NltrQakv+zZRMtlNxOUfSHu5GUYAeB6o+MMScpkwhVqvlqhfDGUtMCJy7qPnpnyl
	whqGJErcCbJjqDFCBPiTtJDt5LbkDI/CsOwHPXrldej7y/iPTIKSQgMnNAkPGFob
	QTwhoj/tfMueJh35z2l2zFe+XtMBoHOB1ztJxsIWL1MaTeoDuJTOxhi1CfS41bDo
	Xb4dDAoaISke0Rv+DatI6ZbRXrjls9Vy76dLYO8AYxetCA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu9xc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 22:20:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7be93024717so606113137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 15:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791066036; x=1791670836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZDUY4/VeGKFBMA4JwOSyOd7JxyUkDkfT0gF/JVIGPn4=;
        b=Mf4WVqkfr9qw86kTjTyeiAF2Q0tvfwbFUrtoLezj+dlJkim1hh69dYbY+P3ASM1JCa
         l3A/5G0j8CykF6TfKkvVH1Sp+/wwJ65e8dTIo5S5kFFI4iY1F3rdC6n3LLKdnJNgZB6D
         F2N3XAP9R/mTz/WmHUmVILzMD4vaJK8tEyQ8528i3QGcad66AWzU8ELYjxtp00FY7A5C
         3VazIzk2rl0l92CwQyrGBIteiPa4fTgL4VzhSYlZJsnjaWKXoNYP8pfvQHJvar2oByzx
         C38HKTJyWVCkf9OduqKM4hEpD4ekw+4Zx0L7CLdOkeLgfd4aqua0rMECWGbSjxymga8B
         HbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791066036; x=1791670836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDUY4/VeGKFBMA4JwOSyOd7JxyUkDkfT0gF/JVIGPn4=;
        b=pTsFGlxYnD1uOsm2EcrlRMgKW9mvJxx2crjLHBA37APxa58AglidTLAno2G2aqBOw5
         rm1htDN6Js/RJK1nr8JY4wCqGTDzSLJL1RqIjiYgdvI2W5rKrMw08eGeA6B7+F0LlVdL
         fx+WQsVrltE86Mhj+TBmQ1qlPI4coD+G8IEUuf4V1m0qo3ys2/v5aers/Dk9wZbzmN/S
         FR6FiY0ce5uokwBtya/mszAyguSxcZgxgWzlUZi6vWY9HvY/flzztEFlz6h3gcsReJMU
         Hxkc+yDdAMIXFLGrN2KmPuBV5UpjLNrAEngmpTyruc7sL9Uap4M+J61cjH0ntuDkf8sx
         0ZCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcSVq9AfhYfRP+ZczW5HLKmYkOpOu8uQUfZbNNKSFJ2hm+uyAc/LEE2GYt/m/1nwKzdK5iV7ljDwAva7ow@vger.kernel.org
X-Gm-Message-State: AFq9FYL1aUiufSR0vUZ987xkWqSg+EGMLcDnroAiPW8t5uu+6MK08kkY
	NIhlyOtrkFUKbDeI1u25xHIf+OZK/f5/3qfhKb9yaqIU6bMIUI08sljDD0qpAlhgVE/AbTW88RX
	yJHAWiDu70jPGgfctFeJVna35APnFdjm9zpMYzvw6ScBvK8feF/QYy/nbBdchpb3Wwgoahq4+tM
	a+
X-Gm-Gg: AYBFou0KsRM3rI1Sb5AZJ/bNl6euz6rsTWp92NflucCoUTViFEOirCcAc0YAzOwVU6Z
	dwK+27V6Irx+Fi5wUvM0BC2ti35ly4fLUfGEpB25FvDAjpdmD4678aVw+MbI4JsBwMUcjDMm09y
	pbYzkpm98URAbQnPhNjr3FDFvqYz6G6uM/6zSLroyxmOcqqx4dGfKnM7vDbBPaXbbiM5Rkvk4+T
	o/H4zPT+GMoZ2+WW95zUrlkTWQvbcWwwYpEJox2PnaZha7A0GHv9t3GE/u7Ho+6SfitH2vkzPWm
	TsxhgAVE34e18hcKaIj/BRkPT8WHDHA8h1WvfU8ka3LdIl7NZvzckuoMKXVJb/CRhvrjk57KtzE
	UYhf+AsjBUjyU1s104bbx4oOWnmf5aaEhjDke78dDPY6XO5T8qywykMI1OmzKcE49+YF71rz14v
	KCjSdGG/gtUTL3
X-Received: by 2002:a05:6102:3c89:b0:7c3:a114:99a7 with SMTP id ada2fe7eead31-7c3a1149fd1mr157084137.14.1791066036423;
        Sat, 03 Oct 2026 15:20:36 -0700 (PDT)
X-Received: by 2002:a05:6102:3c89:b0:7c3:a114:99a7 with SMTP id ada2fe7eead31-7c3a1149fd1mr157066137.14.1791066035847;
        Sat, 03 Oct 2026 15:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e333cf3sm24109191fa.39.2026.10.03.15.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:20:34 -0700 (PDT)
Date: Sun, 4 Oct 2026 01:20:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, akhilpo@oss.qualcomm.com,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        jesszhan0024@gmail.com, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, marijn.suijten@somainline.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch
Subject: Re: [PATCH v2 3/3] drm/msm/a5xx: Add hangcheck progress detection
Message-ID: <ffjwlr4kc4rxb5rktabvuplrz4kh4zrpki7ctz6mrkdtyjvk5f@r4easyboav2s>
References: <20260930-adreno-progress-v2-3-3882f0fcd7b4@oss.qualcomm.com>
 <41bbbfda-de3c-4ecd-87f5-cc784fd6483a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41bbbfda-de3c-4ecd-87f5-cc784fd6483a@mainlining.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA4OSBTYWx0ZWRfX9V0asQt0rBMW
 kcJO/t/WdPWnkbpIHEdjRBC8nGI1tlJr6tT+CgMJ7gT1q8elJeakhFUSLzxOC218BSAKi2zsK9t
 eGBg8fYn7vHU+Sp9DoQWuX4QC8Nerfc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA4OSBTYWx0ZWRfX4Gx/IuPll83o
 w+2GMLw8YLEJ/Y/VAvlYyMzhwp6735BhYBDrfdDx7MAnKpTYovUvhJQFdHFtN8+e0azX8BCQDnn
 RGMhb9zv34QAdNbO/Iv0NNj6cubsY5nIWLJB08EN10DhZ9Pvty1pn56NaEMnd+T7L9DiQpmLboZ
 8yNO9WRA+rGZBU5utlJ9Kml4xyNDvjoi4x7Qb/ZuEv75W0x+xmD58FGrHwK5IKytvahgqo9hT0Y
 Nbr83s42aW2n93DzhruYgyXo4jrTC5ErPrU5I6o12I1kGIElPNEWK9/4D4J0sGayfHihy0GS1km
 QMFzfWVLzaBvpy11HalvsOOMtLOoMGcN2EmINs+KGcNaJ8caw0qDXzhyebVnkmTeuzSM/Z0Qo8w
 2+R9UC7hwjFYp4oJCHJOPL5XvhyuhAfBT1RdXGTqk7SnxP8ImBaY1Ln2Xlw44hYYlmf7tsWLvj6
 OQ8olVyeaS4VXaOrN8Q==
X-Proofpoint-GUID: rFvTPGrngVO1bDMjnNLCfMrwrS7MRliR
X-Proofpoint-ORIG-GUID: rFvTPGrngVO1bDMjnNLCfMrwrS7MRliR
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac17fb5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=TF15XWlp9_Q2BVNvarMA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030089

On Sun, Oct 04, 2026 at 12:15:42AM +0300, Nickolay Goppen wrote:
> Didn't solved hangs on sdm660, but I think that it isn't related to this.
> However I've managed to get a command stream from hang_rd. How can I share
> it?

Open an issue at https://gitlab.freedesktop.org/mesa/mesa, tag robclark
and lumag. Please note that for sdm660 you really need the patch at [1].

There are also several known issues which affect SDM660, but they are
mostly on the userspace side. I hope to submit and fix them one by one
(e.g. on that chip there is an issue with the blitter programming).


[1] https://patchwork.freedesktop.org/series/174541/

-- 
With best wishes
Dmitry
