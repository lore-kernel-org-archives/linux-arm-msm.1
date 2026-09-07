Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964C481A8C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782706; cv=none; b=ciw607J6vYnaq47JxURsVqbvvshvi7R1Sb2rPCqKjKUnjbikaNi8Mk5f+cgDJ1M/+dwIcmBotwflvnNlJak66W8GMy84iguOZfzalnFUCV92s7VvgLiwE3U2OSlFIDa1eg0Yy3xNBy6OBpPXEV2W1aYI5APdR2KsWyQ9HUoyG6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782706; c=relaxed/simple;
	bh=gMWErXSYRc5v7JBT6ywk6kOtY9nHKNpPH1IBdR78J4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5LWA7k0lchTMGGcFiMJ3ym+L0ghmwlD3Bed5wQJi0jngqRkPQONXfKuCcRKPXQMSfZLOLFlURtm2GRWvytgBXLL0Vf7TeGdOruU/Ppnw41scPjpjG/HqRXD16jbpCJTNkST2y41cD8KSN9L8TGicEZDA603dd5P+8tgmkQpnp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=op7VPV6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYIHepnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="op7VPV6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYIHepnp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amx1Q810039
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 12:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=; b=op7VPV6NmM8jKMcZ
	wMx7pL7Q+WP58EWAJ3qDyW5Feedf4y9JHQJjKBu/oeHqpggNUWwOBaBeSPnU9wR3
	fv0vg0FxhsJ2MOH4cAAayVvl62c/w00YLsQG01m55J2fGKIz0r/7A7SG9OdGVI8h
	5IslqqkrXnAP+ntKPoJxl4UG8RmBLnxS4EPrGlWAtZFFc0XZ5a7naGBzCurBhW3T
	LJQHe/SA9VaPFWtyA3zgSArjJd2eb3E01UJvOrf7aWGo0U7lUBdjlfWzsNeM2znu
	9yr//FvaKM4yjKhfCYp1zBQqr0yJMKGivF7uajcqkYPWFdeleBNWPCTj+Aosvnj2
	njGDIA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua99s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 12:05:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ffd22d2b1so7801491cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782703; x=1789387503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=;
        b=QYIHepnpsqujDRnsb2puiA+MvM812tzmVuTI0ztuSL/ocmELtKsrMt+tlAESBgOgVQ
         RLgykWXqD1mtWIeZkpq2nDOKwEjZf4oqxnzGV9SEAOIMIsavp91M0FnuzSPDniDC3BXX
         oqnKaaxGOHGiSZLNYbcRvYlGWLYvUs6PFgPzbVedkd8cmgnBwCu2YGfg/o6NLRpJl4hD
         XKRq9b0mVjPwP7IR4XTaTaLFo/6rNAZ3wxQ1RwCe8yHTHp9SUBnI9g8LHE+f/fhrGFdG
         anU/DAXO4dYFRG2d2gc4xJv0u3EFsdqpY6GIc2boFYGSDZsiDRIftKXFd7qUx3BG+aVm
         E/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782703; x=1789387503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVgKgqOoFXytrZYRxPyu4M0vvgU1+iefS8c1X4FLYD0=;
        b=JQpVo4osivk5WNtZNVTiKkyd/FXu77c4bIvattUV7YsyWqVn4+rKrTO4eGMRYonyqu
         8y+btN5j/x7XPhULLhT1ujlO6q2tgCcxCnqRGbY12k38vGQc/d0pKsSEy+dR2TAPzgiD
         3RDsEgqCDm0a0Z3/ZcTIT/9zwDrY0YZyh0JHjBjmy+2VORteeGiGMJKsQT2/6g8wN9cP
         V9U8uCSC1oVz+QiZ3cbiEKYKRaOWJ/yC83UuDHJ8o5pprHK0ZgwjNYnK5SdbduJfy+6a
         /DciWDl84sJt1xPokgyfOQSJEvtdArcfVrnDU9znuPz4pmtFMsea4dbKw3vEI6d5voWn
         c8+A==
