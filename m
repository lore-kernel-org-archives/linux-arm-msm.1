Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A03FA5D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498179; cv=none; b=fVovz0n8MuyB2yypn3JhHQvwfqtR/EfY/4sM61SiTyzNMZ+Z2swzHfFubQuSxzphWTforGe61ZjDo14+eYCvwaIeHJ0hcTQ9kA3K7DGdCAaEV2XMDGuM+9kkKeeXeWHvb0WW5RsGDReKMR8AqB8Ik9JVlJkXUhk+bBQdtghKe0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498179; c=relaxed/simple;
	bh=plfZ4FsucgnFmYB+WLfqiTzRuqQ1f/GHyVysSGWQv6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4ry1K/RG49JhUyUbg0Xd4OwLRBNAffaLmruhCEwfsAbJtf8pQtfLg861uGcjmvqrAkvX8Lh6EOuzn73QbKe98l9HPYvRvyZr+/q4cTJCBfLW36M165/erZubNqjJHW6VgfWakxNmk/6g7edAc3nwJqI+MiwXrCKUC/7fE0kmas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxrN1WAD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpeEO4qj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxrN1WAD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpeEO4qj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBNDqr3858676
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SntzIFPR+4FwE76k9egHNUQnO0nVT2pXTp/Kx+qC7ww=; b=kxrN1WADw9DCh02h
	SQ5T1fm+EggEMTO0j14VZTvKWSZnDbMroGMOUD7c7xWRPqbPFFyQ81tGnFoIQps2
	9Kx2MCNHisvGxAozCoWt8gcLsscBornjTPHFspVsU3oYOgJbS1rlrTL8aZNaznHQ
	Nky6SDLbN3YFUdT7DzyF4jMDBZoWRI9VgmrsFhL7Z8QsxnkLX5jI/yBK++NhDN/H
	0DyH0Iuw4a8UnAQDv71eSAEFWN6krXrotYlDRv66eDLXr6fd5Ss+CL959fks1Mah
	Rh0e1TaWWNpPaiwoU0vJnpoMiob2U0oHNNlHA7SwBzQLbQ1Mr+BVHanKQOpx1XD7
	NlSLLQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtms83su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:42:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so1377141cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498176; x=1786102976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SntzIFPR+4FwE76k9egHNUQnO0nVT2pXTp/Kx+qC7ww=;
        b=fpeEO4qjRcxpwCRXuncf8YZl1Y29vQGxYurtngFjjWzAT3/CfypNLeltjhvZ/j+Dxk
         6BCPB6RpEWzj+06JinlBQaHDaaTQx7r7N4J01A2CGMqzJUSAdJxpW+3+gcOZMfo1eama
         nC/G7u23FQjDCzzvsuZRWd4lL7OMVOoppRGE2GaIe9qyoEaK5usYi7h8I34cZCV8LKfJ
         ACNe/qhPmUN7jqc9HtoYoDs6bXhNL1MC5lSL0RTkSc11rYbyeXhG5ItJ6/w9UaM6SSbW
         ZiX6ALxEzaKqxMn5yIc0+ytC0WAFL7hrs/kydSwOZOhArO1BeUv8rBTLia5iTaehxXhy
         VAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498176; x=1786102976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SntzIFPR+4FwE76k9egHNUQnO0nVT2pXTp/Kx+qC7ww=;
        b=bb7jy900gJytfbznj5wiHzHSJx5bYaYlb9n+gEQlE9VA2u5DSHE/k+OjmjfFoH0sqY
         /yG/G9t+tNdkhvOYBzGQUjPoElK3lyaUdmnW7xwHuvkCRfWGjLIu51k5MnPjmlZLiZxJ
         kgZM89qplc/V2scWEtbgZ3X3+r3tbizR94xGckpydTSl4RDvtEzQ5f5OwgHYc9viApcu
         +7GAae2GPm8CuVO93Ta+XWtIcZ15IXgm7/OSz3tHAQtIcWe7+ccRvUB8Rp0jcMv8342v
         Pq96Tuh7/iOjkrEcI7WFyY9zfW7r9HyArP9uU0FluY50GuMcBCTQiK8gOGpjdbI8AQ1q
         VtmQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8v7iwIB3hRSZeY4LneDw8EBcfi65oeghMmgLaQ0GPwjEvunLXkXp4cZgToLGa+A9nwB0IhxFF+hx3u2jc@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkHvr5dMiY3jxkHkPwn+zJq7wPWgno1BxL/ByOp1lquxgePfu
	l0AfyjZ1XHITYMbs5qdf6jOrdjVpHEO2unV6DzVmIZ33hqZSFhhP59PvEhSDUhk1jzwF3AIH2ph
	Hhs5GpY5GNxMAx5jKO9fh1uK9EBKSGIqFL/vgT8mR7TKsU+cgm9vsDFx5ds/w+nZ8wnqB
