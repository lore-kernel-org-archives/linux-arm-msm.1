Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CA440A0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921289; cv=none; b=p823YHZg3Zbmgbkk94WOhXCuntvEl6145p3DSgTZW7uo8HcXyZNjFF/rL+LpTHKSfQ+RsAczBYnH8npvap/sg7htNWKFXzb/goZziHRxCaGET5QtaX1NncQSZLqp7cEIGbwojRXbrFV4uaGm3zs3yW2N4/Ir1SbY1TCjRkSdCes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921289; c=relaxed/simple;
	bh=UGd/T2FrleTRqGiLpOH+4948HacsLmthJt0JiZmtzv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrxE2VUESE8soHOflGL2PHtPMB6HiqzXvio38PTJAzp0OisowxUMxFY8GCvvOKZq1wO/PpHZtQG1X6u8MAhT/pqAqgARnAolqNpTY+7X8fxj63SO1Cg0DS9811fzY3zSkUwPTH/D4jvJGupDTDvU5I6cO7E1T4sYZqnz8WciaiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9kD4x10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+JrMDpU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9kD4x10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+JrMDpU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCauWK1906450
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ze746DXqJ6GPP7P0a7JhNyqYBqbIzQ3jQpEe1C3z7Dk=; b=L9kD4x10LdJHF2UW
	3E6whvneoGHzEc0R17XPxebUe77aqtruYipDrkFvShFj55ndWMhVdgAcZUGyGP/S
	T5lp0TBsBhkPTaaymeasVHtezoFjnGAj/fYTNrWOYJGdhyCVK9r72jakLecaMIMh
	OHYMqTRNEQRp0xPNf/8yT6/XB3Ri3bQDirbr+zXFc7Y589ggKDoZygz7LiJeu/Jw
	IW54vUwxQymqck0vwQKCr+NOFC5FCKl09Q+e0kUGuy5uwQl6x+Jmj+Q4tGWLj1od
	AHe45YiEOmelQGEfgc/JDFlT5F3cuuAdferXfLMyR3kQ8Hlzy4h0Het9DPwvdaKF
	oiD1/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r10h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:47:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso21147175ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787921279; x=1788526079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ze746DXqJ6GPP7P0a7JhNyqYBqbIzQ3jQpEe1C3z7Dk=;
        b=E+JrMDpUbCELGsvBgYwCm5D5BwWN/o4v0+qNiMVpzr7QgNdTAyER9JJ1K5hHn9zV+5
         C3g/fV7ao/rsVudRTUsYkwbLq4FtPRiWH+7quoJgkiaocvj1o9oywbw0hoV+uRbpFrwZ
         TdfeDLjU6HwJh6vvVPwi3iUKqT9GvvXu+AUU0UldIkn2ALOcMUE4mUfXu+McRDzTzklK
         IS414qobbYZg1eAtk9vGrYTDSgu/14NsU44/eSKhHtwIvnyA+y8bo541tgAcMe3AeTNy
         deOx5xa4CNzgu7DeZrcet9JMiIATrN4ZyxD5wq+cOYMqagbK+xlME0EqJ8obhvGspv5M
         rn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921279; x=1788526079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze746DXqJ6GPP7P0a7JhNyqYBqbIzQ3jQpEe1C3z7Dk=;
        b=Kl/JfbHsLyVmuNaQWRXFi2GvgBcphZCFiG/zy2eAxf3nsB2//RyqWNnCfHlEbT9Vc4
         VOLm05IcUB9KmRDyatLia/HPz8t6hjkBm7B9ctYNT4eNitkSKgN9syVBvMLbgvB7jJzy
         Quku0osTOLYIT5RHMEwlPpAhqVML5oERUo5c4883EUxL6aJmn5CiUGd+9tt5t1HqdBUb
         XV20eSifl03nEcv/T8WSrk/mQYI21VRYixptqClAFjLNEr0pmu77MGpFbOyXUMcHXpsU
         oQu3qP6Vc3AQS424O8Lz8RuseQ19M8s8Z3LcPvcCHVUSsGLrmLQrlIV7xdA4tVEP2m6I
         5zsg==
X-Forwarded-Encrypted: i=1; AHgh+RqHFKMSxwU9N7+44TIi3acCTt6xWMXEhUj9qHypjKuR9LsO3djVuS9U/RLBSxLz6E7Ht5M/U22880LVMUWW@vger.kernel.org
X-Gm-Message-State: AFuF++lPGzmtLJ+521oS93xWll2UU6cuDCS691tjap5lPBIWjoLOHHc7
	o6RljvI3Fz2x1EMLkplA4+fCyaSzIbjp3L0UXwuf6d2Uz7Ir+kjz9xr1Bj+J0X1aQHGT4pklHVv
	U5O9MSXT+IisZJYcXOH0NBPs5Gc2F7sXpvjszBeF8InTZM/DKgVQju/3YKHeqwcbEs0o9
