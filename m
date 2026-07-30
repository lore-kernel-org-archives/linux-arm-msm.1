Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21643347FEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416385; cv=none; b=plwKYlgJ+q+h3gYLA/jEnM/8rC/37g497jMmgpy4+wGL3EVhCmZZn1J9NXcYbBm1MJqaycHkco0WiUlw8TND4pBI2AIRnIudftR9B6lzSXta8KfWSLINGkrVORt1juTl3fa32wNuJZ6NtM9h3eL13kAuCqUmx/A0ERls2pzknwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416385; c=relaxed/simple;
	bh=UM9s9g33q04CPST6gJBxLdIbSSmohazS5ctmGnSjSEs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NbxZP6T7MSgQhza6il+zK2tTSFMNXEfwHaBYiFwCpVaAMbTT1D5aUVvOXK35/4IeNtpwoYJfZShS6xDf0AggFlT7FJlOJ19SNhm4P8VNsobqy3uD6h/iBZxT1rzJU28g2QCH4+t5GSb7J2N9/HaVuOU78++iery0wZvuS/ApXaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ooPTrQJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iz/qg0Rw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ooPTrQJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iz/qg0Rw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCmrex1048926
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZj8afYz4TH7NX2z9E4K544D8/dPECrObKm5nM3IWL4=; b=ooPTrQJfXw+167vw
	22IRx3Y3y2D8kka5ClK3UOvP262VX0ljXcsGQKIyK1Tz8N4ZwwnMWjy6maaugb7V
	9jCjS8AQVbJ/GD90Y7R7wKqVQU/lOW/nHiZ+hX9DoZVJtAZ8XUShu8J52Ek6Bqqw
	BM9O/h6ampQKEQNWK5T5PNpgQ4fiG1+YAarJL4q8s1vebOtq/elPu8EYOxmFCOgI
	0IiAY0b0p+g6U0PiLaH16swX+C6xnnXLVz2kCMY46Q34r5YlLcR4zZBgzsBY2XP0
	oHyShAnX8wfDnKYQD3MlptnjQojURK9AenaIkznfeyyEz96wY3X4++awMc8tYgXm
	Y/XZ7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6xk01e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:59:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso18832045ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785416383; x=1786021183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZj8afYz4TH7NX2z9E4K544D8/dPECrObKm5nM3IWL4=;
        b=Iz/qg0RwfwF0kJxHd/c4Rh+FySG64NDJs4AUwbi9H3tfy3Or7m2Gp19CCcn1+CfP80
         bNKBh32kHHlyf7gML7OEcPcD1bThKNMwA9hzQwsPNlb2uiiXxt+tw3B/brFyLtfJ5U1s
         V0DYjWMPpZSOYj/WE4X5B/PxrJ11W1OESopymRtbbcA/9RQaq4a+XhwLVFhyEF3UNI9B
         9XxCfEmSrE5gZKNUL4EESKEGybk9ZAKL3gZzscxieK8unSNhNYVflta5SbxD0BHMHFSh
         tBUGEIL9DVEHky6jbHXhiB+WHXbQlcOQdqE7jqdNoILZv/I3MNYvFSkp5Cq12WE4AZls
         jydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785416383; x=1786021183;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZj8afYz4TH7NX2z9E4K544D8/dPECrObKm5nM3IWL4=;
        b=oeL18H+AG/kM6OU7C0Q4goeDxGOIyg/UPerT1j556XiKk/DsyjYYXhG11I4EamK+uE
         EqgRW/iYRrv26xVvqqgAQ3z8ukOyclYmWS+hIIZdSBI+9BTQt7FQK5O0ilDoUbhGrD3Q
         PcUnnI2lUpzNfrtO7G31DwB0rd/rjmP1C+vfHLm8ag7s6IvlR29DWm4vfYieybbq4QRc
         m5jFlHgpDfyvqsQMyA8TC7uJjG+5PUaIM56N4RkWtc6BfVgwhRATrhJQNR+RCV+OC5vq
         bPLlFD3XI32/sXKiD2XjXtYOTsQMVL2P9s0x1L+Q6krXd0dfoSnqqkoc205DuBG0fECJ
         VSMQ==
