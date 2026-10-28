Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184145;
	b=ch3bdMUwyH27t9m8kKnva12dycKCVW5D9Tnf7L0mNZONAuosap9N4PEJ6nuWjQlBTLku
	 lY0nliy35GjL8iZCDBBwAWQyY38mLAf2fnEHf1zs14baPD4bMzbYN228yiLc8kijPHh9D
	 xRV2suiIu3ezV6qJqIAoacddsrcFGmFcrahfI8noAT5ok2f1rVoF25MUCJqyR5PXc43U1
	 neZNguTcp+P6tJ3WUGCjR9DBJQVRmA7o3ykBYm3H6WW8UnFZSnpgiruGT6J/nC7IDHq8Y
	 9AsIMCCI/qn9l5tWZ9Vmjr94YNc5Q+mnj/ni6LtqtwQQQFiqXRv6iWxwEdLzDbBxa/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
	b=LVmCr+xQxwBGs399vcoMWydfNV7ZKrpWLop4gR/wyu/KxwjSCyA68u5PPcxFdiMEiTu4
	 u5fOPd3o2+s3hdpd9Rezh9J+JPnr9Jfc8TuQOeCEDVrizdiH6sFm9MWzFXT0+YGluOWbm
	 cRIkQyzpkeqf/fBoGgtjY2g/k94t+dK+9lr7y6IUEGxh1gjZ4QFclCHEQEQ6BvdGe5huF
	 udLFaYVl0Pjub+Ecub7XZoUzWfki684bSgJI9Rzc4I7b62nhpo/csM4UrE/b4QmUUtQ08
	 rlUoSLC7VWX5LMCQSIEKvV+tYj3pwjOVuZaHyPR9h7rjap4Fypd2EGWjnXL4SjR5z3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmLAmyUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfBdqoeI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9208E606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9208E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmLAmyUm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfBdqoeI
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8JxG03892467
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=; b=mmLAmyUmawismWCM
	8D1zgUydQ1Xhy0P+VxZ0PyGm0kc7/uWAHcrFCJVniY9LLW0PtJmObLbQ53/nsWr/
	CkbEEd2FsH21X2F4FW2p0R2yTU3kHIAQWN6ILFgLYGx88ZhTBJdo6Nc819UQwAmB
	XSw5K0I1fIuWgCWjKOQuT8mJpj1k+lz4AoNT8gc1rHESfTlLglKUd80vFkKqlgJ2
	rzB695UWp/wYvMzKlsu7kXFI+2C/+EuHzk8yiVlnKjYvCAFn4PgqtXtbA0XZZXSy
	1SHMQloONLSwZVaAY40+iOpWtV5f+j54p8Ck0uXszn6mtkTzk6+j/ee/SBpa5pyN
	9Zp6Ng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f920jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:42:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9d52f684fso8029065ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793184143; x=1793788943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
        b=kfBdqoeIO0DRvKVGSd/doQ91F/4i/COtBaN2RGThuLLqL+GPRIXGi5hOIQXtXQucHh
         HmWeGhiY2r704PR6JraNEwE5rvjJOz3f+ja+1oWGQ4893jntRA/kBawued1AuQWSB6Nb
         dTiwommSdDP9oDqLzGNPhud2rzMPAN/oIbQMcjLQsELdChmdIWKlhfUJ5+bZnP5Opkqi
         6ojn5ODmaq6f1+RAVMLygCA35R3qst0LTDrq18AZVXcBhujC2UB/UwVIibNK37OHJdIW
         f4Yotz9RoWNmh9kBinPruzA/wO7y7lPN9UMTlUBhy87aOlBpcDHsJDDUaivV9FRFwlD1
         H+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184143; x=1793788943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
        b=efzC/wLKEmGgKilK78GfG3Qzl1h1QC7GCqQti6HuV5FEzmLkfH1wfDBR1JpvX84uNM
         FASikZc48OVptOvke2aef8hPrhBZL/URlvByZ/eGVPJvEIShu2Sy5usPRRx5h/n2XlTw
         O7gdckUUY4kCAmetSASXVdokdiJlhNX4+Hhge9qq7h8duCbAM8lyeEYTK87tQFfBGddo
         Hy5a0TJtlSbfFJJdbjBNq7L7c5Q7S+natzSVVgDKTuIZ0hsNtSDMQ2Z+awFtnw896Tu7
         FrT0nnZqmMIGmdE1fB1+Y5AOiFrr972aCGZ0kLRbom33Lia9h6Sr2/6Hccq7R2GdhkgC
         +2ng==
X-Forwarded-Encrypted: i=1; AKwUvBwGvUKx1dON4PMytrI0DCi1VRxHKSPfj8VYQhg7edK/H/QjBPZlpgHxpX8VbN50ul2cXGDj+KCv1cgm7AYm@vger.kernel.org
X-Gm-Message-State: AFq9FYKwtPED3z1FqDPaF3pg99TGZB9eqggdLPLR2t1QOLIwsn5ZIasW
	ogiZYGK4Zyvj9iRIeVb+fsDhVQunotUN88NtHYjKWYUuBlTdgROefzVWuDDJRIqqnbfIvc+phVA
	hUNZrGONbC/fR4hInO3iqr95XPnZcgWGgad7ZBFvq6s4aOcT7ZojoFAgu7JjHsmjbPj5M
