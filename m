Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38953255F2C
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 01:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830107; cv=none; b=IKymBv3iGosP0QLZZeKRvZVN8ysGttlrLrfR4V7wU3WZeiFrE3r6WF3cf5l9Q5poj/cYUq24NkVHYHDld+0nHCUdU2rhH6yd7IUNLI/j1KPav9gWW203kTvIY2wb2xXkiM5cIDBlzVZFufiFQAH1+9FQwCus20HVdO1olg50Ll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830107; c=relaxed/simple;
	bh=Df3c3pZAGbbibAIILTdBqxvWtZ4tbPD8pFTsseGh8OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byF7WXCCMDUhB085yjb3d5wDs6Mxx+LfVmG+LjBsq1JMEnzit1rgT0HG8CzuEgnAnTbr6qSAIiY5v0bx0rc3MQvvaiWNzdThtPGPA/sSx0RKcSxx70DZtZbOt3qOPRFpa0rVzsyUDZH8FqMhTAsGcI3PE+K2Tz3SZAyXlkZoJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFFLl59q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+/14MT8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFFLl59q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+/14MT8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlEbG2132146
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 01:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=; b=gFFLl59qdtXv1PBi
	LuXDnupIYXgbSW/PMEzRAbdnlkMK5xvBNgo0sS2x/4wbARDP3tPtKO3GWT+tOZLZ
	TV0zg52HstfOcskNBd4B8M028h8nbQlyw6dzvHuW9aNQWph5a1gazSPcZpuj758B
	XTiYfWn101zcuYS98c0cQ3atJ5OC4a4et0z5Nz4KXJ/MrDw08Te/8qRCAx7IQrB6
	H1Upz7QIa14Mjwm/hSuilIY9BNc5x4hjCOJTBsnNAko9IC1r/tiN7AouA2wZYJ1l
	uNrH4Mfz1gT9aM+n+JBY40XydlPuNFvZTPNxXpxdLEnfYMtXh5F4HLuAfRqse2g6
	AFauSQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykaeh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:15:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso2869110b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 18:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788830104; x=1789434904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=;
        b=J+/14MT8+p0e+xCLhyQ8jPNrV6IMAxpsYNeCdHfSR7QrY65m0C2G4XdpNv5V4v8hcq
         25esRyzemYip1+hflwf/z4bSyi513R7yOqPYL/wxSZen3xtTb1aHAceLYmT9JI7+pGWf
         Mh3A1PTK+7LN65s/x4ftxusN8uYqo2UKO1xDamxPI8uGPJIDdQHLY7/f3P5fWvVm0gtG
         bgUIlSx0tm4HsbvN2Q7UQj7CHG3HQqIFWRiyxckAR52kLkfMyV4tPkejIW0drrzniOP+
         hUhsnJJra4xB+YsUTvx3XbgOMlMFi2mC6x7NCvulKR/MgI94sgSV/lx4VSnpv8NhVOyY
         WdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830104; x=1789434904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=;
        b=SxJ6MAHCKu+ofQlz7/OFQcbHjq+opnYqYa+v4kP4GqIENNIU05KGPHbQeNB4ryJ/8P
         gioULpttLFNfhhT9dCXQscN3FYpM6xXn0IE04lLcjfuVQVniYNLQlrtWaUFJkAWcaAyf
         2rMZlXxPjcGpwYMCfzqbqNHPZnWl2a/kL/YOQn3VE+Ug0Vn15+GrBN7INAwdHJ3wP4UQ
         NwEYdM2F3Qyqmr21NJoFZLPYtb4TyK3JeHX4MS+yPu+DXNgpSHfet02Gj8ipvQc/noOu
         OH7McApVQdjAVNF3scipAgG13lseGSEXZ4KwTIhBtFb0A4Z6iflYmcFcTZ5/AGe836jR
         XmWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnUcP41ipT4Cz9TfWyvk/LUjjDX9nwBsLBJq/e6E2oyoUwaZB6EVDLiPGddknUBJznTG/vQyYThAvlEntt@vger.kernel.org
X-Gm-Message-State: AFuF++nLxgdh3Rq9KRj14bOEPurTrVU8Bqwnh0LH3wR+f1JZc6sP80HA
	I8xTsBzGNrjQNYxKphWg9RPT2wO09cSwQsGbjF7grMUFmq2osaBeKONyZ1D3uPZjxa8JCkbW5K8
	zkqQKSbu/YxqUZT5xTgZp8+hZGsiJb+hJ4hoVg82+awysJpWWMB1BYOHDD6G6RLf/bONS