X-Gm-Message-State: AOJu0Yw0lypNEsy/rjnpSXWlXInqUPKUqSSQta3RUvJuNuhcM3zARxiG
	lnZhfNuO0Bx3mooLwNayRc1wDjirsW2GhyZNkGWHz6hdlVTRExo6oU+bvgBXZ34oo9bjCQXPvZc
	THkTrGP+49sb18N3vM/HsLIittzdEbZ7D6UtIOTUONwbpwcSz5reoXPRtPoKVdas2dqXs
X-Gm-Gg: AR+sD13hG5F/ncomsg9PKBxrNFJ/IY6rw3ewvuJo5Nmluo037dvErC3LFzGpAmAnMGm
	SOqXYpHIlhgFJeZ3BwlGXNPs0DF5YlGlun/gYtTkRYUpuuHbrQFUZeuDXmt6wwNMIthOlCb7J1Z
	q8+LF91MWC98kDs5xigRdJ8ZLbgx1Aq+Qq5IX4SV4W92Nx3HDmheQ19VoOoi/MB9j6+zJIqD2Dw
	ETMoQd6AQCMd8uNixvO72Ry0jp9wuCIuUVlyyHxGxUwOcyP3BeGWJDHdHzfOfaUViAh4l4PPvD4
	rVa58O0oytvPd6JuOwNSyyEtvQYX3P+6cCSoLStGv8TtiKGV1VrsUPDsdsMzSPq5FSkfu3ClveN
	AyS8PViN9/0L2cs86okFZYqj76o4=
X-Received: by 2002:a17:903:2f84:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2d035c4edf1mr23886465ad.12.1785416382603;
        Thu, 30 Jul 2026 05:59:42 -0700 (PDT)
X-Received: by 2002:a17:903:2f84:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2d035c4edf1mr23886155ad.12.1785416382067;
        Thu, 30 Jul 2026 05:59:42 -0700 (PDT)
Received: from [10.204.78.62] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a1586esm26996045ad.12.2026.07.30.05.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:59:41 -0700 (PDT)
Message-ID: <cd76a3aa-f86d-49be-a94b-820f4549d4dd@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:29:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/msm: default separate_gpu_kms to auto selection
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260330-separate_gpu_kms-v3-1-a3e54b9c9417@oss.qualcomm.com>
 <7cb406ca-e631-4cd4-9782-d3efe30844e4@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7cb406ca-e631-4cd4-9782-d3efe30844e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5OCBTYWx0ZWRfX/QDh45+rMWeq
 c+eHEPLz6ZzpIGal0s+cVD+/EF2+vbRSc54yQIBCIKe0K6/Dr0RN6H7VnsBmlfZ2rIdi4QPO4+R
 5X2xPuSSH9bNFiTWnYdiVFfhwVeOpW8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5OCBTYWx0ZWRfX2gtCfomzffIC
 E2ZQsLRtr1APuRwZX6ERBuiezrUOGgI3cBAwyzt9YSmKdW/Q5u8s5sb76+H8FJABAo1/Kx2MMJa
 6o2yMoEU/D6DM2jDSS6w5BDkCKkjVXfCXIOUw2Ku6KX03DoqqRwGYQexj8mifi+hXjN1rovb0PW
 M6CTl3AsJ3pQ9o8lR1T7Me8L90uyrGoN/H9sdS0zj/pTg5nYQkfglR6yyfp+0mh8uGakyIrzjbP
 WgQPOar0Jrcmfdp1W6njbXnHfDsauo0zYFO881WuczBx2rIrlLmc8S2PGxUFNJccO/8CGPSOQM7
 37mzJhkdju8OFagSWkkhzOMB6KK4wDlncVjGM0qxUrdr/o0knqWl1wjfGbfzC+gKdTGN72zb79y
 lRLHTtQo6F8KQg+OMuyecsdgW8LGuDlmBozc2jQZLh6jYgiRjuGef3PJ3OVKirBCxZGZGA0xMii
 hOKM9Z815DCcHNbKMig==