X-Gm-Gg: AR+sD11BwkhmozxNxUBr4yJWRDGPTtva+pflrqQLJydYYA3Hcoc1AMksGag4OuxjM73
	mZ7beF/dT4HJtyhhUFgmDYbcq7wpHiITE7x2hAcDCRtW2v2OIx3/J59C9kktndWlfxrsc1GBilU
	Gb8EWzcMSoMMb/Y12HjMzoTnvbz1N4YTocY+RgohLEFyyQtlqOT+whKozsqqHcj0f/Qo8IIJpl1
	kOQwnllw5TKjP8aF7AcMbiS7oba3dlQhMeJh+fll6+gpBewDxEsILxLsvhBnWjY8vW+5YlHcD9a
	86qYQwE95jKCP6UxZ81cIVSP6TUfUDXMe894Su6bfN+gyKkWCpCcveLH14IP8rY8bycF6S7KMlp
	s8XhvQkrDqUWmr9T4JOlKaKiE
X-Received: by 2002:a05:622a:6bd0:20b0:51c:2324:666 with SMTP id d75a77b69052e-52b4b164ab7mr15392291cf.3.1785497741058;
        Fri, 31 Jul 2026 04:35:41 -0700 (PDT)
X-Received: by 2002:a05:622a:6bd0:20b0:51c:2324:666 with SMTP id d75a77b69052e-52b4b164ab7mr15391851cf.3.1785497740570;
        Fri, 31 Jul 2026 04:35:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c664713sm1227143a12.30.2026.07.31.04.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:35:39 -0700 (PDT)
Message-ID: <c5a3a4e3-d78c-46ea-a638-2b6e37d7efbf@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:35:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: core: Wait for device link removals before
 dropping genpd->dev
To: jaseg <git@jaseg.de>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Jan_Sebastian_G=C3=B6tte?=
 <linux@jaseg.de>,
        stable@vger.kernel.org
References: <20260731102147.127082-1-git@jaseg.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731102147.127082-1-git@jaseg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y5mRhVfpXSqxZSIcsXB7j9_8rYllVzXr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4OSBTYWx0ZWRfX0+smm1kioafm
 VZ4xNVnYnCeI9gRoosO/qxFOXaig9bLYdbHwQbgfm2UEfU6I9DhlhvlleLhka4Gn+WtdP5UYo6H
 g2gTjmurhqjKyAl0qlkz5D/CxJVQX0wmXtZJDB+F54bGoEmeHGGALsN1N0FnwAHkdX8nvF/UxQY
 2ek4mNQrKXIOpfKgkOHSMxNpoxh4uxgclwqUI3d5iS8RFfa2dd3O35t7nV8mwXChuAhTcdKjd5D
 zGUEaxYb2kG7e8AJohm8RC7ZyR+mafdnBvVaUOV2cfsrO2Swiha9Fa5LIADUyEWMcvnz2W6yAUW
 jl/wmb3PXsDbNQrCPXVL0CmFUxqDj55h0xiYkMrDJnNULW7w6AtFnJfAU0sCre+SLjaOj+cFDS9
 jQ8jopowK9OkS0Z9Yji/ba7cGa4H574zJjZmwyF8W1jvy0HT9qcncfjeDtJf9z/Z+vvQt+waors
 JEIoI6B5Tex3fFGuABA==
X-Authority-Analysis: v=2.4 cv=SuigLvO0 c=1 sm=1 tr=0 ts=6a6c8a40 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=LNI6Y7vA10jdH1asw2gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Y5mRhVfpXSqxZSIcsXB7j9_8rYllVzXr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4OSBTYWx0ZWRfX5hGQj05p/piR
 TOvmDZ/979HmrLo/DOavADYvvNgvrWktEtuDHJwUqtHa5WbHeL1xMIlGd2aRBQHXPuDejDfISQ0
 1ZkruLJixk466JEZU+Tmy8j4UyTdFHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310089

On 7/31/26 12:21 PM, jaseg wrote:
> From: Jan Sebastian Götte <linux@jaseg.de>
> 
> genpd->dev is embedded in struct generic_pm_domain and its release
> function is empty, so providers free the containing genpd with a plain
> kfree() once of_genpd_remove_last() returns, ignoring its refcount.
> 
> Since genpd->dev is registered on the genpd provider bus, fw_devlink
> creates device links to it, and those are torn down asynchronously.
> Nothing made genpd_remove() wait for those teardowns, so the provider
> could free the memory backing genpd->dev while the queued workers still
> used it.
> 
> This is reachable at boot on qrb2210, where the firmware rejects PC mode
> and psci_cpuidle_domain_probe() removes all the CPU PM domains before
> returning -EPROBE_DEFER. The bug is asymptomatic on defconfig, but shows
> up when enabling KASAN or INIT_ON_FREE_DEFAULT_ON. In some builds, it
> causes the kernel to crash a few hundred ms into the boot.
> 
> Call device_link_wait_removal() before dropping the final reference. All
> link removal work is queued from device_del(), via
> device_links_driver_cleanup() and device_links_purge(), which precedes
> genpd_free_data(), and flush_workqueue() waits for it to complete.
> 
> Note: This patch was LLM-assisted. I reproduced the issue and tested
> this patch on hardware, and I did my best to verify it by hand. However,
> I'm far from an expert in pmdomain, so YMMV.

Thanks for the submission!

I'm not an expert in pmdomain either, but it seems to make sense


For future contributions, it's best to keep things that you wouldn't
necessarily want to preserve in the git log under the --- line (so that
it still shows up in the patch but it's removed during `git am`)

Also, your sender identity doesn't match the patch author (i.e. your
full name shows up in the From: header of the patch but not in the
email), but that's just cosmetic

Konrad
