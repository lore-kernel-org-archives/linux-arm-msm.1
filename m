Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4A3440A2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328086; cv=none; b=TvcjKVi7B7VsQ0kz7B1CadJLIAWrNSVEGlFefJjcxs0xbj7cwAQ+luPOLmmKiHzzvezuEBufwKv9EfZ70Q7K2QN5Pr1C5b7HRZzw0VKigtmU6edEGzNDkSvx2OLI5OAPRPiJbFFInnVU5lvsGbHCpgb1/x9aRUjzL8vmROuNjAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328086; c=relaxed/simple;
	bh=mvedpIxak0Fnzj/mZY4251qn7YJgCBi9zAfCHtRMKVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URoO6kNXtB2Sl9fNGWJAhoL5oMsYqJsFu0Y43hWmlLjMQSPU3Y4TVCr7YNbBmAEHXztsz/igmsiuA3JSYlFxP4kZ4S/6/GvXmOS1kOVijKBs2sD8VUF0G0iGimiAhx2II8tJznCyjRV+vzBbw7VZ7aUbxcVAE68Z6PtdZtUc1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRTYy2jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFTTUUqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRTYy2jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFTTUUqw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YpKE208828
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=; b=fRTYy2jvZM+gocIf
	Anjg/IjTKq5zbwrdhfH419Jt9409fi3VgGXtPuFwOFCnhHnXB/O2OMFELzUd+LGU
	qidQpL17GbphNSW2n46rTQBteVN+Fd0wWNmJU82LS06qVnGSC4L5nyMtdsYiy4sw
	3hdh0/99kT4e4y2WluAK8vsczO9uDilKk1njvv9dkGBwlVJJUf8PSxf3+3G9hSCG
	6UTveLjrwCTzrMVmTNBU5IPZW9P1X2pytvwd531JXQ5yZrX4WHxDzg/oTiCYUJzc
	jvf0XzQU1Bpc59PbAptplKXqsKbU/OlGF7xlk5j97AWuBSsP2jl/c/SBJwOAv9bP
	4GgaMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898tvud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:21:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342217d8d53so444283eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790328079; x=1790932879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=;
        b=kFTTUUqwjVEY8/XHE+HFNgEeFiMHaDPyLCWpD+4H+4ENCYdtEn8/U2v6HbpaInWW+0
         pkIf4tgRvXUIhT407SBqnfuOnNdFpYjcXVPcY19DVlCJg6sQxB8q1yGN9zWp7XpGbqNg
         bqgEUDm1ZA0iI+iGieC1CUiddSMMuVu+0ZUyCiJTRFuPxCiy753gTplcHT99PG35kdYy
         BoVEllDeDRcwsc7kUFrafucNBYkk0+ht72SFjpBzjXL5sa8waOIaAkxeu2jO3Vonz2Yp
         x7hGH6LTIfyPacrfh4A7NAzi/v16qNictXsqU40hGqqZZkQ8Ns/gvBctYPXcirLk1oz9
         xtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328079; x=1790932879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=;
        b=NxVcB0DZnuuPqFsljq0mfyJNdcxptBa8RdYrUaPygzFCZC7nkDJDc8sRBOwwu6QDhW
         LFl7WqcKiPlPG/Dt4BcCUO+5tq3wS+j1nJct3t3Nm+7lbOFgiQkNTWoSQDXuRGZEvvHL
         4Ni59ljKI9imXvYW05YalHWRhnm60wYOFCBg3xgq1GcpcFLmNuYOoCnzz3CKwqgHLUoG
         J9mYjA8eiJP2VLVvHsRXSkcfa9oqfl19BoWN1/A4TjonBn/ZJmDEpGEtmurBfFKQncvm
         PaJqdXbQHe5dDUC3T88k6kneRgQx66veig9s795JL2zGKGRwZ7Xaf1XbQjtn3+PLXHFo
         kZdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf/qcp7PzD4/GDeD3tkMhyHcI6hX3OhG046S3d8LuoR6RcmDdUizm4/QCbhAfPGwW3PznZCWfk4My+8PSP@vger.kernel.org
X-Gm-Message-State: AFuF++mCrgNKgHr9RypMoDzWdqtx1vk98KohmFwVDrCUF3tWH648X6lI
	xtd5UoAQIxRzhe1n3RsF3FJ+1rqt+mhoi+ZlmoCa3g3srsj7Iica73DcS9zKCQxuFGFXq8CAkn4
	FtDN9mjyVlYCW28p/3Ye0g7iqk9ZdwNG6rX0SjL40yhICSBnml68GEuNBmkOLfGkZOTTs