X-Gm-Gg: AR+sD12L0893xu1KJQ55zcumQrRi2IgGDHzuq7TgnToJaQpCXODROGmFm6be0Q8Xy7d
	7cTwYQNPdNhn6z+cV9y7E38xumkkN73/+/WvxcnKuPtlEYEVgC5vHcxNb1XrUJHOR7tabYfZAiv
	Jelv5TvxCO89ZxOea4ouMMDZrmnWyYDMjVFlNBraJazuZZsNTnRyPxlMpOORsXKrpEY9qvSDpQ6
	KbFaq9ddy4lbtQHJzu4ZLs3X2TJMCZI7/Pd7G+5e8+2aCToJsrY7phWA+9ESTsoFo0ce6fNCZqt
	GYwsvz7yOuYvT/kQdXU+1bOPJEyt9XFch7dagikWwCslQ5dVmF2QcULOsP54Xp4lHYCV97iOFVz
	Lhh4HtlHrL5l9G83VnsH0wGBuZnfwxpg=
X-Received: by 2002:a17:903:15cf:b0:2cf:ccc2:6088 with SMTP id d9443c01a7336-2d74dc21be0mr146436395ad.4.1787921278881;
        Fri, 28 Aug 2026 05:47:58 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2cf:ccc2:6088 with SMTP id d9443c01a7336-2d74dc21be0mr146435205ad.4.1787921278424;
        Fri, 28 Aug 2026 05:47:58 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594ff481sm5034905ad.8.2026.08.28.05.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:47:57 -0700 (PDT)
Message-ID: <53a855e1-5d5e-46bf-86e9-d605c57312f8@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 18:17:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] arm64: dts: qcom: Disable Inline Crypto Engine by
 default accross all SoCs
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a91837f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xEcPEQtGZCqhUTYalYwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExMCBTYWx0ZWRfXx3YofU3rY8NY
 RnOxM4N3f73ramA6Seaz8R1W30Kb9JIQ5X1gKTy8YFoR29GKTGobUt9Nbm/pk16oO+vJOrqfVNy
 jnU6fYlO15SuynTOsCuBDCZWNjODfO0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExMCBTYWx0ZWRfX/HYybMANUHrT
 hQbQDshs4Z5t5rAzuB03sIvbbn+r1Mf9GOTso7v0Af7Pb9XBf/zzyOLFIz6S31fxYilA/m8BgQp
 3pAmr9g8l23vW40UPTMRXBVQHbUS0C1uhUicdo7bYJMV1FrRFIROQig06132EnPQ19eEnN+yQsj
 N6ttmUBE/gWcv9LAddSdEyL6Bpo8TeZagvWWupm6B3CjCzsWcm73JbtJ7jFp5pdAVhxUhlU07cY
 1sryy20WDGFSsb5LluDvAShnzU1ET8dOFG47A2hqI0mv+9+QVP7D/SRX4525n6cuRsfe0vAayyq
 CJf6/OobOPubR57lqsx4SkL6JqEvwp1kNPGDQ2YA3kYU5XD64S1hPZZ1iPyRGGA/tlPkU0RpPgS
 u9MMUu1HfRQl1soFA0pZc8NsASyEEIG0TKMA95wE22yoVryyGix6s6SYiWYqzIqGuke6cdp+rLL
 I3TgvyIeudLtLalnPMA==
X-Proofpoint-ORIG-GUID: u6ak06cIVizKy3l1zsF58WWlKprVZgkR
X-Proofpoint-GUID: u6ak06cIVizKy3l1zsF58WWlKprVZgkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280110



On 28-08-2026 18:07, Abel Vesa wrote:
> Since UFS_PHY_GDSC was attached to the Inline Crypto Engine and the driver
> does not currently do runtime PM, the GDSC remains enabled while the
> device is idle, even on boards where there are no consumers.
> 
> I'm working on getting runtime PM enabled in the ICE driver, but the
> node should not be enabled on such boards anyways.
> 
> So disable the Inline Crypto Engine by default in the SoC DTSI and enable
> it only in board DTS files that use it.
> 
> Do this accross the board, for all SoCs that have dedicated ICE DT node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Kindly check discussion happenend before on adding such implementation.

https://lore.kernel.org/all/56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com/

The idea is to enable ice as default and independent of storage media
and enable runtime PM enabled.

-- 
Regards
Kuldeep

