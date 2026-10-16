Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2D1D89EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126095; cv=none; b=MDT4usSUSq46hoeJkCYwZ+ElcM9vvHZ2juevMLAOUMw9LOPRzeO59KSQ873nXZ4WFueTKYJ2owKC4DcDRVjhS7QRFe4nLuPV+uOfAwfkX2aGKPhHRMmq0mvkYMBK23dYOdjmi48PhYIfHy8XjmXLP156cRSAoKWfLgPb+DcmlgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126095; c=relaxed/simple;
	bh=PY+mguwkhJfjayVlC94WM+vz9MeHyZawDi4qHK2XeNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmfC+8BXbIDfQEKaj06dKNLOWq4QthtswR6A92kADNA9oSXpLzBw2NpVyL1o6YF8xtGyJ1V2tuTL+o1FA1tvo8HnQ5q6iuaN8tB1pNtOtfgQt4cXz3OFS8v70I0cda6ecUpfcD3MvRNvoIpdm6y4CGgesx5k2F75oakFgqLtulU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICDJ4j5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckIKcoAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICDJ4j5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckIKcoAE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G41Y2O3462792
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=; b=ICDJ4j5bWCIwmJOQ
	V5khTEnetsj7M5M/eOBr7hWqmi5k8RmCEuXgC5e/f57oQFarfdCp7JQGBTo1Gq+k
	7J5Lk+hHkc6oVD+1b7wRQnlJqD1OjBEORRLqPyItqZeGKpxKCheRcSJZhM8Gin45
	VZ5vg86FgdVHlhmI6e7dYNu5YQumZ327Tqx/dLrg9+l+kVN5N9NOoE/J6ziWWOZv
	G5IgV9mbyb0pjGgaZqIZBLLJ3tnnNYyZuAdO9QBpna83Ch7K0UZoXe+p5oPLODF4
	c3ZdcfK3Et4ZeSu38EHYbRWVtP/KEc7TnD5a2vkANMCrB1gf/1tr9O6YTQq8Wxr6
	XswU2w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6b6d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:48:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so23452786c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 21:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126093; x=1792730893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=;
        b=ckIKcoAEigUPA9iTUXAXsjfUGeARgwo/rpLUWy0fee7Nj3zXdgGuUcDyAqPc9XZvTp
         HcmR/YZvsMpU3LseRmECdk3WuL09XpSVwg4SIYy8qlGMnVsHpTI6U+XTreAVjbhJWcZK
         l865ATp7/VjCjhfDdxMhquX7mXchbme/aIkWa0W/gnK7oLLOyuErDrFbFOkNEdbAQMt0
         nY8gSelibrNNHwIMLzqGnxRn7mKlmxuGBRYfRElnSeOfG4LTkeu1ZcpwlA/LS/PYtX0g
         r0YdEgfONMGfXmtutOpG7QYZJeDP3y6FB7KFhf1buffq36kOULgjt2Xk5C+RKt0C0P7A
         GaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126093; x=1792730893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7MGnk2r789SM+4xNeFuWfXYOB994eVYLUzQReboiik=;
        b=U6ekfjTOgRxnX9h/qEVmdIHnbvFmZilvDo77dM83n+sV5mIWcFRLiXAlGzQm31bbMr
         8q5/C2W55yp+ueN3w3c9jwvhzxAotzM1DguVyb62bGPTuxVCfqfX0QxjSFJp71DNcAfK
         gpvvrXCPGyGIPYOpBL0M0E9g0VrIxXE4/PsdF8T263lFlULC1wCfLSjTkYh0HDxjfxZ+
         hsWap08nV7FZtCP4vwZQL/Rnd9u/yxsdC+5IK8QVLMe4tq9qb6c9Z48X2yOh6X4o3f34
         lDzMjkBMrWLZXyQWtyWT3YOM/5EkguMuSBl4aLDWE56u2+HmGdlW2nKqkcGwygMe5nPo
         tKZg==