X-Gm-Gg: AYBFou0+pX9vFQwlZKvJZTuKHcqfBwE9C+Wbh+XS5JBz+KPvIeoIhSU99KF46h0cSHY
	9BFOnHCZVjCeDXyZus+RYjWPB+RRmvyxEy9ipFAzPo/ZFyPx/BsdomUv827IKuli4GDxiCTyNm3
	0ICikcHpTgneRbeG5cHFKBsq9Ah2vF7u2nSblIRuswTeWkRWVaW2UsbR/NoeLHv8+3W3G55fGCS
	TufdRHAyt9ixEfn4SIqsWem51LRu5NbT4EvSZ2fubwJ/0VPkBltP7kHuC1XC71ZvdXXya10q5BB
	OLtQqXWbZUo+Akss5FOqlz4CINATjWI0FClHKNypoHp9xShG6mMtYwfJVqDbYDWOWJzmlVeyn8u
	2yK+dr+3/SV03FWDRscZNVa/3D/rV
X-Received: by 2002:a05:7301:618c:10b0:341:ea04:4102 with SMTP id 5a478bee46e88-341ea0445b5mr810781eec.19.1790328079313;
        Fri, 25 Sep 2026 02:21:19 -0700 (PDT)
X-Received: by 2002:a05:7301:618c:10b0:341:ea04:4102 with SMTP id 5a478bee46e88-341ea0445b5mr810746eec.19.1790328078540;
        Fri, 25 Sep 2026 02:21:18 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757263sm4813814eec.12.2026.09.25.02.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:21:18 -0700 (PDT)
Message-ID: <8ea976cd-b012-4ae6-a74b-b5c2dceaecbc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:51:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfXwUU84xefbExg
 pXkNfiCUM+UjUTSS/Av/OTD5/Du9nlBSlOxa85gagCDovj04v3WFvCZ2gbyiPsXDNGz2k9ZZky2
 ZGgap/lRbIWOiTeCg39SHlRkwLMF8lg+YT7nmba4OtlWqREhnrl/Z6HyH6pflQvbC14qgVmEnuE
 U0LADxhpaD3GGBzeuGovLXzinszhUdRb3z+pS4P39WzfSSv7Q1s7Os6+hg410MchSNCyq6xWF/u
 4YMU8QYDJazDBtf21kkwuQd0zrL/9L6xSqTX7z10jtRtlW8ia8Sz22mMSLgUnIUWWWVikPOeTl2
 82DfEd+ibOvrSa7Liv+HqmkqKDYIHIDxjeXqGUhlWiINr3UylTKD6rQg5u/0i9tCQCTJQvu5r6w
 SZZKoikp/nb1RtQGu7gMVhvUHhfOVnLWLE8ad85C2UmQmEz/TXF306bsVGpOsG+a9W0+ktTy9Gr
 +biierKH/b0ZG+lkUTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfX/rrdy7vX71DJ
 z5H1RE6t07E8cQNLP1zQB6jmKYeu14VYrQiEtLe3rZQpl+3qSS8ibu1duNfuDSN/xHqStrGgN14
 ZA37KR6dbiD9ToO5LYTkS24HnF3Wu0k=
X-Proofpoint-GUID: PMmCIcdSenzgzNOJlYMUy9Ys2QOGpHsW
X-Proofpoint-ORIG-GUID: PMmCIcdSenzgzNOJlYMUy9Ys2QOGpHsW
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab63d10 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ohAgsov0r_a2WbmJIscA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250037



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> The VA decimators can currently capture audio only from DMIC inputs.
> Add support for routing audio from SoundWire microphone (SMIC) inputs
> as well.
> 
> Update the decimator source selection logic to switch between DMIC and
> SMIC sources based on the active input path.
> 
> The ADC_DMIC_SEL bit of CDC_VA_TXn_TX_PATH_CFG0 is shared by the DMIC and
> the SoundWire mic mux, so a mixer write to the mux that is not part of the
> active path can leave it stale. Program it from the resolved mux state
> when the decimator is enabled, so capture does not depend on the order in
> which userspace restores the two controls.
> 
> Add a helper to detect whether a decimator is using a SoundWire microphone
> input. Use this information to skip DMIC-specific HPF programming sequences
> when the decimator is configured for an SMIC source.
> 
> This enables VA decimators to capture audio from either DMIC or SoundWire
> microphone inputs.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

> +		if (!is_amic_enabled(comp, decimator))
> +			snd_soc_component_update_bits(comp, hpf_gate_reg,
> +						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
> +						      CDC_VA_TX_HPF_ZERO_GATE);
>   
>   		usleep_range(1000, 1010);
>   		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
> @@ -1046,7 +1079,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>   				0x0);
>   		}
>  

The commit message says the DMIC-specific HPF programming sequence is 
skipped for SMIC paths. However, this only skips the initial ZERO_GATE 
write; the cutoff programming and the later ZERO_GATE clear still run 
unconditionally.

Is only the ZERO_GATE assertion DMIC-specific, or should the whole HPF
set/program/clear sequence be under the same `!is_amic_enabled() condition?

Thanks
Ajay Kumar Nandam

> -
