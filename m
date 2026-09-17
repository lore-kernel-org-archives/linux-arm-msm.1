Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD9E4DE71D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646721; cv=none; b=CL0XKKGweVprymtkvWShGOydgHO7MEFefCMjqU+LVqpvsDzb42VVJ6HpIaGl/Hl+G5V/BH/dfEllRB2XCLw8epT2f755cN9QgKm+kcuqqmDi6wrZE41I6WmGP4YajOD6M4Zqsaaw1Rh1WIkhbFOKuewHOBqo1RWc4U6lOc8vQ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646721; c=relaxed/simple;
	bh=SC7XYX10hWebInkiKKp2nmH8rixCWV0tK6vU6OdjXv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGElxOSqOAj5cMeRz9Dx9B1P7B2NMdhERgz98lyuoCybNIaOT/1l93k19rypD1w56+QjhNKWkClCud1FUShDTwMogBwMA7esYL/Jr+f1uDIcsBHtd8ezXkOGgpnVaviQTCgcotTyt6fcIrK0srr2WBUwrLpU6tYzDEYJyzWSrSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NITOPt+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajX0Fno6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NITOPt+v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajX0Fno6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zu6s1390194
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=; b=NITOPt+vi/kcel29
	ZME2jUz8gizGO9Mr5LqfSaccVNmQ/o3x/cwcf05Yq0reFKaVVLIuFEHTCDV58Bps
	4K38QyCNuYs7fb0hHW028Au59HGYeqznB9Z/zaJFb9bVwAwV97px862p0sfuEboi
	8NECFmiRpx/Ugbx0tTf0wYzs0aqF8H3C2yAyP4GRzkoYRhaH1vC5ZbP/axjTdrJR
	ucCUQHfeRmt3cTUbOezxTqItvku0Gm4ECNAdxBgY+rHHuSJuKMKNxpo03OlSFlhs
	zoEauNwJMAdkHZXAEeaGnie9TFyLR3zgywkQqJfr+QDNwM7Zn5JI/LEvwutlEZjX
	FuVHoQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d492r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:05:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd1631d291so11087485ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646713; x=1790251513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=;
        b=ajX0Fno6QBrLL2fkfhmHlhwgZGKlmXl3D9aiartKmZqgYVxiP+kR2tLflw8R7T6KH9
         cjDikIFFign0IIbc5yC7iK6nvZPUavyU2aDHbUgO32YqnjNQj6mL5GlttKk8qOEPzEYu
         VcpbobnPKomvR44pu3IbooLgO9Ta/Fyeyw3insXgfBxgQczAqE3IZsMoZhmm7uoCBNbc
         xnG4LsUlgVt1vdEqnRHnwIu5fylvyNjTXzAvbiJp6Vp9rQGSFFPg6UAxRGkoXFPvj/S2
         WGU+mgKAEuUJu0wrYOBuHb7MegcR5GYfFCrtTyzc16RumBCCkd0SM8q5Mhdsjb9IBh04
         WnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646713; x=1790251513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=;
        b=dpjG9d40n1xK9/m6mC4c/0UXnsIEmw/nvo4CrWDPn+LtndUzGD4KrLcaBy9AAHJiLr
         MUKTAk0g2Rc1vvPg8a4lNZfljQjCKxku4O0XhLrHHnMxtvR2IWfIsmbrlVVqsV6KyCsz
         48PI0y4ZZxRmnFvz6sOW0CSml/X8G53xKHpSZTs+aSVZLkux2JBvR0WI9kIxBfcRMNGy
         0YGnV1Z7dqohqL74b9CbxyRw/vvsmtio0glnaEGd04g2NFNrSVRstApwbyPmOZpXFXoM
         jIahz78T+9iJZh383jsGDqq0jM6gHYABYG3nQIv4EIyqVGH0Qka3DnRZW/oPuSMXql/a
         DcWg==
X-Gm-Message-State: AFuF++mtnnPPmwOB3Z4FiODKZPTU6TFXDltFqnvNChK1ZxqKF6h7gtL7
	BbSiHREZTjHDwclBHJYp0Sqb8K8Z4dthy1b4VwBv1Vh5y/EZFhpL/tkxODP6Op+LnnuM1mkOn0m
	Y3XhM5uosuNGbVgmy/zIOT/ymK+moljmHCjQtUdkTrvA03QkEjUv0TCMpeU9D+zXXv6X1
