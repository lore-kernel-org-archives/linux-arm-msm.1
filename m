Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D638AC61
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687322; cv=none; b=IehkI5CaIJhscf75vW5ZY3jKbDFPr8oTxL9DofFSRqOBn7IEKCc5zaBQl0s9xZ3HqqXRh1apc2g0XasyFfU0OLonmdt8V7A5g3e5EQ2KIzz/eESWT7BtPLRh0K1dNCK2glbldk1Dl6MmkPXSD6+NNxKlPrMOvjoWpuIgXFvDCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687322; c=relaxed/simple;
	bh=T44oqDglFT2brXUrnem9uR4UxfUxX80vClTgF+SNPQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoBYWs/9e6m3+0jE1aUh2pvjPI0lXn1QrhbLI5JGfls0oUc7VgTGGKm1WOII5BAXNUcizicmjKazNLvyxdoOm6No8SUlzpXmCE9UIuBFM1Cun73q9iO0VCiUOnPBXRONLMITCdl7VLD/yFGMHnLMKBI04f4bAMxTRVRcKMPwKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EppeFHE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwomO17R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EppeFHE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwomO17R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CCLb334784
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1g4RUwVoDGadx8Dgb0lvPCAM
	mLPPyqqKXJnPjQJ7Nfs=; b=EppeFHE2iAHrGqtlo5hNunF1eibsfiGVdwiLHYVw
	lCKYrEoT2YI6ww1bCLyTNgamJpgIzS9yYyducUKJD563lxZNGapQJ0nxFMv7B5Oe
	YkJdLeikm5dfOkqixj5OhbCwuWgxoAPqyxnP3gZr+yUTQCqQQmYP6fP95pW/pRKQ
	CJp3bsrocJw0AK/WXMostlDl0PsOafbyZ0dKY3CNerjI5LxOIAXlNdyXxAnSWFNg
	dMzlHR7G48ZBCeG1ZHw4vdi/HOrk48a2K5NX/JGsj0dASNxZd8Th22jXoOOLaodo
	fkZXmv0Giy5ROvxLtQVdlKjCc5+QcMBR1AzEvtDj1SNWjw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsuy3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:28:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6dd278512so2650646a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 19:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784687318; x=1785292118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1g4RUwVoDGadx8Dgb0lvPCAMmLPPyqqKXJnPjQJ7Nfs=;
        b=OwomO17RVwC/ejD0DSn+ARHwYngpa/f0lE1/G6gdo5Afh8qgpMpyuiLc12R2t+nCHp
         C+PJSIvh3giGfaJbswgZ1djLYZmEmPz9N7dN4tLttvW+GpMuuytCKSRHjMsQ1SOJJOkT
         hmVeuoBYHKy1lNA64S0QCYBwKwR6TefwbDQXQ3Q36/QCtIPREH8c7HziJkwgEfNGghxy
         PfnJJ/6R05LEKrCWgnbEyAl9LRax6oX0w9BPVYDpWQjPWlCEz2diCHfeYcFwCSfszlVc
         +jIUZ0jpOlITnhvzw96S/SyTzPJA8Ol+u7akxK/oZ1VbbxlyRkAj94b2xwYqxXh/pzPU
         w5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687318; x=1785292118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1g4RUwVoDGadx8Dgb0lvPCAMmLPPyqqKXJnPjQJ7Nfs=;
        b=KG6QPX6pDLILJlM5l0JQ3OB430WhAV0fMEk/30atQZqwUGmP8uZl+7rhBjJJN+24oN
         dxd1tgabCiKH+FfZTtSoMmoKOdLIroW0az+7wSpEpR1hThqiJaIiBPVUF6uVlm7y344q
         1LNlLn6yb/ZVAGdujTpqdfC6X5z0U30ZCT5B6vvk2dovyoASZAYbmWjaL+UFdBMtCUAu
         iQIISUK4c8ZBlGJ4CIY4094NlK/2RQTf5dw0rF/ZCYcBC+lzJJbBVdsCysHzotsZYRqm
         KJTLDvr+xkWCjjSJQtnBh/P0dkgRhaaEvLaWa1MvNd8cTDTCJIS5S/RgzRiAPmi9G6eq
         RYrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWQDoNLAvZXRgWR11n7zTru7PEXPFhOKdDcN181ZaxDEMjzLOV6J/TyQanmD0LIy6e0sjTy5MJTgLOiiVs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl6ko/EsGHb7xZ1np3DA/8swJVeVHpticYVPGsv19Y72RDUONr
	lCHBL6SWdrGUqz7Wk5kF6g4+MiHQQCAyazsRKoqLaeshDcRWVCPZ//QUhAM4zDRekbvUUH4rLx4
	8ScJp7WFUPPA5yyH4IVOLFqv6q3qf4wD51mpLXoOXN7/EhoObpgBPmPXgs9kztWxznjLD
