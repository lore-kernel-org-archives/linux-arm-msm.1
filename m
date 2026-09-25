Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0164A8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324813; cv=none; b=b3e4Vp+8yeqAVVwL6xVtaPGPNLJRneussDWQD5lGHoYpkQn+Pn7xEk76vlIMBhpu+O4CwyxRO7knQ2MeIh6uP8h4XoRY8gV1cGXkKz3uLv8g8e0iYSOBvzKfLbYYaZ0GN4I+DRBMAxg4HQ+0myEqPWpOLpA7HVFBBvP9XpZzjA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324813; c=relaxed/simple;
	bh=I0xTLJcttysm4OQV77NT0W7BUgmVg/f0JYMpVCJu1DA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNt4oGfVeZM6/cKCqBTgik2rbFHvycvKrjnZI9Tseb1tSYuJNp3kXdK8hPgNiteZIUXIHPmMRCzAOxK6ippmVu/EX/QYvO5DsXDizpm7lAx/RdumxBIeKMOI4lOF2skzyo6iYE3FTr11imlzi2P1xm9SUpdKrVcYD47X4APaSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYjV+kzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CuHGu3Ja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYjV+kzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuHGu3Ja"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YpSd3737053
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79r1uaQBKzJ/Btxl8GmclnlzDLCxFHHZ3ZaiAapFvIg=; b=QYjV+kzXgcrgQOa9
	KvGgQ6r9+TItDH6fy6U76WsSBh4DCSLLC5RizpRJ1w5GMkCWRYyfsQJWMBuyacKe
	d9Pqb+LaynnIeZ7RrLC6eTSA+n/fUlCsXJOvFimE+U1w9Mi38VLbGsGf+xlMHi95
	D0DAkZPbVNxXgipU3Q+0ztfn7+TNR88cxZaC5BttQCXHFHLOZhrYvsIOnDbdodpo
	g36UdIl6uhBGv3qYuyhEbitMADplXyyNXVC/Q3mXuVrA8QyMax5lmxGaxMjH3UH9
	2KU/NzQ23trSgbynsEosuBe5E+CrGtTEApks4ggcvH9hxF8CjwAXQfgXpam4MC1r
	5G34Sg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e3bce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:26:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9143947f839so3177926d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324810; x=1790929610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79r1uaQBKzJ/Btxl8GmclnlzDLCxFHHZ3ZaiAapFvIg=;
        b=CuHGu3JaNvZDJjIKwFrqnmLnVzZ0uu+gonpT8/LSwY8Ymo196dfN0EwGqhfA1npLWs
         MHN51XDL0lH+adp9nZGKkwAbel/xcNZHnu3Mh2YmivVb/RyzsrZi5dDOC8uMefKE6KWB
         zOz7vLOKKv3MXnXcIsyRCF3lcsXFzY1O3OljI+XzbIrFaxH/7b/5G+OI9TKu4jOgvDkm
         DtHOcG/46S2OoAMuMYM0TikH33fRMFMXnhna8cprnuyoLUr42syTITCAYY59j9o7MDUZ
         yynMVBXcrheYNLg0037Aw9ypYWXSTUP9JvHjm8gLLBzCkes++yDBWuAMeeEneJIdDnr8
         FUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324810; x=1790929610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79r1uaQBKzJ/Btxl8GmclnlzDLCxFHHZ3ZaiAapFvIg=;
        b=Svjyj5YudCzwODkizVwhYdjJeX2noIg/tD+LX5beSovM7EDP3t7Saz7x/7To9gGMW2
         tE7JPkMzvjmPojxOr6dQthyM8tO7yso8wMoU4IK2DXOZOsfkFsQpy5pbQ4o+FZxjdL9K
         lBM1TOOMldB9Lcb09Ik/UNV9mdbH+7K0u7eDL7EkybKBeZr1sN56RM4iXg7nuMVkAr6M
         TAEjxv6aOBhVtej5khAFwY6jZM4MuabtYe7rHuy2QO71G5Idgfsvd2JW1P/4/TdAg/m3
         +Pra8bKcMB8fnJAoP7Jg8nVAZH5EP8uQQ1mP1+kboslxl2UmSFCp7UW4A4/EPNnJGXdh
         FvIw==
X-Forwarded-Encrypted: i=1; AKwUvBzgll3rex9iSXXiX0V+Tg2vFiYWwKkrMvRaOfAVXYq+I2wwgZGDCMC0LtzzqfjxUOKix2iY5fgR82tDZ5/A@vger.kernel.org
X-Gm-Message-State: AFuF++mPZLWFpUbTKIYzd/+23q8vPerVc4si/G3XZzftYJhUeK5/dS7l
	zoU+VUlrMhPZScQnZYdLRtS1vr8nGK1yDrbwcneBS50Y/ZqBUH5X8viuAW0FVqr4blGOf5DKgS0
	VPBmDcoD1xt9k4NKar27oRQzZGF1J1yODXiFCj1Rep1yB1+AhW5mzP2Pux+Dkkw9+vSPb