X-Gm-Gg: AYBFou3hPS74G8esCCSvxdPw2BH4KoTidK4FEnnVm8r3RY2li3vbmHpC9nTnvLWGLgj
	o5bWZpUrzlHGaSb3dUVnkHXySUnb05/ZzvQIlbWGMvrcGMR6eW58HBYz9znB7pJmBdH+3tks3hA
	7QjcMTuDkyb6iOYZe7Q5jQ34bGycrbS9O3eAq9OK9QfI2MqQfmY3y2PElpObR1T8A9HMh0I+qrW
	W4CZhgyLHfmKkgD6z9+DrvnYHfoV71AJe2kDnIAF37WdJZj/Oe6+pCnPYcwR5gbIoRR9gUPULle
	FTLBdbGazngQyDaSfogF2nWRVetYwbyVT5eWeTB35HGZpS14MByqBBM4H1MMA6swEFjMqfE5YWX
	MVmq8zTE7F1PbRFDdxvsZly9UKA==
X-Received: by 2002:a17:902:ec87:b0:2dd:ad74:ac26 with SMTP id d9443c01a7336-2ddad74ad8amr39965ad.24.1789646713028;
        Thu, 17 Sep 2026 05:05:13 -0700 (PDT)
X-Received: by 2002:a17:902:ec87:b0:2dd:ad74:ac26 with SMTP id d9443c01a7336-2ddad74ad8amr39205ad.24.1789646712588;
        Thu, 17 Sep 2026 05:05:12 -0700 (PDT)
Received: from [10.218.25.214] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb5618sm25348115ad.32.2026.09.17.05.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:05:11 -0700 (PDT)
Message-ID: <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mOvYSLW1L7eZ-C1lfzPXCPg_uCeHuNcG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX8PFXKuLfju6h
 wGcbjxWmARmLSXLB7oxaN5kZPhQrxHLRT7a2/aMfo5qb/QRPJN/iUKorRcn1y7zA00/3nNy8ezf
 DX/VrXlypf0spZCCWA8sMf//ftg3wk4=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabd779 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Ck1oJWCqvmENqo9s2LQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mOvYSLW1L7eZ-C1lfzPXCPg_uCeHuNcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX6W0sKKK4iJwi
 DLLRBgW+qjaqYsW1ot6NeL6AYjoNwkAmH/DKwAIuAE2w28yHBTaA7jaUf1+Hs9nTECX4akHnn/o
 LxxPX/N5HIqsAkJfu3u34C0imDE32aIUQV8vZrMrv8GaByX6qZB4s7yRoc9IZ5BlrlAcTaqyP7i
 cv9NG9iobFoEA0l6/i4sashOdeOD352kHd/AAzuKOZGZJ9SIwMOF1m9qiWrNnMvc2QMOs2J9x5j
 DoyVBEXsz5Hj29h3sS88THOG71DdF+JmMkADfJocSBYnNPa1uo3tKIUuBxldD1OAX5iopWUiQm+
 v8XWUB4ywUGrDm8zF1H+Le6Q6MQQKaD6JB/jHtIHvrAMDELl17NYD/Bfiwlzn+SrUO7NTE1eFXZ
 2auXAKqVgPaHqL4A4V8oohTYP+QO1+LvSyHW54iiVGwuwTuP2RwiSn6Fn8cC76nEy4S/xZbRf8B
 KKTB/EnRctKJjbKArmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169



On 9/8/2026 6:32 PM, Konrad Dybcio wrote:
> Also, it looks like the data you provided here is a subset of
> pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
> copy-pasted between these SoCs? Are the extra functions present on 670 also
> present on QCS615?

Hi Konrad,

As you suggested we tried pinctrl-sdm670-lpass-lpi.c on QCS615 and it 
works fine, the alternate functions seem to be similar between sdm670 
and QCS615, we will use the existing pinctrl driver and post the dts and 
machine driver changes for the same.

Thanks and regards,
Karthik S