X-Gm-Gg: AR+sD10lLFuEVq0LAb0YODvVf3TuA0JYjF+ENv44EuvkK5P6gh7i6orQ9tseREXzfeR
	A9FqvGsknVBEDB4lOrwhO6uGuY9+xdck0Of9BDJHzYArroEHAjVsL/EaR7J6AhUgbzh/H2KAcpP
	Gk8rmhbRjyKaz8Ri7UC0CZZtCRjxT5OWuYVrxiigj5CzbADt4lYL0lHKUMCMsRuTXp7jP8IEtPC
	AUbbx7BdVYjTQrobHk57WriHZtaCE8/Zdm8+oAYvvTyNiWb6T5c8yBjinzRGDMfZnZT1Am+VMFQ
	IJXCGVabCS9neSbCa2dl/78JaLEG27gSlUmswn5pYKIeBv1AvSR/w4fINtJhI73VhZGvENROz62
	o2ZBdQQWHePK6Wmmme9a2JD7FjJenbMfHIUXlMaJlVHQ=
X-Received: by 2002:a05:6a21:1506:b0:3c3:81c2:fa47 with SMTP id adf61e73a8af0-3c3ad7a3880mr23203581637.12.1784687318153;
        Tue, 21 Jul 2026 19:28:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:1506:b0:3c3:81c2:fa47 with SMTP id adf61e73a8af0-3c3ad7a3880mr23203540637.12.1784687317673;
        Tue, 21 Jul 2026 19:28:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm3188263eec.18.2026.07.21.19.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:28:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:28:30 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Document Nord display
 clock controller
Message-ID: <amAqzvpZtzK2B_HV@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-GUID: Z9zmc6MypUWsL4NBG9PIamEubzvkPrPw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMCBTYWx0ZWRfX/NKQJdHGhAyz
 kPjyLdJZuhTwmn2miO7eBiUcAXYEKr+LoAgw8Q54xeEK/Q+q7MplF9KgA5Tx7m/YBkIimjXDGgD
 jEb9CYoO5my74TAbMZ2cIjEQhdB4hVs=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a602ad6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=m708LcHvpJNOmTCwX8EA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Z9zmc6MypUWsL4NBG9PIamEubzvkPrPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMCBTYWx0ZWRfX0gdL0sbAYw/A
 UpevOw1AJVwWohoAl2hhcAYXpFIm2Kv0qfhyqo58N9vvkKhzD4HXJ6eUguIrpJO99NyitGfe2Kh
 3M4kmV4n9i+DcGcDBSsFA/Ph5JkRMwVNNKAotnBWmgtIJng8z0O29r1F086QTlU5Sj49u/2xWga
 0lV0Wez3XsmmKaU0wo6U+w6P3Cact4JvyXw0R2IE1Gg8tJfUJLy8m4rQD+i8qGQpN1J0cA0z0cL
 fFN3BztImf0ANWGmBqOua7YV4bgDSoYzkR6cimSw0tv2UD6ob8lNdVfFejBzo+pFmE1ZPU/UTCy
 CeeyrQ6NtJGiAJdhySOKNfQBjaEOkJiJj0S8OyE+He+hfQ8Nh04dKQasfNCe0PB3C9szss0EBxT
 bxehXamfPqco+6u+j39hutPQd8LIj/iIdSCkBGN/Vb0CZJSDKXDvDE9cVJbOAwimM8LYYwytb7L
 vm/enVmw38aEfeuU+CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220020

On Tue, Jul 21, 2026 at 12:37:18PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the display clock controller
> on the Qualcomm Nord SoC.
> 
> The Nord platform contains two instances of the display clock controller,
> DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
> for both instances.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