X-Gm-Gg: AYBFou1V5jRrZUHZ6BJTBT5dnh1PM1gmWduWOk7pail52RTbY00aUQ5yjarVGtH7qcr
	nj8p/jABwGkHgL0upI+a0xu+ZiF/mXDpMMmEvqD9puCwmAoMcd2rTDGwIH2ArCyH5wliTStjtFZ
	xfZ3ePUcjAQm3eZz7WtwY0gJxulmweZ2OO4itTpwM0fnuK4pG5grr8UicpwtQdto3kyX+FT3mO3
	xJdr0xV5TTQGvPSmVzP8MRRFltb1rnsQStgefX3LhLsHqJ9z9GNZgB+bQGHnoYFbGUyV7PL9nsu
	9i7zpcrcZzvZQLHa04HOSJCEq76SgGqXdV5/DAUmfG2O4SdBSr3z0eTxJOSYG/K3DckNO7DisAj
	/PWwoqN8gqkuo9eJuddpQv7ZTEZu0dRwa08W08NCnJqPRMl8Eo6jyS26qK/lYHGWGPHrd
X-Received: by 2002:a05:6a00:1d06:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-866980de33amr3740623b3a.1.1788830103533;
        Mon, 07 Sep 2026 18:15:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d06:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-866980de33amr3740563b3a.1.1788830102926;
        Mon, 07 Sep 2026 18:15:02 -0700 (PDT)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615204904fsm4838475b3a.19.2026.09.07.18.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 18:15:02 -0700 (PDT)
Message-ID: <ec3caf91-ac62-4d2b-8a70-f369a0c64e62@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:14:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
 <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMCBTYWx0ZWRfX5CTNdENvbadv
 7r+Y8jufhX/JrtzOjhIyESn1tyelHfTUfF445vr0vl/XOq6LLIDQSxZycf50Eg9kTJup5uHlh8j
 SKlV2pVT16V6kg7qXEsRbpXIZKdKSmo=
X-Proofpoint-GUID: 9K0HVmT2VwLIkjEuLHELY2Lo3nqrTO46
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9f6198 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=MF1PGFG3WILMoXgy2akA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 9K0HVmT2VwLIkjEuLHELY2Lo3nqrTO46
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMCBTYWx0ZWRfX0nxoS3CLeli6
 Q6DR/Eg/3RviBr6MbXh5GzFliodgyFOnMjDJ+xQhH6Nu8FnNb6qawomVKAdMx28j7nc63bRBgTi
 bSmzQL0Pt4/eoSYIR9EBIS4JZEzDLRL9cLYZVz152x2stftw11TGOju49pqpvLmYScOzCaoe61u
 bLOgE/bxabWMSwwMrf1L8MZS3VMgpQbK8E9MTNvLYyFYe1LQ6q8jkDM5GNSYZaFs1/6GVhhbHt2
 UJTziItePC3EvlAqkITFJKYjvCkqPbyHsNOSY/UR68DA0GAC7JoXlpHuKIhAhVeVglbfymAsvR0
 0OvN7qC4FqjFWXeyD/YG2fPLkAB1gLudM2++Nwpu4yXSP4W1PNIDxEN9A0frMYDsv3tQ9fseL0V
 qwm3cxV70roShy1jdmRRTlNRdtaBDqtXOOxDTu2su5D+Zfzoj9ptgGevgzSlnIjYVQshDhTM0+E
 kCuDzsU0LNUdcH47VUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080010



On 9/3/2026 7:27 PM, Konrad Dybcio wrote:
> On 7/17/26 6:41 AM, Fenglin Wu wrote:
>> Currently, when the LED is configured as a RGB LED or a multi-color
>> LED device, the same pattern is programmed for all LED channels
>> regardless of the sub-led intensities when triggered by HW pattern.
>> It results that the LED device is always working in a white-balanced
>> mode regardless of the intensity settings.
>>
>> To fix this, scale the pattern data according to the sub-led intensity
>> and program the HW pattern separately for each LPG channel.
>>
>> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
>> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
>> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
> 
> GPT came up with the following fixes/suggestions:
> 
> 1] This one makes sense at a glance:
> 
>     leds: rgb: leds-qcom-lpg: Skip LUT allocation for off colors
>     
>     Multicolor hardware pattern setup programs a separate LUT range for every
>     component. A component with zero calculated brightness is disabled before
>     the pattern is applied, so its all-zero range is never used.
>     
>     Skip allocating it to preserve the shared LUT capacity.
>     
>     Fixes: 2882fa0dc1cf ("leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode")
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 24b1f570f524..e32388a16537 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1219,6 +1219,13 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>                 chan = led->channels[i];
>                 scale = mc->subled_info[i].brightness;
>  
> +               /* An off component neither needs nor uses a LUT range. */
> +               if (!scale) {
> +                       chan->pattern_lo_idx = 0;
> +                       chan->pattern_hi_idx = 0;
> +                       continue;
> +               }
> +

