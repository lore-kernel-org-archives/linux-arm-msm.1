Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1163F825A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724358; cv=none; b=TRgvprivgSP7aPPSzDS+Q3rcsrjdtNJbxPDO7PhgXAgoRFItiaIybsOggAShtlH4471Wtl8SZeQ2lBYrJMvvMjRquHe8TGBTtY42ZMOcxW/zyD2ptqLAbmL7QUL9gPlpHyQpiEFp4XOImgd2jmcVMPGbQRNUj8UIWJrAM1OaTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724358; c=relaxed/simple;
	bh=9VZyRGE5AG6+PTN1ZQZs/f/CAnfSiRJXvH/4u5hljWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1cHqg6EpLaHw3HV59/k2iIe1PBIydF69Cw2JwSSpOolUsbLNMeuYEmUc92a1Z9NNtZKep8raUd4Ss/pV9H7oGYRltasi5NB/S9YnNYENJ3JNrZoZjhuqSG+CXjD4PMwvNl9OuUfkUVS38Ie7kkOZpO5AropHVJkwOmNMezlk8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYVGprWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRZwxNt1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYVGprWe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRZwxNt1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I8kUwW132120
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=; b=QYVGprWeihFbqW83
	aCIbanLQI2+Qhgi6/uwAWU5Yz4AJ4UPi5hKNOdN+twvSABG8nHRI7IH9TYa1EgJE
	Q3COLLkTvO2/1Lhl5bCxwqKNlbflhV8A1UKaAqkveV1lX2LxsOos2v+K/2ecS2Bf
	IazAqSrIeaR7z6vcguVMzWIxJlhsGA7Pz9LSUayAEtR6X2AvGP8VtpFyQChwL2H3
	Ssgkb5V6Ep3MT3FVCdGhIjp3YZc2gY5H652uIAD5LU/93rWorCqnwvSOk13aqWFo
	YxSIAYeXqmmvmdzxqvyiSVQ2hxxRLSPKK9EtqQ9kVaBXGpmiA87+KlSsqh7+ppdl
	K+E6Ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs239072q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:39:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso14201585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789724355; x=1790329155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=;
        b=jRZwxNt1FrcAHwDzHQccnn2XfoGeUuir3TIGrLaQyrVvMV73PNfWtJWHytTFxHMAp1
         y8e65BEbOJ6qXpPkavfodMKIC/rsK6HdC/BVNnPvaAgY98zv9h3MZLa+hpwSz3RX9u9c
         UtRH8IfGe/coB5v81jFP7N42O7EMbZKQhMbWbDCpOAN+vYPlPd4K6005MycVXTPdH4VE
         GT4A4y+bzpQou3JKiHyYdU8OCQNp2O/nxyHrKHXnfYk6udf1WKRGtZqS8i1IP7gP77os
         XXps4ikWBuwYcHlg7btG/BDhlnz+2HSEHo3Ps7bvid9U09zjkEwiF1i0JptiIebTLmeE
         miwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724355; x=1790329155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=;
        b=zRkanRiRUHWb5w4xvLVLvu9YOCZRq4/HO9/AKalnOxJ4agZeBSP/+43ogPlx1JtRMO
         uMA4FtoMNoZ3Qm5NbbfffYjYSX6boSvVqWlgtd8SBO5WeO47D3wRPXgOdr9wy3AQoAab
         8yGbFJ3TqIXH8uQNHilfljt1++BMocpE6hGRXLvHKJYx53s2PH6A0dSnTI2XgFtygTN2
         n4+d91xDtmcwT5geMz1/xxzI3jmbMkYYgVH0Hwu8RBEaKyaUzJ8WyGMOvtiCuI0haBum
         RyYIqhsOHFVSMvlbsgamTHb5roe5/S9MvNnyZ5cuaAWQkUDGfkxfC+CXroLO7aYNyDfW
         2Spg==
X-Gm-Message-State: AFuF++mbwI2mbeOD/UC09XkWljnImW76pqWk7olWqEaW+epn1piO6yFk
	iq1Lvkv7ZPVIXI3sTwJvRETfLc0sb6WtjuvRWjM4cRoA4AjCigYlPoP5b/HvhEPyN7vNVDRWfhz
	BXcYkE6/+BEZ0w/fjlJa41KebXLIXHnM49R5J+VKjVzg0vBxRHuHaqKVPYF09lWoWdl6N