X-Forwarded-Encrypted: i=1; AKwUvBzvsjiR+JjNjK0iFw4GW7XR1NVcImOowWc8wgD850aZZwlG7BL3vX4DXJjKTeraLqhgDZNfQP7es6/4Gpm6@vger.kernel.org
X-Gm-Message-State: AFq9FYIpPB7qiz6YAUWIcHjJkXQy8GFiJPqCumPcD93kPjuM+428wS+L
	J8GpBessUfrl8Iu/fg1cJSuIqAcJg4gT8ocYmEnniRFf7CADS4Byo+cvyvjCelYrZKsDNOmvkHh
	fcZ5oO1VNgXUv7B/bLtjFl7LOKh9HoVjLshPvzTczxyf3cwlF5E5I7lVNGR3gwKhA/06VXr7R9H
	a2PDI=
X-Gm-Gg: AYBFou1N/ScdRE4baApELMZRTpgQnXn3d925bCI7yGAUQvBmPggmHOSpNd6Sos6N4fK
	XVAejF6TixdNCTbS6NryauRyAxe2I8q7qGT+vbLlZpUpFna5wv9ZtNpyYGa/f6ErjyW75MdkF1c
	ZspeF7xcrwbS0XL9MRWNZlABd/5Wo2vPOynC0P+ur0U0nX3tw361GoOcfKtR68gYTgFil5svAjD
	BFO+gD0xnLQFHruYoHDtCL4LRxIvZ9/2HjZ2uwNGrhfz66IAcTYnqCUSFYF6jUQAHcBcBrI/VUb
	GpMdOtk/MojhlCMiPw3OsW5YbogzoW7Ph/lltobCxmLOEQenvjRaa7lYnFi9MJdPDrSnujrI1C8
	TAtqXNI9W0Kh3BenDWQ9UrQfeH/C84Q==
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id a92af1059eb24-16a6187f08amr33405318c88.16.1792126092543;
        Thu, 15 Oct 2026 21:48:12 -0700 (PDT)
X-Received: by 2002:a05:701b:2309:b0:158:7ea9:4a76 with SMTP id a92af1059eb24-16a6187f08amr33405214c88.16.1792126090833;
        Thu, 15 Oct 2026 21:48:10 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm3044571c88.11.2026.10.15.21.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:48:10 -0700 (PDT)
Message-ID: <22b729e1-f592-4312-b2d0-d08965c4b808@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:18:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: kodiak: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a__WxINsWHJ5ZQFHB7qYOTMegbq3OC4z
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad1ac8d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lyEmEM9vGBA4pv7bqbIA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: a__WxINsWHJ5ZQFHB7qYOTMegbq3OC4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX++3jpIH54hnK
 Y+ovE3nYJIa1BgJOhaGNlNGoBZ6hLTHbN9nJ0yDBsXtwtTJC6yQlkyd54YgzWndvXbuoByHbHYC
 XGsBeyPoMxtX5gJU4RPHLy9rrS2g64BrBGrot0+EA1+Rj4mWRBC2EgyiIIlPiLjgbNXQtA/gtoZ
 iQAAFDTP2xrYPHYqfL/m8U/9/Dj2OsWEmmg1dAU6Qpq2t5WNXNhcWHapbOtxL2yF/tdgqVNlbPC
 CoaLHtwWgbsHhKTdsNhgXxw1rFHMSzfUY9AoblJ4/nwP5iSjy4Mm0kM7OOVCQu+iug8aoUUaq4W
 MtfvvUzJEqxaxT1i2BOb0eVGwUVRf5X40YVlke/BAWdC6sPcr2oVMXAOqq5fgrpQqhpLzpoRUpw
 YvX3f8RT4rxyXjUSCMIxkjfuyx7dTBdjsqQFwAPOf0i0vBHuyjuOaHuMhiUOANQCQs9frxdq5xH
 Dh56NYEyWixBXiCIRZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfXwShP94BM8LLh
 IJBx9mQkhmUOMZo1XR7Tc3rLA9yDlSbJZ9wL5CkNapBDO08VD/r2kxag0h8TwGnqYKFEVDob0/9
 NFJ5f6Dso+E9TD3aZRPNW0++tZsSU58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Kodiak, a synchronous external abort was reported during storage
> testing when the kernel accessed memory within the ADSP remote heap.
> The faulting address was outside the HLOS stage-2 mapping.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 9d7d847ff1c50 ("arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap")
> Link: https://lore.kernel.org/all/20260423063502.484-1-
> jianping.li@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