X-Gm-Gg: AYBFou2ukh+0pBWnakC3D0lbDKqTZEDpBS7efegawWBaZf1cFhzuBPD7bPE0IV2Y+yz
	xkDl4aU9Pj1ImscjKgogUM/wp49/X1bEu52gnnNzvFUEQQ5FwQdflwopkPLNKxBepB+Mi3DdoNQ
	5x+EABVBz/f0SrE6Sp8EPHxkMc/4Xp1YRSlahYWRQhNg7uziyVAaoF15XJO/VvFmcv1V4Cvsz1K
	1h86qWduMQC2nSFBpZPi6lKG0c+vEsSOMyiFIaMNyYxXzAZqBAe26sDbDZmO6XyYSgD1siUXGa8
	BiNrJp9sB66+7ku32cYhSpDuh5X0+Ao89MJA78Pr3v5uvOJ/11efm+WFU/eiP3YOX6k2i6UuFgP
	yv78qw0eruoAQqK6h7Q/MNn8c+w==
X-Received: by 2002:a05:620a:d8e:b0:93b:d79b:9a5c with SMTP id af79cd13be357-93c43d2cf3emr301266385a.61.1790324810229;
        Fri, 25 Sep 2026 01:26:50 -0700 (PDT)
X-Received: by 2002:a05:620a:d8e:b0:93b:d79b:9a5c with SMTP id af79cd13be357-93c43d2cf3emr301265485a.61.1790324809763;
        Fri, 25 Sep 2026 01:26:49 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dd786dsm692972a12.17.2026.09.25.01.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:26:48 -0700 (PDT)
Message-ID: <00ebf8ae-784b-4053-b58f-43c1fdd50be6@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] ASoC: qcom: sdm845: Set codec dai and component
 sysclk during startup
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-4-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-4-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX0Pa+x/12zILK
 EzDCtB9af7grqOoGkTAtjrvd3Vygd24l4llS/dDTZIXEx69VdtskqpAs77pIfeRugzQHIRpzyE8
 w2908UMxgKisLFMeig0CJwebkl/9tpPCBXmgIGHGIqV/fNlr/YQOfcpszU+mAfng/s0mmEHVYVA
 i9qt3wsSPxp1J0pSXmnB2n1yG3XL0CWy1BP0Drs9JRL+u8j348ASLPsfPVE0GNPNb2LfzmnFUFM
 DRDjBrOsXVGsSLv6yhIWwQ7PcbKAXvMs98NwFNX01TJb75ypQws3Zlf58d2HZg1hX5HywDkioqp
 IrCt0HbA6LMKpSIoBIat4K37+JvIjm7OqxQES+3yMuKrPTR+3yTikbnMfBIuYaO3bx2nZ9vTTLw
 PmeP12Cr24lnsniwtNa68oKV/JYIW4dG80nuT/3EtnM2JQZejwFXQJBfPCLShOrv5lsbbaW/CMH
 saYeioawRQHhMExp+yA==
X-Proofpoint-GUID: XTobRJP14Kw-i4UzRYN2m_nnFRMg7Wvm
X-Proofpoint-ORIG-GUID: XTobRJP14Kw-i4UzRYN2m_nnFRMg7Wvm
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab6304b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NEDl_gcYw-WbHvIBNB4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX30Lq7a8SZmYN
 jM27ooQvcPVbnY939aeTLAwdLhDqInNjaemmtmUTBL7ouioLay12lLbs7K2xk8FKOSboGrKDVF/
 HryuXD5hf+m7voV1+wIVcgSSOAdjPt0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The cs35l36 codec needs the codec dai and component sysclk to be set
> during TDM startup. Set these for all codec DAIs on the QUATERNARY_TDM
> path, gracefully handling codecs that don't support sysclk by ignoring
> -ENOTSUPP returns.
> 
> Based on work of Joel Selvaraj.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>


It was unusal to see codec needing both dai and component callbacks to
set the sysclk correctly, it could have done with one.. but did not look
into details.. Or may be its me hitting this type for first time.

Otherwise it looks good to me.


Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>


> ---
>  sound/soc/qcom/sdm845.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 59cfa3b26cd4d..f0fbec9c8df25 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -407,16 +407,38 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
>  				ret = snd_soc_dai_set_fmt(
>  						codec_dai, codec_dai_fmt);
>  				if (ret < 0) {
>  					dev_err(rtd->dev,
>  						"Right TDM slot err:%d\n", ret);
>  					return ret;
>  				}
>  			}
> +
> +			/* Set codec sysclk needed by codecs like cs35l36. */
> +			ret = snd_soc_dai_set_sysclk(codec_dai, 0,
> +						     TDM_BCLK_RATE,
> +						     SND_SOC_CLOCK_IN);
> +			if (ret < 0 && ret != -ENOTSUPP) {
> +				dev_err(codec_dai->dev,
> +					"Failed to set codec dai sysclk: %d\n",
> +					ret);
> +				return ret;
> +			}
> +
> +			ret = snd_soc_component_set_sysclk(codec_dai->component,
> +							   0, 0,
> +							   TDM_BCLK_RATE,
> +							   SND_SOC_CLOCK_IN);
> +			if (ret < 0 && ret != -ENOTSUPP) {
> +				dev_err(codec_dai->dev,
> +					"Failed to set codec component sysclk: %d\n",
> +					ret);
> +				return ret;
> +			}
>  		}
>  		break;
>  	case SLIMBUS_0_RX...SLIMBUS_6_TX:
>  		break;
>  
>  	default:
>  		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
>  		break;
> 