X-Gm-Gg: AYBFou0LPQKHTe3vtPLa5br8wM3tFgpHdf2IlsltAImH4OHVtpbuQlm1FzpUopU8joI
	TtbahIfeDq9JumQWP5KfPoDoDAulpz33C1L13iYzf0E0RN+y42L3Mj9pMfvNeErIKf7CrY9exCp
	w98bx5WjFMTS3eRXm1/72I8xbUdS6CYHII4rAzEoQDUjauE6/foJhUqYee4MJrqMwGV+WZqrVtz
	uTvoNZ91/QAgrw6GlnhC1itL9JyEB4UO2APHaol/KiZE6mLurtNByyqwXhTaBjV5vwh+b0beqba
	0wEtDH2/ASAwtCC4ZwKsRuDQACV7BH4u9EAIyBs6d5fVq4qWWdJyC+KSBWjPGVZQGD+lY7iKJEI
	mFlLiNwvnlsqRXuKOZbJBMg==
X-Received: by 2002:a05:620a:bca:b0:93a:14c:329c with SMTP id af79cd13be357-93be04cd56amr164942185a.1.1789724354798;
        Fri, 18 Sep 2026 02:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:93a:14c:329c with SMTP id af79cd13be357-93be04cd56amr164939385a.1.1789724354375;
        Fri, 18 Sep 2026 02:39:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc68ffsm37355666b.57.2026.09.18.02.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:39:13 -0700 (PDT)
Message-ID: <66ed49d3-caf0-4513-9ef5-1f40b6a92ba3@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/48] clk: qcom: gcc-sm8250: Use common clock controller
 probe data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
 <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-29-25a24e50f82a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-29-25a24e50f82a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNCBTYWx0ZWRfX4aeEwVh+VBpX
 dHArQA0hx0/DQtbTzkSyhGj21TUmlo1S25eLY+wHF8qCJooBJVhpAoIYfgOBLA3VrG4OPdvHvGG
 dIl+YnRpawc3DRbtKR8wKTQs/TuYknU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNCBTYWx0ZWRfX+YrS+V0O3KGL
 iUU7ubqQPJNH+5lOAXqmagVumy3acK+4lYnMBzMyPmaKFIRhx9IQN7Uj4AaGBSTLAhJTCOjoX7d
 xxfUFcliadBpR7wMl9cL/ERgs2EXxNLLAvmZlST2Y6xYW4UkJC9blg+AOTCSGizAQIB1uvJX5kk
 pT5dx40HcDfauogtE2yI6Qj2DKQdmMuETsNfE42PetD5134Asx+EA8iOU+cQbGtqsVf0DsPWZoQ
 znomycFKsjXQlbiw+Ybt75AzbfnWoE0C77zgycD3pwn3EyleEFRINgFxEW29BlZq0r0ZXJTm1NU
 hlLSg3vzhmecxcd2QEa3YwT0e0T75UkjfbD2Y+MBTNfvvZQwDuExl9sRoi96EGH/E4JM/QShW8R
 72/PClGy2IMTUWKP81SdeeUjYDmbe8O7CDxk/cmjhObWQg2YBWsx1iECSplkqqKPAfybDrwL4wh
 KzNZ8JEqHe0376GCpiQ==
X-Proofpoint-ORIG-GUID: ItPKkpheEm84EjB3N0Bmj34pwjG-BDcN
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad06c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9t_OtDgf2ifsZ5-kfxQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ItPKkpheEm84EjB3N0Bmj34pwjG-BDcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180134

On 9/16/26 12:28 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array,
> describe the DFS RCGs through qcom_cc_driver_data and move the register
> programming into the clk_regs_configure callback.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +static void gcc_sm8250_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Disable the GPLL0 active input to NPU and GPU
> +	 * via MISC registers.
> +	 */
> +	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
> +	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);

Tell the robot to do another pass, using regmap_set/clear_bits()
where it makes sense

Konrad
