Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0885E448D11
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388887; cv=none; b=FuL0FJdSC48FTYiq+tGTPtouxDDJPJbqKV2z+Nki4J+i0vmUbYHtuIHA+uchRfTqUjnlQcLssuyN/07QWZ2Sr6E1NBn7u1np80B0HFD7/mOHVMJdjhqy2gc5sZaevr1nu3f29KcHnfQnaXpSnFF/6TZm5hF2kRQNhxWwFv+8ZdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388887; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8oDlk6yTvd85qDJCI62UspWjo7eN8hr7h2EngSiRn+GkJZdqLqQZtfY/7oyAmpqRv7CTMoOA5y0IzxeWgr7AOxiZt3BCrjxxZl0ncA7VbbS7vVzVIXUbMOrGODpvrB1GJfKgjaSaDC0zNyu8OrD95N7TjML+2DIFDTIWuTK2tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDTvICaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgHKShDC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDTvICaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgHKShDC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm5vq3291479
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=UDTvICaLJ+p66lbq
	Fb62PDi5p7UfHd4Mw1RDSvW2nzf8csTMGQHd7EXQ2VOFrDy1s0ZL1FKg90RpP7IB
	5zLK+YeKj+RPhFqrOWuCVjJZzkaXVYCmodgrQlRaCxhMrR7+c4enGMOF2Lhpx5ZG
	w6ZUsevpzCwTMAKXvzMOMoBf/h20LbZ05HlEzuebrtvkycY7qFFR4ZdnZ8ZoxF/A
	uKgr1raYpyYZW+hx//HbSUF20htjHxRqOCcvZXhV1JRg68cA/7PmBXW+xMaCfO2T
	r35wEbGPsbstbFqXkdoxP9RMbgIRGZY5s+BjUhkg+IUnPiSTa7UsmkQnBAhalrno
	3F2PIg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8k20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-74ab6065f97so56393137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388884; x=1789993684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=JgHKShDCQz6lIP2ZgtnH0QkLNJCxSx+ugQ6V3fscXprzEIoGgJBOjlClLT1oWhJKFh
         lp1L78ezKvj+BhMcjT2FTRB2jFoN+6xiIG2ewzEPvcuPRJMCxZ89f5ESmCMQXWBCeeU7
         HIjVEkh1TzhlRcu1psFMwpgOjYPwxdjmMEfhC1b0D1IeXmzqt6MBKV5mQBY5tOY86grq
         Vl51PMjUAGglxAbT7mYx8iKtMJL94+CPxTVqoCo8NLEf6jS/QIhII1jBdeEl8X6Y0HG7
         Wm7zGTGJnTUiKK09hu9Zcu/V0dPVvWsxbdhbJm4XqiPdil5DUwXFkbXjraXpqYhzXkma
         IeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388884; x=1789993684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=IG87CYhphSuJKHD05XnybnM1aw6QzLUzk+JvESyChHZuTUv5djT9JmFUACtVkQ8R0P
         2O1TruruDmmiNbjDgcZzzmm7IklrjwyXr8RAng5e6U8QzQwldjIxj4iD2odiSpPm/amV
         IsMScxf6GYV7/xIM7WUZh7IIWgz7a13Grv4iiayUq4sg1sdVzOX36riuDf0pQtKiWVHk
         1oII0nlKG4LEqFqQJF9RMG9CAW+n89khgoNPmHPBGRChOcDTu3hcdQiymbu1qIQ2GIT9
         GWy5iMgT9+I+cOLlQd/5YmFLJ/Co3eOEWiNzzipXH9Om1xIBOxlk9cBeuHS+qXgLGQ4F
         MGIw==
X-Gm-Message-State: AFuF++mUymH+8+QCkYedJgERzNEuiGGddZc1y64NzG6xGPTnq4USCFgP
	luHwqXN5YoujzWAJ/ZRstvBrQI9Nf3XbMeSGha1CZAuZkduaA/CzopJME4obE9w+J9tjel3nj0R
	CofxHB9Xheq1KLl26qCmrEOdw1qnkuo7sn7RMr9vhkoDuVdhzTSwrQplFYggV4qgusITM
X-Gm-Gg: AYBFou2SnMCGP8jceAnwpnJXSRE/LfqmXHmX3TgBs25FqnVEnIDUWTveG3lDrme+/mi
	Fx3dokqwUtviSad+F4NyM6fe23Rh91fxtgzk4xjK4qNdVZTAuwBmQo278/0YGs2s6HN7eKXvgKl
	8BjKEs1wVVu1FbD2dBWGTWC4417KmISC+SkafgDdM8n0BBvHvNaY+lp8js7nYwhmz9/BKWkNpvM
	Gz6X6UtcteaUzBGTMD866Pe+Zyjf6pSUsIAq1VqvztkiSCAIiwyvFlMhSUCEHtAcuY24pMTGxAG
	BHx3/QlQ3NqbZ8uzWaZt/NUcZgoCAUi5ya/JKgX/uqDBjgazWv1JMV4a5xfls49lDkONZF0IeXD
	db2OWDFFd+oNVEm2ilDfSHg==
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr376358137.0.1789388884074;
        Mon, 14 Sep 2026 05:28:04 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr376316137.0.1789388881960;
        Mon, 14 Sep 2026 05:28:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046c5fcsm2388912e87.52.2026.09.14.05.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:00 -0700 (PDT)
Message-ID: <87b0e681-d497-44af-b052-061ce2afaa3f@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/31] arm64: dts: qcom: qdu1000: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-25-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7e855 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: M1iOmgcVWCKBMt-NpEpaIzDdCtwE2oB7
X-Proofpoint-ORIG-GUID: M1iOmgcVWCKBMt-NpEpaIzDdCtwE2oB7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX+00GAH2WuPy1
 pYlbD3P4p2qPTY63ZRYB4OKZUNeU+NKYkXEL4GF2AtibaEbUF+Hq76DO5sadSW/kE/twc2qetAq
 GhgO9MsLxsv/jxg74W8K1eYILn+UD40SVs5ndUny1FCn/+YHDuhrsmVTaA3X4inBdXVl/6bbnEX
 T6z4WLrYXTX4quV+sKi6/doF+95JliMITOtl4c4ucngwIb59vSEH0yXxkC3d6GinYttL1C53nyF
 7VsObtIRedzhalT2gVqKTTwXLDC8UzNVagwUDfxPG9sKtsSd1QDTtpwYjiMIhYO5gqcijKkySGY
 h8BbFO0Xn9izMy2FAiai4ApS1FZiXxgEdwMism0TJa/zqKnEoc/902mkBV0YOQcJwb5QIbg5Kgc
 4jFf7Qg13ndwocUpdgxyjuvtDGPUIg7A8ggmrd9BWLYv24BIn9ZINKP23Wc5MCKghzu8IQ4xrZE
 6AZIjf5yKsh72hmtfbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX6Kdh3gonh1Jr
 LrNqr86+xWcIVbeAM6FwFnhYD0+sW0MlSMkatQnobU5zv25xsFiiTqgLAckwB7Qh13jvndYUdpd
 ELn/dcg7bD1JVbDCF8Apee4jrdepwXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