X-Gm-Gg: AYBFou2F6dN1/sOgkoJ7yTZ99P/X/56sg6dWvKzsIe0pqZgr05iHJd4vtiO22nrylts
	5kNmK/1O+rDjMg7s4ekUb0Fvf3ydb2T9KFfFmFI3WyUmaVlCNNRq20e+rXGzL5BggAV/6wIl6gv
	V04c/AFTnkjkWgek1cSCJAZHDm9AZIJkmeIOwwTqoHBu3TACAs0JZpFczUBWLo0aswKN10zFODA
	X8uO195JXlAinAhiIhFoB0USvXVNvcM4qeYZWe4BhCLvoK+/mvbJiYMXtawhyW3koRetDTPQf3w
	ovof1QoYdAZeqKvZfRHz6ArTrWrYo6aNfadm7QBCv6iGfJbO7uipbIeoTasrfK6yTUAUmIQ1N5R
	crRvA3+Wr//CrFYrlmWbZglTGOnub5q3JNBfBgacDOX2q/gQjKyR8/PKR6Okvr/1TDv0I72C0kc
	N7GmbKDhuOOAWWY3K6yWJDFiBFJvSrQLhCZw==
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr1449753a91.45.1793184143115;
        Wed, 28 Oct 2026 03:42:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr1449738a91.45.1793184142665;
        Wed, 28 Oct 2026 03:42:22 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a58d1sm2493140a91.9.2026.10.28.03.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:42:22 -0700 (PDT)
Message-ID: <218d69dc-5761-4a8c-824f-7a15307f54a6@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:42:17 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
        'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1d18f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OGqcxO2SmPZ7BlYD9rsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX+/ynf8TZPgqt
 WuwtjOyP+Q/iz/76i9HAjVXcIkhVu7gBbw39myqCLXGZ0JkLwvhROJHfwcpUz7abLWbL77T6TY6
 LrxhHvlSoFcYmh5maY2QmwomIMJ6VBY=
X-Proofpoint-GUID: yKFCcJ4xyi7ceJez5-22WMWzpjoTv4ui
X-Proofpoint-ORIG-GUID: yKFCcJ4xyi7ceJez5-22WMWzpjoTv4ui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX8SYegATynH+L
 +UWftqe88o896UNiAKsrb1h7KIXBvtqhZlM1p2f3RrZT0GJ5kzhdL0Pbs9+CctxTpNvBkzMfrxH
 FP95DUcVbtgt5/a+0DVVlXlgiE6ukyBqiUweAiAvLd5ER8BIlkc28AS4P9LxB0RoNG2ABIc7or+
 O0ZwJSxPoVvp9M6GNprwfrkSfq9wcr+NiyixzzS0wqoQ2ONpkE8F255/DPGmeozirTuJSFCSEBk
 uR8lJcF9h7SeNGMNbuMRBVupIkI7xHp0dr+i7mhsmutoEqE7j77QqNlRXth5bLc/R52RrHCxj+K
 37eH3XK3mztuFiGYIvi3DYiSJqv7AGfBpe3qoY25Qz11BXBbDFywE/CJgUNKtN62Mk4kX84xiCs
 NP3x1Hrdn3JDltk7cRuFS4QB3nSYX+KPDkOSSCyXQQ5icPSKBuYEJe3z/fpU6wnoFKR9XqyEmUw
 nbEHdlvk0VZe2djxFrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

On 10/28/2026 5:29 PM, Qianhui Xu wrote:
> This series adds camera capture support for the Qualcomm SM8750 SoC
> (camera subsystem block with three full and two lite CSIDs, six CSIPHY,
> three full and two lite VFEs and three CSITPGs).  It was developed on a
> Lenovo TB322FC (Y700 Gen4 tablet) and both of its sensors (rear s5kjns,
> front gc08a8) capture at full resolution and 30 fps with it, through
> libcamera.
> 

Thanks for your interest in this work. It looks like this series is
based on my SM8750 series.

https://lore.kernel.org/all/20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com/

However, the original authorship and Signed-off-by appear to have been
dropped. When reusing someone else's patches, please keep the original
author and Signed-off-by, and add your own below it with a note on
what you changed (see Documentation/process/submitting-patches.rst).

Also, the follow-up work on top of the SM8750 series is already in
progress within our team, and it will be rebased on the Kaanapali
series once that is merged.

https://lore.kernel.org/all/20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com/

To avoid duplicated effort and split reviews, could you please hold
off on posting this series? If you have improvements in mind, I'd be
happy to discuss them on the original thread and include them with
proper credit. You can also split the CAMSS framework part out as a 
standalone series so that it will not influence the sm8750 CAMSS series.

---
Best Regards,
Hangxiang