X-Authority-Analysis: v=2.4 cv=ToPWQjXh c=1 sm=1 tr=0 ts=6a6b4abf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K928gvJhYKBOjmkGNO8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: aJ16g4pFKUvsAUV8MGCqFhlDwQWDNNR7
X-Proofpoint-ORIG-GUID: aJ16g4pFKUvsAUV8MGCqFhlDwQWDNNR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300098

Hi Dmitry, Rob,

Gentle reminder on this one . Happy to rework anything that doesn't look
right;

On 4/13/2026 2:14 PM, Mahadevan P wrote:
> Hi all,
> 
> Just a gentle ping on this patch below.
> Any feedback would be very helpful.
> 
> On 3/30/2026 3:22 PM, Mahadevan P wrote:
>> On platforms with multiple display subsystems, such as SA8775P, the GPU
>> binds to the first display subsystem that probes. This implicit binding
>> prevents subsequent display subsystems from probing successfully,
>> breaking multi-display support.
>>
>> Use the tristate separate_gpu_kms module parameter with the default
>> value set to auto (-1). In auto mode, the driver selects the binding
>> behavior based on the number of GPUs and display subsystems. This allows
>> display subsystems to probe independently when required, while
>> preserving the existing single-card behavior on simpler systems.
>>
>> The separate_gpu_kms module parameter has the following semantics:
>>
>>    -1 (auto, default):
>>       Select the binding mode based on hardware topology. If exactly one
>>       GPU and one display subsystem are present, bind them together to
>>       form a single DRM device. Otherwise, expose the GPU and display
>>       subsystems as separate DRM devices.
>>
>>     0:
>>       Always bind the GPU and display together to form a single DRM
>>       device.
>>
>>     1:
>>       Always expose the GPU and display subsystems as separate DRM
>>       devices.
>>
>> Additionally, ensure that display subsystems are always exposed as
>> separate DRM devices when no recognized Adreno GPU is present,
>> regardless of the separate_gpu_kms setting.
>>
>> This ensures correct probing on multi-display platforms without
>> affecting single-display, single-GPU systems.
>>
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>> Depends on:
>>    https://lore.kernel.org/lkml/20260124-adreno-module-table- 
>> v1-1-9c2dbb2638b4@oss.qualcomm.com/
>>
>>    When separate_gpu_kms is enabled, the GPU and display drivers are
>>    probed independently. In this configuration, the Adreno GPU driver
>>    may no longer be loaded implicitly via the display subsystem.
>>
>>    The referenced patch adds a MODULE_DEVICE_TABLE() entry for the
>>    Adreno GPU device, ensuring proper module autoloading based on
>>    device tree matching. This is required to guarantee that the GPU
>>    driver is loaded correctly when GPU and display probing are
>>    decoupled.
>>
>> Changes in v3:
>> - Ensure display subsystems are always exposed as separate DRM devices 
>> when
>>    no recognized Adreno GPU is present (!adreno_has_gpu()), regardless of
>>    separate_gpu_kms setting. (Dmitry)
>> - Extend auto-selection logic to account for legacy display 
>> controllers (MDP4 and MDP5). (Dmitry)
>> - Rename msm_mdss_count_masters() to msm_mdss_count() to better 
>> reflect functionality. (Dmitry)
>> - Common helper to determine presence of a valid Adreno GPU node, 
>> avoiding repeated
>>    adreno_has_gpu() and availability checks.
>> - Update commit message to reflect the above behavior.
>> - Link to v2: https://lore.kernel.org/r/20260317-separate_gpu_kms- 
>> v2-1-b027ca97b9fe@oss.qualcomm.com
>>
>> Changes in v2:
>> - Drop dependency on Lemans dual-DPU device tree changes as this patch
>>    works independently (Dmitry)
>> - Switch separate_gpu_kms to tristate and default to auto mode (Rob)
>> - Rename msm_gpu_no_components() to msm_separate_gpu_kms_components() 
>> for clarity
>> - Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms- 
>> v1-1-e8231e7f1685@oss.qualcomm.com
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 14 +++++++
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 14 +++++++
>>   drivers/gpu/drm/msm/msm_drv.c              | 64 ++++++++++++++++++++ 
>> ++++++----
>>   drivers/gpu/drm/msm/msm_drv.h              |  8 +++-
>>   drivers/gpu/drm/msm/msm_mdss.c             | 15 +++++++
>>   6 files changed, 107 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/ 
>> drm/msm/adreno/adreno_device.c
>> index 4edfe80c5be7..e40648c05797 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -272,7 +272,7 @@ static const struct component_ops a3xx_ops = {
>>   static int adreno_probe(struct platform_device *pdev)
>>   {
>>       if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
>> -        msm_gpu_no_components())
>> +        msm_separate_gpu_kms_components())
>>           return msm_gpu_probe(pdev, &a3xx_ops);
>>       return component_add(&pdev->dev, &a3xx_ops);
>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/ 
>> drm/msm/disp/mdp4/mdp4_kms.c
>> index 809ca191e9de..409000b739b6 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>> @@ -15,6 +15,20 @@
>>   #include "msm_mmu.h"
>>   #include "mdp4_kms.h"
>> +static const struct of_device_id mdp4_dt_match[];
>> +int msm_count_mdp4(void)
>> +{
>> +    struct device_node *np;
>> +    int count = 0;
>> +
>> +    for_each_matching_node(np, mdp4_dt_match) {
>> +        if (of_device_is_available(np))
>> +            count++;
>> +    }
>> +
>> +    return count;
>> +}
>> +
>>   static int mdp4_hw_init(struct msm_kms *kms)
>>   {
>>       struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/ 
>> drm/msm/disp/mdp5/mdp5_kms.c
>> index 1e3dc9bf9494..086895c9f103 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>> @@ -19,6 +19,20 @@
>>   #include "msm_mmu.h"
>>   #include "mdp5_kms.h"
>> +static const struct of_device_id mdp5_dt_match[];
>> +int msm_count_mdp5(void)
>> +{
>> +    struct device_node *np;
>> +    int count = 0;
>> +
>> +    for_each_matching_node(np, mdp5_dt_match) {
>> +        if (of_device_is_available(np))
>> +            count++;
>> +    }
>> +
>> +    return count;
>> +}
>> +
>>   static int mdp5_hw_init(struct msm_kms *kms)
>>   {
>>       struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/ 
>> msm_drv.c
>> index e5ab1e28851d..e2101c6632ac 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -54,16 +54,64 @@ static bool modeset = true;
>>   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on 
>> (default), 0=disable)");
>>   module_param(modeset, bool, 0600);
>> -static bool separate_gpu_kms;
>> -MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the 
>> GPU (0=single DRM device for both GPU and display (default), 1=two DRM 
>> devices)");
>> -module_param(separate_gpu_kms, bool, 0400);
>> +/*
>> + * separate_gpu_kms (tristate):
>> + *   -1 (default): decide automatically based on hardware topology. 
>> Split devices
>> + *                 if there is more than one GPU or more than one 
>> display master.
>> + *    0: force single DRM device (bind display + GPU)
>> + *    1: force separate DRM devices
>> + */
>> +static int separate_gpu_kms = -1;
>> +MODULE_PARM_DESC(separate_gpu_kms,
>> +         "Use separate DRM device for the GPU (-1=auto (default), 
>> 0=single DRM device, 1=separate DRM devices)");
>> +module_param(separate_gpu_kms, int, 0400);
>>   DECLARE_FAULT_ATTR(fail_gem_alloc);
>>   DECLARE_FAULT_ATTR(fail_gem_iova);
>> -bool msm_gpu_no_components(void)
>> +static const struct of_device_id msm_gpu_match[];
>> +static inline bool msm_gpu_node_present(struct device_node *np)
>> +{
>> +    return np && of_device_is_available(np) && adreno_has_gpu(np);
>> +}
>> +
>> +static int msm_count_gpus(void)
>> +{
>> +    struct device_node *np;
>> +    int count = 0;
>> +
>> +    for_each_matching_node(np, msm_gpu_match) {
>> +        if (msm_gpu_node_present(np))
>> +            count++;
>> +    }
>> +
>> +    return count;
>> +}
>> +
>> +static bool msm_separate_gpu_kms_auto(void)
>> +{
>> +    int gpus = msm_count_gpus();
>> +    int display_subsystems = msm_count_mdss() + msm_count_mdp4() + 
>> msm_count_mdp5();
>> +
>> +    if (gpus <= 0 || display_subsystems <= 0)
>> +        return false;
>> +
>> +    /* If exactly one GPU and one display subsystem single card */
>> +    return (gpus > 1) || (display_subsystems > 1);
>> +}
>> +
>> +bool msm_separate_gpu_kms_components(void)
>>   {
>> -    return separate_gpu_kms;
>> +    struct device_node *np;
>> +
>> +    np = of_find_matching_node(NULL, msm_gpu_match);
>> +    if (!msm_gpu_node_present(np))
>> +        return true;
>> +    if (separate_gpu_kms == 1)
>> +        return true;
>> +    if (separate_gpu_kms == 0)
>> +        return false;
>> +    return msm_separate_gpu_kms_auto();
>>   }
>>   static int msm_drm_uninit(struct device *dev, const struct 
>> component_ops *gpu_ops)
>> @@ -1019,7 +1067,7 @@ static int add_gpu_components(struct device *dev,
>>       if (!np)
>>           return 0;
>> -    if (of_device_is_available(np) && adreno_has_gpu(np))
>> +    if (msm_gpu_node_present(np))
>>           drm_of_component_match_add(dev, matchptr, 
>> component_compare_of, np);
>>       of_node_put(np);
>> @@ -1030,7 +1078,7 @@ static int add_gpu_components(struct device *dev,
>>   static int msm_drm_bind(struct device *dev)
>>   {
>>       return msm_drm_init(dev,
>> -                msm_gpu_no_components() ?
>> +                msm_separate_gpu_kms_components() ?
>>                       &msm_kms_driver :
>>                       &msm_driver,
>>                   NULL);
>> @@ -1069,7 +1117,7 @@ int msm_drv_probe(struct device *master_dev,
>>               return ret;
>>       }
>> -    if (!msm_gpu_no_components()) {
>> +    if (!msm_separate_gpu_kms_components()) {
>>           ret = add_gpu_components(master_dev, &match);
>>           if (ret)
>>               return ret;
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/ 
>> msm_drv.h
>> index 6d847d593f1a..a977fe7b36b8 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -555,6 +555,12 @@ void msm_kms_shutdown(struct platform_device *pdev);
>>   bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
>> -bool msm_gpu_no_components(void);
>> +bool msm_separate_gpu_kms_components(void);
>> +
>> +int msm_count_mdss(void);
>> +
>> +int msm_count_mdp4(void);
>> +
>> +int msm_count_mdp5(void);
>>   #endif /* __MSM_DRV_H__ */
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/ 
>> msm_mdss.c
>> index 9047e8d9ee89..4c788f2647b0 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -73,6 +73,21 @@ static int msm_mdss_parse_data_bus_icc_path(struct 
>> device *dev,
>>       return 0;
>>   }
>> +static const struct of_device_id mdss_dt_match[];
>> +
>> +int msm_count_mdss(void)
>> +{
>> +    struct device_node *np;
>> +    int count = 0;
>> +
>> +    for_each_matching_node(np, mdss_dt_match) {
>> +        if (of_device_is_available(np))
>> +            count++;
>> +    }
>> +
>> +    return count;
>> +}
>> +
>>   static void msm_mdss_irq(struct irq_desc *desc)
>>   {
>>       struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
>>
>> ---
>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>> change-id: 20260316-separate_gpu_kms-04d2cf4d91e2
>>
>> Best regards,
> Thanks,
> Mahadevan

Thanks,
Mahadevan