X-Gm-Message-State: AFuF++lW/ghK8QVl1HbaW677MvoXE+Q/+peCGlX9k+ejSiix4kxvqyw7
	CpbHQIUt2xmd/LNsNA1wSSF+pu4ljMjki5g0S8bP3+ypGe6ffyfMtw7z2OSbpA7TNop5AKuWrR9
	MJ4LTFJz9VTLHsz/HiQZpFSpctCk7qLP3ekuUsnvwtwXbsZBe+agIQ53o1glsYMUmZeZu
X-Gm-Gg: AYBFou3EqPKdhILuJjkxZTarPdqRyuSl5g3w9INVXmJQLyIWKkfDdrTlsnnnDpO78Zg
	kXyamwvlE5Q6icxrbvXsblfAHqGmhQTfRcAMElyqSe04zKA4CKki9ZzxyD+qHDM8zDuMyW+unNw
	4z6ROH0Z4VGHAe9DAAAUr4duIjsp1a5L6vtg9go4x5RxG2ZCZU8wDL/8xwGKQgxd0MFkiTZ+GGH
	/gnNz3aDO9HPxvHpRgfmKseydO9/+L+jnsL79WX7dSMcwIWdusYsbOJCiRbOZGPlO5E8qw072wv
	MoceYHqrcffjqIPVfJICpi0SPHfm6gsOKxplO7fKVknJgj9rKkggCBIl1rHgmrA1vkB2c5GMdJV
	9xaHh9lSkvQPacIuQHpPTUoPqa5dbaBPOaA==
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr130310041cf.2.1788782702943;
        Mon, 07 Sep 2026 05:05:02 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr130309241cf.2.1788782702399;
        Mon, 07 Sep 2026 05:05:02 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm205136585e9.0.2026.09.07.05.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:05:01 -0700 (PDT)
Message-ID: <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: muzafferkadir@mainlining.org, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZEg3oWrF713QYIaggB5h7DP0eRWoSKl2
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ea870 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=7cKmDxSfVGQto59j-ZYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: ZEg3oWrF713QYIaggB5h7DP0eRWoSKl2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX9JhW+7pnBjRk
 K+RY/iWP4vsyF99PvBFIqbfI2go8dqf6m1d6WfNvROXVMnhjBq8xjdGTdXZbbzjkdQ8PSgNtzjt
 CEZ6U8R7gf5nZBn6mRWKcSj4nxn4QIs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX+wJrzEDmKJHS
 oHsNu100XUsuswpBO4sATNR8DoHv9+DmAUIxShfx9eg2GV+WgsqrNDj/NgBDFg4zDcBKIU0slI1
 jzR26mY566JbHBPooFP64J4KiVSwf8SXuz47g6LE9GjVzJHb467hjyds98Umq/JY1osoMgrgwiQ
 mMvn3wu09mdkYMHu+ytvH1vN+u1OSBJFVCMGTvxen6PxsDq8roXn0X5jcJEvk63ZSgcSuQUpmBZ
 UtEwt5CpjDR0dL40RpFlQmdPdugvFY6TBN7LAIK9Oef9a/7NVhDrAOOR8+amMBPfaEMBSpKLFTC
 M9SLq7FOi72hAs02HsSnuOLuAPYw3z6RVPJS+X+D9kptizlPZlA/5Ys4DI+ekJeuMRHzmlRGhRi
 dL6spwTyI/UDSDLUGWZiLymCL8w4Re4V2WSjFQlsJzcFw0H0Z6733xwqXEqxmB67sZ3IkXu5f60
 UciEE3BrE75LA6mUIoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070133



On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same pin count and similar pinctrl
> functions mostly with msm8917, but some functions use different pins.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

I told the robot to take a look again (and again and again
a couple more times until it stopped complaining)..

The following feedback is meaningful:

Hi Muzaffer,

  `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
  the function. Please populate the corresponding PINGROUP slots:

    GPIO8:  mux 11
    GPIO9:  mux 12
    GPIO12: mux 12
    GPIO13: mux 12

  Minor nit: use MODULE_LICENSE("GPL") to match the nearby Qualcomm
  pinctrl drivers. // and checkpatch will ask you to do the same

Konrad