Thanks. I can add this one even though it is not related with function
correctness; it does help save the LUT with a simple check on the
sub-LED brightness. The sub-LED would just be turned off by gating the
current sink so the setting of pulse generator doesn't matter in such case.

>                 for (j = 0; j < pattern.len; j++) {
>                         scaled[j].brightness = DIV_ROUND_CLOSEST(
>                                 (u32)prep_data[j].brightness * scale, LED_FULL);
> 
> 
> 2] This one.. I'm not convinced..
> 
>     leds: rgb: leds-qcom-lpg: Reuse LUT patterns for equal colors
>     
>     Multicolor hardware patterns with equal nonzero component brightnesses
>     produce identical LUT data. Reuse their LUT range instead of allocating
>     and programming duplicate data.
>     
>     Free each shared range once when clearing a pattern or unwinding a failed
>     allocation.
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index e32388a16537..1c4d550c1ed0 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1175,6 +1175,34 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
>  	return 0;
>  }
>  
> +static void lpg_pattern_free(struct lpg_led *led, unsigned int count)
> +{
> +	struct lpg_channel *chan;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < count; i++) {
> +		chan = led->channels[i];
> +		if (chan->pattern_lo_idx == chan->pattern_hi_idx)
> +			continue;
> +
> +		for (j = 0; j < i; j++) {
> +			if (chan->pattern_lo_idx == led->channels[j]->pattern_lo_idx &&
> +			    chan->pattern_hi_idx == led->channels[j]->pattern_hi_idx)
> +				break;
> +		}
> +
> +		if (j == i)
> +			lpg_lut_free(chan->lpg, chan->pattern_lo_idx,
> +				     chan->pattern_hi_idx);
> +	}
> +
> +	for (i = 0; i < count; i++) {
> +		chan = led->channels[i];
> +		chan->pattern_lo_idx = 0;
> +		chan->pattern_hi_idx = 0;
> +	}
> +}
> +
>  static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			      struct led_pattern *led_pattern, u32 len,
>  			      int repeat)
> @@ -1226,6 +1254,17 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			continue;
>  		}
>  
> +		for (j = 0; j < i; j++) {
> +			if (scale == mc->subled_info[j].brightness) {
> +				chan->pattern_lo_idx = led->channels[j]->pattern_lo_idx;
> +				chan->pattern_hi_idx = led->channels[j]->pattern_hi_idx;
> +				break;
> +			}
> +		}
This is based on a wrong assumption that all sub-LEDs are using the same
pattern, so this is not correct.
> +
> +		if (j != i)
> +			continue;
> +
>  		for (j = 0; j < pattern.len; j++) {
>  			scaled[j].brightness = DIV_ROUND_CLOSEST(
>  				(u32)prep_data[j].brightness * scale, LED_FULL);
> @@ -1238,14 +1277,7 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
>  
>  		if (ret < 0) {
> -			/* Free LUT slots already allocated for previous channels */
> -			while (i-- > 0) {
> -				chan = led->channels[i];
> -				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
> -				chan->pattern_lo_idx = 0;
> -				chan->pattern_hi_idx = 0;
> -			}
> -
> +			lpg_pattern_free(led, i);
>  			return ret;
>  		}
>  
> @@ -1271,13 +1303,12 @@ static int lpg_pattern_clear(struct lpg_led *led)
>  
>  	mutex_lock(&lpg->lock);
>  
> +	lpg_pattern_free(led, led->num_channels);
> +
>  	for (i = 0; i < led->num_channels; i++) {
>  		chan = led->channels[i];
> -		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
>  		lpg_sdam_configure_triggers(chan, 0);
>  		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
> -		chan->pattern_lo_idx = 0;
> -		chan->pattern_hi_idx = 0;
>  	}
>  
>  	mutex_unlock(&lpg->lock);

